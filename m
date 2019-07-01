From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 01 Jul 2019 17:17:56 +0000
Subject: [Buildroot] [Bug 11996] New: opencv3 SIGILL on Cortex-A5 with
 VFPv4-D16
Message-ID: <bug-11996-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11996

            Bug ID: 11996
           Summary: opencv3 SIGILL on Cortex-A5 with VFPv4-D16
           Product: buildroot
           Version: 2019.02.3
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jcowgill+busybox at jcowgill.uk
                CC: buildroot at uclibc.org
  Target Milestone: ---

I recently upgraded from 2018.02 to 2019.02 and discovered that opencv3 has
broken on my board (it worked with 2018.02). The board has a Cortex-A5 with
VFPv4-D16 enabled but without NEON and VFPv4 (so it only has 16 double floating
point registers).

These are the target options I have set:
BR2_arm=y
BR2_BINFMT_ELF=y
BR2_cortex_a5=y
BR2_ARM_ENABLE_NEON=n
BR2_ARM_ENABLE_VFP=y
BR2_ARM_EABIHF=y
BR2_ARM_FPU_VFPV4D16=y
BR2_ARM_INSTRUCTIONS_THUMB2=y

I can see that my application gets a SIGILL because it tries to load a value
into the d20 register which doesn't exist in VFPv4-D16.

0xb661d3d2 in cv::interpolateLanczos4 (coeffs=0xbef4602c, x=0.03125)
    at
/home/jcowgill/workspace/bsp/buildroot/output/build/opencv3-3.4.3/modules/imgproc/src/imgwarp.cpp:176
176    
/home/jcowgill/workspace/bsp/buildroot/output/build/opencv3-3.4.3/modules/imgproc/src/imgwarp.cpp:
No such file or directory.
(gdb) disassemble
...
   0xb661d3cc <+796>:   ldr     r3, [pc, #240]  ; (0xb661d4c0
<cv::initInterTab2D(int, bool)+1040>)
   0xb661d3ce <+798>:   vmov    s14, r8
=> 0xb661d3d2 <+802>:   vldr    d20, [r10]
   0xb661d3d6 <+806>:   vldr    d19, [r9]
   0xb661d3da <+810>:   add     r3, pc
   0xb661d3dc <+812>:   mov     r2, r7

========

I think this code in opencv3.mk is wrong (or maybe the ARM fpu config options
are wrong):

ifeq ($(BR2_ARCH_IS_64):$(BR2_ARM_CPU_HAS_VFPV3),:y)
OPENCV3_CONF_OPTS += -DENABLE_VFPV3=ON
else
OPENCV3_CONF_OPTS += -DENABLE_VFPV3=OFF
endif

Apparently I have BR2_ARM_CPU_HAS_VFPV3 set (even though I only have the -D16
version), but when you pass -DENABLE_VFPV3=ON to OpenCV, it passes -mfpu=vfpv3
to the compiler and this is what's causing the SIGILL.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
