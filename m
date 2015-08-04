From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2015 11:19:25 +0200
Subject: [Buildroot] [git commit] zeromq: bump to version 4.1.2
Message-ID: <20150804092506.5C8F28164F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43d51e5b5084c8db70778b501dc81696c4028228
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the upstream git://github.com/zeromq/libzmq.git:

commit 6fdafc458a776e063511bb83dc7791aabea00b05 obviated the need for
0001-tests-disable-test_fork-if-fork-is-not-available.patch .

commit c8ee16940fff19ae3c12b4596c4bd131b2c71996 obviated the need for
0004-allow-without-libsodium.patch .

Fixed AUTORECONF comment in zeromq.mk to refer to the correct patch,
0001-acinclude.m4-make-kernel-specific-flags-cacheable.patch

Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ....m4-make-kernel-specific-flags-cacheable.patch} |    0
 ...isable-test_fork-if-fork-is-not-available.patch |   52 --------------------
 ...-Fix-pkg-config-files-for-static-linking.patch} |    0
 package/zeromq/0004-allow-without-libsodium.patch  |   38 --------------
 package/zeromq/zeromq.hash                         |    4 +-
 package/zeromq/zeromq.mk                           |    6 +--
 6 files changed, 5 insertions(+), 95 deletions(-)

diff --git a/package/zeromq/0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch b/package/zeromq/0001-acinclude.m4-make-kernel-specific-flags-cacheable.patch
similarity index 100%
rename from package/zeromq/0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch
rename to package/zeromq/0001-acinclude.m4-make-kernel-specific-flags-cacheable.patch
diff --git a/package/zeromq/0001-tests-disable-test_fork-if-fork-is-not-available.patch b/package/zeromq/0001-tests-disable-test_fork-if-fork-is-not-available.patch
deleted file mode 100644
index 1eefdc3..0000000
--- a/package/zeromq/0001-tests-disable-test_fork-if-fork-is-not-available.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From b50912f2eecec1ea7accc155f8132116f8702075 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sat, 3 May 2014 12:22:38 +0200
-Subject: [PATCH] tests: disable test_fork if fork() is not available
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- configure.ac      | 1 +
- tests/Makefile.am | 8 ++++++--
- tests/Makefile.in | 8 ++++----
- 3 files changed, 11 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0c41604..8f8521c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -431,6 +431,7 @@ AM_CONDITIONAL(BUILD_PGM, test "x$libzmq_pgm_ext" = "xyes")
- AM_CONDITIONAL(ON_MINGW, test "x$libzmq_on_mingw32" = "xyes")
- AM_CONDITIONAL(ON_ANDROID, test "x$libzmq_on_android" = "xyes")
- AM_CONDITIONAL(ON_LINUX, test "x$libzmq_on_linux" = "xyes")
-+AM_CONDITIONAL(HAVE_FORK, test "x$ac_cv_func_fork" = "xyes")
- 
- # Checks for library functions.
- AC_TYPE_SIGNAL
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 0cfe4e8..2a1e257 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -46,8 +46,10 @@ if !ON_MINGW
- noinst_PROGRAMS += test_shutdown_stress \
-                    test_pair_ipc \
-                    test_reqrep_ipc \
--                   test_timeo \
--                   test_fork
-+                   test_timeo
-+if HAVE_FORK
-+noinst_PROGRAMS += test_fork
-+endif
- endif
- 
- test_system_SOURCES = test_system.cpp
-@@ -93,8 +95,10 @@ test_shutdown_stress_SOURCES = test_shutdown_stress.cpp
- test_pair_ipc_SOURCES = test_pair_ipc.cpp testutil.hpp
- test_reqrep_ipc_SOURCES = test_reqrep_ipc.cpp testutil.hpp
- test_timeo_SOURCES = test_timeo.cpp
-+if HAVE_FORK
- test_fork_SOURCES = test_fork.cpp
- endif
-+endif
- 
- #  Run the test cases
- TESTS = $(noinst_PROGRAMS)
diff --git a/package/zeromq/0003-libzmq-Fix-pkg-config-files-for-static-linking.patch b/package/zeromq/0002-libzmq-Fix-pkg-config-files-for-static-linking.patch
similarity index 100%
rename from package/zeromq/0003-libzmq-Fix-pkg-config-files-for-static-linking.patch
rename to package/zeromq/0002-libzmq-Fix-pkg-config-files-for-static-linking.patch
diff --git a/package/zeromq/0004-allow-without-libsodium.patch b/package/zeromq/0004-allow-without-libsodium.patch
deleted file mode 100644
index 19850ba..0000000
--- a/package/zeromq/0004-allow-without-libsodium.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From c561766ab4ee4b3420b72e33fac4a75fb9194430 Mon Sep 17 00:00:00 2001
-From: Min RK <benjaminrk@gmail.com>
-Date: Mon, 16 Feb 2015 14:59:54 -0800
-Subject: [PATCH] allow `--without-libsodium`
-
-and `--with-libsodium=no` to disable linking against libsodium.
-
-Without this patch, it is not possible to disable linking with libsodium present on the default path.
-
-Backport from upstream commit
-faaf4550263395b84e6a80d3f9d7ba8816cdd714.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- configure.ac | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 194fcb2..3d5f6d6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -257,7 +257,12 @@ esac
- # Checks for libraries
- AC_CHECK_LIB([pthread], [pthread_create])
- AC_CHECK_LIB([rt], [clock_gettime])
--AC_CHECK_LIB([sodium], [sodium_init],,AC_MSG_WARN(libsodium is needed for CURVE security))
-+
-+if test "x$with_libsodium" != "xno"; then
-+    AC_CHECK_LIB([sodium], [sodium_init],,AC_MSG_WARN(libsodium is needed for CURVE security))
-+else
-+    AC_MSG_WARN(libsodium is needed for CURVE security)
-+fi
- 
- #
- # Check if the compiler supports -fvisibility=hidden flag. MinGW32 uses __declspec
--- 
-2.4.5
-
diff --git a/package/zeromq/zeromq.hash b/package/zeromq/zeromq.hash
index 729e7ea..6c7916e 100644
--- a/package/zeromq/zeromq.hash
+++ b/package/zeromq/zeromq.hash
@@ -1,2 +1,4 @@
 # Locally calculated from download (no sig, hash)
-sha256	3bc93c5f67370341428364ce007d448f4bb58a0eaabd0a60697d8086bc43342b	zeromq-4.0.5.tar.gz
+sha256	f9162ead6d68521e5154d871bac304f88857308bb02366b81bb588497a345927	zeromq-4.1.2.tar.gz
+# From http://download.zeromq.org/SHA1SUMS:
+sha1	86c17096f7f4bf46cbcd2ad242cf8fec8a7cfb7b	zeromq-4.1.2.tar.gz
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 029fab2..a58a6fe 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-ZEROMQ_VERSION = 4.0.5
+ZEROMQ_VERSION = 4.1.2
 ZEROMQ_SITE = http://download.zeromq.org
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_LICENSE = LGPLv3+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
-# For 0001-tests-disable-test_fork-if-fork-is-not-available.patch
-# and 0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch
-# and 0004-allow-without-libsodium.patch
+# For 0001-acinclude.m4-make-kernel-specific-flags-cacheable.patch
 ZEROMQ_AUTORECONF = YES
 
 # Assume these flags are always available. It is true, at least for
