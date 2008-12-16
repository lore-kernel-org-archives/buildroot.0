From: Zhang Junchao <jczhang@ict.ac.cn>
Date: Tue, 16 Dec 2008 17:01:37 +0800
Subject: [Buildroot] n32 ABI problem when building a mipsel n32 buildroot
In-Reply-To: <b069e804406d965a9939445b3b965b67.squirrel@webmail.ict.ac.cn>
References: <b069e804406d965a9939445b3b965b67.squirrel@webmail.ict.ac.cn>
Message-ID: <CF06608B24E8434CA385940A63FF7143@himalaya>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

         I found the trick why buildroot couldn't handle a "mips + n32 abi"
configuration.

         Using the current buildroot, if you "make menuconfig" and select
"mipsel + n32 abi", the config scripts will assign a mips-linux-uclibc like
name to $(REAL_GNU_TARGET_NAME), which is passed to the "--target= "config
option for binutils and other tools. Unfortunately, binutils decides its
default ABI by the target name. If the name is mips*-linux like, it uses
o32. Otherwise, if it is mips64*-linux like, it uses n32.

I added a workaround in target/Config.in.arch to fix the problem.

    config BR2_ARCH

    .

    default "mipsel" if BR2_mipsel && BR2_MIPS_OABI32

    default "mips64el" if BR2_mipsel && BR2_MIPS_ABI32

         This time, $(REAL_GNU_TARGET_NAME) is set to be
mips64el-linux-uclibc and the building succeeds, although with two minor
problems in the middle:

1) In file included from
/home/jczhang/research/buildroot/toolchain_build_mips64el/gcc-4.2.4/libmudfl
ap/mf-hooks1.c:58:

/home/jczhang/research/buildroot/build_mips64el/staging_dir/usr/include/unis
td.h:243: error: two or more data types in declaration specifiers

...

make[1]: Leaving directory
`/home/jczhang/research/buildroot/toolchain_build_mips64el/gcc-4.2.4-final'

make: *** [all] Error 2

workaround: (searched from the web): add --disable-libmudflap to "Additional
gcc options"

 

2)find
/home/jczhang/research/buildroot/project_build_mips64el/uclibc/root/usr/lib
-name '*.a' -delete

find: invalid predicate `-delete'

Fix: In buildroot/Makefile, change stuffs such as "find
$(TARGET_DIR)/usr/lib -name '*.a' -delete  to ". -name | xargs rm -rf"

         

 

-----------------------Original
Message-----------------------------------------------------------
Hi,

  I have a problem when build a mipsel n32 cross compiler uclibc toolchain

on a CentOS4/X86_64 host. The buildroot I used is the snapshot

buildroot-20081210.tar.bz2.

  Firstly I issue "make menuconfig" under buildroot directory. Among the

target options, I choose "mipsel, mips4, n32".

  Secondly, I issue "make uclibc-menuconfig" under buildroot. In the

"Target Architecture Features and Options", I adjust the miss-guessed

"Target ABI" from O32 to N32. Other options are left unchanged.

  Then I type "make" to build. I find binutils-2.19, gcc-4.2.4-initial are

all successfully built. But when building  uClibc-0.9.30, the following

error happens:

 

  ....

  AS ldso/ldso/mips/resolve.oS

  AR cr ldso/ldso/ld-uClibc_so.a

  STRIP -x -R .note -R .comment ldso/ldso/ld-uClibc_so.a

  LD ld-uClibc-0.9.30.so

collect2: ld terminated with signal 11 [Segmentation fault]

/home/jczhang/research/buildroot/build_mipsel/staging_dir/usr/lib/gcc/mipsel
-linux-uclibc/4.2.4/../../../../mipsel-linux-uclibc/bin/ld:

ldso/ldso/ld-uClibc_so.a(ldso.oS): ABI is incompatible with that of the

selected emulation

/home/jczhang/research/buildroot/build_mipsel/staging_dir/usr/lib/gcc/mipsel
-linux-uclibc/4.2.4/../../../../mipsel-linux-uclibc/bin/ld:

failed to merge target specific data of file

ldso/ldso/ld-uClibc_so.a(ldso.oS)

/home/jczhang/research/buildroot/build_mipsel/staging_dir/usr/lib/gcc/mipsel
-linux-uclibc/4.2.4/../../../../mipsel-linux-uclibc/bin/ld:

ldso/ldso/ld-uClibc_so.a(resolve.oS): ABI is incompatible with that of the

selected emulation

/home/jczhang/research/buildroot/build_mipsel/staging_dir/usr/lib/gcc/mipsel
-linux-uclibc/4.2.4/../../../../mipsel-linux-uclibc/bin/ld:

failed to merge target specific data of file

ldso/ldso/ld-uClibc_so.a(resolve.oS)

ldso/ldso/ld-uClibc_so.a(ldso.oS): In function `_start':

ldso.c:(.text+0x20): undefined reference to `_DYNAMIC'

make[1]: *** [lib/ld-uClibc.so] Error 1

make[1]: Leaving directory

`/home/jczhang/research/buildroot/toolchain_build_mipsel/uClibc-0.9.30'

make: ***

[/home/jczhang/research/buildroot/toolchain_build_mipsel/uClibc-0.9.30/lib/l
ibc.a]

Error 2

 

 I made some investigation on the problem. I found ldso.oS is a

n32 ELF file. But the linker(i.e.,buildroot/build_mipsel/staging_dir

/usr/mipsel-linux-uclibc/bin/ld)'s default link script uses an o32 format.

So the linker complains conflict ABIs between the input file(ld-uClibc_so.a)

and the output file(ld-uClibc-0.9.30.so)

  But why buildroot builds a binutils like this? I don't have any idea.

 

  Any help is appreciated.

  Thanks!

 

 

 

 

 

 

 

 

Internal Virus Database is out of date.

Checked by AVG - http://www.avg.com 

Version: 8.0.176 / Virus Database: 270.9.13/1827 - Release Date: 2008-12-3
17:41

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081216/a1a218ea/attachment.htm 
