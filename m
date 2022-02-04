Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2342AC433EF
	for <buildroot@archiver.kernel.org>; Fri,  4 Feb 2022 00:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9549B40370;
	Fri,  4 Feb 2022 00:56:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KIayjgvARs1v; Fri,  4 Feb 2022 00:56:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76D43400F6;
	Fri,  4 Feb 2022 00:56:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCD9A1C113E
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 00:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAE5884059
 for <buildroot@lists.busybox.net>; Fri,  4 Feb 2022 00:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nbBXRx7Z2t-U for <buildroot@lists.busybox.net>;
 Fri,  4 Feb 2022 00:56:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp1.osuosl.org (Postfix) with ESMTP id B983E84039
 for <buildroot@buildroot.org>; Fri,  4 Feb 2022 00:56:13 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FmtXnQDeQ0FuyFmtXnROzX; Fri, 04 Feb 2022 01:56:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643936172; bh=8VUzvsCWTklAiLYZNxrH2lll06CY153dPBJwaUvrOfw=;
 h=From:To:Subject:Date:MIME-Version;
 b=jjsDG9I+eVDGgwmphriSLHLlaj3Xt4IoGs5AXtlv7WXB+Gzou7p7i5DWM1a4xa4lU
 kEEc5JrRE3Ql6KKqwJ7yceJ6UuT8owwFcrSGqlENSOCVXDraSvawtbveZ9kLaKUxwm
 VXWrQJeYyhK7tKHtBljE/WdRLuPLcnLoy9IDmsHdiRP5Z/W18hA/iOxRTn+wZmcz+S
 o0PpbTbS1/jY6D0idTz3aCwwejeIvKAamxLKLWhHaANpfljA6XOpJ6228oTO9p7chR
 2gU2KBdCvKPuTEYvu0FO5hQwEoMS/jD58lQ8J3UpzwwuddDcBGPFgjzCSSwNksi5wB
 f62TsCYg9ge0A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri,  4 Feb 2022 01:56:10 +0100
Message-Id: <20220204005610.897894-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGSxjHuiEGhwGFkyOid4XFArrfT+vvvXPkgyGn7pvz4HzVxjewPMnOgd4U3+DQPrZpCjvtmmjLDmaC3xye4T/+WD783P+Bc9epvt2y8VDbR5XLyswU7E
 HK9XnQpMMxgufYkLwetCX40m2/DSe6MmoMRA/TrVn5yNxE6gbzC8EktV8HwmFjdOoBOoeDayM0Vu+Kfc7D5qnwQ785OWpm1bq75ImCV/mYcZtBPsWpf5PFEL
 GbVoet1iTRS3w0HxGarnH8sxVF+6kFhtmye7VzZdK8lRr/SpdmEQEti8et/QBaKQ
Subject: [Buildroot] [PATCH] board/pc: fix build failure due to new genimage
 15
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

Actually genimage fails to create final image with:
```
ERROR: hdimage(disk.img): partition [MBR] (offset 0x1b8, size 0x48) overlaps previous partition boot (offset 0x0, size 0x200)
ERROR: hdimage(disk.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.
```

This is because genimage 15 is less permissive than before, so let's add
holes = {"(440; 512)"} to leave room to MBR.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935249

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/pc/genimage-bios.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/pc/genimage-bios.cfg b/board/pc/genimage-bios.cfg
index 26d12d9ab3..54026f6527 100644
--- a/board/pc/genimage-bios.cfg
+++ b/board/pc/genimage-bios.cfg
@@ -7,6 +7,7 @@ image disk.img {
 		image = "boot.img"
 		offset = 0
 		size = 512
+		holes = {"(440; 512)"}
 	}
 
 	partition grub {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
