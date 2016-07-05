From: Olivier Singla <olivier.singla@gmail.com>
Date: Mon,  4 Jul 2016 23:00:30 -0400
Subject: [Buildroot] [PATCH 1/1] Added shellinabox v2.19
Message-ID: <1467687630-10035-1-git-send-email-olivier.singla@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Olivier <olivier.singla@gmail.com>

Shell In A Box implements a web server that can export arbitrary command
line tools to a web based terminal emulator. This emulator is accessible
to any JavaScript and CSS enabled web browser and does not require any
additional browser plugins.

Signed-off-by: Olivier <olivier.singla@gmail.com>
---
 package/Config.in                                  |  1 +
 .../shellinabox/0001-Makefile.am-fix-static.patch  | 11 +++++++++++
 package/shellinabox/Config.in                      | 10 ++++++++++
 package/shellinabox/shellinabox.hash               |  3 +++
 package/shellinabox/shellinabox.mk                 | 23 ++++++++++++++++++++++
 5 files changed, 48 insertions(+)
 create mode 100644 package/shellinabox/0001-Makefile.am-fix-static.patch
 create mode 100644 package/shellinabox/Config.in
 create mode 100644 package/shellinabox/shellinabox.hash
 create mode 100644 package/shellinabox/shellinabox.mk

diff --git a/package/Config.in b/package/Config.in
index 2c4c196..91fcf37 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1525,6 +1525,7 @@ menu "Networking applications"
 	source "package/sconeserver/Config.in"
 	source "package/ser2net/Config.in"
 	source "package/shairport-sync/Config.in"
+	source "package/shellinabox/Config.in"
 	source "package/smcroute/Config.in"
 	source "package/socat/Config.in"
 	source "package/socketcand/Config.in"
diff --git a/package/shellinabox/0001-Makefile.am-fix-static.patch b/package/shellinabox/0001-Makefile.am-fix-static.patch
new file mode 100644
index 0000000..e1ad67d
--- /dev/null
+++ b/package/shellinabox/0001-Makefile.am-fix-static.patch
@@ -0,0 +1,11 @@
+--- shellinabox-2.19/Makefile.am.orig	2016-07-03 20:46:42.655784211 -0400
++++ shellinabox-2.19/Makefile.am	2016-07-03 20:46:50.582801842 -0400
+@@ -126,7 +126,7 @@
+ 
+ shellinaboxd_LDADD   = liblogging.la                                          \
+                        libhttp.la
+-shellinaboxd_LDFLAGS = -static
++shellinaboxd_LDFLAGS =
+ ## Added this for compatibility with older versions of autoconf/automake
+ docdir               = ${datadir}/doc/${PACKAGE}
+ 
diff --git a/package/shellinabox/Config.in b/package/shellinabox/Config.in
new file mode 100644
index 0000000..75cdfd8
--- /dev/null
+++ b/package/shellinabox/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SHELLINABOX
+	bool "shellinabox"
+	select BR2_PACKAGE_ZLIB
+	help
+
+	  https://github.com/shellinabox/shellinabox
diff --git a/package/shellinabox/shellinabox.hash b/package/shellinabox/shellinabox.hash
new file mode 100644
index 0000000..16bf12c
--- /dev/null
+++ b/package/shellinabox/shellinabox.hash
@@ -0,0 +1,3 @@
+# Locally calculated after checking pgp signature
+
+sha256	d25ba9f72f04471fc1a8a564c65ef466c4553280ff3eeb365ed9c897d05ed2da  v2.19.tar.gz
diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
new file mode 100644
index 0000000..03adc21
--- /dev/null
+++ b/package/shellinabox/shellinabox.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# shellinabox
+#
+################################################################################
+
+SHELLINABOX_VERSION = 2.19
+SHELLINABOX_SOURCE = v$(SHELLINABOX_VERSION).tar.gz
+SHELLINABOX_SITE = https://github.com/shellinabox/shellinabox/archive
+SHELLINABOX_INSTALL_STAGING = YES
+SHELLINABOX_LICENSE = GNU GPL v2
+#SHELLINABOX_CONF_OPTS = --enable-shared --disable-static
+SHELLINABOX_AUTORECONF = YES
+
+SHELLINABOX_DEPENDENCIES = zlib 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	SHELLINABOX_CONF_OPTS += --enable-ssl
+else
+	SHELLINABOX_CONF_OPTS += --disable-ssl
+endif
+SHELLINABOX_CONF_OPTS += --disable-runtime-loading
+
+$(eval $(autotools-package))
-- 
2.5.5
