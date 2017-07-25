From: Hugues Fruchet <hugues.fruchet@st.com>
Date: Tue, 25 Jul 2017 15:29:30 +0200
Subject: [Buildroot] [PATCH v1] package/libv4l: disable libraries build if
	no fork() support
In-Reply-To: <1500989370-5353-1-git-send-email-hugues.fruchet@st.com>
References: <1500989370-5353-1-git-send-email-hugues.fruchet@st.com>
Message-ID: <1500989370-5353-2-git-send-email-hugues.fruchet@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some no-MMU platforms have shared libraries support
but no fork() support, which is required by libv4lconvert.
Fix this by disabling libv4l libraries build in case of
no fork() support.
This fix the build issue reported here:
http://lists.buildroot.org/pipermail/buildroot/2017-July/197571.html

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 ...c-disable-libv4l-build-if-no-fork-support.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/libv4l/0010-configure.ac-disable-libv4l-build-if-no-fork-support.patch

diff --git a/package/libv4l/0010-configure.ac-disable-libv4l-build-if-no-fork-support.patch b/package/libv4l/0010-configure.ac-disable-libv4l-build-if-no-fork-support.patch
new file mode 100644
index 0000000..23f9f99
--- /dev/null
+++ b/package/libv4l/0010-configure.ac-disable-libv4l-build-if-no-fork-support.patch
@@ -0,0 +1,48 @@
+From 3a68a60e3ee425b68d29d435d0733a7db0cdfc18 Mon Sep 17 00:00:00 2001
+From: Hugues Fruchet <hugues.fruchet@st.com>
+Date: Tue, 25 Jul 2017 11:23:38 +0200
+Subject: [PATCH 10/10] configure.ac: disable libv4l build if no fork() support
+
+Some no-MMU platforms have shared libraries support
+but no fork() support, which is required by libv4lconvert.
+Fix this by disabling libv4l build in case of no fork() support.
+
+Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
+---
+ configure.ac | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9031b42..2996ebc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -298,6 +298,9 @@ argp_saved_libs=$LIBS
+   AC_SUBST([ARGP_LIBS])
+ LIBS=$argp_saved_libs
+ 
++# Check for fork(), needed by libv4lconvert
++AC_CHECK_FUNCS([fork], have_fork=yes, have_fork=no)
++
+ AC_CHECK_HEADER([linux/i2c-dev.h], [linux_i2c_dev=yes], [linux_i2c_dev=no])
+ AM_CONDITIONAL([HAVE_LINUX_I2C_DEV], [test x$linux_i2c_dev = xyes])
+ 
+@@ -436,7 +439,7 @@ AM_CONDITIONAL([WITH_LIBDVBV5],     [test x$enable_libdvbv5  != xno -a x$have_li
+ AM_CONDITIONAL([WITH_DVBV5_REMOTE], [test x$enable_libdvbv5  != xno -a x$have_libudev = xyes -a x$have_pthread = xyes])
+ 
+ AM_CONDITIONAL([WITH_DYN_LIBV4L],   [test x$enable_dyn_libv4l != xno])
+-AM_CONDITIONAL([WITH_LIBV4L],       [test x$enable_libv4l    != xno -a x$enable_shared != xno])
++AM_CONDITIONAL([WITH_LIBV4L],       [test x$enable_libv4l    != xno -a x$enable_shared != xno -a x$have_fork != xno])
+ AM_CONDITIONAL([WITH_V4LUTILS],	    [test x$enable_v4l_utils != xno -a x$linux_os = xyes])
+ AM_CONDITIONAL([WITH_QV4L2],	    [test x${qt_pkgconfig} = xtrue -a x$enable_qv4l2 != xno])
+ AM_CONDITIONAL([WITH_V4L_PLUGINS],  [test x$enable_dyn_libv4l != xno -a x$enable_shared != xno])
+@@ -492,6 +495,7 @@ compile time options summary
+     libjpeg                    : $have_jpeg
+     libudev                    : $have_libudev
+     pthread                    : $have_pthread
++    fork                       : $have_fork
+     QT version                 : $QT_VERSION
+     ALSA support               : $USE_ALSA
+ 
+-- 
+1.9.1
+
-- 
1.9.1
