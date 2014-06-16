From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Jun 2014 23:56:27 +0200
Subject: [Buildroot] Location of bootloader files [was: Re: [PATCH 1/2]
 at91bootstrap3: bump to v3.6.2]
In-Reply-To: <20140615165840.GC3568@free.fr>
References: <1402839229-13076-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140615165840.GC3568@free.fr>
Message-ID: <539F680B.10405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/15/14 18:58, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2014-06-15 15:33 +0200, Thomas Petazzoni spake thusly:
>> In preparation to add support for the SAMA5D3 Xplained board, this
>> commit bumps the version of the at91bootstrap3 bootloader to
>> v3.6.2.
> [--SNIP--]
>> diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
>> index 4f74b1d..07df75d 100644
>> --- a/boot/at91bootstrap3/at91bootstrap3.mk
>> +++ b/boot/at91bootstrap3/at91bootstrap3.mk
> [--SNIP--]
>> @@ -47,7 +45,7 @@ define AT91BOOTSTRAP3_BUILD_CMDS
>>  endef
>>  
>>  define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
>> -	$(MAKE) $(AT91BOOTSTRAP3_MAKE_OPT) -C $(@D) bootstrap
>> +	cp $(@D)/binaries/*.bin $(BINARIES_DIR)
> 
> Some of the bootloaders install their files in a sub-directory of
> $(BINARIES_DIR) (for example rpi-userland, syslinux...), while others
> (such as this one) install their files directly in $(BINARIES_DIR), and
> still others install their files in $(TARGET_DIR)/boot (eg. grub.)
> 
> Sometime ago, I proposed a patch to install the rpi-userland files in
> $(TARGET_DIR)/boot, but that was refused, on the principle that the boot
> partition should not necesarily be exposed/mounted on the running
> system. That's however what grub1 does.

 I think for most bootloaders, it just doesn't make sense to install them inside
the target rootfs, because the (ROM) bootloader anyway can't access these files
there. Grub is special because the actual bootloader is created by a separate
installer. For the other bootloaders, there is IMHO no point at all to install
the bootloader in the target filesystem.

> 
> Also, there is a new convention being ironed out, about how the boot
> files should be layed out. It's The Boot Loader Specification, defined
> at FDO: http://www.freedesktop.org/wiki/Specifications/BootLoaderSpec/

 Actually, the spec is mostly about the contents of $BOOT/loader/*.conf. It
specifies that the bootloader should read these files. It also specifies that
the kernel image should be in $BOOT/<id>/... It does not specify where the
bootloader itself should reside.

> 
> This specification is mostly geared toward "classical PC" (desktop and
> servers, and clearly embedded systems are a bit left-out. However, for
> the parts of the specification that make sense, I think we should follow.
> 
> At one point, it states:
> 
>     ---8<---
>     This placeholder file system shall be determined during installation
>     time, and an fstab entry for it shall be created mounting it to /boot.
>     ---8<---

 It also specifies that /boot should be a separate partition. So it should _not_
be within $TARGET_DIR.

> 
> So, here are a few questions, probably in the order we should decide:
> 
>   - should we instate a policy on where bootloaders install their files?
> 
> If 'no', then we can just stop here. If 'yes', then here are a few more
> questions:
> 
>   - should we follow The Boot Loader Specification when it makes sense,
>     ie. boot files that are installed on a filesystem should be
>     installed in $(TARGET_DIR)/boot ?

 No. It doesn't make sense for anything except grub.

> 
>   - if installing files in $(BINARIES_DIR), should we instate a policy
>     to install them in a sub-dir? What shall that sub-dir be named?
>     Currently, when followed, the behaviour is to install in a sub-dir
>     named after the bootloader (eg. $(BINARIES_DIR)/rpi-userland).
>     Should we stick to that, or just name that directory
>     $(BINARIES_DIR)/boot ?

 I don't think $(BINARIES_DIR)/boot is a good place, because that should contain
everything except the boot loader :-). Also, if you want to do that, you
probably also want to put the kernel and DTB there. And then there's nothing
left in $(BINARIES_DIR)...


 Regards,
 Arnout

> 
> Here are my answers:
>   - yes, we should follow the spec when it makes sense
>   - yes, boot filesresiding on a filesystem should be installed in
>     $(TARGET_DIR)/boot
>   - when not installing in$(TARGET_DIR)/boot, we should install boot
>     files in $(BINARIES_DIR)/boot. We can provide a symlink 
>     bootloader-name -> boot.
> 
> (Note, this is not considered a show-stopper for this patch to go in or
> not, just random thoughts it spurred in my head. ;-) )
> 
> Regards,
> Yann E. MORIN.
> 
>>  endef
>>  
>>  $(eval $(generic-package))
>> -- 
>> 2.0.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
