From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 18:00:17 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-buildroot: enable
 uclibc for riscv64
Message-ID: <20200727155526.BD38E82169@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd9810e176273914eca1208bcba23f0de9e446b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We can enable uclibc for RISC-V 64 bit now that it has been
bumped from v1.0.32 to v1.0.34.

Uclibc has had basic support for RISC-V 64 bit since v1.0.31, but
shared library and TLS/NPTL support has only been available since
v1.0.33.

This update has been tested using qemu_riscv64_virt_defconfig and
the Buildroot host QEMU.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/Config.in                |  1 +
 toolchain/toolchain-buildroot/Config.in | 13 +++++++------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index de2885bc92..f4d4f06462 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -101,6 +101,7 @@ config BR2_UCLIBC_TARGET_ARCH
 	default "mips"	   if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default "or1k"     if BR2_or1k
 	default "powerpc"  if BR2_powerpc
+	default "riscv64"  if BR2_RISCV_64
 	default "sh"	   if BR2_sh
 	default "sparc"	   if BR2_sparc
 	default "xtensa"   if BR2_xtensa
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 418d5cb387..068f91c875 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -27,12 +27,13 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc-ng"
-	depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle   || BR2_arceb  || \
-		   BR2_arm     || BR2_armeb    || \
-		   BR2_i386    || BR2_m68k   || BR2_microblaze || \
-		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		   BR2_or1k    || BR2_powerpc || BR2_sh2a   || BR2_sh4	   || \
-		   BR2_sh4eb   || BR2_sparc   || BR2_xtensa || BR2_x86_64
+	depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle      || BR2_arceb    || \
+		   BR2_arm     || BR2_armeb      || \
+		   BR2_i386    || BR2_m68k       || BR2_microblaze || \
+		   BR2_mips    || BR2_mipsel     || BR2_mips64     || BR2_mips64el || \
+		   BR2_or1k    || BR2_powerpc    || BR2_RISCV_64   || \
+		   BR2_sh2a    || BR2_sh4	 || BR2_sh4eb      || BR2_sparc    || \
+		   BR2_xtensa  || BR2_x86_64
 	select BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  This option selects uClibc-ng as the C library for the
