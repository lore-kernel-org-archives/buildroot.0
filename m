Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3BDC83F2C
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 13:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 334D74051D;
	Sat,  2 Sep 2023 13:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 334D74051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id baLYqi-eOIsf; Sat,  2 Sep 2023 13:33:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88C70404F9;
	Sat,  2 Sep 2023 13:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88C70404F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE8031BF861
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 13:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B772C81778
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 13:33:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B772C81778
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jn46IBXE2hra for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 13:33:53 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42F2181389
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 13:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42F2181389
Received: by mail.gandi.net (Postfix) with ESMTPA id E893FC0008;
 Sat,  2 Sep 2023 13:33:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat,  2 Sep 2023 15:33:46 +0200
Message-ID: <20230902133347.3261113-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693661631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=XyPZxxnFO3qYRxS8Ni+nBMzKvmaZg8qJxUY9a3HOMfk=;
 b=CwKnELEKpI0IqzCYsdOFXlbrXOebVzqhUaDwL4ou/Q9yuVgFpYuu6/WernfiNUGwKnxpzK
 6jJqGOYtOu5lcp4oQhq32G7Uf3mwvAB4s7hSI2ycpeNqlsnaVXAHYeXJdUPSvXamaruq3t
 /oh/LHPikwDNW1QOzTa4lOM/s66fTPrDFk8br0O5b58NMmsZSE1DrUC1uuucIyyaBkPkqk
 xh1GMWQcFLkmvvq5iCzbFGftGbrSZ3+YKKF7rbn3L5jXk9WKM/Seklp7tfaQWRspT4z6xH
 hn0t+1w5oZUpthc2WpUCZGVPbtHxLTFPiZpwTOXUg0FAZJEfKHBSqhmhM+Q6jQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CwKnELEK
Subject: [Buildroot] [PATCH] package/pkg-qmake.mk: drop host-perl dependency
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit 5770a645a3a49a3f0f02972131a4ff5283b4c11e ("package/qt5:
bump packages to latest kde submodule versions"), the
QT_HEADERS_SYNC_HOOK hook no longer calls the syncqt.pl script, so
host-perl is no longer needed as a dependency of running this
hook (and as a dependency of building Qt).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-qmake.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
index fdaddf08df..ccf78692e8 100644
--- a/package/pkg-qmake.mk
+++ b/package/pkg-qmake.mk
@@ -50,7 +50,6 @@ $(2)_DEPENDENCIES 		+= qt5base
 endif
 
 ifeq ($$($(2)_SYNC_QT_HEADERS),YES)
-$(2)_DEPENDENCIES 		+= host-perl
 $(2)_PRE_CONFIGURE_HOOKS        += QT_HEADERS_SYNC_HOOK
 endif
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
