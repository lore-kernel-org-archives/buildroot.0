From: correa at uclibc.org <correa@uclibc.org>
Date: Fri, 27 Jun 2008 20:55:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20080628035514.C44FF3C658@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-06-27 20:55:12 -0700 (Fri, 27 Jun 2008)
New Revision: 22545

Log:
Greatly improve Qtopia/Qt Embedded for Linux build. Fix build, reduce the number of variables, add OpenSSL, XmlPatterns, Webkit and individual sql drivers to build. Improve help strings. Sorry for the large commit

Added:
   trunk/buildroot/package/qtopia4/Config.sql.in

Modified:
   trunk/buildroot/package/qtopia4/Config.in
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2008-06-28 03:22:35 UTC (rev 22544)
+++ trunk/buildroot/package/qtopia4/Config.in	2008-06-28 03:55:12 UTC (rev 22545)
@@ -12,6 +12,8 @@
 	bool "Compile with debug support"
 	default n
 	depends on BR2_PACKAGE_QTOPIA4
+	help
+	  If unsure, say N.
 
 choice
 	prompt "Library type"
@@ -22,8 +24,19 @@
 
 config BR2_PACKAGE_QTOPIA4_SHARED
 	bool "Shared library"
+	help
+	  Create and use shared Qt libraries.
+	  If you have multiple programs that depend on Qt or intend to use
+	  plugins, say Y.
+
 config BR2_PACKAGE_QTOPIA4_STATIC
 	bool "Static Library"
+	help
+	  Create and use static Qt libraries.
+	  If you don't have multiple programs on the target that depends on
+	  Qt, then this will save you quite some of storage space.
+	  If unsure, say Y.
+
 endchoice
 
 choice
@@ -71,11 +84,21 @@
 
 config BR2_PACKAGE_QTOPIA4_QT3SUPPORT
 	bool "Compatibility with Qt3"
-	default y
+	default n
 	depends on BR2_PACKAGE_QTOPIA4
 	help
-	  Turns on support for older Qt3.
+	  Turns on support for older Qt3. This will create an additional 
+	  library with proxy code and increase the space required on target.
+	  If unsure say n.
 
+config BR2_PACKAGE_QTOPIA4_DEPTHS
+	string "color depths to support"
+	default "-depths 24,16,8"
+	depends on BR2_PACKAGE_QTOPIA4
+	help
+	  Which color depths to support for the library. Default is "-depths
+	  24,16,8". Different depths are specified by a comma separated list.
+
 config BR2_PACKAGE_QTOPIA4_GIF
 	bool "Enable GIF support"
 	default n
@@ -99,14 +122,19 @@
 
 config BR2_PACKAGE_QTOPIA4_NOJPEG
 	bool "No jpeg support"
+	help
+	  Disable JPEG support
 
 config BR2_PACKAGE_QTOPIA4_SYSTEMJPEG
-	bool "Use system libjpeg"
 	select BR2_PACKAGE_JPEG
+	bool "System libjpeg"
+	help
+	  Link against system libjpeg
 
 config BR2_PACKAGE_QTOPIA4_QTJPEG
-	bool "Use Qt libjpeg"
-
+	bool "Use Qt bundled libjpeg"
+	help
+	  Link against libjpeg proveded with Qt
 endchoice
 
 choice
@@ -120,12 +148,11 @@
 	bool "No PNG support"
 
 config BR2_PACKAGE_QTOPIA4_SYSTEMPNG
-	bool "Use system libpng"
+	bool "System libpng"
 	select BR2_PACKAGE_LIBPNG
 
 config BR2_PACKAGE_QTOPIA4_QTPNG
 	bool "Use Qt bundled libpng"
-
 endchoice
 
 choice
@@ -139,32 +166,13 @@
 	bool "No TIFF support"
 
 config BR2_PACKAGE_QTOPIA4_SYSTEMTIFF
-	bool "Use system libtiff"
+	bool "System libtiff"
 	select BR2_PACKAGE_TIFF
 
 config BR2_PACKAGE_QTOPIA4_QTTIFF
 	bool "Use Qt bundled libtiff"
-
 endchoice
 
-config BR2_PACKAGE_QTOPIA4_SVG
-	bool "Enable SVG support"
-	depends on BR2_PACKAGE_QTOPIA4
-	help
-	  Enable the QtSvg library.
-
-config BR2_PACKAGE_QTOPIA4_SQL
-	bool "Enable SQL support"
-	depends on BR2_PACKAGE_QTOPIA4
-	help
-	  Enable all the SQL drivers it QtSql library.
-
-config BR2_PACKAGE_QTOPIA4_OPENSSL
-	bool "Enable OpenSSL support"
-	depends on BR2_PACKAGE_QTOPIA4
-	help
-	  Enable support for the OpenSSL encryption library.
-
 choice
 	prompt "zlib support"
 	depends on BR2_PACKAGE_QTOPIA4
@@ -172,27 +180,44 @@
 	help
 	  Select zlib support.
 
-config BR2_PACKAGE_QTOPIA4_NOZLIB
-        bool
-	prompt "no zlib"
-	help
-	  Use the zlib bundled with Qt.
-
-
 config BR2_PACKAGE_QTOPIA4_QTZLIB
-	bool
-	prompt "Qt zlib"
+	bool "Qt zlib"
 	help
 	  Use the zlib bundled with Qt.
-
+	
 config BR2_PACKAGE_QTOPIA4_SYSTEMZLIB
-	bool
+	bool "System zlib"
 	select BR2_PACKAGE_ZLIB
-	prompt "System zlib"
 	help
 	  Use the shared zlib from the system.
 endchoice
+								    
+choice
+	prompt "freetype2 support"
+	depends on BR2_PACKAGE_QTOPIA4
+	default BR2_PACKAGE_QTOPIA4_NOFREETYPE
+	help
+	  Select freetype2 support.
 
+config BR2_PACKAGE_QTOPIA4_NOFREETYPE
+        bool "no freetype2 support"
+	help
+	  Do not compile in Freetype2 support.
+
+
+config BR2_PACKAGE_QTOPIA4_QTFREETYPE
+	bool "Qt freetype2"
+	help
+	  Use the libfreetype bundled with Qt.
+	
+config BR2_PACKAGE_QTOPIA4_SYSTEMFREETYPE
+	bool "System freetype2"
+	select BR2_PACKAGE_FREETYPE
+	help
+	  Use shared libfreetype from the target system.
+	  See http://www.freetype.org/
+endchoice
+	
 config BR2_PACKAGE_QTOPIA4_EMB_PLATFORM
 	string "The embedded platform we are making Qtopia4 for"
 	default "arm"	if BR2_arm
@@ -213,4 +238,50 @@
 	default "generic"	if BR2_sparc
 	depends on BR2_PACKAGE_QTOPIA4
 	help
-	  The platform.
+	  The target platform.
+
+menuconfig BR2_PACKAGE_QTOPIA4_SQL_MODULE
+	bool "SQL Module"
+	default n
+	depends on BR2_PACKAGE_QTOPIA4
+	help
+	  Compile Qtopia SQL Module
+if BR2_PACKAGE_QTOPIA4_SQL_MODULE
+source "package/qtopia4/Config.sql.in"
+endif
+
+config BR2_PACKAGE_QTOPIA4_XMLPATTERNS
+	bool "XML Patterns Module"
+	default n
+	depends on BR2_PACKAGE_QTOPIA4
+	help
+	  Build QtXmlPatterns module.
+	  If unsure, say n
+
+config BR2_PACKAGE_QTOPIA4_SVG
+	bool "SVG Module"
+	default n
+	depends on BR2_PACKAGE_QTOPIA4
+	help
+	  Build the SVG module.
+	  If unsure, say n
+
+config BR2_PACKAGE_QTOPIA4_WEBKIT
+	bool "WebKit Module"
+	default n
+	depends on BR2_PACKAGE_QTOPIA4
+	help
+	  Build the WebKit module.
+	  If unsure, say n.
+
+config BR2_PACKAGE_QTOPIA4_OPENSSL
+	bool "Enable OpenSSL support"
+	depends on BR2_PACKAGE_QTOPIA4
+	select BR2_PACKAGE_OPENSSL
+	default n
+	help
+	  Enable support for the OpenSSL encryption library. If you use
+	  QSslSocket say y here, otherwise, say no to save space on the
+	  target.
+	  If unsure, say n.
+

Added: trunk/buildroot/package/qtopia4/Config.sql.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.sql.in	                        (rev 0)
+++ trunk/buildroot/package/qtopia4/Config.sql.in	2008-06-28 03:55:12 UTC (rev 22545)
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_QTOPIA4_MYSQL
+	bool "MySQL Driver"
+	default n
+	help
+	  Build MySQL driver
+	  If unsure, say n.
+
+config BR2_PACKAGE_QTOPIA4_IBASE
+	bool "iBase Driver"
+	default n
+	help
+	  Build iBase driver
+	  If unsure, say n.
+
+config BR2_PACKAGE_QTOPIA4_ODBC
+	bool "ODBC Driver"
+	default n
+	help
+	  Build ODBC driver
+	  If unsure, say n.
+
+config BR2_PACKAGE_QTOPIA4_PSQL
+	bool "PostgreSQL Driver"
+	default n
+	help
+	  Build PostgreSQL driver
+	  If unsure, say n.
+
+config BR2_PACKAGE_QTOPIA4_SQLITE
+	bool "SQLite 3 Driver"
+	default n
+	help
+	  Build SQLite driver
+	  If unsure, say n.
+
+config BR2_PACKAGE_QTOPIA4_SQLITE2
+	bool "SQLite 2 Driver"
+	default n
+	help
+	  Build SQLite 2 driver
+	  If unsure, say n.
+

Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-06-28 03:22:35 UTC (rev 22544)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-06-28 03:55:12 UTC (rev 22545)
@@ -24,20 +24,20 @@
 BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD)))
 #"))
 
+QTOPIA4_CONFIGURE:=#empty
+
 # What to download, free or commercial version.
 ifneq ($(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME),)
 QTOPIA4_SITE:=http://$(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME):$(BR2_QTOPIA4_COMMERCIAL_PASSWORD)@dist.trolltech.com/$(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)
 QTOPIA4_SOURCE:=qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION).tar.bz2
 QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION)
-QTOPIA4_NO_SQL_OCI:=-no-sql-oci
-QTOPIA4_NO_SQL_TDS:=-no-sql-tds
-QTOPIA4_NO_SQL_DB2:=-no-sql-db2
+QTOPIA4_CONFIGURE+= -no-sql-oci -no-sql-tds -no-sql-db2
 else # Good, good, we are free:
 QTOPIA4_SITE=ftp://ftp.trolltech.com/qt/source
 QTOPIA4_SOURCE:=qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION).tar.bz2
 QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION)
 ifeq ($(BR2_PACKAGE_QTOPIA4_GPL_LICENSE_APPROVED),y)
-QTOPIA4_APPROVE_GPL_LICENSE:=-confirm-license
+QTOPIA4_CONFIGURE+= -confirm-license
 endif
 endif
 
@@ -54,19 +54,19 @@
 QTOPIA4_QCONFIG_FILE_LOCATION:=/src/corelib/global/
 
 ifeq ($(BR2_LARGEFILE),y)
-QTOPIA4_LARGEFILE=-largefile
+QTOPIA4_CONFIGURE+= -largefile
 else
-QTOPIA4_LARGEFILE=-no-largefile
+QTOPIA4_CONFIGURE+= -no-largefile
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_QT3SUPPORT),y)
-QTOPIA4_QT3SUPPORT=-qt3support
+QTOPIA4_CONFIGURE+= -qt3support
 else
-QTOPIA4_QT3SUPPORT=-no-qt3support
+QTOPIA4_CONFIGURE+= -no-qt3support
 endif
 
 ifeq ($(BR2_PACKAGE_TSLIB),y)
-QTOPIA4_TSLIB=-qt-mouse-tslib
+QTOPIA4_CONFIGURE+= -qt-mouse-tslib
 QTOPIA4_DEP_LIBS+=tslib
 QTOPIA4_TSLIB_DEB="-D TSLIBMOUSEHANDLER_DEBUG"
 QTOPIA4_TSLIB_DEB:=$(strip $(subst ",, $(QTOPIA4_TSLIB_DEB)))
@@ -74,116 +74,147 @@
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_DEBUG),y)
-QTOPIA4_DEBUG="-debug $(QTOPIA4_TSLIB_DEB)"
+QTOPIA4_CONFIGURE+= "-debug $(QTOPIA4_TSLIB_DEB)"
 else
-QTOPIA4_DEBUG=-release
+QTOPIA4_CONFIGURE+= -release
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
-QTOPIA4_SHARED=-shared
+QTOPIA4_CONFIGURE+= -shared
 else
-QTOPIA4_SHARED=-static
+QTOPIA4_CONFIGURE+= -static
 endif
 
 ifeq ($(BR2_ENDIAN),"LITTLE")
-QTOPIA4_ENDIAN=-little-endian
+QTOPIA4_CONFIGURE+= -little-endian
 else
-QTOPIA4_ENDIAN=-big-endian
+QTOPIA4_CONFIGURE+= -big-endian
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_GIF),y)
-QTOPIA4_GIF=-qt-gif
+QTOPIA4_CONFIGURE+= -qt-gif
 else
-QTOPIA4_GIF=-no-gif
+QTOPIA4_CONFIGURE+= -no-gif
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_LIBMNG),y)
-QTOPIA4_MNG=-qt-libmng
+QTOPIA4_CONFIGURE+= -qt-libmng
 else
-QTOPIA4_MNG=-no-libmng
+QTOPIA4_CONFIGURE+= -no-libmng
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_QTZLIB),y)
-QTOPIA4_ZLIB=-qt-zlib
+QTOPIA4_CONFIGURE+= -qt-zlib
 else
 ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMZLIB),y)
-QTOPIA4_ZLIB=-system-zlib
+QTOPIA4_CONFIGURE+= -system-zlib
 QTOPIA4_DEP_LIBS+=zlib
-else
-QTOPIA4_ZLIB=-no-zlib
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_QTJPEG),y)
-QTOPIA4_JPEG=-qt-libjpeg
+QTOPIA4_CONFIGURE+= -qt-libjpeg
 else
 ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMJPEG),y)
-QTOPIA4_JPEG=-system-libjpeg
+QTOPIA4_CONFIGURE+= -system-libjpeg
 QTOPIA4_DEP_LIBS+=jpeg
 else
-QTOPIA4_JPEG=-no-libjpeg
+QTOPIA4_CONFIGURE+= -no-libjpeg
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_QTPNG),y)
-QTOPIA4_PNG=-qt-libpng
+QTOPIA4_CONFIGURE+= -qt-libpng
 else
 ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMPNG),y)
-QTOPIA4_PNG=-system-libpng
+QTOPIA4_CONFIGURE+= -system-libpng
 QTOPIA4_DEP_LIBS+=libpng
 else
-QTOPIA4_PNG=-no-libpng
+QTOPIA4_CONFIGURE+= -no-libpng
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_QTTIFF),y)
-QTOPIA4_TIFF=-qt-libtiff
+QTOPIA4_CONFIGURE+= -qt-libtiff
 else
 ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMTIFF),y)
-QTOPIA4_TIFF=-system-libtiff
+QTOPIA4_CONFIGURE+= -system-libtiff
 QTOPIA4_DEP_LIBS+=tiff
 else
-QTOPIA4_TIFF=-no-libtiff
+QTOPIA4_CONFIGURE+= -no-libtiff
 endif
 endif
 
+
+ifeq ($(BR2_PACKAGE_QTOPIA4_QTFREETYPE),y)
+QTOPIA4_CONFIGURE+= -qt-freetype
+else
+ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMFREETYPE),y)
+QTOPIA4_CONFIGURE+= -system-freetype
+QTOPIA4_CONFIGURE+= -I $(FREETYPE_DIR)/include
+QTOPIA4_DEP_LIBS+=freetype
+else
+QTOPIA4_CONFIGURE+= -no-freetype
+endif
+endif
+
+
 ifeq ($(BR2_PACKAGE_QTOPIA4_OPENSSL),y)
-QTOPIA4_OPENSSL=-openssl
+QTOPIA4_CONFIGURE+= -openssl
 QTOPIA4_DEP_LIBS+=openssl
 else
-QTOPIA4_OPENSSL=-no-openssl
+QTOPIA4_CONFIGURE+= -no-openssl
 endif
 
+# Qt SQL Drivers
+ifeq ($(BR2_PACKAGE_QTOPIA4_SQL_MODULE),y)
+ifeq ($(BR2_PACKAGE_QTOPIA4_IBASE),y)
+QTOPIA4_CONFIGURE+= -qt-sql-ibase
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_MYSQL),y)
+QTOPIA4_CONFIGURE+= -qt-sql-mysql
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_ODBC),y)
+QTOPIA4_CONFIGURE+= -qt-sql-odbc
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_PSQL),y)
+QTOPIA4_CONFIGURE+= -qt-sql-psql
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_SQLITE),y)
+QTOPIA4_CONFIGURE+= -qt-sql-sqlite
+endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_SQLITE2),y)
+QTOPIA4_CONFIGURE+= -qt-sql-sqlite2
+endif
+# By default, no SQL driver is turned on by configure.
+endif
+
+ifeq ($(BR2_PACKAGE_QTOPIA4_XMLPATTERNS),y)
+QTOPIA4_CONFIGURE+= -xmlpatterns
+else
+QTOPIA4_CONFIGURE+= -no-xmlpatterns
+endif
+
 ifeq ($(BR2_PACKAGE_QTOPIA4_SVG),y)
-QTOPIA4_SVG=-svg
+QTOPIA4_CONFIGURE+= -svg
 else
-QTOPIA4_SVG=-no-svg
+QTOPIA4_CONFIGURE+= -no-svg
 endif
 
-ifeq ($(BR2_PACKAGE_QTOPIA4_SQL),y)
-QTOPIA4_SQL_IBASE=-qt-sql-ibase
-QTOPIA4_SQL_MYSQL=-qt-sql-mysql
-QTOPIA4_SQL_ODBC=-qt-sql-odbc
-QTOPIA4_SQL_PSQL=-qt-sql-psql
-QTOPIA4_SQL_SQLITE=-qt-sql-sqlite
-QTOPIA4_SQL_SQLITE2=-qt-sql-sqlite2
+ifeq ($(BR2_PACKAGE_QTOPIA4_WEBKIT),y)
+QTOPIA4_CONFIGURE+= -webkit
 else
-QTOPIA4_SQL_IBASE=-no-sql-ibase
-QTOPIA4_SQL_MYSQL=-no-sql-mysql
-QTOPIA4_SQL_ODBC=-no-sql-odbc
-QTOPIA4_SQL_PSQL=-no-sql-psql
-QTOPIA4_SQL_SQLITE=-no-sql-sqlite
-QTOPIA4_SQL_SQLITE2=-no-sql-sqlite2
+QTOPIA4_CONFIGURE+= -no-webkit
 endif
 
-QTOPIA4_DEBUG:=$(strip $(subst ",, $(QTOPIA4_DEBUG)))
+QTOPIA4_CONFIGURE:=$(strip $(subst ",, $(QTOPIA4_CONFIGURE)))
 #"))
 BR2_PACKAGE_QTOPIA4_EMB_PLATFORM:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)))
 #"))
 
 
 # Variable for other Qt applications to use
-QTOPIA4_QMAKE:=$(STAGING_DIR)/usr/bin/qmake
+QTOPIA4_QMAKE:=$(STAGING_DIR)/usr/bin/qmake -spec qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++
 
 $(DL_DIR)/$(QTOPIA4_SOURCE):
 	$(WGET) -P $(DL_DIR) $(QTOPIA4_SITE)/$(QTOPIA4_SOURCE)
@@ -204,7 +235,16 @@
 	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QTOPIA4_TARGET_DIR)/configure
 endif
 	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QTOPIA4_TARGET_DIR)/configure
-	$(SED) 's,-O2,$(TARGET_CFLAGS),' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	#$(SED) 's,-O2,$(TARGET_CFLAGS),' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+        # Fix compiler path
+	$(SED) '\,QMAKE_CC *=, c\QMAKE_CC = $(TARGET_CC)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '\,QMAKE_CXX *=, c\QMAKE_CXX = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '\,QMAKE_LINK *=, c\QMAKE_LINK = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '\,QMAKE_LINK_SHLIB *=, c\QMAKE_LINK_SHLIB = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '\,QMAKE_AR *=, c\QMAKE_AR = $(TARGET_CROSS)ar cqs' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '\,QMAKE_RANLIB *=, c\QMAKE_RANLIB = $(TARGET_RANLIB)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	$(SED) '\,QMAKE_STRIP *=, c\QMAKE_STRIP = $(TARGET_CROSS)strip' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
+	
 	-[ -f $(QTOPIA4_QCONFIG_FILE) ] && cp $(QTOPIA4_QCONFIG_FILE) \
 		$(QTOPIA4_TARGET_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
 	(cd $(QTOPIA4_TARGET_DIR); rm -rf config.cache; \
@@ -213,30 +253,11 @@
 		-verbose \
 		-embedded $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM) \
 		$(QTOPIA4_QCONFIG_COMMAND) \
-		$(QTOPIA4_DEBUG) \
-		$(QTOPIA4_SHARED) \
+		$(QTOPIA4_CONFIGURE) \
 		-no-stl \
 		-no-cups \
 		-no-nis \
-		-no-freetype \
 		-no-accessibility \
-		$(QTOPIA4_MNG) \
-		$(QTOPIA4_GIF) \
-		$(QTOPIA4_JPEG) \
-		$(QTOPIA4_PNG) \
-		$(QTOPIA4_TIFF) \
-		$(QTOPIA4_ZLIB) \
-		$(QTOPIA4_SVG) \
-		$(QTOPIA4_SQL_IBASE) \
-		$(QTOPIA4_SQL_MYSQL) \
-		$(QTOPIA4_SQL_ODBC) \
-		$(QTOPIA4_SQL_PSQL) \
-		$(QTOPIA4_SQL_SQLITE) \
-		$(QTOPIA4_SQL_SQLITE2) \
-		$(QTOPIA4_NO_SQL_DB2) \
-		$(QTOPIA4_NO_SQL_OCI) \
-		$(QTOPIA4_NO_SQL_TDS) \
-		-no-webkit \
 		-no-separate-debug-info \
 		-prefix /usr \
 		-hostprefix $(STAGING_DIR)/usr \
@@ -244,11 +265,6 @@
 		-no-rpath \
 		-nomake examples \
 		-nomake demos \
-		$(QTOPIA4_QT3SUPPORT) \
-		$(QTOPIA4_TSLIB) \
-		$(QTOPIA4_LARGEFILE) \
-		$(QTOPIA4_ENDIAN) \
-		$(QTOPIA4_APPROVE_GPL_LICENSE) \
 	)
 	touch $@
 
@@ -292,6 +308,11 @@
 qtopia4-dirclean:
 	rm -rf $(QTOPIA4_TARGET_DIR)
 
+qtopia4-status:
+	@echo "QTOPIA4_QMAKE:               " $(QTOPIA4_QMAKE)
+	@echo "QTOPIA4_DEP_LIBS:            " $(QTOPIA4_DEP_LIBS)
+	@echo "FREETYPE_DIR:		    " $(FREETYPE_DIR)
+
 #############################################################
 #
 # Toplevel Makefile options
