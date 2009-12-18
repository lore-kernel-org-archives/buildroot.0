From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 Dec 2009 09:33:45 +0100
Subject: [Buildroot] [git commit master] target/u-boot: add 2009.11 and
	update target mkimage so it builds with 2009.11
Message-ID: <20091218083553.0FED977709@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cc9fb53408964b278d01ec9678f239c9ae28970d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In 2009.11, a number of extra files are needed to build mkimage. Adjust
the makefile to add those if available, so it builds with both 2009.11
and older releases.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                   |    2 +-
 target/u-boot/Config.in   |    9 +++++++--
 target/u-boot/Makefile.in |    5 ++++-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index b2f21da..01b25aa 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,7 @@
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox,
 	directfb, gst-plugins-bad, hal, iw, libfuse, libpcap, lighttpd,
-	mesa, mpg123, mtd-utils, pcre, qt, sshfs, tremor, usbutils
+	mesa, mpg123, mtd-utils, pcre, qt, sshfs, tremor, u-boot, usbutils
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/target/u-boot/Config.in b/target/u-boot/Config.in
index 12a5543..2689f69 100644
--- a/target/u-boot/Config.in
+++ b/target/u-boot/Config.in
@@ -13,16 +13,20 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2009_08
+	default BR2_TARGET_UBOOT_2009_11
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2009_11
+	bool "u-boot-2009.11"
+
 config BR2_TARGET_UBOOT_2009_08
 	bool "u-boot-2009.08"
+	depends on BR2_DEPRECATED || BR2_RECENT
 
 config BR2_TARGET_UBOOT_2009_06
 	bool "u-boot-2009.06"
-	depends on BR2_DEPRECATED || BR2_RECENT
+	depends on BR2_DEPRECATED
 
 config BR2_TARGET_UBOOT_2009_03
 	bool "u-boot-2009.03"
@@ -44,6 +48,7 @@ endchoice
 
 config BR2_UBOOT_VERSION
 	string
+	default "2009.11"	if BR2_TARGET_UBOOT_2009_11
 	default "2009.08"	if BR2_TARGET_UBOOT_2009_08
 	default "2009.06"	if BR2_TARGET_UBOOT_2009_06
 	default "2009.03"	if BR2_TARGET_UBOOT_2009_03
diff --git a/target/u-boot/Makefile.in b/target/u-boot/Makefile.in
index dd45b42..5efbd54 100644
--- a/target/u-boot/Makefile.in
+++ b/target/u-boot/Makefile.in
@@ -175,8 +175,11 @@ $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/$(U_BOOT_BIN)
 	mkdir -p $(@D)
 	$(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(U_BOOT_DIR)/tools \
 		-DUSE_HOSTCC -o $@ \
-		$(U_BOOT_DIR)/tools/mkimage.c $(U_BOOT_DIR)/common/image.c \
+		$(U_BOOT_DIR)/common/image.c \
+		$(wildcard $(addprefix $(U_BOOT_DIR)/tools/,default_image.c \
+			fit_image.c kwbimage.c mkimage.c)) \
 		$(addprefix $(U_BOOT_DIR)/lib_generic/,crc32.c md5.c sha1.c) \
+		$(U_BOOT_DIR)/tools/os_support.c \
 		$(U_BOOT_DIR)/libfdt/fdt*.c
 
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
-- 
1.6.3.3
