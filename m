Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B9EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 14:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FAC9408BA;
	Mon, 25 Apr 2022 14:42:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ezzS0w4LvD2E; Mon, 25 Apr 2022 14:42:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DA3C4088B;
	Mon, 25 Apr 2022 14:42:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77F861BF398
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 14:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CC2C8174A
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 14:42:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ax_rwpCHUw9b for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 14:42:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-36.italiaonline.it [213.209.10.36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04319814B3
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 14:42:31 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it ([87.0.15.73])
 by smtp-36.iol.local with ESMTPA
 id izv1nXR5Qc2f5izv3nVu5n; Mon, 25 Apr 2022 16:42:29 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1650897749; bh=/SCUrr3Ujl9KQG9XQjm2QBiOqaBRHDTRlBUUxxSVL1M=;
 h=From;
 b=ZZJs782fsZn8Bj4eDgQqgvEkCDT/o2paxdCgUagM65VgcYenE1oDnVqcvjZL0EykZ
 UQLDtpMiJAz5+JsPm1cyFnpAdSA/iRAJoLDqweX4vJJODYkbm9cw91fuwk02csVfGU
 FGarVlL/1WfEIaZ3aquwHCqhUPb5dLcxO1qC6FbrFGux7feAegz6YsDTxApEyGgyQs
 VmKpLNe/sB+KFZBYQ92EF7f34XoBgJwtrrugt4YjyB5C/Dy15wozHs3OoiuuZ9BEpo
 ereRtGFgV0ZvDPeWzI81cXYM92p8FgRBceG1fKShpg6lqpnuHpdgi97wccbC2YCTf0
 Phn54gbMPNnYg==
X-CNFS-Analysis: v=2.4 cv=Z6kpoFdA c=1 sm=1 tr=0 ts=6266b355 cx=a_exe
 a=h5x6SpL9bzIPZN26QICeQA==:117 a=h5x6SpL9bzIPZN26QICeQA==:17 a=bWA9glH3AAAA:8
 a=0dnGUcQqso1VvNNRjEcA:9 a=2xSWHMq_R3_OBoRbKrM1:22
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 16:42:13 +0200
Message-Id: <20220425144213.3937-2-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220425144213.3937-1-dariobin@libero.it>
References: <20220425144213.3937-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfLBjXEevb+GLtWbB8QBjLL7LD2n04iguUW2gbPdcD7YR+VYvvy2l6FFpONQyMDbAo+I9xtXlHlQ3sbbigvsC8H4YvT2+oM+V2GjF/sLQwogupW73eKGc
 5mIeWPzat4FiRnmcTiIU0J70mj6YS3uqB8smThp8409YIBfPJvjbwj2nCfuPiYyOL1N7SituvehRlfT8HiWfdS/syNgto8ipZ0mTxWl/yxI2z6bUkX6WNzhC
 H8wVbxD1isUOFsE1V8kMSOfzZ513yZ8FyPQBU0FhvQsP1ywQT2ggnKcz3cxbyPn6
Subject: [Buildroot] [PATCH 2/2] package/libmnl: add myself to DEVELOPERS
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add myself to DEVELOPERS as maintainer of libmnl.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1bb90f8f33..4ddbf5d533 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -654,6 +654,7 @@ F:	package/xinetd/
 
 N:	Dario Binacchi <dariobin@libero.it>
 F:	package/davinci-bootcount/
+F:	package/libmnl/
 
 N:	David Bachelart <david.bachelart@bbright.com>
 F:	package/ccrypt/
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
