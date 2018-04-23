From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Apr 2018 15:04:12 +0200
Subject: [Buildroot] [PATCH] binutils: replace hard-links with
 soft-links to fix rpath
In-Reply-To: <20180423092228.GO12688@scaer>
References: <20180422122350.16293-1-thomas.petazzoni@bootlin.com>
 <20180423092228.GO12688@scaer>
Message-ID: <20180423150412.145444ff@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 Apr 2018 11:22:28 +0200, Yann E. MORIN wrote:

> So I wanted to test this, and it does what's on the can.
> 
> However, I wanted to reproduce the build failures, and here, with
> current master, so I built a toolchain with buildroot [0], but none
> of binutils programs is linked with libfl:
> 
>     $ for i in host/arc-buildroot-linux-uclibc/bin/*; do
>         readelf -d "${i}" |grep NEEDED
>     done |sort -u
>      0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
>      0x0000000000000001 (NEEDED)             Shared library: [libdl.so.2]
> 
> I checked, and I don't have libfl on my system, neither static not
> shared, so it cant even have picked the static one from my system.
> 
> And indeed, libnl can build:
> 
>     checking the archiver (/home/ymorin/dev/buildroot/O/host/bin/arc-buildroot-linux-uclibc-ar)interface... ar
> 
> So, I don't see the point...
> 
> [0] with this defconfig:
> BR2_arcle=y
> BR2_archs38=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y

Here:

$ cat defconfig 
BR2_arcle=y
$ make host-binutils
$ readelf -d output/host/arc-buildroot-linux-uclibc/bin/ar 

Dynamic section at offset 0xb8de0 contains 28 entries:
  Tag        Type                         Name/Value
 0x0000000000000001 (NEEDED)             Shared library: [libfl.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
 0x000000000000000f (RPATH)              Library rpath: [/home/thomas/projets/buildroot/output/host/lib]

And indeed in the build process, I have:

/bin/sh ./libtool --tag=CC   --mode=link /usr/bin/gcc -W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow -Wstack-usage=262144 -I./../zlib -O2 -I/home/thomas/projets/buildroot/output/host/include  -L/home/thomas/projets/buildroot/output/host/lib -Wl,-rpath,/home/thomas/projets/buildroot/output/host/lib -o ar arparse.o arlex.o ar.o not-ranlib.o arsup.o rename.o binemul.o emul_vanilla.o bucomm.o version.o filemode.o ../bfd/libbfd.la ../libiberty/libiberty.a -lfl  -ldl

To be honest, this is a bit weird, because for the other binutils,
which we build from a tarball, host-flex is not needed, and we don't
link against libfl.

See binutils/Makefile.am:

ar_LDADD = $(BFDLIB) $(LIBIBERTY) $(LEXLIB) $(LIBINTL)

and binutils/configure does check for the availability of a lex library. 

That being said, regardless of libfl specifically, I believe this
problem of hard links between binaries in different directories really
affects binutils anyway, and therefore, it makes sense to fix those to
use symlinks instead.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
