From: Olivier Singla <olivier.singla@gmail.com>
Date: Tue,  5 Jul 2016 22:27:31 -0400
Subject: [Buildroot] [PATCH 1/1] shellinabox: new package
Message-ID: <1467772051-1522-1-git-send-email-olivier.singla@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Olivier Singla" <olivier.singla@gmail.com>

Shell In A Box implements a web server that can export arbitrary command
line tools to a web based terminal emulator. This emulator is accessible
to any JavaScript and CSS enabled web browser and does not require any
additional browser plugins.

Signed-off-by: "Olivier Singla" <olivier.singla@gmail.com>
---
 package/Config.in                                  |  1 +
 .../shellinabox/0001-Makefile.am-fix-static.patch  | 15 +++++++++++++++
 package/shellinabox/Config.in                      | 11 +++++++++++
 package/shellinabox/shellinabox.hash               |  2 ++
 package/shellinabox/shellinabox.mk                 | 22 ++++++++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/shellinabox/0001-Makefile.am-fix-static.patch
 create mode 100644 package/shellinabox/Config.in
 create mode 100644 package/shellinabox/shellinabox.hash
 create mode 100644 package/shellinabox/shellinabox.mk

diff --git a/package/Config.in b/package/Config.in
index 15271a2..d6c7600 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1530,6 +1530,7 @@ menu "Networking applications"
 	source "package/sconeserver/Config.in"
 	source "package/ser2net/Config.in"
 	source "package/shairport-sync/Config.in"
+	source "package/shellinabox/Config.in"
 	source "package/smcroute/Config.in"
 	source "package/socat/Config.in"
 	source "package/socketcand/Config.in"
diff --git a/package/shellinabox/0001-Makefile.am-fix-static.patch b/package/shellinabox/0001-Makefile.am-fix-static.patch
new file mode 100644
index 0000000..0fadde0
--- /dev/null
+++ b/package/shellinabox/0001-Makefile.am-fix-static.patch
@@ -0,0 +1,15 @@
+Makefile: disable always building statically.
+
+Signed-off-by:  "Olivier Singla" <olivier.singla@gmail.com>
+
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
index 0000000..393afe1
--- /dev/null
+++ b/package/shellinabox/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_SHELLINABOX
+	bool "shellinabox"
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_OPENSSL
+	help
+	  Shell In A Box implements a web server that can export arbitrary command
+	  line tools to a web based terminal emulator. This emulator is accessible
+	  to any JavaScript and CSS enabled web browser and does not require any
+	  additional browser plugins.
+
+	  https://github.com/shellinabox/shellinabox
diff --git a/package/shellinabox/shellinabox.hash b/package/shellinabox/shellinabox.hash
new file mode 100644
index 0000000..b7d4523
--- /dev/null
+++ b/package/shellinabox/shellinabox.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	d25ba9f72f04471fc1a8a564c65ef466c4553280ff3eeb365ed9c897d05ed2da	v2.19.tar.gz
diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
new file mode 100644
index 0000000..94e49e0
--- /dev/null
+++ b/package/shellinabox/shellinabox.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# shellinabox
+#
+################################################################################
+
+SHELLINABOX_VERSION = v2.19
+SHELLINABOX_SOURCE = $(SHELLINABOX_VERSION).tar.gz
+SHELLINABOX_SITE = https://github.com/shellinabox/shellinabox/archive
+
+# Fetching from Github, and patching Makefile.am, so we need to autoreconf
+SHELLINABOX_AUTORECONF = YES
+
+SHELLINABOX_DEPENDENCIES = zlib
+
+SHELLINABOX_LICENSE = GPLv2 with OpenSSL exception
+SHELLINABOX_CONF_OPTS += --enable-ssl
+SHELLINABOX_DEPENDENCIES += openssl
+SHELLINABOX_LICENSE_FILES = COPYING GPL-2
+SHELLINABOX_CONF_OPTS += --disable-runtime-loading
+
+$(eval $(autotools-package))
-- 
2.5.5
