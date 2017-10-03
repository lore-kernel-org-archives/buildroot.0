From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  3 Oct 2017 17:29:57 +0200
Subject: [Buildroot] [PATCH] jose: new package
Message-ID: <20171003152957.8993-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/jose/Config.in | 14 ++++++++++++++
 package/jose/jose.hash |  3 +++
 package/jose/jose.mk   | 15 +++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/jose/Config.in
 create mode 100644 package/jose/jose.hash
 create mode 100644 package/jose/jose.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 43ad9e5f8a..f380d7ae98 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1336,6 +1336,7 @@ F:	package/dump1090/
 F:	package/flickcurl/
 F:	package/fscryptctl/
 F:	package/jo/
+F:	package/jose/
 F:	package/libfastjson/
 F:	package/lzop/
 F:	package/memtool/
diff --git a/package/Config.in b/package/Config.in
index 23818788e3..2387bb86b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1228,6 +1228,7 @@ menu "JSON/XML"
 	source "package/expat/Config.in"
 	source "package/ezxml/Config.in"
 	source "package/jansson/Config.in"
+	source "package/jose/Config.in"
 	source "package/jsmn/Config.in"
 	source "package/json-c/Config.in"
 	source "package/json-glib/Config.in"
diff --git a/package/jose/Config.in b/package/jose/Config.in
new file mode 100644
index 0000000000..4a9ed8da65
--- /dev/null
+++ b/package/jose/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_JOSE
+	bool "jose"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_OPENSSL
+	help
+	  C-language implementation of Javascript Object Signing and
+	  Encryption.
+
+	  https://github.com/latchset/jose
+
+comment "jose needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/jose/jose.hash b/package/jose/jose.hash
new file mode 100644
index 0000000000..376bc0b585
--- /dev/null
+++ b/package/jose/jose.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 5c9cdcfb535c4d9f781393d7530521c72b1dd81caa9934cab6dd752cc7efcd72  jose-10.tar.bz2
+sha256 09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  COPYING
diff --git a/package/jose/jose.mk b/package/jose/jose.mk
new file mode 100644
index 0000000000..1f5e3e4ded
--- /dev/null
+++ b/package/jose/jose.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# jose
+#
+################################################################################
+
+JOSE_VERSION = 10
+JOSE_SOURCE = jose-$(JOSE_VERSION).tar.bz2
+JOSE_SITE = https://github.com/latchset/jose/releases/download/v$(JOSE_VERSION)
+JOSE_LICENSE = Apache-2.0
+JOSE_LICENSE_FILES = COPYING
+JOSE_INSTALL_STAGING = YES
+JOSE_DEPENDENCIES = host-pkgconf zlib jansson openssl
+
+$(eval $(autotools-package))
-- 
2.11.0
