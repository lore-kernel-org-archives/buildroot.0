From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2010 19:56:34 +0100
Subject: [Buildroot] backtrace patch and execinfo.h missing on uclibc
In-Reply-To: <9e4ade691002141542g4d79371bt359c11f81a4b572c@mail.gmail.com>
References: <9e4ade691002132326i3d3261afja3e4513ec7c07f07@mail.gmail.com>
	<20100214114440.10260f67@surf>
	<9e4ade691002141542g4d79371bt359c11f81a4b572c@mail.gmail.com>
Message-ID: <20100220195634.3190ae60@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sebastian,

On Sun, 14 Feb 2010 20:42:54 -0300
Sebasti?n Treu <sebastian.treu@gmail.com> wrote:

> I made a fs with buildroot using uclibc with native tools to compile
> on an embedded device (some package can't be crosscompiled, or are
> hard to understand how). I have compiled successfully  a lot of
> packages, perl, gnutls, zlib, bzip, etc. I crosscompiled mysql (native
> I ran out of memory) successfull too, with the same toolchain (not
> actually the same, the one you use to crosscompile but the same that
> uses buildroot to build the native toolchain and the fs).
> 
> Using the native compiler and toolchain in the device to build
> ZoneMinder, I get an error about the header file missing: execinfo.h.
> I have read that this header is used to implement backtrace. The error
> is simply that "no such file or directory", and in fact that file
> isn't found by me when searching it in the native toolchain or in the
> crosscompile toolchain.

uClibc doesn't implement the backtrace() function, which is a
glibc-specific function.

You should compile ZoneMinder with -enable-crashtrace=no.

Anyway, I would recommend cross-compiling rather than doing native
compilation. The installation of development tools to the target is not
very well tested/supported in Buildroot.

> Trying to crosscompile I had another errors too, for example: "asm
> imposible constraint" but when looking the code, the line was the
> FD_ISSET macro from select. (?) Anyway, execinfo.h is not generated
> neither in the native nor in the cross.

Could you be more specific ? Which package ?

> I use openwrt too. I have seen that If I build a crosscompile
> toolchain with glibc, execinfo.h is located in the includes files, but
> there's no such file with uclibc. Now I'm using that toolchain to
> crosscompile all the things, make the openwrt kernel, the fs and see
> If it works. Unfortunately, openwrt doesn't build a native toolchain
> so I need to crosscompile everything.

As said above, backtrace() is a glibc-specific function, so any glibc
toolchain will contain it, while any uclibc toolchain won't contain
it.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
