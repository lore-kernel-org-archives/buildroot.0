Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BCBC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 10:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72D9A81399;
	Mon, 27 Dec 2021 10:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0zd2lWM1pO22; Mon, 27 Dec 2021 10:56:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA06E81394;
	Mon, 27 Dec 2021 10:56:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FA441BF4DB
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ED434055D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=walle.cc
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P7hMjxFqelSS for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 10:56:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3181401ED
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 10:56:02 +0000 (UTC)
Received: from mwalle01.kontron.local. (unknown
 [IPv6:2a02:810b:4340:43bf:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E47D422236;
 Mon, 27 Dec 2021 11:55:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1640602560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RFBMGjgWSW//JWARfZW+ov1zLwqMbtMKY0Jn3dBtYl4=;
 b=ROwXoCDVjDlvKHHavNHFFG+rnrds4xRAJmP6c95Eegu6JDvw2RZbD9INaqb55mX2EsPHli
 NvKD6sco/xxOrCDZf4hbb9LbXWgRtvqyvpf8SkKW5I/lBkXm1cnP+l+eyt4pVm/ge0h+AE
 5TUZllD2bo/knzi7x0Oe8+cKfdeKSF0=
From: Michael Walle <michael@walle.cc>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 11:55:50 +0100
Message-Id: <20211227105550.916883-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/kontron_smarc_sal28: move gpt between
 rcw and bootloader
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
Cc: Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

genimage v15 complains about the GPT overlapping with the RCW. Move it
to offset 16k which is between the rcw (which isn't expected to grow
much more) and the bootloader.

This will fix the following error:
ERROR: hdimage(sdcard-emmc.img): partition [GPT array] (offset 0x400, size 0x4000) overlaps previous partition rcw (offset 0x1000, size 0x580)
ERROR: hdimage(sdcard-emmc.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.

Signed-off-by: Michael Walle <michael@walle.cc>
---

Please note, that this patch applies on top of
https://lore.kernel.org/buildroot/20211219142035.6220-2-peter@korsgaard.com/

 board/kontron/smarc-sal28/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/kontron/smarc-sal28/genimage.cfg b/board/kontron/smarc-sal28/genimage.cfg
index 0ad020b347..c885cd51a6 100644
--- a/board/kontron/smarc-sal28/genimage.cfg
+++ b/board/kontron/smarc-sal28/genimage.cfg
@@ -1,6 +1,7 @@
 image sdcard-emmc.img {
 	hdimage {
 		partition-table-type = "gpt"
+		gpt-location = 16K
 	}
 
 	partition rcw {
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
