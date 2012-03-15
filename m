From: Erland Lewin <erland.lewin@avaloninnovation.com>
Date: Thu, 15 Mar 2012 14:44:01 +0100
Subject: [Buildroot] elf2flt blues
Message-ID: <CAFm-AyppuS3y-oHUHj_Xz1u+JB2qLDKmHVF4MQV-8=8u9cwwEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm trying to build buildroot for the Olimex LPC2478-STK development
card<http://www.olimex.com/dev/lpc-2478stk.html>(with an arm7TDMI
core), for a patched Linux-2.6.24 kernel that came with
the card.

I'm having lots of problems, and would really appreciate it if someone
could point me in the right direction.

I managed to build buildroot, but then it failed to execute on the board,
and I think it because the kernel only supports BFLT, not ELF.

So I selected 'elf2flt support?' in the Buildroot 2012.02 configurator.
Should I have to do something else to have elf2flt automatically run during
linking?

I have a problem linking elf2flt:

gcc -g -O2 -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\"
> -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\"
> -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1
> -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1
> -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DHAVE_FCNTL_H=1 -DHAVE_UNISTD_H=1
> -DHAVE_BFD_H=1  -DTARGET_arm -I/bfd/
> -I/home/erl/src/LPC2478/buildroot-2012.02/output/build/binutils-2.21.1/include/
> -lz -o flthdr
> /home/erl/src/LPC2478/buildroot-2012.02/output/toolchain/elf2flt/flthdr.c
> /bfd/libbfd.a /libiberty/libiberty.a
> gcc: /bfd/libbfd.a: No such file or directory
> gcc: /libiberty/libiberty.a: No such file or directory
> gcc: /bfd/libbfd.a: No such file or directory
> gcc: /libiberty/libiberty.a: No such file or directory


elf2flt was configured with:

rm -rf config.cache; \
> LDFLAGS=-lz \
> /home/erl/src/LPC2478/buildroot-2012.02/output/toolchain/elf2flt/configure
>  \
> --with-bfd-include-dir=/bfd/ \
> --with-binutils-include-dir=/home/erl/src/LPC2478/buildroot-2012.02/output/build/binutils-2.21.1/include/
> \
> --target=arm-unknown-linux-uclibcgnueabi \
> --with-libbfd=/bfd/libbfd.a \
> --with-libiberty=/libiberty/libiberty.a \
>
> --prefix=/home/erl/src/LPC2478/buildroot-2012.02/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr


I see that I have four different versions of libbfd.a:

./output/target/usr/lib/libbfd.a
./output/build/binutils-2.21.1/bfd/libbfd.a
./output/build/host-binutils-2.21.1/bfd/libbfd.a
./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/lib/libbfd.a

I try to rerun configure manually with:

./configure '--with-libbfd=../../build/host-binutils-2.21.1/bfd/libbfd.a'
> '--with-bfd-include-dir=../../build/host-binutils-2.21.1/bfd'
> '--with-libiberty=../../host/usr/lib/libiberty.a'
> '--prefix=/home/erl/src/LPC2478/buildroot-2012.02/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr'
> 'LDFLAGS=-lz' 'target_alias=arm-unknown-linux-uclibcgnueabi'


Note that I also seem to have had to add a target_alias flag.

I succeed in building elf2flt. When I try to run it manually on my busybox
executable, I get:

$ ./elf2flt -v ../../target/bin/busybox -o ./busybox
> ../../target/bin/busybox: Input file contains no relocation info


After googling, I think I have to build all apps with the '-r' flag to gcc
to add relocation info (see
http://www.mail-archive.com/uclinux-dev at uclinux.org/msg00659.html).

I'm not sure where to add the '-r' in the buildroot configurator, so I
added it after '-pipe' in BR2_TARGET_OPTIMIZATION.

I then get an error building busybox:

/home/erl/src/LPC2478/buildroot-2012.02/output/host/usr/lib/gcc/arm-unknown-linux-uclibcgnueabi/4.5.3/../../../../arm-unknown-linux-uclibcgnueabi/bin/ld:
> gc-sections requires either an entry or an undefined symbol


I commented out -gc-sections from scripts/trylink and rebuilt.

I now get errors building binutils:

>  /home/erl/src/LPC2478/buildroot-2012.02/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
> -c -DHAVE_CONFIG_H -pipe -r -Os   -I. -I./../include  -W -Wall
> -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  -fPIC
> ./pex-common.c -o pic/pex-common.o; \
> else true; fi
> ./physmem.c: In function 'physmem_total':
> ./physmem.c:96:23: error: storage size of 'pss' isn't known
> ./physmem.c:97:5: warning: implicit declaration of function
> 'pstat_getstatic'
> ./physmem.c:96:23: warning: unused variable 'pss'
> ./physmem.c: In function 'physmem_available':
> ./physmem.c:200:23: error: storage size of 'pss' isn't known
> ./physmem.c:201:24: error: storage size of 'psd' isn't known
> ./physmem.c:203:2: warning: implicit declaration of function
> 'pstat_getdynamic'
> ./physmem.c:201:24: warning: unused variable 'psd'
> ./physmem.c:200:23: warning: unused variable 'pss'
> make[3]: *** [physmem.o] Error 1


I think I'll start over and rebuild it from scratch (the third time). I'd
appreciate any hints.

Thanks!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120315/35e6fbe6/attachment-0001.html>
