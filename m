From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 12 Aug 2020 00:51:20 +0200
Subject: [Buildroot] [PATCH] package/ettercap: new package
Message-ID: <20200811225120.622906-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jugurtha BELKALEM via buildroot <buildroot@busybox.net>

TODO

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
v3
Q: is geoip really needed or used ?
Because there is no GeoIP.dat file in the rootfs (/usr/local/share/GeoIP/GeoIP.dat).
Note: Fedora disabled GeoIP support for Ettercap!

v2 TODO
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/ettercap/Config.in     | 28 ++++++++++++++++++++++++++++
 package/ettercap/ettercap.hash |  3 +++
 package/ettercap/ettercap.mk   | 30 ++++++++++++++++++++++++++++++
 5 files changed, 63 insertions(+)
 create mode 100644 package/ettercap/Config.in
 create mode 100644 package/ettercap/ettercap.hash
 create mode 100644 package/ettercap/ettercap.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ee840dbb8b..fee80f04fb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1395,6 +1395,7 @@ N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
 
 N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+F:	package/ettercap/
 F:	package/python-cycler/
 F:	package/python-matplotlib/
 
diff --git a/package/Config.in b/package/Config.in
index 3ff2674be7..83fbdb8492 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2045,6 +2045,7 @@ menu "Networking applications"
 	source "package/ebtables/Config.in"
 	source "package/ejabberd/Config.in"
 	source "package/ethtool/Config.in"
+	source "package/ettercap/Config.in"
 	source "package/faifa/Config.in"
 	source "package/fail2ban/Config.in"
 	source "package/fastd/Config.in"
diff --git a/package/ettercap/Config.in b/package/ettercap/Config.in
new file mode 100644
index 0000000000..968e949b99
--- /dev/null
+++ b/package/ettercap/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_ETTERCAP
+	bool "ettercap"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR # ncurses wchar
+	select BR2_PACKAGE_ETHTOOL # runtime
+	select BR2_PACKAGE_GEOIP
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBNET
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  Ettercap is a comprehensive suite for man
+	  in the middle attacks. It features sniffing of
+	  live connections, content filtering on the fly
+	  and many other interesting tricks. It supports
+	  active and passive dissection of many protocols
+	  and includes many features for network and
+	  host analysis.
+
+	  http://www.ettercap-project.org/
+
+comment "ettercap needs a toolchain w/ threads, wchar, dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR ||BR2_STATIC_LIBS
diff --git a/package/ettercap/ettercap.hash b/package/ettercap/ettercap.hash
new file mode 100644
index 0000000000..61ecbec047
--- /dev/null
+++ b/package/ettercap/ettercap.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 d0c3ef88dfc284b61d3d5b64d946c1160fd04276b448519c1ae4438a9cdffaf3  ettercap-0.8.3.1.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/ettercap/ettercap.mk b/package/ettercap/ettercap.mk
new file mode 100644
index 0000000000..d060f7df7e
--- /dev/null
+++ b/package/ettercap/ettercap.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# ettercap
+#
+################################################################################
+
+ETTERCAP_VERSION = 0.8.3.1
+ETTERCAP_SITE = $(call github,Ettercap,ettercap,v$(ETTERCAP_VERSION))
+ETTERCAP_LICENSE = GPL-2.0+
+ETTERCAP_LICENSE_FILES = LICENSE
+ETTERCAP_SUPPORTS_IN_SOURCE_BUILD = NO
+ETTERCAP_INSTALL_STAGING = YES
+ETTERCAP_DEPENDENCIES = geoip libcurl libnet libpcap ncurses openssl zlib \
+	host-bison host-flex host-pkgconf
+
+ETTERCAP_CONF_OPTS = -DENABLE_IPV6=ON -DENABLE_GTK=OFF -DBUNDLED_LIBS=OFF
+
+ifeq ($(BR2_PACKAGE_PCRE),y)
+ETTERCAP_DEPENDENCIES += pcre
+endif
+
+# Replace the default encoding set by ettercap configuration
+# files installed by the package.
+define ETTERCAP_SET_UTF8_ENCODING
+	$(SED) 's%^utf8_encoding.*%utf8_encoding = "UTF-8"%' \
+		$(TARGET_DIR)/etc/ettercap/etter.conf
+endef
+ETTERCAP_POST_INSTALL_TARGET_HOOKS += ETTERCAP_SET_UTF8_ENCODING
+
+$(eval $(cmake-package))
-- 
2.25.4
