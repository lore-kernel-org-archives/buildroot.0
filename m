From: Claus Klein <claus.klein@arcormail.de>
Date: Sat, 20 Jan 2007 18:42:12 +0100
Subject: [Buildroot]
	buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc/bfd.info:
	build error
In-Reply-To: <20070120173409.GB23354@aon.at>
References: <200701192249.57232.claus.klein@arcormail.de>
	<200701201410.06047.claus.klein@arcormail.de>
	<20070120173409.GB23354@aon.at>
Message-ID: <200701201842.12522.claus.klein@arcormail.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 20 January 2007 18:34, Bernhard Fischer wrote:
> On Sat, Jan 20, 2007 at 02:10:05PM +0100, Claus Klein wrote:
> >On Friday 19 January 2007 22:49, Claus Klein wrote:
> >> Hi,
> >> 
> >> I got a Warning: `makeinfo' is missing on your system. 
> >> 	and the make failed?
> >> 
> >> Is this a known problem?
> 
> Fix this upstream or just install texinfo.

Ok; I installed texinfo package, this works now...

> >> 
> >> Best Regards,
> >> 
> >> Claus
> >
> >I stop at this point!
> >I'm not able to build any toolchain under OpenSuse 10.1 without `makeinfo'
> >
> >What is the stable toolchain combination today?
> >I expected the 'make defconfig' would work.
> >It seems not?
> 
> 2.6.19.2 headers, current svn of busybox and uClibc with current
> binutils and gcc-4.2 from today work for me to create i386 and x86_64
> rootfs. I currently have no need for other arches but they are
> _supposed_ to work, of course.
> 

but I had to do some work to build the gcc:
##################################################################################

===================================
Quickfix for ERROR:
in:     toolchain_build_i686/gcc-3.4.2
and:    toolchain_build_i686/gcc-3.3.6

/home/claus/src/buildroot/toolchain_build_i686/uClibc_dev//usr/include/bits/local_lim.h:36:26: linux/limits.h: No such file or directory
make[2]: *** [crtbegin.o] Fehler 1
make[2]: Leaving directory `/home/claus/src/buildroot/toolchain_build_i686/gcc-3.4.2-initial/gcc'

===================================

claus at P3linux:~/src/buildroot/toolchain_build_i686> find . -name limits.h -ls
2696898    4 -rw-r--r--   1 claus    users         992 Nov 29  2002 ./linux-libc-headers-2.4.31/include/linux/limits.h
2701038    4 -rw-r--r--   1 claus    users         127 Feb  4  2005 ./linux-libc-headers-2.4.31/include/asm-armnommu/limits.h
2699711    4 -rw-r--r--   1 claus    users         127 Jan 21  1998 ./linux-libc-headers-2.4.31/include/asm-arm/limits.h
2762249    4 -rw-rw-r--   1 claus    users        3470 Jan 20 16:11 ./gcc-3.4.2-initial/gcc/include/limits.h
2702505    8 -rw-r--r--   1 claus    users        4550 Jan 16 09:10 ./uClibc/include/limits.h
2717738    4 -rw-rw-r--   1 claus    users         841 Jul 19  2000 ./gcc-3.4.2/gcc/fixinc/tests/base/sys/limits.h
2759352    4 -rw-rw-r--   1 claus    users        1498 Dez  9  2003 ./gcc-3.4.2/libstdc++-v3/include/c_compatibility/limits.h
2706515    8 -rw-r--r--   1 claus    users        4550 Jan 16 09:10 ./uClibc_dev/usr/include/limits.h

claus at P3linux:~/src/buildroot/toolchain_build_i686> find . -name linux -ls
2702128    0 lrwxrwxrwx   1 claus    users          72 Jan 20 14:23 ./linux -> /home/claus/src/buildroot/toolchain_build_i686/linux-libc-headers-2.4.31
2692931   14 drwxr-xr-x  13 claus    users       14494 Jul 19  2005 ./linux-libc-headers-2.4.31/include/linux
2703942    1 drwxr-xr-x  26 claus    users         633 Jan 16 09:10 ./uClibc/libc/sysdeps/linux
2705763    1 drwxr-xr-x  14 claus    users         652 Jan 16 09:10 ./uClibc/libpthread/linuxthreads/sysdeps/unix/sysv/linux

claus at P3linux:~/src/buildroot/toolchain_build_i686> cd linux
claus at P3linux:~/src/buildroot/toolchain_build_i686/linux> pwd
/home/claus/src/buildroot/toolchain_build_i686/linux

claus at P3linux:~/src/buildroot/toolchain_build_i686/linux> cd /tools/Linuxi386CDK/i686-linux-uclibc
mkdir include && cd include && ( \
 ln -s ~/src/buildroot/toolchain_build_i686/linux/include/linux . ; \
 ln -s ~/src/buildroot/toolchain_build_i686/linux/include/asm . ; \
)

claus at P3linux:/tools/Linuxi386CDK/i686-linux-uclibc/include>

##################################################################################

Is is a BUG or my build host environment?

Bye
Claus
