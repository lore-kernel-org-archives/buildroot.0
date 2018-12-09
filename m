From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 16:53:54 +0100
Subject: [Buildroot] [git commit] package/gcc/7.4.0: remove upstream patch
Message-ID: <20181209155009.2A0D68B758@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78fab2a08d41002510da62c6b77c3dc11f01edc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

0001-m68k-coldfire-pr68467.patch is already upstream and backported to
gcc 7.4.0 [1].

[1] https://github.com/gcc-mirror/gcc/commit/2d1d94491cc66e240f9ca2845ec64e8ffe851c74

Fixes:
https://gitlab.com/ymorin/buildroot/-/jobs/131924271
https://gitlab.com/ymorin/buildroot/-/jobs/131924272

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/7.4.0/0001-m68k-coldfire-pr68467.patch | 48 ----------------------
 1 file changed, 48 deletions(-)

diff --git a/package/gcc/7.4.0/0001-m68k-coldfire-pr68467.patch b/package/gcc/7.4.0/0001-m68k-coldfire-pr68467.patch
deleted file mode 100644
index 0069b57134..0000000000
--- a/package/gcc/7.4.0/0001-m68k-coldfire-pr68467.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-Backport from upstream, see
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68467
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-diff -Nur gcc-7.2.0.orig/gcc/config/m68k/m68k.c gcc-7.2.0/gcc/config/m68k/m68k.c
---- gcc-7.2.0.orig/gcc/config/m68k/m68k.c	2017-04-03 22:30:56.274463000 +0000
-+++ gcc-7.2.0/gcc/config/m68k/m68k.c	2018-01-27 02:16:53.779367849 +0000
-@@ -182,6 +182,8 @@
- 			      const_tree, bool);
- static bool m68k_cannot_force_const_mem (machine_mode mode, rtx x);
- static bool m68k_output_addr_const_extra (FILE *, rtx);
-+static machine_mode m68k_promote_function_mode (const_tree, machine_mode,
-+						int *, const_tree, int);
- static void m68k_init_sync_libfuncs (void) ATTRIBUTE_UNUSED;
- static enum flt_eval_method
- m68k_excess_precision (enum excess_precision_type);
-@@ -332,6 +334,9 @@
- #undef TARGET_ATOMIC_TEST_AND_SET_TRUEVAL
- #define TARGET_ATOMIC_TEST_AND_SET_TRUEVAL 128
- 
-+#undef TARGET_PROMOTE_FUNCTION_MODE
-+#define TARGET_PROMOTE_FUNCTION_MODE m68k_promote_function_mode
-+
- static const struct attribute_spec m68k_attribute_table[] =
- {
-   /* { name, min_len, max_len, decl_req, type_req, fn_type_req, handler,
-@@ -6571,4 +6576,20 @@
-   return FLT_EVAL_METHOD_UNPREDICTABLE;
- }
- 
-+/* Implement TARGET_PROMOTE_FUNCTION_MODE.  */
-+
-+static machine_mode
-+m68k_promote_function_mode (const_tree type, machine_mode mode,
-+                            int *punsignedp ATTRIBUTE_UNUSED,
-+                            const_tree fntype ATTRIBUTE_UNUSED,
-+                            int for_return)
-+{
-+  /* Promote libcall arguments narrower than int to match the normal C
-+     ABI (for which promotions are handled via
-+     TARGET_PROMOTE_PROTOTYPES).  */
-+  if (type == NULL_TREE && !for_return && (mode == QImode || mode == HImode))
-+    return SImode;
-+  return mode;
-+}
-+
- #include "gt-m68k.h"
