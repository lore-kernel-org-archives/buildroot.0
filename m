Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617B7C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:43:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E48B6187D
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E48B6187D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EED0E81CDB;
	Sun,  7 Nov 2021 02:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tH6T6-ilFQwy; Sun,  7 Nov 2021 02:43:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DB9D81C2F;
	Sun,  7 Nov 2021 02:43:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D05831BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0A6B40106
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZvCXD_Xxg7q for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:42:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A35C4015A
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:42:56 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY8ymuoy4Ff01jY91mqU5a; Sun, 07 Nov 2021 03:42:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636252976; bh=ohYFXo4kltazFKbwSa1tEADlk1A1E0P2f/3xdJNASRE=;
 h=From:To:Subject:Date:MIME-Version;
 b=dyUEwvVEAs/1ejBoN5xTo8hsHKGF2lMpXjHy5yCkjZB7qt73YYPtj5qa/aZefaED3
 AvJL0l5PLBRaOsb/8keomFvw/ixkZV1C97dg83GSF1OId+U8cV9iAo2ihyPLNdPDAP
 VcKpJjFEt7LB124uwd06/Yfn5lyuxpsRuBlbapH7daDwCSFeL2HAztyNenL1HycjrC
 30j94+3+p/Rxc3Efrtci8i3ngWRq3mCuUtmbLJMxuqLejpC5T4I4qDurCQgl+Hm1mp
 H7OEa6aqVCi4CgkAjjpKjUJkdkJ68AX6gACiV7eiv5JdlOooLE5yDrSKPtvl7YNsth
 VHyJjE8O9D92A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:44 +0100
Message-Id: <20211107024250.3061287-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024250.3061287-1-giulio.benetti@benettiengineering.com>
References: <20211107024250.3061287-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLOlKJ+t/Nrl/lflOZfBqx5/s0Q5GvyDLFFW0TMWvXzVIW7Q4y46TqRGnMD/Xq8E9HT6AGLWY9XjvfVE8EDQV48N16NMIA5IZMfKWZEsbd63ljtxNUbX
 EsuogyfAD8QTU3hACljE13Y9wUkogfLroEkn1TQa1qSvwCaJUgGCF7J17pGN/5LDBM/F82o25DQukLONN1fcZ8g6S47DkZhW5P0jsoguyz+PFGZq0Jd6aV0B
 oVj/XLqovWKyfGoHo69wnD9SmREyhEjjZX+hzJ1JH1A=
Subject: [Buildroot] [PATCH 053/102]
 board/olimex/a33_olinuxino/genimage.cfg: beautify file
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
 board/olimex/a33_olinuxino/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/olimex/a33_olinuxino/genimage.cfg b/board/olimex/a33_olinuxino/genimage.cfg
index fc2f7f8d76..b48e12a831 100644
--- a/board/olimex/a33_olinuxino/genimage.cfg
+++ b/board/olimex/a33_olinuxino/genimage.cfg
@@ -5,8 +5,8 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8192
-		size = 1040384 # 1MB - 8192
+		offset = 8K
+		size = 1016K # 1MB - 8KB
 	}
 
 	partition rootfs {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
