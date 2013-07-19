From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Jul 2013 18:17:33 +0200
Subject: [Buildroot] EABIhf: breaks kernel build
Message-ID: <20130719161733.GC3751@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Since the ARM EABIhf stuff was committed, the Linux kernel build is
broken, and fails with this message:
    armv6-rpi36-linux-gnueabi-gcc: error: -mfloat-abi=soft and
    -mfloat-abi=hard may not be used together

This is because -mfloat-abi=hard is hard-coded in the wrapper, but the
kernel wants to pass -msoft-float.

See attach exerpt of my build log (with a instrumented ext-ttolchain
wrapper). Notice argv[6] and argv[41]:

    argv[6]='-mfloat-abi=hard'
    argv[41]='-msoft-float'

argv[6] is out hard-coded float ABI option, while argv[41] is passed by
the kernel.

I don't know how to solve this.

The trivial and immediate idea would be to have a black-list of
arguments and exclude the ones we pass that conflict with the ones
passed on the command line, but this will be *very* complex and always
incomplete.

An alternate idea would be to detect we're building a Linux kernel by
looking at -D__KERNEL__ in the command line arguments, and if so, not
pass our hard-coded args. This would work for the Linux kernel, but
would break for other packages (eg. U-Boot?).

Another way would be to look at the environment and check if a variable
is set (eg. BR_IN_KERNEL_OR_UBOOT_OR_WHATEVER) and in this case not pass
our hard-coded options. While it would work from inside Buildroot, it
would break as soon as the user would want to use the toolchain directly
from outside Buildroot.

Or simply not pass -mfloat-abi=hard at all.

Apart these, I don't see how we can fix this.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
>>> linux 245f716 Building
PATH="/home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/host/bin:/home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/host/usr/bin:/home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/host/usr/sbin/:/home/ymorin/bin:/home/ymorin/bin:/opt/w_scan/bin:/opt/mutt-sidebar/bin:/opt/dvb-apps/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games" PERLLIB="/home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/host/usr/lib/perl" /usr/bin/make -j1 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm INSTALL_MOD_PATH=/home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/target CROSS_COMPILE=" /home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/host/usr/bin/armv6-rpi36-linux-gnueabi-" DEPMOD=/home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/host/usr/sbin/depmod V=1 -C /home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/build/linux-245f716 zImage
path='/home/ymorin/x-tools/armv6-rpi36-linux-gnueabi/bin/armv6-rpi36-linux-gnueabi-gcc'
argv[0]='/home/ymorin/x-tools/armv6-rpi36-linux-gnueabi/bin/armv6-rpi36-linux-gnueabi-gcc'
argv[1]='--sysroot'
argv[2]='/home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/host/usr/arm-buildroot-linux-gnueabi/sysroot'
argv[3]='-march=armv6zk'
argv[4]='-mtune=arm1176jzf-s'
argv[5]='-mabi=aapcs-linux'
argv[6]='-mfloat-abi=hard'
argv[7]='-marm'
argv[8]='-pipe'
argv[9]='-print-file-name=include'
rm -f include/config/kernel.release
echo "3.6.11$(/bin/sh /home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/build/linux-245f716/scripts/setlocalversion /home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/build/linux-245f716)" > include/config/kernel.release
/usr/bin/make -f /home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/build/linux-245f716/scripts/Makefile.asm-generic \
	            obj=arch/arm/include/generated/asm
set -e; : '  CHK     include/linux/version.h'; mkdir -p include/linux/; 	(echo \#define LINUX_VERSION_CODE 198155; echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))';) < /home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/build/linux-245f716/Makefile > include/linux/version.h.tmp; if [ -r include/linux/version.h ] && cmp -s include/linux/version.h include/linux/version.h.tmp; then rm -f include/linux/version.h.tmp; else : '  UPD     include/linux/version.h'; mv -f include/linux/version.h.tmp include/linux/version.h; fi
set -e; : '  CHK     include/generated/utsrelease.h'; mkdir -p include/generated/; 	if [ `echo -n "3.6.11-yem" | wc -c ` -gt 64 ]; then echo '"3.6.11-yem" exceeds 64 characters' >&2; exit 1; fi; (echo \#define UTS_RELEASE \"3.6.11-yem\";) < include/config/kernel.release > include/generated/utsrelease.h.tmp; if [ -r include/generated/utsrelease.h ] && cmp -s include/generated/utsrelease.h include/generated/utsrelease.h.tmp; then rm -f include/generated/utsrelease.h.tmp; else : '  UPD     include/generated/utsrelease.h'; mv -f include/generated/utsrelease.h.tmp include/generated/utsrelease.h; fi
mkdir -p .tmp_versions 
/usr/bin/make -f scripts/Makefile.build obj=scripts/basic
rm -f .tmp_quiet_recordmcount
/usr/bin/make -f scripts/Makefile.build obj=arch/arm/tools include/generated/mach-types.h
make[3]: `include/generated/mach-types.h' is up to date.
/usr/bin/make -f scripts/Makefile.build obj=.
mkdir -p kernel/
  /home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/host/usr/bin/armv6-rpi36-linux-gnueabi-gcc -Wp,-MD,kernel/.bounds.s.d  -nostdinc -isystem /home/ymorin/x-tools/armv6-rpi36-linux-gnueabi/lib/gcc/armv6-rpi36-linux-gnueabi/4.8.1/include -I/home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/build/linux-245f716/arch/arm/include -Iarch/arm/include/generated -Iinclude  -include /home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/build/linux-245f716/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-bcm2708/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -O2 -marm -fno-dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mabi=aapcs-linux -mno-thumb-interwork -D__LINUX_ARM_ARCH__=6 -march=armv6 -mtune=arm1136j-s -msoft-float -Uarm -fno-omit-frame-pointer -fno-optimize-sibling-calls -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME=KBUILD_STR(bounds)"  -D"KBUILD_MODNAME=KBUILD_STR(bounds)" -fverbose-asm -S -o kernel/bounds.s kernel/bounds.c
path='/home/ymorin/x-tools/armv6-rpi36-linux-gnueabi/bin/armv6-rpi36-linux-gnueabi-gcc'
argv[0]='/home/ymorin/x-tools/armv6-rpi36-linux-gnueabi/bin/armv6-rpi36-linux-gnueabi-gcc'
argv[1]='--sysroot'
argv[2]='/home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/host/usr/arm-buildroot-linux-gnueabi/sysroot'
argv[3]='-march=armv6zk'
argv[4]='-mtune=arm1176jzf-s'
argv[5]='-mabi=aapcs-linux'
argv[6]='-mfloat-abi=hard'
argv[7]='-marm'
argv[8]='-pipe'
argv[9]='-Wp,-MD,kernel/.bounds.s.d'
argv[10]='-nostdinc'
argv[11]='-isystem'
argv[12]='/home/ymorin/x-tools/armv6-rpi36-linux-gnueabi/lib/gcc/armv6-rpi36-linux-gnueabi/4.8.1/include'
argv[13]='-I/home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/build/linux-245f716/arch/arm/include'
argv[14]='-Iarch/arm/include/generated'
argv[15]='-Iinclude'
argv[16]='-include'
argv[17]='/home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/build/linux-245f716/include/linux/kconfig.h'
argv[18]='-D__KERNEL__'
argv[19]='-mlittle-endian'
argv[20]='-Iarch/arm/mach-bcm2708/include'
argv[21]='-Wall'
argv[22]='-Wundef'
argv[23]='-Wstrict-prototypes'
argv[24]='-Wno-trigraphs'
argv[25]='-fno-strict-aliasing'
argv[26]='-fno-common'
argv[27]='-Werror-implicit-function-declaration'
argv[28]='-Wno-format-security'
argv[29]='-fno-delete-null-pointer-checks'
argv[30]='-O2'
argv[31]='-marm'
argv[32]='-fno-dwarf2-cfi-asm'
argv[33]='-fno-omit-frame-pointer'
argv[34]='-mapcs'
argv[35]='-mno-sched-prolog'
argv[36]='-mabi=aapcs-linux'
argv[37]='-mno-thumb-interwork'
argv[38]='-D__LINUX_ARM_ARCH__=6'
argv[39]='-march=armv6'
argv[40]='-mtune=arm1136j-s'
argv[41]='-msoft-float'
argv[42]='-Uarm'
argv[43]='-fno-omit-frame-pointer'
argv[44]='-fno-optimize-sibling-calls'
argv[45]='-DCC_HAVE_ASM_GOTO'
argv[46]='-DKBUILD_STR(s)=#s'
argv[47]='-DKBUILD_BASENAME=KBUILD_STR(bounds)'
argv[48]='-DKBUILD_MODNAME=KBUILD_STR(bounds)'
argv[49]='-fverbose-asm'
argv[50]='-S'
argv[51]='-o'
argv[52]='kernel/bounds.s'
argv[53]='kernel/bounds.c'
armv6-rpi36-linux-gnueabi-gcc: error: -mfloat-abi=soft and -mfloat-abi=hard may not be used together
make[3]: *** [kernel/bounds.s] Error 1
make[2]: *** [prepare0] Error 2
make[1]: *** [/home/ymorin/dev/buildroot/O-rpi/build.rpi-tvheadend/build/linux-245f716/.stamp_built] Error 2
make: *** [all] Error 2
Command exited with non-zero status 2
2.51user 0.38system 0:03.55elapsed 81%CPU (0avgtext+0avgdata 44564maxresident)k
0inputs+160outputs (0major+257249minor)pagefaults 0swaps
