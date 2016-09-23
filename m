From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 23 Sep 2016 22:07:39 +0200
Subject: [Buildroot] uboot: building MLO fails
In-Reply-To: <20160923075524.10122519@free-electrons.com>
References: <e564e1a1-d285-c57b-46a1-00d6375d01f9@gmail.com>
 <20160923075524.10122519@free-electrons.com>
Message-ID: <73fc076d-db0f-bf04-5249-a6f89aec9a5c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-09-16 07:55, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 23 Sep 2016 00:55:51 +0200, Lothar Felten wrote:
> 
>> with the current uboot.mk the MLO isn't generated anymore.
>>
>> I modified my defconfig (beaglebone_defconfig) to:
>> BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>> BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"
> 
> This looks wrong. The image format is u-boot.img.
> 
>> BR2_TARGET_UBOOT_SPL=y
>> BR2_TARGET_UBOOT_SPL_NAME="MLO"
>>
>> In uboot.mk $(BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME) is added to 
>> UBOOT_BINS but not to UBOOT_MAKE_TARGET, why?
> 
> However, indeed, MLO is no longer built. This is a fallout from
> https://git.buildroot.org/buildroot/commit/boot/uboot?id=fad58cefa4a392b52eafe46a773f8cbfb8aadb43.
> 
> I really think we should do, in order to build both the default images
> for the selected platforms *and* the additional make targets if any.
> 
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index 7379a4d..81c5169 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -179,7 +179,7 @@ endif # BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY
>  define UBOOT_BUILD_CMDS
>         $(TARGET_CONFIGURE_OPTS)        \
>                 $(MAKE) -C $(@D) $(UBOOT_MAKE_OPTS)             \
> -               $(UBOOT_MAKE_TARGET)
> +               all $(UBOOT_MAKE_TARGET)
>         $(if $(BR2_TARGET_UBOOT_FORMAT_SD),
>                 $(@D)/tools/mxsboot sd $(@D)/u-boot.sb $(@D)/u-boot.sd)
>         $(if $(BR2_TARGET_UBOOT_FORMAT_NAND),
> 
> I tested with this patch, and it generates and installs MLO and
> u-boot.img properly.

 In a discussion about u-boot targets a while ago I came to the same conclusion.
And I suggested two specific targets that should be verified, but I don't
remember which ones :-)

 And actually, with this change, some (all?) of the _MAKE_TARGETS assignments
can probably be removed as well.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
