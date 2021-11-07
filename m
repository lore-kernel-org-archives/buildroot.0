Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE29C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:42:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1477B6124D
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1477B6124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6F284022F;
	Sun,  7 Nov 2021 02:42:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HB5cLjnKfdqN; Sun,  7 Nov 2021 02:42:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1088400EA;
	Sun,  7 Nov 2021 02:42:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 77E271BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7521B4028E
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:42:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TgfCKEzyqNdl for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:42:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp4.osuosl.org (Postfix) with ESMTP id B53CF40289
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:42:15 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY8MmqvpMrIRljY8NmR6iD; Sun, 07 Nov 2021 03:42:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636252935; bh=iO3MLoeLnbSz2BAVw+IZJWI81ym/lq8j6vXhTRt+wxU=;
 h=From:To:Subject:Date:MIME-Version;
 b=jNuGWvo/ed2ORKMqlIPtLbYpOffCf+M1HuShFaIxpfvf6OnTTAOum9qESeF8CD1Vr
 b+TupdCoqw06mWQUVN0QgDRXngDVvrDGDyiIWl4BNuH/YiPw9bED+pVdPhDd/zolCZ
 FugAhQP11gtt4yjN199WRxtrFyfQYd/UCkY9vZ5gYWQf8mgvHFqWzhtNjXLi/ORRdQ
 C4tLOC6KjwhQyN7H5dzXbhCxawSHSr2Nn2Cq3lfBej7q1nbqvXswjayH8Vts9OUcQy
 N9CRdEB6Yr1ncYk/w4DedNyTq9KIbdPC/mq/X6i1FGglwAAG4OXPtMpwiHXsTptl8G
 +kUbyr2OvinCg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:14 +0100
Message-Id: <20211107024214.3061215-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGrT9QYE7FQUVBAoV5mPuzP7IpW8A3jggtk8KujUAJy4dsba9UWYLzelu/W4DtqmAatoodbrT/F8/QsDkhhQ1Et0dS4mK1uJHmE2hf8/LiJQO8lY1tdP
 40KxoG4XYFsYwBFJPwnRByIjQdBa29b7EviowOwiVesFw06QimenzsrXEUUSRd2cdV07x7HB4joSxZLgKznAZAgwVwCB29VQeSQThsVBruekCNU3F6OwmepA
 RaTv8g7CbV2W0dg72jTPQp/MDc30kTTmxsWpSzWDo/A=
Subject: [Buildroot] [PATCH 050/102] board/nexbox/a95x/genimage.cfg:
 beautify file
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/nexbox/a95x/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/nexbox/a95x/genimage.cfg b/board/nexbox/a95x/genimage.cfg
index 63b96107c9..81bcc82c9b 100644
--- a/board/nexbox/a95x/genimage.cfg
+++ b/board/nexbox/a95x/genimage.cfg
@@ -7,6 +7,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 32M
 }
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
