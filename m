From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 30 Oct 2018 06:37:28 +0000
Subject: [Buildroot] [Bug 11451] New: Can't find libmpfr.so.4 when using
 external toolchain on ubuntu 18.04/18.10
Message-ID: <bug-11451-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11451

            Bug ID: 11451
           Summary: Can't find libmpfr.so.4 when using external toolchain
                    on ubuntu 18.04/18.10
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: lgnice at sina.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7836
  --> https://bugs.busybox.net/attachment.cgi?id=7836&action=edit
libzlib configure error

When I upgraded ubuntu from 16.04 to 18.04, output/build/libzlib-1.2.11 will
have a compilation error, because I used the toolchain provided by the bsp
vendor.

The reason is: ubuntu 18.04/18.10 removed
Libgmpv4-dev - Multiprecision arithmetic library developers tools (GCC 4.x
compatible)

Only reserved: libmpfr6 - multiple precision floating-point computation

However, I found that all toolchains provide libmpfr.so by themselves:

/opt/Vatics/vtcs_toolchain/arm-eabi-uclibc/usr/lib/libmpfr.so
/opt/ralink/arm-buildroot-gcc463-for-ibox/usr/lib/libmpfr.so
/opt/ralink/buildroot-gcc463/usr/lib/libmpfr.so
/opt/mtk_mipsel_gcc-4.6.3_uclibc-0.9.33/usr/lib/libmpfr.so
/opt/GrainMedia/gm813x/toolchain_gnueabi-4.4.0_ARMv5TE/usr/lib/libmpfr.so
/opt/mipsel-24kec-linux-uclibc-4.9-2017.07/usr/lib/libmpfr.so
/opt/960A/buildroot-gcc463/usr/lib/libmpfr.so

?Just set the environment variable LD_LIBRARY_PATH to solve it.

Export
LD_LIBRARY_PATH=/opt/mipsel-24kec-linux-uclibc-4.9-2017.07/usr/lib:$LD_LIBRARY_PATH


but, once LD_LIBRARY_PATH is set, an error will be reported in buildroot:

You seem to have the current working directory in your
LD_LIBRARY_PATH environment variable. This doesn't work.
Make: *** [support/dependencies/dependencies.mk:25: core-dependencies] Error 1


How to solve it?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
