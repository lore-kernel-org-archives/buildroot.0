From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jun 2016 09:25:27 +0200
Subject: [Buildroot] [PATCH v2 1/2] efivar: new package
In-Reply-To: <1461201836-6558-1-git-send-email-nunes.erico@gmail.com>
References: <1461201836-6558-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <20160613092527.708dab22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Apr 2016 22:23:55 -0300, Erico Nunes wrote:
> efivar contains tools and libraries to manipulate EFI variables.
> 
> This package has some restrictions to build. It needs uchar.h which
> apparently does not come in uClibc, and it also needs
> __bswap_constant_*() definitions which are only present in glibc.
> So, this package was limited to build with glibc toolchains.
> 
> Although it probably makes sense mostly on x86, x86-64 and aarch64
> architectures, there are no architecture specific limitations which
> would prevent it to build for other architectures, so this restriction
> was not imposed. This package has been build-tested additionaly on many
> architectures which support glibc, such as mips, MicroBlaze, sparc64,
> ppc64. There were some build flag issues found when building to some of
> these some architectures, although the flags can be also added in the
> general case, so they were added by default.
> 
> It has also been found that in some host systems it failed to build due
> to not generating the .pc files. This has been tracked to the use of
> make 3.81, so a patch was prepared for it and was submitted upstream.
> There's also a dependency on the linux/nvme.h header, which is somewhat
> conturbed, as it has appeared in user space linux headers 3.12 and in
> 4.4 it was renamed. This has been solved by restricting it to build with
> linux headers >= 3.12 and a patch from upstream was picked which fixes
> it for linux headers >= 4.4.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>

This package breaks the build on hosts where the host gcc is old:

/usr/bin/gcc -O2 -I/home/peko/autobuild/instance-2/output/host/usr/include -std=c99 -I/home/peko/autobuild/instance-2/output/build/efivar-0.23/src/include/efivar/  -specs=/home/peko/autobuild/instance-2/output/build/efivar-0.23/gcc.specs  -L.  -L/home/peko/autobuild/instance-2/output/host/lib -L/home/peko/autobuild/instance-2/output/host/usr/lib -Wl,-rpath,/home/peko/autobuild/instance-2/output/host/usr/lib    -I/home/peko/autobuild/instance-2/output/host/usr/include -DEFIVAR_BUILD_ENVIRONMENT -o makeguids makeguids.c guid.c -ldl 
cc1: error: unrecognized command line option "-std=gnu11"
cc1: error: unrecognized command line option "-Wmaybe-uninitialized"
cc1: error: unrecognized command line option "-flto"
cc1: error: unrecognized command line option "-std=gnu11"
cc1: error: unrecognized command line option "-Wmaybe-uninitialized"
cc1: error: unrecognized command line option "-flto"

This happens when you build the makeguids tool for the host: you're
passing cflags that are not supported by old versions of gcc.

Could you have a look at fixing this? Most likely, you don't need all
those cflags just to build makeguids.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
