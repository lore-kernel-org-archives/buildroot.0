From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 21:57:43 +0200
Subject: [Buildroot] [git commit] package/gcc: add support for gcc 10
Message-ID: <20200624195533.025FA801B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5502943b3b9929ababa54504759d2e12ee55366b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Keep the same patch as for gcc 9.x fixing a parallel build issue:
58ecbbc3ef18c43ae1c02a5c4bf30aa7ef2d8092.

Keep libzstd support disabled for now, it could be used in the future
for LTO bytecode compression.

https://gcc.gnu.org/gcc-10/changes.html
https://gcc.gnu.org/gcc-10/porting_to.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...e.in-move-SELFTEST_DEPS-before-including-.patch | 79 ++++++++++++++++++++++
 package/gcc/Config.in.host                         | 14 ++++
 package/gcc/gcc.hash                               |  2 +
 package/gcc/gcc.mk                                 |  3 +-
 4 files changed, 97 insertions(+), 1 deletion(-)

diff --git a/package/gcc/10.1.0/0001-gcc-Makefile.in-move-SELFTEST_DEPS-before-including-.patch b/package/gcc/10.1.0/0001-gcc-Makefile.in-move-SELFTEST_DEPS-before-including-.patch
new file mode 100644
index 0000000000..281bb53690
--- /dev/null
+++ b/package/gcc/10.1.0/0001-gcc-Makefile.in-move-SELFTEST_DEPS-before-including-.patch
@@ -0,0 +1,79 @@
+From f05b73275515c4a1a70e28e06229bf682ac74385 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Thu, 21 May 2020 15:58:02 +0200
+Subject: [PATCH] gcc/Makefile.in: move SELFTEST_DEPS before including language
+ makefile fragments
+
+As reported by several Buildroot users [1][2][3], the gcc build
+may fail while running selftests makefile target.
+
+The problem only occurs when ccache is used with gcc 9 and 10,
+probably due to a race condition.
+
+While debuging with "make -p" we can notice that s-selftest-c target
+contain only "cc1" as dependency instead of cc1 and SELFTEST_DEPS [4].
+
+  s-selftest-c: cc1
+
+While the build is failing, the s-selftest-c dependencies recipe is
+still running and reported as a bug by make.
+
+  "Dependencies recipe running (THIS IS A BUG)."
+
+A change [5] in gcc 9 seems to introduce the problem since we can't
+reproduce this problem with gcc 8.
+
+As suggested by Yann E. MORIN [6], move SELFTEST_DEPS before
+including language makefile fragments.
+
+With the fix applied, the s-seltest-c dependency contains
+SELFTEST_DEPS value.
+
+  s-selftest-c: cc1 xgcc specs stmp-int-hdrs ../../gcc/testsuite/selftests
+
+[1] http://lists.busybox.net/pipermail/buildroot/2020-May/282171.html
+[2] http://lists.busybox.net/pipermail/buildroot/2020-May/282766.html
+[3] https://github.com/cirosantilli/linux-kernel-module-cheat/issues/108
+[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/c/Make-lang.in;h=bfae6fd2549c4f728816cd355fa9739dcc08fcde;hb=033eb5671769a4c681a44aad08a454e667e08502#l120
+[5] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=033eb5671769a4c681a44aad08a454e667e08502
+[6] http://lists.busybox.net/pipermail/buildroot/2020-May/283213.html
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+Cc: Ben Dakin-Norris <ben.dakin-norris@navtechradar.com>
+Cc: Maxim Kochetkov <fido_max@inbox.ru>
+Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Cc: Yann E. MORIN <yann.morin.1998@free.fr>
+Cc: David Malcolm <dmalcolm@gcc.gnu.org>
+---
+This patch should be backported to gcc 10 and gcc 9.
+---
+ gcc/Makefile.in | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index 543b477ff18..c8611e35c70 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -1725,6 +1725,10 @@ $(FULL_DRIVER_NAME): ./xgcc
+ 	rm -f $@
+ 	$(LN_S) $< $@
+ 
++# SELFTEST_DEPS need to be set before including language makefile fragments.
++# Otherwise $(SELFTEST_DEPS) is empty when used from various <LANG>/Make-lang.in.
++SELFTEST_DEPS = $(GCC_PASSES) stmp-int-hdrs $(srcdir)/testsuite/selftests
++
+ #
+ # Language makefile fragments.
+ 
+@@ -2001,8 +2005,6 @@ DEVNULL=$(if $(findstring mingw,$(build)),nul,/dev/null)
+ SELFTEST_FLAGS = -nostdinc $(DEVNULL) -S -o $(DEVNULL) \
+ 	-fself-test=$(srcdir)/testsuite/selftests
+ 
+-SELFTEST_DEPS = $(GCC_PASSES) stmp-int-hdrs $(srcdir)/testsuite/selftests
+-
+ # Run the selftests during the build once we have a driver and the frontend,
+ # so that self-test failures are caught as early as possible.
+ # Use "s-selftest-FE" to ensure that we only run the selftests if the
+-- 
+2.25.4
+
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index a41408b72b..264428d06b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -50,6 +50,19 @@ config BR2_GCC_VERSION_9_X
 	depends on !BR2_csky
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
+config BR2_GCC_VERSION_10_X
+	bool "gcc 10.x"
+	# or1k needs binutils >= 2.32
+	depends on !(BR2_or1k && BR2_BINUTILS_VERSION_2_31_X)
+	# powerpc spe support has been deprecated since gcc 8.x.
+	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
+	depends on !BR2_powerpc_SPE
+	# C-SKY sk610 needs abiv1, which is not supported in
+	# upstream gcc. C-SKY gcc upstream support not tested
+	# with upstream binutils and glibc.
+	depends on !BR2_csky
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+
 endchoice
 
 # libcilkrts was introduced in gcc 4.9 and removed in gcc 8.x
@@ -75,6 +88,7 @@ config BR2_GCC_VERSION
 	default "7.5.0"     if BR2_GCC_VERSION_7_X
 	default "8.4.0"     if BR2_GCC_VERSION_8_X
 	default "9.3.0"     if BR2_GCC_VERSION_9_X
+	default "10.1.0"    if BR2_GCC_VERSION_10_X
 	default "arc-2020.03-release" if BR2_GCC_VERSION_ARC
 	default "48152afb96c59733d5bc79e3399bb7b3d4b44266" if BR2_GCC_VERSION_CSKY
 
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index ef1290fc7c..91bb86f0aa 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -4,6 +4,8 @@ sha512  fe716cc19f2e3255d3a8b1b8290777bf769c6d98e6e0b07b81a3d6ad43f8af74cb170dfa
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
 #  From ftp://gcc.gnu.org/pub/gcc/releases/gcc-9.3.0/sha512.sum
 sha512  4b9e3639eef6e623747a22c37a904b4750c93b6da77cf3958d5047e9b5ebddb7eebe091cc16ca0a227c0ecbd2bf3b984b221130f269a97ee4cc18f9cf6c444de  gcc-9.3.0.tar.xz
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-10.1.0/sha512.sum
+sha512  0cb2a74c793face751f42bc580960b00e2bfea785872a0a2155f1f1dbfaa248f9591b67f4322db0f096f8844aca9243bc02732bda106c3b6e43b02bb67eb3096  gcc-10.1.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  09ad77fce757d77f2db49cd049b78861abfa5c1c6c3be76228815ec2b15810c1985525c48b0300e83e88f3fa33dee0062f34790cc8b6bc2fa6b0301595acf42b  gcc-arc-2020.03-release.tar.gz
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index af25d268a7..d8260bc87b 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -82,7 +82,8 @@ HOST_GCC_COMMON_CONF_OPTS = \
 	--with-mpc=$(HOST_DIR) \
 	--with-mpfr=$(HOST_DIR) \
 	--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
-	--with-bugurl="http://bugs.buildroot.net/"
+	--with-bugurl="http://bugs.buildroot.net/" \
+	--without-zstd
 
 # Don't build documentation. It takes up extra space / build time,
 # and sometimes needs specific makeinfo versions to work
