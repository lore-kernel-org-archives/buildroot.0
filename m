From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 10:43:02 +0100
Subject: [Buildroot] [git commit] configs/armadeus_apf27: fix U-Boot
 configuration
Message-ID: <20181123094044.3AB767FB0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8aaee72a7f1db5de8839eb3a5499046a38a4fac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The U-Boot part of the defconfig was not specifying explicitly any
U-Boot version. Since commit 21e3ae8a18bb77943c0a2492ab9ebf14cab333f9
("boot/uboot: default to kconfig buildsystem for latest version"), we
default to using the kconfig build system when the default U-Boot
version is used. Following this change, the apf27 defconfig therefore
started using kconfig, for which the BR2_TARGET_UBOOT_BOARDNAME
Config.in option is not used. Due to this, the build fails with:

boot/uboot/uboot.mk:411: *** No board defconfig name specified, check your BR2_TARGET_UBOOT_BOARD_DEFCONFIG setting.  Stop.

Indeed, when Kconfig is used, the board defconfig must be specified
with BR2_TARGET_UBOOT_BOARD_DEFCONFIG.

As part of fixing this, we also set a fixed U-Boot version for this
defconfig, like we do in all other defconfigs.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/123771003

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/armadeus_apf27_defconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configs/armadeus_apf27_defconfig b/configs/armadeus_apf27_defconfig
index 6f78b74d3a..457a14b02d 100644
--- a/configs/armadeus_apf27_defconfig
+++ b/configs/armadeus_apf27_defconfig
@@ -28,4 +28,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx27-apf27dev"
 
 # U-boot
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="apf27"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.09"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="apf27"
