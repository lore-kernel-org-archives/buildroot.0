From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Oct 2014 11:07:18 -0300
Subject: [Buildroot] [PATCH 2/2] polarssl: disable assembly for more
	scenarios
In-Reply-To: <1414418838-3487-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414418838-3487-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1414418838-3487-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable assembly optimizations for:
Microblaze in general (previously a patch).
ARM with debugging in Thumb1/2 mode. This one fixes:
http://autobuild.buildroot.net/results/31e/31e8c4e29d51039cd5d213c2fe176a9cc39879da/

Do so in a nicer way with a one-liner sed and drop the patch.

And rename patches around, numbering was off.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...t-suite.patch => polarssl-0001-no-test-suite.patch} |  0
 ...e-the-standard-CMake-flag-to-drive-the-share.patch} |  0
 .../polarssl/polarssl-02-disable-microblaze-asm.patch  | 18 ------------------
 package/polarssl/polarssl.mk                           | 12 ++++++++++++
 4 files changed, 12 insertions(+), 18 deletions(-)
 rename package/polarssl/{polarssl-01-no-test-suite.patch => polarssl-0001-no-test-suite.patch} (100%)
 rename package/polarssl/{polarssl-0003-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch => polarssl-0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch} (100%)
 delete mode 100644 package/polarssl/polarssl-02-disable-microblaze-asm.patch

diff --git a/package/polarssl/polarssl-01-no-test-suite.patch b/package/polarssl/polarssl-0001-no-test-suite.patch
similarity index 100%
rename from package/polarssl/polarssl-01-no-test-suite.patch
rename to package/polarssl/polarssl-0001-no-test-suite.patch
diff --git a/package/polarssl/polarssl-0003-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch b/package/polarssl/polarssl-0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
similarity index 100%
rename from package/polarssl/polarssl-0003-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
rename to package/polarssl/polarssl-0002-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
diff --git a/package/polarssl/polarssl-02-disable-microblaze-asm.patch b/package/polarssl/polarssl-02-disable-microblaze-asm.patch
deleted file mode 100644
index e90e12d..0000000
--- a/package/polarssl/polarssl-02-disable-microblaze-asm.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Microblaze assembly seems to be broken, fixes:
-
-http://autobuild.buildroot.net/results/4d5/4d54958ded61a0d929d992e4ca0bb31c996953cb/
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura polarssl-1.2.11.orig/include/polarssl/bn_mul.h polarssl-1.2.11/include/polarssl/bn_mul.h
---- polarssl-1.2.11.orig/include/polarssl/bn_mul.h	2014-07-30 15:47:27.381658434 -0300
-+++ polarssl-1.2.11/include/polarssl/bn_mul.h	2014-07-30 15:48:52.616543074 -0300
-@@ -480,7 +480,7 @@
- 
- #endif /* SPARCv8 */
- 
--#if defined(__microblaze__) || defined(microblaze)
-+#if 0 && defined(__microblaze__) || defined(microblaze)
- 
- #define MULADDC_INIT                    \
-     asm(                                \
diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
index 7c27505..046c6bf 100644
--- a/package/polarssl/polarssl.mk
+++ b/package/polarssl/polarssl.mk
@@ -14,4 +14,16 @@ POLARSSL_INSTALL_STAGING = YES
 POLARSSL_LICENSE = GPLv2
 POLARSSL_LICENSE_FILES = LICENSE
 
+define POLARSSL_DISABLE_ASM
+	$(SED) '/^#define POLARSSL_HAVE_ASM/d' $(@D)/include/polarssl/config.h
+endef
+
+# ARM in thumb mode breaks debugging with asm optimizations
+# Microblaze asm optimizations are broken in general
+ifeq ($(BR2_ENABLE_DEBUG)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),yy)
+POLARSSL_POST_CONFIGURE_HOOKS += POLARSSL_DISABLE_ASM
+else ifeq ($(BR2_microblaze),y)
+POLARSSL_POST_CONFIGURE_HOOKS += POLARSSL_DISABLE_ASM
+endif
+
 $(eval $(cmake-package))
-- 
2.0.4
