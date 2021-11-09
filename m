Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A2CC433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:19:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB9B2610A0
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB9B2610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E7FA60732;
	Tue,  9 Nov 2021 10:19:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E9-lsPMpHDG7; Tue,  9 Nov 2021 10:19:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA5F260764;
	Tue,  9 Nov 2021 10:19:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 66B511BF2C0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55CF160732
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OfJwIE8p4GM8 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:19:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp3.osuosl.org (Postfix) with ESMTP id 884DF60730
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:19:01 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kODFmziIdyoivkODRmOZoS; Tue, 09 Nov 2021 11:18:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636453140; bh=h3/3S1f9y9sSb9d0uj0k5p4QyK34ijT2ZIhhvizAlqM=;
 h=From:To:Subject:Date:MIME-Version;
 b=nPoIsmgP/TccCskfHrCQoXYkyaE6kqAUoj9vPgrYCCeSIELy9lX3T+EKBBL+UG2an
 1qZg2Qnkhdt5bCkDjk4gMCkW9uloAtfw2hBUdUO7DNm5k9A5XxCReI/nJH24Lqqiaz
 bPnjavUuKaOP9SeILsuMnIZfl5vQN09OLlw6JDEMMlURCrzTCQUV6jaA7MrN0Rq73N
 0HNMikFmM8DR8ZbSjxKDzyICKHwUGC59MnpmRGEJzwrh8kzPfmeOFCDhkN7VUS95l3
 PUFTQ2XLNaqVM4+TrqLr6II4qpuCEL00eDIY9z/hwFu0TVdQLBP1VnoBv2EhbKmmWx
 bIfRXXMBBeCrw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 11:18:38 +0100
Message-Id: <20211109101844.1132067-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
References: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfIPUiE1Wh4S64sll3hdKvC/MB43+TyR7z+yv85pLDbPCT7KBPidPeAxwRrhvJg0P5tvpWOLuy2fLU+CzwfptTcpl+7nIqlcFRvUtc0t9StBzP/IhcxqJ
 jDNz96NBN/DbGmXnXoONof3IoVHuvcAz2wRPssz3kjr+swZRr92o+77+FWQadu6l9ZEzJFXkMwiSy3xtAX0u13mvvgeGL4Pcsl/U/q+ei1WSFI7cFRPC5Uzn
 beOayGSbVocSR4fkFOG/LB0DYF7VGKjiYR68hJxDNqecsxThV2TGNUYUoo94caAjwbPZdhpq4udmjeV2RfNX4uOEKXGZx/U2KWynha8vsK7HhlAqiCmBY5u9
 hSEfbaPs9XXgWzVwmMmLWjRj81FjZpNitAYLZ8uTKOuE43A0gAQBKfnkyoLsftpVyCrX+O3RE43of1Z53hFuTzmtYJzBTwMmbZ9J2QsBjGVl4kVSVZM/kLJ5
 TZmnDYbpzFpzP1vi+L4N7GBS2mNwFljy8W/ye90bd9svEnFPADYkrkT1WDKznqO6hMgrnw/Bm7h4Pii5XlEwfH2KXGSVblQuJmKxz1qYdkcCqqNy70JWrCAR
 mOU=
Subject: [Buildroot] [PATCH v2 3/9]
 board/friendlyarm/nanopi-neo2/genimage.cfg: fix comment
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Luca Ceresoli <luca@lucaceresoli.net>, Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For consistency comment '# 1MB - 40K' must be '# 1MB - 40KB'.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/friendlyarm/nanopi-neo2/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/friendlyarm/nanopi-neo2/genimage.cfg b/board/friendlyarm/nanopi-neo2/genimage.cfg
index 45d081e197..3163a06592 100644
--- a/board/friendlyarm/nanopi-neo2/genimage.cfg
+++ b/board/friendlyarm/nanopi-neo2/genimage.cfg
@@ -24,7 +24,7 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "u-boot.itb"
 		offset = 40K
-		size = 1M # 1MB - 40K
+		size = 1M # 1MB - 40KB
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
