From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Mon, 17 Dec 2012 21:05:40 +0100
Subject: [Buildroot] [PATCH] libglib2: fix g_print()
Message-ID: <1355774740-28679-1-git-send-email-benoit.thebaudeau@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If GLib is cross-compiled, the default printf settings that it selects are wrong
for glibc. This leads to issues with the g_print() functions, e.g. "Aborted"
errors returned by gst-inspect.

This patch fixes this issue by setting printf configuration options compatible
with glibc. These options should also be compatible with uClibc.

This solution has been suggested for LTIB by Rogerio Nunes:
https://community.freescale.com/thread/302734

Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau@advansee.com>
---
 package/libglib2/libglib2.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 4427431..c3e510b 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -40,7 +40,8 @@ LIBGLIB2_CONF_ENV = \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal ac_cv_prog_F77=no \
-		ac_cv_func_posix_getgrgid_r=no \
+		ac_cv_func_posix_getgrgid_r=no glib_cv_long_long_format=ll \
+		ac_cv_func_printf_unix98=yes ac_cv_func_vsnprintf_c99=yes \
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 # old uClibc versions don't provide qsort_r
-- 
1.7.10.4
