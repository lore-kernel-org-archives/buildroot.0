From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Jul 2017 03:39:11 +0000
Subject: [Buildroot] [Bug 10061] New: gcc5.4 buildroot toolchain for powerpc
 libsanitizer failure
Message-ID: <bug-10061-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10061

            Bug ID: 10061
           Summary: gcc5.4 buildroot toolchain for powerpc libsanitizer
                    failure
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: matthew.weber at rockwellcollins.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

I'm building the following Buildroot Custom toolchain config and
noticing a libsanitizer failure. 


../../../../libsanitizer/asan/asan_linux.cc: In function ?bool
__asan::AsanInterceptsSignal(int)?:
../../../../libsanitizer/asan/asan_linux.cc:222:20: error: ?SIGSEGV?
was not declared in this scope
   return signum == SIGSEGV && common_flags()->handle_segv;
                    ^
make[6]: *** [asan_linux.lo] Error 1
make[5]: *** [all-recursive] Error 1
make[4]: *** [all] Error 2
make[3]: *** [all-target-libsanitizer] Error 2
make[2]: *** [all] Error 2
make[1]: *** [/accts/mlweber1/target/build/host-gcc-final-5.4.0/.stamp_built]
Error 2
make: *** [_all] Error 2

Config to reproduce:
BR2_powerpc=y
BR2_powerpc_e500mc=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_KERNEL_HEADERS_VERSION=y
BR2_DEFAULT_KERNEL_VERSION="3.12.37"
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
BR2_GCC_VERSION_5_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_GCC_ENABLE_LTO=y

The resolution looks to be 
https://www.mail-archive.com/gcc-patches at gcc.gnu.org/msg159613.html

I'll get a patch tested and I can confirm so far that the issue goes away in
GCC6 but GCC5.4 has the bug.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
