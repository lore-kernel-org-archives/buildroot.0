From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 May 2014 21:03:07 +0200
Subject: [Buildroot] [git commit] zeromq: disable test_fork when fork() is
	no available
Message-ID: <20140503190800.5B5529C9C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=957ecaad34cf649cf7f470a430a0910f5e740ca8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zeromp's configure script correctly detects the fork availability, but
unconditionally build test_fork program whatever the fork() availability.

This patch fixes the build-system by disabling test_fork when fork is
not available (e.g. when !BR2_USE_MMU).

Fixes:
  http://autobuild.buildroot.org/results/359/3599cc3b7bf2bb22a78961cd84d21cb03cbd7015/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[yann.morin.1998 at free.fr: remove Makefile.in hunks]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: tested against the failed bfin config, as well as
 a i686 target]
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...isable-test_fork-if-fork-is-not-available.patch |   52 ++++++++++++++++++++
 package/zeromq/zeromq.mk                           |    1 +
 2 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/package/zeromq/zeromq-0001-tests-disable-test_fork-if-fork-is-not-available.patch b/package/zeromq/zeromq-0001-tests-disable-test_fork-if-fork-is-not-available.patch
new file mode 100644
index 0000000..1eefdc3
--- /dev/null
+++ b/package/zeromq/zeromq-0001-tests-disable-test_fork-if-fork-is-not-available.patch
@@ -0,0 +1,52 @@
+From b50912f2eecec1ea7accc155f8132116f8702075 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 3 May 2014 12:22:38 +0200
+Subject: [PATCH] tests: disable test_fork if fork() is not available
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ configure.ac      | 1 +
+ tests/Makefile.am | 8 ++++++--
+ tests/Makefile.in | 8 ++++----
+ 3 files changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0c41604..8f8521c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -431,6 +431,7 @@ AM_CONDITIONAL(BUILD_PGM, test "x$libzmq_pgm_ext" = "xyes")
+ AM_CONDITIONAL(ON_MINGW, test "x$libzmq_on_mingw32" = "xyes")
+ AM_CONDITIONAL(ON_ANDROID, test "x$libzmq_on_android" = "xyes")
+ AM_CONDITIONAL(ON_LINUX, test "x$libzmq_on_linux" = "xyes")
++AM_CONDITIONAL(HAVE_FORK, test "x$ac_cv_func_fork" = "xyes")
+ 
+ # Checks for library functions.
+ AC_TYPE_SIGNAL
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 0cfe4e8..2a1e257 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -46,8 +46,10 @@ if !ON_MINGW
+ noinst_PROGRAMS += test_shutdown_stress \
+                    test_pair_ipc \
+                    test_reqrep_ipc \
+-                   test_timeo \
+-                   test_fork
++                   test_timeo
++if HAVE_FORK
++noinst_PROGRAMS += test_fork
++endif
+ endif
+ 
+ test_system_SOURCES = test_system.cpp
+@@ -93,8 +95,10 @@ test_shutdown_stress_SOURCES = test_shutdown_stress.cpp
+ test_pair_ipc_SOURCES = test_pair_ipc.cpp testutil.hpp
+ test_reqrep_ipc_SOURCES = test_reqrep_ipc.cpp testutil.hpp
+ test_timeo_SOURCES = test_timeo.cpp
++if HAVE_FORK
+ test_fork_SOURCES = test_fork.cpp
+ endif
++endif
+ 
+ #  Run the test cases
+ TESTS = $(noinst_PROGRAMS)
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 833c1d3..7802916 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -10,6 +10,7 @@ ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_LICENSE = LGPLv3+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
+ZEROMQ_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_ZEROMQ_PGM),y)
 	ZEROMQ_DEPENDENCIES += host-pkgconf openpgm
