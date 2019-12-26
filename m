From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 26 Dec 2019 23:09:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/libffi: fix build on powerpc64 with
 no __int128
Message-ID: <20191226220920.261056-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/cb69d82ad1d41f6ea13d289ec2226d9bd5b67984

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...6-Address-platforms-with-no-__int128.patch | 28 +++++++++++++
 ...y-to-help-platforms-with-no-__int128.patch | 42 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 package/libffi/0006-Address-platforms-with-no-__int128.patch
 create mode 100644 package/libffi/0007-powerpc64-Use-memcpy-to-help-platforms-with-no-__int128.patch

diff --git a/package/libffi/0006-Address-platforms-with-no-__int128.patch b/package/libffi/0006-Address-platforms-with-no-__int128.patch
new file mode 100644
index 0000000000..012c6f0dae
--- /dev/null
+++ b/package/libffi/0006-Address-platforms-with-no-__int128.patch
@@ -0,0 +1,28 @@
+From 6663047f56c2932a6b10a790f4ac6666dd181326 Mon Sep 17 00:00:00 2001
+From: Anthony Green <green@moxielogic.com>
+Date: Fri, 29 Nov 2019 07:00:35 -0500
+Subject: [PATCH] Address platforms with no __int128.
+
+[Retrieved from:
+https://github.com/libffi/libffi/commit/6663047f56c2932a6b10a790f4ac6666dd181326]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/powerpc/ffi_linux64.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/powerpc/ffi_linux64.c b/src/powerpc/ffi_linux64.c
+index de0d0337..73647701 100644
+--- a/src/powerpc/ffi_linux64.c
++++ b/src/powerpc/ffi_linux64.c
+@@ -547,9 +547,9 @@ ffi_prep_args64 (extended_cif *ecif, unsigned long *const stack)
+               if (next_arg.ul == gpr_end.ul)
+                 next_arg.ul = rest.ul;
+               if (vecarg_count < NUM_VEC_ARG_REGISTERS64 && i < nfixedargs)
+-                *vec_base.f128++ = **p_argv.f128;
++		memcpy (vec_base.f128++, *p_argv.f128, sizeof (float128));
+               else
+-                *next_arg.f128 = **p_argv.f128;
++		memcpy (next_arg.f128, *p_argv.f128, sizeof (float128));
+               if (++next_arg.f128 == gpr_end.f128)
+                 next_arg.f128 = rest.f128;
+               vecarg_count++;
diff --git a/package/libffi/0007-powerpc64-Use-memcpy-to-help-platforms-with-no-__int128.patch b/package/libffi/0007-powerpc64-Use-memcpy-to-help-platforms-with-no-__int128.patch
new file mode 100644
index 0000000000..53036707d2
--- /dev/null
+++ b/package/libffi/0007-powerpc64-Use-memcpy-to-help-platforms-with-no-__int128.patch
@@ -0,0 +1,42 @@
+From e50b9ef8b910fa642ef158f6642e60d54d7ad740 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 7 Dec 2019 02:34:14 -0800
+Subject: [PATCH] powerpc64: Use memcpy to help platforms with no __int128.
+ (#534)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Retrieved from:
+https://github.com/libffi/libffi/commit/e50b9ef8b910fa642ef158f6642e60d54d7ad740]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/powerpc/ffi_linux64.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/powerpc/ffi_linux64.c b/src/powerpc/ffi_linux64.c
+index 73647701..4d50878e 100644
+--- a/src/powerpc/ffi_linux64.c
++++ b/src/powerpc/ffi_linux64.c
+@@ -680,9 +680,9 @@ ffi_prep_args64 (extended_cif *ecif, unsigned long *const stack)
+                     {
+                       if (vecarg_count < NUM_VEC_ARG_REGISTERS64
+                           && i < nfixedargs)
+-                        *vec_base.f128++ = *arg.f128++;
++		        memcpy (vec_base.f128++, arg.f128, sizeof (float128));
+                       else
+-                        *next_arg.f128 = *arg.f128++;
++		        memcpy (next_arg.f128, arg.f128++, sizeof (float128));
+                       if (++next_arg.f128 == gpr_end.f128)
+                         next_arg.f128 = rest.f128;
+                       vecarg_count++;
+@@ -986,9 +986,9 @@ ffi_closure_helper_LINUX64 (ffi_cif *cif,
+                   do
+                     {
+                       if (pvec < end_pvec && i < nfixedargs)
+-                        *to.f128 = *pvec++;
++		        memcpy (to.f128, pvec++, sizeof (float128));
+                       else
+-                        *to.f128 = *from.f128;
++		        memcpy (to.f128, from.f128, sizeof (float128));
+                       to.f128++;
+                       from.f128++;
+                     }
-- 
2.24.0
