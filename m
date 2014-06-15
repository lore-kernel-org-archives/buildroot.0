From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 15 Jun 2014 10:29:22 +0000 (UTC)
Subject: [Buildroot] [Bug 7208] New: Glibc C++ aplications crash if they use
	exceptions.
Message-ID: <bug-7208-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7208

           Summary: Glibc C++ aplications crash if they use exceptions.
           Product: buildroot
           Version: 2014.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: kwrzalik at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I'm using a toolchain with glibc and the following simple program crashes:

#include <cstdio>

int main() {
  try {
    throw 42;
  } catch (int x) {
    printf("catch %d\n", x);
  }
}

with the following backtrace:

#0  0xb7747a92 in ?? () from /lib/ld-linux.so.2
#1  0xb74ac6b8 in raise () from /lib/libc.so.6
#2  0xb74adbae in abort () from /lib/libc.so.6
#3  0xb763903a in ?? () from /lib/libgcc_s.so.1
#4  0xb763936b in _Unwind_RaiseException () from /lib/libgcc_s.so.1
#5  0xb76d0304 in __cxa_throw () from /usr/lib/libstdc++.so.6
#6  0x080486c1 in main ()

when run on the host with proper ld-linux.so and run paths the stack trace is
as follows:

#0  0xb7fdc424 in __kernel_vsyscall ()
#1  0xb7d4073f in raise () from
/opt/gnl/usr/i686-gnl-linux-gnu/sysroot/lib/libc.so.6
#2  0xb7d41c5e in abort () from
/opt/gnl/usr/i686-gnl-linux-gnu/sysroot/lib/libc.so.6
#3  0xb7ecf0d9 in uw_init_context_1 (context=context at entry=0xbfffe680,
outer_cfa=outer_cfa at entry=0xbfffe860, outer_ra=0xb7f66424
<__cxxabiv1::__cxa_throw(void*, std:
:type_info*, void (*)(void*))+97>) at ../../../libgcc/unwind-dw2.c:1567
#4  0xb7ecf40a in _Unwind_RaiseException (exc=0x804a048) at
../../../libgcc/unwind.inc:88
#5  0xb7f66424 in __cxxabiv1::__cxa_throw (obj=0x804a068, tinfo=0x8049e50
<_ZTIi@@CXXABI_1.3>, dest=0x0) at
../../../../libstdc++-v3/libsupc++/eh_throw.cc:82
#6  0x08048924 in main () at dupa.cpp:8


In the discussion with tom_kos and wbx on IRC we managed to pin the problem
libgcc_s.so. The problem only appears when linking with dynamic libgcc_s.so. If
the program is compiled with -static-libgcc it runs correctly.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
