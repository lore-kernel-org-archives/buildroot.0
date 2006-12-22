From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 22 Dec 2006 02:37:23 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20061222103723.9DC2E4857C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-22 02:37:22 -0800 (Fri, 22 Dec 2006)
New Revision: 17041

Log:
- move setting of determination whether we use a full kernel vs. sanitized headers into the generic part


Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-old.makefile
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2006-12-22 10:20:56 UTC (rev 17040)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2006-12-22 10:37:22 UTC (rev 17041)
@@ -3,7 +3,6 @@
 # full kernel tarballs >= 2.6.19.1
 #
 #############################################################
-LINUX_HEADERS_IS_KERNEL=n
 
 ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.19.1")
 VERSION:=2

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-old.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-old.makefile	2006-12-22 10:20:56 UTC (rev 17040)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-old.makefile	2006-12-22 10:37:22 UTC (rev 17041)
@@ -16,7 +16,6 @@
 LINUX_HEADERS_CAT:=$(BZCAT)
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
 LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.4.25
-LINUX_HEADERS_IS_KERNEL=n
 endif
 
 ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.4.27")
@@ -29,7 +28,6 @@
 LINUX_HEADERS_SOURCE:=linux-libc-headers-2.4.27.tar.bz2
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
 LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.4.27
-LINUX_HEADERS_IS_KERNEL=n
 endif
 
 ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.4.29")
@@ -42,7 +40,6 @@
 LINUX_HEADERS_CAT:=$(BZCAT)
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
 LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.4.29
-LINUX_HEADERS_IS_KERNEL=n
 endif
 
 ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.4.31")
@@ -55,7 +52,6 @@
 LINUX_HEADERS_CAT:=$(BZCAT)
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
 LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.4.31
-LINUX_HEADERS_IS_KERNEL=n
 endif
 
 ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.9")
@@ -68,7 +64,6 @@
 LINUX_HEADERS_CAT:=$(BZCAT)
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
 LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.9.1
-LINUX_HEADERS_IS_KERNEL=n
 endif
 
 ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.10")
@@ -81,7 +76,6 @@
 LINUX_HEADERS_CAT:=$(BZCAT)
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
 LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.10.0
-LINUX_HEADERS_IS_KERNEL=n
 endif
 
 ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.11")
@@ -94,7 +88,6 @@
 LINUX_HEADERS_CAT:=$(BZCAT)
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
 LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.11.0
-LINUX_HEADERS_IS_KERNEL=n
 endif
 
 ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.12")
@@ -107,7 +100,6 @@
 LINUX_HEADERS_CAT:=$(BZCAT)
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
 LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.12.0
-LINUX_HEADERS_IS_KERNEL=n
 endif
 
 

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-12-22 10:20:56 UTC (rev 17040)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-12-22 10:37:22 UTC (rev 17041)
@@ -19,6 +19,9 @@
 	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
 	-e s/sh2.*/sh/ -e s/sh3.*/sh/ -e s/sh4.*/sh/")
 
+# assume old manually sanitized kernel-headers
+LINUX_HEADERS_IS_KERNEL=n
+
 include toolchain/kernel-headers/kernel-headers-new.makefile
 include toolchain/kernel-headers/kernel-headers-old.makefile
 
