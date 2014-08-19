From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Aug 2014 16:38:11 -0300
Subject: [Buildroot] [PATCH] package/gcc: cleanup arch/cpu combinations
Message-ID: <1408477091-28409-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cleanup arch/cpu combination limits, we had super-wide depends and it
doesn't help readability.
Make the bool/depends/select order the same for all entries.
And drop redundant limitations, for example sparc* if sparc wasn't
supported in general.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/Config.in.host | 66 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 15 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index b29bacb..dea0227 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -23,54 +23,90 @@ choice
 		bool "gcc 4.2.2-avr32-2.1.5"
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4 && !BR2_powerpc64le
 		bool "gcc 4.4.x"
+		# Unsupported architectures
+		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
+			&& !BR2_avr32 && !BR2_powerpc64le
+		# Unsupported ARM cores
+		depends on !BR2_cortex_a5 && !BR2_cortex_a7 && \
+			!BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_fa526 && \
+			!BR2_pj4
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
-		# VFPv4 support appeared in gcc 4.5
+		# ARM VFPv4 support appeared in gcc 4.5
 		depends on !BR2_ARM_FPU_VFPV4 && !BR2_ARM_FPU_VFPV4D16
+		# Unsupported PPC cores
+		depends on !BR2_powerpc_476 && !BR2_powerpc_476fp
+		# Unsupported x86 cores
+		depends on !BR2_x86_atom && !BR2_x86_corei7 && BR2_x86_jaguar
 		# musl patches only for gcc 4.7+
 		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
 
 	config BR2_GCC_VERSION_4_5_X
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4 && !BR2_powerpc64le
-		select BR2_GCC_NEEDS_MPC
+		bool "gcc 4.5.x"
+		# Unsupported architectures
+		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
+			&& !BR2_avr32  && !BR2_powerpc64le
+		# Unsupported ARM cores
+		depends on !BR2_cortex_a7 && !BR2_cortex_a12 && \
+			!BR2_cortex_a15 && !BR2_fa526 && !BR2_pj4
+		# Unsupported SPARC cores
+		depends on !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 \
+			&& !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		# Unsupported X86 cores
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
+		# Unsupported architectures
+		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
+			&& !BR2_avr32 && !BR2_bfin && !BR2_powerpc64le
+		# Unsupported ARM cores
+		depends on !BR2_cortex_a12 && !BR2_pj4
+		# Unsupported SPARC cores
+		depends on !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 \
+			&& !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		# Unsupported x86 cores
+		depends on !BR2_x86_jaguar
+		select BR2_GCC_NEEDS_MPC
 
 	config BR2_GCC_VERSION_4_8_X
-		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_powerpc64le && !BR2_sparc
+		bool "gcc 4.8.x"
+		# Unsupported architectures
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 \
+			&& !BR2_bfin && !!BR2_powerpc64le && !BR2_sparc
+		# Unsupported ARM cores
+		depends on !BR2_cortex_a12
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
-		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_sparc
+		bool "gcc 4.9.x"
+		# Unsupported architectures
+		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc
 		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
-		bool "gcc 4.9.x"
 
 	config BR2_GCC_VERSION_SNAP
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_sparc
-		select BR2_GCC_NEEDS_MPC
+		bool "gcc snapshot"
+		# Unsupported architectures
+		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc
 		# musl patches only for gcc 4.7+
 		depends on !BR2_TOOLCHAIN_BUILDROOT_MUSL
+		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
-		bool "gcc snapshot"
 endchoice
 
 config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
-- 
1.8.5.5
