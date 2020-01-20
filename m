From: Frank Vanbever <frank.vanbever@essensium.com>
Date: Mon, 20 Jan 2020 13:33:09 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/libmodsecurity: new package
In-Reply-To: <20200110140017.15045-1-frank.vanbever@essensium.com>
References: <20200110140017.15045-1-frank.vanbever@essensium.com>
Message-ID: <20200120123310.29892-1-frank.vanbever@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dependency on !BR2_STATIC_LIBS is due to missing Libs.private in the
libmodconfig pkg-config file making builds that statically link against
libmodsecurity fail.

Lua is disabled due to using the host libraries.
Yajl is disabled as enabling it forces the tests to be built. These tests have a
hard dependency on libmodsecurity.a which is not built when --disable-static is
used in the configuration. There is no flag to disable these tests.

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
---
Changes v1 -> v2:
- bump version to 3.0.4
- fix URL
- Move menu entry to Libraries/Networking
- Add reconf comment
- Coding style fixes
- cleaned up CONF_OPTS
- Add explicit C++ & static dependency
- Explicitly disabled unavailable dependencies
- Explicitly disabled Yajl and Lua
- Cleaned up dependencies

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
---
 DEVELOPERS                                    |  3 +
 package/Config.in                             |  1 +
 ...-CANONICAL_HOST-cannot-be-determined.patch | 31 +++++++++++
 ...test-for-uClinux-in-configure-script.patch | 28 ++++++++++
 package/libmodsecurity/Config.in              | 19 +++++++
 package/libmodsecurity/libmodsecurity.hash    |  4 ++
 package/libmodsecurity/libmodsecurity.mk      | 55 +++++++++++++++++++
 7 files changed, 141 insertions(+)
 create mode 100644 package/libmodsecurity/0001-Fail-when-CANONICAL_HOST-cannot-be-determined.patch
 create mode 100644 package/libmodsecurity/0002-test-for-uClinux-in-configure-script.patch
 create mode 100644 package/libmodsecurity/Config.in
 create mode 100644 package/libmodsecurity/libmodsecurity.hash
 create mode 100644 package/libmodsecurity/libmodsecurity.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a1eb052652..e1546cf072 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -955,6 +955,9 @@ F:	package/ucl/
 F:	package/upx/
 F:	package/zxing-cpp/
 
+N:	Frank Vanbever <frank.vanbever@essensium.com>
+F:	package/libmodsecurity/
+
 N:	Ga?l Portay <gael.portay@collabora.com>
 F:	package/qt5/qt5virtualkeyboard/
 F:	package/qt5/qt5webengine/
diff --git a/package/Config.in b/package/Config.in
index 4c94914680..1540871dcc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1656,6 +1656,7 @@ menu "Networking"
 	source "package/libminiupnpc/Config.in"
 	source "package/libmnl/Config.in"
 	source "package/libmodbus/Config.in"
+	source "package/libmodsecurity/Config.in"
 	source "package/libnatpmp/Config.in"
 	source "package/libndp/Config.in"
 	source "package/libnet/Config.in"
diff --git a/package/libmodsecurity/0001-Fail-when-CANONICAL_HOST-cannot-be-determined.patch b/package/libmodsecurity/0001-Fail-when-CANONICAL_HOST-cannot-be-determined.patch
new file mode 100644
index 0000000000..ab00a14e2a
--- /dev/null
+++ b/package/libmodsecurity/0001-Fail-when-CANONICAL_HOST-cannot-be-determined.patch
@@ -0,0 +1,31 @@
+From 0832208360aab69fbaec76225db67801840a33fe Mon Sep 17 00:00:00 2001
+From: Frank Vanbever <frank.vanbever@essensium.com>
+Date: Fri, 10 Jan 2020 11:14:43 +0100
+Subject: [PATCH] Fail when CANONICAL_HOST cannot be determined
+
+When the CANONICAL_HOST is unknown the configure script exits
+with exit code 0 even though no makefile was produced.
+
+Upstream: https://github.com/SpiderLabs/ModSecurity/pull/2235
+
+Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 95e48843..5e6971f4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -193,7 +193,7 @@ case $host in
+     ;;
+        *)
+     echo "Unknown CANONICAL_HOST $host"
+-    exit
++    exit 1
+     ;;
+ esac
+ 
+-- 
+2.20.1
+
diff --git a/package/libmodsecurity/0002-test-for-uClinux-in-configure-script.patch b/package/libmodsecurity/0002-test-for-uClinux-in-configure-script.patch
new file mode 100644
index 0000000000..ccd96fea95
--- /dev/null
+++ b/package/libmodsecurity/0002-test-for-uClinux-in-configure-script.patch
@@ -0,0 +1,28 @@
+From 13c505e30474c919ed9ae552e459769c456da21e Mon Sep 17 00:00:00 2001
+From: Frank Vanbever <frank.vanbever@essensium.com>
+Date: Fri, 10 Jan 2020 11:24:43 +0100
+Subject: [PATCH] test for uClinux in configure script
+
+Upstream: https://github.com/SpiderLabs/ModSecurity/pull/2235
+
+Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5e6971f4..51d38071 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -156,7 +156,7 @@ case $host in
+     AC_DEFINE([MACOSX], [1], [Define if the operating system is Macintosh OSX])
+     PLATFORM="MacOSX"
+     ;;
+-  *-*-linux*)
++  *-*-linux* | *-*uclinux*)
+     echo "Checking platform... Identified as Linux"
+     AC_DEFINE([LINUX], [1], [Define if the operating system is LINUX])
+     PLATFORM="Linux"
+-- 
+2.20.1
+
diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
new file mode 100644
index 0000000000..129881b0de
--- /dev/null
+++ b/package/libmodsecurity/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LIBMODSECURITY
+	bool "libmodsecurity"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PCRE
+	help
+	  Libmodsecurity is one component of the ModSecurity
+	  v3 project. The library codebase serves as an
+	  interface to ModSecurity Connectors taking in web
+	  traffic and applying traditional ModSecurity
+	  processing. In general, it provides the capability
+	  to load/interpret rules written in the ModSecurity
+	  SecRules format and apply them to HTTP content
+	  provided by your application via Connectors.
+
+	  https://github.com/SpiderLabs/ModSecurity
+
+comment "libmodsecurity needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
new file mode 100644
index 0000000000..ddce3ef9c6
--- /dev/null
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -0,0 +1,4 @@
+# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.4/modsecurity-v3.0.4.tar.gz.sha256
+sha256  b4231177dd80b4e076b228e57d498670113b69d445bab86db25f65346c24db22  modsecurity-v3.0.4.tar.gz
+# Localy calculated
+sha256 c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
new file mode 100644
index 0000000000..c32bfb4b3c
--- /dev/null
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# libmodsecurity
+#
+################################################################################
+
+LIBMODSECURITY_VERSION = 3.0.4
+LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
+LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
+LIBMODSECURITY_INSTALL_STAGING = YES
+LIBMODSECURITY_LICENSE = Apache-2.0
+LIBMODSECURITY_LICENSE_FILES = LICENSE
+# 0002-test-for-uClinux-in-configure-script.patch
+LIBMODSECURITY_AUTORECONF = YES
+# libinjection uses AC_CHECK_FILE, not available in cross-compile
+LIBMODSECURITY_CONF_ENV = \
+	ac_cv_file_others_libinjection_src_libinjection_html5_c=yes
+
+LIBMODSECURITY_DEPENDENCIES = pcre
+LIBMODSECURITY_CONF_OPTS = \
+	--disable-examples \
+	--without-lmdb \
+	--without-ssdeep \
+	--without-lua \
+	--without-yajl
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+LIBMODSECURITY_DEPENDENCIES += libxml2
+LIBMODSECURITY_CONF_OPTS += --with-libxml="$(STAGING_DIR)/usr/bin/xml2-config"
+else
+LIBMODSECURITY_CONF_OPTS += --without-libxml
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+LIBMODSECURITY_DEPENDENCIES += libcurl
+LIBMODSECURITY_CONF_OPTS += --with-curl="$(STAGING_DIR)/usr/bin/curl-config"
+else
+LIBMODSECURITY_CONF_OPTS += --without-curl
+endif
+
+ifeq ($(BR2_PACKAGE_GEOIP),y)
+LIBMODSECURITY_DEPENDENCIES += geoip
+LIBMODSECURITY_CONF_OPTS += --with-geoip
+else
+LIBMODSECURITY_CONF_OPTS += --without-geoip
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
+LIBMODSECURITY_DEPENDENCIES += libmaxminddb
+LIBMODSECURITY_CONF_OPTS += --with-maxmind
+else
+LIBMODSECURITY_CONF_OPTS += --without-maxmind
+endif
+
+$(eval $(autotools-package))
-- 
2.20.1
