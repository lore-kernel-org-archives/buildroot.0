From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 18 Jul 2017 18:07:39 +0000
Subject: [Buildroot] [Bug 10091] gcc7.1 does not build with graphite support
 due to old isl
In-Reply-To: <bug-10091-163@https.bugs.busybox.net/>
References: <bug-10091-163@https.bugs.busybox.net/>
Message-ID: <bug-10091-163-2YedWbz1tB@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10091

--- Comment #11 from Peter Seiderer <ps.report@gmx.net> ---
$ ./host/usr/bin/arm-buildroot-linux-gnueabihf-g++ --version
arm-buildroot-linux-gnueabihf-g++.br_real (Buildroot
2017.08-git-01151-g8303ff38ef) 7.1.0

Include arm_acle.h and compile as C:

$ cat test_arm_acle_include.c 
#include <arm_acle.h>

int main(int argc, char* argv[]) {
        return 0;
}

$ ./host/usr/bin/arm-buildroot-linux-gnueabihf-gcc test_arm_acle_include.c

O.k, no failure


Include arm_acle.h and compile as C++:

$ cat test_arm_acle_include.cpp 
#include <arm_acle.h>

int main(int argc, char* argv[]) {
        return 0;
}

$ ./host/usr/bin/arm-buildroot-linux-gnueabihf-g++ test_arm_acle_include.cpp 
In file included from test_arm_acle_include.cpp:1:0:
/home/seiderer/Work/zeiss/freescale-imx6/build_rpi3_002/build-002-gcc-7-001/host/lib/gcc/arm-buildroot-linux-gnueabihf/7.1.0/include/arm_acle.h:
In function ?void __arm_ldc(unsigned int, unsigned int, const void*)?:
/home/seiderer/Work/zeiss/freescale-imx6/build_rpi3_002/build-002-gcc-7-001/host/lib/gcc/arm-buildroot-linux-gnueabihf/7.1.0/include/arm_acle.h:48:49:
error: invalid conversion from ?const void*? to ?const int*? [-fpermissive]
   return __builtin_arm_ldc (__coproc, __CRd, __p);
[...]

$ ./host/usr/bin/arm-buildroot-linux-gnueabihf-g++ -fpermissive
test_arm_acle_include.cpp

O.k., no failure...

Quick fix: add -fpermissive for the qt compile in case of gcc-7.x

Long term fix: ask the gcc people to fix arm_acle.h for C++ compile

-- 
You are receiving this mail because:
You are on the CC list for the bug.
