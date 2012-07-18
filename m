From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 18 Jul 2012 23:17:40 +0200
Subject: [Buildroot] [PATCH 5/5] libglib2: do not use xlocale
In-Reply-To: <1342646260-11203-1-git-send-email-s.neumann@raumfeld.com>
References: <1342646260-11203-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1342646260-11203-6-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The xlocale based implementations of g_ascii_strto{d,ll,ull}
and g_ascii_formatd crash with uClibC 0.9.32 (and probably other
versions as well). So trick the configure script into believing
that this functionality was not available so that the good old
home-grown code is used again (as was the case with glib 2.30).

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/libglib2/libglib2.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 353c824..6b33215 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -45,6 +45,8 @@ LIBGLIB2_CONF_ENV = \
 		ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal ac_cv_prog_F77=no \
 		ac_cv_func_posix_getgrgid_r=no \
 		ac_cv_alignof_guint32=4 ac_cv_alignof_guint64=8 ac_cv_alignof_unsigned_long=4 \
+		ac_cv_func_newlocale=no ac_cv_func_uselocale=no \
+		ac_cv_func_strtod_l=no ac_cv_func_strtoll_l=no ac_cv_func_strtoull_l=no \
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 # old uClibc versions don't provide qsort_r
-- 
1.7.9.5
