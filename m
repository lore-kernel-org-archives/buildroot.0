From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 22:45:00 +0100
Subject: [Buildroot] [git commit branch/next] package/liburiparser: New
	package
Message-ID: <20141126214600.03FA37FF1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2d327d0dd3dcc661318790c1e8269c050c4ff54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas:
 - put liburiparser at the right place in package/Config.in, i.e
   sorted alphabetically
 - use positive logic for the wchar test.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |    1 +
 package/liburiparser/Config.in         |    7 +++++++
 package/liburiparser/liburiparser.hash |    3 +++
 package/liburiparser/liburiparser.mk   |   19 +++++++++++++++++++
 4 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index bb5b144..b8fc7d1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -837,6 +837,7 @@ menu "Networking"
 	source "package/libtorrent/Config.in"
 	source "package/libupnp/Config.in"
 	source "package/libupnpp/Config.in"
+	source "package/liburiparser/Config.in"
 	source "package/libvncserver/Config.in"
 	source "package/libwebsockets/Config.in"
 	source "package/neon/Config.in"
diff --git a/package/liburiparser/Config.in b/package/liburiparser/Config.in
new file mode 100644
index 0000000..95a6fe8
--- /dev/null
+++ b/package/liburiparser/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBURIPARSER
+	bool "liburiparser"
+	help
+	  uriparser is a strictly RFC 3986 compliant URI parsing and handling
+	  library written in C.
+
+	  http://uriparser.sourceforge.net
diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
new file mode 100644
index 0000000..84340f8
--- /dev/null
+++ b/package/liburiparser/liburiparser.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/uriparser/files/Sources/0.8.1/
+md5	4e4c5f0ee6abb111a431c45e144247aa		uriparser-0.8.1.tar.bz2
+sha1	4405d8baa0d9f5bc0319e6d5e68770acab67b602	uriparser-0.8.1.tar.bz2
diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
new file mode 100644
index 0000000..661fa96
--- /dev/null
+++ b/package/liburiparser/liburiparser.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# liburiparser
+#
+################################################################################
+
+LIBURIPARSER_VERSION = 0.8.1
+LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.bz2
+LIBURIPARSER_SITE = http://sourceforge.net/projects/uriparser/files/Sources/$(LIBURIPARSER_VERSION)
+LIBURIPARSER_LICENSE = BSD-3c
+LIBURIPARSER_LICENSE_FILES = COPYING
+LIBURIPARSER_INSTALL_STAGING = YES
+LIBURIPARSER_CONF_OPTS = --disable-test
+
+ifeq ($(BR2_USE_WCHAR),)
+LIBURIPARSER_CONF_OPTS += --disable-wchar_t
+endif
+
+$(eval $(autotools-package))
