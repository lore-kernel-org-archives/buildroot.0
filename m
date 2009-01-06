From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  6 Jan 2009 14:40:25 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20090106144025.CCD7E76BFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-06 14:40:24 +0000 (Tue, 06 Jan 2009)
New Revision: 24698

Log:
When you set BR2_PACKAGE_LINUX_USE_DEFCONFIG
to configure linux using the

make <board>_defconfig

You have to supply the $(BOARD_NAME) variable.
Add this info in the help text for
target/linux/Makefile.in.advanced

----------------

When you do not set BR2_PACKAGE_LINUX_USE_XCONFIG
to configure linux using "$make <XXXX>config
The choices "$make menuconfig" or "$make xconfig"
should not be visible.
Add dependency




Modified:
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2009-01-06 14:16:27 UTC (rev 24697)
+++ trunk/buildroot/target/linux/Config.in.advanced	2009-01-06 14:40:24 UTC (rev 24698)
@@ -437,6 +437,8 @@
 	depends on BR2_PACKAGE_LINUX
 	help
 	  Configure Linux by make <board>_defconfig
+	  You have to supply a BOARD_NAME, either by
+	  defining it in a BSP or by make BOARD_NAME=<board>
 
 config BR2_PACKAGE_LINUX_USE_XCONFIG
 	bool "Run make ARCH=$(ARCH) [xconfig|menuconfig] before build"
@@ -445,8 +447,6 @@
 	  Configure Linux by make xconfig
 endchoice
 
-
-
 config BR2_PACKAGE_LINUX_KCONFIG
 	string ".config file"
 	depends on BR2_PACKAGE_LINUX_USE_KCONFIG
@@ -462,6 +462,7 @@
 	prompt "Preferred config tool"
 	default BR2_MAKE_XCONFIG if BR2_TARGET_ATMEL
 	default BR2_MAKE_MENUCONFIG
+	depends on BR2_PACKAGE_LINUX_USE_XCONFIG
 	help
 	  Define the preferred tool to invoke if a configuration is invalid
 
