From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  6 Oct 2014 22:09:03 +0000 (UTC)
Subject: [Buildroot] [Bug 7520] New: CodeSourcery toolchain ARM: C++11
 std::exception_ptr is not available for Cortex-A9 if thumb2 is not
 selected.
Message-ID: <bug-7520-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7520

           Summary: CodeSourcery toolchain ARM: C++11 std::exception_ptr
                    is not available for Cortex-A9 if thumb2 is not
                    selected.
           Product: buildroot
           Version: 2014.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: romain.naour at openwide.fr
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hello,

I'm using a test program based on the C++11 code fragment from this blog:
http://martin-moene.blogspot.fr/2013/06/exceptionptr-for-c03.html

On ARM, this code really needs an ARMv7+ cpu in order to have
ATOMIC_INT_LOCK_FREE > 1
see: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58938

So, if the user select the CodeSourcery 2014.05 toolchain (which is based on
gcc 4.8.3) and the ARM Cortex-A9 optimization, It may expect that the
requirement to build the code C++11 is met.

But the build fail as follow at during the link:
undefined reference to `std::current_exception()'
/tmp/cclRKhyF.o: In function `main':
cpp11.cpp:(.text.startup+0x6c): undefined reference to
`std::current_exception()'
cpp11.cpp:(.text.startup+0x78): undefined reference to
`std::__exception_ptr::exception_ptr::exception_ptr(std::__exception_ptr::exception_ptr
const&)'
cpp11.cpp:(.text.startup+0x80): undefined reference to
`std::rethrow_exception(std::__exception_ptr::exception_ptr)'
cpp11.cpp:(.text.startup+0xa8): undefined reference to
`std::__exception_ptr::exception_ptr::~exception_ptr()'
cpp11.cpp:(.text.startup+0xb0): undefined reference to
`std::__exception_ptr::exception_ptr::~exception_ptr()'
cpp11.cpp:(.text.startup+0xc8): undefined reference to
`std::__exception_ptr::exception_ptr::~exception_ptr()'
cpp11.cpp:(.text.startup+0xfc): undefined reference to
`std::__exception_ptr::exception_ptr::~exception_ptr()'

Here is the Buildroot's configuration:
BR2_arm=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_ARCH="armv7-a"
BR2_GCC_TARGET_ABI="aapcs-linux"
BR2_GCC_TARGET_CPU="cortex-a9"
BR2_GCC_TARGET_FPU="vfpv3"
BR2_GCC_TARGET_FLOAT_ABI="softfp"
BR2_GCC_TARGET_MODE="arm"
BR2_ARCH_HAS_ATOMICS=y
BR2_ARM_CPU_HAS_NEON=y
BR2_ARM_CPU_MAYBE_HAS_NEON=y
BR2_ARM_CPU_MAYBE_HAS_VFPV2=y
BR2_ARM_CPU_MAYBE_HAS_VFPV3=y
BR2_ARM_CPU_HAS_THUMB2=y
BR2_cortex_a9=y
[...]
BR2_ARM_INSTRUCTIONS_ARM_CHOICE=y
# BR2_ARM_INSTRUCTIONS_THUMB2 is not set
BR2_ARM_INSTRUCTIONS_ARM=y
[...]
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201405=y
[...]

Looking at the getting-started document P21, the thumb support is mandatory in
order to really switch to ARMv7-A prebuild sysroot.
Without thumb support, the defaut ARMv5t sysroot is used even if armv7-a
architecture has been selected. In this case ATOMIC_INT_LOCK_FREE = 1, that why
the build fail...

The build is fixed by selecting the thumb2 instruction:
# BR2_ARM_INSTRUCTIONS_ARM_CHOICE is not set
BR2_ARM_INSTRUCTIONS_THUMB2=y

How to handle correctly the dependence on BR2_ARM_INSTRUCTIONS_THUMB2 with this
toolchain when a package needs some C++11 specific support ?

Best regards,
Romain Naour

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
