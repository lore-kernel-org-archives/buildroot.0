From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 27 Jul 2012 10:51:47 +0100
Subject: [Buildroot] [PATCH v2] sconeserver: new package
Message-ID: <1343382707-2698-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 v2: Extensive rework in response to feedback on mailing list.

 package/Config.in                  |    1 +
 package/sconeserver/Config.in      |   84 +++++++++++++++++++++++++++
 package/sconeserver/sconeserver.mk |  111 ++++++++++++++++++++++++++++++++++++
 3 files changed, 196 insertions(+)
 create mode 100644 package/sconeserver/Config.in
 create mode 100644 package/sconeserver/sconeserver.mk

diff --git a/package/Config.in b/package/Config.in
index f664b8e..a88e639 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -591,6 +591,7 @@ source "package/rsh-redone/Config.in"
 source "package/rsync/Config.in"
 source "package/rtorrent/Config.in"
 source "package/samba/Config.in"
+source "package/sconeserver/Config.in"
 source "package/ser2net/Config.in"
 source "package/socat/Config.in"
 source "package/socketcand/Config.in"
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
new file mode 100644
index 0000000..3fa2e5f
--- /dev/null
+++ b/package/sconeserver/Config.in
@@ -0,0 +1,84 @@
+menuconfig BR2_PACKAGE_SCONESERVER
+	bool "sconeserver"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_PCRE
+	help
+	  Sconeserver is a modular, object-orientated and extremely versatile
+	  network server framework for GNU/Linux and UNIX-like platforms.
+
+	  http://www.sconemad.com/sconeserver/
+
+if BR2_PACKAGE_SCONESERVER
+
+comment "Sconeserver modules"
+
+config BR2_PACKAGE_SCONESERVER_EXAMPLES
+	bool "examples"
+	help
+	  Example modules for Sconeserver
+
+config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE
+	bool "http::sconesite"
+	select BR2_PACKAGE_LIBXML2
+	help
+	  http::sconesite module for Sconeserver
+
+config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE
+	bool "http::sconesite::image"
+	depends on BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE
+	select BR2_PACKAGE_IMAGEMAGICK
+	help
+	  http::sconesite::image module for Sconeserver
+
+config BR2_PACKAGE_SCONESERVER_MYSQL
+	bool "mysql"
+	select BR2_PACKAGE_MYSQL_CLIENT
+	help
+	  MySQL module for Sconeserver
+
+config BR2_PACKAGE_SCONESERVER_BLUETOOTH
+	bool "bluetooth"
+	select BR2_PACKAGE_BLUEZ_UTILS
+	help
+	  Bluetooth module for Sconeserver
+
+config BR2_PACKAGE_SCONESERVER_RSS
+	bool "rss"
+	select BR2_PACKAGE_LIBXML2
+	help
+	  RSS module for Sconeserver
+
+config BR2_PACKAGE_SCONESERVER_LOCATION
+	bool "location"
+	select BR2_PACKAGE_GPSD
+	help
+	  Location module for Sconeserver
+
+config BR2_PACKAGE_SCONESERVER_LETTUCE
+	bool "lettuce"
+	help
+	  Sconeserver module for Lettuce embedded automation platform
+
+	  http://www.sconemad.com/lettuce/
+
+config BR2_PACKAGE_SCONESERVER_MATHS
+	bool "maths"
+	select BR2_PACKAGE_MPFR
+	help
+	  Mathematics module for Sconeserver
+
+config BR2_PACKAGE_SCONESERVER_TESTBUILDER
+	bool "testbuilder"
+	help
+	  Testbuilder module for Sconeserver
+
+config BR2_PACKAGE_SCONESERVER_UI
+	bool "ui"
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  UI module for Sconeserver
+
+endif # BR2_PACKAGE_SCONESERVER
+
+comment "sconeserver requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
new file mode 100644
index 0000000..45aadef
--- /dev/null
+++ b/package/sconeserver/sconeserver.mk
@@ -0,0 +1,111 @@
+#############################################################
+#
+# sconeserver
+#
+#############################################################
+# Release 0.6.0 doesn't build cleanly, so use a recent
+# Subversion trunk snapshot.
+SCONESERVER_VERSION = 178
+SCONESERVER_SITE = \
+	https://sconeserver.svn.sourceforge.net/svnroot/sconeserver/trunk
+SCONESERVER_SITE_METHOD = svn
+
+SCONESERVER_LICENSE = GPLv2+
+SCONESERVER_LICENSE_FILES = COPYING
+
+SCONESERVER_DEPENDENCIES += pcre
+SCONESERVER_CONF_OPT += --with-ip --with-local
+
+# Sconeserver configure script fails to find the libxml2 headers.
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+	SCONESERVER_CONF_OPT += CPPFLAGS="-I$(STAGING_DIR)/usr/include/libxml2"
+endif
+
+ifeq ($(BR2_INET_IPV6),y)
+	SCONESERVER_CONF_OPT += --with-ip6
+else
+	SCONESERVER_CONF_OPT += --without-ip6
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	SCONESERVER_DEPENDENCIES += openssl
+	SCONESERVER_CONF_OPT += --with-ssl
+else
+	SCONESERVER_CONF_OPT += --without-ssl
+endif
+
+ifeq ($(BR2_PACKAGE_SCONESERVER_EXAMPLES),y)
+	SCONESERVER_CONF_OPT += --with-examples
+else
+	SCONESERVER_CONF_OPT += --without-examples
+endif
+
+ifeq ($(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE),y)
+	SCONESERVER_DEPENDENCIES += libxml2
+	SCONESERVER_CONF_OPT += --with-sconesite
+else
+	SCONESERVER_CONF_OPT += --without-sconesite
+endif
+
+ifeq ($(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE_IMAGE),y)
+	SCONESERVER_DEPENDENCIES += imagemagick
+	SCONESERVER_CONF_OPT += --with-sconesite-image
+else
+	SCONESERVER_CONF_OPT += --without-sconesite-image
+endif
+
+ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
+	SCONESERVER_DEPENDENCIES += mysql_client
+	SCONESERVER_CONF_OPT += --with-mysql
+else
+	SCONESERVER_CONF_OPT += --without-mysql
+endif
+
+ifeq ($(BR2_PACKAGE_SCONESERVER_BLUETOOTH),y)
+	SCONESERVER_DEPENDENCIES += bluez_utils
+	SCONESERVER_CONF_OPT += --with-bluetooth
+else
+	SCONESERVER_CONF_OPT += --without-bluetooth
+endif
+
+ifeq ($(BR2_PACKAGE_SCONESERVER_RSS),y)
+	SCONESERVER_DEPENDENCIES += libxml2
+	SCONESERVER_CONF_OPT += --with-rss
+else
+	SCONESERVER_CONF_OPT += --without-rss
+endif
+
+ifeq ($(BR2_PACKAGE_SCONESERVER_LOCATION),y)
+	SCONESERVER_DEPENDENCIES += gpsd
+	SCONESERVER_CONF_OPT += --with-location
+else
+	SCONESERVER_CONF_OPT += --without-location
+endif
+
+ifeq ($(BR2_PACKAGE_SCONESERVER_LETTUCE),y)
+	SCONESERVER_CONF_OPT += --with-lettuce
+else
+	SCONESERVER_CONF_OPT += --without-lettuce
+endif
+
+ifeq ($(BR2_PACKAGE_SCONESERVER_MATHS),y)
+	SCONESERVER_DEPENDENCIES += mpfr
+	SCONESERVER_CONF_OPT += --with-maths
+else
+	SCONESERVER_CONF_OPT += --without-maths
+endif
+
+ifeq ($(BR2_PACKAGE_SCONESERVER_TESTBUILDER),y)
+	SCONESERVER_CONF_OPT += --with-testbuilder
+else
+	SCONESERVER_CONF_OPT += --without-testbuilder
+endif
+
+ifeq ($(BR2_PACKAGE_SCONESERVER_UI),y)
+	SCONESERVER_DEPENDENCIES += xlib_libX11
+	SCONESERVER_CONF_OPT += --with-ui
+else
+	SCONESERVER_CONF_OPT += --without-ui
+endif
+
+$(eval $(autotools-package))
-- 
1.7.9.5
