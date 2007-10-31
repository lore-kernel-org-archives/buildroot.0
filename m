From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 30 Oct 2007 23:36:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libvorbis
Message-ID: <20071031063604.7DB0AA456F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-30 23:36:04 -0700 (Tue, 30 Oct 2007)
New Revision: 20344

Log:
Fix Tremor (integer version of libvorbis) so it builds

Modified:
   trunk/buildroot/package/libvorbis/Config.in
   trunk/buildroot/package/libvorbis/libvorbis.mk


Changeset:
Modified: trunk/buildroot/package/libvorbis/Config.in
===================================================================
--- trunk/buildroot/package/libvorbis/Config.in	2007-10-31 06:35:06 UTC (rev 20343)
+++ trunk/buildroot/package/libvorbis/Config.in	2007-10-31 06:36:04 UTC (rev 20344)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBVORBIS
 	bool "libvorbis"
 	default n
+	depends on BR2_PACKAGE_LIBOGG
 	help
 	  Library for the Vorbis open source audio decoder
 	  Ogg Vorbis is a fully open, non-proprietary, patent-and-royalty-free,
@@ -29,3 +30,6 @@
 	help
 	  Use the Tremor fixed point implementation
 	  Not yet implemented
+
+comment "libvorbis requires the package libogg to build"
+	depends on !BR2_PACKAGE_LIBVORBIS

Modified: trunk/buildroot/package/libvorbis/libvorbis.mk
===================================================================
--- trunk/buildroot/package/libvorbis/libvorbis.mk	2007-10-31 06:35:06 UTC (rev 20343)
+++ trunk/buildroot/package/libvorbis/libvorbis.mk	2007-10-31 06:36:04 UTC (rev 20344)
@@ -56,7 +56,7 @@
 	cp -dpf $(LIBVORBIS_DIR)/include/vorbis/*.h \
 		$(TARGET_DIR)/usr/include/vorbis
 
-libvorbis: uclibc pkgconfig $(TARGET_DIR)/usr/lib/libvorbis.so
+libvorbis: uclibc pkgconfig libogg $(TARGET_DIR)/usr/lib/libvorbis.so
 
 libvorbis-source: $(DL_DIR)/$(LIBVORBIS_SOURCE)
 
@@ -74,20 +74,20 @@
 ############################################################
 
 TREMOR_TRUNK:=http://svn.xiph.org/trunk/Tremor/
-TREMOR_VERSION:=-svn-$(DATE)
+TREMOR_VERSION:=svn-$(DATE)
 TREMOR_NAME:=Tremor-$(TREMOR_VERSION)
 TREMOR_DIR:=$(BUILD_DIR)/$(TREMOR_NAME)
 TREMOR_SOURCE:=$(TREMOR_NAME).tar.bz2
+TREMOR_CAT=$(BZCAT)
 
-
 $(DL_DIR)/$(TREMOR_SOURCE):
 	(cd $(BUILD_DIR); \
 		$(SVN_CO) $(TREMOR_TRUNK); \
 		mv -f Tremor $(TREMOR_NAME); \
-		tar -cvf $(TREMOR_NAME).tar $(TREMOR_DIR); \
+		tar -cvf $(TREMOR_NAME).tar $(TREMOR_NAME); \
 		bzip2 $(TREMOR_NAME).tar; \
 		rm -rf $(TREMOR_DIR); \
-		mv $(TREMOR_NAME).tar.bz2 $(DL_DIR)/$(TREMOR_SOURCE); \
+		mv $(TREMOR_SOURCE) $(DL_DIR)/$(TREMOR_SOURCE); \
 	)
 
 $(TREMOR_DIR)/.source: $(DL_DIR)/$(TREMOR_SOURCE)
@@ -99,7 +99,7 @@
 		$(TARGET_CONFIGURE_ARGS) \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		./configure \
+		./autogen.sh \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
@@ -129,7 +129,7 @@
 	cp -dpf $(TREMOR_DIR)/include/vorbis/*.h \
 		$(TARGET_DIR)/usr/include/vorbis
 
-tremor: uclibc pkgconfig $(TARGET_DIR)/usr/lib/tremor.so
+tremor: uclibc pkgconfig libogg $(TARGET_DIR)/usr/lib/tremor.so
 
 tremor-source: $(DL_DIR)/$(TREMOR_SOURCE)
 
