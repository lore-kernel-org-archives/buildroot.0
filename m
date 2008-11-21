From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 21 Nov 2008 12:11:47 +0100
Subject: [Buildroot] [PATCH] target/iso9660/iso9660.mk
In-Reply-To: <e4c675870811210248j12a6082au9a17b1723d3d8cd9@mail.gmail.com>
References: <e4c675870811210211s3080d990ue4b59efe2c4a3d68@mail.gmail.com>
	<20081121103242.GB19111@mx.loc>
	<e4c675870811210248j12a6082au9a17b1723d3d8cd9@mail.gmail.com>
Message-ID: <20081121111147.GD19111@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 21, 2008 at 11:48:25AM +0100, Roberto A. Foglietta wrote:
>2008/11/21 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>:
>> On Fri, Nov 21, 2008 at 11:11:59AM +0100, Roberto A. Foglietta wrote:
>>>Hi,
>>>
>>> when the user choose to use INITRAMFS iso9660 double its size because
>>>initrd is also copied in iso9660 but kernel has its own.
>>>
>>>
>>>Index: target/iso9660/iso9660.mk
>>>===================================================================
>>>--- target/iso9660/iso9660.mk  (revision 24103)
>>>+++ target/iso9660/iso9660.mk  (working copy)
>>>@@ -55,12 +55,17 @@
>>> endif
>>>
>>> $(ISO9660_TARGET): host-fakeroot $(LINUX_KERNEL) $(EXT2_TARGET) grub mkisofs
>>>+      rm -rf $(ISO9660_TARGET_DIR)
>>>       mkdir -p $(ISO9660_TARGET_DIR)
>>>       mkdir -p $(ISO9660_TARGET_DIR)/boot/grub
>>>       cp $(GRUB_DIR)/stage2/stage2_eltorito $(ISO9660_TARGET_DIR)/boot/grub/
>>>       cp $(ISO9660_BOOT_MENU) $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
>>>       cp $(LINUX_KERNEL) $(ISO9660_TARGET_DIR)/kernel
>>>+ifneq ($(strip $(BR2_TARGET_ROOTFS_INITRAMFS)),y)
>>
>> the strip is superfluous (other patches of yours also do this. Don't.)
>>
>
>Ok, I just imitate the others code.

Yea, but please do not immitate bloat..
>
>>>       cp $(EXT2_TARGET) $(ISO9660_TARGET_DIR)/initrd
>>>+else
>>>+      touch $(ISO9660_TARGET_DIR)/initrd
>>
>> Sounds like this is not needed?
>>
>
>I strongly suggest to add the touch initrd because:
>
> a)  initramf takes a lot of time at each compilation so beta-testing
>stage usually goes with initrd
>
> b) when you deliver the product you should turn on initramfs but then
>menu.lst still reports grub should load initrd but if it does not
>exist grub fails
>
> touching the initrd means: if you forget to modify menu.lst you will
>not pay the fee to see your system unable to boot.
>
> The question: is there any condition in which touching initrd really
>hurts somebody? I think the answer is no.

Yes, it hurts since it's an unwarranted inode and adds to the size of
the image needlessly. It is simply not clean and not the proper thing
to do.
>
> Under this point of view touching initrd save time to skilled users
>and make things work for those are not such skilled users

I did it a bit differently, fyi.
