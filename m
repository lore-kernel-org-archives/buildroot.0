Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF7AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:46:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E7CC6187C
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E7CC6187C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30B4080E44;
	Sun,  7 Nov 2021 02:46:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gaMIH8z-9hyw; Sun,  7 Nov 2021 02:46:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89F4C80E62;
	Sun,  7 Nov 2021 02:46:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A3371BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A84C605C7
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QujFxxtUP_EP for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:43:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AF4E605C0
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:43:39 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljY9imR7Gz; Sun, 07 Nov 2021 03:43:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253018; bh=4xdWsnOih5pdfNjAwQNWKC60XpsnEGeD/W5SIYbuBx4=;
 h=From:To:Subject:Date:MIME-Version;
 b=F2JK4u8oHjcCZFr5Mwcp/9YLVDJthe0P+E6M/i4z6lhAeIgfG4nhk0S27SjAmh3NR
 lF4igoqf+I98HESX0wrEcFxQr6R5SQMMW5kxC5hvQzv5G1GkKlZfVInZRZi+iGjp1d
 JT9WI3ehl0XmvQHeorSyvHxiubWjwpT14He1/+75hXt38qglK13f46T7wtskM7ijzM
 Jv+SMU+KvwvRbLKQcb+y48tHG9uc6lFb/gvjlh08zA91/yq1ymDgsAngCH0pITjorp
 cmd9TFBsr1i+VSpL03DVPUm2iLY68/ryPmEgrQeEA8FEGBLhs44pn8KDh/GDnzqW1m
 37N2ftftuLBwA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:56 +0100
Message-Id: <20211107024330.3061378-9-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfB0fLHO0Xx5nkiVntkZ6s+GRFQcb/iE/dmO1Eb77pZGMYc/o579Z7jWnNocFjgjVgp2Ckj2OYvWFlETjlBcYuEeFsgFj6atvFyBZTozI7rLkgr+Mul8+
 EEJ3zUzOV50ym8lyPY5m9IxRtTS3Rfpg3Eiwx7vDcUz513Y7WhCsvwx8gkAVNp9RieOqZcFI1lCNRTkYLcDlqfhK3wf3rPc8X3F2TwQ+l6iEdl2psBNRqn5Y
 FAqkuNpsnDVKKxp4MFW8svdzZduGWXypeIt4SZIfE9E=
Subject: [Buildroot] [PATCH 068/102]
 board/orangepi/orangepi-zero-plus2/genimage.cfg: beautify file
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
 board/orangepi/orangepi-zero-plus2/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-zero-plus2/genimage.cfg b/board/orangepi/orangepi-zero-plus2/genimage.cfg
index 255acdbecb..f51ce3f854 100644
--- a/board/orangepi/orangepi-zero-plus2/genimage.cfg
+++ b/board/orangepi/orangepi-zero-plus2/genimage.cfg
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
