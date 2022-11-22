Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD67C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9AF960A66;
	Mon,  5 Dec 2022 11:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9AF960A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DIE2w7C_e5wp; Mon,  5 Dec 2022 11:33:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09272607E3;
	Mon,  5 Dec 2022 11:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09272607E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6AB21BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91D1360A66
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91D1360A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Otgch0W_OUqA for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD24C606E6
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD24C606E6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCEC485BBF; Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 23:32:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59adb53c4cdbd6805ab9a2905d0badcd7f2bd25c
X-Git-Newrev: 558946676958ed471d5c72867318a1b61b6e0e69
X-Patchwork-Hint: ignore
Message-Id: <20221205112610.BCEC485BBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-firmware: add overlays/README
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=558946676958ed471d5c72867318a1b61b6e0e69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If a custom os_prefix directory is specified then the Raspberry Pi
firmware probes for the README file in overlays directory. If
this is not found then firmware will use the top-level overlays
directory which can be confusing if os_prefix is used in conjunction
with other filters to implement alternate boot behaviour.

In Raspberry Pi OS the README file is always included to ensure
that the relevant documentation is in sync with the overlays. Rather
that including the entire file let's just include an empty file so
that overlays directory is consistent with the Raspberry Pi OS
APT package.

From
https://www.raspberrypi.com/documentation/computers/config_txt.html#overlay_prefix

Unless ${os_prefix}${overlay_prefix}README exists, overlays are shared
with the main OS (i.e. os_prefix is ignored).

Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpi-firmware/rpi-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 6f5902fd52..53d6d8ca06 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -57,6 +57,7 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 		$(INSTALL) -D -m 0644 $(ovldtb) $(BINARIES_DIR)/rpi-firmware/overlays/$(notdir $(ovldtb))
 	)
 	$(INSTALL) -D -m 0644 $(@D)/boot/overlays/overlay_map.dtb $(BINARIES_DIR)/rpi-firmware/overlays/
+	touch $(BINARIES_DIR)/rpi-firmware/overlays/README
 endef
 else
 # Still create the directory, so a genimage.cfg can include it independently of
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
