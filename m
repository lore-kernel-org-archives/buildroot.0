From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 14:16:38 +0100
Subject: [Buildroot] [git commit] package/gdb: fix gnulib issue with musl
	and uClibc toolchains again
Message-ID: <20170312131710.5AE8E801B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=faf38b78aee613a732f96d5022a2894efd024a25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit [1] doesn't fix this issue for all cases (it doesn't work
when BR2_PACKAGE_GDB_DEBUGGER=y).
So, leave the configure script alone and override
gl_cv_func_gettimeofday_clobber from GDB_MAKE_ENV.

[1] 560334bb2a46a77081a3944d092df7732dfca432

Fixes:
http://autobuild.buildroot.net/results/719/719a441421030b79c0aa1bbfb707130f3ac87338

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 606f1f9..ccfed4c 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -67,13 +67,6 @@ GDB_DISABLE_BINUTILS_CONF_OPTS = \
 	--disable-ld \
 	--disable-gas
 
-# Starting with gdb 7.11, the bundled gnulib tries to use
-# rpl_gettimeofday (gettimeofday replacement) due to the code being
-# unable to determine if the replacement function should be used or
-# not when cross-compiling with uClibc or musl as C libraries. So use
-# gl_cv_func_gettimeofday_clobber=no to not use rpl_gettimeofday,
-# assuming musl and uClibc have a properly working gettimeofday
-# implementation.
 GDB_CONF_ENV = \
 	ac_cv_type_uintptr_t=yes \
 	gt_cv_func_gettext_libintl=yes \
@@ -83,8 +76,18 @@ GDB_CONF_ENV = \
 	bash_cv_must_reinstall_sighandlers=no \
 	bash_cv_func_sigsetjmp=present \
 	bash_cv_have_mbstate_t=yes \
-	gdb_cv_func_sigsetjmp=yes \
-	gl_cv_func_gettimeofday_clobber=no
+	gdb_cv_func_sigsetjmp=yes
+
+# Starting with gdb 7.11, the bundled gnulib tries to use
+# rpl_gettimeofday (gettimeofday replacement) due to the code being
+# unable to determine if the replacement function should be used or
+# not when cross-compiling with uClibc or musl as C libraries. So use
+# gl_cv_func_gettimeofday_clobber=no to not use rpl_gettimeofday,
+# assuming musl and uClibc have a properly working gettimeofday
+# implementation. It needs to be passed to GDB_MAKE_ENV and not
+# GDB_CONF_ENV, because otherwise it does not get passed to the
+# configure script of nested packages.
+GDB_MAKE_ENV = gl_cv_func_gettimeofday_clobber=no
 
 # The shared only build is not supported by gdb, so enable static build for
 # build-in libraries with --enable-static.
