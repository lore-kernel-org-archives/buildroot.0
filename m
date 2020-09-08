From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue,  8 Sep 2020 16:53:46 +0200
Subject: [Buildroot] [PATCH] package/uclibc: reenable riscv64
Message-ID: <20200908145346.198693-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Missing __riscv_flush_icache() (reason for the revert) was implemented
in 1.0.35 in commit 8b1f6b2e0 "riscv64: add __riscv_flush_icache".

Revert "Revert "toolchain/toolchain-buildroot: enable uclibc for riscv64""
This reverts commit e7d631c0df1698b4edc94f148e7247869430e108.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
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
-- 
2.27.0.rc0
