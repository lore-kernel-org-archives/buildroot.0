Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06596C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 12:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADFF760AA5;
	Sat, 17 Sep 2022 12:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADFF760AA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R7UgrBEttv-J; Sat, 17 Sep 2022 12:33:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D40A61111;
	Sat, 17 Sep 2022 12:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D40A61111
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41CAD1BF48C
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 280B961111
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 12:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 280B961111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0vhKPocOhAoM for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 12:33:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDD7D6110D
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDD7D6110D
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 12:33:16 +0000 (UTC)
Received: from booty.lan (unknown [80.233.62.104])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id A4E00200002;
 Sat, 17 Sep 2022 12:33:11 +0000 (UTC)
From: luca.ceresoli@bootlin.com
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 14:32:56 +0200
Message-Id: <20220917123256.960765-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663417992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=7umhYoY++fhPxIiRQ1qwjfhDt1v0FLEprVM95kveaug=;
 b=CzQc/tR4EsI08THn+DisK66LlMC/LnHNRJEZh/F3HKoMn1zn+l/mkYVUPLrub/oTt60zU5
 0a9GqyB4bkJGHmGY04mf0rhP1qO87For6LX3BviYS/QSws08Q/aCxHVoP4WcdI0GxYUS7T
 v4lLY4lK8mnkGAa9xjz0iRBjGg3MUWXCdW2fLo+IWX0z7QaoFjre7Isemt7HqdqrwbD67m
 ZvYzZNSH1od+51EWq3dSOW2ij7ppu3tPmrcOBOQGDWbMIi9G4hg9OsanojIo60iu88f7LX
 rR7f6BBcyOBMlFbAXGE2RR5UUywYXWluP7LVk7BzT2UxmYy5Ojf4zBRmpn1dkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CzQc/tR4
Subject: [Buildroot] [PATCH] utils/test-pkg: show default build dir in help
 test
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

Avoid the "Where did it put my builds?" step.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 utils/test-pkg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/test-pkg b/utils/test-pkg
index ce6e43b965ec..4ebfd9af6674 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -257,6 +257,7 @@ Options:
 
     -d DIR, --build-dir DIR
         Do the builds in directory DIR, one sub-dir per toolchain.
+        If not specified, defaults to \${HOME}/br-test-pkg
 
     -p PKG, --package PKG
         Test-build the package PKG, by running 'make PKG'; if not specified,
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
