From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 23:01:32 +0100
Subject: [Buildroot] [git commit] package/moarvm: bump to version 2019.03
Message-ID: <20190324220643.74FAC7FE17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af81f3216eaf4dd91ac3d10b24a75c141940a579
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Fix-Name-Collision-With-LibTomMath-Funcs.patch | 65 ----------------------
 package/moarvm/moarvm.hash                         |  3 +-
 package/moarvm/moarvm.mk                           |  5 +-
 3 files changed, 4 insertions(+), 69 deletions(-)

diff --git a/package/moarvm/0001-Fix-Name-Collision-With-LibTomMath-Funcs.patch b/package/moarvm/0001-Fix-Name-Collision-With-LibTomMath-Funcs.patch
deleted file mode 100644
index 4af4d3264e..0000000000
--- a/package/moarvm/0001-Fix-Name-Collision-With-LibTomMath-Funcs.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From ead5f4da759465cf6fc2ceab7c431d3550a3323f Mon Sep 17 00:00:00 2001
-From: Timo Paulssen <timonator@perpetuum-immobile.de>
-Date: Tue, 15 Jan 2019 12:35:56 +0100
-Subject: [PATCH] Fix Name Collision With Existing LibTomMath Function
-
-fixes #1032
-
-Upstream: https://github.com/MoarVM/MoarVM/commit/f7204a3ee5199dd70f26d6fe133008cc86c63bbe
-(backported mp_get_double() as other functions weren't yet used)
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- src/math/bigintops.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/math/bigintops.c b/src/math/bigintops.c
-index 2275593..8ab7ed6 100644
---- a/src/math/bigintops.c
-+++ b/src/math/bigintops.c
-@@ -45,7 +45,7 @@ int MVM_bigint_mp_set_uint64(mp_int * a, MVMuint64 b) {
-   return MP_OKAY;
- }
- 
--static MVMnum64 mp_get_double(mp_int *a) {
-+static MVMnum64 MVM_mp_get_double(mp_int *a) {
-     MVMnum64 d    = 0.0;
-     MVMnum64 sign = SIGN(a) == MP_NEG ? -1.0 : 1.0;
-     int i;
-@@ -680,8 +680,8 @@ MVMObject * MVM_bigint_pow(MVMThreadContext *tc, MVMObject *a, MVMObject *b,
-         }
-     }
-     else {
--        MVMnum64 f_base = mp_get_double(base);
--        MVMnum64 f_exp = mp_get_double(exponent);
-+        MVMnum64 f_base = MVM_mp_get_double(base);
-+        MVMnum64 f_exp = MVM_mp_get_double(exponent);
-         r = MVM_repr_box_num(tc, num_type, pow(f_base, f_exp));
-     }
-     clear_temp_bigints(tmp, 2);
-@@ -880,7 +880,7 @@ MVMnum64 MVM_bigint_to_num(MVMThreadContext *tc, MVMObject *a) {
- 
-     if (MVM_BIGINT_IS_BIG(ba)) {
-         mp_int *ia = ba->u.bigint;
--        return mp_get_double(ia);
-+        return MVM_mp_get_double(ia);
-     } else {
-         return (double)ba->u.smallint.value;
-     }
-@@ -913,11 +913,11 @@ MVMnum64 MVM_bigint_div_num(MVMThreadContext *tc, MVMObject *a, MVMObject *b) {
-             mp_init(&reduced_b);
-             mp_div_2d(ia, max_size - 1023, &reduced_a, NULL);
-             mp_div_2d(ib, max_size - 1023, &reduced_b, NULL);
--            c = mp_get_double(&reduced_a) / mp_get_double(&reduced_b);
-+            c = MVM_mp_get_double(&reduced_a) / MVM_mp_get_double(&reduced_b);
-             mp_clear(&reduced_a);
-             mp_clear(&reduced_b);
-         } else {
--            c = mp_get_double(ia) / mp_get_double(ib);
-+            c = MVM_mp_get_double(ia) / MVM_mp_get_double(ib);
-         }
-         clear_temp_bigints(tmp, 2);
-     } else {
--- 
-1.9.1
-
diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 409486ac70..4aed49da6c 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 7cb9b7a871b14ac9b6cddc57e646d277177c4b3b21220e6fbc204084a15a4e41  MoarVM-2017.05.tar.gz
+sha256 24b00e5228894fa6f70e9caa73114e5c6ec3686b6305e6e463807a93f70ffc04  MoarVM-2019.03.tar.gz
+sha256 c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 705c93934d..0f2dadf6d2 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2017.05
+MOARVM_VERSION = 2019.03
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
 MOARVM_LICENSE_FILES = Artistic2.txt
 MOARVM_INSTALL_STAGING = YES
-MOARVM_DEPENDENCIES = host-lua host-pkgconf libuv libtommath libatomic_ops
+MOARVM_DEPENDENCIES = host-pkgconf libuv libtommath libatomic_ops
 
 MOARVM_CONF_OPTS = \
 	--build=$(GNU_HOST_NAME) \
@@ -20,7 +20,6 @@ MOARVM_CONF_OPTS = \
 	--ld="$(TARGET_CC)" \
 	--prefix="/usr" \
 	--pkgconfig=$(PKG_CONFIG_HOST_BINARY) \
-	--lua=$(HOST_DIR)/bin/lua \
 	--has-libuv \
 	--has-libtommath \
 	--has-libatomic
