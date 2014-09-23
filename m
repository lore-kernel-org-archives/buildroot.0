From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 20:13:26 +0200
Subject: [Buildroot] [git commit] package/gcc: cleanup arch/cpu combinations
Message-ID: <20140923181339.20D3C9D75A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f39ceddcf7d6729a940cbc6d10f3bd3a15972243
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cleanup arch/cpu combination limits, we had super-wide depends and it
doesn't help readability, version bumps or testing.

Make the bool/depends/select order the same for all entries.

Drop redundant limitations, for example sparc* if sparc wasn't
supported in general.

Power8 requires at least gcc 4.9.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host |   84 +++++++++++++++++++++++++++++++++++---------
 1 files changed, 67 insertions(+), 17 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 76223e9..75c589c 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -18,58 +18,108 @@ choice
 	  Select the version of gcc you wish to use.
 
 	config BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
-		depends on BR2_avr32
 		bool "gcc 4.2.2-avr32-2.1.5"
+		# Only supported architecture
+		depends on BR2_avr32
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4 && !BR2_powerpc64le
 		bool "gcc 4.4.x"
+		# Broken or unsupported architectures
+		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
+			&& !BR2_avr32 && !BR2_powerpc64le
+		# Broken or unsupported ARM cores
+		depends on !BR2_cortex_a5 && !BR2_cortex_a7 && \
+			!BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_fa526 && \
+			!BR2_pj4
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
-		# VFPv4 support appeared in gcc 4.5
+		# ARM VFPv4 support appeared in gcc 4.5
 		depends on !BR2_ARM_FPU_VFPV4 && !BR2_ARM_FPU_VFPV4D16
+		# Broken or unsupported PPC cores
+		depends on !BR2_powerpc_476 && !BR2_powerpc_476fp \
+			&& !BR2_power8
+		# Broken or unsupported x86 cores
+		depends on !BR2_x86_atom && !BR2_x86_corei7 && !BR2_x86_jaguar
 		# musl patches only for gcc 4.7+
 		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
 
 	config BR2_GCC_VERSION_4_5_X
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4 && !BR2_powerpc64le
-		select BR2_GCC_NEEDS_MPC
+		bool "gcc 4.5.x"
+		# Broken or unsupported architectures
+		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
+			&& !BR2_avr32  && !BR2_powerpc64le
+		# Broken or unsupported ARM cores
+		depends on !BR2_cortex_a7 && !BR2_cortex_a12 && \
+			!BR2_cortex_a15 && !BR2_fa526 && !BR2_pj4
+		# Broken or unsupported PPC cores
+		depends on !BR2_power8
+		# Broken or unsupported SPARC cores
+		depends on !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 \
+			&& !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		# Broken or unsupported X86 cores
+		depends on !BR2_x86_corei7 && !BR2_x86_jaguar
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
 		# musl patches only for gcc 4.7+
 		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
-		bool "gcc 4.5.x"
+		select BR2_GCC_NEEDS_MPC
 
 	config BR2_GCC_VERSION_4_7_X
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4 && !BR2_powerpc64le
-		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.7.x"
+		# Broken or unsupported architectures
+		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
+			&& !BR2_avr32 && !BR2_bfin && !BR2_powerpc64le
+		# Broken or unsupported ARM cores
+		depends on !BR2_cortex_a12 && !BR2_pj4
+		# Broken or unsupported PPC cores
+		depends on !BR2_power8
+		# Broken or unsupported SPARC cores
+		depends on !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 \
+			&& !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		# Broken or unsupported x86 cores
+		depends on !BR2_x86_jaguar
+		select BR2_GCC_NEEDS_MPC
 
 	config BR2_GCC_VERSION_4_8_X
-		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_powerpc64le
+		bool "gcc 4.8.x"
+		# Broken or unsupported architectures
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 \
+			&& !BR2_bfin && !BR2_powerpc64le
+		# Broken or unsupported ARM cores
+		depends on !BR2_cortex_a12
+		# Broken or unsupported PPC cores
+		depends on !BR2_power8
+		# Broken or unsupported SPARC cores
+		depends on !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 \
+			&& !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
-		bool "gcc 4.8.x"
 
 	config BR2_GCC_VERSION_4_8_ARC
+		bool "gcc 4.8-arc"
+		# Only supported architecture
 		depends on BR2_arc
 		select BR2_GCC_NEEDS_MPC
-		bool "gcc 4.8-arc"
 
 	config BR2_GCC_VERSION_4_9_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		bool "gcc 4.9.x"
+		# Broken or unsupported architectures
+		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin
+		# Broken or unsupported SPARC cores
+		depends on !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 \
+			&& !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
-		bool "gcc 4.9.x"
 
 	config BR2_GCC_VERSION_SNAP
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
-		select BR2_GCC_NEEDS_MPC
-		# musl patches only for gcc 4.7+
+		bool "gcc snapshot"
+		# Broken or unsupported architectures
+		depends on !BR2_arc && !BR2_avr32
+		# musl patches only for release gcc versions
 		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
+		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
-		bool "gcc snapshot"
 endchoice
 
 config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
