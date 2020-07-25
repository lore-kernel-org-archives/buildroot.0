From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Jul 2020 08:24:51 +0200
Subject: [Buildroot] [git commit] package/gcc: bump to gcc 10.2
Message-ID: <20200725062158.4C4038100B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c9c02471a92161d3c324f37bb8843e4cb2178c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patch backported to gcc 10.2:
https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e86ae54172bb982e3c9d5aa62d20be5b72fe0f24

"GCC 10.2 is a bug-fix release from the GCC 10 branch
containing important fixes for regressions and serious bugs in
GCC 10.1 with more than 94 bugs fixed since the previous release."

https://gcc.gnu.org/pipermail/gcc-announce/2020/000164.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e.in-move-SELFTEST_DEPS-before-including-.patch | 79 ----------------------
 package/gcc/Config.in.host                         |  2 +-
 package/gcc/gcc.hash                               |  4 +-
 3 files changed, 3 insertions(+), 82 deletions(-)

diff --git a/package/gcc/10.1.0/0001-gcc-Makefile.in-move-SELFTEST_DEPS-before-including-.patch b/package/gcc/10.1.0/0001-gcc-Makefile.in-move-SELFTEST_DEPS-before-including-.patch
deleted file mode 100644
index 281bb53690..0000000000
--- a/package/gcc/10.1.0/0001-gcc-Makefile.in-move-SELFTEST_DEPS-before-including-.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From f05b73275515c4a1a70e28e06229bf682ac74385 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Thu, 21 May 2020 15:58:02 +0200
-Subject: [PATCH] gcc/Makefile.in: move SELFTEST_DEPS before including language
- makefile fragments
-
-As reported by several Buildroot users [1][2][3], the gcc build
-may fail while running selftests makefile target.
-
-The problem only occurs when ccache is used with gcc 9 and 10,
-probably due to a race condition.
-
-While debuging with "make -p" we can notice that s-selftest-c target
-contain only "cc1" as dependency instead of cc1 and SELFTEST_DEPS [4].
-
-  s-selftest-c: cc1
-
-While the build is failing, the s-selftest-c dependencies recipe is
-still running and reported as a bug by make.
-
-  "Dependencies recipe running (THIS IS A BUG)."
-
-A change [5] in gcc 9 seems to introduce the problem since we can't
-reproduce this problem with gcc 8.
-
-As suggested by Yann E. MORIN [6], move SELFTEST_DEPS before
-including language makefile fragments.
-
-With the fix applied, the s-seltest-c dependency contains
-SELFTEST_DEPS value.
-
-  s-selftest-c: cc1 xgcc specs stmp-int-hdrs ../../gcc/testsuite/selftests
-
-[1] http://lists.busybox.net/pipermail/buildroot/2020-May/282171.html
-[2] http://lists.busybox.net/pipermail/buildroot/2020-May/282766.html
-[3] https://github.com/cirosantilli/linux-kernel-module-cheat/issues/108
-[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/c/Make-lang.in;h=bfae6fd2549c4f728816cd355fa9739dcc08fcde;hb=033eb5671769a4c681a44aad08a454e667e08502#l120
-[5] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=033eb5671769a4c681a44aad08a454e667e08502
-[6] http://lists.busybox.net/pipermail/buildroot/2020-May/283213.html
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-Cc: Ben Dakin-Norris <ben.dakin-norris@navtechradar.com>
-Cc: Maxim Kochetkov <fido_max@inbox.ru>
-Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Cc: Yann E. MORIN <yann.morin.1998@free.fr>
-Cc: David Malcolm <dmalcolm@gcc.gnu.org>
----
-This patch should be backported to gcc 10 and gcc 9.
----
- gcc/Makefile.in | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 543b477ff18..c8611e35c70 100644
---- a/gcc/Makefile.in
-+++ b/gcc/Makefile.in
-@@ -1725,6 +1725,10 @@ $(FULL_DRIVER_NAME): ./xgcc
- 	rm -f $@
- 	$(LN_S) $< $@
- 
-+# SELFTEST_DEPS need to be set before including language makefile fragments.
-+# Otherwise $(SELFTEST_DEPS) is empty when used from various <LANG>/Make-lang.in.
-+SELFTEST_DEPS = $(GCC_PASSES) stmp-int-hdrs $(srcdir)/testsuite/selftests
-+
- #
- # Language makefile fragments.
- 
-@@ -2001,8 +2005,6 @@ DEVNULL=$(if $(findstring mingw,$(build)),nul,/dev/null)
- SELFTEST_FLAGS = -nostdinc $(DEVNULL) -S -o $(DEVNULL) \
- 	-fself-test=$(srcdir)/testsuite/selftests
- 
--SELFTEST_DEPS = $(GCC_PASSES) stmp-int-hdrs $(srcdir)/testsuite/selftests
--
- # Run the selftests during the build once we have a driver and the frontend,
- # so that self-test failures are caught as early as possible.
- # Use "s-selftest-FE" to ensure that we only run the selftests if the
--- 
-2.25.4
-
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 5bbb5b3ad4..dffd052665 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -85,7 +85,7 @@ config BR2_GCC_VERSION
 	default "7.5.0"     if BR2_GCC_VERSION_7_X
 	default "8.4.0"     if BR2_GCC_VERSION_8_X
 	default "9.3.0"     if BR2_GCC_VERSION_9_X
-	default "10.1.0"    if BR2_GCC_VERSION_10_X
+	default "10.2.0"    if BR2_GCC_VERSION_10_X
 	default "arc-2020.03-release" if BR2_GCC_VERSION_ARC
 	default "48152afb96c59733d5bc79e3399bb7b3d4b44266" if BR2_GCC_VERSION_CSKY
 
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 91bb86f0aa..5f38572beb 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -4,8 +4,8 @@ sha512  fe716cc19f2e3255d3a8b1b8290777bf769c6d98e6e0b07b81a3d6ad43f8af74cb170dfa
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
 #  From ftp://gcc.gnu.org/pub/gcc/releases/gcc-9.3.0/sha512.sum
 sha512  4b9e3639eef6e623747a22c37a904b4750c93b6da77cf3958d5047e9b5ebddb7eebe091cc16ca0a227c0ecbd2bf3b984b221130f269a97ee4cc18f9cf6c444de  gcc-9.3.0.tar.xz
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-10.1.0/sha512.sum
-sha512  0cb2a74c793face751f42bc580960b00e2bfea785872a0a2155f1f1dbfaa248f9591b67f4322db0f096f8844aca9243bc02732bda106c3b6e43b02bb67eb3096  gcc-10.1.0.tar.xz
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-10.2.0/sha512.sum
+sha512  42ae38928bd2e8183af445da34220964eb690b675b1892bbeb7cd5bb62be499011ec9a93397dba5e2fb681afadfc6f2767d03b9035b44ba9be807187ae6dc65e  gcc-10.2.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  09ad77fce757d77f2db49cd049b78861abfa5c1c6c3be76228815ec2b15810c1985525c48b0300e83e88f3fa33dee0062f34790cc8b6bc2fa6b0301595acf42b  gcc-arc-2020.03-release.tar.gz
