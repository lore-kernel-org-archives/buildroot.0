From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Mar 2012 15:19:33 +0100
Subject: [Buildroot] [PATCH 2/2] fs/initramfs: refactor with fs/cpio
In-Reply-To: <201203131715.58195.arnout@mind.be>
References: <1315343769-530-1-git-send-email-arnout@mind.be>
 <1315343769-530-2-git-send-email-arnout@mind.be>
 <CAAXf6LXmSKuRhXEgc=EWgYOXJ9fgyZCoQ36d1vB515eSNgUSFQ@mail.gmail.com>
 <201203131715.58195.arnout@mind.be>
Message-ID: <CAAXf6LUAB_peHpGDsgv6P3W3sQ3MOeKOvwNpR77YZgcvE4N6RA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Mar 13, 2012 at 5:15 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Tuesday 13 March 2012 16:49:08 Thomas De Schampheleire wrote:
>
>> After my upstep to buildroot-2012.02, I am experiencing problems with
>
>> the kernel:
>
>>
>
>> [????0.053620] Kernel panic - not syncing: junk in compressed
>> archive??<===
>
>
> Looks like your cpio archive is compressed with an algorithm that is
>
> not recognized by your kernel configuration... Can you check:
>
>
> - that the generated rootfs.cpio.* is a valid compressed archive; and
>
> - that the compression algorithm is configured in the kernel.
>
>
>
>> [????0.126574] Call Trace:
>
>> [????0.155738] [ec057f00] [c0006fe4] show_stack+0x78/0x18c (unreliable)
>
>> [????0.231769] [ec057f40] [c02f0db4] panic+0xc0/0x1e8
>
>> [????0.289055] [ec057f90] [c03c4370] populate_rootfs+0x34/0xc8
>
>> [????0.355714] [ec057fa0] [c0001cc0] do_one_initcall+0xf4/0x1ec
>
>> [????0.423418] [ec057fd0] [c03c2388] kernel_init+0x194/0x24c
>
>> [????0.488000] [ec057ff0] [c000dcd0] kernel_thread+0x4c/0x68
>
>> [????0.552583] Rebooting in 5 seconds..
>
>>
>
>>
>
>> We are not putting the rootfs inside the kernel image, but next to it.
>
>> The kernel is notified of the location of this image using the device
>
>> tree.
>
>>
>
>> Looking at the changes you did above, I'm a bit confused about when
>
>> the target linux26-rebuild-with-initramfs is supposed to be built. In
>
>> my case, BR2_TARGET_ROOTFS_INITRAMFS is not set
>
>> (BR2_TARGET_ROOTFS_CPIO is), so the TARGETS variable does not contain
>
>> target 'rootfs-initramfs'. This means the variable
>
>> ROOTFS_INITRAMFS_POST_TARGETS is never considered.
>
>
> If you're using an initramfs that is not linked into the kernel, then
>
> you're not using the BR2_TARGET_ROOTFS_INITRAMFS infrastructure, so you
>
> shouldn't be affected by this patch.
>
>
> linux26-rebuild-with-initramfs is only needed to create a kernel with
>
> the embedded initramfs.
>
>
>>
>
>> Is this expected behavior?
>
>> I cannot yet prove that this patch caused the behavior I'm seeing (I'm
>
>> currently investigating this further), but it would be nice to get
>
>> some feedback already.
>
>
> This patch should be relatively easy to revert, no?


So, I figured it out. In the end, it was your patch that triggered my
problem, but only indirectly. I don't think the patch is at fault.

linux/linux.mk contains:
        $(if $(BR2_TARGET_ROOTFS_INITRAMFS),
                touch $(BINARIES_DIR)/rootfs.cpio
                $(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config)
                $(call
KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.cpio\",$(@D)/.config)
                ...

This means that this code will be executed, even if
BR2_TARGET_ROOTFS_INITRAMFS is explicitly set to 'n'. This may not be
a common case, but I think it is valid to do so (I do so).

This is in fact the real problem, according to me. If I change the code to:
        $(if $(filter y,$(BR2_TARGET_ROOTFS_INITRAMFS)),
                touch $(BINARIES_DIR)/rootfs.cpio
                $(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config)
                $(call
KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,\"$(BINARIES_DIR)/rootfs.cpio\",$(@D)/.config)
                ...

Then everything is fine.

But even without Arnout's patch, this check was there. So why did it
work for me?
Both the original code as the modified one make an empty file, either
rootfs.initramfs or rootfs.cpio. This empty file is passed to the
Linux kernel to create its internal initramfs.
The difference is that the scripts/gen_initramfs_list.sh will look at
the filename to determine whether the input is an initramfs list or a
cpio one. If it's not cpio, it will assume a file containing
filenames. An empty file does not contain filenames, so the initramfs
is empty. If it's a file containing .cpio, it will assume that it's a
real cpio archive, which is not correct. The resulting initramfs will
be corrupt.

I will send a patch to update the linux/linux.mk file to take into
account =n properly.

Best regards,
Thomas
