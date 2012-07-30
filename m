From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 30 Jul 2012 10:25:51 +0200
Subject: [Buildroot] [PATCH 4/6] Add support for appended device tree
 blobs for arm
In-Reply-To: <5013FBFE.5030702@mind.be>
References: <1342528042-10038-1-git-send-email-maxime.ripard@free-electrons.com>
 <1342528042-10038-5-git-send-email-maxime.ripard@free-electrons.com>
 <5013FBFE.5030702@mind.be>
Message-ID: <CAHkwnC8Jizf5RHi0hfeJM4W8AamYhkJ1ixtFC0Cczbm9GmZJVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 28, 2012 at 4:49 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> ...
>>
>> +ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
>> +define LINUX_APPEND_DTB
>> +       cat $(KERNEL_ARCH_PATH)/boot/zImage
>> $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb>
>> $(KERNEL_ARCH_PATH)/boot/zImage_dtb
>> +       mv $(KERNEL_ARCH_PATH)/boot/zImage_dtb
>> $(KERNEL_ARCH_PATH)/boot/zImage
>> +       # We need to generate a new u-boot image that takes into
>> +       # account the extra-size added by the device tree at the end
>> +       # of the image. To do so, we first need to retrieve both load
>> +       # address and entry point for the kernel from the already
>> +       # generate uboot image before using mkimage -l.
>> +       LOAD=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) | sed -n 's/Load Address:
>> \([0-9]*\)/\1/p'`; \
>> +       ENTRY=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) | sed -n 's/Entry Point:
>> \([0-9]*\)/\1/p'`; \
>> +       $(MKIMAGE) -A $(KERNEL_ARCH) -O linux -T kernel -C none -a
>> $${LOAD} -e $${ENTRY} -n 'Linux Buildroot' \
>> +               -d $(KERNEL_ARCH_PATH)/boot/zImage
>> $(KERNEL_ARCH_PATH)/boot/$(LINUX_IMAGE_NAME)
>
>
>  MKIMAGE isn't defined anywhere, so I wonder how it can work for you...
> But anyway, with the amendment you posted later this shouldn't be an issue
> anymore.

I tested the patch and doesn't work.
The MKIMAGE isn't defined anywhere.

output log error:
# We need to generate a new u-boot image that takes into
# account the extra-size added by the device tree at the end
# of the image. To do so, we first need to retrieve both load
# address and entry point for the kernel from the already
# generate uboot image before using mkimage -l.
LOAD=` -l /home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-custom/arch/arm/boot/uImage
| sed -n 's/Load Address: \([0-9]*\)/\1/p'`; ENTRY=` -l
/home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-custom/arch/arm/boot/uImage
| sed -n 's/Entry Point: \([0-9]*\)/\1/p'`;  -A arm -O linux -T kernel
-C none -a ${LOAD} -e ${ENTRY} -n 'Linux Buildroot' -d
/home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-custom/arch/arm/boot/zImage
/home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-custom/arch/arm/boot/uImage
/bin/bash: -l: command not found
/bin/bash: -l: command not found
/bin/bash: -A: command not found
make: *** [/home/fabiopo/porting-pro3/ge863-pro3-linux-3.6/buildroot-dt/output/build/linux-custom/.stamp_built]
Error 127

Regards
-- 
Fabio Porcedda
