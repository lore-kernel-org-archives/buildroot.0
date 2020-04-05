From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Apr 2020 11:09:13 +0200
Subject: [Buildroot] [PATCH 1/2] support/testing: update the ARM
 toolchain used for the systemd init tests
In-Reply-To: <20200405084428.GJ22325@scaer>
References: <20200404220217.362122-1-romain.naour@gmail.com>
 <20200405084428.GJ22325@scaer>
Message-ID: <20200405090913.GK22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-04-05 10:44 +0200, Yann E. MORIN spake thusly:
> On 2020-04-05 00:02 +0200, Romain Naour spake thusly:
> > As reported on the mailing list, there is a build issue with systemd 245
> > when using gcc < 5.0:
> > http://lists.busybox.net/pipermail/buildroot/2020-April/278931.html
[--SNIP--]
> >          BR2_TOOLCHAIN_EXTERNAL=y
> > +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> > +        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> > +        BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi--glibc--stable-2017.05-toolchains-1-1.tar.bz2"
> I'd rather we use one of the known pre-built toolchains that is
> available from the menuconfig. Unfortiunately, for armv5, we have no
> better than the codesourcery one. But for armv7, we have a darn-recent
> toolchain from ARM.

Of course, I mistakenly replied to your v1 of your patchset, but this is
also valid for your v2...

Regards,
Yann E. MORIN.

> So I think we just need to add BR2_cortex_a7 to this defconfig:
> 
>     diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
>     index 0ac18cb623..d679081768 100644
>     --- a/support/testing/tests/init/test_systemd.py
>     +++ b/support/testing/tests/init/test_systemd.py
>     @@ -6,6 +6,7 @@ class InitSystemSystemdBase(InitSystemBase):
>          config = \
>              """
>              BR2_arm=y
>     +        BR2_cortex_a7=y
>              BR2_TOOLCHAIN_EXTERNAL=y
>              BR2_INIT_SYSTEMD=y
>              BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> 
> Note that I am not saying the bootlin toolchains are bad. I am instead
> saying that we should test with what is readily available in menuconfig,
> so that we know users can have a working starting point.
> 
> Runtime tests are not (IMHO) about testing corner cases, but to ensure
> that the packages do build and run as expected in standard conditions.
> 
> Bootlin toolchains are not in the menuconfig, while the ARM toolchain
> is, and that is what users will use 99.99% of the time. Hence we should
> test with that.
> 
> Regards,
> Yann E. MORIN.
> 
> > +        BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
> > +        BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> > +        BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
> > +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> >          BR2_INIT_SYSTEMD=y
> >          BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> >          BR2_LINUX_KERNEL=y
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
