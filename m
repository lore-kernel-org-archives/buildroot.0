From: David Li <w.david.li@gmail.com>
Date: Mon, 15 Apr 2013 10:59:22 -0700
Subject: [Buildroot] Newbie questions on building images for EP405
In-Reply-To: <069B5A25F9844945B625ADE7258AC94C062BD97B@4rf-nz-orion.local.4rf.com>
References: <CAADET=fm0cNPKvvRj6k9nOiGqXZqVGLM7fabj=y8X8sR197WUw@mail.gmail.com>
 <5162F0E2.2030103@zacarias.com.ar>
 <CAADET=cXud-Oyp5Fk5Ybox-_TcdVKpyharCh00am6+bJaXgUXQ@mail.gmail.com>
 <5164454D.2040602@mind.be>
 <CAADET=cRnm-WpZJJiweS48MQB3HmzCYjqw9qER98OpUHpVWkrQ@mail.gmail.com>
 <069B5A25F9844945B625ADE7258AC94C062BD130@4rf-nz-orion.local.4rf.com>
 <CAADET=fhAyCE3pGKisf5RYu75TaRaw9Wt9bDk6VtxhdOZDZn-A@mail.gmail.com>
 <069B5A25F9844945B625ADE7258AC94C062BD272@4rf-nz-orion.local.4rf.com>
 <CAADET=ePxekcME=TEG3EPqevgga0aEdjKafeEJMm-yg9myL4uw@mail.gmail.com>
 <069B5A25F9844945B625ADE7258AC94C062BD2C3@4rf-nz-orion.local.4rf.com>
 <CAADET=eK9+kDczXp05HHqQMYkrsqiw-gPOVK4yBx5sarrqdWJg@mail.gmail.com>
 <069B5A25F9844945B625ADE7258AC94C062BD30F@4rf-nz-orion.local.4rf.com>
 <CAADET=d1KbF8Ldoc4YzP2ORBYPPPqgtuZfZ_zpzh-ov_FLy3ZA@mail.gmail.com>
 <069B5A25F9844945B625ADE7258AC94C062BD97B@4rf-nz-orion.local.4rf.com>
Message-ID: <CAADET=dmuxQeJ2su5LfJPBQneReun=KrYUidA64nDZtMXFYSbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Reuben!

The word I got from u-boot list is that my uboot is way too old to
support Device Tree Blob and the new kernel 3.7.8.  My best bet
forward is to upgrade the stock uboot on the EP405 board.

I think buildroom can also build u-boot image. Maybe I 'll start from
there. Not sure sure yet how to use the stock uboot to upgrade to a
new one.

David


On Sun, Apr 14, 2013 at 1:42 PM, Reuben Dowle <reuben.dowle@4rf.com> wrote:
> It looks like - is being interpreted as a 0 address for some reason. As I mentioned in a previous email, this is different behaviour to my board, and different to what the u-boot manual says should happen. So I assume that your board is using a customised version of u-boot which behaves differently. I had a quick look, and I cannot even see the "Loading RAMDisk Image" string anywhere in the u-boot source code. As far as I can see, it is only referred to as "Loading init Ramdisk" in the standard u-boot source code...
>
> I can only suggest you try actually providing a ramdisk image (cpio archive, passed through the uboot mkimage tool) as well, or else look at the u-boot code to work out why it is not allowing use of a - to skip the ramdisk load.
>
> Reuben
>
>> -----Original Message-----
>> From: David Li [mailto:w.david.li at gmail.com]
>> Sent: Saturday, 13 April 2013 8:16 a.m.
>> To: Reuben Dowle
>> Cc: buildroot
>> Subject: Re: [Buildroot] Newbie questions on building images for EP405
>>
>> I built ep405.dtb in buildroot this time. So I loaded both uImage and
>> ep405.dtb. To my surprise, the bootm still complains about Bad Magic
>> Number. Also I don't understand why it says:
>>
>> ## Loading RAMDisk Image at 00000000 ...
>>
>> The entire output is the following:
>> =========================
>>
>>
>> => tftpboot 0x100000 ep405.dtb
>>
>> Using ppc_4xx_eth0 device
>>
>> TFTP from server 192.168.0.11; our IP address is 192.168.0.88
>>
>> Filename 'ep405.dtb'.
>>
>> Load address: 0x100000
>>
>> Loading: #
>>
>> done
>>
>> Bytes transferred = 4520 (11a8 hex)
>>
>> => tftpboot 0xfc0000 uImage
>>
>> Using ppc_4xx_eth0 device
>>
>> TFTP from server 192.168.0.11; our IP address is 192.168.0.88
>>
>> Filename 'uImage'.
>>
>> Load address: 0xfc0000
>>
>> Loading:
>> #################################################################
>>
>>
>> #################################################################
>>
>>         ##############################################
>>
>> done
>>
>> Bytes transferred = 2571912 (273e88 hex)
>>
>> => bootm 0xfc0000 - 0x100000
>>
>> ## Booting image at 00fc0000 ...
>>
>>   Image Name:   Linux-3.7.8
>>
>>   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
>>
>>   Data Size:    2571848 Bytes =  2.5 MB
>>
>>   Load Address: 00000000
>>
>>   Entry Point:  00000000
>>
>>   Verifying Checksum ... OK
>>
>>   Uncompressing Kernel Image ... OK
>>
>> ## Loading RAMDisk Image at 00000000 ...
>>
>> Bad Magic Number
>>
>>
>>
>> On Wed, Apr 10, 2013 at 9:10 PM, Reuben Dowle <reuben.dowle@4rf.com>
>> wrote:
>> > It looks like there is a dts for the EP405 in the kernel tree, so you
>> should just be able to use the ep405.dtb make target in the kernel
>> source to generate this. If you are getting buildroot to build the
>> kernel, you can specify this to be done by enabling the
>> BR2_LINUX_KERNEL_DTS_SUPPORT config option, and then specifying
>> BR2_LINUX_KERNEL_INTREE_DTS_NAME=ep405
>> >
>> > Reuben
>> >
>> > From: David Li [mailto:w.david.li at gmail.com]
>> > Sent: Thursday, 11 April 2013 4:01 p.m.
>> > To: Reuben Dowle
>> > Cc: buildroot
>> > Subject: RE: [Buildroot] Newbie questions on building images for
>> EP405
>> >
>> > It sounds like my behaves the same as yours when missing the third
>> arg. Without the flattened device tree, it just hangs.
>> > I need to investigate how to create such a FDT.
>> > On Apr 10, 2013 6:49 PM, "Reuben Dowle" <reuben.dowle@4rf.com> wrote:
>> > I had a quick check on my board (a freescale mpc8309 based powerpc
>> system), and the bootm command works as per the manual you quoted:
>> passing - for the initramfs does not pass an initramfs to the kernel
>> (and panics later because it has no internal initramfs). Note how the
>> manual also states a flattened device tree blob (a .DTB file) to be
>> passed, which you are not doing. This is needed on all (except very
>> old?) PowerPC platforms, but is not so common on other architectures.
>> If I leave that parameter out on my system it just hangs (as expected,
>> since the kernel now has no idea what hardware it is running on).
>> >
>> > Since your u-boot is not behaving as per the manual, and differently
>> to mine, I can only assume that the u-boot is a different version, or
>> is customised in some way for your board. I really have no idea what
>> could be wrong. I would look carefully at the manufacturer examples for
>> booting the system.
>> >
>> > Reuben
>> >
>> > From: David Li [mailto:w.david.li at gmail.com]
>> > Sent: Thursday, 11 April 2013 12:46 p.m.
>> > To: Reuben Dowle
>> > Cc: buildroot
>> > Subject: Re: [Buildroot] Newbie questions on building images for
>> EP405
>> >
>> > Hi Reuben,
>> > If I don't give "-" as second arg, the boot would hang like before.
>> Here is the instruction from uBoot manual:
>> >
>> > Linux requires the flattened device tree blob to be passed at boot
>> time, and bootm expects its third argument to be the address of the
>> blob in memory. Second argument to bootm depends on whether an initrd
>> initial ramdisk image is to be used. If the kernel should be booted
>> without the initial ramdisk, the second argument should be given as "-
>> ", otherwise it is interpreted as the start address of initrd (in RAM,
>> ROM or flash memory).
>> >
>> >
>> > On Wed, Apr 10, 2013 at 1:20 PM, Reuben Dowle <reuben.dowle@4rf.com>
>> wrote:
>> > I do not think passing - as the second parameter to u-boot is correct
>> if you want to use a ramdisk that is built into the kernel. You should
>> just pass a single uImage address for this. I think u-boot might be
>> interpreting the - as a ramdisk address of 0 (though I am not certain
>> of this).
>> >
>> > A 'magic number' is just a simple test to check that there is a
>> specific number at a specific offset within the initramfs. If not, then
>> there is clearly not an initramfs at that address.
>> >
>> > You should make sure that you have actually set the kernel to build
>> an internal initramfs. Alternatively it is possible to pass load the
>> initramfs cpio archive (packaged with the mkimage uboot tool) as a
>> parameter in u-boot.
>> >
>> > You should also check if you need a DTB as well - many PowerPC's need
>> to have a DTB passed to the kernel. On the board I am working on, I
>> pass three parameters to bootm for uImage, initramfs and then DTB.
>> >
>> > Reuben
>> >
>> > From: David Li [mailto:w.david.li at gmail.com]
>> > Sent: Thursday, 11 April 2013 3:21 a.m.
>> > To: Reuben Dowle
>> > Cc: buildroot
>> > Subject: Re: [Buildroot] Newbie questions on building images for
>> EP405
>> >
>> > I set the serial console arg. And I also found I might have to pass
>> "-" as the second arg to bootm as my rootfs is part of the uImage.
>> There is no separate initrd.  This time I can see the error. What I
>> don't understand are:
>> > 1. why it's loading the ramdisk at 0x0000000? Isn't that supposed to
>> be the kernel loading address?
>> > 2. what's Bad Magic number? something I misconfigured?
>> >
>> > => bootm 0xfc0000 -
>> > ## Booting image at 00fc0000 ...
>> >    Image Name:   Linux-3.7.8
>> >    Image Type:   PowerPC Linux Kernel Image (gzip compressed)
>> >    Data Size:    2571933 Bytes =  2.5 MB
>> >    Load Address: 00000000
>> >    Entry Point:  00000000
>> >    Verifying Checksum ... OK
>> >    Uncompressing Kernel Image ... OK
>> > ## Loading RAMDisk Image at 00000000 ...
>> > Bad Magic Number
>> >
>> >
>> > On Tue, Apr 9, 2013 at 9:18 PM, Reuben Dowle <reuben.dowle@4rf.com>
>> wrote:
>> > You probably need to tell the kernel where to print the console
>> messages by passing console=XX in its command line. For example in
>> uboot something like 'setenv bootargs console=ttyS0,115200' before the
>> bootm is probably what you want.
>> >
>> > Otherwise you might want to check you have the correct serial drivers
>> built into your kernel.
>> >
>> > Reuben Dowle
>> > Software Developer
>> > 4RF Limited
>> >
>> > From: buildroot-bounces at busybox.net [mailto:buildroot-
>> bounces at busybox.net] On Behalf Of David Li
>> > Sent: Wednesday, 10 April 2013 3:16 p.m.
>> > To: Arnout Vandecappelle
>> > Cc: buildroot
>> > Subject: Re: [Buildroot] Newbie questions on building images for
>> EP405
>> >
>> > Yes, thanks for pointing that out. I moved it to 0xFC0000 (about
>> 16MB). This time it seems uncompressed ok but it hung forever after
>> that. Any suggestions how to debug this? How do I turn on the kernel
>> debug messages from the config menu?
>> >
>> >
>> > => bootm 0xfc0000
>> > ## Booting image at 00fc0000 ...
>> >    Image Name:   Linux-3.7.8
>> >    Image Type:   PowerPC Linux Kernel Image (gzip compressed)
>> >    Data Size:    2571933 Bytes =  2.5 MB
>> >    Load Address: 00000000
>> >    Entry Point:  00000000
>> >    Verifying Checksum ... OK
>> >    Uncompressing Kernel Image ... OK
>> >
>> >
>> > On Tue, Apr 9, 2013 at 9:43 AM, Arnout Vandecappelle <arnout@mind.be>
>> wrote:
>> > On 09/04/13 17:13, David Li wrote:
>> > => bootm 0x100000
>> > ## Booting image at 00100000 ...
>> >     Image Name:   Linux-3.7.8
>> >     Image Type:   PowerPC Linux Kernel Image (gzip compressed)
>> >     Data Size:    2571933 Bytes =  2.5 MB
>> >     Load Address: 00000000
>> >     Entry Point:  00000000
>> >     Verifying Checksum ... OK
>> >     Uncompressing Kernel Image ... Error: inflate() returned -3
>> > GUNZIP ERROR - must RESET board to recover
>> >
>> >  The uImage is stored at address 0x100000 (=1M) and then extracted at
>> 0x00000000, and it's 2.5MB compressed... so you can imagine that the
>> extracted image may overwrite the compressed image.
>> >
>> >  Can you try tftpbooting at a higher address?
>> >
>> >
>> >  Regards,
>> >  Arnout
>> >
>> > --
>> > Arnout Vandecappelle                          arnout at mind be
>> > Senior Embedded Software Architect            +32-16-286500
>> > Essensium/Mind                                http://www.mind.be
>> > G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR
>> Leuven
>> > LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>> > GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>> > The information in this email communication (inclusive of
>> attachments) is confidential to 4RF Limited and the intended
>> recipient(s). If you are not the intended recipient(s), please note
>> that any use, disclosure, distribution or copying of this information
>> or any part thereof is strictly prohibited and that the author accepts
>> no liability for the consequences of any action taken on the basis of
>> the information provided. If you have received this email in error,
>> please notify the sender immediately by return email and then delete
>> all instances of this email from your system. 4RF Limited will not
>> accept responsibility for any consequences associated with the use of
>> this email (including, but not limited to, damages sustained as a
>> result of any viruses and/or any action or lack of action taken in
>> reliance on it).
>> >
>> > The information in this email communication (inclusive of
>> attachments) is confidential to 4RF Limited and the intended
>> recipient(s). If you are not the intended recipient(s), please note
>> that any use, disclosure, distribution or copying of this information
>> or any part thereof is strictly prohibited and that the author accepts
>> no liability for the consequences of any action taken on the basis of
>> the information provided. If you have received this email in error,
>> please notify the sender immediately by return email and then delete
>> all instances of this email from your system. 4RF Limited will not
>> accept responsibility for any consequences associated with the use of
>> this email (including, but not limited to, damages sustained as a
>> result of any viruses and/or any action or lack of action taken in
>> reliance on it).
>> >
>> > The information in this email communication (inclusive of
>> attachments) is confidential to 4RF Limited and the intended
>> recipient(s). If you are not the intended recipient(s), please note
>> that any use, disclosure, distribution or copying of this information
>> or any part thereof is strictly prohibited and that the author accepts
>> no liability for the consequences of any action taken on the basis of
>> the information provided. If you have received this email in error,
>> please notify the sender immediately by return email and then delete
>> all instances of this email from your system. 4RF Limited will not
>> accept responsibility for any consequences associated with the use of
>> this email (including, but not limited to, damages sustained as a
>> result of any viruses and/or any action or lack of action taken in
>> reliance on it).
>> > The information in this email communication (inclusive of
>> attachments) is confidential to 4RF Limited and the intended
>> recipient(s). If you are not the intended recipient(s), please note
>> that any use, disclosure, distribution or copying of this information
>> or any part thereof is strictly prohibited and that the author accepts
>> no liability for the consequences of any action taken on the basis of
>> the information provided. If you have received this email in error,
>> please notify the sender immediately by return email and then delete
>> all instances of this email from your system. 4RF Limited will not
>> accept responsibility for any consequences associated with the use of
>> this email (including, but not limited to, damages sustained as a
>> result of any viruses and/or any action or lack of action taken in
>> reliance on it).
> The information in this email communication (inclusive of attachments) is confidential to 4RF Limited and the intended recipient(s). If you are not the intended recipient(s), please note that any use, disclosure, distribution or copying of this information or any part thereof is strictly prohibited and that the author accepts no liability for the consequences of any action taken on the basis of the information provided. If you have received this email in error, please notify the sender immediately by return email and then delete all instances of this email from your system. 4RF Limited will not accept responsibility for any consequences associated with the use of this email (including, but not limited to, damages sustained as a result of any viruses and/or any action or lack of action taken in reliance on it).
