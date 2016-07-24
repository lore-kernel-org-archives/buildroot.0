From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 21:52:29 +0200
Subject: [Buildroot] [git commit] package/gdb: fix gnulib issue with musl
	and uClibc toolchains
Message-ID: <20160724195239.732DA801E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=560334bb2a46a77081a3944d092df7732dfca432
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting with gdb 7.11, the bundled gnulib want to use rpl_gettimeofday
(gettimeofday replacement) due bad guessing when cross-compiling with musl
and uClibc toolchains. Instead of patching gnulib configure script to fix
the test, use gl_cv_func_gettimeofday_clobber=no to not use rpl_gettimeofday.

Thanks to Thomas Petazzoni to suggest this patch.

Reported upstream:
https://sourceware.org/bugzilla/show_bug.cgi?id=19798

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 1e23e5a..1c778e9 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -68,6 +68,13 @@ GDB_DISABLE_BINUTILS_CONF_OPTS = \
 	--disable-ld \
 	--disable-gas
 
+# Starting with gdb 7.11, the bundled gnulib tries to use
+# rpl_gettimeofday (gettimeofday replacement) due to the code being
+# unable to determine if the replacement function should be used or
+# not when cross-compiling with uClibc or musl as C libraries. So use
+# gl_cv_func_gettimeofday_clobber=no to not use rpl_gettimeofday,
+# assuming musl and uClibc have a properly working gettimeofday
+# implementation.
 GDB_CONF_ENV = \
 	ac_cv_type_uintptr_t=yes \
 	gt_cv_func_gettext_libintl=yes \
@@ -77,7 +84,8 @@ GDB_CONF_ENV = \
 	bash_cv_must_reinstall_sighandlers=no \
 	bash_cv_func_sigsetjmp=present \
 	bash_cv_have_mbstate_t=yes \
-	gdb_cv_func_sigsetjmp=yes
+	gdb_cv_func_sigsetjmp=yes \
+	gl_cv_func_gettimeofday_clobber=no
 
 # The shared only build is not supported by gdb, so enable static build for
 # build-in libraries with --enable-static.
