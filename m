From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Fri, 25 Apr 2008 09:23:33 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <20080424184430.B4D613C849@busybox.net>
References: <20080424184430.B4D613C849@busybox.net>
Message-ID: <1209108213.2859.9.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2008-04-24 at 11:44 -0700, ninevoltz at uclibc.org wrote:
> Author: ninevoltz
> Date: 2008-04-24 11:44:30 -0700 (Thu, 24 Apr 2008)
> New Revision: 21851
> 
> Log:
> update qtopia snapshot version and fix problem with qmake generated makefiles being unable to find the toolchain
> 
> Modified:
>    trunk/buildroot/package/qtopia4/Config.in
>    trunk/buildroot/package/qtopia4/qtopia4.mk
> 

This is broken, please revert.

> Changeset:
> Modified: trunk/buildroot/package/qtopia4/Config.in
> ===================================================================
> --- trunk/buildroot/package/qtopia4/Config.in	2008-04-24 18:35:44 UTC (rev 21850)
> +++ trunk/buildroot/package/qtopia4/Config.in	2008-04-24 18:44:30 UTC (rev 21851)
> @@ -12,6 +12,7 @@
>  	bool "Compile with debug support"
>  	default n
>  	depends BR2_PACKAGE_QTOPIA4
> +	help
>

Remove this

>  choice
>  	prompt "Library type"
> @@ -59,7 +60,7 @@
>  	default ""
>  	depends BR2_PACKAGE_QTOPIA4 && BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
>  	help
> -	  Commercial users can download their source directly by providing a username.
> +	    Commercial users can download their source directly by providing a username.
>  

Whitespace damage

>  config BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD
> @@ -67,15 +68,23 @@
>  	default ""
>  	depends BR2_PACKAGE_QTOPIA4 && BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL
>  	help
> -	  Commercial users can download their source directly by providing a password.
> +	    Commercial users can download their source directly by providing a password.
>

Whitespace damage
 
>  config BR2_PACKAGE_QTOPIA4_QT3SUPPORT
>  	bool "Compatibility with Qt3"
>  	default y
>  	depends BR2_PACKAGE_QTOPIA4
>  	help
> -	  Turns on support for older Qt3.
> +	    Turns on support for older Qt3.
>  

Whitespace damage

> +config BR2_PACKAGE_QTOPIA4_DEPTHS
> +	string "color depths to support"
> +	default "-depths 8"
> +	depends BR2_PACKAGE_QTOPIA4
> +	help
> +	    Which color depths to support for the library. Default is "-depths
> +	    8". Is specified by a comma separated list, i.e. -depths 24,16,8.
> +

Default should be nothing, i.e. enabling all colour depths.

>  config BR2_PACKAGE_QTOPIA4_GIF
>  	bool "Enable GIF support"
>  	default n
> @@ -86,80 +95,39 @@
>  config BR2_PACKAGE_QTOPIA4_LIBMNG
>  	bool "Enable libmng support"
>  	default n
> +	select BR2_PACKAGE_LIBPNG

Huh? Does PNG support MNG? AFAIK this is to enable the internal MNG
library in Qt embedded.

>  	depends BR2_PACKAGE_QTOPIA4
>  	help
>  	  This compiles and installs the plugin for MNG support.
>  
>  choice
> -	prompt "JPEG support"
> +	prompt "libjpeg support"
>  	depends BR2_PACKAGE_QTOPIA4
>  	default BR2_PACKAGE_QTOPIA4_NOJPEG
>  	help
>  	  Select libjpeg support.
>  
>  config BR2_PACKAGE_QTOPIA4_NOJPEG
> -	bool "No jpeg support"
> +	bool
> +	prompt "No jpeg support"
> +	help
> +	  Disable JPEG support
>  

Broken, Use the bool "<name>" stuff.

>  config BR2_PACKAGE_QTOPIA4_SYSTEMJPEG
> -	bool "Use system libjpeg"
> +	bool
>  	select BR2_PACKAGE_JPEG
> +	prompt "use system libjpeg"
> +	help
> +	  Link against system libjpeg
>  

?Broken, Use the bool "<name>" stuff.

>  config BR2_PACKAGE_QTOPIA4_QTJPEG
> -	bool "Use Qt libjpeg"
> -
> -endchoice
> -
> -choice
> -	prompt "PNG support"
> -	depends BR2_PACKAGE_QTOPIA4
> -	default BR2_PACKAGE_QTOPIA4_NOPNG
> +	bool
> +	prompt "use qt libjpeg"
>  	help
> -	  Select which library to use if PNG support should be enabled.
> -
> -config BR2_PACKAGE_QTOPIA4_NOPNG
> -	bool "No PNG support"
> -
> -config BR2_PACKAGE_QTOPIA4_SYSTEMPNG
> -	bool "Use system libpng"
> -	select BR2_PACKAGE_LIBPNG
> -
> -config BR2_PACKAGE_QTOPIA4_QTPNG
> -	bool "Use Qt bundled libpng"
> -

Why are you removing PNG choice?

> +	  Link against libjpeg proveded with Qt
>  endchoice
>  
>  choice
> -	prompt "TIFF support"
> -	depends BR2_PACKAGE_QTOPIA4
> -	default BR2_PACKAGE_QTOPIA4_NOTIFF
> -	help
> -	  Select which library to use if TIFF support should be enabled.
> -
> -config BR2_PACKAGE_QTOPIA4_NOTIFF
> -	bool "No TIFF support"
> -
> -config BR2_PACKAGE_QTOPIA4_SYSTEMTIFF
> -	bool "Use system libtiff"
> -	select BR2_PACKAGE_TIFF
> -
> -config BR2_PACKAGE_QTOPIA4_QTTIFF
> -	bool "Use Qt bundled libtiff"
> -
> -endchoice
> -

Why remove TIFF support?

> -config BR2_PACKAGE_QTOPIA4_SQL
> -	bool "Enable SQL support"
> -	depends BR2_PACKAGE_QTOPIA4
> -	help
> -	  Enable all the SQL drivers it QtSql library.
> -

Why remove SQL support?

> -config BR2_PACKAGE_QTOPIA4_OPENSSL
> -	bool "Enable OpenSSL support"
> -	depends BR2_PACKAGE_QTOPIA4
> -	help
> -	  Enable support for the OpenSSL encryption library.
> -

Why remove SSL support?

> -choice
>  	prompt "zlib support"
>  	depends BR2_PACKAGE_QTOPIA4
>  	default BR2_PACKAGE_QTOPIA4_QTZLIB
> @@ -178,7 +146,7 @@
>  	prompt "Qt zlib"
>  	help
>  	  Use the zlib bundled with Qt.
> -
> +	

Whitespace damage

>  config BR2_PACKAGE_QTOPIA4_SYSTEMZLIB
>  	bool
>  	select BR2_PACKAGE_ZLIB
> @@ -186,6 +154,7 @@
>  	help
>  	  Use the shared zlib from the system.
>  endchoice
> +								    
>  

Let zlib be user selectable.

>  config BR2_PACKAGE_QTOPIA4_EMB_PLATFORM
>  	string "The embedded platform we are making Qtopia4 for"
> @@ -207,4 +176,4 @@
>  	default "generic"	if BR2_sparc
>  	depends BR2_PACKAGE_QTOPIA4
>  	help
> -	  The platform.
> +	    The platform.
> 

Whitespace damage

> Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
> ===================================================================
> --- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-04-24 18:35:44 UTC (rev 21850)
> +++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-04-24 18:44:30 UTC (rev 21851)
> @@ -16,7 +16,7 @@
>  # (cd /usr/include; sudo ln -s dbus-1.0/dbus dbus)
>  # to fix
>  
> -QTOPIA4_VERSION:=4.4.0-snapshot-20080312
> +QTOPIA4_VERSION:=4.4.0-snapshot-20080325

We should bump to version 4.4.1.-snapshot-20080425.

>  QTOPIA4_CAT:=$(ZCAT)
>  
>  BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)))
> @@ -24,20 +24,20 @@
>  BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_PASSWORD)))
>  #"))
>  
> +QTOPIA4_CONFIGURE:=#empty
> +
>  # What to download, free or commercial version.
>  ifneq ($(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME),)
>  QTOPIA4_SITE:=http://$(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME):$(BR2_QTOPIA4_COMMERCIAL_PASSWORD)@dist.trolltech.com/$(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)
>  QTOPIA4_SOURCE:=qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION).tar.gz
>  QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-commercial-src-$(QTOPIA4_VERSION)
> -QTOPIA4_NO_SQL_OCI:=-no-sql-oci
> -QTOPIA4_NO_SQL_TDS:=-no-sql-tds
> -QTOPIA4_NO_SQL_DB2:=-no-sql-db2
> +QTOPIA4_CONFIGURE+= -no-sql-oci -no-sql-tds -no-sql-db2

The SQL selection stuff should be kept.

>  else # Good, good, we are free:
>  QTOPIA4_SITE=ftp://ftp.trolltech.com/qt/snapshots
>  QTOPIA4_SOURCE:=qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION).tar.gz
>  QTOPIA4_TARGET_DIR:=$(BUILD_DIR)/qt-embedded-linux-opensource-src-$(QTOPIA4_VERSION)
>  ifeq ($(BR2_PACKAGE_QTOPIA4_GPL_LICENSE_APPROVED),y)
> -QTOPIA4_APPROVE_GPL_LICENSE:=-confirm-license
> +QTOPIA4_CONFIGURE+= -confirm-license
>  endif
>  endif
>  
> @@ -54,15 +54,15 @@
>  QTOPIA4_QCONFIG_FILE_LOCATION:=/src/corelib/global/
>  
>  ifeq ($(BR2_LARGEFILE),y)
> -QTOPIA4_LARGEFILE=-largefile
> +QTOPIA4_CONFIGURE+= -largefile
>  else
> -QTOPIA4_LARGEFILE=-no-largefile
> +QTOPIA4_CONFIGURE+= -no-largefile
>  endif
>  
>  ifeq ($(BR2_PACKAGE_QTOPIA4_QT3SUPPORT),y)
> -QTOPIA4_QT3SUPPORT=-qt3support
> +QTOPIA4_CONFIGURE+= -qt3support
>  else
> -QTOPIA4_QT3SUPPORT=-no-qt3support
> +QTOPIA4_CONFIGURE+= -no-qt3support
>  endif
>  
>  ifeq ($(BR2_PACKAGE_TSLIB),y)
> @@ -74,110 +74,110 @@
>  endif
>  
>  ifeq ($(BR2_PACKAGE_QTOPIA4_DEBUG),y)
> -QTOPIA4_DEBUG="-debug $(QTOPIA4_TSLIB_DEB)"
> +QTOPIA4_CONFIGURE+= "-debug $(QTOPIA4_TSLIB_DEB)"
>  else
> -QTOPIA4_DEBUG=-release
> +QTOPIA4_CONFIGURE+= -release
>  endif
>  
>  ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
> -QTOPIA4_SHARED=-shared
> +QTOPIA4_CONFIGURE+= -shared
>  else
> -QTOPIA4_SHARED=-static
> +QTOPIA4_CONFIGURE+= -static
>  endif
>  
>  ifeq ($(BR2_ENDIAN),"LITTLE")
> -QTOPIA4_ENDIAN=-little-endian
> +QTOPIA4_CONFIGURE+= -little-endian
>  else
> -QTOPIA4_ENDIAN=-big-endian
> +QTOPIA4_CONFIGURE+= -big-endian
>  endif
>  
>  ifeq ($(BR2_PACKAGE_QTOPIA4_GIF),y)
> -QTOPIA4_GIF=-qt-gif
> +QTOPIA4_CONFIGURE+= -qt-gif
>  else
> -QTOPIA4_GIF=-no-gif
> +QTOPIA4_CONFIGURE+= -no-gif
>  endif
>  
>  ifeq ($(BR2_PACKAGE_QTOPIA4_LIBMNG),y)
> -QTOPIA4_MNG=-qt-libmng
> +QTOPIA4_CONFIGURE+= -qt-libmng
>  else
> -QTOPIA4_MNG=-no-libmng
> +QTOPIA4_CONFIGURE+= -no-libmng
>  endif
>  
>  ifeq ($(BR2_PACKAGE_QTOPIA4_QTZLIB),y)
> -QTOPIA4_ZLIB=-qt-zlib
> +QTOPIA4_CONFIGURE+= -qt-zlib
>  else
>  ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMZLIB),y)
> -QTOPIA4_ZLIB=-system-zlib
> +QTOPIA4_CONFIGURE+= -system-zlib
>  QTOPIA4_DEP_LIBS+=zlib
>  else
> -QTOPIA4_ZLIB=-no-zlib
> +QTOPIA4_CONFIGURE+= -no-zlib
>  endif
>  endif
>  
>  ifeq ($(BR2_PACKAGE_QTOPIA4_QTJPEG),y)
> -QTOPIA4_JPEG=-qt-libjpeg
> +QTOPIA4_CONFIGURE+= -qt-libjpeg
>  else
>  ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMJPEG),y)
> -QTOPIA4_JPEG=-system-libjpeg
> +QTOPIA4_CONFIGURE+= -system-libjpeg
>  QTOPIA4_DEP_LIBS+=jpeg
>  else
> -QTOPIA4_JPEG=-no-libjpeg
> +QTOPIA4_CONFIGURE+= -no-libjpeg
>  endif
>  endif
>  
>  ifeq ($(BR2_PACKAGE_QTOPIA4_QTPNG),y)
> -QTOPIA4_PNG=-qt-libpng
> +QTOPIA4_CONFIGURE+= -qt-libpng
>  else
>  ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMPNG),y)
> -QTOPIA4_PNG=-system-libpng
> +QTOPIA4_CONFIGURE+= -system-libpng
>  QTOPIA4_DEP_LIBS+=libpng
>  else
> -QTOPIA4_PNG=-no-libpng
> +QTOPIA4_CONFIGURE+= -no-libpng
>  endif
>  endif
>  
>  ifeq ($(BR2_PACKAGE_QTOPIA4_QTTIFF),y)
> -QTOPIA4_TIFF=-qt-libtiff
> +QTOPIA4_CONFIGURE+= -qt-libtiff
>  else
>  ifeq ($(BR2_PACKAGE_QTOPIA4_SYSTEMTIFF),y)
> -QTOPIA4_TIFF=-system-libtiff
> +QTOPIA4_CONFIGURE+= -system-libtiff
>  QTOPIA4_DEP_LIBS+=tiff
>  else
> -QTOPIA4_TIFF=-no-libtiff
> +QTOPIA4_CONFIGURE+= -no-libtiff

You removed TIFF support in kconfig, but kept it in Makefile...

>  endif
>  endif
>  
>  ifeq ($(BR2_PACKAGE_QTOPIA4_OPENSSL),y)
> -QTOPIA4_OPENSSL=-openssl
> +QTOPIA4_CONFIGURE+= -openssl
>  QTOPIA4_DEP_LIBS+=openssl
>  else
> -QTOPIA4_OPENSSL=-no-openssl
> +QTOPIA4_CONFIGURE+= -no-openssl
>  endif
>  
>  ifeq ($(BR2_PACKAGE_QTOPIA4_SQL),y)
> -QTOPIA4_SQL_IBASE=-qt-sql-ibase
> -QTOPIA4_SQL_MYSQL=-qt-sql-mysql
> -QTOPIA4_SQL_ODBC=-qt-sql-odbc
> -QTOPIA4_SQL_PSQL=-qt-sql-psql
> -QTOPIA4_SQL_SQLITE=-qt-sql-sqlite
> -QTOPIA4_SQL_SQLITE2=-qt-sql-sqlite2
> +QTOPIA4_CONFIGURE+= -qt-sql-ibase
> +QTOPIA4_CONFIGURE+= -qt-sql-mysql
> +QTOPIA4_CONFIGURE+= -qt-sql-odbc
> +QTOPIA4_CONFIGURE+= -qt-sql-psql
> +QTOPIA4_CONFIGURE+= -qt-sql-sqlite
> +QTOPIA4_CONFIGURE+= -qt-sql-sqlite2
>  else
> -QTOPIA4_SQL_IBASE=-no-sql-ibase
> -QTOPIA4_SQL_MYSQL=-no-sql-mysql
> -QTOPIA4_SQL_ODBC=-no-sql-odbc
> -QTOPIA4_SQL_PSQL=-no-sql-psql
> -QTOPIA4_SQL_SQLITE=-no-sql-sqlite
> -QTOPIA4_SQL_SQLITE2=-no-sql-sqlite2
> +QTOPIA4_CONFIGURE+= -no-sql-ibase
> +QTOPIA4_CONFIGURE+= -no-sql-mysql
> +QTOPIA4_CONFIGURE+= -no-sql-odbc
> +QTOPIA4_CONFIGURE+= -no-sql-psql
> +QTOPIA4_CONFIGURE+= -no-sql-sqlite
> +QTOPIA4_CONFIGURE+= -no-sql-sqlite2
>  endif

Same about SQL.

>  
> -QTOPIA4_DEBUG:=$(strip $(subst ",, $(QTOPIA4_DEBUG)))
> +QTOPIA4_CONFIGURE:=$(strip $(subst ",, $(QTOPIA4_CONFIGURE)))
>  #"))
>  BR2_PACKAGE_QTOPIA4_EMB_PLATFORM:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)))
>  #"))
>  
> 
>  # Variable for other Qt applications to use
> -QTOPIA4_QMAKE:=$(STAGING_DIR)/usr/bin/qmake
> +QTOPIA4_QMAKE:=$(TARGET_CONFIGURE_OPTS) $(STAGING_DIR)/usr/bin/qmake -spec qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++
>  

Is this really needed? qmake works fine for me by just specifying the
Buildroot PATH to STAGING_DIR/bin.

>  $(DL_DIR)/$(QTOPIA4_SOURCE):
>  	$(WGET) -P $(DL_DIR) $(QTOPIA4_SITE)/$(QTOPIA4_SOURCE)
> @@ -198,7 +198,16 @@
>  	$(SED) 's/^CFG_IPV6IFNAME=auto/CFG_IPV6IFNAME=no/' $(QTOPIA4_TARGET_DIR)/configure
>  endif
>  	$(SED) 's/^CFG_XINERAMA=auto/CFG_XINERAMA=no/' $(QTOPIA4_TARGET_DIR)/configure
> -	$(SED) 's,-O2,$(TARGET_CFLAGS),' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
> +	#$(SED) 's,-O2,$(TARGET_CFLAGS),' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
> +        # Fix compiler path
> +	$(SED) '\,QMAKE_CC, c\QMAKE_CC = $(TARGET_CC)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
> +	$(SED) '\,QMAKE_CXX, c\QMAKE_CXX = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
> +	$(SED) '\,QMAKE_LINK, c\QMAKE_LINK = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
> +	$(SED) '\,QMAKE_LINK_SHLIB, c\QMAKE_LINK_SHLIB = $(TARGET_CXX)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
> +	$(SED) '\,QMAKE_AR, c\QMAKE_AR = $(TARGET_CROSS)ar cqs' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
> +	$(SED) '\,QMAKE_RANLIB, c\QMAKE_RANLIB = $(TARGET_RANLIB)' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
> +	$(SED) '\,QMAKE_STRIP, c\QMAKE_STRIP = $(TARGET_CROSS)strip' $(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf
> +

Again, if people use the BUildroot environment, this is not needed.

>  	-[ -f $(QTOPIA4_QCONFIG_FILE) ] && cp $(QTOPIA4_QCONFIG_FILE) \
>  		$(QTOPIA4_TARGET_DIR)/$(QTOPIA4_QCONFIG_FILE_LOCATION)
>  	(cd $(QTOPIA4_TARGET_DIR); rm -rf config.cache; \
> @@ -207,28 +216,12 @@
>  		-verbose \
>  		-embedded $(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM) \
>  		$(QTOPIA4_QCONFIG_COMMAND) \
> -		$(QTOPIA4_DEBUG) \
> -		$(QTOPIA4_SHARED) \
> +		$(QTOPIA4_CONFIGURE) \
>  		-no-stl \
>  		-no-cups \
>  		-no-nis \
>  		-no-freetype \
>  		-no-accessibility \
> -		$(QTOPIA4_MNG) \
> -		$(QTOPIA4_GIF) \
> -		$(QTOPIA4_JPEG) \
> -		$(QTOPIA4_PNG) \
> -		$(QTOPIA4_TIFF) \
> -		$(QTOPIA4_ZLIB) \
> -		$(QTOPIA4_SQL_IBASE) \
> -		$(QTOPIA4_SQL_MYSQL) \
> -		$(QTOPIA4_SQL_ODBC) \
> -		$(QTOPIA4_SQL_PSQL) \
> -		$(QTOPIA4_SQL_SQLITE) \
> -		$(QTOPIA4_SQL_SQLITE2) \
> -		$(QTOPIA4_NO_SQL_DB2) \
> -		$(QTOPIA4_NO_SQL_OCI) \
> -		$(QTOPIA4_NO_SQL_TDS) \
>  		-no-webkit \
>  		-no-separate-debug-info \
>  		-prefix /usr \
> @@ -237,11 +230,6 @@
>  		-no-rpath \
>  		-nomake examples \
>  		-nomake demos \
> -		$(QTOPIA4_QT3SUPPORT) \
> -		$(QTOPIA4_TSLIB) \
> -		$(QTOPIA4_LARGEFILE) \
> -		$(QTOPIA4_ENDIAN) \
> -		$(QTOPIA4_APPROVE_GPL_LICENSE) \
>  	)
>  	touch $@
>  
> @@ -260,13 +248,13 @@
>  	cp -dpf $(STAGING_DIR)/usr/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
>  ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
>  	cp -dpf $(STAGING_DIR)/usr/lib/libQt*.so.* $(TARGET_DIR)/usr/lib/
> -	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libQt*.so.*
> +	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libQt*.so.*
>  endif
>  	# Install image plugins if they are built
>  	if [ -d $(STAGING_DIR)/usr/plugins/imageformats ]; then \
>  		mkdir -p $(TARGET_DIR)/usr/plugins; \
>  		cp -dpfr $(STAGING_DIR)/usr/plugins/imageformats $(TARGET_DIR)/usr/plugins/; \
> -		$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/plugins/imageformats/*; \
> +		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/plugins/imageformats/*; \
>  	fi
>  ifneq ($(BR2_PACKAGE_QTOPIA4_SQL),y)
>  	# Remove Sql libraries, not needed
> @@ -283,6 +271,10 @@
>  qtopia4-dirclean:
>  	rm -rf $(QTOPIA4_TARGET_DIR)
>  
> +qtopia4-status:
> +	@echo "QTOPIA4_QMAKE:               " $(QTOPIA4_QMAKE)
> +	@echo "QTOPIA4_DEP_LIBS:            " $(QTOPIA4_DEP_LIBS)
> +

Do we really need this?

>  #############################################################
>  #
>  # Toplevel Makefile options

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
