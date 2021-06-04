From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Jun 2021 23:38:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/lvm2: disable parallel build
In-Reply-To: <CAPi7W82V4XDKO_eiShfaR5VUUNANZ3K316Kx8MrMA6MuKMqPmA@mail.gmail.com>
References: <20210516202828.321469-1-fontaine.fabrice@gmail.com>
 <20210517074411.GR2506@scaer>
 <CAPi7W82V4XDKO_eiShfaR5VUUNANZ3K316Kx8MrMA6MuKMqPmA@mail.gmail.com>
Message-ID: <20210604213832.GK168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, Pascal, All,

On 2021-06-04 20:37 +0200, Fabrice Fontaine spake thusly:
> Le lun. 17 mai 2021 ? 09:44, Yann E. MORIN <yann.morin.1998@free.fr> a ?crit :
> > On 2021-05-16 22:28 +0200, Fabrice Fontaine spake thusly:
> > > Parallel build is broken since bump to version 2.03.13 in commit
> > > 80997acd3587a4528f8877d9e8a502c39ed800c5:
> > [--SNIP--]
> > > Fixes:
> > >  - http://autobuild.buildroot.org/results/30359c351a6ce2f9139494a531e036f0b0406ccf
[--SNIP--]
> > > +# parallel build issues
> > > +LVM2_MAKE = $(MAKE1)
> > This is unfortuantely not sufficient:
> Even if this is not sufficient, disabling parallel build is still
> needed to avoid the build failure related to dmsetup being truncated
> or main being undefined.
> There are 5 build failures today due to this issue.

Indeed, there is quite some funny breakage...

For example;
    http://autobuild.buildroot.org/results/995/995f46ee0033e34261ba7b24b61c41e7a088602b/

    >>> lvm2 2.03.12 Installing to staging directory
    [...]
        [INSTALL] ioctl/libdevmapper.so
        [CC] dmsetup.c
    /usr/bin/make -C lib install_device-mapper
        [CC] dmsetup.c
    [...]
        [CC] dmsetup
        [CC] dmsetup
    /nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /nvme/rc-buildroot-test/scripts/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/Scrt1.o: in function `_start':
    (.text+0x54): undefined reference to `main'
    collect2: error: ld returned 1 exit status
    Makefile:60: recipe for target 'dmsetup' failed

Or:

    http://autobuild.buildroot.org/results/a4e/a4ea87da502272dc2e677123b6fbcb0c23106f0b/

    >>> lvm2 2.03.12 Installing to staging directory
    [...]
        [CC] dmsetup
    /home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/9.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: /home/giuliobenetti/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-musleabihf/sysroot/lib/Scrt1.o: in function `_start_c':
    Scrt1.c:(.text._start_c+0x5c): undefined reference to `main'
    collect2: error: ld returned 1 exit status
    make[3]: *** [Makefile:61: dmsetup] Error 1
    make[3]: Leaving directory '/home/giuliobenetti/autobuild/run/instance-3/output-1/build/lvm2-2.03.12/libdm/dm-tools'
    make[2]: *** [../libdm/make.tmpl:315: dm-tools.device-mapper] Error 2
    make[2]: *** Waiting for unfinished jobs....
        [CC] dmsetup
        [INSTALL] dmsetup
    [...]

Similar traces in either case: it tries to build dmsetup twice, at
intall time instead of build time.

So. I can accept that there is a parallel build issue [0], but this is
even more involved than that, because the build should not happen at
install time, and it should not be duplicated. With MAKE1, we have an
install sequence that looks like:

    >>> lvm2 2.03.12 Installing to staging directory
    [...]
    /usr/bin/make -C dm-tools install_device-mapper
        [CC] dmsetup.c
        [CC] dmsetup
        [INSTALL] dmsetup
    /usr/bin/make -C dm-tools device-mapper
    make[4]: Nothing to be done for 'device-mapper'.
    /usr/bin/make -C dm-tools
    make[4]: Nothing to be done for 'all'.
    /usr/bin/make -C dm-tools install
        [INSTALL] dmsetup
        [INSTALL] ioctl/libdevmapper.so
        [INSTALL] libdevmapper.pc
        [INSTALL] libdevmapper.h

I guess we need to review more in-depth how we configure/build/install
the lvm2 package...

Pascal, this conditional installation is your deed. Could you have a
look, please?

[0] I was only able to get the install failure after 6 successful
builds, so it does indeed smell like a parallel issue.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
