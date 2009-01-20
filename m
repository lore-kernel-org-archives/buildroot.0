From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 20 Jan 2009 21:34:47 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xerces
Message-ID: <20090120213447.41570770AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-20 21:34:46 +0000 (Tue, 20 Jan 2009)
New Revision: 24928

Log:
Bump xerces-c to latest stable, ARM build now completes

Modified:
   trunk/buildroot/package/xerces/Config.in
   trunk/buildroot/package/xerces/xerces.mk


Changeset:
Modified: trunk/buildroot/package/xerces/Config.in
===================================================================
--- trunk/buildroot/package/xerces/Config.in	2009-01-20 21:33:57 UTC (rev 24927)
+++ trunk/buildroot/package/xerces/Config.in	2009-01-20 21:34:46 UTC (rev 24928)
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XERCES
-	bool "xerces"
+	bool "xerces-c++"
+	select BR2_PACKAGE_LIBICONV
 	help
 	  Xerces-C++ is a validating XML parser written in portable C++.
 

Modified: trunk/buildroot/package/xerces/xerces.mk
===================================================================
--- trunk/buildroot/package/xerces/xerces.mk	2009-01-20 21:33:57 UTC (rev 24927)
+++ trunk/buildroot/package/xerces/xerces.mk	2009-01-20 21:34:46 UTC (rev 24928)
@@ -3,13 +3,42 @@
 # xerces
 #
 #############################################################
-XERCES_VERSION:=2.7.0
-XERCES_SOURCE:=xerces-c-src_2_7_0.tar.gz
-XERCES_SITE:=http://archive.apache.org/dist/xml/xerces-c/source/
+XERCES_VERSION:=3.0.0
+XERCES_SOURCE:=xerces-c-$(XERCES_VERSION).tar.gz
+XERCES_SITE:=http://apache.jumper.nu/xerces/c/3/sources/
 XERCES_CAT:=$(ZCAT)
-XERCES_DIR:=$(BUILD_DIR)/xerces-c-src_2_7_0
-XERCES_BINARY:=lib/libxerces-c.so.27.0
+XERCES_DIR:=$(BUILD_DIR)/xerces-c-$(XERCES_VERSION)
+LIBXERCES_BINARY:=libxerces-c-3.0.so
 
+# XERCES-C will install a number of applications
+# in $(STAGING_DIR)/usr/bin
+# We may want to copy these to the target
+
+XERCES_APPS:= \
+	CreateDOMDocument	\
+	DOMCount		\
+	DOMPrint		\
+	EnumVal			\
+	MemParse		\
+	PParse			\
+	PSVIWriter		\
+	Redirect		\
+	SAX2Count		\
+	SAX2Print		\
+	SAXCount		\
+	SAXPrint		\
+	SCMPrint		\
+	SEnumVal		\
+	StdInParse
+
+# XERCES-C installs a 4.2MB worth of "*.hpp" files
+# in the
+#	"dom", "framework", "internal", "parsers",
+#	"sax", "sax2", "util", "validators", "xinclude"
+# directories
+
+XERCES_INCLUDES:=/usr/include/xercesc
+
 $(DL_DIR)/$(XERCES_SOURCE):
 	 $(call DOWNLOAD,$(XERCES_SITE),$(XERCES_SOURCE))
 
@@ -20,31 +49,52 @@
 # toolchain/patch-kernel.sh $(XERCES_DIR) package/xerces/ \*.patch*
 	touch $(XERCES_DIR)/.unpacked
 
+#	Support for the following should be added later
+#		--with-curl=
+#		--with-icu=
+#		--with-pkgconfigdir=
+
 $(XERCES_DIR)/.configured: $(XERCES_DIR)/.unpacked
-	(cd $(XERCES_DIR)/src/xercesc; rm -rf config.cache; \
+	(cd $(XERCES_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
-		XERCESCROOT=$(XERCES_DIR) \
-		./runConfigure -plinux -minmem \
-		-nsocket -tnative -rpthread \
-		-c$(TARGET_CC) -x$(TARGET_CXX) \
+		./configure		\
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr		\
+		--libdir=/usr/lib	\
+		--libexecdir=/usr/lib	\
+		--sysconfdir=/etc	\
+		--localstatedir=/var	\
+		--enable-shared		\
+		--disable-threads	\
+		--disable-network	\
+		--with-gnu-ld		\
 	)
-	touch $(XERCES_DIR)/.configured
+	touch $@
 
-$(XERCES_DIR)/$(XERCES_BINARY): $(XERCES_DIR)/.configured
-	$(MAKE) XERCESCROOT=$(XERCES_DIR) -C $(XERCES_DIR)/src/xercesc
+$(XERCES_DIR)/src/.libs/$(LIBXERCES_BINARY): $(XERCES_DIR)/.configured
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) LIBS="-liconv" -C $(XERCES_DIR)
 
-$(STAGING_DIR)/$(XERCES_BINARY): $(XERCES_DIR)/$(XERCES_BINARY)
-	$(MAKE) XERCESCROOT=$(XERCES_DIR) PREFIX=$(STAGING_DIR) \
-		-C $(XERCES_DIR)/src/xercesc install
+$(STAGING_DIR)/usr/lib/$(LIBXERCES_BINARY): $(XERCES_DIR)/src/.libs/$(LIBXERCES_BINARY)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR) \
+		-C $(XERCES_DIR) install
+	$(INSTALL) -c $(XERCES_DIR)/src/.libs/libxerces-c.lai	\
+		$(STAGING_DIR)/usr/lib/libxerces-c.la
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libxerces-c.la
 
-$(TARGET_DIR)/usr/$(XERCES_BINARY): $(STAGING_DIR)/$(XERCES_BINARY)
-	cp -a $(STAGING_DIR)/lib/libxerces-c.so* $(TARGET_DIR)/usr/lib
-	cp -a $(STAGING_DIR)/lib/libxerces-depdom.so* $(TARGET_DIR)/usr/lib
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libxerces-c.so.27.0
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libxerces-depdom.so.27.0
+$(TARGET_DIR)/usr/lib/$(LIBXERCES_BINARY): $(STAGING_DIR)/usr/lib/$(LIBXERCES_BINARY)
+	cp -a $(STAGING_DIR)/usr/lib/$(LIBXERCES_BINARY)* $(TARGET_DIR)/usr/lib
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/$(LIBXERCES_BINARY)
 
-xerces: uclibc $(TARGET_DIR)/usr/$(XERCES_BINARY)
+xerces: uclibc $(TARGET_DIR)/usr/lib/$(LIBXERCES_BINARY)
 
+xerces-bin: $(XERCES_DIR)/usr/lib/$(LIBXERCES_BINARY)
+
+xerces-tbin: $(STAGING_DIR)/usr/lib/$(LIBXERCES_BINARY)
+
+xerces-unpacked: $(XERCES_DIR)/.unpacked
+
 xerces-clean:
 	rm -rf $(STAGING_DIR)/usr/include/xercesc
 	rm -f $(STAGING_DIR)/lib/libxerces*
