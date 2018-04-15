From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 20:39:10 +0200
Subject: [Buildroot] [git commit] zeromq: patch configure.ac to check for
 ldaddr on when checking libunwind
Message-ID: <20180415183928.B128C7FF0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=376fa2a9bc4f78e783b29f613432f45059ad31b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

configure.ac can fail the build when there's no dynamic library support,
since it cannot find dladdr which is needed only when we have libunwind.
Therefore, configure.ac was patched to check for dladdr only in the libunwind
check section. As a consequence of the patch, ZEROMQ_AUTORECONF was set.

The patch was applied to the zeromq master branch, see:
https://github.com/zeromq/libzmq/commit/c971445025535b9f989ab0b78f5ddd1c026f1878

Fixes:
http://autobuild.buildroot.net/results/2b1aaf7e35651f04a9e9d0269e49c1b0bd87ae29/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 ...re.ac-serach-for-dladdr-only-on-libunwind.patch | 45 ++++++++++++++++++++++
 package/zeromq/zeromq.mk                           |  2 +
 3 files changed, 48 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 05693d3024..aa70ba5264 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -191,6 +191,7 @@ F:	package/stress/
 N:	Asaf Kahlon <asafka7@gmail.com>
 F:	package/python-jsonmodels/
 F:	package/python-yieldfrom/
+F:	package/zeromq/
 
 N:	Ash Charles <ash.charles@savoirfairelinux.com>
 F:	package/pru-software-support/
diff --git a/package/zeromq/0001-configure.ac-serach-for-dladdr-only-on-libunwind.patch b/package/zeromq/0001-configure.ac-serach-for-dladdr-only-on-libunwind.patch
new file mode 100644
index 0000000000..1037a67fe2
--- /dev/null
+++ b/package/zeromq/0001-configure.ac-serach-for-dladdr-only-on-libunwind.patch
@@ -0,0 +1,45 @@
+From 194b3836c87f77aca34581656ff99da49813d8c3 Mon Sep 17 00:00:00 2001
+From: Asaf Kahlon <asafka7@gmail.com>
+Date: Fri, 13 Apr 2018 11:56:46 +0300
+Subject: [PATCH] configure.ac: search for dladdr only on libunwind
+
+The original configure.ac tries to check for dladdr, but it actually needs
+it only in case we have libunwind (which has a another section and checks for it
+too).
+This can fail the build on systems without dynamic linking support.
+Therefore, the dladdr check has to be performed only when checking libunwind.
+
+Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
+Upstream-status: https://github.com/zeromq/libzmq/commit/c971445025535b9f989ab0b78f5ddd1c026f1878
+---
+ configure.ac | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 216b2bc4..0858a6c1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -174,11 +174,6 @@ case "${host_os}" in
+         AC_DEFINE(ZMQ_HAVE_LINUX, 1, [Have Linux OS])
+         libzmq_on_linux="yes"
+ 
+-        # dladdr/dlopen is in libdl on glibc
+-        AC_SEARCH_LIBS([dladdr], [dl dld], [], [
+-          AC_MSG_ERROR([unable to find the dladdr() function])
+-        ])
+-
+         if test "x$libzmq_tipc_support" = "xyes"; then
+             AC_DEFINE(ZMQ_HAVE_TIPC, 1, [Have TIPC support])
+         fi
+@@ -783,7 +778,7 @@ if test "x$enable_libunwind" != "xno"; then
+             AC_DEFINE(HAVE_LIBUNWIND, 1, [The libunwind library is to be used])
+             AC_SUBST([LIBUNWIND_CFLAGS])
+             AC_SUBST([LIBUNWIND_LIBS])
+-            AC_CHECK_LIB([dl], [dladdr])
++            AC_SEARCH_LIBS([dladdr], [dl dld])
+         ],
+         [
+             if test "x$enable_libunwind" = "xyes"; then
+-- 
+2.17.0
+
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index debaf413b4..2682a567de 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -11,6 +11,8 @@ ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_CONF_OPTS = --without-documentation
 ZEROMQ_LICENSE = LGPL-3.0+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
+# 0001-configure.ac-serach-for-dladdr-only-on-libunwind.patch touches configure.ac
+ZEROMQ_AUTORECONF = YES
 
 # Assume these flags are always available. It is true, at least for
 # SOCK_CLOEXEC, since linux v2.6.27.
