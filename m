From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Mon, 12 Jan 2009 13:48:32 +0100
Subject: [Buildroot] arch support
In-Reply-To: <87vdskhjht.fsf@macbook.be.48ers.dk>
References: <87ljtgj44z.fsf@macbook.be.48ers.dk>	<496B227A.4060809@cetrtapot.si>
	<87vdskhjht.fsf@macbook.be.48ers.dk>
Message-ID: <496B3C20.1080101@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Hinko" == Hinko Kocevar <hinko.kocevar@cetrtapot.si> writes:
> 
> Hi,
> 
>  >> cris: broken in kernel headers
> 
>  Hinko> I have similar setup of toolchain packages and works for me
>  Hinko> here, except for linux headers which are 2.6.26. I'll try to
>  Hinko> compile it with 2.6.28, if IIRC there were some arch/cris
>  Hinko> folder movements in 2.6.28 that could be the culprit here.
> 
> Ok, thanks.
> 

Here it goes:
 - some minor fixes to buildroot
  cris_buildroot.patch

 - two cris patches to be placed in toolchain/kernel-headers subdir in order to build toolchain and linux kernel 2.6.28
  linux-2.6.28-cris-headers.patch
  linux-2.6.28-cris-objcopy-flags.patch

With these patch set you should be able to build uClibc based toolchain with above mentioned versions of packages. I haven't tried the toolchain nor the Linux kernel image. I'll do that sometime later this week, because I'm not sure if I need to patch the gcc 4.3.2 with another cris related patch (toolchain/gcc/4.3.x/999-gcc-4.3.0-cris-compiler-error-fix.patch). Otherwise compilation of kernel sources in some ipv4 related code fails with internal compiler error.

Note: I was unable to retrieve mpfr 2.3.0 so I used 2.3.1 instead (that I had laying around).

hinkok at alala /work/buildroot.new $ ./build_cris/staging_dir/usr/bin/cris-linux-uclibc-gcc -v
Using built-in specs.
Target: cris-linux-uclibc
Configured with: /work/buildroot.new/toolchain_build_cris/gcc-4.3.2/configure --prefix=/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu --target=cris-linux-uclibc --enable-languages=c --with-sysroot=/work/buildroot.new/build_cris/staging_dir --with-build-time-tools=/work/buildroot.new/build_cris/staging_dir/usr/cris-linux-uclibc/bin --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --enable-shared --with-gmp=/work/buildroot.new/toolchain_build_cris/gmp --with-mpfr=/work/buildroot.new/toolchain_build_cris/mpfr --disable-nls --enable-threads --disable-multilib --disable-decimal-float --disable-largefile : (reconfigured) /work/buildroot.new/toolchain_build_cris/gcc-4.3.2/configure --prefix=/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu --target=cris-linux-uclibc --enable-languages=c --with-sysroot=/work/buildroot.new/build_cris/staging_dir --with-build-time-tools=/work/buildroot.new/build_cris/staging_dir/usr/cris-linux-uclibc/bin --disable-__cxa_atex
it --enable-target-optspace --with-gnu-ld --enable-shared --with-gmp=/work/buildroot.new/toolchain_build_cris/gmp --with-mpfr=/work/buildroot.new/toolchain_build_cris/mpfr --disable-nls --enable-threads --disable-multilib --disable-decimal-float --disable-largefile : (reconfigured) /work/buildroot.new/toolchain_build_cris/gcc-4.3.2/configure --prefix=/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu --target=cris-linux-uclibc --enable-languages=c --with-sysroot=/work/buildroot.new/build_cris/staging_dir --with-build-time-tools=/work/buildroot.new/build_cris/staging_dir/usr/cris-linux-uclibc/bin --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --enable-shared --with-gmp=/work/buildroot.new/toolchain_build_cris/gmp --with-mpfr=/work/buildroot.new/toolchain_build_cris/mpfr --disable-nls --enable-threads --disable-multilib --disable-decimal-float --disable-largefile
Thread model: posix
gcc version 4.3.2 (GCC) 


HTH,
Hinko
-- 
Hinko Ko?evar, OSS developer
?ETRTA POT, d.o.o.
Planina 3, 4000 Kranj, SI EU
tel     ++386 (0) 4 280 66 03
e-mail  hinko.kocevar at cetrtapot.si
http    www.cetrtapot.si

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: linux-2.6.28-cris-headers.patch
Url: http://lists.busybox.net/pipermail/buildroot/attachments/20090112/b084a3ec/attachment.diff 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: linux-2.6.28-cris-objcopy-flags.patch
Url: http://lists.busybox.net/pipermail/buildroot/attachments/20090112/b084a3ec/attachment-0001.diff 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: cris_buildroot.patch
Url: http://lists.busybox.net/pipermail/buildroot/attachments/20090112/b084a3ec/attachment-0002.diff 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: 999-gcc-4.3.0-cris-compiler-error-fix.patch
Url: http://lists.busybox.net/pipermail/buildroot/attachments/20090112/b084a3ec/attachment-0003.diff 
