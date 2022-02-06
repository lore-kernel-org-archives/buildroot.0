Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37450C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCE9260B64;
	Sun,  6 Feb 2022 14:24:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2MdFvXkufDcp; Sun,  6 Feb 2022 14:24:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 092C260ADC;
	Sun,  6 Feb 2022 14:24:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 01FFD1BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E464E60ADC
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G5oFZTqgGZIi for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:24:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4269860ABE
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:24:06 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GiSSnLrm8X0z7GiSSnLWDZ; Sun, 06 Feb 2022 15:24:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644157445; bh=5gAS0JsH0KIhHNlhYs2tg3Lw3fqKHwSToBJDpvmE5iY=;
 h=From:To:Subject:Date:MIME-Version;
 b=hbTDO/UGDRi6w7rTl/paUB42smfP0yakN+EwIHr5uxLO8nFrNyb0M65JstFnY6AFE
 6pJHy7AYJBBYgMQVFesq9LDqhBXnXcTrVbNYHNp23x/LhFNfLC0ZTlwHvZ+42FtaBg
 NWFZvWG7ABDg210PW37OjwuRzd0egKacBlAXMsKd7PclQsOXDj9LMevIj0z4loGCuB
 znuQAvAmh2Dx1gTIWvrQoevpDMS4dw+wMbCuJPEQZ7dfesB33+Fjiker9Y0QCDFwaV
 OjJ3F0U6XJTjv0hUmZTi6r7qzSbGaH0Q4FFL6b9xZaJJuo261C3jgGTVps4dnFZMeP
 jIS8d70m5BF3g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 15:24:03 +0100
Message-Id: <20220206142403.1644118-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2fec6210-3811-197d-45a7-1ece869f49e0@benettiengineering.com>
References: <2fec6210-3811-197d-45a7-1ece869f49e0@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfMKKqXpT1Gb3CxveFkOqoJmWBlc1TLPGA4kSAkLLxAoTqSXYtdt1iDT3zDXDIlX6m06iRYrXdaYp/Rwl68dwkNWqlZd0e8tzjsB3iykDSm2z9rtcPjXc
 vFhl8QXNbnqwG8W6NWhgUUAblq7XDxp21kexkeulbXXO0+xVBMzm/F1usPKeOYdpVrOgv//ufp1XBqhOJOX/4vO5Zq6jQ1ObkshZteGPtiaf6GVFtwvRZ7ND
 oqGsMK0OAEQRFADO4FboYuSVGzgkcAPnHqoX6AKF3NDbona6Zd0HDxAJL3XfocJFihjHoQ8SafRSsRwChN/znKA6xzORnhQuVVJ7EA+MWdUDBX0JaO5YmdQ6
 ZN/XlZI7fceOGo0TiuVMYA0kC4s3SQhLHSz4054cioIL/rII6Fz+oP4xQL6s7kyNRYpsH/hA
Subject: [Buildroot] [PATCH] toolchain: fix gcc bug 99140 condition
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
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Gcc bug 99140 exhibits with gcc versions:
- up to 7.x
- 9.x
- 10.x
and doesn't show up with gcc versions:
- 8.x
- 11.x
then moving BR2_TOOLCHAIN_GCC_AT_LEAST_9 to BR2_TOOLCHAIN_GCC_AT_LEAST_10
makes gcc version 9 set as working but it's not. So let's back substitute
BR2_TOOLCHAIN_GCC_AT_LEAST_10 with BR2_TOOLCHAIN_GCC_AT_LEAST_9.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index aed8f393a3..db3f451f45 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -189,7 +189,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
 config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
 	bool
 	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
-	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_10 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_nios2
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
