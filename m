From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Wed, 30 Oct 2013 23:53:02 +0100
Subject: [Buildroot] Problems with Python ctypes is not limited to Raspberry
 Pi platfform - tested on qemu vexpress
Message-ID: <CAMduVEdzrDhzbXv6buXJTXxB19fHbmee0Q4+qoA4Fsw3ECRmaQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To make sure, that the problem is not limited to Raspberry Pi
platform, and to allow testing for developers not having access to
Rapberry Pi, I have repeated my tests using qemu with emulated
vexpress system.

1. After cloning of buildroot, I have made "make defconfig
qemu_arm_vexpress_defconfig "

2. In the make menuconfig I have enabled toolchain large file and
WCHAR support, which allowed me to select Python. I have also enabled
option:
"python module format to install"->(X) .py sources and .pyc compiled
Which simplifies testing of modification of the ctypes/util.py

3. In the make uclibc-menuconfig I have enabled
General Library Settings->[*]   Enable library loader cache (ld.so.conf)

4. I have compiled the system with "make" (well, "make -j 12" doesn't
work for current version of buildroot - it fails with following error
messages:
$ make -j 12
[...]
>>> host-automake 1.12.6 Building
PATH=/tmp/rr/buildroot/output/host/bin:/tmp/rr/buildroot/output/host/usr/bin:/home/wzab/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
LD_LIBRARY_PATH="/tmp/rr/buildroot/output/host/usr/lib:"
PKG_CONFIG="/tmp/rr/buildroot/output/host/usr/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/"
PKG_CONFIG_LIBDIR="/tmp/rr/buildroot/output/host/usr/lib/pkgconfig"
PERLLIB="/tmp/rr/buildroot/output/host/usr/lib/perl"  /usr/bin/make
-j9  -C /tmp/rr/buildroot/output/build/host-automake-1.12.6/
make[1]: Entering directory
`/tmp/rr/buildroot/output/build/host-automake-1.12.6'
make[1]: warning: -jN forced in submake: disabling jobserver mode.
make[1]: *** read jobs pipe: No such file or directory.  Stop.
make[1]: *** Waiting for unfinished jobs....
  GEN      automake
  GEN      t/ax/shell-no-trail-bslash
make: *** [/tmp/rr/buildroot/output/build/host-automake-1.12.6/.stamp_built]
Broken pipe
)

OK, so I compile with "make", which takes much longer, but succeeds.

After starting qemu with:
$qemu-system-arm -M vexpress-a9 -kernel output/images/zImage -drive
file=output/images/rootfs.ext2,if=sd -append "console=ttyAMA0,115200
root=/dev/mmcblk0" -serial stdio -net nic,model=lan9118 -net user
I have executed the following session:

Welcome to Buildroot
buildroot login: root
# python
Python 2.7.3 (default, Oct 30 2013, 23:17:05)
[GCC 4.7.3] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import os
>>> os.uname()
('Linux', 'buildroot', '3.11.4', '#1 SMP Wed Oct 30 23:20:49 CET
2013', 'armv7l')
>>> import ctypes.util
>>> print ctypes.util.find_library('m')
None

Then I have edited the util.py file:
# vi /usr/lib/python2.7/ctypes/util.py

changing the mach_map dictionary:

            mach_map = {
                'x86_64-64': 'libc6,x86-64',
                'ppc64-64': 'libc6,64bit',
                'sparc64-64': 'libc6,64bit',
                's390x-64': 'libc6,64bit',
                'ia64-64': 'libc6,IA-64',
                'armv7l-32':'libc0',
                }
            abi_type = mach_map.get(machine, 'libc6')

and run Python again:
# python
Python 2.7.3 (default, Oct 30 2013, 23:17:05)
[GCC 4.7.3] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import ctypes.util
>>> ctypes.util.find_library('m')
'libm.so.0'
>>>

So after the above modification, find_library works.
-- 
Wojciech M. Zabo?otny
My GPG/PGP keys:
standard: B191 ACF0 7909 83FA 3F9B  450C 407E 3C4B 4569 D119
confidential: 2BF3 F90F 6EA8 7D35 59FD  5080 78ED 33DE 1312 D8F8
