From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Oct 2012 08:59:20 -0300
Subject: [Buildroot] [PATCH] openssl: disable apps for NOMMU
Message-ID: <1350388760-5447-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The openssl binary uses fork() so disable the option and build for !MMU.
Fixes
http://autobuild.buildroot.net/results/45a9b84c16caadbf77b6fc43d7a0001c981a4c87/build-end.log

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/Config.in  |    2 ++
 package/openssl/openssl.mk |    9 +++++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 6ba644a..2187023 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -12,6 +12,8 @@ config BR2_PACKAGE_OPENSSL
 config BR2_PACKAGE_OPENSSL_BIN
 	bool "openssl binary"
 	depends on BR2_PACKAGE_OPENSSL
+	# uses fork()
+	depends on BR2_USE_MMU
 	help
 	  Install the openssl binary to the target file system. This is a
 	  command line tool for doing various crypthographic stuff.
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 0917344..d283046 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -13,6 +13,15 @@ OPENSSL_DEPENDENCIES = zlib
 OPENSSL_TARGET_ARCH = generic32
 OPENSSL_CFLAGS = $(TARGET_CFLAGS)
 
+ifeq ($(BR2_USE_MMU),)
+define OPENSSL_DISABLE_APPS
+	$(SED) '/^build_apps/! s/build_apps//' $(@D)/Makefile.org
+	$(Q)touch $(@D)/apps/openssl
+endef
+endif
+
+OPENSSL_PRE_CONFIGURE_HOOKS += OPENSSL_DISABLE_APPS
+
 ifeq ($(BR2_PACKAGE_OPENSSL_OCF),y)
 	OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
 	OPENSSL_DEPENDENCIES += ocf-linux
-- 
1.7.8.6
