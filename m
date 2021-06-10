From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu, 10 Jun 2021 22:26:32 +0300
Subject: [Buildroot] [PATCH v2 01/28] boot/arm-trusted-firmware: option
 to disable stack protection
In-Reply-To: <CAEyMn7aqWF6ki5H-Uv_rGezusRwP3oKrba2zj31OAeb-ribsQQ@mail.gmail.com>
References: <20210609200003.2866122-1-geomatsi@gmail.com>
 <20210609200003.2866122-2-geomatsi@gmail.com>
 <20210609234015.1de2583f@windsurf> <YME6zLv85ivVOkpi@curiosity>
 <CAEyMn7aqWF6ki5H-Uv_rGezusRwP3oKrba2zj31OAeb-ribsQQ@mail.gmail.com>
Message-ID: <YMJnaP4PBxaOxAyU@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Heiko

> > > > +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_DISABLE_SSP
> > > > +   bool "Disable stack protection"
> > > > +   help
> > > > +     Select this option to explicitly disable stack protection checks in GCC.
> > > > +     Such checks need to be disabled if ATF platform port does not implement
> > > > +     plat_get_stack_protector_canary() hook.
> > >
> > > It's a bit annoying that we have to tell TF-A about this. If TF-A
> > > doesn't implement plat_get_stack_protector_canary() for a certain
> > > platform, why does it try to enable SSP ? It feels like something that
> > > should be fixed in TF-A.
> >
> > TF-A does not attempt to enable those protection checks. This is
> > controlled by its ENABLE_STACK_PROTECTOR build flag, which default
> > value is 'none'. This is Buildroot who tries to enable TF-A stack
> > protection checks depending on BR2_SSP_* toolchain features only:
> > see arm-trusted-firmware.mk.
> 
> with commit 810ba387 we enabled SSP by default. And in the ATF
> makefile we map that setting to atf ENABLE_STACK_PROTECTOR setting. As
> this we force to use SSP in atf. But you're right this should be
> handled in the TF-A stack. I tried to get some feedback from the TF-A
> guys [1] but there is no helpful answer. So for now I think it is a
> quick solution to make it possible to disable SSP for ATF like that.
> 
> On the other hand, does it make any sense at all to automatically take
> over the SSP setting from the compiler options?
> 
> [1] https://lists.trustedfirmware.org/pipermail/tf-a/2021-May/001152.html

I would also agree that it might not be always convenient to automatically
infer TF-A SSP settings from the compiler options. Imagine the case when
secure memory constraints become an issue and all the extra features
need to be tuned or disabled in order to shrink TF-A firmware image.

So what if we leave the right to choose to the user ? I mean something
like the following menu in TF-A Config.in:

choice
        prompt "TF-A GCC stack protection"
        help
          Select TF-A GCC stack protection. Note that for all values
	  other than 'none' the plat_get_stack_protector_canary()
	  platform hook needs to be implemented.

config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_NONE
        bool "none"

config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_DEFAULT
        bool "default"
        depends on BR2_SSP_REGULAR

config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_STRONG
        bool "strong"
        depends on BR2_SSP_STRONG

config BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP_ALL
        bool "all"
        depends on BR2_SSP_ALL

endchoice

Regards,
Sergey
