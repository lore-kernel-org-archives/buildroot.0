From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Fri,  1 Dec 2006 21:15:27 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20061202051527.E9A764858F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2006-12-01 21:15:27 -0800 (Fri, 01 Dec 2006)
New Revision: 16750

Log:
For GCC 4.2 snapshots, we need to get the actual version from the BASE-VER file so that the target compiler will build and install properly.


Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-12-02 02:01:57 UTC (rev 16749)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2006-12-02 05:15:27 UTC (rev 16750)
@@ -335,9 +335,14 @@
 ifeq ($(findstring 4.1.,$(GCC_VERSION)),4.1.)
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
 endif
-ifeq ($(findstring 4.2.,$(GCC_VERSION)),4.2.)
+ifeq ($(findstring 4.2,$(GCC_VERSION)),4.2)
+ifneq ($(GCC_SNAP_DATE),)
+REAL_GCC_VERSION:=`cat ${GCC_DIR}/gcc/BASE-VER`
+GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(REAL_GCC_VERSION)
+else
 GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
 endif
+endif
 
 $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR3)/.compiled
 	PATH=$(TARGET_PATH) \
