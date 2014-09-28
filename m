From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Sep 2014 21:12:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/pure-ftpd: New package
Message-ID: <1411931570-28317-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                            |    1 +
 package/pure-ftpd/Config.in                  |   12 +++++++++
 package/pure-ftpd/pure-ftpd-0001-cross.patch |   25 ++++++++++++++++++
 package/pure-ftpd/pure-ftpd.mk               |   35 ++++++++++++++++++++++++++
 4 files changed, 73 insertions(+)
 create mode 100644 package/pure-ftpd/Config.in
 create mode 100644 package/pure-ftpd/pure-ftpd-0001-cross.patch
 create mode 100644 package/pure-ftpd/pure-ftpd.mk

diff --git a/package/Config.in b/package/Config.in
index 8eeead6..f11c6ec 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1058,6 +1058,7 @@ endif
 	source "package/proxychains-ng/Config.in"
 	source "package/ptpd/Config.in"
 	source "package/ptpd2/Config.in"
+	source "package/pure-ftpd/Config.in"
 	source "package/quagga/Config.in"
 	source "package/radvd/Config.in"
 	source "package/rp-pppoe/Config.in"
diff --git a/package/pure-ftpd/Config.in b/package/pure-ftpd/Config.in
new file mode 100644
index 0000000..c1b2529
--- /dev/null
+++ b/package/pure-ftpd/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PURE_FTPD
+	bool "pure-ftpd"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	depends on BR2_USE_MMU # fork()
+	help
+	  Pure-FTPd is a free (BSD), secure, production-quality and standard-
+	  conformant FTP server. It doesn't provide useless bells and whistles,
+	  but focuses on efficiency and ease of use. It provides simple answers
+	  to common needs, plus unique useful features for personal users as
+	  well as hosting providers.
+
+	  http://www.pureftpd.org
diff --git a/package/pure-ftpd/pure-ftpd-0001-cross.patch b/package/pure-ftpd/pure-ftpd-0001-cross.patch
new file mode 100644
index 0000000..f8b1d81
--- /dev/null
+++ b/package/pure-ftpd/pure-ftpd-0001-cross.patch
@@ -0,0 +1,25 @@
+Do not include host paths when cross-compiling.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr pure-ftpd-1.0.36.org/configure pure-ftpd-1.0.36/configure
+--- pure-ftpd-1.0.36.org/configure	2012-03-16 06:29:23.000000000 +0100
++++ pure-ftpd-1.0.36/configure	2014-09-28 19:55:56.650529713 +0200
+@@ -6319,17 +6319,6 @@
+ 
+ 
+ 
+-if test -d /usr/local/include; then
+-  CPPFLAGS="$CPPFLAGS -I/usr/local/include"
+-fi
+-
+-if test -d /usr/kerberos/include; then
+-  CPPFLAGS="$CPPFLAGS -I/usr/kerberos/include"
+-fi
+-
+-if test -d /usr/local/lib; then
+-  LDFLAGS="$LDFLAGS -L/usr/local/lib"
+-fi
+ 
+ if uname | fgrep SunOS > /dev/null 2> /dev/null ; then
+   CPPFLAGS="$CPPFLAGS -D_XPG4_2=1"
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
new file mode 100644
index 0000000..cf43220
--- /dev/null
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# pure-ftpd
+#
+################################################################################
+
+PURE_FTPD_VERSION = 1.0.36
+PURE_FTPD_SITE = http://download.pureftpd.org/pub/pure-ftpd/releases
+PURE_FTPD_LICENSE = ISC
+PURE_FTPD_LICENSE_FILES = COPYING
+PURE_FTPD_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
+PURE_FTPD_CONF_OPT = \
+	--with-altlog \
+	--with-puredb \
+	--with-rfc2640
+
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+PURE_FTPD_CONF_OPT += --with-capabilities
+PURE_FTPD_DEPENDENCIES += libcap
+else
+PURE_FTPD_CONF_OPT += --without-capabilities
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+PURE_FTPD_CONF_OPT += --with-tls
+PURE_FTPD_DEPENDENCIES += openssl
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+PURE_FTPD_CONF_ENV += LIBS='-lssl -lcrypto -lz'
+endif
+else
+PURE_FTPD_CONF_OPT += --without-tls
+endif
+
+$(eval $(autotools-package))
-- 
1.7.10.4
