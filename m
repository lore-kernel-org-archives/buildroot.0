From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 11 Jun 2018 16:36:18 -0700
Subject: [Buildroot] [PATCH v2 1/1] libnss: bump to version 3.37.3
In-Reply-To: <20180611214225.22966-1-joseph.kogut@gmail.com>
References: <20180611214225.22966-1-joseph.kogut@gmail.com>
Message-ID: <20180611233618.29360-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/fd64ee3486f9045dfbd83908b8f06ef62c0d9781/
http://autobuild.buildroot.net/results/698500a92688c50e9cc71cf82c0848cb4adb81ad/
http://autobuild.buildroot.net/results/adaa2f79b202cb01ae57fa0cdb0eac9c07b22ea2/
Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---

Changes v1 -> v2:
	- Remove patch merged upstream

 ...hen-not-building-with-int128-support.patch | 143 ------------------
 package/libnss/libnss.hash                    |   4 +-
 package/libnss/libnss.mk                      |   3 +-
 3 files changed, 4 insertions(+), 146 deletions(-)
 delete mode 100644 package/libnss/0003-Bug-1432455-Build-FStar-c-when-not-building-with-int128-support.patch

diff --git a/package/libnss/0003-Bug-1432455-Build-FStar-c-when-not-building-with-int128-support.patch b/package/libnss/0003-Bug-1432455-Build-FStar-c-when-not-building-with-int128-support.patch
deleted file mode 100644
index 1216429696..0000000000
--- a/package/libnss/0003-Bug-1432455-Build-FStar-c-when-not-building-with-int128-support.patch
+++ /dev/null
@@ -1,143 +0,0 @@
-
-# HG changeset patch
-# User Mike Hommey <mh@glandium.org>
-# Date 1527430800 -7200
-# Node ID 3d3e34bb75172462c7b4bbe7bd5e3e47ed65e464
-# Parent  8e600e2af5bf0c29e88f928471e6aba1a734d05b
-Bug 1432455 - Build FStar.c when not building with int128 support. r=fkiefer
-
-Patch retrieved and slightly updated (to add nss path) from:
-https://hg.mozilla.org/projects/nss/rev/3d3e34bb75172462c7b4bbe7bd5e3e47ed65e464
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
---- a/nss/lib/freebl/Makefile
-+++ b/nss/lib/freebl/Makefile
-@@ -530,22 +530,26 @@ ifndef NSS_DISABLE_CHACHAPOLY
-     VERIFIED_SRCS += Hacl_Chacha20.c
-     VERIFIED_SRCS += Hacl_Chacha20_Vec128.c
- endif # NSS_DISABLE_CHACHAPOLY
- 
- ifeq (,$(filter-out i386 x386 x86 x86_64 aarch64,$(CPU_ARCH)))
-     # All intel architectures get the 64 bit version
-     # With custom uint128 if necessary (faster than generic 32 bit version).
-     ECL_SRCS += curve25519_64.c
--    VERIFIED_SRCS += Hacl_Curve25519.c FStar.c
-+    VERIFIED_SRCS += Hacl_Curve25519.c
- else
-     # All non intel architectures get the generic 32 bit implementation (slow!)
-     ECL_SRCS += curve25519_32.c
- endif
- 
-+ifndef HAVE_INT128_SUPPORT
-+    VERIFIED_SRCS += FStar.c
-+endif
-+
- #######################################################################
- # (5) Execute "global" rules. (OPTIONAL)                              #
- #######################################################################
- 
- include $(CORE_DEPTH)/coreconf/rules.mk
- 
- #######################################################################
- # (6) Execute "component" rules. (OPTIONAL)                           #
-diff --git a/nss/lib/freebl/freebl.gyp b/nss/lib/freebl/freebl.gyp
---- a/nss/lib/freebl/freebl.gyp
-+++ b/nss/lib/freebl/freebl.gyp
-@@ -272,28 +272,20 @@
-         },
-       }],
-       [ 'cc_use_gnu_ld==1 and OS=="win" and target_arch=="x64"', {
-         # mingw x64
-         'defines': [
-           'MP_IS_LITTLE_ENDIAN',
-          ],
-       }],
--      [ 'OS!="win"', {
--        'conditions': [
--          [ 'target_arch=="x64" or target_arch=="arm64" or target_arch=="aarch64"', {
--            'defines': [
--              # The Makefile does version-tests on GCC, but we're not doing that here.
--              'HAVE_INT128_SUPPORT',
--            ],
--          }, {
--            'defines': [
--              'KRML_NOUINT128',
--            ],
--          }],
-+      [ 'have_int128_support==1', {
-+        'defines': [
-+          # The Makefile does version-tests on GCC, but we're not doing that here.
-+          'HAVE_INT128_SUPPORT',
-         ],
-       }, {
-         'defines': [
-           'KRML_NOUINT128',
-         ],
-       }],
-       [ 'OS=="linux"', {
-         'defines': [
-@@ -345,10 +337,23 @@
-             ],
-           }],
-         ],
-       }],
-     ],
-   },
-   'variables': {
-     'module': 'nss',
-+    'conditions': [
-+      [ 'OS!="win"', {
-+        'conditions': [
-+          [ 'target_arch=="x64" or target_arch=="arm64" or target_arch=="aarch64"', {
-+            'have_int128_support%': 1,
-+          }, {
-+            'have_int128_support%': 0,
-+          }],
-+        ],
-+      }, {
-+        'have_int128_support%': 0,
-+      }],
-+    ],
-   }
- }
-diff --git a/nss/lib/freebl/freebl_base.gypi b/nss/lib/freebl/freebl_base.gypi
---- a/nss/lib/freebl/freebl_base.gypi
-+++ b/nss/lib/freebl/freebl_base.gypi
-@@ -55,17 +55,16 @@
-     'rsa.c',
-     'rsapkcs.c',
-     'seed.c',
-     'sha512.c',
-     'sha_fast.c',
-     'shvfy.c',
-     'sysrand.c',
-     'tlsprfalg.c',
--    'verified/FStar.c',
-   ],
-   'conditions': [
-     [ 'OS=="linux" or OS=="android"', {
-       'conditions': [
-         [ 'target_arch=="x64"', {
-           'sources': [
-             'arcfour-amd64-gas.s',
-             'intel-aes.s',
-@@ -215,13 +214,16 @@
-             'MP_USE_UINT_DIGIT',
-             'MP_ASSEMBLY_MULTIPLY',
-             'MP_ASSEMBLY_SQUARE',
-             'MP_ASSEMBLY_DIV_2DX1D',
-           ],
-         }],
-       ],
-     }],
-+    [ 'have_int128_support==0', {
-+        'sources': [ 'verified/FStar.c' ],
-+    }],
-   ],
-  'ldflags': [
-    '-Wl,-Bsymbolic'
-  ],
- }
-
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index fa145c91f2..2b79901a7c 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_35_RTM/src/SHA256SUMS
-sha256	5821969e85d241833e96cb82bd4211ddea6d87003f2cccce25e0eab4aefa6268  nss-3.37.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_37_3_RTM/src/SHA256SUMS
+sha256	9af2bbb615d010bd866bb83f8c0bb22b0fa086171e93030ffb03da3da15cc5be  nss-3.37.3.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 053c09f7dc..dd84aafcbe 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.37
+LIBNSS_VERSION_MAJOR = 3.37
+LIBNSS_VERSION = $(LIBNSS_VERSION_MAJOR).3
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.17.1
