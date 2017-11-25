From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 25 Nov 2017 23:25:35 +0100
Subject: [Buildroot] [PATCH v5 1/1] sunxi-mali-driver-mainline: new
 package
In-Reply-To: <95dbe3cc-01a0-d822-9c33-21033e0b6b34@micronovasrl.com>
References: <1511302072-9290-1-git-send-email-giulio.benetti@micronovasrl.com>
 <b4816831-bd4a-d923-9860-85c190148cf5@mind.be>
 <24ba0102-a4e9-cf2f-178d-aef7e334ef61@micronovasrl.com>
 <95dbe3cc-01a0-d822-9c33-21033e0b6b34@micronovasrl.com>
Message-ID: <c8cada21-a110-f2b3-de48-a8d839406ee2@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've sent a patchset as described below.
Those packaged are bound together.
In this way there's no problem on applying patches.
Hope I did it well.
I was not able to keep version for each patch,
but as I know it's not possible,
because version refer to other patches.

Let me know if I have to change something.

Kind regards

Il 25/11/2017 22:45, Giulio Benetti ha scritto:
> Hello Everybody,
> 
> I was thinking about doing a unique patchset for:
> sunxi-mali-driver-mainline
> and
> sunxi-mali-mainline
> 
> They're very connected each other.
> What do you think?
> 
> Il 25/11/2017 21:33, Giulio Benetti ha scritto:
>> Hi Arnout,
>>
>> Il 25/11/2017 18:59, Arnout Vandecappelle ha scritto:
>>> ? Hi Giulio,
>>>
>>> On 21-11-17 23:07, Giulio Benetti wrote:
>>>> Added kernel allwinner mali driver package.
>>>> Used combined with userspace Allwinner openGL blob,
>>>> it gives possibility to use 3D openGL SoC acceleration.
>>>
>>> ? I should have asked before, but: where do those binaries come from? 
>>> Are they
>>> from the mali-sunxi package? Or not yet packaged in Buildroot?
>>
>> It will be combined with sunxi-mali-mainline,
>> I've submitted a patch still pending:
>> [PATCH v4 1/1] sunxi-mali-mainline: new package
>> http://buildroot-busybox.2317881.n4.nabble.com/PATCH-v4-1-1-sunxi-mali-mainline-new-package-td180182.html 
>>
>>
>>>
>>>
>>> [snip]
>>>> index fe5ccc4..8de2227 100644
>>>> --- a/package/Config.in
>>>> +++ b/package/Config.in
>>>> @@ -496,6 +496,7 @@ endmenu
>>>> ????? source "package/statserial/Config.in"
>>>> ????? source "package/stm32flash/Config.in"
>>>> ????? source "package/sunxi-cedarx/Config.in"
>>>> +??? source "package/sunxi-mali-driver-mainline/Config.in"
>>>> ????? source "package/sunxi-mali/Config.in"
>>>
>>> ? foo-bar sorts after foo, so swap these two lines.
>>
>> Ok, on next patch I will correct it
>>
>>>
>>>> ????? source "package/sysstat/Config.in"
>>>> ????? source "package/targetcli-fb/Config.in"
>>>> diff --git a/package/sunxi-mali-driver-mainline/Config.in 
>>>> b/package/sunxi-mali-driver-mainline/Config.in
>>>> new file mode 100644
>>>> index 0000000..5b7b2ba
>>>> --- /dev/null
>>>> +++ b/package/sunxi-mali-driver-mainline/Config.in
>>>> @@ -0,0 +1,22 @@
>>>> +comment "sunxi-mali-driver-mainline needs a Linux kernel to be built"
>>>> +??? depends on !BR2_LINUX_KERNEL
>>>> +
>>>> +config BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE
>>>> +??? bool "sunxi-mali-driver-mainline"
>>>> +??? depends on BR2_LINUX_KERNEL
>>>> +??? select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
>>>> +??? help
>>>> +????? This package builds and installs the Linux kernel driver for
>>>> +????? the Mali GPU on Allwinner platforms, compatible with recent
>>>> +????? Linux kernels (>= 4.4). Note that it should be installed
>>>> +????? together with the corresponding userspace binary blobs to
>>>
>>> ? I guess with 'binary blobs' you mean the OpenGL libraries, which 
>>> are only
>>> provided as binaries? 'binary blobs' to me sounds like something like 
>>> firmware
>>> blobs: is put in your rootfs but doesn't run on the target processor. 
>>> So I'd
>>> rephrase as: ... together with the corresponding userspace OpenGL 
>>> libraries,
>>> which are provided as binaries only.
>>
>> Ok
>>
>>>
>>> ? And preferably also explain where you can get those.
>>
>> Ok, I will add github sunxi-mali by mripard
>>
>>>
>>>> +????? provide complete OpenGL functionality.
>>>> +
>>>> +????? sunxi-mali-driver-mainline requires a Linux kernel >= 4.4 
>>>> with the
>>>> +????? following options enabled:
>>>> +
>>>> +????? - CONFIG_CMA
>>>> +????? - CONFIG_DMA_CMA
>>>> +????? - CONFIG_DRM_FBDEV_OVERALLOC >= 200 for double buffer or more
>>>> +
>>>> +????? https://github.com/mripard/sunxi-mali/blob/master/README.md
>>>> diff --git 
>>>> a/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk 
>>>> b/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
>>>> new file mode 100644
>>>> index 0000000..1692646
>>>> --- /dev/null
>>>> +++ b/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
>>>> @@ -0,0 +1,26 @@
>>>> +################################################################################ 
>>>>
>>>> +#
>>>> +# sunxi-mali-driver-mainline
>>>> +#
>>>> +################################################################################ 
>>>>
>>>> +
>>>> +SUNXI_MALI_DRIVER_MAINLINE_VERSION = 
>>>> 5b7b3c0b6e1736676c90928816d271debbb09d95
>>>> +SUNXI_MALI_DRIVER_MAINLINE_SITE = $(call 
>>>> github,mripard,sunxi-mali,$(SUNXI_MALI_DRIVER_MAINLINE_VERSION))
>>>> +SUNXI_MALI_DRIVER_MAINLINE_DEPENDENCIES = linux
>>>> +
>>>> +SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS = \
>>>> +??? KDIR=$(LINUX_DIR) \
>>>> +??? CROSS_COMPILE=$(TARGET_CROSS) \
>>>> +??? INSTALL_MOD_PATH=$(TARGET_DIR)
>>>> +
>>>> +define SUNXI_MALI_DRIVER_MAINLINE_BUILD_CMDS
>>>> +??? cd $(@D) && $(SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS) \
>>>> +??????? $(SHELL) ./build.sh -r r6p2 -a
>>>
>>> ? Shouldn't the r6p2 be configurable? That can be done in a later 
>>> patch, though.
>>
>> You're right, but at this time there's only r6p2 available.
>> Anyway I can add it parametric, so it will be ready for any next 
>> versions.
>>
>>>
>>> ? Regards,
>>> ? Arnout
>>>
>>>> +endef
>>>> +
>>>> +define SUNXI_MALI_DRIVER_MAINLINE_INSTALL_TARGET_CMDS
>>>> +??? cd $(@D) && $(SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS) \
>>>> +??????? $(SHELL) ./build.sh -r r6p2 -i
>>>> +endef
>>>> +
>>>> +$(eval $(generic-package))
>>>>
>>>
>>
>>
> 
> 


-- 
Giulio Benetti
R&D Manager &
Advanced Research

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
