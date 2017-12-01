From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  1 Dec 2017 13:40:20 +0100
Subject: [Buildroot] [PATCH v2 branch/next] uboot-tools: fix dtc invocation
Message-ID: <20171201124020.4475-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Since uboot 2017.09 path to dtc will be configured via Kconfig. As BR
skips this step for uboot-tools building one has to provide
CONFIG_MKIMAGE_DTC_PATH=dtc on the build command line. Otherwise
mkimage will not be able to create FIT images, i.e.:

mkimage -f kernel-fit.its kernel-fit.itb

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - pass CONFIG_MKIMAGE_DTC_PATH=dtc on the build command line
    instead of patching the Makefile (suggested by Thomas Petazzoni)

 package/uboot-tools/uboot-tools.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 04b526883f..4c559185af 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -22,7 +22,7 @@ UBOOT_TOOLS_MAKE_OPTS = CROSS_COMPILE="$(TARGET_CROSS)" \
 	STRIP=$(TARGET_STRIP)
 
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),y)
-UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y
+UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y CONFIG_MKIMAGE_DTC_PATH=dtc
 UBOOT_TOOLS_DEPENDENCIES += dtc
 endif
 
@@ -85,7 +85,7 @@ HOST_UBOOT_TOOLS_MAKE_OPTS = HOSTCC="$(HOSTCC)" \
 	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),y)
-HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y
+HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y CONFIG_MKIMAGE_DTC_PATH=dtc
 HOST_UBOOT_TOOLS_DEPENDENCIES += host-dtc
 endif
 
-- 
2.11.0
