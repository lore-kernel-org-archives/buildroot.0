From: Michael Trimarchi <michael@amarulasolutions.com>
Date: Fri,  7 Apr 2017 12:03:22 +0200
Subject: [Buildroot] [PATCH 1/2] uboot: qstrip
	BR2_TARGET_UBOOT_CUSTOM_DTS_PATH
Message-ID: <20170407100323.6871-1-michael@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need to avoid failing of copy of custom dts using
cp -f <> command. Just strip in the beginning as done
for other configuration variable

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 boot/uboot/uboot.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 1d464d967..f0f39f3bd 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -6,6 +6,7 @@
 
 UBOOT_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
 UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
+UBOOT_CUSTOM_DTS_PATH=$(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH))
 
 UBOOT_LICENSE = GPL-2.0+
 UBOOT_LICENSE_FILES = Licenses/gpl-2.0.txt
@@ -195,8 +196,8 @@ endef
 endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
 
 define UBOOT_BUILD_CMDS
-	$(if $(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH),
-		cp -f $(call qstrip,$(BR2_TARGET_UBOOT_CUSTOM_DTS_PATH)) $(@D)/arch/$(UBOOT_ARCH)/dts/
+	$(if $(UBOOT_CUSTOM_DTS_PATH),
+		cp -f $(UBOOT_CUSTOM_DTS_PATH) $(@D)/arch/$(UBOOT_ARCH)/dts/
 	)
 	$(TARGET_CONFIGURE_OPTS) 	\
 		$(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS) 		\
-- 
2.11.0
