From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 18 Dec 2012 09:37:35 +0100
Subject: [Buildroot] [git commit] libglib2: fix g_print()
Message-ID: <20121218085633.2267B9A376@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a7e06dc83b70eaed900ab5078206e1c7d0ce141
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If GLib is cross-compiled, the default printf settings that it selects are wrong
for glibc. This leads to issues with the g_print() functions, e.g. "Aborted"
errors returned by gst-inspect.

This patch fixes this issue by setting printf configuration options compatible
with glibc. These options should also be compatible with uClibc.

This solution has been suggested for LTIB by Rogerio Nunes:
https://community.freescale.com/thread/302734

Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau@advansee.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libglib2/libglib2.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
