From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  6 Nov 2009 18:40:47 +0000 (UTC)
Subject: [Buildroot] [Bug 695] New: Build using reconfigured external
	toolchain fails
Message-ID: <bug-695-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=695

              Host: x86
            Target: arm926t
           Summary: Build using reconfigured external toolchain fails
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: maksim.rayskiy at conexant.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When building using external binary toolchain make verifies configuration and
supported options through a set of checks in
toolchain/external-toolchain/ext-tool.mk. The file uses
SYSROOT_DIR=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " "
"\n" | grep -- "--with-sysroot" | cut -f2 -d=)
to determine sysroot folder.

Normally, <cross>-gcc -v would report something like

Using built-in specs.
Target: arm-linux-uclibcgnueabi
Configured with: /home/developer/jackal/toolchain_build_arm/gcc-4.4.1/configure
--prefix=/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu
--target=arm-linux-uclibcgnueabi --enable-languages=c,c++
--with-sysroot=/home/developer/jackal/build_arm/staging_dir
--with-build-time-tools=/home/developer/jackal/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/bin
--disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --disable-libssp
--disable-tls --enable-shared
--with-gmp=/home/developer/jackal/toolchain_build_arm/gmp
--with-mpfr=/home/developer/jackal/toolchain_build_arm/mpfr --disable-nls
--enable-threads --disable-multilib --disable-decimal-float
--with-abi=aapcs-linux --with-arch=armv5te --with-tune=arm9tdmi 
Thread model: posix
gcc version 4.4.1 (GCC)

and macro properly extracts sysroot folder value. In my case, 
SYSROOT_DIR=/home/developer/jackal/build_arm/staging_dir

However, if the toolchain was reconfigured after initial build, gcc report is
different

Using built-in specs.
Target: arm-linux-uclibcgnueabi
Configured with: /home/developer/jackal/toolchain_build_arm/gcc-4.4.1/configure
--prefix=/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu
--target=arm-linux-uclibcgnueabi --enable-languages=c,c++
--with-sysroot=/home/developer/jackal/build_arm/staging_dir
--with-build-time-tools=/home/developer/jackal/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/bin
--disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --disable-libssp
--disable-tls --enable-shared
--with-gmp=/home/developer/jackal/toolchain_build_arm/gmp
--with-mpfr=/home/developer/jackal/toolchain_build_arm/mpfr --disable-nls
--enable-threads --disable-multilib --disable-decimal-float
--with-abi=aapcs-linux --with-arch=armv5te --with-tune=arm9tdmi :
(reconfigured) /home/developer/jackal/toolchain_build_arm/gcc-4.4.1/configure
--prefix=/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu
--target=arm-linux-uclibcgnueabi --enable-languages=c,c++
--with-sysroot=/home/developer/jackal/build_arm/staging_dir
--with-build-time-tools=/home/developer/jackal/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/bin
--disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --disable-libssp
--disable-tls --enable-shared
--with-gmp=/home/developer/jackal/toolchain_build_arm/gmp
--with-mpfr=/home/developer/jackal/toolchain_build_arm/mpfr --disable-nls
--enable-threads --disable-multilib --disable-decimal-float
--with-abi=aapcs-linux --with-arch=armv5te --with-tune=arm9tdmi
Thread model: posix
gcc version 4.4.1 (GCC)

In such case, 
SYSROOT_DIR=/home/developer/jackal/build_arm/staging_dir
/home/developer/jackal/build_arm/staging_dir
and make fails immediately after that.

I would suggest modifying SYSROOT_DIR definition to extract only the latest
sysroot option:

SYSROOT_DIR=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " "
"\n" | grep -- "--with-sysroot" | tail -n 1 | cut -f2 -d=)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
