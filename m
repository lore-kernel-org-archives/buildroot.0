From: Leonid <Leonid@a-k-a.net>
Date: Tue, 25 Sep 2007 13:46:55 -0700
Subject: [Buildroot] cannot execute binary file
In-Reply-To: <406A31B117F2734987636D6CCC93EE3C023DCA36@ehost011-3.exch011.intermedia.net>
References: <406A31B117F2734987636D6CCC93EE3C023DCA36@ehost011-3.exch011.intermedia.net>
Message-ID: <406A31B117F2734987636D6CCC93EE3C023DCA58@ehost011-3.exch011.intermedia.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have found the problem - BR2_STRIP_strip was not defined and $(STRIP)
<file> reduced to simple <file>... 

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of Leonid
Sent: Tuesday, September 25, 2007 1:03 PM
To: buildroot at uclibc.org
Subject: [Buildroot] cannot execute binary file

Hi:

I'm trying to build buildroot for at91rm9200df board, I'm using snapshot
of yesterday, 9/24/2007, 6 p.m.

I have already passed through several stages and it is building MTD
utilities for target now. However for some reason after creating each
MTD utility, it tries to run it (on the host) and naturally fails
(jffs2dump in this example):

[leonid at jaipur buildroot]$ make

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/lib/ccache/gcc'
C compiler version '4.1.2':                     Ok
C++ compiler '/usr/lib/ccache/g++'
C++ compiler version '4.1.2':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf
/home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
ll//buildroot-config
mkdir -p
/home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
ll/
cp -dpRf package/config/buildroot-config
/home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
ll//buildroot-config
/usr/bin/make -j2
CC=/home/leonid/LM150/software/linux/rootfs/gcc-4.1.2-uclibc/usr/bin/arm
-linux-uclibc-gcc
CROSS_COMPILE="/home/leonid/LM150/software/linux/rootfs/gcc-4.1.2-uclibc
/usr/bin/arm-linux-uclibc-" \
 
CROSS="/home/leonid/LM150/software/linux/rootfs/gcc-4.1.2-uclibc/usr/bin
/arm-linux-uclibc-"
PREFIX="/home/leonid/LM150/software/linux/rootfs/buildroot/project_build
_arm_small//root" \
                ARCH=arm \
                EXTRA_CFLAGS="-Os -pipe
-I/home/leonid/LM150/software/linux/rootfs/gcc-4.1.2-uclibc/usr/include
-I/home/leonid/LM150/software/linux/rootfs/gcc-4.1.2-uclibc/include" -C
/home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
ll//busybox-1.5.0 install
make[1]: Entering directory
`/home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sm
all/busybox-1.5.0'
  ./_install/sbin/halt -> ../bin/busybox
  ./_install/sbin/poweroff -> ../bin/busybox
  ./_install/sbin/reboot -> ../bin/busybox
  ./_install/sbin/start-stop-daemon -> ../bin/busybox
  ./_install/usr/bin/mesg -> ../../bin/busybox
make[1]: Leaving directory
`/home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sm
all/busybox-1.5.0'
# Just in case
chmod a+x
/home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
ll//root/usr/share/udhcpc/default.script
mkdir -p
/home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
ll//root/usr/sbin
cp -f
/home/leonid/LM150/software/linux/rootfs/buildroot/build_arm_small/mtd_o
rig/util/jffs2dump
/home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
ll//root/usr/sbin/jffs2dump
/home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
ll//root/usr/sbin/jffs2dump
/home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
ll//root/usr/sbin/jffs2dump:
/home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sma
ll//root/usr/sbin/jffs2dump: cannot execute binary file
make: ***
[/home/leonid/LM150/software/linux/rootfs/buildroot/project_build_arm_sm
all//root/usr/sbin/jffs2dump] Error 126

This is happening again and again for each utility. What is wrong?

Thanks,

Leonid.
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
