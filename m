Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AC1C001DB
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 17:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DD4F60EE9;
	Sat,  2 Sep 2023 17:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DD4F60EE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jY-5mVwuiGEs; Sat,  2 Sep 2023 17:21:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0741C60C13;
	Sat,  2 Sep 2023 17:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0741C60C13
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BCAB11BF407
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 17:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95B17400D1
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 17:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95B17400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NXaE2RXxE5MH for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 17:21:07 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 855B14002B
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 17:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 855B14002B
Received: by mail.gandi.net (Postfix) with ESMTPA id 7D0031C0005;
 Sat,  2 Sep 2023 17:21:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat,  2 Sep 2023 19:21:03 +0200
Message-ID: <20230902172104.3476758-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693675265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=k8DUL7Oj9aSt6yCMgW9hxZ/DuKykRt0rdhgX+hWhi/0=;
 b=DcfmX7jZfan+As8eehrxds1J32LIT5F7AYKADV2QNxruZ6wowm53e3845xJULYkDLcomAj
 reA33ir2dYtN7h3ycj0251cNPO2g8NYZeGvmpNRXdLugFX4NovcapVQ+RPSnKe9oS5DPKU
 TEOZiIQ0/aJ2zojnlTzFtgJdOCpRRz0lRpTjR3rBExTr5nWEQ4tGAWVyW7qUVsqEpGQAlx
 M0OxZoX2pLHHlkMkS3xsuyPsgkYppFLLk+JoZyvErU0j+fxHhJXKZTTW3PSqZD6I8FFASE
 yyGC7+0PrghTcG4WiAp+NiKhK5u0gpcRUpPV6zMjZmq29h8ErNKUdBVGsPH/Bw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DcfmX7jZ
Subject: [Buildroot] [PATCH] package/pixman: ignore CVE-2023-37769
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pixman/pixman.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index 6e6d787d27..37eb974c46 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -24,6 +24,13 @@ PIXMAN_CONF_OPTS = \
 	--disable-loongson-mmi \
 	--disable-arm-iwmmxt
 
+# Affects only tests, and we don't build tests (see
+# 0001-Disable-tests.patch). See
+# https://gitlab.freedesktop.org/pixman/pixman/-/issues/76, which says
+# "not sure why NVD keeps assigning CVEs like this. This is just a
+# test executable".
+PIXMAN_IGNORE_CVES += CVE-2023-37769
+
 # The ARM SIMD code from pixman requires a recent enough ARM core, but
 # there is a runtime CPU check that makes sure it doesn't get used if
 # the HW doesn't support it. The only case where the ARM SIMD code
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
