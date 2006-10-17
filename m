From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue, 17 Oct 2006 09:57:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package toolchain/gdb
	toolchain/uClibc
Message-ID: <20061017165702.EA140486AC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-10-17 09:57:02 -0700 (Tue, 17 Oct 2006)
New Revision: 16399

Log:
we use BR2_ENABLE_LOCALE not ENABLE_LOCALE


Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/toolchain/gdb/gdb.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2006-10-16 22:39:51 UTC (rev 16398)
+++ trunk/buildroot/package/Makefile.in	2006-10-17 16:57:02 UTC (rev 16399)
@@ -85,7 +85,7 @@
 		STRIP=$(TARGET_CROSS)strip \
 		OBJCOPY=$(TARGET_CROSS)objcopy
 
-ifeq ($(ENABLE_LOCALE),true)
+ifeq ($(BR2_ENABLE_LOCALE),y)
 DISABLE_NLS:=
 else
 DISABLE_NLS:=--disable-nls

Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2006-10-16 22:39:51 UTC (rev 16398)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2006-10-17 16:57:02 UTC (rev 16399)
@@ -83,7 +83,7 @@
 		--disable-sim --enable-gdbserver \
 		--without-included-gettext \
 	);
-ifeq ($(ENABLE_LOCALE),true)
+ifeq ($(BR2_ENABLE_LOCALE),y)
 	-$(SED) "s,^INTL *=.*,INTL = -lintl,g;" $(GDB_DIR)/gdb/Makefile
 endif
 	touch  $(GDB_TARGET_DIR)/.configured

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-10-16 22:39:51 UTC (rev 16398)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-10-17 16:57:02 UTC (rev 16399)
@@ -66,9 +66,6 @@
 uclibc-configured: dependencies kernel-headers $(UCLIBC_DIR)/.configured
 $(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.unpacked
 	cp $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
-ifeq ($(ENABLE_LOCALE),true)
-	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\nUCLIBC_PREGENERATED_LOCALE_DATA=y\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=y\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.config
-endif
 	$(SED) 's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="$(TARGET_CROSS)",g' \
 		-e 's,# TARGET_$(UCLIBC_TARGET_ARCH) is not set,TARGET_$(UCLIBC_TARGET_ARCH)=y,g' \
 		-e 's,^TARGET_ARCH="none",TARGET_ARCH=\"$(UCLIBC_TARGET_ARCH)\",g' \
@@ -117,6 +114,11 @@
 ifeq ($(BR2_PTHREADS_NATIVE),y)
 	$(SED) 's,# UCLIBC_HAS_THREADS_NATIVE is not set,UCLIBC_HAS_THREADS_NATIVE=y,g' $(UCLIBC_DIR)/.config
 endif
+ifeq ($(BR2_ENABLE_LOCALE),y)
+	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\nUCLIBC_PREGENERATED_LOCALE_DATA=y\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=y\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.config
+else
+	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g' $(UCLIBC_DIR)/.config
+endif
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/include
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/lib
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/lib
