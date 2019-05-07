From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Tue,  7 May 2019 14:33:35 +0200
Subject: [Buildroot] [PATCH] package/ettercap: new package
Message-ID: <1557232415-11421-1-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ettercap is a comprehensive suite for man
in the middle attacks.
It features sniffing of live connections, content
filtering on the fly and many other interesting
tricks.

Ettercap can help identify misconfigured networks,
testing intrusion detection and prevention
applications and build robust embedded systems that
are "security by design" compliant.

This tool can be used for security testing or
educational purposes.

Master branch from :
https://github.com/Ettercap/ettercap
was used as the source for this packet as it
remains in active development (unlike release
version which dates back to 2015).

More information is available at:
https://www.ettercap-project.org/

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 .../0001-Fix-invalid-utf-8-is-not-supported.patch  | 33 ++++++++++++++++++++++
 package/ettercap/Config.in                         | 22 +++++++++++++++
 package/ettercap/ettercap.hash                     |  3 ++
 package/ettercap/ettercap.mk                       | 16 +++++++++++
 6 files changed, 78 insertions(+)
 create mode 100644 package/ettercap/0001-Fix-invalid-utf-8-is-not-supported.patch
 create mode 100644 package/ettercap/Config.in
 create mode 100644 package/ettercap/ettercap.hash
 create mode 100644 package/ettercap/ettercap.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5bfc456..9246d96 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1227,6 +1227,9 @@ F:	package/python-xlib/
 N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
 
+N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+F:	package/ettercap/
+
 N:	Juha Rantanen <juha@codercoded.com>
 F:	package/acsccid/
 
diff --git a/package/Config.in b/package/Config.in
index f592e74..52d08d3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1757,6 +1757,7 @@ endif
 endmenu
 
 menu "Security"
+	source "package/ettercap/Config.in"
 	source "package/libselinux/Config.in"
 	source "package/libsemanage/Config.in"
 	source "package/libsepol/Config.in"
diff --git a/package/ettercap/0001-Fix-invalid-utf-8-is-not-supported.patch b/package/ettercap/0001-Fix-invalid-utf-8-is-not-supported.patch
new file mode 100644
index 0000000..9627cc3
--- /dev/null
+++ b/package/ettercap/0001-Fix-invalid-utf-8-is-not-supported.patch
@@ -0,0 +1,33 @@
+From b4f8a10100669806de6cb37b1c1f747539e93b31 Mon Sep 17 00:00:00 2001
+From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+Date: Tue, 7 May 2019 13:25:44 +0200
+Subject: [PATCH] Fix invalid utf-8 is not supported
+
+Fixes fatal error message generated even when
+utf-8 is available.
+Ettercap requires gettext package and works fine.
+ 
+Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+---
+ ettercap-5fb604823c6063676ebdf7cac66b7807acb4f7ed/src/ec_format.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/src/ec_format.c b/ettercap-5fb604823c6063676ebdf7cac66b7807acb4f7ed/src/ec_format.c
+index 5c9b850..dd9d972 100644
+--- a/src/ec_format.c
++++ b/src/ec_format.c
+@@ -417,10 +417,7 @@ int set_utf8_encoding(u_char *fromcode)
+ 
+    /* make sure encoding type is supported */
+    cd = iconv_open("UTF-8", (const char*)fromcode);
+-   
+-   if (cd == (iconv_t)(-1))
+-      SEMIFATAL_ERROR("The conversion from %s to UTF-8 is not supported.", fromcode);
+-   
++      
+    iconv_close(cd);
+ 
+    utf8_encoding = strdup((const char*)fromcode);
+-- 
+2.7.4
+
diff --git a/package/ettercap/Config.in b/package/ettercap/Config.in
new file mode 100644
index 0000000..fbab876
--- /dev/null
+++ b/package/ettercap/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_ETTERCAP
+	bool "ettercap"
+	select BR2_PACKAGE_ETHTOOL # runtime
+	select BR2_PACKAGE_GEOIP # runtime
+	select BR2_PACKAGE_GETTEXT # runtime
+	select BR2_PACKAGE_LIBCURL # runtime
+	select BR2_PACKAGE_LIBNET # runtime
+	select BR2_PACKAGE_LIBPCAP # runtime
+	select BR2_PACKAGE_LIBPTHREAD_STUB # runtime
+	select BR2_PACKAGE_NCURSES # runtime
+	select BR2_PACKAGE_OPENSSL # runtime
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
index 0000000..776c34c
--- /dev/null
+++ b/package/ettercap/ettercap.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 a6ea1b70f9e1d8ba8815ca540ff1571556d6ba19cfd05c409f518d03e669befc  ettercap-5fb604823c6063676ebdf7cac66b7807acb4f7ed.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/ettercap/ettercap.mk b/package/ettercap/ettercap.mk
new file mode 100644
index 0000000..b913708
--- /dev/null
+++ b/package/ettercap/ettercap.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# ettercap
+#
+################################################################################
+
+ETTERCAP_VERSION = 5fb604823c6063676ebdf7cac66b7807acb4f7ed
+ETTERCAP_SITE = $(call github,Ettercap,ettercap,$(ETTERCAP_VERSION))
+ETTERCAP_LICENSE = GPL-2.0
+ETTERCAP_LICENSE_FILES = LICENSE
+ETTERCAP_SUPPORTS_IN_SOURCE_BUILD = NO
+ETTERCAP_DEPENDENCIES = geoip host-ncurses libzlib \
+	libcurl libnet libopenssl libpcap ncurses
+ETTERCAP_CONF_OPTS = -DENABLE_GTK=NO
+
+$(eval $(cmake-package))
-- 
2.7.4
