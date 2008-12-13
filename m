From: jczhang at ict.ac.cn <jczhang@ict.ac.cn>
Date: Sat, 13 Dec 2008 21:50:29 +0800 (CST)
Subject: [Buildroot] n32 ABI problem when building a mipsel n32 buildroot
Message-ID: <508d8060d49b2e4fe6b4280e3d495875.squirrel@webmail.ict.ac.cn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
/home/jczhang/research/buildroot/build_mipsel/staging_dir/usr/lib/gcc/mipsel-linux-uclibc/4.2.4/../../../../mipsel-linux-uclibc/bin/ld:
ldso/ldso/ld-uClibc_so.a(ldso.oS): ABI is incompatible with that of the
selected emulation
/home/jczhang/research/buildroot/build_mipsel/staging_dir/usr/lib/gcc/mipsel-linux-uclibc/4.2.4/../../../../mipsel-linux-uclibc/bin/ld:
failed to merge target specific data of file
ldso/ldso/ld-uClibc_so.a(ldso.oS)
/home/jczhang/research/buildroot/build_mipsel/staging_dir/usr/lib/gcc/mipsel-linux-uclibc/4.2.4/../../../../mipsel-linux-uclibc/bin/ld:
ldso/ldso/ld-uClibc_so.a(resolve.oS): ABI is incompatible with that of the
selected emulation
/home/jczhang/research/buildroot/build_mipsel/staging_dir/usr/lib/gcc/mipsel-linux-uclibc/4.2.4/../../../../mipsel-linux-uclibc/bin/ld:
failed to merge target specific data of file
ldso/ldso/ld-uClibc_so.a(resolve.oS)
ldso/ldso/ld-uClibc_so.a(ldso.oS): In function `_start':
ldso.c:(.text+0x20): undefined reference to `_DYNAMIC'
make[1]: *** [lib/ld-uClibc.so] Error 1
make[1]: Leaving directory
`/home/jczhang/research/buildroot/toolchain_build_mipsel/uClibc-0.9.30'
make: ***
[/home/jczhang/research/buildroot/toolchain_build_mipsel/uClibc-0.9.30/lib/libc.a]
Error 2

 I made some investigation on the problem. I found ldso.oS is a
n32 ELF file. But the linker(i.e.,buildroot/build_mipsel/staging_dir
/usr/mipsel-linux-uclibc/bin/ld)'s default link script uses an o32 format.
So the linker complains conflict ABIs between the input file(ld-uClibc_so.a)
and the output file(ld-uClibc-0.9.30.so)
  But why buildroot builds a binutils like this? I don't have any idea.

  Any help is appreciated.
  Thanks!
