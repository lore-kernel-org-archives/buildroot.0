From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 00:00:38 +0100
Subject: [Buildroot] [PATCH v3] android-tools: add new package
In-Reply-To: <1442163190-30820-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1442163190-30820-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20151105000038.0543b798@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary,

Thanks for following-up on this, and sorry for the slow response. I
have a few comments, and one build issue.

On Sun, 13 Sep 2015 18:53:10 +0200, Gary Bisson wrote:

> diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
> new file mode 100644
> index 0000000..a8048bd
> --- /dev/null
> +++ b/package/android-tools/Config.in
> @@ -0,0 +1,39 @@
> +config BR2_PACKAGE_ANDROID_TOOLS
> +       bool "android-tools"
> +       help
> +         This package contains the fastboot and adb utilities, that
> +         can be used to interact with target devices using of these
> +         protocols.
> +
> +if BR2_PACKAGE_ANDROID_TOOLS
> +
> +config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
> +       bool "fastboot"
> +       select BR2_PACKAGE_LIBSELINUX
> +       select BR2_PACKAGE_ZLIB
> +       help
> +         This option will build and install the fastboot utility for
> +         the target, which can be used to reflash other target devices
> +         implementing the fastboot protocol.
> +
> +config BR2_PACKAGE_ANDROID_TOOLS_ADB
> +       bool "adb"
> +       select BR2_PACKAGE_OPENSSL
> +       select BR2_PACKAGE_ZLIB
> +       help
> +         This option will build and install the adb utility for the
> +         target, which can be used to interact with other target devices
> +         implementing the ADB protocol.
> +
> +config BR2_PACKAGE_ANDROID_TOOLS_ADBD
> +       bool "adbd"
> +       default y if !BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
> +       default y if !BR2_PACKAGE_ANDROID_TOOLS_ADB

I would prefer to see the top-level option do:

	select BR2_PACKAGE_ANDROID_TOOLS_ADBD if \
		!BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT && !BR2_PACKAGE_ANDROID_TOOLS_ADB

so that we ensure that at least one of the three sub-options is enabled.

> diff --git a/package/android-tools/Config.in.host b/package/android-tools/Config.in.host
> new file mode 100644
> index 0000000..4f16e9c
> --- /dev/null
> +++ b/package/android-tools/Config.in.host
> @@ -0,0 +1,25 @@
> +config BR2_PACKAGE_HOST_ANDROID_TOOLS
> +       bool "android-tools"

Same here.

> diff --git a/package/android-tools/android-tools.hash b/package/android-tools/android-tools.hash
> new file mode 100644
> index 0000000..5d8ae59
> --- /dev/null
> +++ b/package/android-tools/android-tools.hash
> @@ -0,0 +1,3 @@
> +# locally computed
> +sha512	c5bfd3c8e514809db257ba5559c865742768b7520b38aa2f53185aff5c328e5cf7fb328a6ff6450eeddd5056985f232d492eba63a87978440e2147e26d62f458  android-tools_4.2.2+git20130218.orig.tar.xz
> +sha512	aa3fee593cecf5d9a5fbc60b18d67dadc5b832fdea75a098ec7371b8f774673af3a3b6052d7eecaf315943beaa984a1f5a3c114a698620275af1682bd05d4d23  android-tools_4.2.2+git20130218-3ubuntu41.debian.tar.gz

Right now, for locally computed hashes, we generally use sha256.

> diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
> new file mode 100644
> index 0000000..25817d5
> --- /dev/null
> +++ b/package/android-tools/android-tools.mk
> @@ -0,0 +1,85 @@
> +################################################################################
> +#
> +# android-tools
> +#
> +################################################################################
> +
> +ANDROID_TOOLS_SITE = https://launchpad.net/ubuntu/+archive/primary/+files/

The / at the end should be removed.

> +ANDROID_TOOLS_VERSION = 4.2.2+git20130218
> +ANDROID_TOOLS_SOURCE = android-tools_$(ANDROID_TOOLS_VERSION).orig.tar.xz
> +ANDROID_TOOLS_EXTRA_DOWNLOADS = android-tools_$(ANDROID_TOOLS_VERSION)-3ubuntu41.debian.tar.gz
> +HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS = $(ANDROID_TOOLS_EXTRA_DOWNLOADS)

Not a problem of your patch, but I believe it is silly that we have to
specify the <pkg>_EXTRA_DOWNLOADS explicitly for both target and host.
The host value should be inherited from the target one, like we do for
_SITE, _SOURCE, _VERSION and so on. However, this can be done later, so
your patch is acceptable as is from this point of view.

> +ANDROID_TOOLS_LICENSE = Apache-2.0
> +ANDROID_TOOLS_LICENSE_FILES = debian/copyright
> +xx
> +# Extract the Debian tarball inside the sources
> +define ANDROID_TOOLS_DEBIAN_EXTRACT
> +	$(call suitable-extractor,$(notdir $(ANDROID_TOOLS_EXTRA_DOWNLOADS))) \
> +		$(DL_DIR)/$(notdir $(ANDROID_TOOLS_EXTRA_DOWNLOADS)) | \
> +		$(TAR) -C $(@D) $(TAR_OPTIONS) -
> +endef
> +
> +HOST_ANDROID_TOOLS_POST_EXTRACT_HOOKS += ANDROID_TOOLS_DEBIAN_EXTRACT
> +ANDROID_TOOLS_POST_EXTRACT_HOOKS += ANDROID_TOOLS_DEBIAN_EXTRACT

Same for extract hooks.

> +
> +# Apply the Debian patches before applying the Buildroot patches
> +define ANDROID_TOOLS_DEBIAN_PATCH
> +	$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*
> +endef
> +
> +HOST_ANDROID_TOOLS_PRE_PATCH_HOOKS += ANDROID_TOOLS_DEBIAN_PATCH
> +ANDROID_TOOLS_PRE_PATCH_HOOKS += ANDROID_TOOLS_DEBIAN_PATCH

And patch hooks. Theoretically, the download, extract and patch steps
should always be exactly the same between the target variant and the
host variant of a given package.

However, the biggest issue I got with this package is that the target
variant doesn't build. I.e:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.08-647-gc356fb2.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_ANDROID_TOOLS=y
BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT=y
BR2_PACKAGE_ANDROID_TOOLS_ADB=y
BR2_PACKAGE_ANDROID_TOOLS_ADBD=y
# BR2_TARGET_ROOTFS_TAR is not set

doesn't build, due to __b64_pton not being defined. The Debian patches
introduce the use of this function,  but it only provides an
implementation for b64_pton(). However, what puzzles me is that the C
library also implements b64_pton(). Changing the Debian patch to use
b64_pton() instead of __b64_pton() fixes the build, but I'm not sure
it's the correct solution.

Could you have a look into this (and the other minor comments), and
post an updated version of the patch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
