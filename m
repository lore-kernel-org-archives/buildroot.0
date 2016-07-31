From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 31 Jul 2016 10:28:03 +0200
Subject: [Buildroot] [PATCH] libgcrypt: disable assembly for coldfire
Message-ID: <20160731082803.GA23895@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/374/374158bb0a0e6a16af5d0b909cd05ec52812aaa3/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libgcrypt/libgcrypt.mk |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 5eb54a4..5ee488d 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -18,6 +18,11 @@ LIBGCRYPT_CONF_ENV = \
 LIBGCRYPT_CONF_OPTS = \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
+# Libgcrypt doesn't support assembly for coldfire
+ifeq ($(BR2_m68k_cf),y)
+LIBGCRYPT_CONF_OPTS += --disable-asm
+endif
+
 # Code doesn't build in thumb mode
 ifeq ($(BR2_arm),y)
 LIBGCRYPT_CONF_ENV += CFLAGS="$(patsubst -mthumb,,$(TARGET_CFLAGS))"
-- 
1.7.10.4
