From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Mar 2018 17:06:10 +0100
Subject: [Buildroot] [PATCH 1/1] kvazaar: bump to version 1.2.0
Message-ID: <20180304160610.32211-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license hash
Remove patch (applied upstream)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...use-FILL_ARRAY-macro-to-prevent-warning-o.patch | 56 ----------------------
 package/kvazaar/kvazaar.hash                       |  3 +-
 package/kvazaar/kvazaar.mk                         |  2 +-
 3 files changed, 3 insertions(+), 58 deletions(-)
 delete mode 100644 package/kvazaar/0001-Modify-and-use-FILL_ARRAY-macro-to-prevent-warning-o.patch

diff --git a/package/kvazaar/0001-Modify-and-use-FILL_ARRAY-macro-to-prevent-warning-o.patch b/package/kvazaar/0001-Modify-and-use-FILL_ARRAY-macro-to-prevent-warning-o.patch
deleted file mode 100644
index 633da8b36d..0000000000
--- a/package/kvazaar/0001-Modify-and-use-FILL_ARRAY-macro-to-prevent-warning-o.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 47a9f0de049e77e866ea5bdd4bc7c795ea6dd641 Mon Sep 17 00:00:00 2001
-From: Ari Lemmetti <ari.lemmetti@gmail.com>
-Date: Tue, 11 Apr 2017 12:57:22 +0300
-Subject: [PATCH] Modify and use FILL_ARRAY macro to prevent warning on GCC 7
-
-Following warning was given and is false positive
-
-error: 'memset' used with length equal to number of elements without multiplication by element size [-Werror=memset-elt-size]
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream commit 47a9f0de049e7.
-
- src/global.h | 6 +++++-
- src/rdo.c    | 8 ++++----
- 2 files changed, 9 insertions(+), 5 deletions(-)
-
-diff --git a/src/global.h b/src/global.h
-index bedcd49c2e02..518167443f35 100644
---- a/src/global.h
-+++ b/src/global.h
-@@ -219,7 +219,11 @@ typedef int16_t coeff_t;
- // Fill a structure or a static array with val bytes.
- #define FILL(var, val) memset(&(var), (val), sizeof(var))
- // Fill a number of elements in an array with val bytes.
--#define FILL_ARRAY(ar, val, size) memset((ar), (val), (size) * sizeof(*(ar)))
-+#define FILL_ARRAY(ar, val, size) \
-+{\
-+  void *temp_ptr = (void*)(ar);\
-+  memset((temp_ptr), (val), (size) * sizeof(*(ar)));\
-+}
- 
- #define FREE_POINTER(pointer) { free((void*)pointer); pointer = NULL; }
- #define MOVE_POINTER(dst_pointer,src_pointer) { dst_pointer = src_pointer; src_pointer = NULL; }
-diff --git a/src/rdo.c b/src/rdo.c
-index 52305fd72fab..2579f2808441 100644
---- a/src/rdo.c
-+++ b/src/rdo.c
-@@ -558,10 +558,10 @@ void kvz_rdoq(encoder_state_t * const state, coeff_t *coef, coeff_t *dest_coeff,
-   // Explicitly tell the only possible numbers of elements to be zeroed.
-   // Hope the compiler is able to utilize this information.
-   switch (cg_num) {
--    case  1: memset(sig_coeffgroup_flag, 0,  1 * sizeof(sig_coeffgroup_flag[0])); break;
--    case  4: memset(sig_coeffgroup_flag, 0,  4 * sizeof(sig_coeffgroup_flag[0])); break;
--    case 16: memset(sig_coeffgroup_flag, 0, 16 * sizeof(sig_coeffgroup_flag[0])); break;
--    case 64: memset(sig_coeffgroup_flag, 0, 64 * sizeof(sig_coeffgroup_flag[0])); break;
-+    case  1: FILL_ARRAY(sig_coeffgroup_flag, 0,  1); break;
-+    case  4: FILL_ARRAY(sig_coeffgroup_flag, 0,  4); break;
-+    case 16: FILL_ARRAY(sig_coeffgroup_flag, 0, 16); break;
-+    case 64: FILL_ARRAY(sig_coeffgroup_flag, 0, 64); break;
-     default: assert(0 && "There should be 1, 4, 16 or 64 coefficient groups");
-   }
- 
--- 
-2.13.2
-
diff --git a/package/kvazaar/kvazaar.hash b/package/kvazaar/kvazaar.hash
index 80f480b5d5..aa746ca17e 100644
--- a/package/kvazaar/kvazaar.hash
+++ b/package/kvazaar/kvazaar.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 8e382738a51004bfcfca4c832e8b41fe6a17f889f3c39151dc1c1a37261a3a6d  kvazaar-v1.1.0.tar.gz
+sha256 480ecfd9b4d2b7d21b355e4a35fcf47b4db7a3b0315b6219d93733db42392bd9  kvazaar-v1.2.0.tar.gz
+sha256 531712277c3543b9ee86c4c4e0e424f531b893a44cc021c74a24b038d8de4d2a COPYING
diff --git a/package/kvazaar/kvazaar.mk b/package/kvazaar/kvazaar.mk
index f9149a781f..0cf965dd86 100644
--- a/package/kvazaar/kvazaar.mk
+++ b/package/kvazaar/kvazaar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KVAZAAR_VERSION = v1.1.0
+KVAZAAR_VERSION = v1.2.0
 KVAZAAR_SITE = $(call github,ultravideo,kvazaar,$(KVAZAAR_VERSION))
 KVAZAAR_LICENSE = LGPL-2.1+
 KVAZAAR_LICENSE_FILES = COPYING
-- 
2.14.1
