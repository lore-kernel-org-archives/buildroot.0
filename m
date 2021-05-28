From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 May 2021 23:42:55 +0200
Subject: [Buildroot] [Bug 13586] New: grub failure with BR2_OPTIMIZE_3
In-Reply-To: <CANabuZfVw+ccU8rvVQ67HPnkGMKWTPFpYELbTEVcpiXv6kdhpQ@mail.gmail.com>
References: <bug-13586-163@https.bugs.busybox.net/>
 <CANabuZcix3uT0SwKotJoPBAu6WvZ_SVQ99y=navBARH=GRKZ9w@mail.gmail.com>
 <20210527154435.GV3208066@scaer>
 <638b4284c5ac4639b393d2ade58994dc@AcuMS.aculab.com>
 <20210527203721.GA2788252@scaer>
 <CANabuZfVw+ccU8rvVQ67HPnkGMKWTPFpYELbTEVcpiXv6kdhpQ@mail.gmail.com>
Message-ID: <20210528214255.GK2788252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas, All,

On 2021-05-28 15:48 +0200, Andreas Hilse via buildroot spake thusly:
> > Would you please send a patch with such a workaround, please?
> 
> I tried to workaround in grub2.mk setting -Os as additional flags in
> the TARGET_* variables for GRUB2_CONF_ENV as that seemed the right
> place according to this comment:
> # Grub2 is kind of special: it considers CC, LD and so on to be the
> # tools to build the host programs and uses TARGET_CC, TARGET_CFLAGS,
> # TARGET_CPPFLAGS, TARGET_LDFLAGS to build the bootloader itself.
> ...
> GRUB2_CONF_ENV = \
>     CPP="$(TARGET_CC) -E" \
>     TARGET_CC="$(TARGET_CC)" \
>     TARGET_CFLAGS="$(TARGET_CFLAGS) -Os" \
>     TARGET_CPPFLAGS="$(TARGET_CPPFLAGS) -Os -fno-stack-protector" \
>     TARGET_LDFLAGS="$(TARGET_LDFLAGS) -Os" \
>     TARGET_NM="$(TARGET_NM)" \
>     TARGET_OBJCOPY="$(TARGET_OBJCOPY)" \
>     TARGET_STRIP="$(TARGET_CROSS)strip"
> 
> But -O2 still is in the build commands in a place after -Os and thus
> takes preference.
> Do you have any suggestions for a different workaround or on how to
> fix the above one?

So, grub2 is indeed... special...

So I took the above claim aboce variable naming and their usage, and
applied this patch:

    diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
    index af16ee91e1..0e5ab89301 100644
    --- a/boot/grub2/grub2.mk
    +++ b/boot/grub2/grub2.mk
    @@ -118,9 +118,9 @@ HOST_GRUB2_CONF_ENV = \
     GRUB2_CONF_ENV = \
            CPP="$(TARGET_CC) -E" \
            TARGET_CC="$(TARGET_CC)" \
    -       TARGET_CFLAGS="$(TARGET_CFLAGS)" \
    -       TARGET_CPPFLAGS="$(TARGET_CPPFLAGS) -fno-stack-protector" \
    -       TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
    +       TARGET_CFLAGS="$(filter-out -O%,$(TARGET_CFLAGS)) -Os" \
    +       TARGET_CPPFLAGS="$(filter-out -O%,$(TARGET_CPPFLAGS)) -Os -fno-stack-protector" \
    +       TARGET_LDFLAGS="$(filter-out -O%,$(TARGET_LDFLAGS)) -Os" \
            TARGET_NM="$(TARGET_NM)" \
            TARGET_OBJCOPY="$(TARGET_OBJCOPY)" \
            TARGET_STRIP="$(TARGET_CROSS)strip"

And I configured with -Ofast (which is used nowhere in grub2's source
tree, so I know it comes from Buildroot when I see it).

So, what's the CONF_ENV looking like? Seems my -Ofast is removed, and
the -Os is added:

    $ make printvars VARS=GRUB2_CONF_ENV
    ... \
    TARGET_CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=1 -Os" \
    TARGET_CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fno-stack-protector" \
    TARGET_LDFLAGS=" -Os" \
    ...

So far, so good.

But what happens when I actually build?

    $ make grub2-build >build.log
    [...]
    $ grep kern/parser.c build.log     # the file patched by the offending patch)
    .../x86_64-linux-gcc \
        -DHAVE_CONFIG_H -I. -I.. \
        -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fno-stack-protector \
        [...] \
        -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=1 -Os
        [...] \
        -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast  -D_FORTIFY_SOURCE=1 \
        -c -o kern/kernel_exec-parser.o `test -f 'kern/parser.c' || echo './'`kern/parser.c

He, what? Where's that -Ofast coming from?

    $ grep ./configure build.log
    cd /home/ymorin/dev/buildroot/O/build/grub2-2.04/ && rm -rf config.cache && \
    PATH="..." \
    [...] \
    CFLAGS_FOR_BUILD="-O2 -I/home/ymorin/dev/buildroot/O/host/include" \
    CXXFLAGS_FOR_BUILD="-O2 -I/home/ymorin/dev/buildroot/O/host/include" \
    [...] \
    CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" \
    CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast -D_FORTIFY_SOURCE=1" \
    CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Ofast  -D_FORTIFY_SOURCE=1" \
    LDFLAGS="" \
    FCFLAGS=" -Ofast " \
    FFLAGS=" -Ofast " \
    [...] \
    TARGET_CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=1 -Os" \
    TARGET_CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fno-stack-protector" \
    TARGET_LDFLAGS=" -Os" \
    [...] \
    ./configure \
    [...]

OK, so -Ofast still comes from a few locations;

  - CFLAGS_FOR_BUILD or CXXFLAGS_FOR_BUILD: unlikely, or we'd also note
    include path pointing to the host dir, which is not the case

  - FCFLAGS, FFLAGS: unlikely, this is not fortran

  - CXXFLAGS: unlikely, this is not C++ code

We're left with just CPPFLAGS and CFLAGS. Those are not supposed to be
used, but they are...

Meh... :-(

So, maybe things have changed from way back when we wrote that comment
(back in 2014, seven years ago!), or maybe we did not undestand all of
it, or maybe we did not explain it properly, or a bit of all of that...

In any case, we might want to also override CFLAGS and CPPFLAGS in the
same vein as the above patch does for TARGET_CFLAGS et al.

Care to have a look at that, see if it fixes the issue, and you can get
a bootable grub2, please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
