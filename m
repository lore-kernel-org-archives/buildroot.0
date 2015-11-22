From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Nov 2015 01:16:10 +0100
Subject: [Buildroot] [PATCH 2/2 v3] package/nodejs: add version 4.1.2
In-Reply-To: <5650CBBE.4080604@jcz.nl>
References: <cover.1445291882.git.yann.morin.1998@free.fr>
 <eb34ab6d35a15dfbec70263091f58c3e7ec2efab.1445291882.git.yann.morin.1998@free.fr>
 <CAFGQKxcBe5fzTCrQQxBXH7OtAf_qy7v+5TeAfFxhzY1C9QhS8g@mail.gmail.com>
 <20151020162527.GA3738@free.fr>
 <CAFGQKxeC83GJHc5+kHb3gJyyeXdSMJ6fFrSL8eRQXCjPVaHQ_A@mail.gmail.com>
 <5650CBBE.4080604@jcz.nl>
Message-ID: <5651094A.5080607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-11-15 20:53, Jaap Crezee wrote:
> Hi all,
> 
> 
> Can somebody please add the following (might not be completely right, that's why I post it
> like this):
> 
> [jaap at jaap /data/work/zupr/git/buildroot ]$ git diff
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index 5128901..8d0ecad 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -32,7 +32,7 @@ config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
>         # On supported architectures other than ARM, no special requirement
>         default y if !BR2_arm
>         # On ARM, at least ARMv6+ with VFPv2+ is needed
> -       default y if !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2
> +	default y if !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2 || BR2_ARM_CPU_HAS_NEON
> 
>  choice
>         prompt "Node.js version"
> [jaap at jaap /data/work/zupr/git/buildroot ]$
> 
> To my oppinion Neon is a VFPv2 succesor. NodeJS builds and runs fine with Neon selected
> instead of VFPv2 for Cortex-A9.

 You have a good point. I don't think it's possible to have a NEON core without
VFP floating point unit. Hm, looking at [1], NEON and FPU are independently
optional, so theoretically you could have a Cortex-A9 with one but not the
other. But that probably doesn't exist in practice (in fact, we don't know any
Cortex-A9 that doesn't have both).

 However, I think it should be fixed in Config.in.arm instead. Basically,
whenever NEON is selected, the VFP's 'maybe' should be converted into a 'has'.
So something like

--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -244,6 +244,9 @@ config BR2_ARM_ENABLE_NEON
        bool "Enable NEON SIMD extension support"
        depends on BR2_ARM_CPU_MAYBE_HAS_NEON
        select BR2_ARM_CPU_HAS_NEON
+       select BR2_ARM_CPU_HAS_VFPV3 if BR2_ARM_CPU_MAYBE_HAS_VFPV3
+       select BR2_ARM_CPU_HAS_VFPV4 if BR2_ARM_CPU_MAYBE_HAS_VFPV4
        help
          For some CPU cores, the NEON SIMD extension is optional.
          Select this option if you are certain your particular

 (Note that the VFPv2 cores never have NEON - at least as far as I know. Checked
arm.com and that seems to be correct.)

 However, when you look at it like that, the option is not named correctly. What
the option is really about is specifying that the optional floating point/NEON
unit is indeed present.

 Alternatively, if we really do want to support the case where only one of NEON
and VFPv3/4 is present, we should have a separate option similar to
BR2_ARM_ENABLE_NEON to enable the FPU. And in that case, of course, all the
MAYBEs should be removed from the Floating point strategy choice.


 Regards,
 Arnout


[1] http://www.arm.com/products/processors/cortex-a/cortex-a9.php
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
