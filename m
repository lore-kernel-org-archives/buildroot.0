Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08499C3DA5D
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 21:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA06940EBE;
	Wed, 17 Jul 2024 21:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jNpHlYg8_1I; Wed, 17 Jul 2024 21:17:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16C9740EB3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16C9740EB3;
	Wed, 17 Jul 2024 21:17:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F239E1BF385
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF78F40319
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FuKZTsTpv95f for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 21:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB7FD402B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB7FD402B9
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 21:17:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2364786D82; Wed, 17 Jul 2024 21:17:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 23:13:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0ceb0ac5833aeec4c86e992ff324810a860ba84
X-Git-Newrev: 51090999ca3c817237b35022ce245a89562236c5
X-Patchwork-Hint: ignore
Message-Id: <20240717211735.2364786D82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/raspberrypi3_64: remove upstream
 device-tree blob
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0136382061210529838=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0136382061210529838==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=51090999ca3c817237b35022ce245a89562236c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are two kind of device-tree blobs up to the Rasperry Pi 3[1][2]:
 - the downstream dtbs are named after the die name (i.e. BCM27xx)
 - the upstream dtbs are name after the package name (i.e. BCM283x)

Every defconfigs install exclusively the downstream device-tree blob, at
the exception of the raspberrypi3_64_defconfig that installs both since
the begining.

This removes the upstream device-tree blob for the beauty of
consistency.

Note: It is possible to load the upstream device-tree using the
upstream_kernel property[3].

Raspberry Pi, Compute Module, Raspberry Pi Zero and Raspberry Pi Zero W
use bcm2835 for upstream and bcm2708 for downstream.

Raspberry Pi 2 uses bcm2836 for upstream and bcm2709 for downstream.

Raspberry Pi 2 rev 1.2, Raspberry Pi 3, Compute Module 3/3+ and
Raspberry Zero 2 W use bcm2837 for upstream and bcm2709 for downstream.

Raspberry Pi 4/400 and Compute Module 4/4s uses bcm2711 and Raspberry Pi
5 uses bcm2712.

[1]: https://github.com/raspberrypi/linux/issues/3237
[2]: https://www.raspberrypi.com/documentation/computers/raspberry-pi.html#flagship-series
[3]: https://www.raspberrypi.com/documentation/computers/legacy_config_txt.html#upstream_kernel

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/raspberrypi/readme.txt      | 1 -
 configs/raspberrypi3_64_defconfig | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 0499fe0d51..78c551579a 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -102,7 +102,6 @@ After building, you should obtain this tree:
     +-- bcm2711-rpi-4-b.dtb         [1]
     +-- bcm2711-rpi-cm4.dtb         [1]
     +-- bcm2712-rpi-5-b.dtb         [1]
-    +-- bcm2837-rpi-3-b.dtb         [1]
     +-- boot.vfat
     +-- rootfs.ext4
     +-- rpi-firmware/
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index d6cae400ae..f4ecf2575f 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -20,7 +20,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi3"
 
 # Build the DTB from the kernel sources
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3 broadcom/bcm2837-rpi-3-b"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
 
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 

--===============0136382061210529838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0136382061210529838==--
