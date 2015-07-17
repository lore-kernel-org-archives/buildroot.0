From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Fri, 17 Jul 2015 14:24:09 -0700
Subject: [Buildroot] [RFC/PATCH] linux: remove the zImage before rebuild
In-Reply-To: <20150717231632.05928653@free-electrons.com>
References: <1411773774-7712-1-git-send-email-guido@vanguardiasur.com.ar>	<55A926DC.9010803@mentor.com>	<20150717163442.GA6466@fox>	<20150717194128.7c22974b@free-electrons.com>	<55A94E20.2000506@mentor.com>
 <20150717231632.05928653@free-electrons.com>
Message-ID: <55A97279.5010106@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/17/2015 02:16 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Fri, 17 Jul 2015 11:49:04 -0700, Hollis Blanchard wrote:
>
>> A bit of a tangent now, but I am trying to write a recipe for another
>> bootwrapper, which prepends a little code to a zImage/DTB combo. Right
>> now, it basically boils down to this:
>>
>>      define BOOT_WRAPPER_ARM_BUILD_CMDS
>>
>>           $(MAKE) CROSS_COMPILE=$(TARGET_CROSS) DTBIMAGE=$(BINARIES_DIR)/zImage -C $(@D)
>>
>>      endef
>>
>>
>> Practically speaking, I think the bootwrapper is only really useful in
>> the BR2_LINUX_KERNEL_APPENDED_ZIMAGE case, and I can enforce that via
>> Kconfig dependencies, so I can assume the kernel name is "zImage".
>>
>> If your idea above is implemented, would I need to duplicate the
>> linux.mk logic around  BR2_LINUX_KERNEL_USE_INTREE_DTS,
>> BR2_LINUX_KERNEL_INTREE_DTS_NAME, BR2_LINUX_KERNEL_USE_CUSTOM_DTS, and
>> BR2_LINUX_KERNEL_CUSTOM_DTS_PATH? Or is there a better way to do this?
> We already have a similar case in the boot-wrapper-aarch64 package. I
> am indeed not sure how that would work with appended DTB and multiple
> zImage generated. Needs some thought, indeed.

OK.

It looks like arm64 Linux builds produce only "arch/arm64/boot/Image", 
so the boot-wrapper-aarch64 build system itself (not 
boot-wrapper-aarch64.mk) assumes "Image" is the file name to process.

PowerPC Linux can create "dtbImage.<board>". "dtbImage", even without 
the "board" extension, is a good name for what's going on, and I think 
it would at least partially satisfy your goal... so perhaps linux.mk 
should create that, i.e. "cat zImage dtb > dtbImage"

Hollis Blanchard
Mentor Graphics Emulation Division
