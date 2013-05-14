From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 14 May 2013 13:57:11 +0200
Subject: [Buildroot] [PATCH 3/3] cairo: fix build when toolchain has no
	thread support
In-Reply-To: <1368532631-12983-1-git-send-email-s.martin49@gmail.com>
References: <1368532631-12983-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1368532631-12983-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the build failure visible at
http://autobuild.buildroot.net/results/d49/d491de5a774592929a59f3bfd0b1fd8cbc089ac0

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/cairo/cairo.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 83c82c0..203dbbe 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -36,6 +36,10 @@ CAIRO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		ac_cv_func_working_mktime=yes jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no gl_cv_c_restrict=no
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+	CAIRO_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DCAIRO_NO_MUTEX=1"
+endif
+
 CAIRO_CONF_OPT = \
 	--enable-trace=no \
 	--enable-interpreter=no
-- 
1.8.2.3
