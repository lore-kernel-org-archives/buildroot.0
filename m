From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Fri, 25 Apr 2008 04:45:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20080425114529.8A5A03C75B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-25 04:45:28 -0700 (Fri, 25 Apr 2008)
New Revision: 21857

Log:
reverting r21851

Modified:
   trunk/buildroot/package/qtopia4/Config.in
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2008-04-25 08:43:01 UTC (rev 21856)
+++ trunk/buildroot/package/qtopia4/Config.in	2008-04-25 11:45:28 UTC (rev 21857)
@@ -12,7 +12,6 @@
 	bool "Compile with debug support"
 	default n
 	depends BR2_PACKAGE_QTOPIA4
-	help
 
 choice
 	prompt "Library type"
@@ -60,7 +59,7 @@
 	default ""
 	depends BR2_PACKAGE_QTOPIA4 && BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
 	help
-	    Commercial users can download their source directly by providing a username.
+	  Commercial users can download their source directly by providing a username.
 
 
 config BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD
@@ -68,23 +67,15 @@
 	default ""
 	depends BR2_PACKAGE_QTOPIA4 && BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
 	help
-	    Commercial users can download their source directly by providing a password.
+	  Commercial users can download their source directly by providing a password.
 
 config BR2_PACKAGE_QTOPIA4_QT3SUPPORT
 	bool "Compatibility with Qt3"
 	default y
 	depends BR2_PACKAGE_QTOPIA4
 	help
-	    Turns on support for older Qt3.
+	  Turns on support for older Qt3.
 
-config BR2_PACKAGE_QTOPIA4_DEPTHS
-	string "color depths to support"
-	default "-depths 8"
-	depends BR2_PACKAGE_QTOPIA4
-	help
-	    Which color depths to support for the library. Default is "-depths
-	    8". Is specified by a comma separated list, i.e. -depths 24,16,8.
-
 config BR2_PACKAGE_QTOPIA4_GIF
 	bool "Enable GIF support"
 	default n
@@ -95,39 +86,80 @@
 config BR2_PACKAGE_QTOPIA4_LIBMNG
 	bool "Enable libmng support"
 	default n
-	select BR2_PACKAGE_LIBPNG
 	depends BR2_PACKAGE_QTOPIA4
 	help
 	  This compiles and installs the plugin for MNG support.
 
 choice
-	prompt "libjpeg support"
+	prompt "JPEG support"
 	depends BR2_PACKAGE_QTOPIA4
 	default BR2_PACKAGE_QTOPIA4_NOJPEG
 	help
 	  Select libjpeg support.
 
 config BR2_PACKAGE_QTOPIA4_NOJPEG
-	bool
-	prompt "No jpeg support"
-	help
-	  Disable JPEG support
+	bool "No jpeg support"
 
 config BR2_PACKAGE_QTOPIA4_SYSTEMJPEG
-	bool
+	bool "Use system libjpeg"
 	select BR2_PACKAGE_JPEG
-	prompt "use system libjpeg"
-	help
-	  Link against system libjpeg
 
 config BR2_PACKAGE_QTOPIA4_QTJPEG
-	bool
-	prompt "use qt libjpeg"
+	bool "Use Qt libjpeg"
+
+endchoice
+
+choice
+	prompt "PNG support"
+	depends BR2_PACKAGE_QTOPIA4
+	default BR2_PACKAGE_QTOPIA4_NOPNG
 	help
-	  Link against libjpeg proveded with Qt
+	  Select which library to use if PNG support should be enabled.
+
+config BR2_PACKAGE_QTOPIA4_NOPNG
+	bool "No PNG support"
+
+config BR2_PACKAGE_QTOPIA4_SYSTEMPNG
+	bool "Use system libpng"
+	select BR2_PACKAGE_LIBPNG
+
+config BR2_PACKAGE_QTOPIA4_QTPNG
+	bool "Use Qt bundled libpng"
+
 endchoice
 
 choice
+	prompt "TIFF support"
+	depends BR2_PACKAGE_QTOPIA4
+	default BR2_PACKAGE_QTOPIA4_NOTIFF
+	help
+	  Select which library to use if TIFF support should be enabled.
+
+config BR2_PACKAGE_QTOPIA4_NOTIFF
+	bool "No TIFF support"
+
+config BR2_PACKAGE_QTOPIA4_SYSTEMTIFF
+	bool "Use system libtiff"
+	select BR2_PACKAGE_TIFF
+
+config BR2_PACKAGE_QTOPIA4_QTTIFF
+	bool "Use Qt bundled libtiff"
+
+endchoice
+
+config BR2_PACKAGE_QTOPIA4_SQL
+	bool "Enable SQL support"
+	depends BR2_PACKAGE_QTOPIA4
+	help
+	  Enable all the SQL drivers it QtSql library.
+
+config BR2_PACKAGE_QTOPIA4_OPENSSL
+	bool "Enable OpenSSL support"
+	depends BR2_PACKAGE_QTOPIA4
+	help
+	  Enable support for the OpenSSL encryption library.
+
+choice
 	prompt "zlib support"
 	depends BR2_PACKAGE_QTOPIA4
 	default BR2_PACKAGE_QTOPIA4_QTZLIB
@@ -146,7 +178,7 @@
 	prompt "Qt zlib"
 	help
 	  Use the zlib bundled with Qt.
-	
+
 config BR2_PACKAGE_QTOPIA4_SYSTEMZLIB
 	bool
 	select BR2_PACKAGE_ZLIB
@@ -154,7 +186,6 @@
 	help
 	  Use the shared zlib from the system.
 endchoice
-								    
 
 config BR2_PACKAGE_QTOPIA4_EMB_PLATFORM
 	string "The embedded platform we are making Qtopia4 for"
@@ -176,4 +207,4 @@
 	default "generic"	if BR2_sparc
 	depends BR2_PACKAGE_QTOPIA4
 	help
-	    The platform.
+	  The platform.

Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-04-25 08:43:01 UTC (rev 21856)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-04-25 11:45:28 UTC (rev 21857)
@@ -16,7 +16,7 @@
 # (cd /usr/include; sudo ln -s dbus-1.0/dbus dbus)
 # to fix
 
-QTOPIA4_VERSION:=4.4.0-snapshot-20080325
+QTOPIA4_VERSION:=4.4.0-snapshot-20080312
 QTOPIA4_CAT:=$(ZCAT)
 
 BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)))
@@ -24,20 +24,20 @@
 BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD)))
 #"))
 
-QTOPIA4_CONFIGURE:=#empty
-
 # What to download, free or commercial version.
 ifneq ($(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME),)
 QTOPIA4_SITE:=http://$(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME):$(BR2_QTOPIA4_COMMERCIAL_PASSWORD)@dist.trolltech.com/$(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)
 QTOPIA4_SOURCE:=qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION).tar.gz
 QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION)
-QTOPIA4_CONFIGURE+= -no-sql-oci -no-sql-tds -no-sql-db2
+QTOPIA4_NO_SQL_OCI:=-no-sql-oci
+QTOPIA4_NO_SQL_TDS:=-no-sql-tds
+QTOPIA4_NO_SQL_DB2:=-no-sql-db2
 else # Good, good, we are free:
 QTOPIA4_SITE=ftp://ftp.trolltech.com/qt/snapshots
 QTOPIA4_SOURCE:=qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION).tar.gz
 QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION)
 ifeq ($(BR2_PACKAGE_QTOPIA4_GPL_LICENSE_APPROVED),y)
-QTOPIA4_CONFIGURE+= -confirm-license
+QTOPIA4_APPROVE_GPL_LICENSE:=-confirm-license
 endif
 endif
 
@@ -54,15 +54,15 @@
 QTOPIA4_QCONFIG_FILE_LOCATION:=/src/corelib/global/
 
 ifeq ($(BR2_LARGEFILE),y)
-QTOPIA4_CONFIGURE+= -largefile
+QTOPIA4_LARGEFILE=-largefile
 else
-QTOPIA4_CONFIGURE+= -no-largefile
+QTOPIA4_LARGEFILE=-no-largefile
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_QT3SUPPORT),y)
-QTOPIA4_CONFIGURE+= -qt3support
+QTOPIA4_QT3SUPPORT=-qt3support
 else
-QTOPIA4_CONFIGURE+= -no-qt3support
+QTOPIA4_QT3SUPPORT=-no-qt3support
 endif
 
 ifeq ($(BR2_PACKAGE_TSLIB),y)
@@ -74,110 +74,110 @@
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_DEBUG),y)
-QTOPIA4_CONFIGURE+= "-debug $(QTOPIA4_TSLIB_DEB)"
+QTOPIA4_DEBUG="-debug $(QTOPIA4_TSLIB_DEB)"
 else
-QTOPIA4_CONFIGURE+= -release
+QTOPIA4_DEBUG=-release
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
-QTOPIA4_CONFIGURE+= -shared
+QTOPIA4_SHARED=-shared
 else
-QTOPIA4_CONFIGURE+= -static
+QTOPIA4_SHARED=-static
 endif
 
 ifeq ($(BR2_ENDIAN),"LITTLE")
-QTOPIA4_CONFIGURE+= -little-endian
+QTOPIA4_ENDIAN=-little-endian
 else
-QTOPIA4_CONFIGURE+= -big-endian
+QTOPIA4_ENDIAN=-big-endian
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_GIF),y)
-QTOPIA4_CONFIGURE+= -qt-gif
+QTOPIA4_GIF=-qt-gif
 else
-QTOPIA4_CONFIGURE+= -no-gif
+QTOPIA4_GIF=-no-gif
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_LIBMNG),y)
-QTOPIA4_CONFIGURE+= -qt-libmng
+QTOPIA4_MNG=-qt-libmng
 else
-QTOPIA4_CONFIGURE+= -no-libmng
+QTOPIA4_MNG=-no-libmng
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_QTZLIB),y)
-QTOPIA4_CONFIGURE+= -qt-zlib
+QTOPIA4_ZLIB=-qt-zlib
 else
 ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMZLIB),y)
-QTOPIA4_CONFIGURE+= -system-zlib
+QTOPIA4_ZLIB=-system-zlib
 QTOPIA4_DEP_LIBS+=zlib
 else
-QTOPIA4_CONFIGURE+= -no-zlib
+QTOPIA4_ZLIB=-no-zlib
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_QTJPEG),y)
-QTOPIA4_CONFIGURE+= -qt-libjpeg
+QTOPIA4_JPEG=-qt-libjpeg
 else
 ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMJPEG),y)
-QTOPIA4_CONFIGURE+= -system-libjpeg
+QTOPIA4_JPEG=-system-libjpeg
 QTOPIA4_DEP_LIBS+=jpeg
 else
-QTOPIA4_CONFIGURE+= -no-libjpeg
+QTOPIA4_JPEG=-no-libjpeg
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_QTPNG),y)
-QTOPIA4_CONFIGURE+= -qt-libpng
+QTOPIA4_PNG=-qt-libpng
 else
 ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMPNG),y)
-QTOPIA4_CONFIGURE+= -system-libpng
+QTOPIA4_PNG=-system-libpng
 QTOPIA4_DEP_LIBS+=libpng
 else
-QTOPIA4_CONFIGURE+= -no-libpng
+QTOPIA4_PNG=-no-libpng
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_QTTIFF),y)
-QTOPIA4_CONFIGURE+= -qt-libtiff
+QTOPIA4_TIFF=-qt-libtiff
 else
 ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMTIFF),y)
-QTOPIA4_CONFIGURE+= -system-libtiff
+QTOPIA4_TIFF=-system-libtiff
 QTOPIA4_DEP_LIBS+=tiff
 else
-QTOPIA4_CONFIGURE+= -no-libtiff
+QTOPIA4_TIFF=-no-libtiff
 endif
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_OPENSSL),y)
-QTOPIA4_CONFIGURE+= -openssl
+QTOPIA4_OPENSSL=-openssl
 QTOPIA4_DEP_LIBS+=openssl
 else
-QTOPIA4_CONFIGURE+= -no-openssl
+QTOPIA4_OPENSSL=-no-openssl
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_SQL),y)
-QTOPIA4_CONFIGURE+= -qt-sql-ibase
-QTOPIA4_CONFIGURE+= -qt-sql-mysql
-QTOPIA4_CONFIGURE+= -qt-sql-odbc
-QTOPIA4_CONFIGURE+= -qt-sql-psql
-QTOPIA4_CONFIGURE+= -qt-sql-sqlite
-QTOPIA4_CONFIGURE+= -qt-sql-sqlite2
+QTOPIA4_SQL_IBASE=-qt-sql-ibase
+QTOPIA4_SQL_MYSQL=-qt-sql-mysql
+QTOPIA4_SQL_ODBC=-qt-sql-odbc
+QTOPIA4_SQL_PSQL=-qt-sql-psql
+QTOPIA4_SQL_SQLITE=-qt-sql-sqlite
+QTOPIA4_SQL_SQLITE2=-qt-sql-sqlite2
 else
-QTOPIA4_CONFIGURE+= -no-sql-ibase
-QTOPIA4_CONFIGURE+= -no-sql-mysql
-QTOPIA4_CONFIGURE+= -no-sql-odbc
-QTOPIA4_CONFIGURE+= -no-sql-psql
-QTOPIA4_CONFIGURE+= -no-sql-sqlite
-QTOPIA4_CONFIGURE+= -no-sql-sqlite2
+QTOPIA4_SQL_IBASE=-no-sql-ibase
+QTOPIA4_SQL_MYSQL=-no-sql-mysql
+QTOPIA4_SQL_ODBC=-no-sql-odbc
+QTOPIA4_SQL_PSQL=-no-sql-psql
+QTOPIA4_SQL_SQLITE=-no-sql-sqlite
+QTOPIA4_SQL_SQLITE2=-no-sql-sqlite2
 endif
 
-QTOPIA4_CONFIGURE:=$(strip $(subst ",, $(QTOPIA4_CONFIGURE)))
+QTOPIA4_DEBUG:=$(strip $(subst ",, $(QTOPIA4_DEBUG)))
 #"))
 BR2_PACKAGE_QTOPIA4_EMB_PLATFORM:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)))
 #"))
 
 
 # Variable for other Qt applications to use
-QTOPIA4_QMAKE:=$(TARGET_CONFIGURE_OPTS) $(STAGING_DIR)/usr/bin/qmake -spec qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++
+QTOPIA4_QMAKE:=$(STAGING_DIR)/usr/bin/qmake
 
 $(DL_DIR)/$(QTOPIA4_SOURCE):
 	$(WGET) -P $(DL_DIR) $(QTOPIA4_SITE)/$(QTOPIA4_SOURCE)
@@ -198,16 +198,7 @@
 	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QTOPIA4_TARGET_DIR)/configure
 endif
 	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QTOPIA4_TARGET_DIR)/configure
-	#$(SED) 's,-O2,$(TARGET_CFLAGS),' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-        # Fix compiler path
-	$(SED) '\,QMAKE_CC, c\QMAKE_CC = $(TARGET_CC)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_CXX, c\QMAKE_CXX = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_LINK, c\QMAKE_LINK = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_LINK_SHLIB, c\QMAKE_LINK_SHLIB = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_AR, c\QMAKE_AR = $(TARGET_CROSS)ar cqs' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_RANLIB, c\QMAKE_RANLIB = $(TARGET_RANLIB)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	$(SED) '\,QMAKE_STRIP, c\QMAKE_STRIP = $(TARGET_CROSS)strip' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
-	
+	$(SED) 's,-O2,$(TARGET_CFLAGS),' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
 	-[ -f $(QTOPIA4_QCONFIG_FILE) ] && cp $(QTOPIA4_QCONFIG_FILE) \
 		$(QTOPIA4_TARGET_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
 	(cd $(QTOPIA4_TARGET_DIR); rm -rf config.cache; \
@@ -216,12 +207,28 @@
 		-verbose \
 		-embedded $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM) \
 		$(QTOPIA4_QCONFIG_COMMAND) \
-		$(QTOPIA4_CONFIGURE) \
+		$(QTOPIA4_DEBUG) \
+		$(QTOPIA4_SHARED) \
 		-no-stl \
 		-no-cups \
 		-no-nis \
 		-no-freetype \
 		-no-accessibility \
+		$(QTOPIA4_MNG) \
+		$(QTOPIA4_GIF) \
+		$(QTOPIA4_JPEG) \
+		$(QTOPIA4_PNG) \
+		$(QTOPIA4_TIFF) \
+		$(QTOPIA4_ZLIB) \
+		$(QTOPIA4_SQL_IBASE) \
+		$(QTOPIA4_SQL_MYSQL) \
+		$(QTOPIA4_SQL_ODBC) \
+		$(QTOPIA4_SQL_PSQL) \
+		$(QTOPIA4_SQL_SQLITE) \
+		$(QTOPIA4_SQL_SQLITE2) \
+		$(QTOPIA4_NO_SQL_DB2) \
+		$(QTOPIA4_NO_SQL_OCI) \
+		$(QTOPIA4_NO_SQL_TDS) \
 		-no-webkit \
 		-no-separate-debug-info \
 		-prefix /usr \
@@ -230,6 +237,11 @@
 		-no-rpath \
 		-nomake examples \
 		-nomake demos \
+		$(QTOPIA4_QT3SUPPORT) \
+		$(QTOPIA4_TSLIB) \
+		$(QTOPIA4_LARGEFILE) \
+		$(QTOPIA4_ENDIAN) \
+		$(QTOPIA4_APPROVE_GPL_LICENSE) \
 	)
 	touch $@
 
@@ -248,13 +260,13 @@
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
 ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt*.so.* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libQt*.so.*
+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libQt*.so.*
 endif
 	# Install image plugins if they are built
 	if [ -d $(STAGING_DIR)/usr/plugins/imageformats ]; then \
 		mkdir -p $(TARGET_DIR)/usr/plugins; \
 		cp -dpfr $(STAGING_DIR)/usr/plugins/imageformats $(TARGET_DIR)/usr/plugins/; \
-		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/plugins/imageformats/*; \
+		$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/plugins/imageformats/*; \
 	fi
 ifneq ($(BR2_PACKAGE_QTOPIA4_SQL),y)
 	# Remove Sql libraries, not needed
@@ -271,10 +283,6 @@
 qtopia4-dirclean:
 	rm -rf $(QTOPIA4_TARGET_DIR)
 
-qtopia4-status:
-	@echo "QTOPIA4_QMAKE:               " $(QTOPIA4_QMAKE)
-	@echo "QTOPIA4_DEP_LIBS:            " $(QTOPIA4_DEP_LIBS)
-
 #############################################################
 #
 # Toplevel Makefile options
