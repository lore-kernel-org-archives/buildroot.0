From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 May 2013 22:03:52 +0200
Subject: [Buildroot] [git commit] cairo: fix build when toolchain has no
	thread support
Message-ID: <20130514201714.C97BC9A1E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5fa49a6c0f916d0b98cfdc8c09db25982f34f373
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the build failure visible at
http://autobuild.buildroot.net/results/d49/d491de5a774592929a59f3bfd0b1fd8cbc089ac0

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cairo/cairo.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
