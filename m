From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:55 -0000
Subject: [Buildroot] [git commit branch/next] php: fix WDDX extension build
	failure
Message-ID: <20120802195236.3687E96AE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12d80fcf93bbde9e2d929fe04d9a6e7b739d54c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix WDDX extension build failure.
The documentation and source are conflicting about this, in theory
libexpat support is deprecated and libxml2 can replace it, but it seems
not so for WDDX, so pull in expat for it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/php/Config.ext |    1 +
 package/php/php.mk     |    6 +++++-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/php/Config.ext b/package/php/Config.ext
index 80bab70..2cf71d3 100644
--- a/package/php/Config.ext
+++ b/package/php/Config.ext
@@ -310,6 +310,7 @@ config BR2_PACKAGE_PHP_EXT_SIMPLEXML
 
 config BR2_PACKAGE_PHP_EXT_WDDX
 	bool "WDDX"
+	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_PHP_EXT_LIBXML2
 	help
 	  WDDX support
diff --git a/package/php/php.mk b/package/php/php.mk
index e9bda44..af041c9 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -38,7 +38,6 @@ PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_EXT_SOCKETS),--enable-sockets) \
 		$(if $(BR2_PACKAGE_PHP_EXT_DOM),--enable-dom) \
 		$(if $(BR2_PACKAGE_PHP_EXT_SIMPLEXML),--enable-simplexml) \
 		$(if $(BR2_PACKAGE_PHP_EXT_SOAP),--enable-soap) \
-		$(if $(BR2_PACKAGE_PHP_EXT_WDDX),--enable-wddx) \
 		$(if $(BR2_PACKAGE_PHP_EXT_XML),--enable-xml) \
 		$(if $(BR2_PACKAGE_PHP_EXT_XMLREADER),--enable-xmlreader) \
 		$(if $(BR2_PACKAGE_PHP_EXT_XMLWRITER),--enable-xmlwriter) \
@@ -68,6 +67,11 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_LIBXML2),y)
 	PHP_DEPENDENCIES += libxml2
 endif
 
+ifeq ($(BR2_PACKAGE_PHP_EXT_WDDX),y)
+	PHP_CONF_OPT += --enable-wddx --with-libexpat-dir=$(STAGING_DIR)/usr
+	PHP_DEPENDENCIES += expat
+endif
+
 ifeq ($(BR2_PACKAGE_PHP_EXT_XMLRPC),y)
 	PHP_CONF_OPT += --with-xmlrpc \
 		$(if $(BR2_PACKAGE_LIBICONV),--with-iconv-dir=$(STAGING_DIR)/usr)
