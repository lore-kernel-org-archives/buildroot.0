Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466A1C77B71
	for <buildroot@archiver.kernel.org>; Fri, 14 Apr 2023 18:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FCA684311;
	Fri, 14 Apr 2023 18:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FCA684311
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Dak-LGikfz3; Fri, 14 Apr 2023 18:28:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3C3084312;
	Fri, 14 Apr 2023 18:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3C3084312
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BADF11C3F70
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 18:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A184460BD4
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 18:28:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A184460BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5RX_2rWzgjWT for <buildroot@lists.busybox.net>;
 Fri, 14 Apr 2023 18:28:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7683560BBF
 for <buildroot@buildroot.org>; Fri, 14 Apr 2023 18:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7683560BBF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65B6484104; Fri, 14 Apr 2023 18:28:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Apr 2023 20:28:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d45538f2e7acc1b330b191d559a81e8c1a961648
X-Git-Newrev: 7a4e8355e3751f620ef91239a1c61a9c1c41d5ca
X-Patchwork-Hint: ignore
Message-Id: <20230414182845.65B6484104@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/pc/linux.config: Add framebuffer and
 pci support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7a4e8355e3751f620ef91239a1c61a9c1c41d5ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Virtually all PCs nowadays have a PCI bridge and PCI devices.

All framnebuffer options depend on CONFIG_FB, which default is not 'y',
so also enable that.

The overwhelming majority of PCs nowadays also come with an UEFI
bootloader, that configures a framebuffer usable in early boot, which
the kernel can reuse without needing any hardware-specific driver.

EDID allows retrieving the capabilities of the connected display,
especially the frequencies and so on, to properly drive the display.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[yann.morin.1998@free.fr:
  - drop cosmetic CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=y
  - rewrite commit log to explain all new options
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/pc/linux.config | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/board/pc/linux.config b/board/pc/linux.config
index f86352e1ea..43b15c94be 100644
--- a/board/pc/linux.config
+++ b/board/pc/linux.config
@@ -15,6 +15,7 @@ CONFIG_IP_NF_FILTER=y
 CONFIG_CFG80211=m
 CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=m
+CONFIG_PCI=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_VIRTIO_BLK=y
@@ -63,7 +64,10 @@ CONFIG_DRM_I915=y
 CONFIG_DRM_QXL=y
 CONFIG_DRM_BOCHS=y
 CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_FB=y
+CONFIG_FIRMWARE_EDID=y
 CONFIG_FB_VESA=y
+CONFIG_FB_EFI=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_HDA_INTEL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
