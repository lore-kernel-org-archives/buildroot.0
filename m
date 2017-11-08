From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 9 Nov 2017 00:15:47 +0100
Subject: [Buildroot] [PATCH 1/1] add sunxi-mali mainline kernel
In-Reply-To: <35a55788-8cf6-2f65-e110-dfc467fad8cd@mind.be>
References: <1509920353-23438-1-git-send-email-giulio.benetti@micronovasrl.com>
 <20171108102753.nisqsfaibybjul4x@flea.lan>
 <35a55788-8cf6-2f65-e110-dfc467fad8cd@mind.be>
Message-ID: <cb3c28e7-e31c-a245-489b-b82e709cb5f8@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Il 09/11/2017 00:05, Arnout Vandecappelle ha scritto:
> 
> 
> On 08-11-17 11:27, Maxime Ripard wrote:
>> Hi,
>>
>> On Sun, Nov 05, 2017 at 11:19:13PM +0100, Giulio Benetti wrote:
>>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>>
>> A commit log would be nice.
> 
>   Yeah, and also a help text. README.md can be an inspiration :-)

Ok, I try to find something to inspire on already in buildroot.

> 
>>
>>> ---
>>>   package/sunxi-mali-driver-mainline/Config.in       |  9 +++++
>>>   package/sunxi-mali-driver-mainline/S80mali         | 43 ++++++++++++++++++++++
>>>   .../sunxi-mali-driver-mainline.mk                  | 43 ++++++++++++++++++++++
>>>   3 files changed, 95 insertions(+)
>>>   create mode 100644 package/sunxi-mali-driver-mainline/Config.in
>>>   create mode 100644 package/sunxi-mali-driver-mainline/S80mali
>>>   create mode 100644 package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
>>>
>>> diff --git a/package/sunxi-mali-driver-mainline/Config.in b/package/sunxi-mali-driver-mainline/Config.in
>>> new file mode 100644
>>> index 0000000..8f2c960
>>> --- /dev/null
>>> +++ b/package/sunxi-mali-driver-mainline/Config.in
>>> @@ -0,0 +1,9 @@
>>> +comment "sunxi-mali-driver-mainline needs a Linux kernel to be built"
>>> +	depends on !BR2_LINUX_KERNEL
>>> +
>>> +config BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE
>>> +	bool "sunxi-mali-driver-mainline"
>>> +	depends on BR2_LINUX_KERNEL
>>> +	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
>>> +	help
>>> +	  Sunxi Mali Kernel space driver
> 
>   Please also mention in the help text what the kernel requirements are (>= 4.12
> I think?)

Ok

> 
> [snip]
>>> diff --git a/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk b/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
>>> new file mode 100644
>>> index 0000000..73f7359
>>> --- /dev/null
>>> +++ b/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
>>> @@ -0,0 +1,43 @@
>>> +################################################################################
>>> +#
>>> +# sunxi-mali-driver-mainline
>>> +#
>>> +################################################################################
>>> +
>>> +# last sha1 character dropped to ensure unique filename
>>
>> What do you mean?
> 
>   See the commit log of 956fcc2100c865b25f97c688f0b9012bbd5dfdb1 - this was to
> deal with the github tarball change fallout.
> 
>>
>>> +SUNXI_MALI_DRIVER_MAINLINE_VERSION = 88ba3cecfc7082bf8e52d7ded16cbbf0ef9e6ca
>>> +SUNXI_MALI_DRIVER_MAINLINE_SITE = https://github.com/mripard/sunxi-mali.git
>>> +SUNXI_MALI_DRIVER_MAINLINE_SITE_METHOD = git
>>
>> You can use the github macros to do that.
>>
>>> +
>>> +SUNXI_MALI_DRIVER_MAINLINE_DEPENDENCIES = linux
>>> +
>>> +SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS = \
>>> +	KDIR=$(LINUX_DIR) \
>>> +	USING_UMP=0 \
>>> +	BUILD=release \
>>> +	USING_DVFS=1 \
>>> +	USING_DEVFREQ=1 \
>>> +	CROSS_COMPILE=$(TARGET_CROSS)
>>> +
>>> +define SUNXI_MALI_DRIVER_MAINLINE_BUILD_CMDS
>>> +	$(APPLY_PATCHES) $(@D)/r6p2 $(@D)/patches \*.patch
> 
>   Maxime, WTF? Why is this maintained as patches and not as a proper history?
> 
>   If it's for rebasing, you can maintain separate branches for the
> upstream-tracking and the modified stuff. If it is because the same patches need
> to be applied to different upstream versions, you can do it in different
> branches and use subtree merge. This applying of patches is really not user
> friendly IMO.

I wait for Maxime to proceed, because different kernel versions,
need different patches.
Maxime, let me know how to proceed,
even if I could be useful for this https://github.com/mripard/sunxi-mali.git

> 
>   Giulio, the proper way to do this is in a POST_PATCH_HOOK. Otherwise, if you
> rebuild it, it will also be patched again (which will fail).

Ok, I didn't know that, and didn't retry to compile twice.

> 
>>> +
>>> +	$(SUNXI_MALI_MAINLINE_MAKE_ENV) $(MAKE) \
>>> +		$(SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS) \
>>> +		-C $(@D)/r6p2/src/devicedrv/mali
> 
>   So why not use the kernel-module infra?

I've already answered to Maxime, that's my fault,
I didn't see that in Makefile there is "modules" recipe.

> 
>>> +endef
>>> +
>>> +define SUNXI_MALI_DRIVER_MAINLINE_INSTALL_TARGET_CMDS
>>> +	mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/gpu/
>>> +
>>> +	cp $(@D)/r6p2/src/devicedrv/mali/mali.ko \
>>> +		$(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/gpu/
>>> +
>>> +	echo kernel/gpu/mali.ko >> \
>>> +	$(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/modules.dep
>>
>> Why not using the build script that does all this already?
> 
>   Or the kernel-module infra :-)
> 
>   Regards,
>   Arnout
> 
>>
>> Thanks!
>> Maxime
>>
>>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
> 

Thanks to everybody

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
