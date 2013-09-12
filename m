From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 12 Sep 2013 18:41:43 -0500
Subject: [Buildroot] [PATCH 1/1] uboot: add support for a uEnv.txt file
Message-ID: <1379029303-17804-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some boards in u-boot support the ability to modify the environment
by placing a plain text file as uEnv.txt in the root of the partition
of an SD card. For the extact placement of where the uEnv.txt should
be, consult your u-boot environment. Your board supports this
overwriting of environment variables if "loadbootenv" and
"importbootenv" are defined in the board's environment.

Add support for specifying a plain text file under
Bootloaders > U-Boot > uEnv.txt that will be copied to the the
BINARIES_DIR as uEnv.txt.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 boot/uboot/Config.in |   11 +++++++++++
 boot/uboot/uboot.mk  |    8 ++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 1b98339..d9d788c 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -241,4 +241,15 @@ config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
 
 endif # BR2_TARGET_UBOOT_ENVIMAGE
 
+config BR2_TARGET_UBOOT_ENV_TXT_FILE
+	string "uEnv.txt file"
+	help
+	  If your board supports the ability to modify the environment
+	  with a plain text file named uEnv.txt, specify a plain text
+	  file that will be copied to the BINARIES_DIR as uEnv.txt.
+	  Information about the format for this text file can be found
+	  on TI's wiki under
+	  "Setting U-Boot environment using uEnv.txt":
+	  http://processors.wiki.ti.com/index.php/AM335x_U-Boot_User's_Guide
+
 endif # BR2_TARGET_UBOOT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 631da6b..68c055b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -150,6 +150,14 @@ endif
 UBOOT_DEPENDENCIES += host-uboot-tools
 endif
 
+UBOOT_ENV_TXT_FILE=$(call qstrip,$(BR2_TARGET_UBOOT_ENV_TXT_FILE))
+ifneq ($(UBOOT_ENV_TXT_FILE),)
+define UBOOT_INSTALL_UENV_TXT_FILE
+	cp -dpf $(UBOOT_ENV_TXT_FILE) $(BINARIES_DIR)/uEnv.txt
+endef
+UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_UENV_TXT_FILE
+endif
+
 $(eval $(generic-package))
 
 ifeq ($(BR2_TARGET_UBOOT),y)
-- 
1.7.1
