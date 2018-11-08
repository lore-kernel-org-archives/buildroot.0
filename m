From: Peter Seiderer <ps.report@gmx.net>
Date: Thu,  8 Nov 2018 22:49:32 +0100
Subject: [Buildroot] [PATCH v1] valgrind: disable for mips64r6/mips64elr6
Message-ID: <20181108214932.460-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  /tmp/ccBAUqbI.s: Assembler messages:
  /tmp/ccBAUqbI.s:622: Error: opcode not supported on this processor: mips64r6 (mips64r6) `movn $2,$4,$7'
  /tmp/ccBAUqbI.s:2607: Error: opcode not supported on this processor: mips64r6 (mips64r6) `movn $2,$4,$7'

[1] http://autobuild.buildroot.net/results/dc52088222e9fbedcebffc1c39be6d2fecfffe5d

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/valgrind/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index 56e4af21fa..8fe7080cd7 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -2,7 +2,10 @@ config BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64
 	default y if BR2_ARM_CPU_ARMV7A
-	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_mips || BR2_mipsel
+	# MIPS64 R6 is unsupported
+	default y if BR2_mips64 && !BR2_mips_64r6
+	default y if BR2_mips64el && !BR2_mips_64r6
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	depends on !BR2_MIPS_SOFT_FLOAT
-- 
2.19.1
