From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 11:20:23 +0100
Subject: [Buildroot] [git commit] package/libcurl: rename curl binary config
 symbol
Message-ID: <20200216101709.779D18E159@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a057339cc124bbf7c6a3e567fd57413bed3ddd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package optional or choice config symbols are usually prefixed with the
package config symbol name. Rename BR2_PACKAGE_CURL to
BR2_PACKAGE_LIBCURL_CURL to conform.

Update references to the old name.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 8 ++++++++
 docs/manual/adding-packages-tips.txt | 2 +-
 package/dehydrated/Config.in         | 2 +-
 package/glslsandbox-player/Config.in | 2 +-
 package/libcurl/Config.in            | 2 +-
 package/libcurl/libcurl.mk           | 2 +-
 6 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index bf69b579e3..87966facb4 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_CURL
+	bool "BR2_PACKAGE_CURL was renamed"
+	select BR2_PACKAGE_LIBCURL_CURL
+	select BR2_LEGACY
+	help
+	  The BR2_PACKAGE_CURL config symbol was renamed to
+	  BR2_PACKAGE_LIBCURL_CURL.
+
 config BR2_PACKAGE_GSTREAMER
 	bool "gstreamer-0.10 removed"
 	select BR2_LEGACY
diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index d10f276e83..95a1d599ef 100644
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
index f14ae0f611..979938d70c 100644
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
diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index 32239d29d0..dc0d2c07f1 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -41,7 +41,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
 	select BR2_PACKAGE_BASH # runtime
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
 	select BR2_PACKAGE_COREUTILS # runtime (timeout)
-	select BR2_PACKAGE_CURL # runtime
+	select BR2_PACKAGE_LIBCURL_CURL # runtime
 	select BR2_PACKAGE_IMAGEMAGICK # runtime
 	select BR2_PACKAGE_JPEG # runtime
 	select BR2_PACKAGE_LIBCURL # runtime
diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 652285c0f8..d05cbedf77 100644
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
index a7f10ddde5..16b11ca944 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -162,7 +162,7 @@ define LIBCURL_FIX_DOT_PC
 endef
 LIBCURL_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_LIBCURL_OPENSSL),LIBCURL_FIX_DOT_PC)
 
-ifeq ($(BR2_PACKAGE_CURL),)
+ifeq ($(BR2_PACKAGE_LIBCURL_CURL),)
 define LIBCURL_TARGET_CLEANUP
 	rm -rf $(TARGET_DIR)/usr/bin/curl
 endef
