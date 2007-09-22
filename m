From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 22 Sep 2007 07:53:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target:  hurd linux
Message-ID: <20070922145343.62E82A65A7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-22 07:53:38 -0700 (Sat, 22 Sep 2007)
New Revision: 19940

Log:
- add a more generic "Kernel" menu instead of "Linux Options"


Added:
   trunk/buildroot/target/hurd/
   trunk/buildroot/target/hurd/Config.in

Modified:
   trunk/buildroot/target/Config.in
   trunk/buildroot/target/linux/Config.in


Changeset:
Modified: trunk/buildroot/target/Config.in
===================================================================
--- trunk/buildroot/target/Config.in	2007-09-22 14:34:40 UTC (rev 19939)
+++ trunk/buildroot/target/Config.in	2007-09-22 14:53:38 UTC (rev 19940)
@@ -18,8 +18,34 @@
 #source "target/x86/grub2/Config.in"
 source "target/x86/syslinux/Config.in"
 source "target/powerpc/yaboot/Config.in"
+endmenu
 
+menu "Kernel"
+choice
+	prompt "Kernel type"
+	default BR2_KERNEL_LINUX
+
+config BR2_KERNEL_none
+	bool "none"
+	help
+	  Do not build a kernel
+
+config BR2_KERNEL_LINUX
+	bool "linux"
+	help
+	  Linux kernel
+
+config BR2_KERNEL_HURD
+	bool "hurd"
+	help
+	  GNU/Hurd kernel
+endchoice
+if BR2_KERNEL_LINUX
+source "target/linux/Config.in"
+endif
+if BR2_KERNEL_HURD
+source "target/hurd/Config.in"
+endif
 endmenu
 
-source "target/linux/Config.in"
 source "target/device/Config.in"

Added: trunk/buildroot/target/hurd/Config.in
===================================================================
--- trunk/buildroot/target/hurd/Config.in	                        (rev 0)
+++ trunk/buildroot/target/hurd/Config.in	2007-09-22 14:53:38 UTC (rev 19940)
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HURD
+	bool "Hurd kernel"
+	depends on BR2_KERNEL_HURD
+	default y
+	help
+	  The GNU/Hurd kernel.
+	  http://www.gnu.org/software/hurd/
+
+	  FIXME: Currently not implemented.
+
+

Modified: trunk/buildroot/target/linux/Config.in
===================================================================
--- trunk/buildroot/target/linux/Config.in	2007-09-22 14:34:40 UTC (rev 19939)
+++ trunk/buildroot/target/linux/Config.in	2007-09-22 14:53:38 UTC (rev 19940)
@@ -1,8 +1,9 @@
-menu "Linux Options"
+#comment "Linux kernel options"
 
 config BR2_PACKAGE_LINUX
 	bool "linux kernel"
-	default n
+	depends on BR2_KERNEL_LINUX
+	default y
 	help
 	  The Linux kernel.
 	  http://www.kernel.org/
@@ -387,4 +388,3 @@
 	  	Copy kernel to secondary location
 
 endif
-endmenu
