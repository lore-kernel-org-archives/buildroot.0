From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 14:02:04 +0100
Subject: [Buildroot] [git commit] package/gdb: fix gnulib issue with musl
	and uClibc toolchains (finally)
Message-ID: <20170318130217.1F03281E44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2530fe810ee7ece8da30e246af522e2e0be8e83f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previous fix [1] reinroduced the issue fixed by [2].
So keep gl_cv_func_gettimeofday_clobber=no in GDB_CONF_ENV
and GDB_MAKE_ENV.

Fixes:
http://autobuild.buildroot.net/results/ec6/ec60d436bd34a4f37b664e4124d7f0c96e90a1be

[1] faf38b78aee613a732f96d5022a2894efd024a25
[2] 560334bb2a46a77081a3944d092df7732dfca432

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index ccfed4c..d829990 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -84,9 +84,11 @@ GDB_CONF_ENV = \
 # not when cross-compiling with uClibc or musl as C libraries. So use
 # gl_cv_func_gettimeofday_clobber=no to not use rpl_gettimeofday,
 # assuming musl and uClibc have a properly working gettimeofday
-# implementation. It needs to be passed to GDB_MAKE_ENV and not
-# GDB_CONF_ENV, because otherwise it does not get passed to the
-# configure script of nested packages.
+# implementation. It needs to be passed to GDB_CONF_ENV to build
+# gdbserver only but also to GDB_MAKE_ENV, because otherwise it does
+# not get passed to the configure script of nested packages while
+# building gdbserver with full debugger.
+GDB_CONF_ENV += gl_cv_func_gettimeofday_clobber=no
 GDB_MAKE_ENV = gl_cv_func_gettimeofday_clobber=no
 
 # The shared only build is not supported by gdb, so enable static build for
