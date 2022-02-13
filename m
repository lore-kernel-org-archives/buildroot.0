Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB22C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 22:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 920098140F;
	Sun, 13 Feb 2022 22:57:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZ2j1MF05onl; Sun, 13 Feb 2022 22:57:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D13B78140D;
	Sun, 13 Feb 2022 22:57:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 311011BF834
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F638813C0
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id au4zFMc0NevV for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 22:54:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A170813E4
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 22:54:25 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JNl9nWlaeNVvLJNlAnnPCC; Sun, 13 Feb 2022 23:54:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644792864; bh=KVDlY0xAnhzZiW80BQimWRdieN1sty4K0L+V31wJuVI=;
 h=From:To:Subject:Date:MIME-Version;
 b=lENplRpRLFpsxl9dVDrsLSqCxeWbpE8qBYTtal4eqI5KgzM3fj23C5Q3cDTl9Xn38
 06blQRyldfj/8lmYkU6ZxJbeqCYgp4ROzroqC5LM6BrQpQozq4ExXeocB9GVjvPQDx
 3bdQuInGoWsY+vBWzQs53BhQN8IPlSsfgFG/xnAE4KjoSHVfbFTonYvmxXerFpXXLh
 l72rDywUT3O0QJi30QVMt7UbzrFFT8M1m2zCwzQNYnQ3aPQHCpnfGqQ61osTDA7IfQ
 gGSm26bS8BBlM4ooNXpjuVQ0/nL5le90G/4S00TK/8J6VzLJlmun7LvVYbMS5HXKuf
 rVnRkzFZQjOpA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 23:54:21 +0100
Message-Id: <20220213225423.3466840-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <49133c66-0a53-7607-1c52-5e1ad9e8fc7b@benettiengineering.com>
References: <49133c66-0a53-7607-1c52-5e1ad9e8fc7b@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfA4TsRKHGMHgPRnx0pUVyhHpZ8hdfZtfQ3HIXuVOnIxErxiMhgELeaRKnXW1shYZiyK7EEqVhRlo1KlwEBdctkMINJB8inzxcSwF7zbkSyQsyx16uXG1
 KvAPqnLr/ragoxiKAuhV3I3y4Jhjkz80k0pVPJw+weaAYwiwW6r82ITIzl87tVF6h7uxsgSG8NJYNCHx8VKEUVa3XAGAIBMN0lHM2qWaDVUXV9u/8bLyn/9+
 jApAzwcxVPac67fxD30pxzn6GCvdwi4eTz8eU/SvARrkEj1XbvUodAbd+14XYAMzI/SJeCwTm2ceT8+kRA6Utj2fau5aPeTNhJT1jGoXJNeLybVEBJ127w18
 FW00V4Uhrtu1m2y515eaYrLsxIWvUpzFZLw7+Yhsa+kP3JPTKYTIWDkpfEpXIVwfKghH+Aryph8i/jx5u9c+fkbe4OheSNRF0dGm4iHa7d5qyWM4EUAF64ym
 BRisVN/b9q2ck6d9lmxE9n1DAtMilTNNFK4EZ8WLBnSR/525Doqa2Ubr14Q0MmheVBNkXhBn64QVZwi+wUB1qdBjh2YEofDdAI27itovXkMR9cNDYt+bKWSF
 tQAGzqG8Z8erfjTMYV7Qd99sTWRB4DGvNfe9HXbGBPC4ccnprr/j1fFCsNe2ubWNsU+d0wWtAjmjUG0rXR/fBmUY
Subject: [Buildroot] [PATCH v2 14/16]
 board/sifive/hifive-unleashed/genimage_sdcard: remove partition-type-uuid
 since its default value is L(rootfs)
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/sifive/hifive-unleashed/genimage_sdcard.cfg | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/sifive/hifive-unleashed/genimage_sdcard.cfg b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
index e66f221d73..1e0c800153 100644
--- a/board/sifive/hifive-unleashed/genimage_sdcard.cfg
+++ b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
@@ -17,7 +17,6 @@ image sdcard.img {
 
 	partition rootfs {
 		image = "rootfs.ext4"
-		partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
 		bootable = true
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
