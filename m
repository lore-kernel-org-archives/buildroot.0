From: William Tambe <tambewilliam@gmail.com>
Date: Sat, 9 May 2020 16:08:15 -0400
Subject: [Buildroot] nano package fail to build; cannot include curses.h
In-Reply-To: <20200509162722.15880f08@windsurf.home>
References: <CAF8i9mNJroNYDMzHDOjwpWX6uwNOY=BN3Yj+RwmgfFqnB2OpLA@mail.gmail.com>
 <20200509120149.0540a23c@windsurf.home>
 <CAF8i9mMsfvAknQ-hOxgf8gUqx_6-8WvPFtZW=agV_fZi1Ek3QA@mail.gmail.com>
 <20200509151306.7c58cf1d@windsurf.home>
 <CAF8i9mP7Ztb6E-WQyN-HEho53m9+q8eM1tT6dyKEW=UvMHX8eA@mail.gmail.com>
 <20200509162722.15880f08@windsurf.home>
Message-ID: <CAF8i9mNSz6yHSj5DrdZd3CJHaX1zQXgYL3nMUBDXMHyC-C4kxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, May 9, 2020 at 10:27 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sat, 9 May 2020 09:43:44 -0400
> William Tambe <tambewilliam@gmail.com> wrote:
>
> > > In any case, since we don't have access to your toolchain, we have no
> > > way to reproduce/investigate. On other architectures, nano builds fine.
> >
> > My issue seems to be that it is not able to find curses.h headers
> > which buildroot already installed at the following path:
> > ./target/usr/include/curses.h
> > ./target/usr/include/ncurses.h
> > ./host/iron-buildroot-linux-gnu/sysroot/usr/include/curses.h
> > ./host/iron-buildroot-linux-gnu/sysroot/usr/include/ncurses.h
> > ./host/include/ncurses/curses.h
> > ./host/include/ncurses/ncurses.h
> >
> > Using something like this in nano.mk didn't help either:
> >
> > NANO_MAKE_ENV += \
> >         $(TARGET_MAKE_ENV) \
> >         CFLAGS="$(TARGET_CFLAGS) -I$(HOST_DIR)/include/ncurses"
>
> This is terribly wrong: you are point to the headers of host libraries,
> while cross-compiling code for the target.

Adjusting above NANO_MAKE_ENV, I am able to get a successfully
compilation using:

NANO_CONF_ENV += \
       CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include"

Not sure if above is still terribly wrong.

>
> > Any other suggestion I could try in debugging the issue I am having ?
>
> Can we have access to your "iron" toolchain to reproduce ?
Unfortunately, I am unable to do so at this time.
>
> Normally, the way it works is that Buildroot generates a toolchain
> wrapper, which calls your toolchain "gcc" after adding
> --sysroot=$(STAGING_DIR), and therefore, gcc should automatically find
> headers in $(STAGING_DIR)/usr/include.
>
> I'd suggest to create a simple C file with just #include <ncurses.h>,
> and try to build it with $(HOST_DIR)/bin/iron-...-gcc. If that doesn't
> work, pass BR2_DEBUG_WRAPPER=2 when calling gcc, and check what gets
> passed to the gcc of your toolchain.

I created a simple C file with just #include <ncurses.h> as you suggested.

Below is output that I get using -v in addition to
BR2_DEBUG_WRAPPER=2; and it looks like the issue I am having is due to
gcc not having an include path such as /usr/include to which sysroot
would have been prepended in order to find
/buildroot-build/host/iron-buildroot-linux-gnu/sysroot/usr/include/ncurses.h:

Toolchain wrapper was called with:
    'host/bin/iron-elf-gcc'
    'test.c'
    '-v'
Toolchain wrapper executing:
    '/opt/iron-toolchain/bin/iron-elf-gcc'
    '--sysroot'
    '/buildroot-build/host/iron-buildroot-linux-gnu/sysroot'
    'test.c'
    '-v'
Using built-in specs.
COLLECT_GCC=/opt/iron-toolchain/bin/iron-elf-gcc
COLLECT_LTO_WRAPPER=/opt/iron-toolchain/lib/gcc/iron-elf/9.2.0/lto-wrapper
Target: iron-elf
Configured with: ../iron-toolchain/gcc/configure --target=iron-elf
--prefix=/opt/iron-toolchain --libexecdir=/opt/iron-toolchain/lib
--without-headers --disable-libssp --enable-languages=c
Thread model: single
gcc version 9.2.0 (GCC)
COLLECT_GCC_OPTIONS='-v'
 /opt/iron-toolchain/lib/gcc/iron-elf/9.2.0/cc1 -quiet -v -isysroot
/buildroot-build/host/iron-buildroot-linux-gnu/sysroot test.c -quiet
-dumpbase test.c -auxbase test -version -o /tmp/cczrjaRs.s
GNU C17 (GCC) version 9.2.0 (iron-elf)
        compiled by GNU C version 9.3.0, GMP version 6.1.0, MPFR
version 3.1.4, MPC version 1.0.3, isl version isl-0.18-GMP

GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
ignoring nonexistent directory
"/opt/iron-toolchain/lib/gcc/iron-elf/9.2.0/../../../../iron-elf/sys-include"
#include "..." search starts here:
#include <...> search starts here:
 /opt/iron-toolchain/lib/gcc/iron-elf/9.2.0/include
 /opt/iron-toolchain/lib/gcc/iron-elf/9.2.0/include-fixed
 /opt/iron-toolchain/lib/gcc/iron-elf/9.2.0/../../../../iron-elf/include
End of search list.
GNU C17 (GCC) version 9.2.0 (iron-elf)
        compiled by GNU C version 9.3.0, GMP version 6.1.0, MPFR
version 3.1.4, MPC version 1.0.3, isl version isl-0.18-GMP

GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
Compiler executable checksum: b690504595787edc69005bca00244321
test.c:1:10: fatal error: ncurses.h: No such file or directory
    1 | #include <ncurses.h>
      |          ^~~~~~~~~~~
compilation terminated.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
