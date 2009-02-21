From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 21 Feb 2009 13:04:09 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/multimedia/libsndfile
Message-ID: <20090221130409.579DA76564@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-21 13:04:08 +0000 (Sat, 21 Feb 2009)
New Revision: 25408

Log:
libsndfile: bump version and convert to Makefile.autotools.in format

Modified:
   trunk/buildroot/package/multimedia/libsndfile/libsndfile-srconly.patch
   trunk/buildroot/package/multimedia/libsndfile/libsndfile.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/libsndfile/libsndfile-srconly.patch
===================================================================
--- trunk/buildroot/package/multimedia/libsndfile/libsndfile-srconly.patch	2009-02-21 13:04:02 UTC (rev 25407)
+++ trunk/buildroot/package/multimedia/libsndfile/libsndfile-srconly.patch	2009-02-21 13:04:08 UTC (rev 25408)
@@ -1,11 +1,17 @@
---- libsndfile-1.0.17/Makefile.in.orig	2006-12-06 17:26:46.000000000 +0100
-+++ libsndfile-1.0.17/Makefile.in	2006-12-06 17:31:11.000000000 +0100
-@@ -209,7 +209,7 @@
- target_cpu = @target_cpu@
- target_os = @target_os@
- target_vendor = @target_vendor@
--SUBDIRS = man doc Win32 Octave src examples regtest tests
+---
+ Makefile.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: libsndfile-1.0.18/Makefile.in
+===================================================================
+--- libsndfile-1.0.18.orig/Makefile.in
++++ libsndfile-1.0.18/Makefile.in
+@@ -260,7 +260,7 @@
+ top_srcdir = @top_srcdir@
+ DISTCHECK_CONFIGURE_FLAGS = --enable-gcc-werror
+ @BUILD_OCTAVE_MOD_TRUE at octave_dir = Octave
+-SUBDIRS = M4 man doc Win32 src $(octave_dir) examples regtest tests programs
 +SUBDIRS = src
- DIST_SUBDIRS = $(SUBDIRS)
- EXTRA_DIST = reconfigure.mk acinclude.m4 libsndfile.spec.in \
- 			sndfile.pc.in Mingw-make-dist.sh
+ DIST_SUBDIRS = M4 man doc Win32 src Octave examples regtest tests programs
+ EXTRA_DIST = libsndfile.spec.in sndfile.pc.in Mingw-make-dist.sh
+ pkgconfigdir = $(libdir)/pkgconfig

Modified: trunk/buildroot/package/multimedia/libsndfile/libsndfile.mk
===================================================================
--- trunk/buildroot/package/multimedia/libsndfile/libsndfile.mk	2009-02-21 13:04:02 UTC (rev 25407)
+++ trunk/buildroot/package/multimedia/libsndfile/libsndfile.mk	2009-02-21 13:04:08 UTC (rev 25408)
@@ -3,63 +3,11 @@
 # libsndfile
 #
 #############################################################
-LIBSNDFILE_VERSION:=1.0.17
+LIBSNDFILE_VERSION:=1.0.18
 LIBSNDFILE_SOURCE:=libsndfile-$(LIBSNDFILE_VERSION).tar.gz
 LIBSNDFILE_SITE:=http://www.mega-nerd.com/libsndfile
-LIBSNDFILE_DIR:=$(BUILD_DIR)/libsndfile-$(LIBSNDFILE_VERSION)
-LIBSNDFILE_BINARY:=src/.libs/libsndfile.so
-LIBSNDFILE_TARGET_BINARY:=usr/lib/libsndfile.so
+LIBSNDFILE_LIBTOOL_PATCH:=NO
+LIBSNDFILE_INSTALL_STAGING:=YES
+LIBSNDFILE_DEPENDENCIES:=uclibc
 
-$(DL_DIR)/$(LIBSNDFILE_SOURCE):
-	$(call DOWNLOAD,$(LIBSNDFILE_SITE),$(LIBSNDFILE_SOURCE))
-
-$(LIBSNDFILE_DIR)/.unpacked: $(DL_DIR)/$(LIBSNDFILE_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(LIBSNDFILE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBSNDFILE_DIR) package/multimedia/libsndfile/ \*.patch
-	$(CONFIG_UPDATE) $(LIBSNDFILE_DIR)
-	touch $@
-
-$(LIBSNDFILE_DIR)/.configured: $(LIBSNDFILE_DIR)/.unpacked
-	(cd $(LIBSNDFILE_DIR); rm -f config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-	)
-	touch $@
-
-$(LIBSNDFILE_DIR)/$(LIBSNDFILE_BINARY): $(LIBSNDFILE_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(LIBSNDFILE_DIR)
-
-$(TARGET_DIR)/$(LIBSNDFILE_TARGET_BINARY): $(LIBSNDFILE_DIR)/$(LIBSNDFILE_BINARY)
-	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(LIBSNDFILE_DIR) install
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LIBSNDFILE_DIR) install
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -Rf $(TARGET_DIR)/usr/share/man
-	rm -Rf $(STAGING_DIR)/usr/share/man
-endif
-
-libsndfile: uclibc $(TARGET_DIR)/$(LIBSNDFILE_TARGET_BINARY)
-
-libsndfile-source: $(DL_DIR)/$(LIBSNDFILE_SOURCE)
-
-libsndfile-clean:
-	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(LIBSNDFILE_DIR) uninstall
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LIBSNDFILE_DIR) uninstall
-	-$(MAKE) -C $(LIBSNDFILE_DIR) clean
-
-libsndfile-dirclean:
-	rm -rf $(LIBSNDFILE_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
-TARGETS+=libsndfile
-endif
+$(eval $(call AUTOTARGETS,package/multimedia,libsndfile))
