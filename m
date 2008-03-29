From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Sat, 29 Mar 2008 10:47:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080329174736.4BEA53C4C4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-03-29 10:47:36 -0700 (Sat, 29 Mar 2008)
New Revision: 21561

Log:
Feeding the kernel zero optimization -O0 breaks the kernel build at least on x86 with asm errors, remove -O0 when building the kernel


Modified:
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2008-03-29 17:34:23 UTC (rev 21560)
+++ trunk/buildroot/target/linux/Makefile.in	2008-03-29 17:47:36 UTC (rev 21561)
@@ -84,9 +84,10 @@
 endif
 endif
 __LINUX26_NO_PIC=-fPIC -fpic -DPIC -fwrapv -ftrapv
+__LINUX26_ZERO_OPTIMIZATION=-O0
 LINUX26_MAKE_FLAGS = HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
-	CFLAGS_KERNEL="$(filter-out $(__LINUX26_NO_PIC),$(TARGET_CFLAGS))" \
+	CFLAGS_KERNEL="$(filter-out $(__LINUX26_NO_PIC) $(__LINUX26_ZERO_OPTIMIZATION),$(TARGET_CFLAGS))" \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
 	CROSS_COMPILE=$(KERNEL_CROSS) \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
