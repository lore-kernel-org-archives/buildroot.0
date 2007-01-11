From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 10 Jan 2007 23:27:37 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  tiff
Message-ID: <20070111072737.EA7664858C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-10 23:27:37 -0800 (Wed, 10 Jan 2007)
New Revision: 17243

Log:
add tiff package


Added:
   trunk/buildroot/package/tiff/
   trunk/buildroot/package/tiff/Config.in
   trunk/buildroot/package/tiff/tiff.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-11 07:26:02 UTC (rev 17242)
+++ trunk/buildroot/package/Config.in	2007-01-11 07:27:37 UTC (rev 17243)
@@ -153,6 +153,7 @@
 source "package/tcpdump/Config.in"
 source "package/tftpd/Config.in"
 source "package/thttpd/Config.in"
+source "package/tiff/Config.in"
 source "package/tinylogin/Config.in"
 source "package/tinyx/Config.in"
 source "package/tn5250/Config.in"

Added: trunk/buildroot/package/tiff/Config.in
===================================================================
--- trunk/buildroot/package/tiff/Config.in	                        (rev 0)
+++ trunk/buildroot/package/tiff/Config.in	2007-01-11 07:27:37 UTC (rev 17243)
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_TIFF
+	bool "tiff"
+	default n
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_JPEG
+	help
+	  Library for handling TIFF (Tag Image File Format) images.
+
+	  http://www.libtiff.org/

Added: trunk/buildroot/package/tiff/tiff.mk
===================================================================
--- trunk/buildroot/package/tiff/tiff.mk	                        (rev 0)
+++ trunk/buildroot/package/tiff/tiff.mk	2007-01-11 07:27:37 UTC (rev 17243)
@@ -0,0 +1,69 @@
+#############################################################
+#
+# tiff
+#
+#############################################################
+TIFF_VER:=3.8.2
+TIFF_DIR:=$(BUILD_DIR)/tiff-$(TIFF_VER)
+TIFF_SITE:=ftp://ftp.remotesensing.org/libtiff
+TIFF_SOURCE:=tiff-$(TIFF_VER).tar.gz
+TIFF_CAT:=$(ZCAT)
+
+$(DL_DIR)/$(TIFF_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(TIFF_SITE)/$(TIFF_SOURCE)
+
+tiff-source: $(DL_DIR)/$(TIFF_SOURCE)
+
+$(TIFF_DIR)/.unpacked: $(DL_DIR)/$(TIFF_SOURCE)
+	$(TIFF_CAT) $(DL_DIR)/$(TIFF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(TIFF_DIR) package/tiff/ tiff\*.patch
+	$(CONFIG_UPDATE) $(TIFF_DIR)
+	touch $(TIFF_DIR)/.unpacked
+
+$(TIFF_DIR)/.configured: $(TIFF_DIR)/.unpacked
+	(cd $(TIFF_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=$(STAGING_DIR) \
+		--enable-shared \
+		--enable-static \
+		--disable-cxx \
+		--without-x \
+		--with-jpeg-include-dir=$(STAGING_DIR)/include \
+		--with-jpeg-lib-dir=$(STAGING_DIR)/lib \
+		--with-zlib-include-dir=$(STAGING_DIR)/include \
+		--with-zlib-lib-dir=$(STAGING_DIR)/lib \
+	);
+	touch $(TIFF_DIR)/.configured
+
+$(TIFF_DIR)/libtiff/.libs/libtiff.a: $(TIFF_DIR)/.configured
+	$(MAKE) -C $(TIFF_DIR)
+	touch -c $(TIFF_DIR)/libtiff/.libs/libtiff.a
+
+$(STAGING_DIR)/lib/libtiff.so.$(TIFF_VER): $(TIFF_DIR)/libtiff/.libs/libtiff.a
+	$(MAKE) -C $(TIFF_DIR) install
+	touch -c $(STAGING_DIR)/lib/libtiff.so.$(TIFF_VER)
+
+$(TARGET_DIR)/lib/libtiff.so.$(TIFF_VER): $(STAGING_DIR)/lib/libtiff.so.$(TIFF_VER)
+	cp -dpf $(STAGING_DIR)/lib/libtiff.so* $(TARGET_DIR)/lib/
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/lib/libtiff.so.$(TIFF_VER)
+
+tiff: uclibc zlib jpeg $(TARGET_DIR)/lib/libtiff.so.$(TIFF_VER)
+
+tiff-clean:
+	-$(MAKE) -C $(TIFF_DIR) clean
+
+tiff-dirclean:
+	rm -rf $(TIFF_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_TIFF)),y)
+TARGETS+=tiff
+endif
