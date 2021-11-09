Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E831C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:19:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C85A0610A0
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C85A0610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A16C400BA;
	Tue,  9 Nov 2021 10:19:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0J21VW1qbT2E; Tue,  9 Nov 2021 10:19:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE2354012D;
	Tue,  9 Nov 2021 10:19:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6571B1BF2C0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 550B380C81
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tS8UxvBfYNqS for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:18:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C3A680BE1
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:18:54 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kODFmziIdyoivkODKmOZfv; Tue, 09 Nov 2021 11:18:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636453132; bh=+3S1wl3AIc6FcZ4zT2mqJ6LFfb2yoep5f02/I3kxyws=;
 h=From:To:Subject:Date:MIME-Version;
 b=HbHdXc6uOqripgOeB/WxrcMpxYWMhozN3rT/1uW6UXv2xUDSCNV1vs3h9iwPjoFFE
 6mTkpv+z5WB6IGd8me7Il/Yw/qXWakGugScQFR6o4/vQT+pLuLf0VvpWX8M3DWuE5z
 gGsfywoBNPynIDMTnDvaQurl8chNMTzBoHK47lvMlpv0K5IlZtZRDgWS18rrMHjGhk
 FuhWm2EIHxkmEZFgrQT8Ng/cQijCBXvmL/1OPw4aMobqqrsRn4twfPm6n39DJmdkhs
 qmqkli9qUL4+Wg13ZobcimtdzjrzwTDapPzHmAV9VB7S9BZnMv7yWI0A2UcOLBdbje
 k3Gd0a7J53PnA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 11:18:36 +0100
Message-Id: <20211109101844.1132067-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
References: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfALgILO2ZFrv5uaO2w1jjjT3Cpc2fwCciSSFdV/9A2+9xM1mk3bgtvTKUg4S+4YJm4f+K68sqQlcK+g6ZraVe3DbehSZwLjuD4NV9cvrLsKyfi+St7DK
 ixPUl6nOgpdryCoMX/HbTv57T2HFICJXs583lOFWHXr7LMfn6KvosjjHf1e4bAGmwfc8a3D9PzQeDwUkAXVwg+sXPlLUbBdGiOiqIa/GoLXW7aAq2ALIsgAN
 ogqtnvrL/wa3lhJNZrZ4bIPuNFXfkytgrVTQ+bqw+NOdLFZkgcCadH9U1LUMqww28j6JswiL40z247hibq7btSGwq68mq6xF9DrMKTttj858vI6eE7CwjSs8
 IH+dVIaqMRBO0v9KSV2VxeiS5s9yrcsEfKSyuHxzEJLESyxl+dwdxnPrBSfxeSRzdzjJhCASHUOBOIW9DQFLYCOmosnMK3Du316Yfz1AEk/QHtJJV8ZOiJ6u
 0Lym0bplUY2h6vFKT0beEkCHnQxDCeC11rtzshSDXbqUoyT6jcKeoMCltxF1VTQJyAjrl7xnNB8uF47VnX8Dw0ACjK6nfQZ/ttAMXg9kvlbkoCJaOi7g5LHE
 FGU=
Subject: [Buildroot] [PATCH v2 1/9] board/olimex/a20_olinuxino/genimage.cfg:
 fix option suffix
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

With commit[1] I've introduced a code style bug:
offset = 8KB
so let's substitute 8KB with 8K.

[1]: https://gitlab.com/buildroot.org/buildroot/-/commit/43bfa1cf1046b0e44e87a02bc5a358bf1de5bfdd

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2: reworded as suggested by Luca Ceresoli
---
 board/olimex/a20_olinuxino/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/olimex/a20_olinuxino/genimage.cfg b/board/olimex/a20_olinuxino/genimage.cfg
index 5a735ed2de..b48e12a831 100644
--- a/board/olimex/a20_olinuxino/genimage.cfg
+++ b/board/olimex/a20_olinuxino/genimage.cfg
@@ -5,7 +5,7 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8KB
+		offset = 8K
 		size = 1016K # 1MB - 8KB
 	}
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
