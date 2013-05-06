From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon,  6 May 2013 16:10:53 +0200
Subject: [Buildroot] [PATCH v4 1/5] barebox: add custom version option
In-Reply-To: <1367849457-31738-1-git-send-email-fabio.porcedda@gmail.com>
References: <1367849457-31738-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1367849457-31738-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add custom version option as used in the linux kernel.
This way we can easily specify newer and older version.
Remove the list of the older versions because is obsoleted
by the new custom version option that is more flexible.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 boot/barebox/Config.in | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 581cc52..47926cb 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -8,22 +8,17 @@ config BR2_TARGET_BAREBOX
 if BR2_TARGET_BAREBOX
 choice
 	prompt "version"
-	default BR2_TARGET_BAREBOX_2013_04
 	help
 	  Select the specific Barebox version you want to use
 
-config BR2_TARGET_BAREBOX_2013_01
-	bool "2013.01.0"
-
-config BR2_TARGET_BAREBOX_2013_02
-	bool "2013.02.0"
-
-config BR2_TARGET_BAREBOX_2013_03
-	bool "2013.03.0"
-
-config BR2_TARGET_BAREBOX_2013_04
+config BR2_TARGET_BAREBOX_LATEST_VERSION
 	bool "2013.04.0"
 
+config BR2_TARGET_BAREBOX_CUSTOM_VERSION
+	bool "Custom version"
+	help
+	  This option allows to use a specific official versions
+
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -32,6 +27,10 @@ config BR2_TARGET_BAREBOX_CUSTOM_GIT
 
 endchoice
 
+config BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE
+	string "Barebox version"
+	depends on BR2_TARGET_BAREBOX_CUSTOM_VERSION
+
 if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 
 config BR2_TARGET_BAREBOX_CUSTOM_TARBALL_LOCATION
@@ -41,10 +40,8 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2013.01.0"	if BR2_TARGET_BAREBOX_2013_01
-	default "2013.02.0"	if BR2_TARGET_BAREBOX_2013_02
-	default "2013.03.0"	if BR2_TARGET_BAREBOX_2013_03
-	default "2013.04.0"	if BR2_TARGET_BAREBOX_2013_04
+	default "2013.04.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default $BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
-- 
1.8.1.4
