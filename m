From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 25 Sep 2007 06:32:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20070925133209.76C5DA682B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-09-25 06:32:08 -0700 (Tue, 25 Sep 2007)
New Revision: 20018

Log:
Generalized kernel headers handling for new-style kernels

Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-09-25 12:54:48 UTC (rev 20017)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2007-09-25 13:32:08 UTC (rev 20018)
@@ -4,12 +4,19 @@
 #
 #############################################################
 
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.22.7")
-VERSION:=2
-PATCHLEVEL:=6
-SUBLEVEL:=22
-EXTRAVERSION:=.7
+# new-style kernels?
+ifeq ($(LINUX_HEADERS_VERSION),)
+# parse linux version string
+LNXVER:=$(subst ., , $(strip $(DEFAULT_KERNEL_HEADERS)))
+VERSION:=$(word 1, $(LNXVER))
+PATCHLEVEL:=$(word 2, $(LNXVER))
+SUBLEVEL:=$(word 3, $(LNXVER))
+EXTRAVERSION:=$(word 4, $(LNXVER))
 LOCALVERSION:=
+
+# should contain prepended dot
+EXTRAVERSION:=$(if $(EXTRAVERSION),.$(EXTRAVERSION),)
+
 LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
 LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
 LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
@@ -20,83 +27,13 @@
 endif
 
 ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.22.1")
-VERSION:=2
-PATCHLEVEL:=6
-SUBLEVEL:=22
-EXTRAVERSION:=.1
-LOCALVERSION:=
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
-LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_IS_KERNEL=y
 LINUX_RT_VERSION:=rt9
 endif
 
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.21.7")
-VERSION:=2
-PATCHLEVEL:=6
-SUBLEVEL:=21
-EXTRAVERSION:=.7
-LOCALVERSION:=
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
-LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_IS_KERNEL=y
-endif
-
 ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.21.5")
-VERSION:=2
-PATCHLEVEL:=6
-SUBLEVEL:=21
-EXTRAVERSION:=.5
-LOCALVERSION:=
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
-LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_IS_KERNEL=y
 LINUX_RT_VERSION:=rt20
 endif
 
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.20.19")
-VERSION:=2
-PATCHLEVEL:=6
-SUBLEVEL:=20
-EXTRAVERSION:=.19
-LOCALVERSION:=
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
-LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_IS_KERNEL=y
-endif
-
-ifeq ("$(DEFAULT_KERNEL_HEADERS)","2.6.20.4")
-VERSION:=2
-PATCHLEVEL:=6
-SUBLEVEL:=20
-EXTRAVERSION:=.4
-LOCALVERSION:=
-LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
-LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
-LINUX_HEADERS_SOURCE:=linux-$(LINUX_HEADERS_VERSION).tar.bz2
-LINUX_HEADERS_CAT:=$(BZCAT)
-LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-$(LINUX_HEADERS_VERSION)
-LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
-LINUX_HEADERS_IS_KERNEL=y
-endif
-
-
 ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
 # Need to redefine KERNEL_HEADERS_PATCH_DIR if you want
 # board specific kernel headers
