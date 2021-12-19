Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C034CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 13:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20D6A402DC;
	Sun, 19 Dec 2021 13:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KAUR_gGR1Off; Sun, 19 Dec 2021 13:25:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 474934017E;
	Sun, 19 Dec 2021 13:25:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F11F11BF47D
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 13:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDC234017E
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 13:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O4FtfUaon2-M for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 13:25:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-33.italiaonline.it [213.209.10.33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD2434029B
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 13:25:04 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it ([79.17.97.108])
 by smtp-33.iol.local with ESMTPA
 id ywBQmOIGD06TnywBQmskFb; Sun, 19 Dec 2021 14:25:01 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1639920301; bh=YZ3be/Z1OqXWvaXHwvQO0yPH1qLXk0faJqXA5mfr7Ag=;
 h=From;
 b=J4oK5ZlaksHJ+qTubdsoZPtCeVv7YC07VcoQ4LWfwTBnAggLhoBN/Qx/Es2fZCCIo
 5jYjkYUgxRAUAm/2siza62z9vbNqMYHM/fR470p10w9vtAP0dw617GKFkdg7n+OZx2
 Wj7SiNTWdJ4K4PElgTp7IgyJP6nc9l6pVvpLulJ+r2q66DArHRyIiVE89Y7+gpsEiV
 rT+wVWSWKOiEEYBTW0/fLUvj2Ldg+HAGp1SQ/eK26c+uabSsel+d+69guijTZLyWeP
 opXeMRDtGoERhe7Ngu0EHtJ0LDaKonGYKc5YBZJ/4af6KCOzqeDen5rpSIitiL0vi+
 8B87SzHGbV+Hg==
X-CNFS-Analysis: v=2.4 cv=YqbK+6UX c=1 sm=1 tr=0 ts=61bf32ad cx=a_exe
 a=Ka7BHSe+7NKVY1G9Df0Twg==:117 a=Ka7BHSe+7NKVY1G9Df0Twg==:17 a=8b9GpE9nAAAA:8
 a=pGLkceISAAAA:8 a=ciLHL4SVnjFQ9V8plYUA:9 a=T3LWEMljR5ZiDmsYVIUa:22
To: buildroot@buildroot.org
Date: Sun, 19 Dec 2021 14:24:38 +0100
Message-Id: <20211219132438.5841-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfGhIzLGuB8QS7IHiMgyb84SuIo9gXFeScCxjS9/NNHgqMMLp8Es7D6eA4pVnOse0g5tyFQ/9+FtPeY6+KDqGcv9JLczI/p1IELVunGQADEc7VwClep40
 3s8nB1BZEacPwZ4OzJPit0N5hSdWVyGi5g688EyE0ZGunq+5a/Avdl06I3NnU6E9PZZNLVm0acUVws/hr/RqM5UONYjWRp1PQCEeM0+u30uBCXH11V21STOb
 Ygo5aq7haV0sKSQKgBWHWVKAf8vPZMIiS5TqN+6dhU/I/EE3F7DHbjOL8FJJ0sLeqVsx8J4vlq4yviPWovLlsyzXNsJF3a+iiY/5FAGlrLCkYbtdRlCzmgWv
 MZyS6/fKv2zcQDAw1HVstcBo/xMhIw==
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: add the
 stm32f469_disco_xip_defconfig entry
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
Cc: Yauheni Saldatsenka <eugentoo@gmail.com>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit a3e3d9c19829 ("configs/stm32f469_disco_xip_defconfig: alternative
defconfig for XIP configurations") forgot to add the corresponding entry
in the DEVELOPERS file.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Cc: Yauheni Saldatsenka <eugentoo@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 35f3be81b8..e6f0b67ae9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -531,6 +531,7 @@ F:	board/stmicroelectronics/stm32f429-disco/
 F:	board/stmicroelectronics/stm32f469-disco/
 F:	configs/stm32f429_disco_xip_defconfig
 F:	configs/stm32f469_disco_sd_defconfig
+F:	configs/stm32f469_disco_xip_defconfig
 
 N:	Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 F:	package/drbd-utils/
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
