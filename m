From: John Keeping <john@metanate.com>
Date: Wed, 21 Feb 2018 15:39:02 +0000
Subject: [Buildroot] [PATCH] libglib2: don't override
 ac_cv_func_strerror_r_char_p
Message-ID: <20180221153902.27671-1-john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libglib2 recently changed to use the result of the autoconf macro to
decide how to use strerror_r() in g_strerror() instead of embedding the
same preprocessor condition as in glibc's strings.h (upstream commit
c8e268bb was first included in release 2.53.4).

Following this change, if ac_cv_func_strerror_r_char_p is incorrectly
set to "no", the error string is an uninitialized buffer which cannot be
encoded as UTF-8.  The final result of this is that GLib functions that
are expected to fill in an error pointer on failure in fact leave this
pointing to NULL which is likely to cause a segfault in client
applications.

In fact the autoconf check compiles a test file but does not need to run
it, so the test is safe when cross-compiling and returns the correct
answer.  So remove this cached value and let the configure script figure
it out for itself, fixing g_strerror() on glibc systems.

Signed-off-by: John Keeping <john@metanate.com>
---
 package/libglib2/libglib2.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index b13da333d8..097c980393 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -42,8 +42,6 @@ LIBGLIB2_CONF_ENV = \
 	jm_cv_func_nanosleep_works=yes \
 	gl_cv_func_working_utimes=yes \
 	ac_cv_func_utime_null=yes \
-	ac_cv_have_decl_strerror_r=yes \
-	ac_cv_func_strerror_r_char_p=no \
 	jm_cv_func_svid_putenv=yes \
 	ac_cv_func_getcwd_null=yes \
 	ac_cv_func_getdelim=yes \
-- 
2.16.2
