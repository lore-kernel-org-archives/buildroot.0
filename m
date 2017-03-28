From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Mar 2017 22:07:21 +0200
Subject: [Buildroot] [git commit] gdb: pass gdb_cv_prfpregset_t_broken=no
Message-ID: <20170328200739.B67E581E95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a76367d63941ec3f8c170d971161bfbfb9d31b34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting with glibc 2.25, the proc_service.h header has been copied
from gdb to glibc so other tools can use it. However, that makes it
necessary to make sure that declaration of prfpregset_t declaration
is consistent between gdb and glibc. In gdb, however, there is a
workaround for a broken prfpregset_t declaration in glibc 2.3 which
uses AC_TRY_RUN to detect if it's needed, which doesn't work in
cross-compilation. So pass the cache option to configure.
It needs to be passed to GDB_CONF_ENV to build gdbserver only but
also to GDB_MAKE_ENV, because otherwise it does not get passed to the
configure script of nested packages while building gdbserver with full
debugger.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 1cb1776..1218f11 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -87,7 +87,21 @@ GDB_CONF_ENV = \
 # not get passed to the configure script of nested packages while
 # building gdbserver with full debugger.
 GDB_CONF_ENV += gl_cv_func_gettimeofday_clobber=no
-GDB_MAKE_ENV = gl_cv_func_gettimeofday_clobber=no
+GDB_MAKE_ENV += gl_cv_func_gettimeofday_clobber=no
+
+# Starting with glibc 2.25, the proc_service.h header has been copied
+# from gdb to glibc so other tools can use it. However, that makes it
+# necessary to make sure that declaration of prfpregset_t declaration
+# is consistent between gdb and glibc. In gdb, however, there is a
+# workaround for a broken prfpregset_t declaration in glibc 2.3 which
+# uses AC_TRY_RUN to detect if it's needed, which doesn't work in
+# cross-compilation. So pass the cache option to configure.
+# It needs to be passed to GDB_CONF_ENV to build gdbserver only but
+# also to GDB_MAKE_ENV, because otherwise it does not get passed to the
+# configure script of nested packages while building gdbserver with full
+# debugger.
+GDB_CONF_ENV += gdb_cv_prfpregset_t_broken=no
+GDB_MAKE_ENV += gdb_cv_prfpregset_t_broken=no
 
 # The shared only build is not supported by gdb, so enable static build for
 # build-in libraries with --enable-static.
