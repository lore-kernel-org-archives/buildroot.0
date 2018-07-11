From: Joel Carlson <joelsoncarl@gmail.com>
Date: Tue, 10 Jul 2018 20:48:34 -0600
Subject: [Buildroot] [PATCH v4 1/3] uboot: zynqmp: allow to use custom
 psu_init files
In-Reply-To: <7e3f3d75-15d8-f778-ef25-5e2b0b959f72@lucaceresoli.net>
References: <mailman.4777.1529627642.16495.buildroot@busybox.net>
 <6b428669-ea55-efe8-d0fa-aa97287824a9@gmail.com>
 <7e3f3d75-15d8-f778-ef25-5e2b0b959f72@lucaceresoli.net>
Message-ID: <ece4b0e3-5b7b-5719-393c-21918cc2f839@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I just want to note that I was initially setup for message digests on 
the mailing list (and am now set to get individual messages). I had to 
do some copying and pasting trying to make it look like I was replying 
to the original patch email, but it looks like I lost something such 
that patchwork doesn't append these email responses to it. So a link to 
the original just for the sake of relating things for other readers: 
https://patchwork.ozlabs.org/patch/932962/

On 2018-07-10 15:54, Luca Ceresoli wrote:
> Hi Joel,
> 
> On 09/07/2018 21:07, Joel Carlson wrote:
>> Hello,
>>
>> I've been using the v3 form of your patches to get our Zynqmp board
>> booting. This morning I upgraded our U-Boot from v2018.05 to v2018.07,
>> and on my 2018.05 buildroot branch I removed the v3 patches and applied
>> the v4 ones. I had a few issues with this patch.
> 
> Good to know this work is useful to somebody!

Very useful for anybody that wants to boot zynqmp without relying on 
Xilinx's workflow! I was very happy when I found your initial patches.

<snip>

>>> +diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>>> +index 22234cde2ab6..e04979d0ef7e 100644
>>> +--- a/arch/arm/Kconfig
>>> ++++ b/arch/arm/Kconfig
>>> +@@ -1293,4 +1293,5 @@ source "board/technologic/ts4600/Kconfig"
>>> + source "board/vscom/baltos/Kconfig"
>>> + source "board/woodburn/Kconfig"
>>> + source "board/work-microwave/work_92105/Kconfig"
>>> ++source "board/xilinx/Kconfig"
>>
>> This patch does not apply with U-Boot 2018.07 - I don't know which
>> version of U-Boot it is desired to maintain compatibility against. But
>> it was a pretty small change to make it apply again, just adding:
>>> source "board/xilinx/zynqmp/Kconfig"
>> below the line the patch adds.
> 
> Yes, IIRC that's the only relevant difference between this patch and the
> one that got applied (https://patchwork.ozlabs.org/patch/933198/).
> However supporting a more recent version of U-Boot will probably require
> an extra work that I'd rather leave as a future improvement.

That's fair enough. Pretty easy for me to keep my own modified patch for 
2018.07.

> BTW, how are you building your PMU firmware?

I'm actually using your zynqmp-pmufw-builder tool on github. =)
With the changes:
- I check out the embeddedsw submodule to the xilinx-v2018.1 tag
- I had to then tweak the 0001 patch a little
- I modify build.sh to add some extra flags to reduce the size (or else 
it overflows its available memory - I got these flags from how Xilinx 
compiles it)
- I think my pm_cfg_obj.c is the default one from Xilinx for 2018.1

> 
>> <snip>
>>> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
>>> index 03bd7ea743ed..e4571a6ccf9f 100644
>>> --- a/boot/uboot/uboot.mk
>>> +++ b/boot/uboot/uboot.mk
>>> @@ -274,6 +274,17 @@ define UBOOT_INSTALL_IMAGES_CMDS
>>>  ????????????? $(BINARIES_DIR)/boot.scr)
>>>  ? endef
>>>  ? +ifeq ($(BR2_TARGET_UBOOT_ZYNQMP),y)
>>> +
>>> +ifneq ($(call qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE)),)
>>> +define UBOOT_ZYNQMP_KCONFIG_PSU_INIT
>>> +??? $(call
>>> KCONFIG_SET_OPT,CONFIG_XILINX_PS_INIT_FILE,"$(TOPDIR)/$(call
>>> qstrip,$(BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE))", \
>>> +?????????? $(@D)/.config)
>>
>> I think you should get rid of the "$(TOPDIR)/" part and let the user
>> specify it as part of BR2_TARGET_UBOOT_ZYNQMP_PSU_INIT_FILE if needed.
>> My psu_init files are in a path that I reference via BR2_EXTERNAL, so
>> having $(TOPDIR) prepended messed up the path to my files.
> 
> Uhm, my mistake, as I've never user BR2_EXTERNAL I tend to forget to
> test it... Sorry about that.
> 
> Since the kconfig option we're setting here will be evaulated during the
> build process, which will happen in another directory
> ($O/build/uboot-*/), I chose to tranform that path to an absolute one
> using $TOPDIR.
> 
> But as you noticed this is not a correct solution. At first sight we
> should rather copy the file in a proper place (sysroot or
> $O/build/uboot-*/) and then point the kconfig option to that path. I'll
> have a look to this, as well as to your comments to patch 2.

This did work for me using a $(BR2_EXTERNAL_MY_BSP_PATH) variable in the 
value once I simply removed '$(TOPDIR)'. Though I did not test using 
$(TOPDIR) within the variable value, but I think that should still work. 
But I suppose copying it into uboot's build folder might seem more 
appropriate than paths to elsewhere on the system.
