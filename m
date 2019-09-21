From: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Sat, 21 Sep 2019 21:47:35 +0000
Subject: [Buildroot] [PATCH v2 1/1] package/libsodium: add config for full
 build
Message-ID: <20190921214734.23587-1-adrien@gallouet.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, build libsodium in the minimal mode.
A new option is added to build seldom used or obsolete (not recommended) functions.

Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>

---
Changes v1 -> v2:
  - full build (suggested by Arnout Vandecappelle)
---
 package/libsodium/Config.in    | 9 +++++++++
 package/libsodium/libsodium.mk | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/package/libsodium/Config.in b/package/libsodium/Config.in
index 47b9bb350c..36e2f35df1 100644
--- a/package/libsodium/Config.in
+++ b/package/libsodium/Config.in
@@ -4,3 +4,12 @@ config BR2_PACKAGE_LIBSODIUM
 	  A modern and easy-to-use crypto library.
 
 	  http://libsodium.org/
+
+if BR2_PACKAGE_LIBSODIUM
+
+config BR2_PACKAGE_LIBSODIUM_FULL
+	bool "Add seldom used or obsolete functions"
+	help
+	  Build libsodium with all functions.
+
+endif
diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
index a94a8271c5..9afa09ff37 100644
--- a/package/libsodium/libsodium.mk
+++ b/package/libsodium/libsodium.mk
@@ -14,5 +14,9 @@ ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 LIBSODIUM_CONF_OPTS += --disable-pie
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSODIUM_FULL),)
+LIBSODIUM_CONF_OPTS += --enable-minimal
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.19.1
