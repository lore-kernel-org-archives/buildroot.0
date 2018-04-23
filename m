From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Apr 2018 15:42:43 +0200
Subject: [Buildroot] [PATCH] binutils: replace hard-links with
 soft-links to fix rpath
In-Reply-To: <20180423150412.145444ff@windsurf>
References: <20180422122350.16293-1-thomas.petazzoni@bootlin.com>
 <20180423092228.GO12688@scaer> <20180423150412.145444ff@windsurf>
Message-ID: <20180423134243.GA22035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-04-23 15:04 +0200, Thomas Petazzoni spake thusly:
> On Mon, 23 Apr 2018 11:22:28 +0200, Yann E. MORIN wrote:
> > However, I wanted to reproduce the build failures, and here, with
> > current master, so I built a toolchain with buildroot [0], but none
> > of binutils programs is linked with libfl:
[--SNIP--]
> And indeed in the build process, I have:
> /bin/sh ./libtool --tag=CC   --mode=link /usr/bin/gcc -W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow -Wstack-usage=262144 -I./../zlib -O2 -I/home/thomas/projets/buildroot/output/host/include  -L/home/thomas/projets/buildroot/output/host/lib -Wl,-rpath,/home/thomas/projets/buildroot/output/host/lib -o ar arparse.o arlex.o ar.o not-ranlib.o arsup.o rename.o binemul.o emul_vanilla.o bucomm.o version.o filemode.o ../bfd/libbfd.la ../libiberty/libiberty.a -lfl  -ldl

And I too have a similar linking command, with your defconfig:

/bin/sh ./libtool --tag=CC   --mode=link /usr/bin/gcc -W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow -Wstack-usage=262144 -I./../zlib -O2 -I/home/ymorin/dev/buildroot/O2/host/include  -static-libstdc++ -static-libgcc -L/home/ymorin/dev/buildroot/O2/host/lib -Wl,-rpath,/home/ymorin/dev/buildroot/O2/host/lib -o ar arparse.o arlex.o ar.o not-ranlib.o arsup.o rename.o binemul.o emul_vanilla.o bucomm.o version.o filemode.o ../bfd/libbfd.la ../libiberty/libiberty.a -lfl  -ldl

which is turned into an actual link command:

libtool: link: /usr/bin/gcc -W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow -Wstack-usage=262144 -I./../zlib -O2 -I/home/ymorin/dev/buildroot/O2/host/include -static-libstdc++ -static-libgcc -Wl,-rpath -Wl,/home/ymorin/dev/buildroot/O2/host/lib -o ar arparse.o arlex.o ar.o not-ranlib.o arsup.o rename.o binemul.o emul_vanilla.o bucomm.o version.o filemode.o -L/home/ymorin/dev/buildroot/O2/host/lib ../bfd/.libs/libbfd.a -L/home/ymorin/dev/buildroot/O2/build/host-binutils-arc-2018.03-rc1/zlib -lz ../libiberty/libiberty.a /home/ymorin/dev/buildroot/O2/host/lib/libfl.so -lm -ldl -Wl,-rpath -Wl,/home/ymorin/dev/buildroot/O2/host/lib -Wl,-rpath -Wl,/home/ymorin/dev/buildroot/O2/host/lib

So we can see that, yes, libfl.so *is* pulled in. Yet:

readelf -d host/arc-buildroot-linux-uclibc/bin/ar
Dynamic section at offset 0xd6a30 contains 29 entries:
  Tag        Type                         Name/Value
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
 0x000000000000001d (RUNPATH)            Library runpath: [/home/ymorin/dev/buildroot/O2/host/lib]
[--SNIP--]

So, WTF?

I'll be trying on another machine with an older system...

Regards,
Yann E. MORIN.

> To be honest, this is a bit weird, because for the other binutils,
> which we build from a tarball, host-flex is not needed, and we don't
> link against libfl.
> 
> See binutils/Makefile.am:
> 
> ar_LDADD = $(BFDLIB) $(LIBIBERTY) $(LEXLIB) $(LIBINTL)
> 
> and binutils/configure does check for the availability of a lex library. 
> 
> That being said, regardless of libfl specifically, I believe this
> problem of hard links between binaries in different directories really
> affects binutils anyway, and therefore, it makes sense to fix those to
> use symlinks instead.
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
