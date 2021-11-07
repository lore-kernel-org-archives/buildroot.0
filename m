Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3384C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:51:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65043611C0
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:51:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65043611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4050460670;
	Sun,  7 Nov 2021 02:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kaH2BZ1Jyr8d; Sun,  7 Nov 2021 02:51:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA2D16066B;
	Sun,  7 Nov 2021 02:51:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AA991BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A775402CA
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JhN1LK9Vm1B5 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:45:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7C44402B3
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:45:23 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYBPmR7tV; Sun, 07 Nov 2021 03:45:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253123; bh=FEkEwqFO8V2gfJU9E1vuVNrfq+0UQN0Y0fL6CtAklo4=;
 h=From:To:Subject:Date:MIME-Version;
 b=kuSRRmU+RpD1m6D4CpEJfIDfB62e82OOM3BYloob+KxHfuYUho2lhSGFq8PmKo4pl
 g3zljEjeRwh20+PQ6Jg+QGNa1otn5eylkvzgCBrqD5a4IOXAtpj1sHRhYmRO/edqrF
 fdAtxiPssLQI8fhgbv8vcBzG96MVzMmVi/94T4Eo9wg3YEmCBrnEWgFfaNJUGKcFlT
 y95nAmJmR2zZc0dNDYVQPYf5PEfT1hU03DkMIixeAHNeIiEOehlaO0Ba5J42Pi/Jyo
 gL/0qoAdr9ECnbrdgWBVTkx1DTJFs5PtLp9yugKO1AZqnJOKQbE6rJSyj0EEyRTWov
 DjK6qn+JkI4oA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:22 +0100
Message-Id: <20211107024330.3061378-35-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfEq8kAmyDNuHiHlD56Q2ykxNTU9vmRIM1xA7sQri8+LFGhnJK2lGZMUzqe+8kT4KoEEwLzEFKKPUMkTGSHvNNtSdr4D4Evqyb4hTLEljiYghAwKjyIOx
 jIpJJ9/K4QC/dnlS2nPyH8Jp1e+o9uiS3w47BQ7yJ/93tzgcZaUthsLoCpGHK4AgSgk/fettNhFJWJhej6N1/M8XOdbnFSRD+Lh4tEZszOSRBAaVoIsF0JYh
 Ga3LXQQKPoEK7Cz3hziyY5PvqJFB/1+gy5dy++SvTjU=
Subject: [Buildroot] [PATCH 094/102]
 board/solidrun/macchiatobin/genimage.cfg: beautify file
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
 board/solidrun/macchiatobin/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/solidrun/macchiatobin/genimage.cfg b/board/solidrun/macchiatobin/genimage.cfg
index fdcda368a2..378e2082e6 100644
--- a/board/solidrun/macchiatobin/genimage.cfg
+++ b/board/solidrun/macchiatobin/genimage.cfg
@@ -5,12 +5,12 @@ image sdcard.img {
 	partition uboot {
 		in-partition-table = "no"
 		image = "flash-image.bin"
-		offset = 0x200000
+		offset = 2M
 	}
 
 	partition rootfs {
 		partition-type = 0x83
-		offset = 0x2200000
+		offset = 34M
 		image = "rootfs.ext4"
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
