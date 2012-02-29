From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Wed, 29 Feb 2012 21:27:57 -0200
Subject: [Buildroot] [PATCH 1/2] openssl: Fix build on ARM with GCC 4.6.x
Message-ID: <1330558078-3978-1-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
---
 package/openssl/openssl.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index cb29fe4..fda935a 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -9,7 +9,14 @@ OPENSSL_SITE = http://www.openssl.org/source
 OPENSSL_INSTALL_STAGING = YES
 OPENSSL_DEPENDENCIES = zlib
 OPENSSL_TARGET_ARCH = generic32
+
+ifeq ($(BR2_GCC_VERSION_4_6_X)-$(ARCH),y-arm)
+# workaround for gcc issue
+# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48308
+OPENSSL_CFLAGS = $(subst -Os,-O2,$(TARGET_CFLAGS))
+else
 OPENSSL_CFLAGS = $(TARGET_CFLAGS)
+endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL_OCF),y)
 OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
-- 
1.7.9.1
