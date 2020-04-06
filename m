From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Apr 2020 21:43:38 +0200
Subject: [Buildroot] [git commit] package/libnss: fix build failure due to
 patch not applicable
Message-ID: <20200406193231.D40778CA49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cdb2922c96e891873b8ee02a9d20cac768c90eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Current 0001 patch has been committed into buildroot before being
upstreamed. Now that it's been upstreamed it changed a little, so this
makes patch 0002(based on upstream version of patch 0001) impossible to
apply causing build failure while applying patches. So let's update
patch 0001 with upstream one.

Fixes:
http://autobuild.buildroot.net/results/c8a/c8a6776a3e9cec1dc67862e4972e3ca8f4562a50/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...9-Introduce-NSS_DISABLE_ARM32_NEON-r-jcj.patch} | 61 ++++++++++++----------
 package/libnss/libnss.mk                           |  4 +-
 2 files changed, 35 insertions(+), 30 deletions(-)

diff --git a/package/libnss/0001-Bug-1620799-Introduce-NSS_DISABLE_GCM_ARM32_NEON.patch b/package/libnss/0001-Bug-1620799-Introduce-NSS_DISABLE_ARM32_NEON-r-jcj.patch
similarity index 71%
rename from package/libnss/0001-Bug-1620799-Introduce-NSS_DISABLE_GCM_ARM32_NEON.patch
rename to package/libnss/0001-Bug-1620799-Introduce-NSS_DISABLE_ARM32_NEON-r-jcj.patch
index 409a85ac54..db19a53c32 100644
--- a/package/libnss/0001-Bug-1620799-Introduce-NSS_DISABLE_GCM_ARM32_NEON.patch
+++ b/package/libnss/0001-Bug-1620799-Introduce-NSS_DISABLE_ARM32_NEON-r-jcj.patch
@@ -1,10 +1,15 @@
-From 5d0fdb245bbb1dd4d7cc94eae91981ff79c4852d Mon Sep 17 00:00:00 2001
+From 38e497b3d9e0bff3da7a1a5d4c0760661ded4b6f Mon Sep 17 00:00:00 2001
 From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Sat, 7 Mar 2020 23:47:09 +0100
-Subject: [PATCH] Bug 1620799 - Introduce NSS_DISABLE_GCM_ARM32_NEON
+Date: Wed, 1 Apr 2020 09:39:45 -0700
+Subject: [PATCH] Bug 1620799 - Introduce NSS_DISABLE_ARM32_NEON r=jcj
 
-Only some Arm32 supports neon, so let's introduce
-NSS_DISABLE_GCM_ARM32_NEON to allow disabling gcm-arm32-neon.c building.
+Only some Arm32 supports neon, so let's introduce NSS_DISABLE_ARM32_NEON
+to allow disabling Neon acceleration when building for Arm32.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+
+--HG--
+extra : rebase_source : c6e3d22ef43ac5012af69214499616f868f4c5b2
 
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 ---
@@ -16,52 +21,52 @@ Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
  5 files changed, 24 insertions(+), 3 deletions(-)
 
 diff --git a/nss/coreconf/config.gypi b/nss/coreconf/config.gypi
-index 2a730398b..2a7fe8ac0 100644
+index 2a730398b..f67dd7f13 100644
 --- a/nss/coreconf/config.gypi
 +++ b/nss/coreconf/config.gypi
 @@ -103,6 +103,7 @@
      'disable_libpkix%': 1,
      'disable_werror%': 0,
      'disable_altivec%': 0,
-+    'disable_gcm_arm32_neon%': 0,
++    'disable_arm32_neon%': 0,
      'mozilla_client%': 0,
      'comm_client%': 0,
      'moz_fold_libs%': 0,
 diff --git a/nss/coreconf/config.mk b/nss/coreconf/config.mk
-index 704e3fa83..9042e78bf 100644
+index 4eda497a2..b751ead5d 100644
 --- a/nss/coreconf/config.mk
 +++ b/nss/coreconf/config.mk
-@@ -196,6 +196,11 @@ DEFINES += -DPKIX_OBJECT_LEAK_TEST
+@@ -200,6 +200,11 @@ DEFINES += -DPKIX_OBJECT_LEAK_TEST
  endif
  endif
  
-+# Avoid building gcm-arm32-neon.c
-+ifdef NSS_DISABLE_GCM_ARM32_NEON
-+DEFINES += -DNSS_DISABLE_GCM_ARM32_NEON
++# Avoid building with Neon acceleration on Arm32
++ifdef NSS_DISABLE_ARM32_NEON
++DEFINES += -DNSS_DISABLE_ARM32_NEON
 +endif
 +
  # Avoid building with PowerPC's Altivec acceleration
  ifdef NSS_DISABLE_ALTIVEC
  DEFINES += -DNSS_DISABLE_ALTIVEC
 diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
-index ce9d36f3a..2802fdf42 100644
+index 32da68301..a03c0d108 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
 @@ -124,7 +124,9 @@ ifeq ($(CPU_ARCH),aarch64)
      EXTRA_SRCS += aes-armv8.c gcm-aarch64.c
  endif
  ifeq ($(CPU_ARCH),arm)
-+ifndef NSS_DISABLE_GCM_ARM32_NEON
++ifndef NSS_DISABLE_ARM32_NEON
      EXTRA_SRCS += gcm-arm32-neon.c
 +endif
      ifdef CC_IS_CLANG
          DEFINES += -DUSE_HW_AES
          EXTRA_SRCS += aes-armv8.c
-@@ -770,8 +772,10 @@ ifeq ($(CPU_ARCH),arm)
+@@ -778,8 +780,10 @@ ifeq ($(CPU_ARCH),arm)
  # Confusingly, __SOFTFP__ is the name of the define for the softfloat ABI, not for the softfp ABI.
  USES_SOFTFLOAT_ABI := $(shell $(CC) -o - -E -dM - $(CFLAGS) < /dev/null | grep __SOFTFP__ > /dev/null && echo 1)
  $(OBJDIR)/$(PROG_PREFIX)aes-armv8$(OBJ_SUFFIX): CFLAGS += -march=armv8-a -mfpu=crypto-neon-fp-armv8$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
-+ifndef NSS_DISABLE_GCM_ARM32_NEON
++ifndef NSS_DISABLE_ARM32_NEON
  $(OBJDIR)/$(PROG_PREFIX)gcm-arm32-neon$(OBJ_SUFFIX): CFLAGS += -march=armv7 -mfpu=neon$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
  endif
 +endif
@@ -69,56 +74,56 @@ index ce9d36f3a..2802fdf42 100644
  $(OBJDIR)/$(PROG_PREFIX)aes-armv8$(OBJ_SUFFIX): CFLAGS += -march=armv8-a+crypto
  $(OBJDIR)/$(PROG_PREFIX)gcm-aarch64$(OBJ_SUFFIX): CFLAGS += -march=armv8-a+crypto
 diff --git a/nss/lib/freebl/freebl.gyp b/nss/lib/freebl/freebl.gyp
-index d46bd1949..7bf4e9f7e 100644
+index 8f3ddd978..5975b76cd 100644
 --- a/nss/lib/freebl/freebl.gyp
 +++ b/nss/lib/freebl/freebl.gyp
-@@ -265,11 +265,16 @@
+@@ -337,11 +337,16 @@
              'armv8_c_lib'
            ],
          }],
 -        [ 'target_arch=="arm"', {
-+        [ 'disable_gcm_arm32_neon==0 and target_arch=="arm"', {
++        [ 'disable_arm32_neon==0 and target_arch=="arm"', {
            'dependencies': [
              'gcm-aes-arm32-neon_c_lib',
            ],
          }],
-+        [ 'disable_gcm_arm32_neon==1 and target_arch=="arm"', {
++        [ 'disable_arm32_neon==1 and target_arch=="arm"', {
 +          'defines!': [
-+            'NSS_DISABLE_GCM_ARM32_NEON',
++            'NSS_DISABLE_ARM32_NEON',
 +          ],
 +        }],
          [ 'target_arch=="arm64" or target_arch=="aarch64"', {
            'dependencies': [
              'gcm-aes-aarch64_c_lib',
-@@ -326,11 +331,16 @@
+@@ -399,11 +404,16 @@
              'armv8_c_lib',
            ],
          }],
 -        [ 'target_arch=="arm"', {
-+        [ 'disable_gcm_arm32_neon==0 and target_arch=="arm"', {
++        [ 'disable_arm32_neon==0 and target_arch=="arm"', {
            'dependencies': [
              'gcm-aes-arm32-neon_c_lib',
            ],
          }],
-+        [ 'disable_gcm_arm32_neon==1 and target_arch=="arm"', {
++        [ 'disable_arm32_neon==1 and target_arch=="arm"', {
 +          'defines!': [
-+            'NSS_DISABLE_GCM_ARM32_NEON',
++            'NSS_DISABLE_ARM32_NEON',
 +          ],
 +        }],
          [ 'target_arch=="arm64" or target_arch=="aarch64"', {
            'dependencies': [
              'gcm-aes-aarch64_c_lib',
 diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
-index 2a42f74c0..9b1c6c02f 100644
+index e5742b9b8..5065197ef 100644
 --- a/nss/lib/freebl/gcm.c
 +++ b/nss/lib/freebl/gcm.c
-@@ -21,7 +21,8 @@
+@@ -22,7 +22,8 @@
  #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
      (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
  #define USE_ARM_GCM
 -#elif defined(__arm__) && defined(IS_LITTLE_ENDIAN)
 +#elif defined(__arm__) && defined(IS_LITTLE_ENDIAN) && \
-+      !defined(NSS_DISABLE_GCM_ARM32_NEON)
++      !defined(NSS_DISABLE_ARM32_NEON)
  /* We don't test on big endian platform, so disable this on big endian. */
  #define USE_ARM_GCM
  #endif
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 8faf243545..3b12e8c41d 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -56,8 +56,8 @@ LIBNSS_BUILD_VARS += NSS_DISABLE_ALTIVEC=1
 endif
 
 ifeq ($(BR2_ARM_CPU_HAS_NEON),)
-# Disable gcm-arm32-neon if neon is not supported
-LIBNSS_BUILD_VARS += NSS_DISABLE_GCM_ARM32_NEON=1
+# Disable arm32-neon if neon is not supported
+LIBNSS_BUILD_VARS += NSS_DISABLE_ARM32_NEON=1
 endif
 
 ifeq ($(BR2_ARCH_IS_64),y)
