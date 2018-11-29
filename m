From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 29 Nov 2018 23:37:32 +0100
Subject: [Buildroot] [PATCH v1] valgrind: disable for mips32r6/mips32elr6
Message-ID: <20181129223732.25159-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  /tmp/ccD2Tule.s: Assembler messages:
  /tmp/ccD2Tule.s:682: Error: opcode not supported on this processor: mips32r6 (mips32r6) `movn $2,$4,$7'
  /tmp/ccD2Tule.s:2767: Error: opcode not supported on this processor: mips32r6 (mips32r6) `movn $2,$4,$7'

[1] http://autobuild.buildroot.net/results/f0253d1ed11021d3e5914a5161360de3ef3d1641

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/valgrind/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index 8fe7080cd7..c09be8629a 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -2,7 +2,9 @@ config BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64
 	default y if BR2_ARM_CPU_ARMV7A
-	default y if BR2_mips || BR2_mipsel
+	# MIPS32 R6 is unsupported
+	default y if BR2_mips && !BR2_mips_32r6
+	default y if BR2_mipsel && !BR2_mips_32r6
 	# MIPS64 R6 is unsupported
 	default y if BR2_mips64 && !BR2_mips_64r6
 	default y if BR2_mips64el && !BR2_mips_64r6
-- 
2.19.1
