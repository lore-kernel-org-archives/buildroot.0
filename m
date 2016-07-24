From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 24 Jul 2016 16:49:13 +0200
Subject: [Buildroot] [PATCH v2] package/gdb: fix gnulib issue with musl and
	uClibc toolchains
Message-ID: <1469371753-18468-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Starting with gdb 7.11, the bundled gnulib want to use rpl_gettimeofday
(gettimeofday replacement) due bad guessing when cross-compiling with musl
and uClibc toolchains. Instead of patching gnulib configure script to fix
the test, use gl_cv_func_gettimeofday_clobber=no to not use rpl_gettimeofday.

Thanks to Thomas Petazzoni to suggest this patch.

Reported upstream:
https://sourceware.org/bugzilla/show_bug.cgi?id=19798

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
v2: Use gl_cv_func_gettimeofday_clobber=no instead of patching gnulib.
---
 package/gdb/gdb.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 1e23e5a..1386006 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -68,6 +68,10 @@ GDB_DISABLE_BINUTILS_CONF_OPTS = \
 	--disable-ld \
 	--disable-gas
 
+# Starting with gdb 7.11, the bundled gnulib want to use rpl_gettimeofday
+# (gettimeofday replacement) due bad guessing when cross-compiling with musl
+# and uClibc toolchains. So use gl_cv_func_gettimeofday_clobber=no to not
+# use rpl_gettimeofday.
 GDB_CONF_ENV = \
 	ac_cv_type_uintptr_t=yes \
 	gt_cv_func_gettext_libintl=yes \
@@ -77,7 +81,8 @@ GDB_CONF_ENV = \
 	bash_cv_must_reinstall_sighandlers=no \
 	bash_cv_func_sigsetjmp=present \
 	bash_cv_have_mbstate_t=yes \
-	gdb_cv_func_sigsetjmp=yes
+	gdb_cv_func_sigsetjmp=yes \
+	gl_cv_func_gettimeofday_clobber=no
 
 # The shared only build is not supported by gdb, so enable static build for
 # build-in libraries with --enable-static.
-- 
2.5.5
