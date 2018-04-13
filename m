From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 13 Apr 2018 14:57:40 +0300
Subject: [Buildroot] [PATCH 1/1] zeromq: patch configure.ac to check for
 ldaddr on when checking libunwind
Message-ID: <20180413115740.23425-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/2b1aaf7e35651f04a9e9d0269e49c1b0bd87ae29/

configure.ac can fail the build when there's no dynamic library support,
since it cannot find dladdr which is needed only when we have libunwind.
Therefore, configure.ac was patched to check for dladdr only in the libunwind
check section. As a consequence of the patch, libunwind was added as an optional
dependency, and ZEROMQ_AUTORECONF was set.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 DEVELOPERS                                    |  1 +
 ...-serach-for-dladdr-only-on-libunwind.patch | 44 +++++++++++++++++++
 package/zeromq/zeromq.mk                      | 10 +++++
 3 files changed, 55 insertions(+)
 create mode 100644 package/zeromq/0001-configure.ac-serach-for-dladdr-only-on-libunwind.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index 05693d3024..f269b79dd4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -191,6 +191,7 @@ F:	package/stress/
 N:	Asaf Kahlon <asafka7@gmail.com>
 F:	package/python-jsonmodels/
 F:	package/python-yieldfrom/
+F:	package/zeromq
 
 N:	Ash Charles <ash.charles@savoirfairelinux.com>
 F:	package/pru-software-support/
diff --git a/package/zeromq/0001-configure.ac-serach-for-dladdr-only-on-libunwind.patch b/package/zeromq/0001-configure.ac-serach-for-dladdr-only-on-libunwind.patch
new file mode 100644
index 0000000000..36092447ca
--- /dev/null
+++ b/package/zeromq/0001-configure.ac-serach-for-dladdr-only-on-libunwind.patch
@@ -0,0 +1,44 @@
+From 194b3836c87f77aca34581656ff99da49813d8c3 Mon Sep 17 00:00:00 2001
+From: Asaf Kahlon <asafka7@gmail.com>
+Date: Fri, 13 Apr 2018 11:56:46 +0300
+Subject: [PATCH 1/1] configure.ac: serach for dladdr only on libunwind
+
+The original configure.ac tries to check for dladdr, but it actually needs
+it only in case we have libunwind (which has a another section and checks for it
+too).
+This can fail the build on systems without dynamic linking support.
+Therefore, the dladdr check has to be preformed only when checking libunwind.
+
+Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
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
index debaf413b4..ac9cc4aa80 100644
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
@@ -49,4 +51,12 @@ else
 ZEROMQ_CONF_OPTS += --without-libsodium
 endif
 
+# ZeroMQ uses libunwind if it's available
+ifeq ($(BR2_PACKAGE_LIBUNWIND), y)
+ZEROMQ_DEPENDENCIES += libunwind
+ZEROMQ_CONF_OPTS += --enable-libunwind
+else
+ZEROMQ_CONF_OPTS += --disable-libunwind
+endif
+
 $(eval $(autotools-package))
-- 
2.17.0
