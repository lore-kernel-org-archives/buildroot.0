From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 12:04:15 +0200
Subject: [Buildroot] [git commit] shellinabox: new package
Message-ID: <20160706100948.E491082233@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=479cebcfb75cc0d738714102e647f401628a849e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Shell In A Box implements a web server that can export arbitrary command
line tools to a web based terminal emulator. This emulator is accessible
to any JavaScript and CSS enabled web browser and does not require any
additional browser plugins.

Signed-off-by: Olivier Singla <olivier.singla@gmail.com>
[Thomas:
 - Use "select" instead of "depends on" for the OpenSSL dependency, and
   use alphabetic ordering.
 - Rewrap Config.in help text.
 - Use github macro
 - Explain why the OpenSSL dependency is mandatory, while
   --enable-ssl/--disable-ssl are available.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |  1 +
 .../shellinabox/0001-Makefile.am-fix-static.patch  | 15 ++++++++++++++
 package/shellinabox/Config.in                      | 12 +++++++++++
 package/shellinabox/shellinabox.hash               |  2 ++
 package/shellinabox/shellinabox.mk                 | 23 ++++++++++++++++++++++
 5 files changed, 53 insertions(+)

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
index 0000000..b349ef3
--- /dev/null
+++ b/package/shellinabox/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_SHELLINABOX
+	bool "shellinabox"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  Shell In A Box implements a web server that can export
+	  arbitrary command line tools to a web based terminal
+	  emulator. This emulator is accessible to any JavaScript and
+	  CSS enabled web browser and does not require any additional
+	  browser plugins.
+
+	  https://github.com/shellinabox/shellinabox
diff --git a/package/shellinabox/shellinabox.hash b/package/shellinabox/shellinabox.hash
new file mode 100644
index 0000000..4bc1103
--- /dev/null
+++ b/package/shellinabox/shellinabox.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	d25ba9f72f04471fc1a8a564c65ef466c4553280ff3eeb365ed9c897d05ed2da	shellinabox-v2.19.tar.gz
diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
new file mode 100644
index 0000000..e4e0b06
--- /dev/null
+++ b/package/shellinabox/shellinabox.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# shellinabox
+#
+################################################################################
+
+SHELLINABOX_VERSION = v2.19
+SHELLINABOX_SITE = $(call github,shellinabox,shellinabox,$(SHELLINABOX_VERSION))
+SHELLINABOX_LICENSE = GPLv2 with OpenSSL exception
+SHELLINABOX_LICENSE_FILES = COPYING GPL-2
+
+# Fetching from Github, and patching Makefile.am, so we need to autoreconf
+SHELLINABOX_AUTORECONF = YES
+
+# The OpenSSL support is supposed to be optional, but in practice,
+# with OpenSSL disabled, it fails to build. See
+# https://github.com/shellinabox/shellinabox/issues/385.
+SHELLINABOX_DEPENDENCIES = zlib openssl
+SHELLINABOX_CONF_OPTS = \
+	--disable-runtime-loading \
+	--enable-ssl
+
+$(eval $(autotools-package))
