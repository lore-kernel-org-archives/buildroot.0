From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 24 Apr 2007 06:43:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libsndfile
Message-ID: <20070424134316.1B8DE4807E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-04-24 06:43:15 -0700 (Tue, 24 Apr 2007)
New Revision: 18517

Log:
libsndfile package. Closes #1325

Added:
   trunk/buildroot/package/libsndfile/
   trunk/buildroot/package/libsndfile/Config.in
   trunk/buildroot/package/libsndfile/libsndfile-srconly.patch
   trunk/buildroot/package/libsndfile/libsndfile.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-04-24 13:42:03 UTC (rev 18516)
+++ trunk/buildroot/package/Config.in	2007-04-24 13:43:15 UTC (rev 18517)
@@ -236,6 +236,7 @@
 if BR2_AUDIO_SUPPORT
 source "package/asterisk/Config.in"
 source "package/libmad/Config.in"
+source "package/libsndfile/Config.in"
 source "package/mpg123/Config.in"
 endif
 

Added: trunk/buildroot/package/libsndfile/Config.in
===================================================================
--- trunk/buildroot/package/libsndfile/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libsndfile/Config.in	2007-04-24 13:43:15 UTC (rev 18517)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBSNDFILE
+	bool "libsndfile"
+	default n
+	help
+	    Libsndfile is a C library for reading and writing files containing 
+	    sampled sound (such as MS Windows WAV and the Apple/SGI AIFF format) 
+	    through one standard library interface.
+

Added: trunk/buildroot/package/libsndfile/libsndfile-srconly.patch
===================================================================
--- trunk/buildroot/package/libsndfile/libsndfile-srconly.patch	                        (rev 0)
+++ trunk/buildroot/package/libsndfile/libsndfile-srconly.patch	2007-04-24 13:43:15 UTC (rev 18517)
@@ -0,0 +1,11 @@
+--- libsndfile-1.0.17/Makefile.in.orig	2006-12-06 17:26:46.000000000 +0100
++++ libsndfile-1.0.17/Makefile.in	2006-12-06 17:31:11.000000000 +0100
+@@ -209,7 +209,7 @@
+ target_cpu = @target_cpu@
+ target_os = @target_os@
+ target_vendor = @target_vendor@
+-SUBDIRS = man doc Win32 Octave src examples regtest tests
++SUBDIRS = src
+ DIST_SUBDIRS = $(SUBDIRS)
+ EXTRA_DIST = reconfigure.mk acinclude.m4 libsndfile.spec.in \
+ 			sndfile.pc.in Mingw-make-dist.sh

Added: trunk/buildroot/package/libsndfile/libsndfile.mk
===================================================================
--- trunk/buildroot/package/libsndfile/libsndfile.mk	                        (rev 0)
+++ trunk/buildroot/package/libsndfile/libsndfile.mk	2007-04-24 13:43:15 UTC (rev 18517)
@@ -0,0 +1,61 @@
+#############################################################
+#
+# libsndfile
+#
+#############################################################
+LIBSNDFILE_VER:=1.0.17
+LIBSNDFILE_SOURCE:=libsndfile-$(LIBSNDFILE_VER).tar.gz
+LIBSNDFILE_SITE:=http://www.mega-nerd.com/libsndfile/$(LIBUSB_SOURCE)
+LIBSNDFILE_DIR:=$(BUILD_DIR)/libsndfile-$(LIBSNDFILE_VER)
+LIBSNDFILE_BINARY:=libsndfile.sa
+LIBSNDFILE_TARGET_BINARY:=usr/lib/libsndfile.so
+
+$(DL_DIR)/$(LIBSNDFILE_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LIBSNDFILE_SITE)/$(LIBSNDFILE_SOURCE)
+
+$(LIBSNDFILE_DIR)/.source: $(DL_DIR)/$(LIBSNDFILE_SOURCE)
+	$(ZCAT) $(DL_DIR)/$(LIBSNDFILE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LIBSNDFILE_DIR) package/libsndfile/ \*.patch
+	touch $(LIBSNDFILE_DIR)/.source
+
+$(LIBSNDFILE_DIR)/.configured: $(LIBSNDFILE_DIR)/.source
+	(cd $(LIBSNDFILE_DIR); \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--sysconfdir=/etc \
+	);
+	touch $(LIBSNDFILE_DIR)/.configured;
+
+$(LIBSNDFILE_DIR)/$(LIBSNDFILE_BINARY): $(LIBSNDFILE_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(LIBSNDFILE_DIR)
+
+$(TARGET_DIR)/$(LIBSNDFILE_TARGET_BINARY): $(LIBSNDFILE_DIR)/$(LIBSNDFILE_BINARY)
+	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LIBSNDFILE_DIR) install
+	rm -Rf $(TARGET_DIR)/usr/man
+
+libsndfile: uclibc $(TARGET_DIR)/$(LIBSNDFILE_TARGET_BINARY)
+
+libsndfile-source: $(DL_DIR)/$(LIBSNDFILE_SOURCE)
+
+libsndfile-clean:
+	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LIBSNDFILE_DIR) uninstall
+	-$(MAKE) -C $(LIBSNDFILE_DIR) clean
+
+libsndfile-dirclean:
+	rm -rf $(LIBSNDFILE_DIR)
+
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LIBSNDFILE)),y)
+TARGETS+=libsndfile
+endif
+
