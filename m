From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 29 Aug 2006 09:40:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  lzma
Message-ID: <20060829164039.5B89A485DB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-08-29 09:40:38 -0700 (Tue, 29 Aug 2006)
New Revision: 16011

Log:
- add package lzma


Added:
   trunk/buildroot/package/lzma/
   trunk/buildroot/package/lzma/Config.in
   trunk/buildroot/package/lzma/lzma.100-futimesat.patch
   trunk/buildroot/package/lzma/lzma.mk


Changeset:
Added: trunk/buildroot/package/lzma/Config.in
===================================================================
--- trunk/buildroot/package/lzma/Config.in	2006-08-28 23:39:36 UTC (rev 16010)
+++ trunk/buildroot/package/lzma/Config.in	2006-08-29 16:40:38 UTC (rev 16011)
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LZMA
+	bool "lzma"
+	default n
+	help
+	  Compression utility.
+
+	  http://tukaani.org/lzma/
+
+config BR2_PACKAGE_LZMA_TARGET_HEADERS
+	bool "lzma headers in target"
+	default n
+	depends on BR2_PACKAGE_LZMA
+	help
+	  Put headers files in the target.

Added: trunk/buildroot/package/lzma/lzma.100-futimesat.patch
===================================================================
--- trunk/buildroot/package/lzma/lzma.100-futimesat.patch	2006-08-28 23:39:36 UTC (rev 16010)
+++ trunk/buildroot/package/lzma/lzma.100-futimesat.patch	2006-08-29 16:40:38 UTC (rev 16011)
@@ -0,0 +1,14 @@
+--- lzma-4.32.0beta3.orig/src/lzma/lzmp.cpp	2006-07-06 23:58:46.000000000 +0200
++++ lzma-4.32.0beta3/src/lzma/lzmp.cpp	2006-08-29 20:21:22.000000000 +0200
+@@ -47,7 +47,11 @@ typedef vector<string> stringVector;
+ 
+ // For Solaris
+ #ifndef HAVE_FUTIMES
++#ifdef HAVE_FUTIMESAT
+ #define futimes(fd, tv) futimesat(fd, NULL, tv)
++#else
++#define futimes(fd, tv) 0 /* utimes(fd, NULL, tv)*/
++#endif
+ #endif
+ 
+ #if defined(_WIN32) || defined(OS2) || defined(MSDOS)

Added: trunk/buildroot/package/lzma/lzma.mk
===================================================================
--- trunk/buildroot/package/lzma/lzma.mk	2006-08-28 23:39:36 UTC (rev 16010)
+++ trunk/buildroot/package/lzma/lzma.mk	2006-08-29 16:40:38 UTC (rev 16011)
@@ -0,0 +1,81 @@
+#############################################################
+#
+# lzma
+#
+#############################################################
+LZMA_VER:=4.32.0beta3
+LZMA_SOURCE:=lzma-$(LZMA_VER).tar.gz
+LZMA_SITE:=http://tukaani.org/lzma/
+LZMA_DIR:=$(BUILD_DIR)/lzma-$(LZMA_VER)
+LZMA_CFLAGS:=$(TARGET_CFLAGS)
+ifeq ($(BR2_LARGEFILE),y)
+LZMA_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+LZMA_LARGEFILE="--enable-largefile"
+else
+LZMA_LARGEFILE="--disable-largefile"
+endif
+
+$(DL_DIR)/$(LZMA_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LZMA_SITE)/$(LZMA_SOURCE)
+
+$(LZMA_DIR)/.source: $(DL_DIR)/$(LZMA_SOURCE)
+	zcat $(DL_DIR)/$(LZMA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LZMA_DIR) package/lzma/ lzma\*.patch
+	touch $(LZMA_DIR)/.source
+
+$(LZMA_DIR)/.configured: $(LZMA_DIR)/.source
+	(cd $(LZMA_DIR); rm -f config.cache ;\
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) $(LZMA_CFLAGS)" \
+		ac_cv_func_malloc_0_nonnull=yes \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=$(STAGING_DIR)/usr/bin \
+		--libdir=$(STAGING_DIR)/lib \
+		--includedir=$(STAGING_DIR)/include \
+		--disable-debug \
+		$(DISABLE_NLS) \
+		$(LZMA_LARGEFILE) \
+	);
+	touch $(LZMA_DIR)/.configured;
+
+$(LZMA_DIR)/src/lzma/lzma: $(LZMA_DIR)/.configured
+	$(MAKE) -C $(LZMA_DIR) all
+	touch -c $@
+
+$(STAGING_DIR)/bin/lzma: $(LZMA_DIR)/src/lzma/lzma
+	-cp -dpf $(LZMA_DIR)/src/lzma/lzma $(STAGING_DIR)/bin/;
+	touch -c $(STAGING_DIR)/bin/lzma
+
+$(TARGET_DIR)/bin/lzma: $(STAGING_DIR)/bin/lzma
+	cp -dpf $(STAGING_DIR)/bin/lzma $(TARGET_DIR)/bin/;
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/bin/lzma
+	touch -c $(TARGET_DIR)/bin/lzma
+
+#lzma-headers: $(TARGET_DIR)/bin/lzma
+
+lzma: uclibc $(TARGET_DIR)/bin/lzma
+
+lzma-source: $(DL_DIR)/$(LZMA_SOURCE)
+
+lzma-clean:
+	rm -f $(TARGET_DIR)/bin/lzma
+	-$(MAKE) -C $(LZMA_DIR) clean
+
+lzma-dirclean:
+	rm -rf $(LZMA_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LZMA)),y)
+TARGETS+=lzma
+endif
+#ifeq ($(strip $(BR2_PACKAGE_LZMA_TARGET_HEADERS)),y)
+#TARGETS+=lzma-headers
+#endif
