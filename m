From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 11:36:46 +0200
Subject: [Buildroot] [PATCH v2] android-tools: new host package
In-Reply-To: <1430496932-17936-1-git-send-email-antoine.tenart@free-electrons.com>
References: <1430496932-17936-1-git-send-email-antoine.tenart@free-electrons.com>
Message-ID: <55449AAE.4090809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Antoine,

On 01/05/15 18:15, Antoine Tenart wrote:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> This host package allows to build the fastboot and adb utilities,
> which can be used to interact with target devices implementing one of
> these protocols.
> 
> The work behind this commit was funded by ECA Group
> <http://www.ecagroup.com>. ECA Group is the copyright owner of the
> contributed code.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Since the patch passes through you, you _have_ to add your Sob to confirm that
you are allowed to push this patch under Buildroot's license.

> ---
> 
> Since v1:
> 	- fixed typos
> 	- added android-tools.hash
> 
>  package/Config.in.host                             |   1 +
>  .../android-tools/0001-android-config-header.patch | 404 +++++++++++++++++++++
>  package/android-tools/Config.in.host               |  24 ++
>  package/android-tools/android-tools.hash           |   3 +
>  package/android-tools/android-tools.mk             |  52 +++
>  5 files changed, 484 insertions(+)
>  create mode 100644 package/android-tools/0001-android-config-header.patch
>  create mode 100644 package/android-tools/Config.in.host
>  create mode 100644 package/android-tools/android-tools.hash
>  create mode 100644 package/android-tools/android-tools.mk
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 94981adb6425..6df627f1752f 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -1,5 +1,6 @@
>  menu "Host utilities"
>  
> +	source "package/android-tools/Config.in.host"
>  	source "package/checkpolicy/Config.in.host"
>  	source "package/cramfs/Config.in.host"
>  	source "package/dfu-util/Config.in.host"
> diff --git a/package/android-tools/0001-android-config-header.patch b/package/android-tools/0001-android-config-header.patch
> new file mode 100644
> index 000000000000..8717061a048c
> --- /dev/null
> +++ b/package/android-tools/0001-android-config-header.patch
> @@ -0,0 +1,404 @@
> +Add the AndroidConfig.h header and tweak the build system
> +
> +The Debian adaptation of android-tools normally relies on a separate
> +package to provide linux-x86/AndroidConfig.h. Since we don't want to
> +add this dependency in Buildroot just for one header file, let's
> +simply integrate it as a patch, and tweak the build system
> +accordingly.

 Wouldn't it be better then to use EXTRA_DOWNLOADS to get it from some
repository, e.g.

http://platform--build.android-source-browsing.googlecode.com/git-history/2988a09f90d53bda1d1b5785b25cc153ba73fb77/core/combo/include/arch/linux-x86/AndroidConfig.h

[snip]
> +--- a/debian/makefiles/adb.mk
> ++++ b/debian/makefiles/adb.mk
> +@@ -40,7 +40,7 @@
> + CPPFLAGS+= -DADB_HOST=1
> + CPPFLAGS+= -I$(SRCDIR)/core/adb
> + CPPFLAGS+= -I$(SRCDIR)/core/include
> +-CPPFLAGS+= -include /usr/include/android/arch/linux-x86/AndroidConfig.h
> ++CPPFLAGS+= -include $(SRCDIR)/AndroidConfig.h

 This would have to stay of course.
 This would have to stay of course.
[snip]
> diff --git a/package/android-tools/Config.in.host b/package/android-tools/Config.in.host
> new file mode 100644
> index 000000000000..7702d1d26266
> --- /dev/null
> +++ b/package/android-tools/Config.in.host
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_HOST_ANDROID_TOOLS
> +       bool "android-tools"
> +       help
> +         This package contains the fastboot and adb utilities, that
> +         can be used to interact with target devices using of these
                                                             one

> +         protocols.
> +
> +if BR2_PACKAGE_HOST_ANDROID_TOOLS
> +
> +config BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT
> +       bool "fastboot"

 If neither is selected, then nothing will be built. So I'd add

	default y if !BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT

so that at least by default _something_ will be built.

 I would even say, get rid of the config options and build both of them, but I
guess you want to avoid a redundant build of host-openssl. Although I must say,
if you anyway have to build host-libselinux and all its dependencies, openssl
isn't going to make the difference.


> +       help
> +         This option will build and install the fastboot utility for
> +         the host, which can be used to reflash target devices
> +         implementing the fastboot protocol.
> +
> +config BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB
> +       bool "adb"
> +       help
> +         This option will build and install the adb utility for the
> +         host, which can be used to interact with target devices
> +         implementing the ADB protocol.
> +
> +endif
> diff --git a/package/android-tools/android-tools.hash b/package/android-tools/android-tools.hash
> new file mode 100644
> index 000000000000..57bbc6f88070
> --- /dev/null
> +++ b/package/android-tools/android-tools.hash
> @@ -0,0 +1,3 @@
> +# From http://snapshot.debian.org/archive/debian/20141125T040054Z/pool/main/a/android-tools/
> +sha512	aadf75d29e2aa223870c942fdd44bbeb9466542e17b81bb93069d4415dd6644b5266465d4e466b1d5ed2a84f86d89450a3aa077f4f81268ac1a3d1e4df74d9ad	android-tools_4.2.2+git20130529.orig.tar.xz
> +sha512	c879d0fed0d53030319813cfadc29d939dec7600210d11c8e398e61c69447971f82e1e5228aeba730a2d95899c1c5d5d2a3b06e9a19a91866b33b5bc068079c6	android-tools_4.2.2+git20130529-5.1.debian.tar.xz
> diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
> new file mode 100644
> index 000000000000..436351853f5a
> --- /dev/null
> +++ b/package/android-tools/android-tools.mk
> @@ -0,0 +1,52 @@
> +################################################################################
> +#
> +# android-tools
> +#
> +################################################################################
> +
> +ANDROID_TOOLS_SITE = http://snapshot.debian.org/archive/debian/20141125T040054Z/pool/main/a/android-tools/
> +ANDROID_TOOLS_VERSION = 4.2.2+git20130529
> +ANDROID_TOOLS_SOURCE = android-tools_$(ANDROID_TOOLS_VERSION).orig.tar.xz
> +HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS = android-tools_$(ANDROID_TOOLS_VERSION)-5.1.debian.tar.xz
> +ANDROID_TOOLS_LICENSE = Apache-2.0
> +ANDROID_TOOLS_LICENSE_FILES = debian/copyright
> +
> +# Extract the Debian tarball inside the sources
> +define HOST_ANDROID_TOOLS_DEBIAN_EXTRACT
> +	$(call suitable-extractor,$(notdir $(HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS))) \
> +		$(DL_DIR)/$(notdir $(HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS)) | \
> +		$(TAR) -C $(@D) $(TAR_OPTIONS) -
> +endef
> +
> +HOST_ANDROID_TOOLS_POST_EXTRACT_HOOKS += HOST_ANDROID_TOOLS_DEBIAN_EXTRACT
> +
> +# Apply the Debian patches before applying the Buildroot patches
> +define HOST_ANDROID_TOOLS_DEBIAN_PATCH
> +	$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*
> +endef
> +
> +HOST_ANDROID_TOOLS_PRE_PATCH_HOOKS += HOST_ANDROID_TOOLS_DEBIAN_PATCH
> +
> +ifeq ($(BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT),y)
> +HOST_ANDROID_TOOLS_TARGETS += fastboot
> +HOST_ANDROID_TOOLS_DEPENDENCIES += host-zlib host-libselinux
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB),y)
> +HOST_ANDROID_TOOLS_TARGETS += adb
> +HOST_ANDROID_TOOLS_DEPENDENCIES += host-zlib host-libselinux host-openssl
> +endif
> +
> +define HOST_ANDROID_TOOLS_BUILD_CMDS
> +	$(foreach t,$(HOST_ANDROID_TOOLS_TARGETS),\
> +		mkdir -p $(@D)/build-$(t) && \
> +		$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) SRCDIR=$(@D) \
> +			-C $(@D)/build-$(t) -f $(@D)/debian/makefiles/$(t).mk$(sep))
> +endef

 I think there should be a comment explaining why each tool has to be built in a
separate directory.


 Regards,
 Arnout

> +
> +define HOST_ANDROID_TOOLS_INSTALL_CMDS
> +	$(foreach t,$(HOST_ANDROID_TOOLS_TARGETS),\
> +		$(INSTALL) -D -m 0755 $(@D)/build-$(t)/$(t) $(HOST_DIR)/usr/bin/$(t)$(sep))
> +endef
> +
> +$(eval $(host-generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
