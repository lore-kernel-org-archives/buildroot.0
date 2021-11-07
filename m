Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5362BC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:44:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EC0D61884
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1EC0D61884
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0FEB402C0;
	Sun,  7 Nov 2021 02:44:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iONmT3YThp_S; Sun,  7 Nov 2021 02:44:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C6CF402AD;
	Sun,  7 Nov 2021 02:44:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC3111BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7C38400EA
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XO8e-jWeKOWS for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:43:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A581400DB
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:43:33 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljY9cmR7FU; Sun, 07 Nov 2021 03:43:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253013; bh=C/ru2s5aqIJbAvmsWQ86bPaehjjvbFNI2A4kbDk1Zqk=;
 h=From:To:Subject:Date:MIME-Version;
 b=f4qKQySC5/ps7WVAGdQCJVVeXode9tDZbclvcRSCLFeL0BAYUTBy6b2sNhcfD+q3E
 tOMg8qKMo3iVQol6IWPMiNOGYN+DjFZLf417U+wRMtDSQUxUaSTrAXUyOcxLLge9Mv
 Nj8UY8PIseENssGELKINMn1zeyZQQpdSMRgVXVmgczYz1Sdc40sDKzsSDmVmEhBgiT
 ma5JVAloVkWiFGHedG7OmRa4oz904LdzK5mIjMpm0NV2AZcJ9iN63LMJPZ0XfNDWYf
 wmnT6o8p491CmDIQjdklzSYnqMEvAplolMwZbIm9wDnRx+FznXFJYDJIJwpwypMsSI
 Nomdj3qu/5PsA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:49 +0100
Message-Id: <20211107024330.3061378-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLlUjHL+shr6Ig2Irx7e/SoOq30dXyxgpWJ71ZJRRFrb/ZTq4nGTEl5xKVg/usC7Mr332Tyg3ffH1QMgDn6jLzLD+nyPPFRfSziP49TPs8TtfbRxL1Tx
 qk388VtAF4zWPs4qex0BHjKJdFmTyRJNXOKuAndIXO+PqYVCgSc2j64QMK5IOXzTPogOFJO2ezalLQm2qkosE3gWQhchWprc6TmGnCxiNuOwFIhRkrgLOodJ
 YT0q6VI7WyKFHdLYiiW5qtu7/CKENoXfdqs2JjOnWMY=
Subject: [Buildroot] [PATCH 061/102]
 board/orangepi/orangepi-pc2/genimage.cfg: beautify file
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
 board/orangepi/orangepi-pc2/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-pc2/genimage.cfg b/board/orangepi/orangepi-pc2/genimage.cfg
index e10c67ffc3..221998f6fc 100644
--- a/board/orangepi/orangepi-pc2/genimage.cfg
+++ b/board/orangepi/orangepi-pc2/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 64M
 }
 
@@ -16,14 +17,14 @@ image sdcard.img {
 	partition spl {
 		in-partition-table = "no"
 		image = "sunxi-spl.bin"
-		offset = 8192
+		offset = 8K
 	}
 
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot.itb"
 		offset = 40K
-		size = 1M # 1MB - 40K
+		size = 984K # 1MB - 40K
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
