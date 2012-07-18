From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 18 Jul 2012 23:17:38 +0200
Subject: [Buildroot] [PATCH 3/5] libglib2: fix alignment checks
In-Reply-To: <1342646260-11203-1-git-send-email-s.neumann@raumfeld.com>
References: <1342646260-11203-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1342646260-11203-4-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script fails to calculate alignments when cross-compiling.

This commit hardcodes alignments for 32 bit platforms. It will need to
be adjusted for other platforms. Please advice on how to fix this properly.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 .../libglib2/libglib2-fix-alignment-tests.patch    |   35 ++++++++++++++++++++
 package/libglib2/libglib2.mk                       |    1 +
 2 files changed, 36 insertions(+)
 create mode 100644 package/libglib2/libglib2-fix-alignment-tests.patch

diff --git a/package/libglib2/libglib2-fix-alignment-tests.patch b/package/libglib2/libglib2-fix-alignment-tests.patch
new file mode 100644
index 0000000..a0f88ff
--- /dev/null
+++ b/package/libglib2/libglib2-fix-alignment-tests.patch
@@ -0,0 +1,35 @@
+From 8f8fc836709cff58bd666b87937542088cfc19db Mon Sep 17 00:00:00 2001
+From: Kalev Lember <kalevlember@gmail.com>
+Date: Wed, 28 Mar 2012 12:42:49 +0300
+Subject: [PATCH] configure: Fix alignment tests when cross compiling
+
+When inserting custom code to AC_CHECK_ALIGNOF, make sure to not replace
+the default includes, but instead append to them.
+
+This fixes ALIGNOF_GUINT32 and ALIGNOF_GUINT64 that were both 0 when cross
+compiling. The third 'unsigned long' test wasn't affected because the
+AC_CHECK_ALIGNOF call didn't specify the optional 2nd parameter.
+---
+ configure.ac |    6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0d30b3e..82d74c6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3405,8 +3405,10 @@ $ac_cv_sizeof___int64)
+   ;;
+ esac
+ 
+-AC_CHECK_ALIGNOF([guint32], [typedef unsigned $gint32 guint32;])
+-AC_CHECK_ALIGNOF([guint64], typedef unsigned $gint64 guint64;)
++AC_CHECK_ALIGNOF([guint32], [AC_INCLUDES_DEFAULT
++typedef unsigned $gint32 guint32;])
++AC_CHECK_ALIGNOF([guint64], [AC_INCLUDES_DEFAULT
++typedef unsigned $gint64 guint64;])
+ AC_CHECK_ALIGNOF([unsigned long])
+ 
+ # Check for libdbus1 - Optional - is only used in the GDBus test cases
+-- 
+1.7.9.1
+
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index cc76669..004312f 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -43,6 +43,7 @@ LIBGLIB2_CONF_ENV = \
 		ac_use_included_regex=no gl_cv_c_restrict=no \
 		ac_cv_path_GLIB_GENMARSHAL=$(HOST_DIR)/usr/bin/glib-genmarshal ac_cv_prog_F77=no \
 		ac_cv_func_posix_getgrgid_r=no \
+		ac_cv_alignof_guint32=4 ac_cv_alignof_guint64=8 ac_cv_alignof_unsigned_long=4 \
 		gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no)
 
 # old uClibc versions don't provide qsort_r
-- 
1.7.9.5
