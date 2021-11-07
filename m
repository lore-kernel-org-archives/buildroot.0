Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF95C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:52:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2B4561881
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2B4561881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C52A60671;
	Sun,  7 Nov 2021 02:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11BJxvZbUC6X; Sun,  7 Nov 2021 02:52:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 037D36066C;
	Sun,  7 Nov 2021 02:52:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62C591BF976
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DD93400EA
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9WEbmIXQwBAA for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:45:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CCE94022C
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:45:26 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYBRmR7uJ; Sun, 07 Nov 2021 03:45:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253125; bh=vMCXGEv1tla8h6FnF85/l9PtzgkDlW4iqJ/oYARPvUk=;
 h=From:To:Subject:Date:MIME-Version;
 b=TtyMoDuE0XLEp6ypu1tfgGrH1j7R9Tw7ERtJj29jMMMZUw+7PP2KSku2FPJBUYrN8
 r0F6dDMDsNnb/ZlPizsZf+LoF2THwUO0scS03Se80aVgxWoU8BgRTPg9uXSpL8exzb
 TI9gzxg4EjPWreEczjstTL8Af8MSTL6aYJi53MjttuyP/28FRhv+g/cPwGf0jlcbE4
 XvAvd4cSd28KDt9LNnMSfrGA5kqf1XS6KwAXCdl3JdBDrOvJkY3HAX6MVmBfu2DC4+
 DUuYrUVtOfVED9i+aB0yh8dA9xFQGeE31wKnzhMLkg9gkKA9sXs71B6PBhDzrM9HEl
 ka0q3D/ZoisIA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:26 +0100
Message-Id: <20211107024330.3061378-39-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfIOuknDcUb7egz50AX98X8UJTf3OudF1Bv9dEiB+ADg9vFLA6mqcPzDmRxICAbq5h9BRTETG6SD+PHmbAuAoAxOzY/pF2XhIiagytt+9JRcVNs05xoy4
 urE2xTYzlFaz+SVNF+wwGVEjxs9IJ9PgCrB/AblDr8f31fDaSbZs+lBY56YL5pW72Oxfmdk2YAiShLxik5eMlNXdRm8BJ7Hie1hDVVlwONd7QiyYlXy1Xc8l
 oIInSZD18dBljW9gQ3gIvxTSotODNIi08Oxa3lIHCXo=
Subject: [Buildroot] [PATCH 098/102]
 board/terasic/de10nano_cyclone5/genimage.cfg: beautify file
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
 board/terasic/de10nano_cyclone5/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/terasic/de10nano_cyclone5/genimage.cfg b/board/terasic/de10nano_cyclone5/genimage.cfg
index 76b1d03649..815e4a1bf3 100644
--- a/board/terasic/de10nano_cyclone5/genimage.cfg
+++ b/board/terasic/de10nano_cyclone5/genimage.cfg
@@ -16,6 +16,7 @@ image boot.vfat {
 			image = "barebox-env"
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
