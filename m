From: Hugues Fruchet <hugues.fruchet@st.com>
Date: Wed, 26 Jul 2017 14:11:37 +0200
Subject: [Buildroot] [PATCH v2] package/libv4l: no libv4lconvert helper
	support if no fork()
In-Reply-To: <1501071097-6301-1-git-send-email-hugues.fruchet@st.com>
References: <1501071097-6301-1-git-send-email-hugues.fruchet@st.com>
Message-ID: <1501071097-6301-2-git-send-email-hugues.fruchet@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build libv4lconvert helper support only when fork()
is available.
This fix the build issue reported here:
http://autobuild.buildroot.net/results/7e8/7e8fbd99a8c091d7bbeedd16066297682bbe29fe/build-end.log

Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
---
 ...lconvert-helper-support-only-when-fork-is.patch | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 package/libv4l/0010-Build-libv4lconvert-helper-support-only-when-fork-is.patch

diff --git a/package/libv4l/0010-Build-libv4lconvert-helper-support-only-when-fork-is.patch b/package/libv4l/0010-Build-libv4lconvert-helper-support-only-when-fork-is.patch
new file mode 100644
index 0000000..d604a53
--- /dev/null
+++ b/package/libv4l/0010-Build-libv4lconvert-helper-support-only-when-fork-is.patch
@@ -0,0 +1,100 @@
+From 5e191b15eed3535dccbf7a98ff2c484b0a1945e9 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 25 Jul 2017 21:04:35 +0200
+Subject: [PATCH 10/10] Build libv4lconvert helper support only when fork() is
+ available
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac                      | 3 +++
+ lib/libv4lconvert/Makefile.am     | 7 ++++++-
+ lib/libv4lconvert/libv4lconvert.c | 6 ++++++
+ 3 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9031b42..58fb688 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -298,6 +298,9 @@ argp_saved_libs=$LIBS
+   AC_SUBST([ARGP_LIBS])
+ LIBS=$argp_saved_libs
+ 
++AC_CHECK_FUNCS([fork], AC_DEFINE([HAVE_LIBV4LCONVERT_HELPERS],[1],[whether to use libv4lconvert helpers]))
++AM_CONDITIONAL([HAVE_LIBV4LCONVERT_HELPERS], [test x$ac_cv_func_fork = xyes])
++
+ AC_CHECK_HEADER([linux/i2c-dev.h], [linux_i2c_dev=yes], [linux_i2c_dev=no])
+ AM_CONDITIONAL([HAVE_LINUX_I2C_DEV], [test x$linux_i2c_dev = xyes])
+ 
+diff --git a/lib/libv4lconvert/Makefile.am b/lib/libv4lconvert/Makefile.am
+index 4f332fa..f266f3e 100644
+--- a/lib/libv4lconvert/Makefile.am
++++ b/lib/libv4lconvert/Makefile.am
+@@ -1,6 +1,8 @@
+ if WITH_DYN_LIBV4L
+ lib_LTLIBRARIES = libv4lconvert.la
++if HAVE_LIBV4LCONVERT_HELPERS
+ libv4lconvertpriv_PROGRAMS = ov511-decomp ov518-decomp
++endif
+ include_HEADERS = ../include/libv4lconvert.h
+ pkgconfig_DATA = libv4lconvert.pc
+ LIBV4LCONVERT_VERSION = -version-info 0
+@@ -16,11 +18,14 @@ libv4lconvert_la_SOURCES = \
+   control/libv4lcontrol.c control/libv4lcontrol.h control/libv4lcontrol-priv.h \
+   processing/libv4lprocessing.c processing/whitebalance.c processing/autogain.c \
+   processing/gamma.c processing/libv4lprocessing.h processing/libv4lprocessing-priv.h \
+-  helper.c helper-funcs.h libv4lconvert-priv.h libv4lsyscall-priv.h \
++  helper-funcs.h libv4lconvert-priv.h libv4lsyscall-priv.h \
+   tinyjpeg.h tinyjpeg-internal.h
+ if HAVE_JPEG
+ libv4lconvert_la_SOURCES += jpeg_memsrcdest.c jpeg_memsrcdest.h
+ endif
++if HAVE_LIBV4LCONVERT_HELPERS
++libv4lconvert_la_SOURCES += helper.c
++endif
+ libv4lconvert_la_CPPFLAGS = $(CFLAG_VISIBILITY) $(ENFORCE_LIBV4L_STATIC)
+ libv4lconvert_la_LDFLAGS = $(LIBV4LCONVERT_VERSION) -lrt -lm $(JPEG_LIBS) $(ENFORCE_LIBV4L_STATIC)
+ 
+diff --git a/lib/libv4lconvert/libv4lconvert.c b/lib/libv4lconvert/libv4lconvert.c
+index da71891..145e581 100644
+--- a/lib/libv4lconvert/libv4lconvert.c
++++ b/lib/libv4lconvert/libv4lconvert.c
+@@ -115,8 +115,10 @@ static const struct v4lconvert_pixfmt supported_src_pixfmts[] = {
+ 	{ V4L2_PIX_FMT_JPEG,		 0,	 7,	 7,	0 },
+ 	{ V4L2_PIX_FMT_PJPG,		 0,	 7,	 7,	1 },
+ 	{ V4L2_PIX_FMT_JPGL,		 0,	 7,	 7,	1 },
++#ifdef HAVE_LIBV4LCONVERT_HELPERS
+ 	{ V4L2_PIX_FMT_OV511,		 0,	 7,	 7,	1 },
+ 	{ V4L2_PIX_FMT_OV518,		 0,	 7,	 7,	1 },
++#endif
+ 	/* uncompressed bayer */
+ 	{ V4L2_PIX_FMT_SBGGR8,		 8,	 8,	 8,	1 },
+ 	{ V4L2_PIX_FMT_SGBRG8,		 8,	 8,	 8,	1 },
+@@ -266,7 +268,9 @@ void v4lconvert_destroy(struct v4lconvert_data *data)
+ 	if (data->cinfo_initialized)
+ 		jpeg_destroy_decompress(&data->cinfo);
+ #endif // HAVE_JPEG
++#ifdef HAVE_LIBV4LCONVERT_HELPERS
+ 	v4lconvert_helper_cleanup(data);
++#endif
+ 	free(data->convert1_buf);
+ 	free(data->convert2_buf);
+ 	free(data->rotate90_buf);
+@@ -811,6 +815,7 @@ static int v4lconvert_convert_pixfmt(struct v4lconvert_data *data,
+ 				return -1;
+ 			}
+ 			break;
++#ifdef HAVE_LIBV4LCONVERT_HELPERS
+ 		case V4L2_PIX_FMT_OV511:
+ 			if (v4lconvert_helper_decompress(data, LIBV4LCONVERT_PRIV_DIR "/ov511-decomp",
+ 						src, src_size, d, d_size, width, height, yvu)) {
+@@ -827,6 +832,7 @@ static int v4lconvert_convert_pixfmt(struct v4lconvert_data *data,
+ 				return -1;
+ 			}
+ 			break;
++#endif
+ 		}
+ 
+ 		switch (dest_pix_fmt) {
+-- 
+1.9.1
+
-- 
1.9.1
