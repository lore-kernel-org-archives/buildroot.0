From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jun 2021 23:16:02 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/gdb: fix
 gdbserver build with m68k and uclibc
Message-ID: <20210609204844.8148485AB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=388970eb3c6461362cc5ef29a2ce334395f84288
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Allow to build gdbserver with m68k and uclibc. This patch is not needed
for version above 9.2 because build_gdbserver as been
moved to its own file since
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=919adfe8409211c726c1d05b47ca59890ee648f1

This new file (gdbserver/configure.srv) does not seem to be affected by
this issue

Fixes:
 - http://autobuild.buildroot.org/results/f4d6d9d8418c0da48a3db4ad5a82e19bd16eae34

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8d7ac28707a30d883de0a60cd67ea246653da472)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...re.tgt-build-gdbserver-with-m68k-and-ucli.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/gdb/9.2/0007-gdb-configure.tgt-build-gdbserver-with-m68k-and-ucli.patch b/package/gdb/9.2/0007-gdb-configure.tgt-build-gdbserver-with-m68k-and-ucli.patch
new file mode 100644
index 0000000000..5cdafae7a8
--- /dev/null
+++ b/package/gdb/9.2/0007-gdb-configure.tgt-build-gdbserver-with-m68k-and-ucli.patch
@@ -0,0 +1,41 @@
+From 808601f075fe3dd8ca101e31c9121a4e87f0bfc7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 6 May 2021 07:45:00 +0200
+Subject: [PATCH] gdb/configure.tgt: build gdbserver with m68k and
+ uclibc
+
+Allow to build gdbserver with m68k and uclibc:
+
+checking whether gdbserver is supported on this host... no
+configure: error: Automatic gdbserver build is not supported for this configuration
+
+Fixes:
+ - http://autobuild.buildroot.org/results/f4d6d9d8418c0da48a3db4ad5a82e19bd16eae34
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gdb/configure.tgt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gdb/configure.tgt b/gdb/configure.tgt
+index caa42be1c01..8666bc5d0bf 100644
+--- a/gdb/configure.tgt
++++ b/gdb/configure.tgt
+@@ -372,12 +372,12 @@ m68hc11*-*-*|m6811*-*-*)
+ 	gdb_sim=../sim/m68hc11/libsim.a
+ 	;;
+ 
+-m68*-*-aout* | m68*-*-coff* | m68*-*-elf* | m68*-*-rtems* | m68*-*-uclinux* | \
++m68*-*-aout* | m68*-*-coff* | m68*-*-elf* | m68*-*-rtems* | \
+ fido-*-elf*)
+ 	# Target: Motorola m68k embedded
+ 	gdb_target_obs="m68k-tdep.o"
+ 	;;
+-m68*-*-linux*)
++m68*-*-*linux*)
+ 	# Target: Motorola m68k with a.out and ELF
+ 	gdb_target_obs="m68k-tdep.o m68k-linux-tdep.o solib-svr4.o \
+ 			linux-tdep.o glibc-tdep.o symfile-mem.o"
+-- 
+2.30.2
+
