From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 May 2012 13:30:52 +0200
Subject: [Buildroot] [git commit] php: security bump to version 5.3.13 and
	enhance
Message-ID: <20120531113259.DA3D196E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aeb9350cfbd2f4675f0d095394660cc0c2cc0d7b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump php to version 5.3.13 to solve multiple CVEs.
The 5.2 series is no longer maintained.

The PCRE and SPL extensions are no longer optional.
Reflection is no longer optional either.

Ncurses was spun out to PECL.

Add a ton of new extensions and give more granular options on others
(like the libxml2-based ones).

The FastCGI option no longer exists, it's always on as long as CGI is.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/Config.ext                             |  355 ++++++++++++++------
 package/php/Config.in                              |   32 +-
 ...hen-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch |   30 --
 package/php/php-no-iconv-search.patch              |   21 ++
 package/php/php.mk                                 |  199 ++++++-----
 5 files changed, 400 insertions(+), 237 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index bd630ee..fa73bb4 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -1,28 +1,21 @@
-menu "PHP Extensions"
+menu "Extensions"
 
-config BR2_PACKAGE_PHP_CONFIG
-	string "PHP configuration file to use"
-	default "$(PHP_DIR)/php.ini-dist"
-	help
-	  If you want to use a different php.ini file define it here.
-	  Otherwise it'll just copy the default php.ini-dist from PHP.
-
-config BR2_PACKAGE_PHP_EXT_SOCKETS
-	bool "socket"
+config BR2_PACKAGE_PHP_EXT_CALENDAR
+	bool "Calendar"
 	help
-	  Sockets support
+	  Calendar and event support
 
-config BR2_PACKAGE_PHP_EXT_POSIX
-	bool "posix"
-	default y
+config BR2_PACKAGE_PHP_EXT_FILEINFO
+	bool "Fileinfo"
 	help
-	  POSIX support
+	  File Information support
 
-config BR2_PACKAGE_PHP_EXT_SPL
-	bool "SPL"
-	default y
+config BR2_PACKAGE_PHP_EXT_READLINE
+	bool "Readline"
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
 	help
-	  Standard PHP library support
+	  Readline support
 
 config BR2_PACKAGE_PHP_EXT_SESSION
 	bool "Session"
@@ -30,156 +23,320 @@ config BR2_PACKAGE_PHP_EXT_SESSION
 	help
 	  Session support
 
+comment "Compression extensions"
+
+config BR2_PACKAGE_PHP_EXT_BZIP2
+	bool "bzip2"
+	select BR2_PACKAGE_BZIP2
+	help
+	  bzip2 read/write support
+
+config BR2_PACKAGE_PHP_EXT_ZIP
+	bool "zip"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Zip read/write support
+
+config BR2_PACKAGE_PHP_EXT_ZLIB
+	bool "zlib"
+	select BR2_PACKAGE_ZLIB
+	default y
+	help
+	  zlib support
+
+comment "Cryptography extensions"
+
+config BR2_PACKAGE_PHP_EXT_HASH
+	bool "hash"
+	help
+	  HASH message digest framework
+
 config BR2_PACKAGE_PHP_EXT_OPENSSL
 	bool "openssl"
 	select BR2_PACKAGE_OPENSSL
 	help
 	  openssl support
 
-config BR2_PACKAGE_PHP_EXT_LIBXML2
-	bool "xml2"
-	select BR2_PACKAGE_LIBXML2
+comment "Database extensions"
+
+config BR2_PACKAGE_PHP_EXT_DBA
+	bool "DBA"
 	help
-	  libxml2 support
+	  Database Abstraction Layer
 
-config BR2_PACKAGE_PHP_EXT_SIMPLEXML
-	bool "simplexml"
-	select BR2_PACKAGE_PHP_EXT_LIBXML2
+if BR2_PACKAGE_PHP_EXT_DBA
+
+config BR2_PACKAGE_PHP_EXT_DBA_CDB
+	bool "cdb"
 	help
-	  SimpleXML support
+	  CDB handler
 
-config BR2_PACKAGE_PHP_EXT_ZLIB
-        bool "zlib"
-        select BR2_PACKAGE_ZLIB
-        default y
-        help
-          zlib support
+config BR2_PACKAGE_PHP_EXT_DBA_DB4
+	bool "db4/5"
+	select BR2_PACKAGE_BERKELEYDB
+	help
+	  BerkeleyDB version 4/5 handler
 
-config BR2_PACKAGE_PHP_EXT_EXIF
-	bool "EXIF"
+config BR2_PACKAGE_PHP_EXT_DBA_FLAT
+	bool "flat"
+	default y
 	help
-	  EXIF support
+	  Flat file handler
 
-config BR2_PACKAGE_PHP_EXT_FTP
-	bool "FTP"
+config BR2_PACKAGE_PHP_EXT_DBA_INI
+	bool "ini"
+	default y
+	help
+	  INI file handler
+
+endif
+
+config BR2_PACKAGE_PHP_EXT_SQLITE
+	bool "SQLite"
+	help
+	  Legacy SQLite2 support
+
+config BR2_PACKAGE_PHP_EXT_SQLITE_UTF8
+	bool "sqlite UTF8 support"
+	depends on BR2_PACKAGE_PHP_EXT_SQLITE
+	help
+	  UTF8 support for sqlite
+
+config BR2_PACKAGE_PHP_EXT_MYSQL
+	bool "Mysql"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_MYSQL_CLIENT
+	help
+	  MySQL support
+
+config BR2_PACKAGE_PHP_EXT_MYSQLI
+	bool "Mysqli"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_MYSQL_CLIENT
+	select BR2_PACKAGE_PHP_EXT_MYSQL
+	help
+	  MySQL Improved extension support
+
+config BR2_PACKAGE_PHP_EXT_PDO
+	bool "PDO"
+	help
+	  PHP Data Objects support
+
+if BR2_PACKAGE_PHP_EXT_PDO
+
+config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
+	bool "MySQL"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_MYSQL_CLIENT
+	help
+	  PDO driver for MySQL
+
+comment "MySQL drivers require a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
+	bool "SQLite3"
+	select BR2_PACKAGE_SQLITE
 	help
-	  FTP Support
+	  SQLite3 driver for PDO
+
+endif
+
+comment "Human language and character encoding support"
 
 config BR2_PACKAGE_PHP_EXT_GETTEXT
-	bool "gettext"
+	bool "Gettext"
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	depends on BR2_USE_WCHAR
 	help
-	  gettext support
+	  Gettext support
 
-comment "gettext support requires a toolchain with WCHAR support"
+comment "Gettext support requires a toolchain with WCHAR support"
 	depends on !BR2_USE_WCHAR
 
+config BR2_PACKAGE_PHP_EXT_ICONV
+	bool "iconv"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  iconv character set conversion support
+
+config BR2_PACKAGE_PHP_EXT_INTL
+	bool "intl"
+	select BR2_PACKAGE_ICU
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	help
+	  Internationalization support
+
+comment "intl support requires a toolchain with C++ and WCHAR support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+
+comment "Image processing"
+
+config BR2_PACKAGE_PHP_EXT_EXIF
+	bool "EXIF"
+	help
+	  EXIF support
+
+comment "Mathematical extensions"
+
+config BR2_PACKAGE_PHP_EXT_BCMATH
+	bool "BC math"
+	help
+	  BCMath arbitrary precision mathematics support
+
 config BR2_PACKAGE_PHP_EXT_GMP
-	bool "gmp"
+	bool "GMP"
 	select BR2_PACKAGE_GMP
 	help
-	  GMP support
+	  GNU Multiple Precision support
+
+comment "Other basic extensions"
 
 config BR2_PACKAGE_PHP_EXT_JSON
 	bool "JSON"
 	help
 	  JavaScript Object Serialization support
 
-config BR2_PACKAGE_PHP_EXT_READLINE
-	bool "readline"
-	depends on (BR2_PACKAGE_PHP_CLI || BR2_PACKAGE_PHP_CGI) && BR2_PACKAGE_READLINE
+config BR2_PACKAGE_PHP_EXT_TOKENIZER
+	bool "Tokenizer"
+	help
+	  Tokenizer functions support
+
+comment "Other services"
+
+config BR2_PACKAGE_PHP_EXT_CURL
+	bool "cURL"
+	select BR2_PACKAGE_LIBCURL
+	help
+	  cURL for URL streams
+
+config BR2_PACKAGE_PHP_EXT_FTP
+	bool "FTP"
 	help
-	  readline support
+	  FTP support
 
-config BR2_PACKAGE_PHP_EXT_NCURSES
-	bool "ncurses"
-	depends on (BR2_PACKAGE_PHP_CLI || BR2_PACKAGE_PHP_CGI) && BR2_PACKAGE_NCURSES
+config BR2_PACKAGE_PHP_EXT_SNMP
+	bool "SNMP"
+	select BR2_PACKAGE_NETSNMP
 	help
-	  ncurses support
+	  SNMP support
 
-config BR2_PACKAGE_PHP_EXT_PCRE
-	bool "PCRE"
+config BR2_PACKAGE_PHP_EXT_SOCKETS
+	bool "sockets"
 	help
-	  Perl Compatible Regular Expressions support
+	  Sockets support
+
+comment "Process Control"
 
 config BR2_PACKAGE_PHP_EXT_PCNTL
 	bool "PCNTL"
 	help
-	  Process Control Support
+	  Process control support
+
+config BR2_PACKAGE_PHP_EXT_POSIX
+	bool "Posix"
+	default y
+	help
+	  POSIX.1 (IEEE 1003.1) function support
+
+config BR2_PACKAGE_PHP_EXT_SHMOP
+	bool "shmop"
+	help
+	  Shared memory support
 
 config BR2_PACKAGE_PHP_EXT_SYSVMSG
-	bool "sysvmsg - System V Message queue"
+	bool "sysvmsg"
 	help
-	  System V Message queue support
+	  System V message queue support
 
 config BR2_PACKAGE_PHP_EXT_SYSVSEM
-	bool "sysvsem - System V Semaphores"
+	bool "sysvsem"
 	help
-	  System V Sempahore support
+	  System V semaphore support
 
 config BR2_PACKAGE_PHP_EXT_SYSVSHM
-	bool "sysvshm - System V Shared memory"
+	bool "sysvshm"
 	help
-	  System V Shared memory support
+	  System V shared memory support
 
-config BR2_PACKAGE_PHP_EXT_ZIP
-	bool "zip"
-	select BR2_PACKAGE_ZLIB
+comment "Variable and Type related"
+
+config BR2_PACKAGE_PHP_EXT_CTYPE
+	bool "Ctype"
 	help
-	  Zip read/write support
+	  Character type checking support
 
 config BR2_PACKAGE_PHP_EXT_FILTER
-	bool "filter"
-	select BR2_PACKAGE_PHP_EXT_PCRE
+	bool "Filter"
 	help
 	  Input filter support
 
-config BR2_PACKAGE_PHP_EXT_CALENDAR
-	bool "calendar"
+comment "Web services"
+
+config BR2_PACKAGE_PHP_EXT_SOAP
+	bool "SOAP"
+	select BR2_PACKAGE_PHP_EXT_LIBXML2
 	help
-	  Calendar and event support
+	  SOAP support
 
-comment "Database extensions"
+config BR2_PACKAGE_PHP_EXT_XMLRPC
+	bool "XML-RPC"
+	select BR2_PACKAGE_PHP_EXT_LIBXML2
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  XML-RPC support
 
-config BR2_PACKAGE_PHP_EXT_SQLITE
-	bool "SQLite"
+comment "XML manipulation"
+
+config BR2_PACKAGE_PHP_EXT_DOM
+	bool "DOM"
+	select BR2_PACKAGE_PHP_EXT_LIBXML2
 	help
-	  Legacy SQLite2 support
+	  Document Object Model support
 
-config BR2_PACKAGE_PHP_EXT_SQLITE_UTF8
-	bool "sqlite UTF8 support"
-	depends on BR2_PACKAGE_PHP_EXT_SQLITE
+config BR2_PACKAGE_PHP_EXT_LIBXML2
+	bool "libxml"
+	select BR2_PACKAGE_LIBXML2
+	help
+	  libxml2 support
+
+config BR2_PACKAGE_PHP_EXT_SIMPLEXML
+	bool "SimpleXML"
+	select BR2_PACKAGE_PHP_EXT_LIBXML2
 	help
-	  UTF8 Support for sqlite
+	  SimpleXML support
 
-config BR2_PACKAGE_PHP_EXT_PDO
-	bool "PDO"
+config BR2_PACKAGE_PHP_EXT_WDDX
+	bool "WDDX"
+	select BR2_PACKAGE_PHP_EXT_LIBXML2
 	help
-	  PHP Data Objects support
+	  WDDX support
 
-config BR2_PACKAGE_PHP_EXT_PDO_SQLITE
-	bool "PDO_SQLite"
-	depends on BR2_PACKAGE_PHP_EXT_PDO
+config BR2_PACKAGE_PHP_EXT_XML
+	bool "XML Parser"
+	select BR2_PACKAGE_PHP_EXT_LIBXML2
 	help
-	  SQLite driver for PDO
+	  XML Parser support
 
-config BR2_PACKAGE_PHP_EXT_PDO_SQLITE_EXTERNAL
-	bool "PDO_SQLite external"
-	depends on BR2_PACKAGE_PHP_EXT_PDO_SQLITE
-	select BR2_PACKAGE_SQLITE
+config BR2_PACKAGE_PHP_EXT_XMLREADER
+	bool "XMLReader"
+	select BR2_PACKAGE_PHP_EXT_LIBXML2
 	help
-	  Use external sqlite3 library
+	  XMLReader support
 
-config BR2_PACKAGE_PHP_EXT_PDO_MYSQL
-	bool "PDO_MySQL"
-	depends on BR2_PACKAGE_PHP_EXT_PDO
-	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_MYSQL_CLIENT
+config BR2_PACKAGE_PHP_EXT_XMLWRITER
+	bool "XMLWriter"
+	select BR2_PACKAGE_PHP_EXT_LIBXML2
 	help
-	  PDO driver for MySQL
+	  XMLWriter support
 
-comment "PDO_MySQL requires a toolchain with C++ support"
-	depends on !BR2_INSTALL_LIBSTDCPP && BR2_PACKAGE_PHP_EXT_PDO
+config BR2_PACKAGE_PHP_EXT_XSL
+	bool "XSL"
+	select BR2_PACKAGE_PHP_EXT_DOM
+	select BR2_PACKAGE_PHP_EXT_LIBXML2
+	select BR2_PACKAGE_LIBXSLT
+	help
+	  XSL transformation support
 
 endmenu
diff --git a/package/php/Config.in b/package/php/Config.in
index 23d86e4..c8c100c 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -9,6 +9,8 @@ config BR2_PACKAGE_PHP
 
 if BR2_PACKAGE_PHP
 
+source "package/php/Config.ext"
+
 config BR2_PACKAGE_PHP_CLI
        bool
 
@@ -16,38 +18,30 @@ config BR2_PACKAGE_PHP_CGI
        bool
 
 choice
-        prompt "PHP interface"
+        prompt "Interface"
         default BR2_PACKAGE_PHP_SAPI_CGI
         help
           Select the PHP interface(s).
 
+config BR2_PACKAGE_PHP_SAPI_CGI
+	bool "CGI"
+	select BR2_PACKAGE_PHP_CGI
+	help
+	  Common Gateway Interface
+
 config BR2_PACKAGE_PHP_SAPI_CLI
-        bool "cli interface"
+        bool "CLI"
 	select BR2_PACKAGE_PHP_CLI
         help
-          Command line interface for PHP.
-
-config BR2_PACKAGE_PHP_SAPI_CGI
-        bool "cgi interface"
-        select BR2_PACKAGE_PHP_CGI
-        help
-          CGI interface for PHP.
+          Command Line Interface
 
 config BR2_PACKAGE_PHP_SAPI_CLI_CGI
-        bool "cli and cgi interfaces"
+        bool "CGI and CLI"
 	select BR2_PACKAGE_PHP_CLI
 	select BR2_PACKAGE_PHP_CGI
 	help
-	  Command line and CGI interfaces for PHP.
+	  Command line and Common gateway interfaces
 
 endchoice
 
-config BR2_PACKAGE_PHP_FASTCGI
-        bool "fastcgi"
-        depends on BR2_PACKAGE_PHP_CGI
-        default y
-        help
-          fast cgi interface for php
-
-source "package/php/Config.ext"
 endif
diff --git a/package/php/php-5.2.16-fix-build-when-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch b/package/php/php-5.2.16-fix-build-when-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch
deleted file mode 100644
index 221b3c0..0000000
--- a/package/php/php-5.2.16-fix-build-when-__GMP_BITS_PER_MP_LIMB-is-not-defined.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e814fcac0599dbaae50ede1f9f78e20941e27877 Mon Sep 17 00:00:00 2001
-From: pajoye <pajoye@c90b9560-bf6c-de11-be94-00142212c4b1>
-Date: Tue, 23 Feb 2010 11:07:39 +0000
-Subject: [PATCH] - fix build when __GMP_BITS_PER_MP_LIMB is not defined but GMP_LIMB_BITS (no trace of this change in gmp's changelog...)
-
-git-svn-id: http://svn.php.net/repository/php/php-src/branches/PHP_5_3 at 295402 c90b9560-bf6c-de11-be94-00142212c4b1
----
- ext/gmp/gmp.c |    5 ++++-
- 1 files changed, 4 insertions(+), 1 deletions(-)
-
-diff --git a/ext/gmp/gmp.c b/ext/gmp/gmp.c
-index a54ffe9..f53dcd6 100644
---- a/ext/gmp/gmp.c
-+++ b/ext/gmp/gmp.c
-@@ -1374,8 +1374,11 @@ ZEND_FUNCTION(gmp_random)
- 
- 		GMPG(rand_initialized) = 1;
- 	}
-+#ifdef GMP_LIMB_BITS
-+	mpz_urandomb(*gmpnum_result, GMPG(rand_state), GMP_ABS (limiter) * GMP_LIMB_BITS);
-+#else
- 	mpz_urandomb(*gmpnum_result, GMPG(rand_state), GMP_ABS (limiter) * __GMP_BITS_PER_MP_LIMB);
--
-+#endif
- 	ZEND_REGISTER_RESOURCE(return_value, gmpnum_result, le_gmp);
- }
- /* }}} */
--- 
-1.7.1
-
diff --git a/package/php/php-no-iconv-search.patch b/package/php/php-no-iconv-search.patch
new file mode 100644
index 0000000..d1e924b
--- /dev/null
+++ b/package/php/php-no-iconv-search.patch
@@ -0,0 +1,21 @@
+Don't push LDFLAGS/CFLAGS for iconv.
+Just assume they're covered somewhere else.
+Otherwise we get -L/usr/lib and -I/usr/include search paths with uClibc
+internal iconv support, which breaks things.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura php-5.3.13/configure php-5.3.13-iconv/configure
+--- php-5.3.13/configure	2012-05-08 06:41:23.000000000 -0300
++++ php-5.3.13-iconv/configure	2012-05-18 22:18:21.313975849 -0300
+@@ -47885,8 +47885,8 @@
+       PHP_ICONV_PREFIX="$ICONV_DIR"
+     fi
+ 
+-    CFLAGS="-I$PHP_ICONV_PREFIX/include $CFLAGS"
+-    LDFLAGS="-L$PHP_ICONV_PREFIX/$PHP_LIBDIR $LDFLAGS"
++    #CFLAGS="-I$PHP_ICONV_PREFIX/include $CFLAGS"
++    #LDFLAGS="-L$PHP_ICONV_PREFIX/$PHP_LIBDIR $LDFLAGS"
+ 
+     if test -r "$PHP_ICONV_PREFIX/include/giconv.h"; then
+       PHP_ICONV_H_PATH="$PHP_ICONV_PREFIX/include/giconv.h"
diff --git a/package/php/php.mk b/package/php/php.mk
index 6de6a9e..e9bda44 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,53 +4,59 @@
 #
 #############################################################
 
-PHP_VERSION = 5.2.17
+PHP_VERSION = 5.3.13
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
 PHP_INSTALL_STAGING_OPT = INSTALL_ROOT=$(STAGING_DIR) install
 PHP_INSTALL_TARGET_OPT = INSTALL_ROOT=$(TARGET_DIR) install
-PHP_LIBTOOL_PATCH = NO
 PHP_CONF_OPT =  --mandir=/usr/share/man \
 		--infodir=/usr/share/info \
 		--disable-all \
 		--without-pear \
 		--with-config-file-path=/etc \
 		--localstatedir=/var \
+		--disable-rpath
 
 PHP_CFLAGS = $(TARGET_CFLAGS)
 
-ifneq ($(BR2_PACKAGE_PHP_CLI),y)
-	PHP_CONF_OPT += --disable-cli
-else
-	PHP_CONF_OPT += --enable-cli
-endif
-
-ifneq ($(BR2_PACKAGE_PHP_CGI),y)
-	PHP_CONF_OPT += --disable-cgi
-else
-	PHP_CONF_OPT += --enable-cgi
-	ifeq ($(BR2_PACKAGE_PHP_FASTCGI),y)
-		PHP_CONF_OPT += --enable-fastcgi
-	endif
+# Workaround for non-IPv6 uClibc toolchain
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
+ifneq ($(BR2_INET_IPV6),y)
+	PHP_CFLAGS += -DHAVE_DEPRECATED_DNS_FUNCS
 endif
-
-### Extensions
-ifeq ($(BR2_PACKAGE_PHP_EXT_SOCKETS),y)
-	PHP_CONF_OPT += --enable-sockets
-endif
-
-ifeq ($(BR2_PACKAGE_PHP_EXT_POSIX),y)
-	PHP_CONF_OPT += --enable-posix
 endif
 
-ifeq ($(BR2_PACKAGE_PHP_EXT_SPL),y)
-	PHP_CONF_OPT += --enable-spl
-endif
+PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_CLI),,--disable-cli)
+PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
 
-ifeq ($(BR2_PACKAGE_PHP_EXT_SESSION),y)
-	PHP_CONF_OPT += --enable-session
-endif
+### Extensions
+PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
+		$(if $(BR2_PACKAGE_PHP_EXT_POSIX),--enable-posix) \
+		$(if $(BR2_PACKAGE_PHP_EXT_SESSION),--enable-session) \
+		$(if $(BR2_PACKAGE_PHP_EXT_HASH),--enable-hash) \
+		$(if $(BR2_PACKAGE_PHP_EXT_DOM),--enable-dom) \
+		$(if $(BR2_PACKAGE_PHP_EXT_SIMPLEXML),--enable-simplexml) \
+		$(if $(BR2_PACKAGE_PHP_EXT_SOAP),--enable-soap) \
+		$(if $(BR2_PACKAGE_PHP_EXT_WDDX),--enable-wddx) \
+		$(if $(BR2_PACKAGE_PHP_EXT_XML),--enable-xml) \
+		$(if $(BR2_PACKAGE_PHP_EXT_XMLREADER),--enable-xmlreader) \
+		$(if $(BR2_PACKAGE_PHP_EXT_XMLWRITER),--enable-xmlwriter) \
+		$(if $(BR2_PACKAGE_PHP_EXT_EXIF),--enable-exif) \
+		$(if $(BR2_PACKAGE_PHP_EXT_FTP),--enable-ftp) \
+		$(if $(BR2_PACKAGE_PHP_EXT_JSON),--enable-json) \
+		$(if $(BR2_PACKAGE_PHP_EXT_TOKENIZER),--enable-tokenizer) \
+		$(if $(BR2_PACKAGE_PHP_EXT_PCNTL),--enable-pcntl) \
+		$(if $(BR2_PACKAGE_PHP_EXT_SHMOP),--enable-shmop) \
+		$(if $(BR2_PACKAGE_PHP_EXT_SYSVMSG),--enable-sysvmsg) \
+		$(if $(BR2_PACKAGE_PHP_EXT_SYSVSEM),--enable-sysvsem) \
+		$(if $(BR2_PACKAGE_PHP_EXT_SYSVSHM),--enable-sysvshm) \
+		$(if $(BR2_PACKAGE_PHP_EXT_ZIP),--enable-zip) \
+		$(if $(BR2_PACKAGE_PHP_EXT_CTYPE),--enable-ctype) \
+		$(if $(BR2_PACKAGE_PHP_EXT_FILTER),--enable-filter) \
+		$(if $(BR2_PACKAGE_PHP_EXT_CALENDAR),--enable-calendar) \
+		$(if $(BR2_PACKAGE_PHP_EXT_FILENIFO),--enable-fileinfo) \
+		$(if $(BR2_PACKAGE_PHP_EXT_BCMATH),--enable-bcmath)
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_OPENSSL),y)
 	PHP_CONF_OPT += --with-openssl=$(STAGING_DIR)/usr
@@ -58,16 +64,14 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_OPENSSL),y)
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
-	PHP_CONF_OPT += --enable-libxml \
-		--with-libxml-dir=${STAGING_DIR}/usr \
-		 --enable-xml \
-		 --enable-xmlreader \
-		 --enable-xmlwriter
+	PHP_CONF_OPT += --enable-libxml --with-libxml-dir=${STAGING_DIR}/usr
 	PHP_DEPENDENCIES += libxml2
 endif
 
-ifeq ($(BR2_PACKAGE_PHP_EXT_SIMPLEXML),y)
-	PHP_CONF_OPT += --enable-simplexml
+ifeq ($(BR2_PACKAGE_PHP_EXT_XMLRPC),y)
+	PHP_CONF_OPT += --with-xmlrpc \
+		$(if $(BR2_PACKAGE_LIBICONV),--with-iconv-dir=$(STAGING_DIR)/usr)
+	PHP_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 endif
 
 ifneq ($(BR2_PACKAGE_PHP_EXT_ZLIB)$(BR2_PACKAGE_PHP_EXT_ZIP),)
@@ -75,17 +79,23 @@ ifneq ($(BR2_PACKAGE_PHP_EXT_ZLIB)$(BR2_PACKAGE_PHP_EXT_ZIP),)
 	PHP_DEPENDENCIES += zlib
 endif
 
-ifeq ($(BR2_PACKAGE_PHP_EXT_EXIF),y)
-	PHP_CONF_OPT += --enable-exif
+ifeq ($(BR2_PACKAGE_PHP_EXT_GETTEXT),y)
+	PHP_CONF_OPT += --with-gettext=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += $(if $(BR2_NEEDS_GETTEXT),gettext)
 endif
 
-ifeq ($(BR2_PACKAGE_PHP_EXT_FTP),y)
-	PHP_CONF_OPT += --enable-ftp
+ifeq ($(BR2_PACKAGE_PHP_EXT_ICONV),y)
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+	PHP_CONF_OPT += --with-iconv=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += libiconv
+else
+	PHP_CONF_OPT += --with-iconv
+endif
 endif
 
-ifeq ($(BR2_PACKAGE_PHP_EXT_GETTEXT),y)
-	PHP_CONF_OPT += --with-gettext=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += $(if $(BR2_NEEDS_GETTEXT),gettext)
+ifeq ($(BR2_PACKAGE_PHP_EXT_INTL),y)
+	PHP_CONF_OPT += --enable-intl --with-icu-dir=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += icu
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GMP),y)
@@ -93,52 +103,11 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_GMP),y)
 	PHP_DEPENDENCIES += gmp
 endif
 
-ifeq ($(BR2_PACKAGE_PHP_EXT_JSON),y)
-	PHP_CONF_OPT += --enable-json
-endif
-
 ifeq ($(BR2_PACKAGE_PHP_EXT_READLINE),y)
 	PHP_CONF_OPT += --with-readline=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += readline
 endif
 
-ifeq ($(BR2_PACKAGE_PHP_EXT_NCURSES),y)
-	PHP_CONF_OPT += --with-ncurses=$(STAGING_DIR)/usr
-	PHP_DEPENDENCIES += ncurses
-endif
-
-ifeq ($(BR2_PACKAGE_PHP_EXT_PCNTL),y)
-	PHP_CONF_OPT += --enable-pcntl
-endif
-
-ifeq ($(BR2_PACKAGE_PHP_EXT_SYSVMSG),y)
-	PHP_CONF_OPT += --enable-sysvmsg
-endif
-
-ifeq ($(BR2_PACKAGE_PHP_EXT_SYSVSEM),y)
-	PHP_CONF_OPT += --enable-sysvsem
-endif
-
-ifeq ($(BR2_PACKAGE_PHP_EXT_SYSVSHM),y)
-	PHP_CONF_OPT += --enable-sysvshm
-endif
-
-ifeq ($(BR2_PACKAGE_PHP_EXT_ZIP),y)
-	PHP_CONF_OPT += --enable-zip
-endif
-
-ifeq ($(BR2_PACKAGE_PHP_EXT_FILTER),y)
-	PHP_CONF_OPT += --enable-filter
-endif
-
-ifeq ($(BR2_PACKAGE_PHP_EXT_CALENDAR),y)
-	PHP_CONF_OPT += --enable-calendar
-endif
-
-ifeq ($(BR2_PACKAGE_PHP_EXT_PCRE),y)
-	PHP_CONF_OPT += --with-pcre-regex
-endif
-
 ### Legacy sqlite2 support
 ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE),y)
 	PHP_CONF_OPT += --with-sqlite
@@ -150,16 +119,22 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_SQLITE_UTF8),y)
 endif
 endif
 
+### Native MySQL extensions
+ifeq ($(BR2_PACKAGE_PHP_EXT_MYSQL),y)
+	PHP_CONF_OPT += --with-mysql=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += mysql_client
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_MYSQLI),y)
+	PHP_CONF_OPT += --with-mysqli=$(STAGING_DIR)/usr/bin/mysql_config
+	PHP_DEPENDENCIES += mysql_client
+endif
+
 ### PDO
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO),y)
 	PHP_CONF_OPT += --enable-pdo
 ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_SQLITE),y)
-ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_SQLITE_EXTERNAL),y)
 	PHP_CONF_OPT += --with-pdo-sqlite=$(STAGING_DIR)/usr
 	PHP_DEPENDENCIES += sqlite
-else
-	PHP_CONF_OPT += --with-pdo-sqlite
-endif
 	PHP_CFLAGS += -DSQLITE_OMIT_LOAD_EXTENSION
 ifneq ($(BR2_LARGEFILE),y)
 	PHP_CFLAGS += -DSQLITE_DISABLE_LFS
@@ -171,6 +146,50 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_PDO_MYSQL),y)
 endif
 endif
 
+### Use external PCRE if it's available
+ifeq ($(BR2_PACKAGE_PCRE),y)
+	PHP_CONF_OPT += --with-pcre-regex=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += pcre
+endif
+
+ifeq ($(BR2_PACKAGE_PHP_EXT_CURL),y)
+	PHP_CONF_OPT += --with-curl=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += libcurl
+endif
+
+ifeq ($(BR2_PACKAGE_PHP_EXT_XSL),y)
+	PHP_CONF_OPT += --with-xsl=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += libxslt
+endif
+
+ifeq ($(BR2_PACKAGE_PHP_EXT_BZIP2),y)
+	PHP_CONF_OPT += --with-bz2=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += bzip2
+endif
+
+### DBA
+ifeq ($(BR2_PACKAGE_PHP_EXT_DBA),y)
+	PHP_CONF_OPT += --enable-dba
+ifneq ($(BR2_PACKAGE_PHP_EXT_DBA_CDB),y)
+	PHP_CONF_OPT += --without-cdb
+endif
+ifneq ($(BR2_PACKAGE_PHP_EXT_DBA_FLAT),y)
+	PHP_CONF_OPT += --without-flatfile
+endif
+ifneq ($(BR2_PACKAGE_PHP_EXT_DBA_INI),y)
+	PHP_CONF_OPT += --without-inifile
+endif
+ifeq ($(BR2_PACKAGE_PHP_EXT_DBA_DB4),y)
+	PHP_CONF_OPT += --with-db4=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += berkeleydb
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_PHP_EXT_SNMP),y)
+	PHP_CONF_OPT += --with-snmp=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += netsnmp
+endif
+
 # Fixup prefix= and exec_prefix= in php-config
 define PHP_FIXUP_PHP_CONFIG
 	$(SED) 's%^prefix="/usr"%prefix="$(STAGING_DIR)/usr"%' \
@@ -185,7 +204,9 @@ define PHP_INSTALL_FIXUP
 	rm -f $(TARGET_DIR)/usr/bin/phpize
 	rm -f $(TARGET_DIR)/usr/bin/php-config
 	if [ ! -f $(TARGET_DIR)/etc/php.ini ]; then \
-		$(INSTALL) -m 0755 $(BR2_PACKAGE_PHP_CONFIG) $(TARGET_DIR)/etc/php.ini; fi
+		$(INSTALL) -m 0755  $(PHP_DIR)/php.ini-production \
+			$(TARGET_DIR)/etc/php.ini; \
+	fi
 endef
 
 PHP_POST_INSTALL_TARGET_HOOKS += PHP_INSTALL_FIXUP
