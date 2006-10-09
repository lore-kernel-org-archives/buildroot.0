From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  9 Oct 2006 04:41:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20061009114134.C2C4E485D4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-10-09 04:41:34 -0700 (Mon, 09 Oct 2006)
New Revision: 16345

Log:
- use headers_install for full kernel tarballs used as kernel-headers


Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-10-08 23:36:17 UTC (rev 16344)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-10-09 11:41:34 UTC (rev 16345)
@@ -83,6 +83,7 @@
 LINUX_HEADERS_SOURCE:=linux-libc-headers-2.6.12.0.tar.bz2
 LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-libc-headers-2.6.12.0
 endif
+LINUX_HEADERS_IS_KERNEL=n
 
 ifeq ("$(strip $(DEFAULT_KERNEL_HEADERS))","2.6.18")
 VERSION:=2
@@ -91,25 +92,51 @@
 LINUX_HEADERS_SITE:=http://www.kernel.org/pub/linux/kernel/v2.6/
 LINUX_HEADERS_SOURCE:=linux-2.6.18.tar.bz2
 LINUX_HEADERS_UNPACK_DIR:=$(TOOL_BUILD_DIR)/linux-2.6.18
+LINUX_HEADERS_IS_KERNEL=y
 endif
 
 LINUX_HEADERS_VERSION:=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)
 
 LINUX_HEADERS_DIR:=$(TOOL_BUILD_DIR)/linux
 
+LINUX_HEADERS_DO_MOVE=n
+ifneq ($(LINUX_HEADERS_UNPACK_DIR),$(LINUX_HEADERS_DIR))
+LINUX_HEADERS_DO_MOVE=y
+endif
+ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
+LINUX_HEADERS_DO_MOVE=n
+endif
+
 $(DL_DIR)/$(LINUX_HEADERS_SOURCE):
 	mkdir -p $(DL_DIR)
 	$(WGET) -P $(DL_DIR) $(LINUX_HEADERS_SITE)/$(LINUX_HEADERS_SOURCE)
 
+ifeq ($(LINUX_HEADERS_DO_MOVE),y)
 $(LINUX_HEADERS_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
 	rm -rf $(LINUX_HEADERS_DIR)
 	mkdir -p $(TOOL_BUILD_DIR)
 	bzcat $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
-ifneq ($(LINUX_HEADERS_UNPACK_DIR),$(LINUX_HEADERS_DIR))
 	mv $(LINUX_HEADERS_UNPACK_DIR) $(LINUX_HEADERS_DIR)
+	touch $(LINUX_HEADERS_DIR)/.unpacked
+else
+$(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
+	rm -rf $(LINUX_HEADERS_DIR)
+	mkdir -p $(TOOL_BUILD_DIR)
+	bzcat $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(LINUX_HEADERS_UNPACK_DIR)/.unpacked
 endif
-	touch $(LINUX_HEADERS_DIR)/.unpacked
 
+ifeq ($(LINUX_HEADERS_IS_KERNEL),y)
+# full kernel tarball >= 2.6.18
+$(LINUX_HEADERS_UNPACK_DIR)/.patched: $(LINUX_HEADERS_UNPACK_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers linux-$(LINUX_HEADERS_VERSION)\*.patch
+
+$(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
+	(cd $(LINUX_HEADERS_UNPACK_DIR) ; \
+	 $(MAKE) INSTALL_HDR_PATH=$(LINUX_HEADERS_DIR) headers_install)
+	touch $(LINUX_HEADERS_DIR)/.configured
+else
+# the sanitized kernel-headers
 $(LINUX_HEADERS_DIR)/.patched: $(LINUX_HEADERS_DIR)/.unpacked
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_DIR) toolchain/kernel-headers linux-libc-headers-$(LINUX_HEADERS_VERSION)\*.patch
 ifeq ($(strip $(ARCH)),nios2)
@@ -171,10 +198,8 @@
 	    (cd $(LINUX_HEADERS_DIR)/include; ln -fs asm-$(ARCH)$(NOMMU) asm;) \
 	fi
 	touch $(LINUX_HEADERS_DIR)/include/linux/autoconf.h;
-ifeq ("$(strip $(DEFAULT_KERNEL_HEADERS))","2.6.18")
-	(cd $(LINUX_HEADERS_DIR) ; $(MAKE) include/linux/version.h ; )
+	touch $(LINUX_HEADERS_DIR)/.configured
 endif
-	touch $(LINUX_HEADERS_DIR)/.configured
 
 $(LINUX_KERNEL): $(LINUX_HEADERS_DIR)/.configured
 
