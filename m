Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598A1E7716F
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 21:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 183DA60658;
	Wed,  4 Dec 2024 21:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_ilV7pH9c61; Wed,  4 Dec 2024 21:24:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AE6D607A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AE6D607A0;
	Wed,  4 Dec 2024 21:24:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8412CAE8
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70AB841385
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id te5eabdvCOsH for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 21:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 529B841391
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 529B841391
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:24:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B0F9868D5; Wed,  4 Dec 2024 21:24:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Dec 2024 22:17:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 014a8201c857e81abeca026211e84f9c9353c9ba
X-Git-Newrev: 7dd56b6cd928ee36c96a697075e3fa47b0c52d5e
X-Patchwork-Hint: ignore
Message-Id: <20241204212413.3B0F9868D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2/readme.txt: don't specify
 /dev/loop0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7dd56b6cd928ee36c96a697075e3fa47b0c52d5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

losetup -f returns the next free loop device, which may not be
/dev/loop0.  If you blindly follow the readmy you may end up destroying
an existing device.

Make it more robust with a variable to store the loop device.

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
[Arnout: keep the actual losetup atomic]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 boot/grub2/readme.txt | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/boot/grub2/readme.txt b/boot/grub2/readme.txt
index 5d59fb4e22..90866e83a9 100644
--- a/boot/grub2/readme.txt
+++ b/boot/grub2/readme.txt
@@ -10,20 +10,20 @@ Notes on using Grub2 for BIOS-based platforms
       is enough free space *before* the first partition to
       store Grub2. Leaving 1 MB of free space is safe.
 3. Setup loop device and loop partitions
-   sudo losetup -f disk.img
-   sudo partx -a /dev/loop0
+   loop_dev=$(sudo losetup -f disk.img)
+   sudo partx -a "$loop_dev"
 4. Prepare the root partition
-   sudo mkfs.ext3 -L root /dev/loop0p1
-   sudo mount /dev/loop0p1 /mnt
+   sudo mkfs.ext3 -L root "${loop_dev}p1"
+   sudo mount "${loop_dev}p1" /mnt
    sudo tar -C /mnt -xf output/images/rootfs.tar
    sudo umount /mnt
 5. Install Grub2
    sudo ./output/host/sbin/grub-bios-setup \
         -b ./output/host/lib/grub/i386-pc/boot.img \
-        -c ./output/images/grub.img -d . /dev/loop0
+        -c ./output/images/grub.img -d . "$loop_dev"
 6. Cleanup loop device
-   sudo partx -d /dev/loop0
-   sudo losetup -d /dev/loop0
+   sudo partx -d "$loop_dev"
+   sudo losetup -d "$loop_dev"
 7. Your disk.img is ready!
 
 Using genimage
@@ -65,22 +65,22 @@ Notes on using Grub2 for x86/x86_64 EFI-based platforms
     - Create a second partition, type 8300, for the root
       filesystem.
 3. Setup loop device and loop partitions
-   sudo losetup -f disk.img
-   sudo partx -a /dev/loop0
+   loop_dev=$(sudo losetup -f disk.img)
+   sudo partx -a "$loop_dev"
 4. Prepare the boot partition
-   sudo mkfs.vfat -n boot /dev/loop0p1
-   sudo mount /dev/loop0p1 /mnt
+   sudo mkfs.vfat -n boot "${loop_dev}p1"
+   sudo mount "${loop_dev}p1" /mnt
    sudo cp -a output/images/efi-part/* /mnt/
    sudo cp output/images/bzImage /mnt/
    sudo umount /mnt
 5. Prepare the root partition
-   sudo mkfs.ext3 -L root /dev/loop0p2
-   sudo mount /dev/loop0p2 /mnt
+   sudo mkfs.ext3 -L root "${loop_dev}p2"
+   sudo mount "${loop_dev}p2" /mnt
    sudo tar -C /mnt -xf output/images/rootfs.tar
    sudo umount /mnt
 6  Cleanup loop device
-   sudo partx -d /dev/loop0
-   sudo losetup -d /dev/loop0
+   sudo partx -d "$loop_dev"
+   sudo losetup -d "$loop_dev"
 7. Your disk.img is ready!
 
 To test your i386/x86-64 EFI image in Qemu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
