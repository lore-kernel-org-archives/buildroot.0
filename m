From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  2 Feb 2009 20:00:56 +0000 (UTC)
Subject: [Buildroot] [Bug 83] New: liblockfile fails to compile due to
 eaccess redefinition
Message-ID: <bug-83-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=83

              Host: pc-linux
            Target: arm-linux-gnueabi (gcc 4.2.2)
             Build: 2009.02-rc3
           Summary: liblockfile fails to compile due to eaccess redefinition
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: hunter.cobbs at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When compiling buildroot liblockfile fails compiling dotlockfile.c due to
redefinition of eaccess in 4.2 gcc compilers.

-------------------  compiler snip -----------------
/opt/eldk/usr/bin/arm-linux-gcc -Os 
-I/home/hcobbs/dev/src/buildroot-2009.02-rc3/ucm_build_arm/staging_dir/include
-I/home/hcobbs/dev/src/buildroot-2009.02-rc3/ucm_build_arm/staging_dir/usr/include
-I/opt/eldk/usr/arm-linux/include --sysroot
/home/hcobbs/dev/src/buildroot-2009.02-rc3/ucm_build_arm/staging_dir/ -g -O2
-Wall -D_GNU_SOURCE -fPIC -D_REENTRANT -I.   -c -o dotlockfile.o dotlockfile.c
dotlockfile.c:45: error: conflicting types for 'eaccess'
/opt/eldk/usr/../arm/usr/include/unistd.h:268: error: previous declaration of
'eaccess' was here
make[1]: *** [dotlockfile.o] Error 1
make[1]: Leaving directory
`/home/hcobbs/dev/src/buildroot-2009.02-rc3/ucm_build_arm/liblockfile-1.06.1'
make: ***
[/home/hcobbs/dev/src/buildroot-2009.02-rc3/ucm_build_arm/staging_dir/lib/liblockfile.so.1.0]
Error 2

-----------------  end compiler snip  -----------------

==================== compiler version ==================
Reading specs from /opt/eldk/usr/bin/../lib/gcc/arm-linux-gnueabi/4.2.2/specs
Target: arm-linux-gnueabi
Configured with:
/opt/eldk/build/arm-2008-11-24/work/usr/src/denx/BUILD/crosstool-0.43/build/gcc-4.2.2-glibc-20070515T2025-eldk/arm-linux-gnueabi/gcc-4.2.2/configure
--target=arm-linux-gnueabi --host=i686-host_pc-linux-gnu
--prefix=/var/tmp/eldk.ywMqKk/usr/crosstool/gcc-4.2.2-glibc-20070515T2025-eldk/arm-linux-gnueabi
--disable-hosted-libstdcxx
--with-headers=/var/tmp/eldk.ywMqKk/usr/crosstool/gcc-4.2.2-glibc-20070515T2025-eldk/arm-linux-gnueabi/arm-linux-gnueabi/include
--with-local-prefix=/var/tmp/eldk.ywMqKk/usr/crosstool/gcc-4.2.2-glibc-20070515T2025-eldk/arm-linux-gnueabi/arm-linux-gnueabi
--disable-nls --enable-threads=posix --enable-symvers=gnu --enable-__cxa_atexit
--enable-languages=c,c++,java --enable-shared --enable-c99 --enable-long-long
--without-x
Thread model: posix
gcc version 4.2.2
================== end compiler version =================

Altering the liblockfile configure script the following way eliminates the
problem after a make clean:

-- orig --
if test "$GCC" = "yes"; then
    CFLAGS="$CFLAGS -Wall -D_GNU_SOURCE"
fi

-- patched --
if test "$GCC" = "yes"; then
    CFLAGS="$CFLAGS -Wall"
fi


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
