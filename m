From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Oct 2017 02:42:49 +0200
Subject: [Buildroot] [PATCH 8/8] selinux-python: new package
In-Reply-To: <20171009222731.15119-8-Adamduskett@outlook.com>
References: <20171009222731.15119-1-Adamduskett@outlook.com>
 <20171009222731.15119-8-Adamduskett@outlook.com>
Message-ID: <8da778d5-9dc6-6be3-8191-b13ae388a01a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-10-17 00:27, Adam Duskett wrote:
> The python utilities that were previously in policycoreutils are now maintained
                                                              ^ and sepolgen

> in a seperate package called selinux-python.  This package includes:
> 
> - audit2allow
> - chcat
> - semanage
> - sepolgen
> - sepolicy
> 
> Currently, only audit2allow and sepolgen are selectable.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
[snip]
> diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
> new file mode 100644
> index 0000000000..1078c4e792
> --- /dev/null
> +++ b/package/selinux-python/Config.in
> @@ -0,0 +1,47 @@
> +menuconfig BR2_PACKAGE_SELINUX_PYTHON
> +	bool "SELinux Python packages"
> +	help
> +	  A set of SELinux tools written in python that help with
> +	  managing a system with SELinux enabled.

 Since nothing will be built unless one of the tools is selected, this should
probably be mentioned in the help text.

> +
> +	  https://github.com/SELinuxProject/selinux/wiki
> +
> +if BR2_PACKAGE_SELINUX_PYTHON
> +
> +comment "packages"
> +
> +config BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW
> +	bool "audit2allow"
> +	depends on BR2_USE_WCHAR # python3, sepolgen
> +	depends on BR2_USE_MMU # python3, sepolgen
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # python3, sepolgen, checkpolicy
> +	depends on !BR2_STATIC_LIBS # python3, sepolgen
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # checkpolicy
> +	depends on !BR2_arc # checkpolicy
> +	select BR2_PACKAGE_SEPOLGEN

 Didn't you just remove sepolgen?

> +	select BR2_PACKAGE_CHECKPOLICY
> +	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON

 This is more appropriate to move up to the BR2_PACKAGE_SELINUX_PYTHON level.
And then the python dependencies as well. The sepolgen comments are actually not
relevant any more since sepolgen is now part of this package.

 You should then also have a global comment for when selinux-python is not
available, and an additional comment for when audit2allow is not available.

 However, let's take a step back here: is it really useful to have separate
options for the different tools? Isn't it easier to just install everything,
excluding audit2allow if checkpolicy is not selected? Or is there a significant
size difference?

> +	help
> +	  Enable audit2allow to be built
> +
> +config BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN
> +	bool "sepolgen"
> +	depends on BR2_USE_WCHAR # python3
> +	depends on BR2_USE_MMU # python3
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # python3
> +	depends on !BR2_STATIC_LIBS # python3
> +	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
> +	help
> +	  This package contains a Python module that forms the core of
> +	  the modern audit2allow (which is a part of the package
> +	  policycoreutils).

 No it's not, it's part of this package...

>  It contains infrastructure for parsing
> +	  SELinux related messages as produced by the audit system.
> +	  It has facilities for generating policy based on required
> +	  access.
> +
> +comment "sepolgen needs a toolchain w/ wchar, threads, dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> +		BR2_STATIC_LIBS
> +
> +endif
> diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
> new file mode 100644
> index 0000000000..42fe575e7b
> --- /dev/null
> +++ b/package/selinux-python/selinux-python.hash
> @@ -0,0 +1,2 @@
> +# https://github.com/SELinuxProject/selinux/wiki/Releases
> +sha256 4217cb965ecda96c91e15ffcc2e7ddd13ecc2bf5631100f3cd072a7616f140ed selinux-python-2.7.tar.gz
> diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
> new file mode 100644
> index 0000000000..2a141be9ab
> --- /dev/null
> +++ b/package/selinux-python/selinux-python.mk
> @@ -0,0 +1,53 @@
> +################################################################################
> +#
> +# selinux-python
> +#
> +################################################################################
> +
> +SELINUX_PYTHON_VERSION = 2.7
> +SELINUX_PYTHON_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
> +SELINUX_PYTHON_LICENSE = GPL-2.0
> +SELINUX_PYTHON_LICENSE_FILES = COPYING
> +
> +SELINUX_PYTHON_MAKE_OPTS += \
> +	$(TARGET_CONFIGURE_OPTS) \
> +	CFLAGS="$(TARGET_CFLAGS)" \
> +	CPPFLAGS="$(TARGET_CPPFLAGS)" \

 These two are already part of TARGET_CONFIGURE_OPTS so they shouldn't be needed.

> +	ARCH="$(BR2_ARCH)" \
> +	LIBDIR="$(STAGING_DIR)/usr/lib"
> +
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +HOST_SELINUX_PYTHON_DEPENDENCIES += host-python3
> +HOST_SELINUX_PYTHON_MAKE_OPTS += \
> +	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"

 There is no host-selinux-python, you only enable a target package here... And
you'd probably need this for the target package, no? Well, probably you don't or
you would have noticed, so possibly this is redundant?

 Hm, actually, there was a host-sepolgen so you should probably have a
host-selinux-python as well.


 Regards,
 Arnout

> +else
> +HOST_SELINUX_PYTHON_DEPENDENCIES += host-python
> +HOST_SELINUX_PYTHON_MAKE_OPTS += \
> +	PYLIBVER="python$(PYTHON_VERSION_MAJOR)"
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW),y)
> +SELINUX_PYTHON_DEPENDENCIES += checkpolicy
> +SELINUX_PYTHON_MAKE_DIRS += audit2allow
> +
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SELINUX_PYTHON_SEPOLGEN),y)
> +SELINUX_PYTHON_MAKE_DIRS += sepolgen/src/sepolgen
> +endif
> +
> +define SELINUX_PYTHON_BUILD_CMDS
> +	$(foreach d,$(SELINUX_PYTHON_MAKE_DIRS),
> +		$(MAKE) -C $(@D)/$(d) $(SELINUX_PYTHON_MAKE_OPTS) \
> +			DESTDIR=$(STAGING_DIR) all
> +	)
> +endef
> +
> +define SELINUX_PYTHON_INSTALL_TARGET_CMDS
> +	$(foreach d,$(SELINUX_PYTHON_MAKE_DIRS),
> +		$(MAKE) -C $(@D)/$(d) $(SELINUX_PYTHON_MAKE_OPTS) \
> +			DESTDIR=$(TARGET_DIR) install
> +	)
> +endef
> +
> +$(eval $(generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
