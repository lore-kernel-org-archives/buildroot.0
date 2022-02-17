Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EE3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 15:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06F35833CD;
	Thu, 17 Feb 2022 15:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id smjXHI-ruGb9; Thu, 17 Feb 2022 15:56:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34F6983F87;
	Thu, 17 Feb 2022 15:56:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB2EE1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D68CC6F66E
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 15:56:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=othermo.de
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LOOQMYD5HcqI for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 15:56:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org [195.10.208.51])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EFCE761C39
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 15:55:59 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4JzzvK30F0z9spc;
 Thu, 17 Feb 2022 16:55:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1645113355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r3s4hNvYZ3tbhx3OS9JdAw7qS7c9XH/cjH5TkyAR5rw=;
 b=NlblxvINoreRYtQ3Zj3eRzT6BOLDFH3urBf9mczZJBGsBR3tgwyYQK6c5+grZTzIN4mLqL
 R5MDBV7bDARYqQRTUBnyU5VscDiB/hSjygWmt6Y+6KUb6MdpG8WhdxLHyG1AxNftsd9WtH
 DiY+dTOmsED7Sl6IuRNxQGDA6q90W1vCpbjYPmGYcqsgd7mcs4me9RbJxDlUhLjj5Wg7i5
 0catIGuI9HI20QWGlxoyv74U8qWsRTQ2jhDaEI4dAHJMFCQqqCIGy5hRSHVEkJZiZGRBlh
 ZgCcy5yJIMjPSEVWhcZcL94/1whn/FoHp1o5x1WiuJxj9cdxjP2pUxIuZ8b9Qw==
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 16:55:49 +0100
Message-Id: <20220217155549.1084829-3-marcus.hoffmann@othermo.de>
In-Reply-To: <20220217155549.1084829-1-marcus.hoffmann@othermo.de>
References: <20220217155549.1084829-1-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] board/orangepi/orangepi-rk3399/genimage:
 fix partition types for gpt
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following error during image generation:
  ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid
  for mbr and hybrid partition-table-type

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2103784375

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
---
 board/orangepi/orangepi-rk3399/genimage.cfg | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-rk3399/genimage.cfg b/board/orangepi/orangepi-rk3399/genimage.cfg
index c94e0bc7cc..a02166172f 100644
--- a/board/orangepi/orangepi-rk3399/genimage.cfg
+++ b/board/orangepi/orangepi-rk3399/genimage.cfg
@@ -26,14 +26,13 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type = 0xC
+		partition-type-uuid = F
 		bootable = "true"
 		image = "boot.vfat"
 		offset = 16M
 	}
 
 	partition rootfs {
-		partition-type = 0x83
 		image = "rootfs.ext4"
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
