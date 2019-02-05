From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue,  5 Feb 2019 06:54:32 -0600
Subject: [Buildroot] [PATCH] package/moarvm: resolve libtommath name
 collision
Message-ID: <1549371272-5485-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/02f/02ff68698603ebdce5d13d3130a15b5a1ecc14d2/build-end.log

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 ...-Fix-Name-Collision-With-LibTomMath-Funcs.patch | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/moarvm/0001-Fix-Name-Collision-With-LibTomMath-Funcs.patch

diff --git a/package/moarvm/0001-Fix-Name-Collision-With-LibTomMath-Funcs.patch b/package/moarvm/0001-Fix-Name-Collision-With-LibTomMath-Funcs.patch
new file mode 100644
index 0000000..621a4b3
--- /dev/null
+++ b/package/moarvm/0001-Fix-Name-Collision-With-LibTomMath-Funcs.patch
@@ -0,0 +1,63 @@
+From 588d4805097d01865538a2d5c52d59c99a1015e7 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Tue, 5 Feb 2019 06:48:41 -0600
+Subject: [PATCH] Fix Name Collision With LibTomMath Funcs
+
+Upstream: https://github.com/MoarVM/MoarVM/commit/f7204a3ee5199dd70f26d6fe133008cc86c63bbe
+(Similar but version difference has Buildroot only using a subset of the changes
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ src/math/bigintops.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/math/bigintops.c b/src/math/bigintops.c
+index 2275593..8ab7ed6 100644
+--- a/src/math/bigintops.c
++++ b/src/math/bigintops.c
+@@ -45,7 +45,7 @@ int MVM_bigint_mp_set_uint64(mp_int * a, MVMuint64 b) {
+   return MP_OKAY;
+ }
+ 
+-static MVMnum64 mp_get_double(mp_int *a) {
++static MVMnum64 MVM_mp_get_double(mp_int *a) {
+     MVMnum64 d    = 0.0;
+     MVMnum64 sign = SIGN(a) == MP_NEG ? -1.0 : 1.0;
+     int i;
+@@ -680,8 +680,8 @@ MVMObject * MVM_bigint_pow(MVMThreadContext *tc, MVMObject *a, MVMObject *b,
+         }
+     }
+     else {
+-        MVMnum64 f_base = mp_get_double(base);
+-        MVMnum64 f_exp = mp_get_double(exponent);
++        MVMnum64 f_base = MVM_mp_get_double(base);
++        MVMnum64 f_exp = MVM_mp_get_double(exponent);
+         r = MVM_repr_box_num(tc, num_type, pow(f_base, f_exp));
+     }
+     clear_temp_bigints(tmp, 2);
+@@ -880,7 +880,7 @@ MVMnum64 MVM_bigint_to_num(MVMThreadContext *tc, MVMObject *a) {
+ 
+     if (MVM_BIGINT_IS_BIG(ba)) {
+         mp_int *ia = ba->u.bigint;
+-        return mp_get_double(ia);
++        return MVM_mp_get_double(ia);
+     } else {
+         return (double)ba->u.smallint.value;
+     }
+@@ -913,11 +913,11 @@ MVMnum64 MVM_bigint_div_num(MVMThreadContext *tc, MVMObject *a, MVMObject *b) {
+             mp_init(&reduced_b);
+             mp_div_2d(ia, max_size - 1023, &reduced_a, NULL);
+             mp_div_2d(ib, max_size - 1023, &reduced_b, NULL);
+-            c = mp_get_double(&reduced_a) / mp_get_double(&reduced_b);
++            c = MVM_mp_get_double(&reduced_a) / MVM_mp_get_double(&reduced_b);
+             mp_clear(&reduced_a);
+             mp_clear(&reduced_b);
+         } else {
+-            c = mp_get_double(ia) / mp_get_double(ib);
++            c = MVM_mp_get_double(ia) / MVM_mp_get_double(ib);
+         }
+         clear_temp_bigints(tmp, 2);
+     } else {
+-- 
+1.9.1
+
-- 
1.9.1
