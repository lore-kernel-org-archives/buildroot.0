From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 25 Jul 2011 10:34:29 +0200
Subject: [Buildroot] linux: why is vmlinux only available for mips?
In-Reply-To: <20110725090512.627eca89@skate>
References: <CAAXf6LX2ApVsZ18tTuj4eqEYtAzKBHSXBMdhSJCPL+25YcJX8A@mail.gmail.com>
 <CAAXf6LUUFNFF+xCQJX2juonZTXh8V1HBVqDRjjSJ1VMJXUyQFg@mail.gmail.com>
 <20110715143053.558a756a@skate>
 <CAAXf6LUaOXizUnxjZVhbpoeiAxAiLeYyXajQKgOjKzY-vo0g2w@mail.gmail.com>
 <20110720181715.0267567a@skate>
 <CAAXf6LW0JhQM7i84d-MLK3kSZAcLHb3gkgNqJaXsUtR9HNgwUQ@mail.gmail.com>
 <20110725090512.627eca89@skate>
Message-ID: <CAAXf6LWoY9ip1a16H=PDzj6hnBxy7FgTjPx5tNc2XTFHFvP0jQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 25, 2011 at 9:05 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Le Sun, 24 Jul 2011 13:46:40 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> > Which vmlinux are you using ? The one at the top directory of the
>> > kernel source tree, or the one in arch/<ARCH>/boot ?
>>
>> I am using vmlinux from the kernel top directory. In fact, this is
>> also where the linux.mk rules take it from:
>>
>> ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
>> LINUX26_IMAGE_PATH=$(LINUX26_DIR)/$(LINUX26_IMAGE_NAME)
>> else
>> ifeq ($(KERNEL_ARCH),avr32)
>> LINUX26_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/images/$(LINUX26_IMAGE_NAME)
>> else
>> LINUX26_IMAGE_PATH=$(KERNEL_ARCH_PATH)/boot/$(LINUX26_IMAGE_NAME)
>> endif
>> endif # BR2_LINUX_KERNEL_VMLINUX
>>
>> If one would want to use vmlinux from arch/<arch>/boot, then he or she
>> could use BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM and
>> BR2_LINUX_KERNEL_IMAGE_TARGET_NAME without a problem.
>>
>> As you mentioned, arch/<arch>/boot doesn't contain vmlinux for all
>> architectures, while the top kernel directory does. Since buildroot
>> already has a rule to get to this package, I simply wanted to remove
>> the architecture dependency from it.
>
> Ok, but typically, the vmlinux in the top directory isn't a bootable
> image, as it is a pure ELF binary image. Are there
> architectures/bootloaders combinations for which this format makes
> sense ?

Well, at least in my case it does: having a proprietary boot strategy,
we take this ELF image and package it according to our bootloader's
needs.
Also: suppose you have a custom U-boot setup, and you do not want the
standard uImage that is being made by the kernel. In that case, you'd
run mkimage yourself with the custom options you need, but this
requires access to the vmlinux file as well. Having it in a fixed
place like output/images makes sense then.

>
>> >> >> * I need to get to the dtc (device tree compiler) which resides in
>> >> >> <linux>/scripts/dtc/dtc
>> >> >
>> >> > This tool looks like a useful host tool built by the kernel. Maybe we
>> >> > should install it in $(HOST_DIR)/usr/bin ?
>> >>
>> >> Yes, I agree. How do you do that?
>> >
>> > You can hijack any of the installation steps of the kernel to install
>> > this tool to $(HOST_DIR)/usr/bin. But technically speaking, this
>> > wouldn't respect the convention of the package infrastructure: the
>> > "linux" package is a target package, and it is therefore not supposed
>> > to install anything in $(HOST_DIR).
>>
>> What about making a separate dtc package? The official sources are
>> here, I think:
>> http://jdl.com/software/
>
> Ok, would indeed be nice to have a separate tarball for this. Is this
> kept in sync with the version inside the kernel ?

Honestly, I have no idea. Grant Likely (added to this thread) probably
knows the answer.

*Grant*: what is the difference between the dtc sources in the kernel
tree, and those at http://jdl.com/software/ ? Are they kept in sync?

Thanks,
Thomas
