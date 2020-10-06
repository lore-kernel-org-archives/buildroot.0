From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 23:32:49 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-buildroot: allow
 uclibc-ng for riscv
Message-ID: <20201006212213.004408E999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=209a082478fca143394512bb9a6c0822f12cfe2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uclibc-ng supports the RISC-V architecture since version 1.0.31, so
let's allow selecting this C library when RISC-V is used.

There was a previous attempt in commit
bd9810e176273914eca1208bcba23f0de9e446b3, which was reverted in
e7d631c0df1698b4edc94f148e7247869430e108, due to uClibc-ng not
implementing the __riscv_flush_icache() which is needed by
gcc. However this function has been implemented in upstream uClibc-ng
as of 1.0.35, so we can now safely re-enable uClibc-ng on RISC-V.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/Config.in                | 2 ++
 toolchain/toolchain-buildroot/Config.in | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index de2885bc92..918c5813f2 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -106,6 +106,8 @@ config BR2_UCLIBC_TARGET_ARCH
 	default "xtensa"   if BR2_xtensa
 	default "i386"	   if BR2_i386
 	default "x86_64"   if BR2_x86_64
+	default "riscv64"  if BR2_riscv && BR2_ARCH_IS_64
+	default "riscv32"  if BR2_riscv && !BR2_ARCH_IS_64
 
 config BR2_UCLIBC_MIPS_ABI
 	string
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 1c4705600e..f34dd84c29 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -31,8 +31,9 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 		   BR2_arm     || BR2_armeb    || \
 		   BR2_i386    || BR2_m68k   || BR2_microblaze || \
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
-		   BR2_or1k    || BR2_powerpc || BR2_sh2a   || BR2_sh4	   || \
-		   BR2_sh4eb   || BR2_sparc   || BR2_xtensa || BR2_x86_64
+		   BR2_or1k    || BR2_powerpc || BR2_riscv || BR2_sh2a   || \
+		   BR2_sh4     || BR2_sh4eb   || BR2_sparc || BR2_xtensa || \
+		   BR2_x86_64
 	select BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  This option selects uClibc-ng as the C library for the
