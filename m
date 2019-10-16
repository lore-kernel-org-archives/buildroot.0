From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 16 Oct 2019 12:09:17 +0300
Subject: [Buildroot] [PATCH] package/libcurl: rename curl binary config
 symbol
Message-ID: <7c97f31505093f6dfc86c24ddf03dd72ad9a8fb3.1571216957.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package optional or choice config symbols are usually prefixed with the
package config symbol name. Rename BR2_PACKAGE_CURL to
BR2_PACKAGE_LIBCURL_CURL to conform.

Update references to the old name.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Config.in.legacy                     | 8 ++++++++
 docs/manual/adding-packages-tips.txt | 2 +-
 package/dehydrated/Config.in         | 2 +-
 package/libcurl/Config.in            | 2 +-
 package/libcurl/libcurl.mk           | 2 +-
 5 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 74201b50e71d..ba8166d938c0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2019.11"
 
+config BR2_PACKAGE_CURL
+	bool "BR2_PACKAGE_CURL was renamed"
+	select BR2_PACKAGE_LIBCURL_CURL
+	select BR2_LEGACY
+	help
+	  The BR2_PACKAGE_CURL config symbol was renamed to
+	  BR2_PACKAGE_LIBCURL_CURL.
+
 config BR2_TARGET_RISCV_PK
 	bool "riscv-pk was removed"
 	select BR2_LEGACY
diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index d10f276e83bd..95a1d599ef74 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -98,7 +98,7 @@ config snippet. For example, here's how you would test +libcurl+ with
 ----
 $ cat libcurl.config
 BR2_PACKAGE_LIBCURL=y
-BR2_PACKAGE_CURL=y
+BR2_PACKAGE_LIBCURL_CURL=y
 BR2_PACKAGE_OPENSSL=y
 ----
 
diff --git a/package/dehydrated/Config.in b/package/dehydrated/Config.in
index f14ae0f6110c..979938d70ca6 100644
--- a/package/dehydrated/Config.in
+++ b/package/dehydrated/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_DEHYDRATED
 	select BR2_PACKAGE_BASH
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_LIBCURL
-	select BR2_PACKAGE_CURL
+	select BR2_PACKAGE_LIBCURL_CURL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBOPENSSL_BIN if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBRESSL_BIN if BR2_PACKAGE_LIBRESSL
diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 0511786dc6e5..fd23f7477ca7 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_LIBCURL
 
 if BR2_PACKAGE_LIBCURL
 
-config BR2_PACKAGE_CURL
+config BR2_PACKAGE_LIBCURL_CURL
 	bool "curl binary"
 	help
 	  Install curl binary as well
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 8384210d480c..711140c7f1f6 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -155,7 +155,7 @@ define LIBCURL_FIX_DOT_PC
 endef
 LIBCURL_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_LIBCURL_OPENSSL),LIBCURL_FIX_DOT_PC)
 
-ifeq ($(BR2_PACKAGE_CURL),)
+ifeq ($(BR2_PACKAGE_LIBCURL_CURL),)
 define LIBCURL_TARGET_CLEANUP
 	rm -rf $(TARGET_DIR)/usr/bin/curl
 endef
-- 
2.23.0
