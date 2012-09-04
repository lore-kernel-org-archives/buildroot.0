From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  4 Sep 2012 09:00:19 -0300
Subject: [Buildroot] [PATCH 3/3] u-boot: add version 2012.07
In-Reply-To: <1346760019-31807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1346760019-31807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1346760019-31807-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 boot/uboot/Config.in                               |    6 +++-
 ...oot-tools-2012.07-drop-configh-from-tools.patch |   31 ++++++++++++++++++++
 ...oot-tools-2012.07-hostcflags-override-fix.patch |   29 ++++++++++++++++++
 3 files changed, 65 insertions(+), 1 deletions(-)
 create mode 100644 package/uboot-tools/uboot-tools-2012.07-drop-configh-from-tools.patch
 create mode 100644 package/uboot-tools/uboot-tools-2012.07-hostcflags-override-fix.patch

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 900fac7..7f3cae0 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -12,10 +12,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2012_04
+	default BR2_TARGET_UBOOT_2012_07
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2012_07
+	bool "2012.07"
+
 config BR2_TARGET_UBOOT_2012_04
 	bool "2012.04.01"
 
@@ -50,6 +53,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
+	default "2012.07"	if BR2_TARGET_UBOOT_2012_07
 	default "2012.04.01"	if BR2_TARGET_UBOOT_2012_04
 	default "2011.12"	if BR2_TARGET_UBOOT_2011_12
 	default "2011.09"	if BR2_TARGET_UBOOT_2011_09
diff --git a/package/uboot-tools/uboot-tools-2012.07-drop-configh-from-tools.patch b/package/uboot-tools/uboot-tools-2012.07-drop-configh-from-tools.patch
new file mode 100644
index 0000000..2b3a0e5
--- /dev/null
+++ b/package/uboot-tools/uboot-tools-2012.07-drop-configh-from-tools.patch
@@ -0,0 +1,31 @@
+From 39857718f4df9b40a7acf38b73140fd86c628ef0 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Mon, 30 Apr 2012 09:07:38 -0300
+Subject: [PATCH] fw_env: allow it to build without a config
+
+We need to build u-boot tools without a board configuration for the
+target packages.
+fw_env just uses config.h to define the default environment of the
+created image, so it really isn't mandatory.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ tools/env/fw_env.c |    2 --
+ 1 files changed, 0 insertions(+), 2 deletions(-)
+
+diff --git a/tools/env/fw_env.c b/tools/env/fw_env.c
+index e292d2b..2bb061a 100644
+--- a/tools/env/fw_env.c
++++ b/tools/env/fw_env.c
+@@ -45,8 +45,6 @@
+ 
+ #include "fw_env.h"
+ 
+-#include <config.h>
+-
+ #define WHITESPACE(c) ((c == '\t') || (c == ' '))
+ 
+ #define min(x, y) ({				\
+-- 
+1.7.3.4
+
diff --git a/package/uboot-tools/uboot-tools-2012.07-hostcflags-override-fix.patch b/package/uboot-tools/uboot-tools-2012.07-hostcflags-override-fix.patch
new file mode 100644
index 0000000..0202eda
--- /dev/null
+++ b/package/uboot-tools/uboot-tools-2012.07-hostcflags-override-fix.patch
@@ -0,0 +1,29 @@
+[PATCH] Fix tools build with custom HOSTCFLAGS
+
+We always need to append HOSTCPPFLAGS, even if HOSTCFLAGS have been
+overridden on the cmdline.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ config.mk |    6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+Index: u-boot-2011.03/config.mk
+===================================================================
+--- u-boot-2011.03.orig/config.mk
++++ u-boot-2011.03/config.mk
+@@ -46,10 +46,12 @@
+ 
+ #########################################################################
+ 
+-HOSTCFLAGS	= -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer \
+-		  $(HOSTCPPFLAGS)
++HOSTCFLAGS	= -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer
+ HOSTSTRIP	= strip
+ 
++# append CPPFLAGS even if CFLAGS has been overridden on cmdline
++override HOSTCFLAGS += $(HOSTCPPFLAGS)
++
+ #
+ # Mac OS X / Darwin's C preprocessor is Apple specific.  It
+ # generates numerous errors and warnings.  We want to bypass it
-- 
1.7.8.6
