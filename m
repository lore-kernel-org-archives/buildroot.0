From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 May 2018 00:13:58 +0200
Subject: [Buildroot] [RFC PATCH 1/2] annobin: New package
In-Reply-To: <20180503143147.5301-2-stefan.sorensen@spectralink.com>
References: <20180503143147.5301-1-stefan.sorensen@spectralink.com>
 <20180503143147.5301-2-stefan.sorensen@spectralink.com>
Message-ID: <6d1f56f4-c708-9855-59e4-58df59a296c0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Stefan,


On 03-05-18 16:31, Stefan S?rensen wrote:
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---
>  ...1-Only-issue-warning-for-PIC-PIE-mix.patch | 47 +++++++++++++++++++
>  package/annobin/Config.in                     | 12 +++++
>  package/annobin/annobin.hash                  |  2 +
>  package/annobin/annobin.mk                    | 44 +++++++++++++++++
>  package/gcc/gcc-final/gcc-final.mk            |  3 ++

 It might be useful to split off the integration into the toolchain into a
separate patch. annobin is by itself already usable by explicitly specifying
-fplugin= (e.g. in the build of a custom package), right?

 It's not strictly necessary to do that split though. Just that the integration
with the toolchain may be a little more controversial than the package itself.


>  toolchain/Config.in                           |  2 +
>  .../pkg-toolchain-external.mk                 |  3 ++
>  toolchain/toolchain-wrapper.c                 |  3 ++
>  toolchain/toolchain/toolchain.mk              |  4 ++
>  9 files changed, 120 insertions(+)
>  create mode 100644 package/annobin/0001-Only-issue-warning-for-PIC-PIE-mix.patch
>  create mode 100644 package/annobin/Config.in
>  create mode 100644 package/annobin/annobin.hash
>  create mode 100644 package/annobin/annobin.mk
> 
> diff --git a/package/annobin/0001-Only-issue-warning-for-PIC-PIE-mix.patch b/package/annobin/0001-Only-issue-warning-for-PIC-PIE-mix.patch
> new file mode 100644
> index 0000000000..21d5d8f01f
> --- /dev/null
> +++ b/package/annobin/0001-Only-issue-warning-for-PIC-PIE-mix.patch
> @@ -0,0 +1,47 @@
> +From dcd48f47e73e7d03e42d4de8449edc0b31afb812 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
> +Date: Thu, 3 May 2018 12:21:25 +0200
> +Subject: [PATCH] Only issue warning for PIC/PIE mix
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +A lot of packages build with a mix of -fPIC and -fPIE, so bump this
> +down from a failure to just issuing a warning.

 Is that really the case? I mean, if an executable contains code (directly, not
in a shared library) that has not been compiled with -fPIE/-fpie, then the
executable is not (or may not be) completely position-independent, right?

 TBH, I don't really understand how this position independent executable is used
in the end. Does the kernel's ELF loader perform ASLR while loading it?

[snip]
> diff --git a/package/annobin/Config.in b/package/annobin/Config.in
> new file mode 100644
> index 0000000000..64f1ff6963
> --- /dev/null
> +++ b/package/annobin/Config.in

 Should be Config.in.host.

> @@ -0,0 +1,12 @@
> +config BR2_TOOLCHAIN_ANNOBIN_GCC_PLUGIN

 Please call it BR2_PACKAGE_HOST_ANNOBIN so the package infra is used in full.


> +	bool "annobin"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6

 Can you add a comment explaining why 6 is the minimum, and not 4.5 (first GCC
supporting plugins)?

> +	help
> +	  A plugin for GCC that records extra information in the files
> +	  that it compiles, and a set of scripts that analyze the
> +	  recorded information.  These scripts can determine things
                                                                   ^^like
> +	  ABI clashes in compiled binaries, or the absence of required
> +	  hardening options
> +
> +	  Enabling this will slightly (1-2%) increase the size of
> +	  built binaries.

 Really? Isn't this info stripped off in the strip step?

 Please add an upstream URL. E.g.
https://developers.redhat.com/blog/2018/02/20/annobin-storing-information-binaries/
or https://fedoraproject.org/wiki/Toolchain/Watermark

[snip]
> +ANNOBIN_VERSION = 5.6
> +ANNOBIN_SOURCE = annobin-$(ANNOBIN_VERSION).tar.xz
> +ANNOBIN_SITE = https://nickc.fedorapeople.org
> +
> +# toolchain depends on host-annobin, so shortcircuit the reverse
> +# dependency to avoid a circular dependency
> +ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
> +HOST_ANNOBIN_DEPENDENCIES += toolchain-buildroot
> +else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
> +HOST_ANNOBIN_DEPENDENCIES += toolchain-external
> +endif

 So in a first patch I'd just make it depend on toolchain, and then when
integrating it with the toolchain change it into this dependency.


> +# The plugin has to be configured with the same arcane configure
> +# scripts used by gcc, this prevents regeneration of the scripts.
> +define ANNOBIN_PRE_CONFIGURE_FIXUP
> +	(cd $(@D); touch aclocal.m4 plugin/config.h.in configure */configure \
> +		Makefile.in */Makefile.in)
> +endef
> +
> +HOST_ANNOBIN_PRE_CONFIGURE_HOOKS += ANNOBIN_PRE_CONFIGURE_FIXUP
> +
> +# If using an external toolchain, we cannot install the plugin in the standard

 I guess you mean a pre-installed external toolchain.

> +# location, so provide our own and put the includes from the standard location in
> +# CXX_FLAGS.
> +ANNOBIN_PLUGIN_DIR = $(HOST_DIR)/libexec/annobin

 Variable should be named HOST_ANNOBIN_...

 We can choose any location we like, right? Then I'd use
$(HOST_DIR)/lib/gcc/plugin/annobin.

> +ANNOBIN_CXXFLAGS = $(HOST_CXXFLAGS) -I$(shell $(TARGET_CC) --print-file-name=plugin)/include
> +
> +# The host and target options are mixed up, so override the defaults
> +HOST_ANNOBIN_CONF_OPTS = \
> +	--build=$(GNU_HOST_NAME) \
> +	--host=$(GNU_TARGET_NAME) \
> +	--with-gcc-plugin-dir=$(ANNOBIN_PLUGIN_DIR) \
> +	CXXFLAGS="$(ANNOBIN_CXXFLAGS)"
> +
> +ANNOBIN_GCC_PLUGIN=$(ANNOBIN_PLUGIN_DIR)/annobin.so

 Also here HOST_ANNOBIN_...

> +HARDENED_SH=$(HOST_DIR)/bin/hardened.sh

 And here HOST_ANNOBIN_HARDENED_SH. Doesn't check-package warn about this?

 Though personally I don't think something like this needs to be put in a
variable - other people have a different opinion however.

> +
> +$(eval $(host-autotools-package))
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index 9897d18682..9e739bccf6 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -116,6 +116,9 @@ endef
>  HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_CREATE_CC_SYMLINKS
>  
>  HOST_GCC_FINAL_TOOLCHAIN_WRAPPER_ARGS += $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS)
> +ifeq ($(BR2_TOOLCHAIN_ANNOBIN_GCC_PLUGIN),y)
> +HOST_GCC_FINAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ANNOBIN_GCC_PLUGIN='"$(ANNOBIN_GCC_PLUGIN)"'

 Is there a reason to repeat this in gcc-final.mk and pkg-toolchain-external.mk,
rather than specifying it once in toolchain/toolchain-wrapper.mk (like most of
the wrapper options)?

> +endif
>  HOST_GCC_FINAL_POST_BUILD_HOOKS += TOOLCHAIN_WRAPPER_BUILD
>  HOST_GCC_FINAL_POST_INSTALL_HOOKS += TOOLCHAIN_WRAPPER_INSTALL
>  # Note: this must be done after CREATE_CC_SYMLINKS, otherwise the
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 121ddb4fa4..dc3f1d8cc6 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -533,4 +533,6 @@ config BR2_TOOLCHAIN_HAS_LIBQUADMATH
>  	bool
>  	default y if BR2_i386 || BR2_x86_64
>  
> +source "package/annobin/Config.in"

 I would make it a full-fledged host package, not a toolchain option. So include
it from package/Config.in.host.

 Regards,
 Arnout

> +
>  endmenu
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 8b2c283654..457c23ddf6 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -241,6 +241,9 @@ TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += \
>  	-DBR_CROSS_PATH_REL='"$(TOOLCHAIN_EXTERNAL_BIN:$(HOST_DIR)/%=%)"'
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_ANNOBIN_GCC_PLUGIN),y)
> +TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ANNOBIN_GCC_PLUGIN='"$(ANNOBIN_GCC_PLUGIN)"'
> +endif
>  
>  #
>  # The following functions creates the symbolic links needed to get the
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index c5eb813dd0..d45c9d4f59 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -94,6 +94,9 @@ static char *predef_args[] = {
>  #if defined(BR_MIPS_TARGET_BIG_ENDIAN) || defined(BR_ARC_TARGET_BIG_ENDIAN)
>  	"-EB",
>  #endif
> +#ifdef BR_ANNOBIN_GCC_PLUGIN
> +        "-fplugin=" BR_ANNOBIN_GCC_PLUGIN,
> +#endif
>  #ifdef BR_ADDITIONAL_CFLAGS
>  	BR_ADDITIONAL_CFLAGS
>  #endif
> diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
> index 91c9ca2eff..2b7ef05703 100644
> --- a/toolchain/toolchain/toolchain.mk
> +++ b/toolchain/toolchain/toolchain.mk
> @@ -10,6 +10,10 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
>  TOOLCHAIN_DEPENDENCIES += toolchain-external
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_ANNOBIN_GCC_PLUGIN),y)
> +TOOLCHAIN_DEPENDENCIES += host-annobin
> +endif
> +
>  TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
>  
>  # Apply a hack that Rick Felker suggested[1] to avoid conflicts between libc
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
