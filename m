From: Alex Potapenko <opotapenko@gmail.com>
Date: Tue, 14 Apr 2015 18:20:41 +0300
Subject: [Buildroot] [Buildroot-2015.02][MIPS]Building soft-float gcc-4.9.2
	binutils-2.25 toolchain
Message-ID: <CAF5aO=+W3-bBxvrT2G9EzBP6_JFK+udqfYzbSvXpLEbsL+a-nA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all!
While trying to build a soft-float gcc-4.9.2 binutils-2.25 mipsel
toolchain, I encountered some problems, and found some solutions, and would
like to share my experience in the hope that it might be useful for someone
else.
The starting point was a working buildroot 2015.02 config that I use to
build an ARM EABI toolchain: I only changed the architecture using 'make
menuconfig' command (see attached config). The built went fine right until
it tried to link shared libatomic during host-gcc-final build. The error
looked like this:

libtool: link:
> /home/alex/optware/buildroot-mipsel/toolchain/buildroot-2015.02/output/build/host-gcc-final-4.9.2/build/./gcc/xgcc
> -B/home/alex/optware/buildroot-mipsel/toolchain/buildroot-2015.02/output/build/host-gcc-final-4.9.2/build/./gcc/
> -B/home/alex/optware/buildroot-mipsel/toolchain/buildroot-2015.02/output/host/usr/mipsel-buildroot-linux-uclibc/bin/
> -B/home/alex/optware/buildroot-mipsel/toolchain/buildroot-2015.02/output/host/usr/mipsel-buildroot-linux-uclibc/lib/
> -isystem
> /home/alex/optware/buildroot-mipsel/toolchain/buildroot-2015.02/output/host/usr/mipsel-buildroot-linux-uclibc/include
> -isystem
> /home/alex/optware/buildroot-mipsel/toolchain/buildroot-2015.02/output/host/usr/mipsel-buildroot-linux-uclibc/sys-include
>    -shared  .libs/gload.o .libs/gstore.o .libs/gcas.o .libs/gexch.o
> .libs/glfree.o .libs/lock.o .libs/init.o .libs/fenv.o .libs/load_1_.o
> .libs/store_1_.o .libs/cas_1_.o .libs/exch_1_.o .libs/fadd_1_.o
> .libs/fsub_1_.o .libs/fand_1_.o .libs/fior_1_.o .libs/fxor_1_.o
> .libs/fnand_1_.o .libs/tas_1_.o .libs/load_2_.o .libs/store_2_.o
> .libs/cas_2_.o .libs/exch_2_.o .libs/fadd_2_.o .libs/fsub_2_.o
> .libs/fand_2_.o .libs/fior_2_.o .libs/fxor_2_.o .libs/fnand_2_.o
> .libs/tas_2_.o .libs/load_4_.o .libs/store_4_.o .libs/cas_4_.o
> .libs/exch_4_.o .libs/fadd_4_.o .libs/fsub_4_.o .libs/fand_4_.o
> .libs/fior_4_.o .libs/fxor_4_.o .libs/fnand_4_.o .libs/tas_4_.o
> .libs/load_8_.o .libs/store_8_.o .libs/cas_8_.o .libs/exch_8_.o
> .libs/fadd_8_.o .libs/fsub_8_.o .libs/fand_8_.o .libs/fior_8_.o
> .libs/fxor_8_.o .libs/fnand_8_.o .libs/tas_8_.o     -pthread
> -Wl,--version-script -Wl,../../../libatomic/libatomic.map   -pthread
> -Wl,-soname -Wl,libatomic.so.1 -o .libs/libatomic.so.1.1.0
> /home/alex/optware/buildroot-mipsel/toolchain/buildroot-2015.02/output/host/usr/mipsel-buildroot-linux-uclibc/bin/ld:
> .libs/gload.o: relocation R_MIPS_HI16 against `__gnu_local_gp' can not be
> used when making a shared object; recompile with -fPIC
> .libs/gload.o: error adding symbols: Bad value
> collect2: error: ld returned 1 exit status
> make[5]: *** [libatomic.la] Error 1
> make[5]: Leaving directory
> `/home/alex/optware/buildroot-mipsel/toolchain/buildroot-2015.02/output/build/host-gcc-final-4.9.2/build/mipsel-buildroot-linux-uclibc/libatomic'
> make[4]: *** [all-recursive] Error 1
> make[4]: Leaving directory
> `/home/alex/optware/buildroot-mipsel/toolchain/buildroot-2015.02/output/build/host-gcc-final-4.9.2/build/mipsel-buildroot-linux-uclibc/libatomic'
> make[3]: *** [all] Error 2
> make[3]: Leaving directory
> `/home/alex/optware/buildroot-mipsel/toolchain/buildroot-2015.02/output/build/host-gcc-final-4.9.2/build/mipsel-buildroot-linux-uclibc/libatomic'
> make[2]: *** [all-target-libatomic] Error 2
> make[2]: Leaving directory
> `/home/alex/optware/buildroot-mipsel/toolchain/buildroot-2015.02/output/build/host-gcc-final-4.9.2/build'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory
> `/home/alex/optware/buildroot-mipsel/toolchain/buildroot-2015.02/output/build/host-gcc-final-4.9.2/build'
> make: ***
> [/home/alex/optware/buildroot-mipsel/toolchain/buildroot-2015.02/output/build/host-gcc-final-4.9.2/.stamp_built]
> Error 2


After some manual hacking, the build went on until similar issues with
libstdc++. To fix these issues, I wrote a gcc-4.9.2 patch to force '-fPIC'
flags by editing several Makefile.in files. See
attached 920-libatomic-libstdc++-fPIC.patch

The second issue became evident while I was trying to use a cross-compiled
native gcc on the target. I didn't save the exact output, but it was
complaining that some of the crt* files was compiled with -mhard-float,
while some other --- with -msoft-float. After some googling, I found the
issue in gcc's bug tracker:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64569
Luckily, the fix to the problem was backported from gcc 5 by *mpf* (many
thanks to him). I extracted the diff, applied it as well, and, finally,
everything works fine now. See attached
930-mips-soft-float-for-binutils-2.25.patch


I'm not really knowledgeable in buildroot, but, to anyone who is, I'd like
to say that you can feel free to submit patches using these workarounds. I
just thought that it is right to give back to the community whose work you
use :)

-- 
Best regards,
Alex Potapenko
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150414/7ca71814/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 47897 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150414/7ca71814/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 920-libatomic-libstdc++-fPIC.patch
Type: application/octet-stream
Size: 2592 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150414/7ca71814/attachment-0001.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 930-mips-soft-float-for-binutils-2.25.patch
Type: application/octet-stream
Size: 4524 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150414/7ca71814/attachment-0002.obj>
