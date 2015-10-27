From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Oct 2015 10:41:08 +0100
Subject: [Buildroot] [PATCH] configs: Add support for Toradex Colibri
 Vybrid modules
In-Reply-To: <20151027034232.GB7906@Sanchayan-Arch.toradex.int>
References: <f63a9e7f3d885880c6b55b89eec4aa739b497ea1.1445312793.git.maitysanchayan@gmail.com>
 <562E860A.2090203@mind.be> <20151027034232.GB7906@Sanchayan-Arch.toradex.int>
Message-ID: <562F46B4.5090405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-10-15 04:42, maitysanchayan at gmail.com wrote:
> Hello Arnout,
> 
> On 15-10-26 20:59:06, Arnout Vandecappelle wrote:
>>  Hi Sanchayan,
>>
>> On 20-10-15 05:49, Sanchayan Maity wrote:
>>> This patch adds a minimal default configuration for Colibri Vybrid
>>> modules which has been tested on Colibri Vybrid VF50 and VF61.
>>>
>>> Vybrid is well supported in mainline kernel by Toradex however we
>>> use the custom git branches maintained by Toradex. The configuration

 Something I forgot to mention in my initial review: this sentence doesn't
explain very well what you're doing. I mean, you say that it's OK to use
mainline but you use the Toradex branch anyway, without giving a good reason for it.

>>> only builds a minimal root filesystem. Support for u-boot and flash
>>> scripts is not added.

 And another thing I forgot to mention: unless there is a really good reason not
to support U-Boot, please do support U-Boot as well. The goal of a defconfig is
to make it easy to start to make your own configuration and to start hacking.
It's basically a simple way to express all the information about how to build
things that you would otherwise find in wiki pages etc. So how to build a custom
boot loader is really an essential part of that.

 For some boards we even have two defconfigs, to distinguish the booting from SD
card and the booting from flash. That's also something that is sometimes a bit
tricky to get right so it is worthwhile to have a separate defconfig for it.

>>>
>>> Signed-off-by: Sanchayan Maity <maitysanchayan@gmail.com>
>>> ---
[snip]
>>> +BR2_LINUX_KERNEL_INSTALL_TARGET=y
>>
>>  That is rarely a good idea... You usually put the kernel in a separate mtd
>> partition or UBI volume.
> 
> On the Colibri Vybrid modules we have one UBI parition on which the root filesystem
> resides along with the kernel and device tree blobs in /boot. From uboot we then use
> boot from ubifs. I am aware that this is supposedly not recommended and recently
> Richard Weinberger also had a ELCE talk regarding that though I am not aware of the
> reasons at the moment.
> 
> I added the above since it directly gives a rootfs ubifs image which users of the
> Colibri Vybrid can then directly use as to how to we define our update procedures.

 If that's the way you define your update procedure, then keep it the way it is.

 The reason that Richard Weinberger advises against it (I think) is that it just
adds overhead: mounting ubifs takes time in addition to attaching the ubi
partition. So booting the kernel from a UBI volume will be significantly faster.
But there is certainly something to be said for your approach as well, since it
makes it much easier to guarantee consistency between kernel and rootfs.

> 
> Will the addition of the above options be not acceptable still?
> 
>>
>>> +BR2_PACKAGE_GDB=y
>>> +BR2_PACKAGE_IPROUTE2=y
>>
>>  Please don't select any package except busybox.
> 
> Ok.
> 
>>
>>> +BR2_TARGET_ROOTFS_UBIFS=y
>>> +BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
>>> +BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x800
>>> +BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=8112
>>> +BR2_TARGET_ROOTFS_UBIFS_RT_LZO=y
>>
>>  This is the default, how come it appears in your defconfig?
>>
>>> +BR2_TARGET_ROOTFS_UBIFS_NONE=y
>>
>>  Same here.
> 
> Ok. I added it specifically. Will purge the defaults here.

 Well, it's not bad to add it explicitly, just in case the defaults change
(though we try to avoid that) and to make it more explicit what choices you've made.


 To avoid some of the feedback like I gave, it's good to already mention in the
commit message what choices you've made and why.


 Regards,
 Arnout

> 
>>
>>> +BR2_TARGET_ROOTFS_UBIFS_OPTS="--space-fixup"
>>> +BR2_TARGET_ROOTFS_UBI=y
>>> +BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x20000
>>> +BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
>>> +BR2_TARGET_ROOTFS_UBI_OPTS=""
>>>
>>
>>
>>  We also like to have a readme file, in board/toradex/colibri/readme.txt, that
>> explains how to get the images to the target. Particularly in this case because
>> it's not simply a matter of putting it in an SD card. Look at other boards for
>> examples.
> 
> Will add the same.
> 
> Thanks for your inputs and time Arnout.
> 
> - Sanchayan.
> 
>>
>>  Regards,
>>  Arnout
>>
>> -- 
>> Arnout Vandecappelle                          arnout at mind be
>> Senior Embedded Software Architect            +32-16-286500
>> Essensium/Mind                                http://www.mind.be
>> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
