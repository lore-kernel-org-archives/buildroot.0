Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C4BC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:43:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC15B6187C
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC15B6187C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7300402AD;
	Sun,  7 Nov 2021 02:43:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id az2hWdIcGPFc; Sun,  7 Nov 2021 02:43:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F336402A9;
	Sun,  7 Nov 2021 02:43:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 010BD1BF976
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1B0B81C2F
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dlpjI0bW0XNH for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:42:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C24481B48
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:42:58 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY8ymuoy4Ff01jY93mqU69; Sun, 07 Nov 2021 03:42:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636252977; bh=MlhXiWaQ2XpYHkatS24sK2fCePJuKkUpDh3skeHdBgc=;
 h=From:To:Subject:Date:MIME-Version;
 b=G/x3Cnt9sPrhRTKTX88ndgQoMV9IwZjAAodAzMIHsl0OYWsR1nESXaudjZ+zPF9Li
 RXLw84CTkTrSw09FT15+fkcL64wFjGz9jlok4MP6PI6EdLzRmFHEWOmf3/qP6zX04O
 6Z/xeqzHEGfNJbQhTTb/lxG74wbWqfusn70pYZL03UxAgvrimmppTZnprSzLdwXega
 FPCW1O8ip9wROK6jw/UUWeRPXv1Ia2r7/mD6wUqj5YceNf0cc8ZLCs0vANr/e8YMm5
 n1tvLC3BQEAFv9t1BdoVBLr5qLJ4r+7utijh0/eiPV52j6WYgpbOrZman9zMls1Rxz
 sQpSkx9ShQMHA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:46 +0100
Message-Id: <20211107024250.3061287-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024250.3061287-1-giulio.benetti@benettiengineering.com>
References: <20211107024250.3061287-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfIbdrGakFtYga/wiG9vETgqMyyPkQDG3/bTkx1I1Gvob9BUhaxNoKJMC9KnUp4n3gwpfgYoY3OUWxHwrnz6kRFrmIM2ZWhlOBzqUWsmBKTYgO+iry8+5
 eKaq4lZ4DC2adKTGcAN3obVkELsCX8XamSccAt6U3zYIiw6w1VgVBAHopVPYsuDgu0lhgSzq3QixjDDrXzQHx5McoQ8I/YVNYgKUmLqWnkyD1XC1LfgHcFlK
 6tJS7dmIH+RROwMUYfJprp4GLEa5OB0DGeiri3YlgcA=
Subject: [Buildroot] [PATCH 055/102]
 board/orangepi/orangepi-lite/genimage.cfg: beautify file
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
 board/orangepi/orangepi-lite/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-lite/genimage.cfg b/board/orangepi/orangepi-lite/genimage.cfg
index cd81f986b2..b422a751a8 100644
--- a/board/orangepi/orangepi-lite/genimage.cfg
+++ b/board/orangepi/orangepi-lite/genimage.cfg
@@ -8,6 +8,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 10M
 }
 
@@ -18,8 +19,8 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8192
-		size = 1040384 # 1MB - 8192
+		offset = 8K
+		size = 1016K # 1MB - 8KB
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
