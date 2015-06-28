From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 28 Jun 2015 21:54:25 +0200
Subject: [Buildroot] [V4 1/2] A20-OLinuXino-Lime: new board (mainline)
In-Reply-To: <CAB0FRstYj+N0T20YcFmUv+U5_HB1S1HuGtmoh-=jrzxu2HNCjQ@mail.gmail.com>
References: <1435313217-12871-1-git-send-email-francois.perrad@gadz.org>
 <1435313217-12871-2-git-send-email-francois.perrad@gadz.org>
 <558D7D84.1000605@lucaceresoli.net>
 <CAB0FRstYj+N0T20YcFmUv+U5_HB1S1HuGtmoh-=jrzxu2HNCjQ@mail.gmail.com>
Message-ID: <559050F1.1030101@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois,

thanks for your patches, which are now on master. I'll base my
A20-OLinuXino-MICRO patches on top of you good work.

A comment below about minimal defconfigs.

Fran?ois Perrad wrote:
[...]
>>> diff --git a/configs/olimex_a20_olinuxino_lime_defconfig
>>> b/configs/olimex_a20_olinuxino_lime_defconfig
>>> new file mode 100644
>>> index 0000000..62f0a4c
>>> --- /dev/null
>>> +++ b/configs/olimex_a20_olinuxino_lime_defconfig
>>> @@ -0,0 +1,45 @@
>>> +# Architecture
>>> +BR2_arm=y
>>> +BR2_cortex_a7=y
>>> +BR2_ARM_EABIHF=y
>>
>>
>> This SoC has NEON and VFPv4, so you should add:
>> BR2_ARM_FPU_NEON_VFPV4=y
>>
>
> Dear Luca,
>
>  From the reading of arch/Config.in.arm:
> - BR2_cortex_a7 selects BR2_ARM_CPU_HAS_NEON and BR2_ARM_CPU_HAS_VFPV4
> - BR2_CPU_HAS_VFPV4 choices by default BR2_ARM_FPU_VFPV4D16 as
> "Floating point strategy"
>
> BR2_ARM_FPU_NEON_VFPV4 could be another choice for this "Floating
> point strategy".
>
> As far I see, the BR defconfigs try to stay minimalist.
> For me, the default settings provided by BR are good enough.
>
> I added BR2_ARM_EABIHF because it is required by the proprietary blob
> binary mali r3p0, not because it is a nice to have or a fine tuning
> optimisation.

I understand your argument.

However, my understanding of the "minimal defconfig" choice is only
that they should not include unneeded packages (i.e. everything but
busybox) in the root filesystem.

I don't see any advantage of configuring toolchain and target options in
a sub-optimal way.

In fact, we have several Cortex-A defconfigs that enable NEON (5 out of
26) and EABIHF (9 out of 26):

$ git grep -l  cortex_a -- configs/ |wc
      26      26     878
$ git grep -l  cortex_a -- configs/ | xargs grep -l EABIHF|wc
       9       9     308
$ git grep -l  cortex_a -- configs/ | xargs grep -l NEON|wc
       5       5     158
$

But as I said, my understanding might be wrong.

Any authoritative opinions on this?
I'd be glad to update the docs with whatever is "official".

-- 
Luca
