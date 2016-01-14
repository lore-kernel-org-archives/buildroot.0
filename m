From: Vicente Bergas <vicencb@gmail.com>
Date: Thu, 14 Jan 2016 15:31:31 +0100
Subject: [Buildroot] [PATCH] package/argp-standalone: Fix build with c99
	compilers
In-Reply-To: <20160114142034.35adff54@free-electrons.com>
References: <20160114142034.35adff54@free-electrons.com>
Message-ID: <1452781891-11795-1-git-send-email-vicencb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch from:
http://review.gluster.org/6034

Signed-off-by: Vicente Bergas <vicencb@gmail.com>
Tested-by: Vicente Bergas <vicencb@gmail.com>
---
 .../0003-fix_build_with_c99_compilers.patch        | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/argp-standalone/0003-fix_build_with_c99_compilers.patch

diff --git a/package/argp-standalone/0003-fix_build_with_c99_compilers.patch b/package/argp-standalone/0003-fix_build_with_c99_compilers.patch
new file mode 100644
index 0000000..bfa0bb5
--- /dev/null
+++ b/package/argp-standalone/0003-fix_build_with_c99_compilers.patch
@@ -0,0 +1,80 @@
+From b2dfa011a3fdcb7d22764d143517d0fbd1c2a201 Mon Sep 17 00:00:00 2001
+From: Emmanuel Dreyfus <manu@netbsd.org>
+Date: Wed, 22 Jan 2014 14:47:23 +0100
+Subject: [PATCH] Fix build with c99 compilers
+
+BUG: 764655
+Change-Id: If5dfdc9c7427bd3d39d8da8f79e33ae2da6a3137
+Signed-off-by: Emmanuel Dreyfus <manu@netbsd.org>
+Reviewed-on: http://review.gluster.org/6034
+Reviewed-by: Harshavardhana <harsha@harshavardhana.net>
+Tested-by: Gluster Build System <jenkins@build.gluster.com>
+---
+
+diff --git a/argp-fmtstream.c b/argp-fmtstream.c
+index 7f79285..494b6b3 100644
+--- a/argp-fmtstream.c
++++ b/argp-fmtstream.c
+@@ -389,6 +389,7 @@
+ weak_alias (__argp_fmtstream_printf, argp_fmtstream_printf)
+ #endif
+ 
++#if __STDC_VERSION__ - 199900L < 1
+ /* Duplicate the inline definitions in argp-fmtstream.h, for compilers
+  * that don't do inlining. */
+ size_t
+@@ -471,5 +472,6 @@
+     __argp_fmtstream_update (__fs);
+   return __fs->point_col >= 0 ? __fs->point_col : 0;
+ }
++#endif /* __STDC_VERSION__ - 199900L < 1 */
+ 
+ #endif /* !ARGP_FMTSTREAM_USE_LINEWRAP */
+diff --git a/argp-fmtstream.h b/argp-fmtstream.h
+index e797b11..828f435 100644
+--- a/argp-fmtstream.h
++++ b/argp-fmtstream.h
+@@ -153,6 +153,7 @@
+ 				      __const char *__fmt, ...)
+      PRINTF_STYLE(2,3);
+ 
++#if __STDC_VERSION__ - 199900L < 1
+ extern int __argp_fmtstream_putc (argp_fmtstream_t __fs, int __ch);
+ extern int argp_fmtstream_putc (argp_fmtstream_t __fs, int __ch);
+ 
+@@ -163,6 +164,7 @@
+ 				      __const char *__str, size_t __len);
+ extern size_t argp_fmtstream_write (argp_fmtstream_t __fs,
+ 				    __const char *__str, size_t __len);
++#endif /* __STDC_VERSION__ - 199900L < 1 */
+ 
+ /* Access macros for various bits of state.  */
+ #define argp_fmtstream_lmargin(__fs) ((__fs)->lmargin)
+@@ -172,6 +174,7 @@
+ #define __argp_fmtstream_rmargin argp_fmtstream_rmargin
+ #define __argp_fmtstream_wmargin argp_fmtstream_wmargin
+ 
++#if __STDC_VERSION__ - 199900L < 1
+ /* Set __FS's left margin to LMARGIN and return the old value.  */
+ extern size_t argp_fmtstream_set_lmargin (argp_fmtstream_t __fs,
+ 					  size_t __lmargin);
+@@ -193,6 +196,7 @@
+ /* Return the column number of the current output point in __FS.  */
+ extern size_t argp_fmtstream_point (argp_fmtstream_t __fs);
+ extern size_t __argp_fmtstream_point (argp_fmtstream_t __fs);
++#endif /* __STDC_VERSION__ - 199900L < 1 */
+ 
+ /* Internal routines.  */
+ extern void _argp_fmtstream_update (argp_fmtstream_t __fs);
+@@ -216,7 +220,11 @@
+ #endif
+ 
+ #ifndef ARGP_FS_EI
++#if defined(__GNUC__) && !defined(__GNUC_STDC_INLINE__)
+ #define ARGP_FS_EI extern inline
++#else
++#define ARGP_FS_EI inline
++#endif
+ #endif
+ 
+ ARGP_FS_EI size_t
-- 
2.7.0
