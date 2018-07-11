From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 11 Jul 2018 23:17:47 +0200
Subject: [Buildroot] [PATCH v4 1/3] uboot: zynqmp: allow to use custom
 psu_init files
In-Reply-To: <ece4b0e3-5b7b-5719-393c-21918cc2f839@gmail.com>
References: <mailman.4777.1529627642.16495.buildroot@busybox.net>
 <6b428669-ea55-efe8-d0fa-aa97287824a9@gmail.com>
 <7e3f3d75-15d8-f778-ef25-5e2b0b959f72@lucaceresoli.net>
 <ece4b0e3-5b7b-5719-393c-21918cc2f839@gmail.com>
Message-ID: <e5e0d947-8aa3-68bd-0d00-2811830542af@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joel,

On 11/07/2018 04:48, Joel Carlson wrote:
[...]
>> BTW, how are you building your PMU firmware?
> 
> I'm actually using your zynqmp-pmufw-builder tool on github. =)

Oh, cool! :)

> With the changes:
> - I check out the embeddedsw submodule to the xilinx-v2018.1 tag
> - I had to then tweak the 0001 patch a little
> - I modify build.sh to add some extra flags to reduce the size (or else
> it overflows its available memory - I got these flags from how Xilinx
> compiles it)
> - I think my pm_cfg_obj.c is the default one from Xilinx for 2018.1

The changes you made to reduce the size and support more recent versions
would be useful to other people, would you like to contribute them to
zynqmp-pmufw-builder? This would ultimately improve the quality of
ZynqMP support in Buildroot as well. As this is quite off topic here,
feel free to just send me patches or a github PR, or t contact me
directly for any question.

>>> <snip>
>>>> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
>>>> index 03bd7ea743ed..e4571a6ccf9f 100644
>>>> --- a/boot/uboot/uboot.mk
>>>> +++ b/boot/uboot/uboot.mk
>>>> @@ -274,6 +274,17 @@ define UBOOT_INSTALL_IMAGES_CMDS
>>>> ?????????????? $(BINARIES_DIR)/boot.scr)
>>>> ?? endef
>>>> ?? +ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
>>>> +
>>>> +ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE)),)
>>>> +define UBOOT_ZYNQMP_KCONFIG_PSU_INIT
>>>> +??? $(call
>>>> KCONFIG_SET_OPT,CONFIG_XILINX_PS_INIT_FILE,"$(TOPDIR)/$(call
>>>> qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE))", \
>>>> +?????????? $(@D)/.config)
>>>
>>> I think you should get rid of the "$(TOPDIR)/" part and let the user
>>> specify it as part of BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE if needed.
>>> My psu_init files are in a path that I reference via BR2_EXTERNAL, so
>>> having $(TOPDIR) prepended messed up the path to my files.
>>
>> Uhm, my mistake, as I've never user BR2_EXTERNAL I tend to forget to
>> test it... Sorry about that.
>>
>> Since the kconfig option we're setting here will be evaulated during the
>> build process, which will happen in another directory
>> ($O/build/uboot-*/), I chose to tranform that path to an absolute one
>> using $TOPDIR.
>>
>> But as you noticed this is not a correct solution. At first sight we
>> should rather copy the file in a proper place (sysroot or
>> $O/build/uboot-*/) and then point the kconfig option to that path. I'll
>> have a look to this, as well as to your comments to patch 2.
> 
> This did work for me using a $(BR2_EXTERNAL_MY_BSP_PATH) variable in the
> value once I simply removed '$(TOPDIR)'. Though I did not test using
> $(TOPDIR) within the variable value, but I think that should still work.
> But I suppose copying it into uboot's build folder might seem more
> appropriate than paths to elsewhere on the system.

Well, perhaps using TOPDIR in the variable would work, but it would be
rather ugly and different from other Buildroot settings. Copying looks
like the best solution at the moment.

Regards,
-- 
Luca
