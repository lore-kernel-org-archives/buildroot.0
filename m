From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 20 Mar 2012 17:33:59 -0500
Subject: [Buildroot] Microblaze - UBoot Bootloader Support
In-Reply-To: <201203202148.03682.arnout@mind.be>
References: <CAEBucnBJ88bpFaoVvp6fuU1aUZySOp+BFdY1=9Eq3h06tg+BPw@mail.gmail.com>
 <201203202148.03682.arnout@mind.be>
Message-ID: <CAEBucnDTZqCu_iMf7pCi=Oh7Cqf1yJ72=q=1xt2AmFau5kCyQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 20, 2012 at 3:48 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Monday 19 March 2012 22:55:14 Spenser Gilliland wrote:
>> I'm looking into a boot loader and will be testing u-boot over the
>> next few days. ?The Xilinx u-boot repo appears stagnant, so I'm going
>> to try to use the upstream u-boot support. ?It looks like the
>> following will be necessary to support u-boot in Microblaze.
>>
>> 1. Copy a xparameters.h file.
>> Would be similar to the kernels dts copy routine.
>
> ?I would prefer to see this as a patch (configured with
> BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR) rather than modifications to the
> uboot.mk file. ?The dts copy is something that should be usable
> by other architectures as well in the long term. ?But copying
> random files into the u-boot source tree isn't.

I think this is not necessarily a good approach because of how
Microblaze based systems work.  The peripherals are almost never
constant between two different designs and anyone who used Microblaze
would be required to patch this for there specific design.  IE.  There
is no single patch that could be applied.

However, after further investigation there is another option.  In
newer versions of u-boot, some arches support dts based configuration
(see u-boot's doc/README.fdt-control).  If a patch can be created
against u-boot to add "fdt-control" to Microblaze we could support all
common configurations by utilizing the DTS copy mechanism.

Additionally, this support should be generalized for supporting the
Arm chips which already support "fdt-control" in u-boot.

>
>> 2. Update the ?CONFIG_SYS_BASE_ADDR variable.
>> Can be pulled from the kernel configuration, based on DTS or manual?
>> (I'll produce a manual patch for now but automating this in the future
>> seems appropriate)
>
> ?Up to now, buildroot doesn't do anything to automagically derive
> U-boot configurations from kernel configurations and vice versa. ?I
> also don't see a driving reason to do that. ?So here as well, I would
> prefer a patch.
> ?A separate patch file for each 'feature' is probably the best.

I've already created a program which extracts cflags from the DTS.
Adding support for finding the CONFIG_SYS_TEXT_BASE (wrong var in
original post) variable could be completely external to Buildroot if
the option was available.  IE. To build now I do make
TARGET_CFLAGS="$(xilcflags /path/to/my.dts)" could be make
TARGET_CFLAGS="$(xilcflags /path/to/my.dts)"
UBOOT_TEXT_BASE="$(xiltxtbase /path/to/my.dts)".

> ?Regards,
> ?Arnout
>
>
> --
> Arnout Vandecappelle ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? arnout at mind be
> Senior Embedded Software Architect ? ? ? ? ? ? ? ? +32-16-286540
> Essensium/Mind ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium ? ? ? ? ? ? ? ?BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint: ?7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F



-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
