From: Peter Kuemmel <syntheticpp@gmx.net>
Date: Thu, 13 Feb 2014 09:11:57 +0100
Subject: [Buildroot] Problem with starting TI Graphics
Message-ID: <trinity-96c3bbe4-4de2-4d94-a868-2ca9c13f130e-1392279117507@3capp-gmx-bs38>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 
I have problems with the package ti-gfx.

Setup uses a buildroot compiler with eabihf enabled.
All goes fine until TI's pvrsrvctl gets called:

#pvrsrvctl
/usr/bin/pvrsrvctl: line 1: syntax error: unexpected word (expecting ")")

# strace pvrsrvctl
execve("/usr/bin/pvrsrvctl", ["pvrsrvctl"], [/* 16 vars */]) = -1 ENOEXEC (Exec format error)
write(2, "strace: exec: Exec format error\n", 32strace: exec: Exec format error
) = 32
exit_group(1)                           = ?
+++ exited with 1 +++

But no problems with the modules
# lsmod
Module                  Size  Used by    Not tainted
bufferclass_ti          4734  0
omaplfb                10298  0
pvrsrvkm              157244  2 bufferclass_ti,omaplfb


First I thought it is ABI-problem so I configured the system until they match,
see below, but this didn't help.

Could it be a mis-match in the eglibc version?

# LD_TRACE_LOADED_OBJECTS=1 /usr/bin/pvrsrvctl
        libc.so.6 => /lib/libc.so.6 (0x401dc000)
        /lib/ld-linux-armhf.so.3 (0x40094000)

Many thanks for any hints!

Peter


$ readelf -A /share/rootfs/usr/lib/pvr_drv.so
Attribute Section: aeabi
File Attributes
  Tag_CPU_name: "7-A"
  Tag_CPU_arch: v7
  Tag_CPU_arch_profile: Application
  Tag_ARM_ISA_use: Yes
  Tag_THUMB_ISA_use: Thumb-2
  Tag_FP_arch: VFPv3
  Tag_Advanced_SIMD_arch: NEONv1
  Tag_ABI_PCS_wchar_t: 4
  Tag_ABI_FP_denormal: Needed
  Tag_ABI_FP_exceptions: Needed
  Tag_ABI_FP_number_model: IEEE 754
  Tag_ABI_align_needed: 8-byte
  Tag_ABI_align_preserved: 8-byte, except leaf SP
  Tag_ABI_enum_size: int
  Tag_ABI_HardFP_use: SP and DP
  Tag_ABI_VFP_args: VFP registers
  Tag_ABI_optimization_goals: Aggressive Speed
  Tag_CPU_unaligned_access: v6
  Tag_DIV_use: Not allowed

 $ readelf -A /share/rootfs/usr/bin/pvrsrvctl 
Attribute Section: aeabi
File Attributes
  Tag_CPU_name: "7-A"
  Tag_CPU_arch: v7
  Tag_CPU_arch_profile: Application
  Tag_ARM_ISA_use: Yes
  Tag_THUMB_ISA_use: Thumb-2
  Tag_FP_arch: VFPv3
  Tag_Advanced_SIMD_arch: NEONv1
  Tag_ABI_PCS_wchar_t: 4
  Tag_ABI_FP_denormal: Needed
  Tag_ABI_FP_exceptions: Needed
  Tag_ABI_FP_number_model: IEEE 754
  Tag_ABI_align_needed: 8-byte
  Tag_ABI_align_preserved: 8-byte, except leaf SP
  Tag_ABI_enum_size: int
  Tag_ABI_HardFP_use: SP and DP
  Tag_ABI_VFP_args: VFP registers
  Tag_CPU_unaligned_access: v6
  Tag_DIV_use: Not allowed

Attribute Section: aeabi
File Attributes
  Tag_CPU_name: "7-A"
  Tag_CPU_arch: v7
  Tag_CPU_arch_profile: Application
  Tag_ARM_ISA_use: Yes
  Tag_THUMB_ISA_use: Thumb-2
  Tag_FP_arch: VFPv3
  Tag_ABI_PCS_wchar_t: 4
  Tag_ABI_FP_rounding: Needed
  Tag_ABI_FP_denormal: Needed
  Tag_ABI_FP_exceptions: Needed
  Tag_ABI_FP_number_model: IEEE 754
  Tag_ABI_align_needed: 8-byte
  Tag_ABI_align_preserved: 8-byte, except leaf SP
  Tag_ABI_enum_size: int
  Tag_ABI_HardFP_use: SP and DP
  Tag_ABI_VFP_args: VFP registers
  Tag_CPU_unaligned_access: v6
  Tag_Virtualization_use: TrustZone
