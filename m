From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Fri, 19 Jun 2015 12:54:33 +0200
Subject: [Buildroot] [PATCH 1/2] openssl: support building the binary
	without MMU
Message-ID: <1434711274-49716-1-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The commit 720893b62510438237b9923d744dd079ddb4f67d "openssl: disable
apps for NOMMU" prevented the openssl binary from being built without
MMU in order to fix a build failure without fork(). However, openssl is
designed to support the lack of fork() with -DHAVE_FORK=0, so allow the
openssl binary to be enabled without MMU thanks to this option.

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 package/openssl/Config.in  | 3 ---
 package/openssl/openssl.mk | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 07859ca..d147c07 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -13,15 +13,12 @@ if BR2_PACKAGE_OPENSSL
 
 config BR2_PACKAGE_OPENSSL_BIN
 	bool "openssl binary"
-	# uses fork()
-	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	help
 	  Install the openssl binary to the target file system. This is a
 	  command line tool for doing various crypthographic stuff.
 
 comment "openssl binary needs a toolchain w/ dynamic library"
-	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_OPENSSL_ENGINES
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index fd8904d..34a9830 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -22,6 +22,10 @@ endef
 OPENSSL_PRE_CONFIGURE_HOOKS += OPENSSL_DISABLE_APPS
 endif
 
+ifeq ($(BR2_USE_MMU),)
+OPENSSL_CFLAGS += -DHAVE_FORK=0
+endif
+
 ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
 OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
 OPENSSL_DEPENDENCIES += cryptodev-linux
-- 
2.1.4
