From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jul 2013 00:27:37 +0200
Subject: [Buildroot] [PATCHv2 14/25] arch: improve ARM floating point
	support and add support for EABIhf
In-Reply-To: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373754468-7527-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1373754468-7527-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit introduces the support for the EABIhf ABI, next to the
existing support we have for EABI and OABI (even though OABI support
is deprecated). EABIhf allows to improve performance of floating point
workload by using floating point registers to transfer floating point
arguments when calling functions, instead of using integer registers
to do, as is done in the 'softfp' floating point model of EABI.

In addition to this, this commit introduces a list of options for the
floating point support:
 * Software floating point
 * VFP
 * VFPv3
 * VFPv3-D16
 * VFPv4
 * VFPv4-D16

and it introduces some logic to make sure the options are only visible
when it makes sense, depending on the ARM core being selected. This is
however made complicated by the fact that certain VFP capabilities are
mandatory on some cores, but optional on some other cores. The kconfig
logic tries to achieve the following goals:

 * Hide options that are definitely not possible.

 * Use safe default values (i.e for Cortex-A5 and A7, the presence of
   the VFPv4 unit is optional, so we default on software floating
   point on these cores)..

 * Show the available possibilities, even if some of them are not
   necessarily working on a particular core (again, for the Cortex-A5
   and A7 cores, there is no way of knowing whether the particular
   variant used by the user has VFPv4 or not, so we select software
   floating point by default, but still show VFP/VFPv3/VFPv4 options).

It is worth noting that this commit doesn't add support for all
possible -mfpu= values on ARM. We haven't added support for fpa, fpe2,
fpe3, maverick (those four are only used on very old ARM cores), for
vfpv3-fp16, vfpv3-d16-fp16, vfpv3xd, vfpv3xd-fp16, neon-fp16,
vfpv4-sp-d16. They can be added quite easily if needed thanks to the
new organization of the Config.in options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm  | 219 ++++++++++++++++++++++++++++++++++++++++++++++++----
 package/Makefile.in |   6 ++
 2 files changed, 211 insertions(+), 14 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 29b2b45..2b493c0 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -6,6 +6,31 @@ config BR2_ARM_CPU_HAS_NEON
 config BR2_ARM_CPU_MAYBE_HAS_NEON
 	bool
 
+# for some cores, VFPv2 is optional
+config BR2_ARM_CPU_MAYBE_HAS_VFPV2
+	bool
+
+config BR2_ARM_CPU_HAS_VFPV2
+	bool
+
+# for some cores, VFPv3 is optional
+config BR2_ARM_CPU_MAYBE_HAS_VFPV3
+	bool
+	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
+
+config BR2_ARM_CPU_HAS_VFPV3
+	bool
+	select BR2_ARM_CPU_HAS_VFPV2
+
+# for some cores, VFPv4 is optional
+config BR2_ARM_CPU_MAYBE_HAS_VFPV4
+	bool
+	select BR2_ARM_CPU_MAYBE_HAS_VFPV3
+
+config BR2_ARM_CPU_HAS_VFPV4
+	bool
+	select BR2_ARM_CPU_HAS_VFPV3
+
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_arm || BR2_armeb
@@ -27,31 +52,40 @@ config BR2_arm10t
 	bool "arm10t"
 config BR2_arm1136jf_s_r0
 	bool "arm1136jf_s rev0"
+	select BR2_ARM_CPU_HAS_VFPV2
 config BR2_arm1136jf_s_r1
 	bool "arm1136jf_s rev1"
+	select BR2_ARM_CPU_HAS_VFPV2
 config BR2_arm1176jz_s
 	bool "arm1176jz-s"
 config BR2_arm1176jzf_s
 	bool "arm1176jzf-s"
+	select BR2_ARM_CPU_HAS_VFPV2
 config BR2_cortex_a5
 	bool "cortex-A5"
 	select BR2_ARM_CPU_MAYBE_HAS_NEON
+	select BR2_ARM_CPU_MAYBE_HAS_VFPV4
 config BR2_cortex_a7
 	bool "cortex-A7"
 	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARM_CPU_HAS_VFPV4
 config BR2_cortex_a8
 	bool "cortex-A8"
 	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARM_CPU_HAS_VFPV3
 config BR2_cortex_a9
 	bool "cortex-A9"
 	select BR2_ARM_CPU_MAYBE_HAS_NEON
+	select BR2_ARM_CPU_MAYBE_HAS_VFPV3
 config BR2_cortex_a15
 	bool "cortex-A15"
 	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARM_CPU_HAS_VFPV4
 config BR2_fa526
 	bool "fa526/626"
 config BR2_pj4
 	bool "pj4"
+	select BR2_ARM_CPU_HAS_VFPV3
 config BR2_strongarm
 	bool "strongarm sa110/sa1100"
 config BR2_xscale
@@ -67,27 +101,56 @@ config BR2_arm1136jf_s
 choice
 	prompt "Target ABI"
 	depends on BR2_arm || BR2_armeb
-	depends on BR2_DEPRECATED
 	default BR2_ARM_EABI
 	help
-	  Application Binary Interface to use
+	  Application Binary Interface to use. The Application Binary
+	  Interface describes the calling conventions (how arguments
+	  are passed to functions, how the return value is passed, how
+	  system calls are made, etc.).
 
-config BR2_ARM_EABI_CHOICE
+config BR2_ARM_EABI
 	bool "EABI"
-endchoice
+	help
+	  The EABI is currently the standard ARM ABI, which is used in
+	  most projects. It supports both the 'soft' floating point
+	  model (in which floating point instructions are emulated in
+	  software) and the 'softfp' floating point model (in which
+	  floating point instructions are executed using an hardware
+	  floating point unit, but floating point arguments to
+	  functions are passed in integer registers).
 
-config BR2_ARM_EABI
-	def_bool y
+	  The 'softfp' floating point model is link-compatible with
+	  the 'soft' floating point model, i.e you can link a library
+	  built 'soft' with some other code built 'softfp'.
 
-config BR2_ARM_SOFT_FLOAT
-	bool "Use soft-float"
-	default y
-	select BR2_SOFT_FLOAT
+	  However, passing the floating point arguments in integer
+	  registers is a bit inefficient, so if your ARM processor has
+	  a floating point unit, and you don't have pre-compiled
+	  'soft' or 'softfp' code, using the EABIhf ABI will provide
+	  better floating point performances.
+
+	  If your processor does not have a floating point unit, then
+	  you must use this ABI.
+
+config BR2_ARM_EABIHF
+	bool "EABIhf"
+	depends on BR2_ARM_CPU_MAYBE_HAS_VFPV2 || BR2_ARM_CPU_HAS_VFPV2
 	help
-	  If your target CPU does not have a Floating Point Unit (FPU)
-	  or a kernel FPU emulator, but you still wish to support
-	  floating point functions, then everything will need to be
-	  compiled with soft floating point support (-msoft-float).
+	  The EABIhf is an extension of EABI which supports the 'hard'
+	  floating point model. This model uses the floating point
+	  unit to execute floating point instructions, and passes
+	  floating point arguments in floating point registers.
+
+	  It is more efficient than EABI for floating point related
+	  workload. However, it does not allow to link against code
+	  that has been pre-built for the 'soft' or 'softfp' floating
+	  point models.
+
+	  If your processor has a floating point unit, and you don't
+	  depend on existing pre-compiled code, this option is most
+	  likely the best choice.
+
+endchoice
 
 config BR2_ARM_ENABLE_NEON
 	bool "Enable NEON SIMD extension support"
@@ -98,6 +161,120 @@ config BR2_ARM_ENABLE_NEON
 	  Select this option if you are certain your particular
 	  implementation has NEON support and you want to use it.
 
+choice
+	prompt "Floating point strategy"
+	depends on BR2_ARM_EABI || BR2_ARM_EABIHF
+	default BR2_ARM_FPU_VFPV4D16 if BR2_ARM_CPU_HAS_VFPV4
+	default BR2_ARM_FPU_VFPV3D16 if BR2_ARM_CPU_HAS_VFPV3
+	default BR2_ARM_FPU_VFPV2 if BR2_ARM_CPU_HAS_VFPV2
+	default BR2_ARM_SOFT_FLOAT if !BR2_ARM_CPU_HAS_VFPV2
+
+config BR2_ARM_SOFT_FLOAT
+	bool "Soft float"
+	depends on BR2_ARM_EABI
+	select BR2_SOFT_FLOAT
+	help
+	  This option allows to use software emulated floating
+	  point. It should be used for ARM cores that do not include a
+	  Vector Floating Point unit, such as ARMv5 cores (ARM926 for
+	  example) or certain ARMv6 cores.
+
+config BR2_ARM_FPU_VFPV2
+	bool "VFPv2"
+	depends on BR2_ARM_CPU_HAS_VFPV2 || BR2_ARM_CPU_MAYBE_HAS_VFPV2
+	help
+	  This option allows to use the VFPv2 floating point unit, as
+	  available in some ARMv6 processors (ARM1136JF-S,
+	  ARM1176JZF-S and ARM11 MPCore).
+
+	  Note that this option is also safe to use for newer cores
+	  such as Cortex-A, because the VFPv3 and VFPv4 units are
+	  backward compatible with VFPv2.
+
+config BR2_ARM_FPU_VFPV3
+	bool "VFPv3"
+	depends on BR2_ARM_CPU_HAS_VFPV3 || BR2_ARM_CPU_MAYBE_HAS_VFPV3
+	help
+	  This option allows to use the VFPv3 floating point unit, as
+	  available in some ARMv7 processors (Cortex-A{8, 9}). This
+	  option requires a VFPv3 unit that has 32 double-precision
+	  registers, which is not necessarily the case in all SOCs
+	  based on Cortex-A{8, 9}. If you're unsure, use VFPv3-D16
+	  instead, which is guaranteed to work on all Cortex-A{8, 9}.
+
+	  Note that this option is also safe to use for newer cores
+	  that have a VFPv4 unit, because VFPv4 is backward compatible
+	  with VFPv3. They must of course also have 32
+	  double-precision registers.
+
+config BR2_ARM_FPU_VFPV3D16
+	bool "VFPv3-D16"
+	depends on BR2_ARM_CPU_HAS_VFPV3 || BR2_ARM_CPU_MAYBE_HAS_VFPV3
+	help
+	  This option allows to use the VFPv3 floating point unit, as
+	  available in some ARMv7 processors (Cortex-A{8, 9}). This
+	  option requires a VFPv3 unit that has 16 double-precision
+	  registers, which is generally the case in all SOCs based on
+	  Cortex-A{8, 9}, even though VFPv3 is technically optional on
+	  Cortex-A9. This is the safest option for those cores.
+
+	  Note that this option is also safe to use for newer cores
+	  such that have a VFPv4 unit, because the VFPv4 is backward
+	  compatible with VFPv3.
+
+config BR2_ARM_FPU_VFPV4
+	bool "VFPv4"
+	depends on BR2_ARM_CPU_HAS_VFPV4 || BR2_ARM_CPU_MAYBE_HAS_VFPV4
+	help
+	  This option allows to use the VFPv4 floating point unit, as
+	  available in some ARMv7 processors (Cortex-A{5, 7, 12,
+	  15}). This option requires a VFPv4 unit that has 32
+	  double-precision registers, which is not necessarily the
+	  case in all SOCs based on Cortex-A{5, 7, 12, 15}. If you're
+	  unsure, you should probably use VFPv4-D16 instead.
+
+	  Note that if you want binary code that works on all ARMv7
+	  cores, including the earlier Cortex-A{8, 9}, you should
+	  instead select VFPv3.
+
+config BR2_ARM_FPU_VFPV4D16
+	bool "VFPv4-D16"
+	depends on BR2_ARM_CPU_HAS_VFPV4 || BR2_ARM_CPU_MAYBE_HAS_VFPV4
+	help
+	  This option allows to use the VFPv4 floating point unit, as
+	  available in some ARMv7 processors (Cortex-A{5, 7, 12,
+	  15}). This option requires a VFPv4 unit that has 16
+	  double-precision registers, which is always available on
+	  Cortex-A12 and Cortex-A15, but optional on Cortex-A5 and
+	  Cortex-A7.
+
+	  Note that if you want binary code that works on all ARMv7
+	  cores, including the earlier Cortex-A{8, 9}, you should
+	  instead select VFPv3-D16.
+
+config BR2_ARM_FPU_NEON
+	bool "NEON"
+	depends on BR2_ARM_CPU_HAS_NEON
+	help
+	  This option allows to use the NEON SIMD unit, as available
+	  in some ARMv7 processors, as a floating-point unit. It
+	  should however be noted that using NEON for floating point
+	  operations doesn't provide a complete compatibility with the
+	  IEEE 754.
+
+config BR2_ARM_FPU_NEON_VFPV4
+	bool "NEON/VFPv4"
+	depends on BR2_ARM_CPU_HAS_VFPV4 || BR2_ARM_CPU_MAYBE_HAS_VFPV4
+	depends on BR2_ARM_CPU_HAS_NEON
+	help
+	  This option allows to use both the VFPv4 and the NEON SIMD
+	  units for floating point operations. Note that some ARMv7
+	  cores do not necessarily have VFPv4 and/or NEON support, for
+	  example on Cortex-A5 and Cortex-A7, support for VFPv4 and
+	  NEON is optional.
+
+endchoice
+
 config BR2_ARCH
 	default "arm"	if BR2_arm
 	default "armeb"	if BR2_armeb
@@ -153,3 +330,17 @@ config BR2_GCC_TARGET_ARCH
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"
+
+config BR2_GCC_TARGET_FPU
+	default "vfp"		if BR2_ARM_FPU_VFPV2
+	default "vfpv3"		if BR2_ARM_FPU_VFPV3
+	default "vfpv3-d16" 	if BR2_ARM_FPU_VFPV3D16
+	default "vfpv4" 	if BR2_ARM_FPU_VFPV4
+	default "vfpv4-d16" 	if BR2_ARM_FPU_VFPV4D16
+	default "neon" 		if BR2_ARM_FPU_NEON
+	default "neon-vfpv4" 	if BR2_ARM_FPU_NEON_VFPV4
+
+config BR2_GCC_TARGET_FLOAT_ABI
+	default "soft"		if BR2_ARM_SOFT_FLOAT
+	default "softfp"	if !BR2_ARM_SOFT_FLOAT && BR2_ARM_EABI
+	default "hard"		if !BR2_ARM_SOFT_FLOAT && BR2_ARM_EABIHF
diff --git a/package/Makefile.in b/package/Makefile.in
index 06db122..a597290 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -39,6 +39,12 @@ ABI=gnueabi
 else
 ABI=eabi
 endif
+else ifeq ($(BR2_ARM_EABIHF),y)
+ifeq ($(LIBC),uclibc)
+ABI=gnueabihf
+else
+ABI=eabihf
+endif
 endif
 
 # For FSL PowerPC there's SPE
-- 
1.8.1.2
