From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Tue, 11 Aug 2020 20:37:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/ettercap: new package
In-Reply-To: <1597171064-13491-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1597171064-13491-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1597171064-13491-2-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>

Fix missing libpcap

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>

Fix comments

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>

Fix invalid utf-8 error

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-Fix-invalid-utf-8-is-not-supported.patch  | 31 ++++++++++++++++++++++
 package/ettercap/Config.in                         | 24 +++++++++++++++++
 package/ettercap/ettercap.hash                     |  3 +++
 package/ettercap/ettercap.mk                       | 15 +++++++++++
 6 files changed, 75 insertions(+)
 create mode 100644 package/ettercap/0001-Fix-invalid-utf-8-is-not-supported.patch
 create mode 100644 package/ettercap/Config.in
 create mode 100644 package/ettercap/ettercap.hash
 create mode 100644 package/ettercap/ettercap.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ee840db..fee80f0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1395,6 +1395,7 @@ N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
 
 N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+F:	package/ettercap/
 F:	package/python-cycler/
 F:	package/python-matplotlib/
 
diff --git a/package/Config.in b/package/Config.in
index d7e79f4..db886a1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2042,6 +2042,7 @@ menu "Networking applications"
 	source "package/ebtables/Config.in"
 	source "package/ejabberd/Config.in"
 	source "package/ethtool/Config.in"
+	source "package/ettercap/Config.in"
 	source "package/faifa/Config.in"
 	source "package/fail2ban/Config.in"
 	source "package/fastd/Config.in"
diff --git a/package/ettercap/0001-Fix-invalid-utf-8-is-not-supported.patch b/package/ettercap/0001-Fix-invalid-utf-8-is-not-supported.patch
new file mode 100644
index 0000000..0c6a923
--- /dev/null
+++ b/package/ettercap/0001-Fix-invalid-utf-8-is-not-supported.patch
@@ -0,0 +1,31 @@
+From b00e1efceaae979ed103abf343fc44812b48de62 Mon Sep 17 00:00:00 2001
+From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+Date: Tue, 11 Aug 2020 20:11:25 +0200
+Subject: [PATCH] Fix invalid utf-8 is not supported
+
+Fixes fatal error message generated even when
+utf-8 is available.
+Ettercap requires gettext package and works fine.
+
+Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+---
+ src/ec_format.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/ec_format.c b/src/ec_format.c
+index 5c9b850..b3e7f21 100644
+--- a/src/ec_format.c
++++ b/src/ec_format.c
+@@ -418,9 +418,6 @@ int set_utf8_encoding(u_char *fromcode)
+    /* make sure encoding type is supported */
+    cd = iconv_open("UTF-8", (const char*)fromcode);
+    
+-   if (cd == (iconv_t)(-1))
+-      SEMIFATAL_ERROR("The conversion from %s to UTF-8 is not supported.", fromcode);
+-   
+    iconv_close(cd);
+ 
+    utf8_encoding = strdup((const char*)fromcode);
+-- 
+2.7.4
+
diff --git a/package/ettercap/Config.in b/package/ettercap/Config.in
new file mode 100644
index 0000000..b11834a
--- /dev/null
+++ b/package/ettercap/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_ETTERCAP
+	bool "ettercap"
+	depends on BR2_PACKAGE_NCURSES
+	depends on BR2_PACKAGE_NCURSES_WCHAR
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_GEOIP
+	select BR2_PACKAGE_LIBNET
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_ETHTOOL # runtime
+	select BR2_PACKAGE_GETTEXT # runtime
+	select BR2_PACKAGE_LIBPTHREAD_STUB # runtime
+	select BR2_PACKAGE_ZLIB # runtime
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
diff --git a/package/ettercap/ettercap.hash b/package/ettercap/ettercap.hash
new file mode 100644
index 0000000..21f7df4
--- /dev/null
+++ b/package/ettercap/ettercap.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 d0c3ef88dfc284b61d3d5b64d946c1160fd04276b448519c1ae4438a9cdffaf3  ettercap-v0.8.3.1.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/ettercap/ettercap.mk b/package/ettercap/ettercap.mk
new file mode 100644
index 0000000..d419094
--- /dev/null
+++ b/package/ettercap/ettercap.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# ettercap
+#
+################################################################################
+
+ETTERCAP_VERSION = v0.8.3.1
+ETTERCAP_SITE = $(call github,Ettercap,ettercap,$(ETTERCAP_VERSION))
+ETTERCAP_LICENSE = GPL-2.0+
+ETTERCAP_LICENSE_FILES = LICENSE
+ETTERCAP_SUPPORTS_IN_SOURCE_BUILD = NO
+ETTERCAP_DEPENDENCIES = ncurses libopenssl libcurl geoip libnet libpcap
+ETTERCAP_CONF_OPTS = -DENABLE_GTK=OFF
+
+$(eval $(cmake-package))
-- 
2.7.4
