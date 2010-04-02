From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Apr 2010 15:13:46 +0200
Subject: [Buildroot] [git commit master] u-boot: add 2010.03,
	adapt target mkimage step to work with 2010.03
Message-ID: <20100402131535.241F18B48A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=deb5f91336e13eb93533502111c5cdc807d81bf4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/u-boot/Config.in   |    7 ++++++-
 target/u-boot/Makefile.in |    2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/target/u-boot/Config.in b/target/u-boot/Config.in
index 2689f69..f84d181 100644
--- a/target/u-boot/Config.in
+++ b/target/u-boot/Config.in
@@ -13,12 +13,16 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2009_11
+	default BR2_TARGET_UBOOT_2010_03
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2010_03
+	bool "u-boot-2010.03"
+
 config BR2_TARGET_UBOOT_2009_11
 	bool "u-boot-2009.11"
+	depends on BR2_DEPRECATED || BR2_RECENT
 
 config BR2_TARGET_UBOOT_2009_08
 	bool "u-boot-2009.08"
@@ -48,6 +52,7 @@ endchoice
 
 config BR2_UBOOT_VERSION
 	string
+	default "2010.03"	if BR2_TARGET_UBOOT_2010_03
 	default "2009.11"	if BR2_TARGET_UBOOT_2009_11
 	default "2009.08"	if BR2_TARGET_UBOOT_2009_08
 	default "2009.06"	if BR2_TARGET_UBOOT_2009_06
diff --git a/target/u-boot/Makefile.in b/target/u-boot/Makefile.in
index 5efbd54..d1bb5e5 100644
--- a/target/u-boot/Makefile.in
+++ b/target/u-boot/Makefile.in
@@ -177,7 +177,7 @@ $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/$(U_BOOT_BIN)
 		-DUSE_HOSTCC -o $@ \
 		$(U_BOOT_DIR)/common/image.c \
 		$(wildcard $(addprefix $(U_BOOT_DIR)/tools/,default_image.c \
-			fit_image.c kwbimage.c mkimage.c)) \
+			fit_image.c imximage.c kwbimage.c mkimage.c)) \
 		$(addprefix $(U_BOOT_DIR)/lib_generic/,crc32.c md5.c sha1.c) \
 		$(U_BOOT_DIR)/tools/os_support.c \
 		$(U_BOOT_DIR)/libfdt/fdt*.c
-- 
1.6.3.3
