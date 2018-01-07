From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:38:13 +0100
Subject: [Buildroot] [git commit] imx-codec: bump to version 4.2.1,
 enable on AArch64
Message-ID: <20180107144906.34DB2802F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72efe1797ef82af6eee49c82e57e3a32c9386753
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
1. Upgrade EULA to v18
2. Bugfix/Optimization
 - AACPlus: fixed playbe silence after 1s of stream
 - Removed duplicated code in aac_dec/aacplus_dec.
 - Removed unused code in flac_dec.

Note that this package now includes AARCH64 libraries for the upcoming
i.MX8 CPU family.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-codec/Config.in      | 4 ++--
 package/freescale-imx/imx-codec/imx-codec.hash | 2 +-
 package/freescale-imx/imx-codec/imx-codec.mk   | 6 +++++-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/imx-codec/Config.in b/package/freescale-imx/imx-codec/Config.in
index df248b0..0ecb92b 100644
--- a/package/freescale-imx/imx-codec/Config.in
+++ b/package/freescale-imx/imx-codec/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_IMX_CODEC
 	bool "imx-codec"
-	depends on BR2_arm # Only relevant for i.MX
+	depends on BR2_arm || BR2_aarch64 # Only relevant for i.MX
 	depends on BR2_TOOLCHAIN_USES_GLIBC # prebuilt binaries
 	help
 	  Binary codec libraries for the NXP i.MX SoCs.
@@ -9,5 +9,5 @@ config BR2_PACKAGE_IMX_CODEC
 	  an upstream.
 
 comment "imx-codec needs a glibc toolchain"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/freescale-imx/imx-codec/imx-codec.hash b/package/freescale-imx/imx-codec/imx-codec.hash
index 2bb7a24..53d8f71 100644
--- a/package/freescale-imx/imx-codec/imx-codec.hash
+++ b/package/freescale-imx/imx-codec/imx-codec.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256	98fe71cb44f7e858c64c5eda81741ed02f40afaadc3d4ed1e693c7d1e684b81d  imx-codec-4.1.4.bin
+sha256	20d3f9b4187fcd9e7007c94558a00bab1191513eee74b6f0d8c7b43f874e06ed  imx-codec-4.2.1.bin
diff --git a/package/freescale-imx/imx-codec/imx-codec.mk b/package/freescale-imx/imx-codec/imx-codec.mk
index 44be941..ea4d901 100644
--- a/package/freescale-imx/imx-codec/imx-codec.mk
+++ b/package/freescale-imx/imx-codec/imx-codec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_CODEC_VERSION = 4.1.4
+IMX_CODEC_VERSION = 4.2.1
 IMX_CODEC_SITE = $(FREESCALE_IMX_SITE)
 IMX_CODEC_SOURCE = imx-codec-$(IMX_CODEC_VERSION).bin
 IMX_CODEC_INSTALL_STAGING = YES
@@ -13,6 +13,10 @@ IMX_CODEC_LICENSE = NXP Semiconductor Software License Agreement, BSD-3-Clause (
 IMX_CODEC_LICENSE_FILES = EULA COPYING
 IMX_CODEC_REDISTRIBUTE = NO
 
+ifeq ($(BR2_aarch64),y)
+IMX_CODEC_CONF_OPTS += --enable-armv8
+endif
+
 ifeq ($(BR2_ARM_EABIHF),y)
 IMX_CODEC_CONF_OPTS += --enable-fhw
 endif
