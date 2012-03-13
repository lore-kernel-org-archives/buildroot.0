From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Mar 2012 17:15:57 +0100
Subject: [Buildroot] [PATCH 2/2] fs/initramfs: refactor with fs/cpio
In-Reply-To: <CAAXf6LXmSKuRhXEgc=EWgYOXJ9fgyZCoQ36d1vB515eSNgUSFQ@mail.gmail.com>
References: <1315343769-530-1-git-send-email-arnout@mind.be>
 <1315343769-530-2-git-send-email-arnout@mind.be>
 <CAAXf6LXmSKuRhXEgc=EWgYOXJ9fgyZCoQ36d1vB515eSNgUSFQ@mail.gmail.com>
Message-ID: <201203131715.58195.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 13 March 2012 16:49:08 Thomas De Schampheleire wrote:
> After my upstep to buildroot-2012.02, I am experiencing problems with
> the kernel:
> 
> [    0.053620] Kernel panic - not syncing: junk in compressed archive  <===

 Looks like your cpio archive is compressed with an algorithm that is
not recognized by your kernel configuration...  Can you check:

- that the generated rootfs.cpio.* is a valid compressed archive; and
- that the compression algorithm is configured in the kernel.


> [    0.126574] Call Trace:
> [    0.155738] [ec057f00] [c0006fe4] show_stack+0x78/0x18c (unreliable)
> [    0.231769] [ec057f40] [c02f0db4] panic+0xc0/0x1e8
> [    0.289055] [ec057f90] [c03c4370] populate_rootfs+0x34/0xc8
> [    0.355714] [ec057fa0] [c0001cc0] do_one_initcall+0xf4/0x1ec
> [    0.423418] [ec057fd0] [c03c2388] kernel_init+0x194/0x24c
> [    0.488000] [ec057ff0] [c000dcd0] kernel_thread+0x4c/0x68
> [    0.552583] Rebooting in 5 seconds..
> 
> 
> We are not putting the rootfs inside the kernel image, but next to it.
> The kernel is notified of the location of this image using the device
> tree.
> 
> Looking at the changes you did above, I'm a bit confused about when
> the target linux26-rebuild-with-initramfs is supposed to be built. In
> my case, BR2_TARGET_ROOTFS_INITRAMFS is not set
> (BR2_TARGET_ROOTFS_CPIO is), so the TARGETS variable does not contain
> target 'rootfs-initramfs'. This means the variable
> ROOTFS_INITRAMFS_POST_TARGETS is never considered.

 If you're using an initramfs that is not linked into the kernel, then 
you're not using the BR2_TARGET_ROOTFS_INITRAMFS infrastructure, so you
shouldn't be affected by this patch.

 linux26-rebuild-with-initramfs is only needed to create a kernel with
the embedded initramfs.

> 
> Is this expected behavior?
> I cannot yet prove that this patch caused the behavior I'm seeing (I'm
> currently investigating this further), but it would be nice to get
> some feedback already.

 This patch should be relatively easy to revert, no?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120313/acecf578/attachment-0001.html>
