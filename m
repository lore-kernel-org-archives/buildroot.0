From: Peter Seiderer <ps.report@gmx.net>
Date: Mon,  2 Mar 2020 10:19:25 +0100
Subject: [Buildroot] [RFC v2 1/2] arch/Config.in.arm: add
 BR2_GCC_TARGET_ARCH entries
Message-ID: <20200302091926.19308-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add BR2_GCC_TARGET_ARCH entries, determined by (gcc-9.2.0)
	$ ./host/bin/arm-buildroot-linux-gnueabihf-gcc -Q -mcpu=$(BR2_GCC_TARGET_CPU) --help=target | grep march

Or (for cortex-m3/cortex-m4/cortex-m7):
	$ ./host/bin/arm-buildroot-linux-gnueabihf-gcc -Q -mcpu=$(BR2_GCC_TARGET_CPU) -mthumb --help=target | grep march

Or (where indicated):
	$ ./host/bin/arm-buildroot-linux-gnueabihf-gcc -Q -mcpu=$(BR2_GCC_TARGET_CPU) -msoft-float --help=target | grep march

The soft/hard float flags could be determined from
the arch/Config.in.arm processor definitions or the given
isa_bit_... flags from build/host-gcc-final-9.2.0/build/gcc/arm-cpu-cdata.h.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - Fix ToDo's for unknown cpus
  - Add BR2_GCC_TARGET_ARCH for other archs?

Changes v1 -> v2:
  - new patch
---
 arch/Config.in.arm | 72 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 4c0910e4f8..24f550287d 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -898,6 +898,78 @@ config BR2_GCC_TARGET_CPU
 	# armv8.4a
 	default "saphira"	if BR2_saphira
 
+config BR2_GCC_TARGET_ARCH
+	# armv4
+	default "armv4t"		if BR2_arm920t
+	default "armv4t"		if BR2_arm922t
+	default "armv4"			if BR2_fa526
+	default "armv4"			if BR2_strongarm
+	# armv5
+	default "armv5tej+fp"		if BR2_arm926t
+	default "iwmmxt"		if BR2_iwmmxt
+	default "armv5te"		if BR2_xscale # -msoft-float
+	# armv6
+	default "armv6j"		if BR2_arm1136j_s # -msoft-float
+	default "armv6j+fp"		if BR2_arm1136jf_s
+	default "armv6kz"		if BR2_arm1176jz_s # -msoft-float
+	default "armv6kz+fp"		if BR2_arm1176jzf_s
+	default "armv6k+fp"		if BR2_arm11mpcore && BR2_ARM_CPU_HAS_VFPV2
+	default "armv6k"		if BR2_arm11mpcore # -msoft-float
+	# armv7a
+	default "armv7-a+mp+sec+fp"	if BR2_cortex_a5
+	default "armv7ve+vfpv3-d16"	if BR2_cortex_a7
+	default "armv7-a+sec+fp"	if BR2_cortex_a8
+	default "armv7-a+mp+sec+fp"	if BR2_cortex_a9
+	default "armv7ve+vfpv3-d16"	if BR2_cortex_a12
+	default "armv7ve+vfpv3-d16"	if BR2_cortex_a15
+	default "armv7ve+vfpv3-d16"	if BR2_cortex_a15_a7
+	default "armv7ve+vfpv3-d16"	if BR2_cortex_a17
+	default "armv7ve+vfpv3-d16"	if BR2_cortex_a17_a7
+	default "armv7-a+mp+sec+fp"	if BR2_pj4
+	# armv7m
+	default "armv7-m"		if BR2_cortex_m3
+	default "armv7e-m+fp.dp"	if BR2_cortex_m4
+	default "armv7e-m+fp.dp"	if BR2_cortex_m7
+	# armv8a
+	default "armv8-a+crc+simd"	if BR2_cortex_a32
+	default "armv8-a+crc+simd"	if BR2_cortex_a35
+	default "armv8-a+crc+simd"	if BR2_cortex_a53
+	default "armv8-a+crc+simd"	if BR2_cortex_a57
+	default "armv8-a+crc+simd"	if BR2_cortex_a57_a53
+	default "armv8-a+crc+simd"	if BR2_cortex_a72
+	default "armv8-a+crc+simd"	if BR2_cortex_a72_a53
+	default "armv8-a+crc+simd"	if BR2_cortex_a73
+	default "armv8-a+crc+simd"	if BR2_cortex_a73_a35
+	default "armv8-a+crc+simd"	if BR2_cortex_a73_a53
+	default "armv8-a+crc+simd"	if BR2_emag # ToDo: error: unrecognized -mcpu target: emag
+	default "armv8-a+crc+simd"	if BR2_exynos_m1
+	default "armv8-a"		if BR2_falkor # ToDo: error: unrecognized -mcpu target: falkor
+	default "armv8-a"		if BR2_phecda # ToDo: error: unrecognized -mcpu target: phecda
+	default "armv8-a"		if BR2_qdf24xx # ToDo: error: unrecognized -mcpu target: qdf24xx
+	default "armv8-a"		if BR2_thunderx && !BR2_TOOLCHAIN_GCC_AT_LEAST_9 # ToDo: error: unrecognized -mcpu target: thunderx
+	default "armv8-a"		if BR2_thunderx && BR2_TOOLCHAIN_GCC_AT_LEAST_9 # ToDo: error: unrecognized -mcpu target: octeontx
+	default "armv8-a"		if BR2_thunderxt81 && !BR2_TOOLCHAIN_GCC_AT_LEAST_9 # ToDo: error: unrecognized -mcpu target: thunderxt81
+	default "armv8-a"		if BR2_thunderxt81 && BR2_TOOLCHAIN_GCC_AT_LEAST_9 # ToDo: error: unrecognized -mcpu target: octeontx81
+	default "armv8-a"		if BR2_thunderxt83 && !BR2_TOOLCHAIN_GCC_AT_LEAST_9 # ToDo: error: unrecognized -mcpu target: thunderxt83
+	default "armv8-a"		if BR2_thunderxt83 && BR2_TOOLCHAIN_GCC_AT_LEAST_9 # ToDo: error: unrecognized -mcpu target: octeontx83
+	default "armv8-a"		if BR2_thunderxt88 # ToDo: error: unrecognized -mcpu target: thunderxt88
+	default "armv8-a"		if BR2_thunderxt88p1 # ToDo: error: unrecognized -mcpu target: thunderxt88p1
+	default "armv8-a+simd"		if BR2_xgene1
+	# armv8.1a
+	default "armv8.1-a"		if BR2_thunderx2t99 # ToDo: error: unrecognized -mcpu target: thunderx2t99
+	default "armv8.1-a"		if BR2_thunderx2t99p1 # ToDo: error: unrecognized -mcpu target: thunderx2t99p1
+	default "armv8.1-a"		if BR2_vulcan # ToDo: error: unrecognized -mcpu target: vulcan
+	# armv8.2a
+	default "armv8.2-a+simd"	if BR2_cortex_a55
+	default "armv8.2-a+simd"	if BR2_cortex_a75
+	default "armv8.2-a+simd"	if BR2_cortex_a75_a55
+	default "armv8.2-a+simd"	if BR2_cortex_a76
+	default "armv8.2-a+simd"	if BR2_cortex_a76_a55
+	default "armv8.2-a+simd"	if BR2_neoverse_n1
+	default "armv8.2-a"		if BR2_tsv110 # ToDo: error: unrecognized -mcpu target: tsv110
+	# armv8.4a
+	default "armv8.4-a"		if BR2_saphira # ToDo: error: unrecognized -mcpu target: saphira
+
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
 	default "lp64"		if BR2_aarch64 || BR2_aarch64_be
-- 
2.25.1
