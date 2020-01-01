From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  1 Jan 2020 17:58:11 +0100
Subject: [Buildroot] [PATCH v2] package/libnss: fix build failure due to HW
 PPC Crypto bug
In-Reply-To: <20200101163258.13c7de62@windsurf>
References: <20200101163258.13c7de62@windsurf>
Message-ID: <20200101165811.45110-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libnss expects OS_TEST to be set to ppc or ppc64 or ppc64le instead of
powerpc, powerpc64, powerpc64le. At the moment gcm.h header checks if
__powerpc64__ is defined, but Makefile expects OS_TEST to be set to
ppc64 or ppc64le to build gcm-ppc.c. This way we end with having gcm
prototypes defined, but without implementation compiled. So remap
OS_TEST to what libnss expects depending on BR2_powerpc* enabled. This
way Makefile will build gcm-ppc.c too, that contains gcm-ppc function
implementations using Altivec. But add also a patch that modify
minimum gcc version required for using Altivec functions from 5.x to 8.x
since some Altivec intrinsics have been instroduced only in 8.x(i.e.
vec_xst_be()).

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1 -> V2:
* changed completely approach
Pending upstream:
https://bugzilla.mozilla.org/show_bug.cgi?id=1606119
---
 ...6119-Fix-PPC-HW-Crypto-build-failure.patch | 35 +++++++++++++++++++
 package/libnss/libnss.mk                      |  6 ++++
 2 files changed, 41 insertions(+)
 create mode 100644 package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch

diff --git a/package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch b/package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch
new file mode 100644
index 0000000000..2439eb1625
--- /dev/null
+++ b/package/libnss/0005-Bug-1606119-Fix-PPC-HW-Crypto-build-failure.patch
@@ -0,0 +1,35 @@
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
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 9349276a90..23dfdb11e4 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -39,6 +39,12 @@ endif
 
 ifeq ($(BR2_aarch64_be),y)
 LIBNSS_ARCH = aarch64
+else ifeq ($(BR2_powerpc),y)
+LIBNSS_ARCH = ppc
+else ifeq ($(BR2_powerpc64),y)
+LIBNSS_ARCH = ppc64
+else ifeq ($(BR2_powerpc64le),y)
+LIBNSS_ARCH = ppc64le
 else
 LIBNSS_ARCH = $(ARCH)
 endif
-- 
2.20.1
