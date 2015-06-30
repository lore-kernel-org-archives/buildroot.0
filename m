From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 16:44:12 +0200
Subject: [Buildroot] [git commit] openssl: support building the binary
	without MMU
Message-ID: <20150630144415.7383281789@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c8937ade4bc29fd8a502b8e9cd0b392a7e76fa30
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit 720893b62510438237b9923d744dd079ddb4f67d "openssl: disable
apps for NOMMU" prevented the openssl binary from being built without
MMU in order to fix a build failure without fork(). However, openssl is
designed to support the lack of fork() with -DHAVE_FORK=0, so allow the
openssl binary to be enabled without MMU thanks to this option.

Signed-off-by: Beno??t Th??baudeau <benoit@wsystem.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openssl/Config.in  |    3 ---
 package/openssl/openssl.mk |    4 ++++
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
