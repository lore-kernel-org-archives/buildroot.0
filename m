From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jan 2020 19:24:48 +0100
Subject: [Buildroot] [git commit] package/libnss: fix build failure on
 PowerPC, PowerPC64
Message-ID: <20200101183012.539AA8EA8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a3435190adff2fed5f1bb9f840ad385ce9788ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libnss expects OS_TEST to be set to ppc, ppc64, or ppc64le instead of
the usual values defined by Buildroot, respectively powerpc, powerpc64,
or powerpc64le.

This fixes the inconsistencies where functions would be prototyped and
called, but no implementation would be provided, causing link issues.

Define all the variants (of which the existing aarch64be) in Kconfig.
The latest default uses the usual architecture names as defined by
Buildroot, BR2_ARCH.

Additionally, libnss makes use of Altivec intrinsics which are only
available starting with gcc 8, not gcc 5, so we patch it to fix that
condition.

Fixes:
    http://autobuild.buildroot.org/results/579/57928e6cf69d584b430a1d9a99156c57f29b692f/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[yann.morin.1998 at free.fr:
  - move the arch setting to kconfig (like recently done in e3159cad71)
  - add the build failure
  - add pointer to upstream bug report and patch sybmission
  - reformat and reword commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...g-1606119-Fix-PPC-HW-Crypto-build-failure.patch | 36 ++++++++++++++++++++++
 package/libnss/Config.in                           | 12 ++++++++
 package/libnss/libnss.mk                           |  8 +----
 3 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch b/package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch
new file mode 100644
index 0000000000..03ca25edf7
--- /dev/null
+++ b/package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch
@@ -0,0 +1,36 @@
+From ebf185f8e48b5aec622dc949cef1b19b0a7669ef Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 1 Jan 2020 12:54:45 +0100
+Subject: [PATCH] Bug 1606119 - Fix PPC HW Crypto build failure
+
+All Altivec *_be() functions are supported from gcc version 8.x not 5.x
+so modify gcc version check that at the moment cause build failure due
+to missing Altivec *_be() functions.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Upstream issue: https://bugzilla.mozilla.org/show_bug.cgi?id=1606119
+---
+ nss/lib/freebl/gcm.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/nss/lib/freebl/gcm.h b/nss/lib/freebl/gcm.h
+index 571b9ec55..aa4dee824 100644
+--- a/nss/lib/freebl/gcm.h
++++ b/nss/lib/freebl/gcm.h
+@@ -41,11 +41,11 @@
+ #endif
+ 
+ /*
+- * PPC CRYPTO requires at least gcc 5 or clang. The LE check is purely
++ * PPC CRYPTO requires at least gcc 8 or clang. The LE check is purely
+  * because it's only been tested on LE. If you're interested in BE,
+  * please send a patch.
+  */
+-#if (defined(__clang__) || (defined(__GNUC__) && __GNUC__ >= 5)) && \
++#if (defined(__clang__) || (defined(__GNUC__) && __GNUC__ >= 8)) && \
+     defined(IS_LITTLE_ENDIAN)
+ #define USE_PPC_CRYPTO
+ #endif
+-- 
+2.20.1
+
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index 599c9a6536..2dd0197236 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -15,6 +15,18 @@ config BR2_PACKAGE_LIBNSS
 
 	  http://www.mozilla.org/projects/security/pki/nss/
 
+if BR2_PACKAGE_LIBNSS
+
+config BR2_PACKAGE_LIBNSS_ARCH
+	string
+	default "aarch64" if BR2_aarch64_be
+	default "ppc"     if BR2_powerpc
+	default "ppc64"   if BR2_powerpc64
+	default "ppc64le" if BR2_powerpc64le
+	default BR2_ARCH
+
+endif
+
 comment "libnss needs a toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 9349276a90..68389d46fc 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -37,12 +37,6 @@ endef
 LIBNSS_PRE_CONFIGURE_HOOKS += LIBNSS_DROP_GC_SECTIONS
 endif
 
-ifeq ($(BR2_aarch64_be),y)
-LIBNSS_ARCH = aarch64
-else
-LIBNSS_ARCH = $(ARCH)
-endif
-
 LIBNSS_BUILD_VARS = \
 	MOZILLA_CLIENT=1 \
 	NSPR_INCLUDE_DIR=$(STAGING_DIR)/usr/include/nspr \
@@ -53,7 +47,7 @@ LIBNSS_BUILD_VARS = \
 	NATIVE_CC="$(HOSTCC)" \
 	OS_ARCH="Linux" \
 	OS_RELEASE="2.6" \
-	OS_TEST="$(LIBNSS_ARCH)" \
+	OS_TEST=$(BR2_PACKAGE_LIBNSS_ARCH) \
 	NSS_ENABLE_WERROR=0
 
 ifeq ($(BR2_ARCH_IS_64),y)
