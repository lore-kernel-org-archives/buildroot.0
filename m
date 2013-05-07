From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  7 May 2013 09:07:46 +0200
Subject: [Buildroot] [PATCH 1/2] uboot: add custom version option
Message-ID: <1367910467-21515-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add custom version option as used in the linux kernel and barebox.
This way we can easily specify newer and older version.
Remove the list of the older versions because is obsoleted
by the new custom version option that is more flexible.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 boot/uboot/Config.in | 35 +++++++++++------------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 2e95f76..a1874a1 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -14,29 +14,16 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2013_04
 	help
 	  Select the specific U-Boot version you want to use
 
-config BR2_TARGET_UBOOT_2013_04
+config BR2_TARGET_UBOOT_LATEST_VERSION
 	bool "2013.04"
 
-config BR2_TARGET_UBOOT_2013_01
-	bool "2013.01.01"
-
-config BR2_TARGET_UBOOT_2012_10
-	bool "2012.10"
-
-config BR2_TARGET_UBOOT_2012_07
-	bool "2012.07"
-
-config BR2_TARGET_UBOOT_2012_04
-	bool "2012.04.01"
-	depends on BR2_DEPRECATED
-
-config BR2_TARGET_UBOOT_2011_12
-	bool "2011.12"
-	depends on BR2_DEPRECATED
+config BR2_TARGET_UBOOT_CUSTOM_VERSION
+       bool "Custom version"
+	help
+	  This option allows to use a specific official versions
 
 config BR2_TARGET_UBOOT_CUSTOM_TARBALL
 	bool "Custom tarball"
@@ -46,6 +33,10 @@ config BR2_TARGET_UBOOT_CUSTOM_GIT
 
 endchoice
 
+config BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE
+	string "U-Boot version"
+	depends on BR2_TARGET_UBOOT_CUSTOM_VERSION
+
 if BR2_TARGET_UBOOT_CUSTOM_TARBALL
 
 config BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION
@@ -55,12 +46,8 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2013.04"	if BR2_TARGET_UBOOT_2013_04
-	default "2013.01.01"	if BR2_TARGET_UBOOT_2013_01
-	default "2012.10"	if BR2_TARGET_UBOOT_2012_10
-	default "2012.07"	if BR2_TARGET_UBOOT_2012_07
-	default "2012.04.01"	if BR2_TARGET_UBOOT_2012_04
-	default "2011.12"	if BR2_TARGET_UBOOT_2011_12
+	default "2013.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default $BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
 	default $BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION if BR2_TARGET_UBOOT_CUSTOM_GIT
 
-- 
1.8.1.4
