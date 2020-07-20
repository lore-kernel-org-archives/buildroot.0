From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 20 Jul 2020 18:47:22 +0200
Subject: [Buildroot] [PATCH 3/4] package/glibc: introduce version choice,
 add 2.31.x
In-Reply-To: <20200720164723.359198-1-romain.naour@gmail.com>
References: <20200720164723.359198-1-romain.naour@gmail.com>
Message-ID: <20200720164723.359198-3-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Glibc version choice was removed by b1ca91c59db6 (glibc: remove version
choice) but experience has proven that glibc can take some time after
its release to get stable or for softwares requiring changes to get an
upstream patch (or new release). This stabilization time can take more
than our 3 months development cycle, so let's re-introduce a version
choice for glibc package to avoid releasing Buildroot with unfixed
packages.

Unlike gcc, binutils and gdb, when a new version is introduced we use it
as the default as soon as we are reasonably confident that most build
issues have been sorted out. Also we only support two versions, the
latest release and the previous release.

Since we follow the upstream stable branch of glibc, we need to clarify
that this is not the version from the initial release archive. Make it
explicit from the menuconfig by using "2.30-x (stable branch)".

http://lists.busybox.net/pipermail/buildroot/2020-April/279015.html

For glibc 2.31.x:

  - update LICENSES file hash due to url change:
    "Prefer https to http for gnu.org and fsf.org URLs"

  - apply the patch suggested by Florian Weimer fixing a build issue for
    riscv64 with kernel headers < 5.0:
        0001-riscv64-flush-icache-fix-glibc-2.31-toolchain-with-k.patch

For host-localedef 2.31.x:

  - remove upstream patch for localedef:
        0003-localedef-Use-initializer-for-flexible-array-member-.patch

Note that this version bump required some patches applied on
several packages (already applied):
    [Busybox] 13f2d688a24f47446af236829bd6ca194d5aea5b
    [openssh] bad75bca315dbd2c69f8a9cb02fa9f27636e3d48

There are still some known issues, that will be addressed in a followup
patch:
    [gcc] disable libsanitizer with gcc 7.5

Since the reintroduction of the version choice of glibc, we don't switch
to this version by default yet.

See:
https://sourceware.org/legacy-ml/libc-announce/2020/msg00001.html

Tested by toolchain builder:
https://gitlab.com/kubu93/toolchains-builder/pipelines/129551000

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Yegor Yefremov <yegorslists@googlemail.com>
[yann.morin.1998 at free.fr:
  - meld the choice addtion with the version addition
  - hide the prompt for non-upstream forks
  - symlink localedef hash file so it's always in sync
  - tweak and massage the commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ache-fix-glibc-2.31-toolchain-with-k.patch | 51 +++++++++++++++
 .../glibc.hash                                |  7 ++
 package/glibc/Config.in                       | 18 ++++-
 ...ACK-only-build-and-install-localedef.patch | 65 +++++++++++++++++++
 ...y-on-GCC-to-4.8-and-binutils-to-2.24.patch | 64 ++++++++++++++++++
 .../localedef.hash                            |  1 +
 6 files changed, 205 insertions(+), 1 deletion(-)
 create mode 100644 package/glibc/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/0001-riscv64-flush-icache-fix-glibc-2.31-toolchain-with-k.patch
 create mode 100644 package/glibc/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/glibc.hash
 create mode 100644 package/localedef/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/0001-HACK-only-build-and-install-localedef.patch
 create mode 100644 package/localedef/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
 create mode 120000 package/localedef/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/localedef.hash

diff --git a/package/glibc/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/0001-riscv64-flush-icache-fix-glibc-2.31-toolchain-with-k.patch b/package/glibc/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/0001-riscv64-flush-icache-fix-glibc-2.31-toolchain-with-k.patch
new file mode 100644
index 0000000000..e33f955f87
--- /dev/null
+++ b/package/glibc/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/0001-riscv64-flush-icache-fix-glibc-2.31-toolchain-with-k.patch
@@ -0,0 +1,51 @@
+From 5142becd7662fea48c1313364dadc4c17e0e4fb6 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Wed, 25 Mar 2020 11:25:23 +0100
+Subject: [PATCH] riscv64/flush-icache: fix glibc 2.31 toolchain with kernel
+ headers < 5.0
+
+Without this patch, the risc64 port needs@least a kernel headers >= 5.0
+
+Otherwise glibc fail to build with:
+
+../sysdeps/unix/sysv/linux/riscv/rv64/arch-syscall.h:193:33: error: expected
+declaration specifiers or '...' before numeric constant
+  193 | #define __NR_riscv_flush_icache 259
+      |                                 ^~~
+In file included from ../sysdeps/unix/sysv/linux/riscv/flush-icache.c:25:
+/home/naourr/buildroot/test/toolchain/host/riscv64-buildroot-linux-gnu/sysroot/usr/include/asm/syscalls.h:29:36:
+error: unknown type name 'sys_riscv_flush_icache'
+   29 | __SYSCALL(__NR_riscv_flush_icache, sys_riscv_flush_icache)
+      |                                    ^~~~~~~~~~~~~~~~~~~~~~
+
+See: https://gitlab.com/kubu93/toolchains-builder/-/jobs/422726962
+
+The syscalls.h header wasn't originally written as a UAPI header, including
+<sys/syscall.h> should now be sufficient.
+
+https://sourceware.org/ml/libc-alpha/2020-02/msg00018.html
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ sysdeps/unix/sysv/linux/riscv/flush-icache.c | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/sysdeps/unix/sysv/linux/riscv/flush-icache.c b/sysdeps/unix/sysv/linux/riscv/flush-icache.c
+index 72caeb190f..ef33582bdf 100644
+--- a/sysdeps/unix/sysv/linux/riscv/flush-icache.c
++++ b/sysdeps/unix/sysv/linux/riscv/flush-icache.c
+@@ -21,11 +21,6 @@
+ #include <stdlib.h>
+ #include <atomic.h>
+ #include <sys/cachectl.h>
+-#if __has_include (<asm/syscalls.h>)
+-# include <asm/syscalls.h>
+-#else
+-# include <asm/unistd.h>
+-#endif
+ #include <sys/syscall.h>
+ 
+ typedef int (*func_type) (void *, void *, unsigned long int);
+-- 
+2.21.1
+
diff --git a/package/glibc/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/glibc.hash b/package/glibc/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/glibc.hash
new file mode 100644
index 0000000000..27f04a38b9
--- /dev/null
+++ b/package/glibc/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/glibc.hash
@@ -0,0 +1,7 @@
+# Locally calculated (fetched from Github)
+sha256  09b57f576cd98333bc8a001e1e412652bcc75464a81684b39e3f71f3b4ecda51  glibc-2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1.tar.gz
+
+# Hashes for license files
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
+sha256  b33d0bd9f685b46853548814893a6135e74430d12f6d94ab3eba42fc591f83bc  LICENSES
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 9901ad8537..c9c1493167 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -10,6 +10,21 @@ config BR2_PACKAGE_GLIBC
 	help
 	  https://www.gnu.org/software/libc/
 
+choice
+	prompt "glibc version"
+	# Following architectures are not using an upstream version:
+	depends on !BR2_arc
+	depends on !BR2_csky
+	depends on !BR2_RISCV_32
+
+config BR2_GLIBC_VERSION_2_30_X
+	bool "2.30-x (stable branch)"
+
+config BR2_GLIBC_VERSION_2_31_X
+	bool "2.31-x (stable branch)"
+
+endchoice
+
 config BR2_PACKAGE_GLIBC_UTILS
 	bool "Install glibc utilities"
 	help
@@ -25,7 +40,8 @@ endif # BR2_TOOLCHAIN_BUILDROOT_GLIBC
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 config BR2_GLIBC_VERSION_UPSTREAM
 	string
-	default "2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427"
+	default "2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427" if BR2_GLIBC_VERSION_2_30_X
+	default "2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1"
 
 config BR2_GLIBC_VERSION
 	string
diff --git a/package/localedef/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/0001-HACK-only-build-and-install-localedef.patch
new file mode 100644
index 0000000000..d327008c1d
--- /dev/null
+++ b/package/localedef/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/0001-HACK-only-build-and-install-localedef.patch
@@ -0,0 +1,65 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Michael Olbrich <m.olbrich@pengutronix.de>
+Date: Mon, 21 May 2018 16:45:02 +0200
+Subject: [PATCH] HACK: only build and install localedef
+
+Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
+
+Upstream: https://git.pengutronix.de/cgit/ptxdist/plain/patches/localedef-glibc-2.27/0001-HACK-only-build-and-install-localedef.patch?id=47116f66f411d4dadfce42c2fdd6d41b351ccfd4
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ Rules           | 14 ++++++++++----
+ locale/Makefile |  6 +++---
+ 2 files changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/Rules b/Rules
+index 16afa6acaa..6c208db788 100644
+--- a/Rules
++++ b/Rules
+@@ -190,10 +190,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
+ 				       $(binaries-all-notests))
+ 
+ ifneq "$(strip $(binaries-shared-notests))" ""
+-$(addprefix $(objpfx),$(binaries-shared-notests)): %: %.o \
+-  $(sort $(filter $(common-objpfx)lib%,$(link-libc))) \
+-  $(addprefix $(csu-objpfx),start.o) $(+preinit) $(+postinit)
+-	$(+link)
++$(addprefix $(objpfx),$(binaries-shared-notests)): %: %.o
++	$(CC) -o $@ \
++	      $(sysdep-LDFLAGS) $(LDFLAGS) $(LDFLAGS-$(@F)) \
++	      $(combreloc-LDFLAGS) $(relro-LDFLAGS) $(hashstyle-LDFLAGS) \
++	      $(filter-out $(addprefix $(csu-objpfx),start.o \
++						     $(start-installed-name))\
++			   $(+preinit) \
++			   $(link-extra-libs) \
++			   $(common-objpfx)libc% $(+postinit),$^) \
++	      $(link-extra-libs)
+ endif
+ 
+ ifneq "$(strip $(binaries-shared-tests))" ""
+diff --git a/locale/Makefile b/locale/Makefile
+index 764e751c36..c28322d71f 100644
+--- a/locale/Makefile
++++ b/locale/Makefile
+@@ -32,15 +32,15 @@ categories	= ctype messages monetary numeric time paper name \
+ 		  address telephone measurement identification collate
+ aux		= $(categories:%=lc-%) $(categories:%=C-%) SYS_libc C_name \
+ 		  xlocale localename global-locale coll-lookup
+-others		= localedef locale
++others		= localedef
+ #others-static	= localedef locale
+-install-bin	= localedef locale
++install-bin	= localedef
+ extra-objs	= $(localedef-modules:=.o) $(localedef-aux:=.o) \
+ 		  $(locale-modules:=.o) $(lib-modules:=.o)
+ generated 	+= C-translit.h
+ before-compile	+= $(objpfx)C-translit.h
+ 
+-extra-libs	= libBrokenLocale
++#extra-libs	= libBrokenLocale
+ extra-libs-others = $(extra-libs)
+ 
+ libBrokenLocale-routines = broken_cur_max
+-- 
+2.21.0
+
diff --git a/package/localedef/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
new file mode 100644
index 0000000000..a6e87cc317
--- /dev/null
+++ b/package/localedef/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
@@ -0,0 +1,64 @@
+From 313e04bfbd281f9b46fdde097aacb59d501820a3 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Thu, 6 Feb 2020 14:36:21 -0600
+Subject: [PATCH] relax dependency on GCC to 4.8 and binutils to 2.24
+
+The glibc package has been updating the toolchain version
+dependency since 2.28.x. The dependencies don't currently
+apply to the localedef build of the package, so this
+patchset relaxes the restriction such that builds can still
+occur on older host machines.
+
+Here's a related post from 2018 for a similar patchset.
+http://lists.busybox.net/pipermail/buildroot/2018-December/237949.html
+
+Timeline of relevant commits that adjust the dependency upstream.
+GCC 4.9+
+ https://sourceware.org/git/?p=glibc.git;a=commit;h=4add86749a31f302674599b69d2eea691d69341a
+Binutils 2.25+
+ https://sourceware.org/git/?p=glibc.git;a=commit;h=073e8fa7739ed453d6854b834f290c263a6cdb9f
+ https://sourceware.org/git/?p=glibc.git;a=commit;h=b4396163aa8666f970aaf43eaca25f3a92b18c1b
+GCC 5+
+ https://sourceware.org/git/?p=glibc.git;a=commit;h=192963be49678b48f60218f1f794991cdd9fe472
+GCC 6.2+
+ https://sourceware.org/git/?p=glibc.git;a=commit;h=4dcbbc3b28aaeafe23e1a30db84055aa6f6fa987
+
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ configure | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure b/configure
+index 6d26b824..9ac2e5e9 100755
+--- a/configure
++++ b/configure
+@@ -4601,7 +4601,7 @@ $as_echo_n "checking version of $AS... " >&6; }
+   ac_prog_version=`$AS --version 2>&1 | sed -n 's/^.*GNU assembler.* \([0-9]*\.[0-9.]*\).*$/\1/p'`
+   case $ac_prog_version in
+     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
+-    2.1[0-9][0-9]*|2.2[5-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
++    2.1[0-9][0-9]*|2.2[4-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
+        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
+     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
+ 
+@@ -4731,7 +4731,7 @@ $as_echo_n "checking version of $LD... " >&6; }
+   ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
+   case $ac_prog_version in
+     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
+-    2.1[0-9][0-9]*|2.2[5-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
++    2.1[0-9][0-9]*|2.2[4-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
+        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
+     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
+ 
+@@ -5140,7 +5140,7 @@ int
+ main ()
+ {
+ 
+-#if !defined __GNUC__ || __GNUC__ < 6 || (__GNUC__ == 6 && __GNUC_MINOR__ < 2)
++#if !defined __GNUC__ || __GNUC__ < 4 || (__GNUC__ == 4 && __GNUC_MINOR__ < 8)
+ #error insufficient compiler
+ #endif
+   ;
+-- 
+2.18.0
+
diff --git a/package/localedef/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/localedef.hash b/package/localedef/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/localedef.hash
new file mode 120000
index 0000000000..209dc30a19
--- /dev/null
+++ b/package/localedef/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/localedef.hash
@@ -0,0 +1 @@
+../../glibc/2.31-44-g3a44844c97a8ca1d0798c45b5252e6a49f9cf8e1/glibc.hash
\ No newline@end of file
-- 
2.25.4
