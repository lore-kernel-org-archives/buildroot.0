From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 04 Dec 2020 09:32:26 +0000
Subject: [Buildroot] [Bug 13356] New: libabseil-cpp: not building for
 raspberry pi
Message-ID: <bug-13356-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13356

            Bug ID: 13356
           Summary: libabseil-cpp: not building for raspberry pi
           Product: buildroot
           Version: 2020.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: buildroot at heine.tech
                CC: buildroot at uclibc.org
  Target Milestone: ---

I just stumbled across this but currently don't have the time to investigate
further.

libabseil-cpp fails to compile for raspberry pi targets with the following
error:

In file included from
/build/build/build/libabseil-cpp-20200923.2/absl/random/internal/randen_hwaes.cc:229:
/build/build/host/opt/ext-toolchain/lib/gcc/arm-none-linux-gnueabihf/9.2.1/include/arm_neon.h:
In function 'Vector128 {anonymous}::AesRound(const Vector128&, const
Vector128&)':
/build/build/host/opt/ext-toolchain/lib/gcc/arm-none-linux-gnueabihf/9.2.1/include/arm_neon.h:16925:1:
error: inlining failed in call to always_inline 'uint8x16_t
vaesmcq_u8(uint8x16_t)': target specific option mismatch
16925 | vaesmcq_u8 (uint8x16_t __data)
      | ^~~~~~~~~~
/build/build/build/libabseil-cpp-20200923.2/absl/random/internal/randen_hwaes.cc:255:20:
note: called from here
  255 |   return vaesmcq_u8(vaeseq_u8(state, uint8x16_t{})) ^ round_key;
      |          ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from
/build/build/build/libabseil-cpp-20200923.2/absl/random/internal/randen_hwaes.cc:229:
/build/build/host/opt/ext-toolchain/lib/gcc/arm-none-linux-gnueabihf/9.2.1/include/arm_neon.h:16911:1:
error: inlining failed in call to always_inline 'uint8x16_t
vaeseq_u8(uint8x16_t, uint8x16_t)': target specific option mismatch
16911 | vaeseq_u8 (uint8x16_t __data, uint8x16_t __key)
      | ^~~~~~~~~
/build/build/build/libabseil-cpp-20200923.2/absl/random/internal/randen_hwaes.cc:255:20:
note: called from here
  255 |   return vaesmcq_u8(vaeseq_u8(state, uint8x16_t{})) ^ round_key;
      |          ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[4]: ***
[absl/random/CMakeFiles/random_internal_randen_hwaes_impl.dir/build.make:63:
absl/random/CMakeFiles/random_internal_randen_hwaes_impl.dir/internal/randen_hwaes.cc.o]
Error 1
make[3]: *** [CMakeFiles/Makefile2:2115:
absl/random/CMakeFiles/random_internal_randen_hwaes_impl.dir/all] Error 2
make[3]: *** Waiting for unfinished jobs....



It is already reported upstream at
https://github.com/abseil/abseil-cpp/issues/662 (on comment points out it is
also not compiling for arm/rpi3)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
