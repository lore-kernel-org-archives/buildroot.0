From: Ettore Campion <ecampion@gmail.com>
Date: Fri, 22 Apr 2011 12:30:56 +0200
Subject: [Buildroot] Problems using buildroot with crosstoll-ng
In-Reply-To: <201104211628.27191.yann.morin.1998@anciens.enib.fr>
References: <BANLkTik6g3rhC1_WfRLkBodNVsOUhjKaJA@mail.gmail.com>
	<201104171740.17634.yann.morin.1998@anciens.enib.fr>
	<BANLkTikpiEJaYWGHf+_3LF4D=m-ne10Gww@mail.gmail.com>
	<201104211628.27191.yann.morin.1998@anciens.enib.fr>
Message-ID: <BANLkTimXF3sibOLRJpGjOw=+w_b2wD=F9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

First of all thank you for your patience and your answers.

Here the result of the command:
$ readelf -d output/host/usr/mipsel-unknown-linux-gnu/sysroot/lib/ld.so.1
|grep SONAME
 0x0000000e (SONAME)                     Library soname: [ld.so.1]

I really do not know why I get such a name, this is the result of the
creation of the toolchain by crosstool-ng: I selected a mipsel target,
kernel headers are based on linux 2.6.22 (custom tarball), binutils is
2.20, gcc is 4.4.3 with c++ support and finally glibc is 2.9 (quite
everywhere, apart from the kernel headers and c++ support, default
settings in crosstool-ng for my target).

About the possible uclibc/glibc mix, I did not explained my good enough.
What I meant was that as I first tried buildroot as tool to generate a
toolchain+rootfs I let where possible all the default settings, i.e. I
generated a buildroot-uclibc cross toolchain + rootfs. I was quite
surprised that everything went smoothly and at the end I had working
toolchain + rootfs, after the boot of the kernel I had on the serial
port  of the target the random number generator starting and a login
console (yes I selected System Configuration->Generic serial port
config->ttyS0..).
Since I wanted a glibc toolchain (I'm currently using an old glibc
based cross-toolchain on that target) I deleted the output dir,
I ran again make menuconfig, I selected differently than before only
crosstool-ng as toolchain, I run make ctng-menuconfig to select c++
support and
my custom kernel tarball and finally ran make... and I got the
problems I told in my first post.

Here also the readelf from init
$ readelf -d output/target/sbin/init

Dynamic section at offset 0x164 contains 22 entries:
 Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]
 0x0000000c (INIT)                       0x4039d0
 0x0000000d (FINI)                       0x4a708c
 0x00000004 (HASH)                       0x40023c
 0x00000005 (STRTAB)                     0x4026b8
 0x00000006 (SYMTAB)                     0x400cd8
 0x0000000a (STRSZ)                      3867 (bytes)
 0x0000000b (SYMENT)                     16 (bytes)
 0x70000016 (MIPS_RLD_MAP)               0x4d6144
 0x00000015 (DEBUG)                      0x0
 0x00000003 (PLTGOT)                     0x4d6150
 0x70000001 (MIPS_RLD_VERSION)           1
 0x70000005 (MIPS_FLAGS)                 NOTPOT
 0x70000006 (MIPS_BASE_ADDRESS)          0x400000
 0x7000000a (MIPS_LOCAL_GOTNO)           17
 0x70000011 (MIPS_SYMTABNO)              414
 0x70000012 (MIPS_UNREFEXTNO)            37
 0x70000013 (MIPS_GOTSYM)                0x7
 0x6ffffffe (VERNEED)                    0x403910
 0x6fffffff (VERNEEDNUM)                 1
 0x6ffffff0 (VERSYM)                     0x4035d4
 0x00000000 (NULL)                       0x0


Regards,
Ettore


On Thu, Apr 21, 2011 at 4:28 PM, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
> Ettore, All,
>
> On Thursday 21 April 2011 09:42:50 Ettore Campion wrote:
>> I just cloned the buildroot git repository (with your fixed applied)
>> and tried again.
>> With my configuration (glibc 2.9) is always missing ld.so.1 in target/lib.
>> This seems to me because in
>> toolchain/toolchain-crosstool-ng/crosstool-ng.mk we're looking for
>> ld-linux.so and nor for ld.so.
>
> The file should be named by its SONAME. Please run:
>  readelf -d ld.so.1 |grep SONAME

> That's why we usually care about ld-linux.so, and not ld.so.1.
>
> What is requiring ld.so.1 on your target?
>
>
> Quoting your original post:
>> flashing the generated
>> rootfs.jjfs2 led me to a "kernel panic - not syncing: no init found"
>> message from the kernel.
>
> Read below, and then run:
>  readelf -d /sbin/init
>
>> Taking again a look to crosstool-ng.mk and target/lib I noticed that
>> was missing ld.so.1, manually adding the lib to target/lib I got rid
>> of the missing init message but in the serial console I do not see
>> either any daemons starting nor the login prompt (I got all these
>> things with a rootfs created selecting a buildroot-uclibc toolchain);
>                                                     ^^^^^^
> [--SNIP--]
>> drwxr-xr-x  2 tora tora    4096 2011-04-14 22:47 .
>> drwxr-xr-x 16 tora tora    4096 2011-04-14 22:19 ..
>> -rwxr-xr-x  1 tora tora  164040 2011-04-14 22:28 ld-2.9.so
>                                                   ^^^^^^^^^
> This is not a uClibc library. It is a glibc library.
> Ditto for all the others.
>
> Did you mix binaries built with uClibc with others built with
> glibc?
>
> Once you have started to run buildroot, and that the toolchain is built,
> and the first program is ./configured, it is not possible to switch to
> another C library.
>
> If you need to change the C library, you'll have to restart from scratch.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
>
