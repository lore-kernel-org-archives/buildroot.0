From: Jaap Crezee <jaap@jcz.nl>
Date: Sun, 22 Nov 2015 13:42:36 +0100
Subject: [Buildroot] [PATCH 2/2 v3] package/nodejs: add version 4.1.2
In-Reply-To: <5651094A.5080607@mind.be>
References: <cover.1445291882.git.yann.morin.1998@free.fr>
 <eb34ab6d35a15dfbec70263091f58c3e7ec2efab.1445291882.git.yann.morin.1998@free.fr>
 <CAFGQKxcBe5fzTCrQQxBXH7OtAf_qy7v+5TeAfFxhzY1C9QhS8g@mail.gmail.com>
 <20151020162527.GA3738@free.fr>
 <CAFGQKxeC83GJHc5+kHb3gJyyeXdSMJ6fFrSL8eRQXCjPVaHQ_A@mail.gmail.com>
 <5650CBBE.4080604@jcz.nl> <5651094A.5080607@mind.be>
Message-ID: <5651B83C.1030701@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/22/15 01:16, Arnout Vandecappelle wrote:

Thanks for your follow up!

>  You have a good point. I don't think it's possible to have a NEON core without
> VFP floating point unit. Hm, looking at [1], NEON and FPU are independently
> optional, so theoretically you could have a Cortex-A9 with one but not the
> other. But that probably doesn't exist in practice (in fact, we don't know any
> Cortex-A9 that doesn't have both).

You are right, I dived further into it:

http://www.arm.com/cortex-a9.php

Advanced SIMD NEON? unit (Optional)

and

Cortex-A9 Floating-Point Unit (FPU)
(Optional)


But... as you also state, I have never seen any Cortex-A8 or higher witout a VFP-unit.
Anyone? Because that's stupid of me, but I advise clients about (TI though) Cortex-A8 and
higher in always having a VFP unit...

>  However, I think it should be fixed in Config.in.arm instead. Basically,
> whenever NEON is selected, the VFP's 'maybe' should be converted into a 'has'.
> So something like
> 
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -244,6 +244,9 @@ config BR2_ARM_ENABLE_NEON
>         bool "Enable NEON SIMD extension support"
>         depends on BR2_ARM_CPU_MAYBE_HAS_NEON
>         select BR2_ARM_CPU_HAS_NEON
> +       select BR2_ARM_CPU_HAS_VFPV3 if BR2_ARM_CPU_MAYBE_HAS_VFPV3
> +       select BR2_ARM_CPU_HAS_VFPV4 if BR2_ARM_CPU_MAYBE_HAS_VFPV4
>         help
>           For some CPU cores, the NEON SIMD extension is optional.
>           Select this option if you are certain your particular
> 
>  (Note that the VFPv2 cores never have NEON - at least as far as I know. Checked
> arm.com and that seems to be correct.)

Agree. I see the compiler being called with -mfpmath=neon (or something alike) so it seems
to be working next to VFPv2.

>  However, when you look at it like that, the option is not named correctly. What
> the option is really about is specifying that the optional floating point/NEON
> unit is indeed present.

Here you have a good point.

>  Alternatively, if we really do want to support the case where only one of NEON
> and VFPv3/4 is present, we should have a separate option similar to
> BR2_ARM_ENABLE_NEON to enable the FPU. And in that case, of course, all the
> MAYBEs should be removed from the Floating point strategy choice.

Anyone has more available time than me to look into patching this? Would be greatly
appreciated; would be using this for various customers of mine...


See http://www.arm.com/Cortex-A9-chip-diagram-LG.png also.

regards,

Jaap Crezee
