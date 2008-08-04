From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:07:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: lzma mkdosfs newt
	slang strace vsftpd z etc...
Message-ID: <20080804190719.08F223C85E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:07:18 -0700 (Mon, 04 Aug 2008)
New Revision: 23017

Log:
package: global largefile CFLAGS handling

Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/lzma/lzma.mk
   trunk/buildroot/package/mkdosfs/mkdosfs.mk
   trunk/buildroot/package/newt/newt.mk
   trunk/buildroot/package/slang/slang.mk
   trunk/buildroot/package/strace/strace.mk
   trunk/buildroot/package/vsftpd/vsftpd.mk
   trunk/buildroot/package/zlib/zlib.mk


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2008-08-04 19:07:05 UTC (rev 23016)
+++ trunk/buildroot/package/Makefile.in	2008-08-04 19:07:18 UTC (rev 23017)
@@ -80,6 +80,10 @@
 TARGET_CFLAGS+=-fno-pic -mno-abicalls
 endif
 
+ifeq ($(BR2_LARGEFILE),y)
+TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+endif
+
 TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 
 # else it's an external toolchain

Modified: trunk/buildroot/package/lzma/lzma.mk
===================================================================
--- trunk/buildroot/package/lzma/lzma.mk	2008-08-04 19:07:05 UTC (rev 23016)
+++ trunk/buildroot/package/lzma/lzma.mk	2008-08-04 19:07:18 UTC (rev 23017)
@@ -9,10 +9,6 @@
 LZMA_SITE:=http://tukaani.org/lzma/
 LZMA_HOST_DIR:=$(TOOL_BUILD_DIR)/lzma-$(LZMA_VERSION)
 LZMA_TARGET_DIR:=$(BUILD_DIR)/lzma-$(LZMA_VERSION)
-LZMA_CFLAGS:=$(TARGET_CFLAGS)
-ifeq ($(BR2_LARGEFILE),y)
-LZMA_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-endif
 LZMA_TARGET_BINARY:=bin/lzma
 
 # lzma binary for use on the host
@@ -92,7 +88,7 @@
 	(cd $(LZMA_TARGET_DIR); rm -f config.cache;\
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-		CFLAGS="$(TARGET_CFLAGS) $(LZMA_CFLAGS)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
 		ac_cv_func_malloc_0_nonnull=yes \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/mkdosfs/mkdosfs.mk
===================================================================
--- trunk/buildroot/package/mkdosfs/mkdosfs.mk	2008-08-04 19:07:05 UTC (rev 23016)
+++ trunk/buildroot/package/mkdosfs/mkdosfs.mk	2008-08-04 19:07:18 UTC (rev 23017)
@@ -11,11 +11,6 @@
 MKDOSFS_BINARY:=mkdosfs/mkdosfs
 MKDOSFS_TARGET_BINARY:=sbin/mkdosfs
 
-MKDOSFS_CFLAGS=$(TARGET_CFLAGS)
-ifeq ($(BR2_LARGEFILE),y)
-MKDOSFS_CFLAGS+= -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-endif
-
 $(DL_DIR)/$(MKDOSFS_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(MKDOSFS_SITE)/$(MKDOSFS_SOURCE)
 
@@ -26,7 +21,7 @@
 	touch $(MKDOSFS_DIR)/.unpacked
 
 $(MKDOSFS_DIR)/$(MKDOSFS_BINARY): $(MKDOSFS_DIR)/.unpacked
-	$(MAKE) CFLAGS="$(MKDOSFS_CFLAGS)" CC="$(TARGET_CC)" -C $(MKDOSFS_DIR)
+	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(MKDOSFS_DIR)
 	$(STRIPCMD) $(MKDOSFS_DIR)/mkdosfs/mkdosfs
 	touch -c $(MKDOSFS_DIR)/mkdosfs/mkdosfs
 

Modified: trunk/buildroot/package/newt/newt.mk
===================================================================
--- trunk/buildroot/package/newt/newt.mk	2008-08-04 19:07:05 UTC (rev 23016)
+++ trunk/buildroot/package/newt/newt.mk	2008-08-04 19:07:18 UTC (rev 23017)
@@ -8,12 +8,7 @@
 NEWT_SITE=http://www.uclibc.org/
 NEWT_DIR=$(BUILD_DIR)/newt-0.51.0
 NEWT_VERSION=0.51.0
-ifeq ($(BR2_LARGEFILE),y)
-NEWT_CFLAGS=-Os -g -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-else
-NEWT_CFLAGS=-Os -g
-endif
-NEWT_CFLAGS+=-fPIC
+NEWT_CFLAGS=-Os -g -fPIC
 
 $(DL_DIR)/$(NEWT_SOURCE):
 	$(WGET) -P $(DL_DIR) $(NEWT_SITE)/$(NEWT_SOURCE)

Modified: trunk/buildroot/package/slang/slang.mk
===================================================================
--- trunk/buildroot/package/slang/slang.mk	2008-08-04 19:07:05 UTC (rev 23016)
+++ trunk/buildroot/package/slang/slang.mk	2008-08-04 19:07:18 UTC (rev 23017)
@@ -8,10 +8,6 @@
 SLANG_CAT:=$(BZCAT)
 SLANG_SITE:=http://www.uclibc.org/
 SLANG_DIR=$(BUILD_DIR)/slang-$(SLANG_VERSION)-mini
-ifeq ($(BR2_LARGEFILE),y)
-SLANG_CFLAGS=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-endif
-SLANG_CFLAGS+=-fPIC
 
 $(DL_DIR)/$(SLANG_SOURCE):
 	$(WGET) -P $(DL_DIR) $(SLANG_SITE)/$(SLANG_SOURCE)
@@ -20,7 +16,7 @@
 	$(SLANG_CAT) $(DL_DIR)/$(SLANG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 
 $(SLANG_DIR)/libslang.so: $(SLANG_DIR)
-	$(MAKE1) CFLAGS="-Os -g $(SLANG_CFLAGS)" CC=$(TARGET_CC) -C $(SLANG_DIR)
+	$(MAKE1) CFLAGS="-Os -g -fPIC $(TARGET_CFLAGS)" CC=$(TARGET_CC) -C $(SLANG_DIR)
 
 $(STAGING_DIR)/lib/libslang.so.1: $(SLANG_DIR)/libslang.so
 	cp -dpf $(SLANG_DIR)/libslang.a $(STAGING_DIR)/usr/lib

Modified: trunk/buildroot/package/strace/strace.mk
===================================================================
--- trunk/buildroot/package/strace/strace.mk	2008-08-04 19:07:05 UTC (rev 23016)
+++ trunk/buildroot/package/strace/strace.mk	2008-08-04 19:07:18 UTC (rev 23017)
@@ -9,11 +9,6 @@
 STRACE_CAT:=$(BZCAT)
 STRACE_DIR:=$(BUILD_DIR)/strace-$(STRACE_VERSION)
 
-BR2_STRACE_CFLAGS:=
-ifeq ($(BR2_LARGEFILE),)
-BR2_STRACE_CFLAGS+=-U_LARGEFILE64_SOURCE -U__USE_LARGEFILE64 -U__USE_FILE_OFFSET64
-endif
-
 $(DL_DIR)/$(STRACE_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(STRACE_SITE)/$(STRACE_SOURCE)
 
@@ -31,7 +26,7 @@
 		$(if $(BR2_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no) \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-		CFLAGS="$(TARGET_CFLAGS) $(BR2_STRACE_CFLAGS)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
 		ac_cv_header_linux_if_packet_h=yes \
 		ac_cv_header_linux_netlink_h=yes \
 		./configure \

Modified: trunk/buildroot/package/vsftpd/vsftpd.mk
===================================================================
--- trunk/buildroot/package/vsftpd/vsftpd.mk	2008-08-04 19:07:05 UTC (rev 23016)
+++ trunk/buildroot/package/vsftpd/vsftpd.mk	2008-08-04 19:07:18 UTC (rev 23017)
@@ -17,9 +17,6 @@
 else
 VSFTPD_LIBS:=-lcrypt
 endif
-ifeq ($(BR2_LARGEFILE),)
-#BR2_VSFTPD_CFLAGS:=-U_LARGEFILE64_SOURCE -U_FILE_OFFSET_BITS
-endif
 
 $(DL_DIR)/$(VSFTPD_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(VSFTPD_SITE)/$(VSFTPD_SOURCE)
@@ -49,7 +46,7 @@
 
 
 $(VSFTPD_DIR)/$(VSFTPD_BINARY): $(VSFTPF_PREREQ) $(VSFTPD_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS) $(BR2_VSFTPD_CFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(VSFTPD_DIR)
+	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" LIBS="$(VSFTPD_LIBS)" -C $(VSFTPD_DIR)
 
 $(TARGET_DIR)/usr/sbin/$(VSFTPD_BINARY): $(VSFTPD_DIR)/$(VSFTPD_BINARY)
 	cp -dpf $< $@

Modified: trunk/buildroot/package/zlib/zlib.mk
===================================================================
--- trunk/buildroot/package/zlib/zlib.mk	2008-08-04 19:07:05 UTC (rev 23016)
+++ trunk/buildroot/package/zlib/zlib.mk	2008-08-04 19:07:18 UTC (rev 23017)
@@ -8,10 +8,6 @@
 ZLIB_CAT:=$(BZCAT)
 ZLIB_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 ZLIB_DIR:=$(BUILD_DIR)/zlib-$(ZLIB_VERSION)
-ZLIB_CFLAGS:=-fPIC
-ifeq ($(BR2_LARGEFILE),y)
-ZLIB_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-endif
 
 $(DL_DIR)/$(ZLIB_SOURCE):
 	$(WGET) -P $(DL_DIR) $(ZLIB_SITE)/$(ZLIB_SOURCE)
@@ -26,7 +22,7 @@
 	(cd $(ZLIB_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(ZLIB_CFLAGS)" \
+		CFLAGS="$(TARGET_CFLAGS) -fPIC" \
 		./configure \
 		--shared \
 		--prefix=/usr \
