Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F0FD44D50
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 11:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C56A660844;
	Wed,  6 Nov 2024 11:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5m0-DFt3fvj; Wed,  6 Nov 2024 11:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B605E608A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B605E608A9;
	Wed,  6 Nov 2024 11:31:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F1B527D1
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 11:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C350811AE
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 11:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hdioDz3oyvBp for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 11:31:15 +0000 (UTC)
X-Greylist: delayed 306 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 06 Nov 2024 11:31:14 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFA43804D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFA43804D1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:4f8:c2c:c44::2;
 helo=vps5.t-kindler.de; envelope-from=mail_buildroot@t-kindler.de;
 receiver=<UNKNOWN> 
Received: from vps5.t-kindler.de (vps5.t-kindler.de [IPv6:2a01:4f8:c2c:c44::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFA43804D1
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 11:31:14 +0000 (UTC)
Received: by vps5.t-kindler.de (Postfix, from userid 33)
 id 4F584E14A6; Wed,  6 Nov 2024 12:26:04 +0100 (CET)
Received: from 81.173.6.13 (SquirrelMail authenticated user thomask)
 by t-kindler.de with HTTP; Wed, 6 Nov 2024 12:26:04 +0100
Message-ID: <cb32292a0142d6f4e097385272e6fb83.squirrel@t-kindler.de>
Date: Wed, 6 Nov 2024 12:26:04 +0100
From: "Thomas Kindler" <mail_buildroot@t-kindler.de>
To: buildroot@buildroot.org
User-Agent: SquirrelMail/1.5.2 [SVN]
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=t-kindler.de; s=default; t=1730892364;
 bh=uUQPKHwf4QnD5n2gDopoGDlUnBREPBPMmv9qb3LG1hE=;
 h=Date:Subject:From:To:From;
 b=d9R+LnQirrj/GGqeQ1VwSgwCsItnGokyNQ1J1w/msNKex3MlRDQdjEXg7UJDG+wVv
 UxXuuB7fRAY3h/i9lyhVCAAojRvEL5Wr3kidqLyZEwMVBUeDPyAEY1Z2kzavAlA5CS
 WOXiBL8odqQe0BZerA69ty5QALv+LL5lSyGrz1/PUaRL3NdGU0iu9BCzf3mUAHijOH
 tdnHioiIHV/AVzvTNbfWCQY46UiZRWuwRLsSBPnlnEamR9RCyhrMve48XHi5anL5cj
 hMBN+LOMJYjVm+wjZFkM1cxTtzj0TrhJcVSTS7FTkDMmLSVdLIp1/BBKwnxNmX+jNo
 lUVgcnBDwJqjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=t-kindler.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=t-kindler.de header.i=@t-kindler.de header.a=rsa-sha256
 header.s=default header.b=d9R+LnQi
Subject: [Buildroot] Hybrid UEFI-Only CD-ROM image with systemd-boot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi!

I'm using Buildroot 2024.05.2 to build a PREEMPT-RT system for an
UEFI-Only x86-64 industrial server PC.

I'm using systemd as the init system with systemd-boot as the bootloader.
The root file system is compiled into the linux kernel by using
BR2_TARGET_ROOTFS_INITRAMFS.

I generate an UEFI-Bootable usbstick.img containing a single efi-part.vfat
partition with the following contents:

$ tree efi-part --charset X
efi-part
|-- bzImage -> /home/myuser/os74000/output/images/bzImage
|-- EFI
|   |-- BOOT
|   |   |-- bootx64.efi
|   |   `-- memtest.efi -> /home/myuser/os74000/output/images/memtest.efi
|   |-- Linux
|   `-- systemd
|       `-- systemd-bootx64.efi ->
/home/myuser/os74000/output/target/usr/lib/systemd/boot/efi/systemd-bootx64.efi
|-- loader
|   |-- entries
|   |   |-- memtest.conf
|   |   `-- usbstick.conf
|   `-- loader.conf
`-- shellx64.efi ->
/home/myuser/os74000/buildroot-external/board/pc/shellx64.efi

7 directories, 8 files


This usbstick.img works great.


Unfortunately, one of our server-BMCs only supports virtual CD-ROM images.

Buildroot does not seem to have an official option to build those when
using systemd-boot. BR2_TARGET_ROOTFS_ISO9660 is only available when
isolinux is used.

So I do my own image generation following instructions from

https://wiki.syslinux.org/wiki/index.php?title=Isohybrid#UEFI

My post-image.sh contains these lines:


rm -f $BINARIES_DIR/*-cdrom.iso
mkdir -p $BINARIES_DIR/cdrom

cp $BINARIES_DIR/efi-part.vfat $BINARIES_DIR/cdrom
cp $BINARIES_DIR/syslinux/isolinux.bin $BINARIES_DIR/cdrom

xorriso -as mkisofs \
  -o $BINARIES_DIR/cdrom.iso \
  -isohybrid-mbr $HOST_DIR/usr/share/syslinux/isohdpfx.bin \
  -eltorito-catalog boot.cat \
  -eltorito-boot isolinux.bin -no-emul-boot -boot-load-size 4
-boot-info-table \
  -eltorito-alt-boot -e efi-part.vfat -no-emul-boot \
  -isohybrid-gpt-basdat \
  $BINARIES_DIR/cdrom


The resulting cdrom.iso image works fine when mounted as a (virtual) CD-ROM.

But it does not work correctly when dd-copied to an USB stick!

The partition table looks like this:

$ fdisk -l cdrom.iso
Disk cdrom.iso: 129 MiB, 135266304 bytes, 264192 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x3a388812

Device     Boot Start    End Sectors  Size Id Type
cdrom.iso1 *        0 264191  264192  129M  0 Empty
cdrom.iso2        136 262207  262072  128M ef EFI (FAT-12/16/32)


The UEFI-BIOS will actually load systemd-boot from such an USB stick.
And systemd-boot will load the bzImage.

BUT: systemd-boot does not set 
LoaderDevicePartUUID-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f, as it does when
booting from my normal usbstick.img.

This trips up my /sbin/init script, which has to decide if /boot has to be
mounted from /dev/sr0 + loop back mount of efi-part.vfat, or from the
given EFI var.


When inserting the dd-copied stick, it will show up as:

  /dev/sda1 - containing the useless CD-ROM contents as an ISO9660 file
system
  /dev/sda2 - what i actually need -- my EFI FAT partition contents!


So my questions are:

1) How can I get xorriso to generate an image with only the EFI partition?

- I can not use fdisk to remove partition 1, because it will "remove the
iso9660 signature" on write.

2) Shouldn't xorriso generate a GPT table? fdisk says "Disklabel type: dos"

3) Why do I need isohdpfx.bin and isolinux.bin at all?!
I only want to support UEFI systems, and this seems to be legacy BIOS
related?


best regards,
-- 
Thomas Kindler <mail_buildroot@t-kindler.de>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
