From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 19:00:15 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/cairo: fix
 CVE-2018-19876
Message-ID: <20200314180750.ABEAD83AA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=272dd4b14f6108a9337885e75f97d695893ca506
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Add an upstream patch to fix CVE-2018-19876: cairo 1.16.0, in
cairo_ft_apply_variations() in cairo-ft-font.c, would free memory using a
free function incompatible with WebKit's fastMalloc, leading to an
application crash with a "free(): invalid pointer" error.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: extend commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 91b150dc33841be13a2085d52c312dafe0b87767)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...hen-available-in-cairo_ft_apply_variation.patch | 33 ++++++++++++++++++++++
 package/cairo/cairo.mk                             |  3 ++
 2 files changed, 36 insertions(+)

diff --git a/package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch b/package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
new file mode 100644
index 0000000000..10e000d16f
--- /dev/null
+++ b/package/cairo/0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
@@ -0,0 +1,33 @@
+From 90e85c2493fdfa3551f202ff10282463f1e36645 Mon Sep 17 00:00:00 2001
+From: Carlos Garcia Campos <cgarcia@igalia.com>
+Date: Mon, 19 Nov 2018 12:33:07 +0100
+Subject: [PATCH] ft: Use FT_Done_MM_Var instead of free when available in
+ cairo_ft_apply_variations
+
+Fixes a crash when using freetype >= 2.9
+[Retrieved from:
+https://gitlab.freedesktop.org/cairo/cairo/-/commit/90e85c2493fdfa3551f202ff10282463f1e36645]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/cairo-ft-font.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/cairo-ft-font.c b/src/cairo-ft-font.c
+index 325dd61b4..981973f78 100644
+--- a/src/cairo-ft-font.c
++++ b/src/cairo-ft-font.c
+@@ -2393,7 +2393,11 @@ skip:
+ done:
+         free (coords);
+         free (current_coords);
++#if HAVE_FT_DONE_MM_VAR
++        FT_Done_MM_Var (face->glyph->library, ft_mm_var);
++#else
+         free (ft_mm_var);
++#endif
+     }
+ }
+ 
+-- 
+2.24.1
+
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 902f505aaa..c6a3dad932 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -11,6 +11,9 @@ CAIRO_LICENSE_FILES = COPYING COPYING-LGPL-2.1 COPYING-MPL-1.1
 CAIRO_SITE = http://cairographics.org/releases
 CAIRO_INSTALL_STAGING = YES
 
+# 0002-ft-Use-FT_Done_MM_Var-instead-of-free-when-available-in-cairo_ft_apply_variation.patch
+CAIRO_IGNORE_CVES += CVE-2018-19876
+
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
 CAIRO_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
