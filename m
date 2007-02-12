From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:56 -0800
Subject: [Buildroot] [buildroot 0000981]: Make fails at uClibc for sh3eb
	target
Message-ID: <08295382c9f1489dca7f19eced3a930b@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=981 
====================================================================== 
Reported By:                glindsey
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   981
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   block
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-03-2006 08:16 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    Make fails at uClibc for sh3eb target
Description: 
Procedure was as follows:

* Installed buildroot from SVN sources, revision 15766 (2006 Aug 03).
* Ran "make menuconfig".
* Set Target Architecture to "sh" and Variant to "sh3eb".
* Saved and exited menuconfig making no further changes.
* Ran "make".

After downloading Linux kernel headers and uClibc snapshot, make fails and
terminates with:

if [ -f "target/generic/skel.tar.gz" ] ; then \ BR2_HOST_GDB
  zcat target/generic/skel.tar.gz | tar -C /usr/src/buildroot/build_sh3eb
-xf -; \
fi;
if [ -d "target/generic/target_skeleton" ] ; then \
  cp -fa target/generic/target_skeleton/*
/usr/src/buildroot/build_sh3eb/root/; \
fi;
touch /usr/src/buildroot/build_sh3eb/staging_dir/.fakeroot.00000
find /usr/src/buildroot/build_sh3eb/root -type d -name CVS | xargs rm -rf
find /usr/src/buildroot/build_sh3eb/root -type d -name .svn | xargs rm
-rf

Checking build system dependencies:
sed works:                          Ok
GNU make version '3.79.1,':         Ok
gcc version '3.2.3':                Ok
which installed:                    Ok
bison installed:                    Ok
flex installed:                     Ok
gettext installed:                  Ok
Build system dependencies:          Ok

mkdir -p /usr/src/buildroot/dl
wget --passive-ftp -P /usr/src/buildroot/dl
http://www.uclibc.org/downloads/toolchain/linux-libc-headers-2.4.31.tar.bz2
--09:09:01-- 
http://www.uclibc.org/downloads/toolchain/linux-libc-headers-2.4.31.tar.bz2
           => `/usr/src/buildroot/dl/linux-libc-headers-2.4.31.tar.bz2'
Resolving www.uclibc.org... 140.211.166.42
Connecting to www.uclibc.org|140.211.166.42|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 4,194,659 (4.0M) [application/x-tar]

100%[========================================================>] 4,194,659 
  153.73K/s    ETA 00:00

09:09:30 (141.25 KB/s) -
`/usr/src/buildroot/dl/linux-libc-headers-2.4.31.tar.bz2' saved
[4194659/4194659]

rm -rf /usr/src/buildroot/toolchain_build_sh3eb/linux
mkdir -p /usr/src/buildroot/toolchain_build_sh3eb
bzcat /usr/src/buildroot/dl/linux-libc-headers-2.4.31.tar.bz2 | tar -C
/usr/src/buildroot/toolchain_build_sh3eb   -xf -
mv /usr/src/buildroot/toolchain_build_sh3eb/linux-libc-headers-2.4.31
/usr/src/buildroot/toolchain_build_sh3eb/linux
touch /usr/src/buildroot/toolchain_build_sh3eb/linux/.unpacked
toolchain/patch-kernel.sh /usr/src/buildroot/toolchain_build_sh3eb/linux
toolchain/kernel-headers linux-libc-headers-2.4.31\*.patch
touch /usr/src/buildroot/toolchain_build_sh3eb/linux/.patched
rm -f /usr/src/buildroot/toolchain_build_sh3eb/linux/include/asm
touch
/usr/src/buildroot/toolchain_build_sh3eb/linux/include/linux/autoconf.h;
touch /usr/src/buildroot/toolchain_build_sh3eb/linux/.configured
mkdir -p /usr/src/buildroot/dl
wget --passive-ftp -P /usr/src/buildroot/dl
http://www.uclibc.org/downloads/snapshots/uClibc-snapshot.tar.bz2
--09:09:32-- 
http://www.uclibc.org/downloads/snapshots/uClibc-snapshot.tar.bz2
           => `/usr/src/buildroot/dl/uClibc-snapshot.tar.bz2'
Resolving www.uclibc.org... 140.211.166.42
Connecting to www.uclibc.org|140.211.166.42|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 3,707,343 (3.5M) [application/x-tar]

100%[========================================================>] 3,707,343 
  153.31K/s    ETA 00:00

09:09:56 (153.43 KB/s) - `/usr/src/buildroot/dl/uClibc-snapshot.tar.bz2'
saved [3707343/3707343]

mkdir -p /usr/src/buildroot/toolchain_build_sh3eb
bzcat /usr/src/buildroot/dl/uClibc-snapshot.tar.bz2 | tar -C
/usr/src/buildroot/toolchain_build_sh3eb   -xf -
toolchain/patch-kernel.sh /usr/src/buildroot/toolchain_build_sh3eb/uClibc
toolchain/uClibc/ \*.patch
touch /usr/src/buildroot/toolchain_build_sh3eb/uClibc/.unpacked
cp toolchain/uClibc/uClibc.config
/usr/src/buildroot/toolchain_build_sh3eb/uClibc/.config
/usr/src/buildroot/toolchain_build_sh3eb/bin/sed -i -e
's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="/usr/src/buildroot/build_sh3eb/staging_dir/bin/sh3eb-linux-uclibc-",g'
\
  -e 's,# TARGET_sh is not set,TARGET_sh=y,g' \
  -e 's,^TARGET_ARCH="none",TARGET_ARCH=\"sh\",g' \
  -e
's,^KERNEL_SOURCE=.*,KERNEL_SOURCE=\"/usr/src/buildroot/toolchain_build_sh3eb/linux\",g'
\
  -e 's,^RUNTIME_PREFIX=.*,RUNTIME_PREFIX=\"/\",g' \
  -e 's,^DEVEL_PREFIX=.*,DEVEL_PREFIX=\"/usr/\",g' \
  -e 's,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX=\"/lib\",g'
\
  /usr/src/buildroot/toolchain_build_sh3eb/uClibc/.config
/usr/src/buildroot/toolchain_build_sh3eb/bin/sed -i -e
's,^.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=y,g'
/usr/src/buildroot/toolchain_build_sh3eb/uClibc/.config
/usr/src/buildroot/toolchain_build_sh3eb/bin/sed -i -e
's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g'
/usr/src/buildroot/toolchain_build_sh3eb/uClibc/.config
/usr/src/buildroot/toolchain_build_sh3eb/bin/sed -i -e 's,#
UCLIBC_HAS_THREADS is not set,UCLIBC_HAS_THREADS=y,g'
/usr/src/buildroot/toolchain_build_sh3eb/uClibc/.config
/usr/src/buildroot/toolchain_build_sh3eb/bin/sed -i -e 's,#
PTHREADS_DEBUG_SUPPORT is not set,PTHREADS_DEBUG_SUPPORT=y,g'
/usr/src/buildroot/toolchain_build_sh3eb/uClibc/.config
/usr/src/buildroot/toolchain_build_sh3eb/bin/sed -i -e 's,#
LINUXTHREADS_OLD is not set,LINUXTHREADS_OLD=y,g'
/usr/src/buildroot/toolchain_build_sh3eb/uClibc/.config
mkdir -p /usr/src/buildroot/toolchain_build_sh3eb/uClibc_dev/usr/include
mkdir -p /usr/src/buildroot/toolchain_build_sh3eb/uClibc_dev/usr/lib
mkdir -p /usr/src/buildroot/toolchain_build_sh3eb/uClibc_dev/lib
make -C /usr/src/buildroot/toolchain_build_sh3eb/uClibc \
PREFIX=/usr/src/buildroot/toolchain_build_sh3eb/uClibc_dev/ \
DEVEL_PREFIX=/usr/ \
RUNTIME_PREFIX=/usr/src/buildroot/toolchain_build_sh3eb/uClibc_dev/ \
HOSTCC="gcc" \
  pregen install_dev && \
touch /usr/src/buildroot/toolchain_build_sh3eb/uClibc/.configured
/bin/sh: line 1:
/usr/src/buildroot/build_sh3eb/staging_dir/bin/sh3eb-linux-uclibc-gcc: No
such file or directory
make[1]:
/usr/src/buildroot/build_sh3eb/staging_dir/bin/sh3eb-linux-uclibc-gcc:
Command not found
make[1]: Entering directory
`/usr/src/buildroot/toolchain_build_sh3eb/uClibc'
make[1]:
/usr/src/buildroot/build_sh3eb/staging_dir/bin/sh3eb-linux-uclibc-gcc:
Command not found
?t
  make -C extra/config conf
/bin/sh: line 1:
/usr/src/buildroot/build_sh3eb/staging_dir/bin/sh3eb-linux-uclibc-gcc: No
such file or directory
make[2]:
/usr/src/buildroot/build_sh3eb/staging_dir/bin/sh3eb-linux-uclibc-gcc:
Command not found
`U?make[2]:
/usr/src/buildroot/build_sh3eb/staging_dir/bin/sh3eb-linux-uclibc-gcc:
Command not found
?S?make[2]: *** No rule to make target `|', needed by
`../../extra/config/conf.o'.  Stop.
make[1]: *** [extra/config/conf] Error 2
make[1]: Leaving directory
`/usr/src/buildroot/toolchain_build_sh3eb/uClibc'
make: *** [/usr/src/buildroot/toolchain_build_sh3eb/uClibc/.configured]
Error 2

The full contents of the make attempt are attached to this report.

====================================================================== 

---------------------------------------------------------------------- 
 glindsey - 08-03-06 08:54  
---------------------------------------------------------------------- 
The problem apparently has to do with buildroot not properly touching the
".configured" file for uClibc.  Once I did this manually, the make
proceeded past this point. 

---------------------------------------------------------------------- 
 glindsey - 08-04-06 11:56  
---------------------------------------------------------------------- 
The build is still failing, but at a later point now.  The following errors
occur when trying to build GCC (I've tried three different GCC versions,
all with similar results):

make[2]: Entering directory
`/usr/src/buildroot/toolchain_build_sh3eb/gcc-3.4.2-initial/gcc'
/usr/src/buildroot/toolchain_build_sh3eb/gcc-3.4.2-initial/gcc/xgcc
-B/usr/src/buildroot/toolchain_build_sh3eb/gcc-3.4.2-initial/gcc/
-B/usr/src/buildroot/build_sh3eb/staging_dir/sh3eb-linux-uclibc/bin/
-B/usr/src/buildroot/build_sh3eb/staging_dir/sh3eb-linux-uclibc/lib/
-isystem
/usr/src/buildroot/build_sh3eb/staging_dir/sh3eb-linux-uclibc/include
-isystem
/usr/src/buildroot/build_sh3eb/staging_dir/sh3eb-linux-uclibc/sys-include
-O2 -DIN_GCC -DCROSS_COMPILE  -DUSE_UCLIBC -W -Wall -Wwrite-strings
-Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  -isystem
./include  -I. -I.
-I/usr/src/buildroot/toolchain_build_sh3eb/gcc-3.4.2/gcc
-I/usr/src/buildroot/toolchain_build_sh3eb/gcc-3.4.2/gcc/.
-I/usr/src/buildroot/toolchain_build_sh3eb/gcc-3.4.2/gcc/../include   -g0
-finhibit-size-directive -fno-inline-functions -fno-exceptions
-fno-zero-initialized-in-bss -fno-unit-at-a-time  \
   -c /usr/src/buildroot/toolchain_build_sh3eb/gcc-3.4.2/gcc/crtstuff.c
-DCRT_BEGIN \
  -o crtbegin.o
In file included from
/usr/src/buildroot/toolchain_build_sh3eb/gcc-3.4.2/gcc/crtstuff.c:62:
/usr/src/buildroot/toolchain_build_sh3eb/gcc-3.4.2/gcc/tsystem.h:79:19:
stdio.h: No such file or directory
/usr/src/buildroot/toolchain_build_sh3eb/gcc-3.4.2/gcc/tsystem.h:82:23:
sys/types.h: No such file or directory
/usr/src/buildroot/toolchain_build_sh3eb/gcc-3.4.2/gcc/tsystem.h:85:19:
errno.h: No such file or directory
/usr/src/buildroot/toolchain_build_sh3eb/gcc-3.4.2/gcc/tsystem.h:92:20:
string.h: No such file or directory
/usr/src/buildroot/toolchain_build_sh3eb/gcc-3.4.2/gcc/tsystem.h:93:20:
stdlib.h: No such file or directory
/usr/src/buildroot/toolchain_build_sh3eb/gcc-3.4.2/gcc/tsystem.h:94:20:
unistd.h: No such file or directory
/usr/src/buildroot/toolchain_build_sh3eb/gcc-3.4.2/gcc/tsystem.h:100:18:
time.h: No such file or directory
make[2]: *** [crtbegin.o] Error 1
make[2]: Leaving directory
`/usr/src/buildroot/toolchain_build_sh3eb/gcc-3.4.2-initial/gcc'
make[1]: *** [all-gcc] Error 2
make[1]: Leaving directory
`/usr/src/buildroot/toolchain_build_sh3eb/gcc-3.4.2-initial'
make: ***
[/usr/src/buildroot/toolchain_build_sh3eb/gcc-3.4.2-initial/.compiled]
Error 2 

---------------------------------------------------------------------- 
 psm - 08-04-06 14:00  
---------------------------------------------------------------------- 
update make to 3.80 

---------------------------------------------------------------------- 
 glindsey - 08-08-06 08:10  
---------------------------------------------------------------------- 
Thank you!  After updating make to 3.81, it works perfectly. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-03-06 08:16  glindsey       New Issue                                    
08-03-06 08:16  glindsey       Status                   new => assigned     
08-03-06 08:16  glindsey       Assigned To               => uClibc          
08-03-06 08:16  glindsey       File Added: buildroot-sh3eb-failure.txt          
         
08-03-06 08:54  glindsey       Note Added: 0001558                          
08-04-06 11:56  glindsey       Note Added: 0001560                          
08-04-06 14:00  psm            Note Added: 0001562                          
08-08-06 08:10  glindsey       Note Added: 0001563                          
08-23-06 20:09  vapier         Status                   assigned => closed  
08-23-06 20:09  vapier         Resolution               open => no change
required
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
