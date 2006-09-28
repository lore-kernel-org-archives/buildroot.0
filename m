From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Sep 2006 05:51:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20060928125126.53942485A4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-09-28 05:51:25 -0700 (Thu, 28 Sep 2006)
New Revision: 16248

Log:
- add possibility to use a 2.6.18 (full) kernel tarball for the libc-headers.


Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2006-09-28 10:35:12 UTC (rev 16247)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2006-09-28 12:51:25 UTC (rev 16248)
@@ -38,6 +38,10 @@
 		depends !BR2_nios2
 		bool "Linux 2.6.12 kernel headers"
 
+	config BR2_KERNEL_HEADERS_2_6_18
+		depends !BR2_nios2
+		bool "Linux 2.6.18 kernel headers"
+
 endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
@@ -49,3 +53,4 @@
 	default "2.6.9"     if BR2_KERNEL_HEADERS_2_6_9
 	default "2.6.11"    if BR2_KERNEL_HEADERS_2_6_11
 	default "2.6.12"    if BR2_KERNEL_HEADERS_2_6_12
+	default "2.6.18"    if BR2_KERNEL_HEADERS_2_6_18

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-09-28 10:35:12 UTC (rev 16247)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-09-28 12:51:25 UTC (rev 16248)
@@ -84,6 +84,15 @@
 LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.12.0
 endif
 
+ifeq ("$(strip $(DEFAULT_KERNEL_HEADERS))","2.6.18")
+VERSION:=2
+PATCHLEVEL:=6
+SUBLEVEL:=18
+LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
+LINUX_HEADERS_SOURCE:=linux-2.6.18.tar.bz2
+LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-2.6.18
+endif
+
 LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)
 
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
@@ -162,6 +171,9 @@
 	    (cd $(LINUX_HEADERS_DIR)/include; ln -fs asm-$(ARCH)$(NOMMU) asm;) \
 	fi
 	touch $(LINUX_HEADERS_DIR)/include/linux/autoconf.h;
+ifeq ("$(strip $(DEFAULT_KERNEL_HEADERS))","2.6.18")
+	(cd $(LINUX_HEADERS_DIR) ; $(MAKE) include/linux/version.h ; )
+endif
 	touch $(LINUX_HEADERS_DIR)/.configured
 
 $(LINUX_KERNEL): $(LINUX_HEADERS_DIR)/.configured
