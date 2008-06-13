From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 13 Jun 2008 07:28:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: toolchain
	toolchain/kernel-headers
Message-ID: <20080613142858.33FBE3C85B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-13 07:28:57 -0700 (Fri, 13 Jun 2008)
New Revision: 22326

Log:
toolchain: also setup kernel headers when ext toolchain is used

Provide kernel headers when ext toolchain is used, so we can compile
packages which need them.


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/toolchain/Config.in.2
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-06-13 14:19:13 UTC (rev 22325)
+++ trunk/buildroot/Makefile	2008-06-13 14:28:57 UTC (rev 22326)
@@ -196,7 +196,7 @@
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 BASE_TARGETS:=uclibc-configured binutils cross_compiler uclibc-target-utils kernel-headers
 else
-BASE_TARGETS:=uclibc
+BASE_TARGETS:=uclibc kernel-headers
 endif
 TARGETS:=
 

Modified: trunk/buildroot/toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/Config.in.2	2008-06-13 14:19:13 UTC (rev 22325)
+++ trunk/buildroot/toolchain/Config.in.2	2008-06-13 14:28:57 UTC (rev 22326)
@@ -1,7 +1,8 @@
 #
 
+source "toolchain/kernel-headers/Config.in"
+
 if BR2_TOOLCHAIN_SOURCE
-source "toolchain/kernel-headers/Config.in"
 source "toolchain/uClibc/Config.in"
 source "toolchain/binutils/Config.in"
 source "toolchain/gcc/Config.in"

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2008-06-13 14:19:13 UTC (rev 22325)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2008-06-13 14:28:57 UTC (rev 22326)
@@ -6,13 +6,9 @@
 # by a 'make clean' so don't put anything sacred in here...
 #
 #############################################################
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
-DEFAULT_KERNEL_HEADERS:=$(strip $(subst ",, $(BR2_LINUX26_VERSION)))
-#"))
-else
+
 DEFAULT_KERNEL_HEADERS:=$(strip $(subst ",, $(BR2_DEFAULT_KERNEL_HEADERS)))
 #"))
-endif
 
 LINUX_HEADERS_SITE:=127.0.0.1
 LINUX_HEADERS_SOURCE:=unspecified-kernel-headers
