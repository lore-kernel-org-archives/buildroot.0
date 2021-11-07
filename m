Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6A6C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:52:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50E766187D
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50E766187D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A9366073C;
	Sun,  7 Nov 2021 02:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id taCdXZqtlrv4; Sun,  7 Nov 2021 02:52:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78AED6072E;
	Sun,  7 Nov 2021 02:52:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CCB01BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF329402C2
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64orXpVunmK3 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:45:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8CB5402CA
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:45:27 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYBTmR7ul; Sun, 07 Nov 2021 03:45:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253127; bh=b0k04+Ah00IEGo5u4TaQfPA9xu3OTkBPbeiX0r3/+sg=;
 h=From:To:Subject:Date:MIME-Version;
 b=NDAljesYZ28ZTH7OF1n834nry5cFDskwzAETD8pRDSR3w1dctj1uQCT1BtDG7RSvp
 4Pk1+M3Q4DWZS8MgFKgqAi0KmM9tgptA0oIfIS9hN/BsA4NxfP4JyXxp/pm4DmOZum
 7YVxvpr5YoxLkdPloRHrW1KYPOPS0egTwInL0ybXbdvsQZ/CvNq+YD6J2ev34AW7ou
 6pNYU/RXxizfzQEcCdHFjudACCEW4VQvceJHepEp8zOUXMyxH46OYolEPhrl0JbK3k
 gYzkaLuCowpuPDkRHy3xBE5I3njFkCUbRVPZMwoMPgQXkrVhdFzl9gh+cn2h5z2t9X
 tqLetKt6xc9xQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:28 +0100
Message-Id: <20211107024330.3061378-41-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJzVPA6m5pJzJ0iKq80EfBdXvL/0ev51IfSziZIrlqElTgBZXfmPoOCxOOT3RLGMWk1axRzBPTBxHJSh/8l9zRBrmWIQVwQgQOoycA2e60E2jNnjT6Up
 606At9+fpo9XSRIF7H+Jleq6HM7dwEHEWOy8eoAhyP9nrYXfg4armgW3lh8MyUm32yJ+9LFUdiRQM4k1Qi/PC2HrpfaROqavHIkUSn5GiKNFyxz+NIJfdo2b
 YPASgVVe6Z1y868C+1d0lbEnLy3c+NwTuZXO96uG67w=
Subject: [Buildroot] [PATCH 100/102] board/uevm5432/genimage.cfg: beautify
 file
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
 board/uevm5432/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/uevm5432/genimage.cfg b/board/uevm5432/genimage.cfg
index f30033f023..dfe388227e 100644
--- a/board/uevm5432/genimage.cfg
+++ b/board/uevm5432/genimage.cfg
@@ -5,6 +5,7 @@ image boot.vfat {
 			"u-boot.img"
 		}
 	}
+
 	size = 8M
 }
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
