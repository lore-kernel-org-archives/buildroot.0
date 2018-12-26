From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 17:40:01 +0100
Subject: [Buildroot] [PATCH next v6 10/10] package/pkg-kconfig: handle
 KCONFIG_DEPENDENCIES with per-package directories
In-Reply-To: <a8dd7196-7542-24ee-7ca2-44318d33d626@andin.de>
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-11-thomas.petazzoni@bootlin.com>
 <64e9a50c-97d4-c90a-fac5-eae91cb8ae8e@andin.de>
 <a8dd7196-7542-24ee-7ca2-44318d33d626@andin.de>
Message-ID: <20181226174001.54c5e7d8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 6 Dec 2018 15:07:53 +0100, Andreas Naumann wrote:

> >> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> >> index d6c95b897e..bf43632adc 100644
> >> --- a/package/pkg-kconfig.mk
> >> +++ b/package/pkg-kconfig.mk
> >> @@ -113,6 +113,7 @@ endef
> >> ? # Since the file could be a defconfig file it needs to be expanded to a
> >> ? # full .config first.
> >> ? $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): $$($(2)_KCONFIG_FILE) 
> >> $$($(2)_KCONFIG_FRAGMENT_FILES)
> >> +??? $$(call prepare-per-package-folder,$$($(2)_KCONFIG_DEPENDENCIES))  
> 
> just realized that this doesn't match the function definition in 
> pkg-utils.mk in this series (prepare-per-package-directories), thus is 
> not executed at all. With that fixed ccache is, as part of toolchain, 
> properly prepared and I no longer see the issue below.

This will certainly not fix the U-Boot issue you reported. It will fix
the issue for linux because LINUX_KCONFIG_DEPENDENCIES contains
"toolchain", and toolchain depends on host-ccache.

However, UBOOT_KCONFIG_DEPENDENCIES does not contain toolchain, and
therefore does not depend on host-ccache.

The issue you're seeing already exists today, without per-package
directory support. Try the current master, with a completely clean
build tree. Use the following defconfig:

BR2_arm=y
BR2_CCACHE=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2018.05.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mvebu_mcbin-88f8040"

And run just "make uboot-menuconfig". It will fail due to ccache being
missing. This bug is not related to per-package directory support.

The fix you proposed in your previous e-mail, i.e using HOSTCC_NOCCACHE
looks good, but I believe we need a more generic solution to this
problem, because all other kconfig packages will be affected as well
(except linux, because it has "toolchain" in its
<pkg>_KCONFIG_DEPENDENCIES) variable.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
