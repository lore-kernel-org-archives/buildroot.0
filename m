From: Roman Chertov <rchertov@cs.ucsb.edu>
Date: Sun, 08 Nov 2009 21:28:38 -0800
Subject: [Buildroot] building kernel modules
In-Reply-To: <4AF34ADF.7090303@cs.ucsb.edu>
References: <4AF34ADF.7090303@cs.ucsb.edu>
Message-ID: <4AF7A886.8000703@cs.ucsb.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So I figured out how to get the external kernel module compilation
going.  The cross compilation works fine, but the linking fails as there
are two undefined symbols.  Also, there is a strange error regarding
/usr/local/src/mv-kernel/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-gcc

However, the compilation proceeds even with that error.

[rchertov at number2 src]$ sh make.sh
make:
/usr/local/src/mv-kernel/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-gcc:
Command not found
make: Entering directory
`/proj/tools/buildroot-2009.08/project_build_arm/uclibc/linux-2.6.29'
  LD [M]  /proj/tools/can_driver/musec_can/src/musec_can.o
  Building modules, stage 2.
  MODPOST 1 modules
WARNING: "__bad_udelay"
[/proj/tools/can_driver/musec_can/src/musec_can.ko] undefined!
WARNING: "__aeabi_uldivmod"
[/proj/tools/can_driver/musec_can/src/musec_can.ko] undefined!
  LD [M]  /proj/tools/can_driver/musec_can/src/musec_can.ko
make: Leaving directory
`/proj/tools/buildroot-2009.08/project_build_arm/uclibc/linux-2.6.29'


I believe that the linker uses libc instead of uclibc which was compiled
for ARM, and hence the linking step is failing.  I would appreciate it
if somebody could point out which linker setting I am missing.  Below, I
listed all of the variables that I redefined for the build.

ARCH=arm
CROSS_COMPILE=/<br_dir>/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-
AS      =$(CROSS_COMPILE)as
LD      =$(CROSS_COMPILE)ld
CC      =$(CROSS_COMPILE)gcc
CPP     =$(CC) -E
AR      =$(CROSS_COMPILE)ar
NM      =$(CROSS_COMPILE)nm
STRIP   =$(CROSS_COMPILE)strip
OBJCOPY =$(CROSS_COMPILE)objcopy
OBJDUMP =$(CROSS_COMPILE)objdump


EXTRA_CFLAGS=-I /<br_dir>/project_build_arm/uclibc/linux-2.6.29/include\
-I<br_dir>/build_arm/staging_dir/usr/lib/gcc/arm-linux-uclibcgnueabi/4.3.3/include

LDFLAGS=-L/<br_dir>/build_arm/staging_dir/lib

...



Roman Chertov wrote:
> Hello,
> 
> I am using buildroot to build a distro for an ARM ep9xx system.
> Everything works great except for one kernel module. I am trying to
> debug it, but it is a pain to make the whole kernel tree to insert a
> single printk.  Also, it looks like I have to do "touch
> <...>/.configured" to get the kernel to detect the change the compile a
> new version of the module.
> 
> Is there any documentation regarding building kernel modules by
> themselves after having built the main kernel?  Something similar to how
> userlevel apps get cross compiled.  I suppose that somehow I need to
> access all of the flags that buildroot passes to the kernel when it
> builds it.
> 
> Ideally, I just want to just compile the module, and then insmod it over
> the NFS rootfs.
> 
> Many Thanks,
> 
> Roman
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
