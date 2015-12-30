From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Dec 2015 09:07:03 -0300
Subject: [Buildroot] [PATCH] mbedtls: disable assembly for some scenarios
Message-ID: <1451477223-14834-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's affected in the same way as polarssl, but use an enhanced trick
compared to 130ca81b since it's required by the codebase. Fixes:
http://autobuild.buildroot.net/results/584/584d1d12be9f2bbf45ccbdf93b6b442524059dcc/
http://autobuild.buildroot.net/results/d13/d13a06ba3fc0d7f08a03c04fcb484761da7af3f7/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mbedtls/mbedtls.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index b1f232f..b98b7f5 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -43,4 +43,22 @@ else
 MBEDTLS_CONF_OPTS += -DENABLE_ZLIB_SUPPORT=OFF
 endif
 
+define MBEDTLS_DISABLE_ASM
+	$(SED) '/^#define MBEDTLS_AESNI_C/d' \
+		$(@D)/include/mbedtls/config.h
+	$(SED) '/^#define MBEDTLS_HAVE_ASM/d' \
+		$(@D)/include/mbedtls/config.h
+	$(SED) '/^#define MBEDTLS_PADLOCK_C/d' \
+		$(@D)/include/mbedtls/config.h
+endef
+
+# ARM in thumb mode breaks debugging with asm optimizations
+# Microblaze asm optimizations are broken in general
+# MIPS R6 asm is not yet supported
+ifeq ($(BR2_ENABLE_DEBUG)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),yy)
+MBEDTLS_POST_CONFIGURE_HOOKS += MBEDTLS_DISABLE_ASM
+else ifeq ($(BR2_microblaze)$(BR2_mips_32r6)$(BR2_mips_64r6),y)
+MBEDTLS_POST_CONFIGURE_HOOKS += MBEDTLS_DISABLE_ASM
+endif
+
 $(eval $(cmake-package))
-- 
2.4.10
