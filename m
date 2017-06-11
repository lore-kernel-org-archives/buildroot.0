From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 18:02:41 +0200
Subject: [Buildroot] [git commit] package/gdb: add support for gdb 8.0
Message-ID: <20170611161013.D998581827@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6be1600009954b9b4ed920b7fe6d8a5b11fa6f7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a dependency on gcc >= 4.8 since gdb needs a C++11 compiler.

Remove included patch since 7.12.1:
0001-Remove-const-in-xtensa-linux-nat.c-fetch_gregs.patch
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=d274ecf4ddf76768af57e27f654b9ce6784b391c

Rebase remaining patches:
0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
0003-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch

See https://sourceware.org/ml/gdb-announce/2017/msg00003.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 55 ++++++++++++++++++++++
 ...efine-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch | 43 +++++++++++++++++
 package/gdb/Config.in.host                         |  8 ++++
 package/gdb/gdb.hash                               |  1 +
 4 files changed, 107 insertions(+)

diff --git a/package/gdb/8.0/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/8.0/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
new file mode 100644
index 0000000..9e011c7
--- /dev/null
+++ b/package/gdb/8.0/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -0,0 +1,55 @@
+From 2acd9d3eb703b9a64ac92b3880ed546bec92af95 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Aug 2016 17:32:50 -0700
+Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Rebase on gdb 8.0]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/gdbserver/linux-ppc-low.c | 6 ++++++
+ gdb/nat/ppc-linux.h           | 6 ++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/gdb/gdbserver/linux-ppc-low.c b/gdb/gdbserver/linux-ppc-low.c
+index 33a9feb..1a9141f 100644
+--- a/gdb/gdbserver/linux-ppc-low.c
++++ b/gdb/gdbserver/linux-ppc-low.c
+@@ -21,7 +21,13 @@
+ #include "linux-low.h"
+ 
+ #include <elf.h>
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ 
+ #include "nat/ppc-linux.h"
+ #include "linux-ppc-tdesc.h"
+diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
+index 5837ea1..7233929 100644
+--- a/gdb/nat/ppc-linux.h
++++ b/gdb/nat/ppc-linux.h
+@@ -18,7 +18,13 @@
+ #ifndef PPC_LINUX_H
+ #define PPC_LINUX_H 1
+ 
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++#endif
+ #include <asm/cputable.h>
+ 
+ /* This sometimes isn't defined.  */
+-- 
+2.9.4
+
diff --git a/package/gdb/8.0/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/8.0/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
new file mode 100644
index 0000000..d31e5dd
--- /dev/null
+++ b/package/gdb/8.0/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
@@ -0,0 +1,43 @@
+From dfe4a40bc9d2fc1fd1b1a11ed733a0c0a1f59f3c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 3 Jun 2017 21:23:52 +0200
+Subject: [PATCH] sh/ptrace: Define pt_{dsp,}regs uapi_pt_{dsp,}regs on
+ !GLIBC systems
+
+Fixes a pt_{dsp,}regs redefinition when building with the musl C library
+on SuperH.
+
+Inspired by
+http://git.yoctoproject.org/clean/cgit.cgi/poky/plain/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch,
+adapted for SuperH.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Rebase	on gdb 8.0]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ gdb/gdbserver/linux-sh-low.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/gdb/gdbserver/linux-sh-low.c b/gdb/gdbserver/linux-sh-low.c
+index ac084c9..08e104a 100644
+--- a/gdb/gdbserver/linux-sh-low.c
++++ b/gdb/gdbserver/linux-sh-low.c
+@@ -27,7 +27,15 @@ extern const struct target_desc *tdesc_sh;
+ #include <sys/reg.h>
+ #endif
+ 
++#if !defined(__GLIBC__)
++# define pt_regs uapi_pt_regs
++# define pt_dspregs uapi_pt_dspregs
++#endif
+ #include <asm/ptrace.h>
++#if !defined(__GLIBC__)
++# undef pt_regs
++# undef pt_dspregs
++#endif
+ 
+ #define sh_num_regs 41
+ 
+-- 
+2.9.4
+
diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 464457e..6a3037d 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -50,6 +50,13 @@ config BR2_GDB_VERSION_7_11
 config BR2_GDB_VERSION_7_12
 	bool "gdb 7.12.x"
 
+config BR2_GDB_VERSION_8_0
+	bool "gdb 8.0.x"
+	# Needs a C++11 compiler
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_HOST_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 endchoice
 
 endif
@@ -62,4 +69,5 @@ config BR2_GDB_VERSION
 	default "7.10.1"   if BR2_GDB_VERSION_7_10
 	default "7.11.1"   if BR2_GDB_VERSION_7_11 || !BR2_PACKAGE_HOST_GDB
 	default "7.12.1"   if BR2_GDB_VERSION_7_12
+	default "8.0"      if BR2_GDB_VERSION_8_0
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index b0f8a6e..098d20a 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -2,6 +2,7 @@
 sha512	17a5138277a31685a5c2a841cb47ed9bc4626ea617b8ca77750513b300299f4fbbffe504958b5372de610dcb952c679cf8fa9c1bdadd380294fbf59b6e366010	gdb-7.10.1.tar.xz
 sha512  f80ec6c8a0f0b54c8b945666e875809174402b7e121efb378ebac931a91f9a1cc0048568f8e2f42ae8ae2392ff8d144c2e51d41c7398935017450aaf29838360	gdb-7.11.1.tar.xz
 sha512  0ac8d0a495103611ef41167a08313a010dce6ca4c6d827cbe8558a0c1a1a8a6bfa53f1b7704251289cababbfaaf9e075550cdf741a54d6cd9ca3433d910efcd8	gdb-7.12.1.tar.xz
+sha512  e4044bdd162cbf95044ec1eaa44d2fa62a33e051bdbbacbc97afd4dfb07bae1bea514381fc1966aede89d6796ef2377a15748a93d95e2ad494c8497db489e886	gdb-8.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  0a467091d4b01fbecabb4b8da1cb743025c70e7f4874a0b5c8fa2ec623569a39bde6762b91806de0be6e63711aeb6909715cfbe43860de73d8aec6159a9f10a7	gdb-6be65fb56ea6694a9260733a536a023a1e2d4d57.tar.gz
