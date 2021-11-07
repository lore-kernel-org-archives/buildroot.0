Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA2EC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:43:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82B166187D
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82B166187D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DFA680EE4;
	Sun,  7 Nov 2021 02:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hoJ8q2aKhCP5; Sun,  7 Nov 2021 02:43:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFBB480E44;
	Sun,  7 Nov 2021 02:43:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCD0E1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD10C81C2F
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oHjwsnIHM-Yp for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:42:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA62981B48
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:42:57 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY8ymuoy4Ff01jY92mqU5u; Sun, 07 Nov 2021 03:42:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636252976; bh=qh1Q7B2SFmO5vbapyDoT7pFT0LFjDDiV25iCNIOqZ9g=;
 h=From:To:Subject:Date:MIME-Version;
 b=hJexiwJkv+cXACoVKsyi07wQ68BXFzIdwQLaGmODhsXyOC5Nnc3+zWy6z7BNWCSK7
 VM3GlnUmgCIeFTPsSrtecFlxk5DE7WmQfic9PjarS4Y7wtxb+VhEwzuv6cSXcgUxD+
 BqH0vUu1rdfA4m3erTrZh8BotzJ4CkcJFhqWRj0Hctf7NbXom224BOifV/QiTRFJaV
 lIlw7cBfuI9sOxQk4miY+boljrEjND2cYJHKHnFOBbXI8gkFKwHzIdEKTU5NOYVQRe
 tvsEzLD9hnyVHhAzzp9ghgj5C+LCdB54MNuRP/tyclq0kismkP+3AoZ37vn2IkHKT6
 sT2gpN0EqLTPw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:45 +0100
Message-Id: <20211107024250.3061287-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024250.3061287-1-giulio.benetti@benettiengineering.com>
References: <20211107024250.3061287-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLOlKJ+t/Nrl/lflOZfBqx5/s0Q5GvyDLFFW0TMWvXzVIW7Q4y46TqRGnMD/Xq8E9HT6AGLWY9XjvfVE8EDQV48N16NMIA5IZMfKWZEsbd63ljtxNUbX
 EsuogyfAD8QTU3hACljE13Y9wUkogfLroEkn1TQa1qSvwCaJUgGCF7J17pGN/5LDBM/F82o25DQukLONN1fcZ8g6S47DkZhW5P0jsoguyz+PFGZq0Jd6aV0B
 oVj/XLqovWKyfGoHo69wnD9SmREyhEjjZX+hzJ1JH1A=
Subject: [Buildroot] [PATCH 054/102]
 board/olimex/a64_olinuxino/genimage.cfg: beautify file
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
 board/olimex/a64-olinuxino/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/olimex/a64-olinuxino/genimage.cfg b/board/olimex/a64-olinuxino/genimage.cfg
index 65c4a7513c..b94143d858 100644
--- a/board/olimex/a64-olinuxino/genimage.cfg
+++ b/board/olimex/a64-olinuxino/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 64M
 }
 
@@ -20,8 +21,8 @@ image sdcard.img {
 	partition spl {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8192
-		size = 1056768 # 1MB - 8K + 16K(GPT)
+		offset = 8K
+		size = 1032K # 1MB - 8KB + 16KB(GPT)
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
