From: jspence at uclibc.org <jspence@uclibc.org>
Date: Thu, 27 Mar 2008 19:50:42 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20080328025042.B52E23C31E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jspence
Date: 2008-03-27 19:50:42 -0700 (Thu, 27 Mar 2008)
New Revision: 21525

Log:
Added ccache support and removed grub from defconfig due to brokenness at the moment.

Modified:
   trunk/buildroot/.defconfig
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/.defconfig
===================================================================
--- trunk/buildroot/.defconfig	2008-03-28 02:24:59 UTC (rev 21524)
+++ trunk/buildroot/.defconfig	2008-03-28 02:50:42 UTC (rev 21525)
@@ -628,8 +628,8 @@
 #
 # bootloader for target device
 #
-BR2_TARGET_GRUB=y
-BR2_TARGET_GRUB_SPLASH=y
+# BR2_TARGET_GRUB is not set
+# BR2_TARGET_GRUB_SPLASH is not set
 # BR2_TARGET_GRUB_DISKLESS is not set
 # BR2_TARGET_GRUB_3c595 is not set
 # BR2_TARGET_GRUB_3c90x is not set

Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-03-28 02:24:59 UTC (rev 21524)
+++ trunk/buildroot/Makefile	2008-03-28 02:50:42 UTC (rev 21525)
@@ -78,6 +78,11 @@
 
 export CONFIG_SHELL quiet Q KBUILD_VERBOSE VERBOSE
 
+HOSTCCACHE:=$(shell $(CONFIG_SHELL) -c "which ccache")
+ifneq ($(HOSTCCACHE),)
+BR2_HAVE_HOST_CCACHE=y
+endif
+
 ifndef HOSTAR
 HOSTAR:=ar
 endif
@@ -124,6 +129,12 @@
 ifndef FCFLAGS_FOR_BUILD
 FCFLAGS_FOR_BUILD:=-g -O2
 endif
+
+ifeq ($(BR2_HAVE_HOST_CCACHE),y)
+HOSTCC:=$(HOSTCCACHE) $(HOSTCC)
+HOSTCXX:=$(HOSTCCACHE) $(HOSTCXX)
+endif
+
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD
 
 
