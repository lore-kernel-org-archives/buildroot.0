From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon,  6 May 2013 12:14:57 +0200
Subject: [Buildroot] [PATCH 3/3] toolchain/gcc: Enable --with-float for
	powerpc
In-Reply-To: <1367835297-6560-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1367835297-6560-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1367835297-6560-4-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 8d929f4b ("toolchain/gcc: Only enable --with-float when it makes
sense") restricted the --with-float use to only MIPS, ARM and SPARC,
while it seems that powerpc needs it as well.

Fixes the qemu_ppc_virtex_ml507_defconfig build.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 toolchain/gcc/gcc-uclibc-4.x.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 128b7ab..959568f 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -66,7 +66,8 @@ endif
 # Determine soft-float options
 ifeq ($(BR2_SOFT_FLOAT),y)
 # only mips*-*-*, arm*-*-* and sparc*-*-* accept --with-float
-ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_sparc),y)
+# powerpc seems to be needing it as well
+ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_sparc),y)
 SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
 endif
 ifeq ($(BR2_arm)$(BR2_armeb),y) # only set float-abi for arm
-- 
1.8.1.2
