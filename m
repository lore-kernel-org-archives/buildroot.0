Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76794C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:46:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 385D461884
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 385D461884
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 083AD6066C;
	Sun,  7 Nov 2021 02:46:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e2XK0R3sDeOn; Sun,  7 Nov 2021 02:46:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 616EF6066B;
	Sun,  7 Nov 2021 02:46:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9AC661BF976
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96085605C0
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SMKnbQkUW0en for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:43:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC7DC605C2
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:43:39 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljY9jmR7HC; Sun, 07 Nov 2021 03:43:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253019; bh=zCrr4ZJ8/9zSitOfkoWXXX7ho3jPE73MNI8wRCJSSEI=;
 h=From:To:Subject:Date:MIME-Version;
 b=aHXkgL1N2gDZWoD1riaKepv5R5kT4zkM0HZUwg3Y+kUf3PTizUxkEU/QKh6f9E5Qf
 N+9I/2aq3EpTjB8qfxHH5Ay8e5rea9zZtkz1WjUM5XjHwDVn5wYX4jnsmEkGQimSED
 Mfd8ubtb6SSt/beKKOzO6ySTvTql8sPigI8f7+cfpSVWFmhhtQCNGiZTnrNp+sfSdE
 l0QMVCPIxaogbHIKvWlqFBARpeNbT8Aif9Fipt4zxAbjG2Lq+dOeg1uVKXtQF30WDh
 xiJ9K0dtqpRXeL9QWiB4GrCMyLyaaqmBt+sB28vQMNazJ6bYAnlOyz9xcYQtFh+RZB
 tUMz9BbX3LwmQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:57 +0100
Message-Id: <20211107024330.3061378-10-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOmY2sIyY7Vevmf1W7t8QWaZmLWyoVmT5n2xgeVL9yZf51iQkQ7LYbc+La/wlMP8vjVPGWtz7qzRz2IkM5y0OlVee5fciCdL12azsbrjRt0ZJYdbuCri
 Mq9JAR7ZlRIVHpWUUZlxtz0TS0uUSwkJ81mbdQEHeHVOnhI5Gk6k/fSC2TRNPZuWyutKkRSeqUFuNBl/lkVPX1UMxR6gb5njju9HY+u/cu1pqKeysibavrqh
 X6pCHKK1+0RPWfiKOccMO3WjG8Rlf/OUduHuzmbkhzw=
Subject: [Buildroot] [PATCH 069/102]
 board/orangepi/orangepi-zero/genimage.cfg: beautify file
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
 board/orangepi/orangepi-zero/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-zero/genimage.cfg b/board/orangepi/orangepi-zero/genimage.cfg
index 017435f28e..32f5454ae6 100644
--- a/board/orangepi/orangepi-zero/genimage.cfg
+++ b/board/orangepi/orangepi-zero/genimage.cfg
@@ -18,8 +18,8 @@ image sdcard.img {
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
