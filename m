From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  4 Aug 2017 14:55:21 -0400
Subject: [Buildroot] [PATCH 10/10] libssl: add libressl as a option
In-Reply-To: <20170804185521.12320-1-Adamduskett@outlook.com>
References: <20170804185521.12320-1-Adamduskett@outlook.com>
Message-ID: <20170804185521.12320-11-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/libressl/Config.in   | 2 +-
 package/libressl/libressl.mk | 2 ++
 package/libssl/Config.in     | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libressl/Config.in b/package/libressl/Config.in
index 0a1c9e273..a1cbeafde 100644
--- a/package/libressl/Config.in
+++ b/package/libressl/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
-	depends on !BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_HAS_LIBSSL
 	help
 	  LibreSSL is a version of the TLS/crypto stack forked from
 	  OpenSSL in 2014, with goals of modernizing the codebase,
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index ccd236d29..4c993a97a 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -9,6 +9,7 @@ LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
 LIBRESSL_INSTALL_STAGING = YES
+LIBRESSL_PROVIDES = libssl
 
 ifeq ($(BR2_PACKAGE_LIBRESSL_BIN),)
 define LIBRESSL_REMOVE_BIN
@@ -17,4 +18,5 @@ endef
 LIBRESSL_POST_INSTALL_TARGET_HOOKS += LIBRESSL_REMOVE_BIN
 endif
 
+$(eval $(host-autotools-package))
 $(eval $(autotools-package))
diff --git a/package/libssl/Config.in b/package/libssl/Config.in
index 5f3d2fc2a..7a1ca68d4 100644
--- a/package/libssl/Config.in
+++ b/package/libssl/Config.in
@@ -12,6 +12,7 @@ choice
 	  Select OpenSSL or LibreSSL.
 
 	source "package/openssl/Config.in"
+	source "package/libressl/Config.in"
 
 endchoice
 
-- 
2.13.3
