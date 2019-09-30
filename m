From: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Mon, 30 Sep 2019 15:34:16 +0000
Subject: [Buildroot] [PATCH v5 1/1] package/libsodium: add config for full
 build
Message-ID: <20190930153414.27682-1-adrien@gallouet.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A new option is added to build all functions.

This option was implicitly used before, so it is activated by default to
avoid unpleasant surprises.

Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
---
Changes v4 -> v5:
  - also use --disable-minimal

Changes v3 -> v4:
  - better commit log (suggested by Thomas Petazzoni)

Changes v2 -> v3:
  - add a better help (suggested by Arnout Vandecappelle)

Changes v1 -> v2:
  - full build (suggested by Arnout Vandecappelle)

---
 package/libsodium/Config.in    | 12 ++++++++++++
 package/libsodium/libsodium.mk |  6 ++++++
 2 files changed, 18 insertions(+)

diff --git a/package/libsodium/Config.in b/package/libsodium/Config.in
index 47b9bb350c..518b0532ed 100644
--- a/package/libsodium/Config.in
+++ b/package/libsodium/Config.in
@@ -4,3 +4,15 @@ config BR2_PACKAGE_LIBSODIUM
 	  A modern and easy-to-use crypto library.
 
 	  http://libsodium.org/
+
+if BR2_PACKAGE_LIBSODIUM
+
+config BR2_PACKAGE_LIBSODIUM_FULL
+	bool "all functions"
+	default y
+	help
+	  Build all seldom used and obsolete functions. Without
+	  this option, only the minimal set of normally used
+	  functions is built.
+
+endif
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index a94a8271c5..a8e0f79149 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -14,5 +14,11 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 LIBSODIUM_CONF_OPTS += --disable-pie
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSODIUM_FULL),y)
+LIBSODIUM_CONF_OPTS += --disable-minimal
+else
+LIBSODIUM_CONF_OPTS += --enable-minimal
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.19.1
