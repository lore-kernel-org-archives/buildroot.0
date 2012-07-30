From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 30 Jul 2012 12:09:10 +0200
Subject: [Buildroot] [PATCHv3 0/6] Add some support for device tree
	kernels
In-Reply-To: <501655FF.1040501@free-electrons.com>
References: <1342528042-10038-1-git-send-email-maxime.ripard@free-electrons.com>
 <CAHkwnC8tgsCmou-Z5Bv2A4+0Na=AagfVaZGoC2wmg6oy-c4PPA@mail.gmail.com>
 <5012E503.2070005@free-electrons.com>
 <CAHkwnC-uYDO_V1_oWZG2dmwgypdk6AOMmBjq3DsaXp=3n+7iLA@mail.gmail.com>
 <501655FF.1040501@free-electrons.com>
Message-ID: <CAHkwnC9uGCa5YP4PN2E--srQK4+gYMBT1c1Ag0_OnqYQPs3izQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 30, 2012 at 11:38 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Le 30/07/2012 10:33, Fabio Porcedda a ?crit :
>> On Fri, Jul 27, 2012 at 8:59 PM, Maxime Ripard
>> <maxime.ripard@free-electrons.com> wrote:
>>> Le 27/07/2012 18:06, Fabio Porcedda a ?crit :
>>>> thanks for the work, this feature it's very useful for me,
>>>> i tried your patches and i tried to build a kernel for arm, but it
>>>> failed to build it,
>>>> this is the tail of the output log:
>>>>
>>>> cat /home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/arch/arm/boot/zImage
>>>> /home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/arch/arm/boot/"usb_a9260".dtb
>>>>> /home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/arch/arm/boot/zImage_dtb
>>>> mv /home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/arch/arm/boot/zImage_dtb
>>>> /home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/arch/arm/boot/zImage
>>>> # We need to generate a new u-boot image that takes into
>>>> # account the extra-size added by the device tree at the end
>>>> # of the image. To do so, we first need to retrieve both load
>>>> # address and entry point for the kernel from the already
>>>> # generate uboot image before using mkimage -l.
>>>> LOAD=` -l /home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/arch/arm/boot/uImage
>>>> | sed -n 's/Load Address: \([0-9]*\)/\1/p'`; ENTRY=` -l
>>>> /home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/arch/arm/boot/uImage
>>>> | sed -n 's/Entry Point: \([0-9]*\)/\1/p'`;  -A arm -O linux -T kernel
>>>> -C none -a ${LOAD} -e ${ENTRY} -n 'Linux Buildroot' -d
>>>> /home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/arch/arm/boot/zImage
>>>> /home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/arch/arm/boot/uImage
>>>> /bin/bash: -l: command not found
>>>> /bin/bash: -l: command not found
>>>> /bin/bash: -A: command not found
>>>> make: *** [/home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-3.5/.stamp_built]
>>>> Error 127
>>>>
>>>>
>>>> I've applied your patches on top of the commit
>>>> fd08153b9d677d654add6c580b9ccc5c27d672e2,
>>>>
>>>> My defconfig is:
>>>> BR2_arm=y
>>>> BR2_arm926t=y
>>>> BR2_TOOLCHAIN_EXTERNAL=y
>>>> BR2_LINUX_KERNEL=y
>>>> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>>>> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.5"
>>>> BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
>>>> BR2_LINUX_KERNEL_INTREE_DTS_NAME="usb_a9260"
>>>> BR2_LINUX_KERNEL_APPENDED_UIMAGE=y
>>>
>>> I have seen no such bugs during my testing, but can you try with the
>>> attached patch?
>>
>> The problem it's on the patch "[PATCH 2/4] Add support for appended
>> device tree blobs for arm ",
>> please read my replay on the patch.
>>
>>> I've only discovered this simplification of the code recently and didn't
>>> take the time to submit a patch for it, I guess I have the opportunity
>>> now :)
>>
>> I tried your patch on top of the others, but the patch doesn't apply:
>>
>> git apply < ~/Downloads/uimage-dtb.patch
>> <stdin>:20: trailing whitespace.
>>       cat $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb >>
>> $(KERNEL_ARCH_PATH)/boot/zImage
>> <stdin>:21: trailing whitespace.
>>       # We need to generate the uImage here after that so that the uImage is
>> <stdin>:22: trailing whitespace.
>>       # generated with the right image size.
>> <stdin>:23: trailing whitespace.
>>       $(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) uImage
>> <stdin>:29: trailing whitespace.
>>       cat $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb >>
>> $(KERNEL_ARCH_PATH)/boot/zImage
>> error: patch failed: linux/linux.mk:198
>> error: linux/linux.mk: patch does not apply
>
> Hmmm, that's weird, it applies fine here on top of these patches.
> Let me send another version of these patches then.

I applied manually and now builds fine, thanks.

-- 
Fabio Porcedda
