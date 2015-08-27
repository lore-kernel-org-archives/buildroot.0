From: =?UTF-8?Q?Beno=c3=aet_Th=c3=a9baudeau?= <benoit@wsystem.com>
Date: Thu, 27 Aug 2015 11:02:02 +0200
Subject: [Buildroot] [PATCH 4/4] board/raspberrypi: auto-expand rootfs
	on first boot
In-Reply-To: <1440273688-92868-4-git-send-email-benoit@wsystem.com>
References: <1440273688-92868-1-git-send-email-benoit@wsystem.com>
 <1440273688-92868-4-git-send-email-benoit@wsystem.com>
Message-ID: <55DED20A.5030800@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vivien, Yann, all,

On 22/08/2015 22:01, Beno?t Th?baudeau wrote:
> Add init scripts to auto-expand the persistent rootfs on the first boot
> to fill the medium.
> 
> These scripts follow the same procedure as raspi-config. The root
> partition is first expanded, then a reboot is required, then the rootfs
> is expanded. Each script removes itself once run.
> 
> The volatile (initramfs) rootfs is not affected by this change.
> 
> The instructions in readme.txt are updated accordingly.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>

[...]

> diff --git a/board/raspberrypi/rootfs-overlay/etc/init.d/S23expand-rootfs b/board/raspberrypi/rootfs-overlay/etc/init.d/S23expand-rootfs
> new file mode 100755
> index 0000000..7b3f286
> --- /dev/null
> +++ b/board/raspberrypi/rootfs-overlay/etc/init.d/S23expand-rootfs
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +
> +case "$1" in
> +	start)
> +		echo -n "Expanding the root FS: "
> +		resize2fs /dev/mmcblk0p2 &>/dev/null

I had first tested this on a Raspberry Pi B using a 2-GiB SD card. It worked
fine and it was very quick.

I've just tested this on a Raspberry Pi B+ using a 8-GiB SD card. First, I got:

    [    6.831228] EXT4-fs (mmcblk0p2): resizing filesystem from 130322 to 7611388 blocks
    [    6.838822] EXT4-fs (mmcblk0p2): Converting file system to meta_bg
    [   16.888893] EXT4-fs (mmcblk0p2): resized to 3407537 blocks
    [   20.794071] ------------[ cut here ]------------
    [   20.798723] kernel BUG at fs/jbd2/journal.c:766!
    [   20.803338] Internal error: Oops - BUG: 0 [#1] PREEMPT ARM

    Entering kdb (current=0xcf339b80, pid 44) Oops: (null)
    due to oops @ 0xc02216a8
    CPU: 0 PID: 44 Comm: jbd2/mmcblk0p2- Not tainted 4.1.5 #1
    Hardware name: BCM2708
    task: cf339b80 ti: cf356000 task.ti: cf356000
    PC is at jbd2_journal_next_log_block+0xb0/0xb4
    LR is at jbd2_journal_commit_transaction+0x978/0x1f08
    pc : [<c02216a8>]    lr : [<c0219cd0>]    psr: 60000013
    sp : cf357e00  ip : 00000001  fp : cf357e1c
    r10: ce93851c  r9 : cef22140  r8 : c0218e0c
    r7 : 00000021  r6 : ceedfbc0  r5 : cf357e88  r4 : cedb41e0
    r3 : 00000001  r2 : cf357e00  r1 : cf357e88  r0 : cf336000
    Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
    Control: 00c5387d  Table: 0e6fc008  DAC: 00000015
    CPU: 0 PID: 44 Comm: jbd2/mmcblk0p2- Not tainted 4.1.5 #1
    Hardware name: BCM2708
    [<c0016d08>] (unwind_backtrace) from [<c0013ad0>] (show_stack+0x20/0x24)
    [<c0013ad0>] (show_stack) from [<c0566070>] (dump_stack+0x20/0x28)
    [<c0566070>] (dump_stack) from [<c0010964>] (show_regs+0x1c/0x20)
    [<c0010964>] (show_regs) from [<c00a4b38>] (kdb_main_loop+0x3c8/0x730)
    [<c00a4b38>] (kdb_main_loop) from [<c00a75dc>] (kdb_stub+0x19c/0x3cc)
    [<c00a75dc>] (kdb_stub) from [<c009da00>] (kgdb_handle_exception+0x284/0x8a8)
    more> 

I retried several times with the same result. Then, I fsck'ed and reformatted
the SD card, and I retried with the same sdcard.img as the first time. It worked
fine, but it was extremely slow:

    [    6.803146] EXT4-fs (mmcblk0p2): resizing filesystem from 130322 to 7611388 blocks
    [    6.826546] EXT4-fs (mmcblk0p2): Converting file system to meta_bg
    [   16.884732] EXT4-fs (mmcblk0p2): resized to 3423841 blocks
    [   26.912318] EXT4-fs (mmcblk0p2): resized to 4442841 blocks
[...]
    [  768.704191] EXT4-fs (mmcblk0p2): resized to 7581361 blocks
    [  775.571684] EXT4-fs (mmcblk0p2): resized filesystem to 7611388

So the initial contents of the unused space on the SD card seem to have an
influence, and there seems to be a bug somewhere (Linux, resize2fs, genext2fs,
tune2fs, or lack of call to e2fsck before calling resize2fs but this would not
be reliable with an online partition).

Then I retried with a 16-GiB SD card on a Raspberry Pi B, and it was very slow
too. Same if the resize is performed on a PC. However, it's very quick with
raspi-config and the latest Raspbian image. The main difference seemed to be the
block size (4 KiB on Raspbian vs. 1 KiB with mke2img), so I hacked mke2img to
test with genext2fs -B 4096 and tune2fs -J size=4, but it did not make things
faster, only the image bigger (about 512 MiB, probably the minimal size for
4-KiB blocks). So I don't know which ones, but it's probably some ext4
parameters that are having an influence on the resize2fs speed here. Any idea?

So what do you think would be the best thing to do here?
 1) Find the set of ext4 parameters making resize2fs faster and change mke2img
    and fs/ext2/* to make it possible to use these parameters.
 2) Just drop this patch from the series because the resize will probably always
    be slow for some larger SD cards.

If 2), would you keep the auto ext4 size as in the current 3/4, or would you
set a fixed size with some significant free space margin (e.g. 512 MiB)?

Best regards,
Beno?t
