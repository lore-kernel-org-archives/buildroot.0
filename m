From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 10 Jun 2021 08:36:19 +0200
Subject: [Buildroot] [PATCH v2 01/28] boot/arm-trusted-firmware: option
 to disable stack protection
In-Reply-To: <YME6zLv85ivVOkpi@curiosity>
References: <20210609200003.2866122-1-geomatsi@gmail.com>
 <20210609200003.2866122-2-geomatsi@gmail.com>
 <20210609234015.1de2583f@windsurf> <YME6zLv85ivVOkpi@curiosity>
Message-ID: <CAEyMn7aqWF6ki5H-Uv_rGezusRwP3oKrba2zj31OAeb-ribsQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Hi Sergey,

Am Do., 10. Juni 2021 um 00:03 Uhr schrieb Sergey Matyukevich
<geomatsi@gmail.com>:
>
> Hello Thomas,
>
> > > +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_DISABLE_SSP
> > > +   bool "Disable stack protection"
> > > +   help
> > > +     Select this option to explicitly disable stack protection checks in GCC.
> > > +     Such checks need to be disabled if ATF platform port does not implement
> > > +     plat_get_stack_protector_canary() hook.
> >
> > It's a bit annoying that we have to tell TF-A about this. If TF-A
> > doesn't implement plat_get_stack_protector_canary() for a certain
> > platform, why does it try to enable SSP ? It feels like something that
> > should be fixed in TF-A.
>
> TF-A does not attempt to enable those protection checks. This is
> controlled by its ENABLE_STACK_PROTECTOR build flag, which default
> value is 'none'. This is Buildroot who tries to enable TF-A stack
> protection checks depending on BR2_SSP_* toolchain features only:
> see arm-trusted-firmware.mk.

with commit 810ba387 we enabled SSP by default. And in the ATF
makefile we map that setting to atf ENABLE_STACK_PROTECTOR setting. As
this we force to use SSP in atf. But you're right this should be
handled in the TF-A stack. I tried to get some feedback from the TF-A
guys [1] but there is no helpful answer. So for now I think it is a
quick solution to make it possible to disable SSP for ATF like that.

On the other hand, does it make any sense at all to automatically take
over the SSP setting from the compiler options?

[1] https://lists.trustedfirmware.org/pipermail/tf-a/2021-May/001152.html

>
> Regards,
> Sergey
