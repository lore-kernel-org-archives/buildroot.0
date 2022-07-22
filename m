Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65625C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 20:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF2A440AA8;
	Fri, 22 Jul 2022 20:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF2A440AA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Fua72PX0gGF; Fri, 22 Jul 2022 20:22:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB733415F7;
	Fri, 22 Jul 2022 20:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB733415F7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68DB31BF3DE
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 436D88497A
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 20:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 436D88497A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4gvzhT4TMlFd for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 20:22:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C3ED84977
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C3ED84977
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 20:21:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 2C1A6240004;
 Fri, 22 Jul 2022 20:21:57 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Fri, 22 Jul 2022 22:21:44 +0200
Message-Id: <20220722202151.76235-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722202151.76235-1-thomas.petazzoni@bootlin.com>
References: <20220722202151.76235-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658521318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WXBwe9qkqHvjC1xidoIzThLxeeIRYcFc1tzn103pg1Y=;
 b=HBezpJK+6FKwjz0YpZsCWzqNXNmWfIT7+joga1xYTuBr0BQMShqKDIEp9reCverQkucvVO
 xJTtdLxtk3uU3PWTHG/9bUfBygcOxZmxECahayPxTRD/vFiErG7TK92BnRikE6lJ8GY9MY
 JxKb8Js94ZWbgfDYFnBmKHfqdmxnnoXBoDVQuMHApGgndmKHZZPcNG7uDkDsglUNJfUq1D
 P3OhqHxAWG20eZaJ3VgXrhrCBsGKV4DFcBikx4sKLJZddzbJXU3spv2AvTcoqETZIzPVNl
 Oxw1WhDODskwUdxzd6dzwbtH9ZJwB2Dnd+49JWGfM2hAg3attcSXPHymXAuUcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HBezpJK+
Subject: [Buildroot] [PATCH 2/8] board/*/genimage.cfg: use
 partition-table-type = "gpt"
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
Cc: Simon Doppler <dopsi@dopsi.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The gpt = "true" form is deprecated in genimage, use
partition-table-type = "gpt" instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/octavo/osd32mp1-brk/genimage.cfg                          | 2 +-
 board/octavo/osd32mp1-red/genimage.cfg                          | 2 +-
 board/olimex/stmp1_olinuxino/genimage.cfg                       | 2 +-
 board/seeed/stm32mp157c-odyssey/genimage.cfg                    | 2 +-
 .../stmicroelectronics/common/stm32mp157/genimage.cfg.template  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/octavo/osd32mp1-brk/genimage.cfg b/board/octavo/osd32mp1-brk/genimage.cfg
index 644fc3d922..c632090efd 100644
--- a/board/octavo/osd32mp1-brk/genimage.cfg
+++ b/board/octavo/osd32mp1-brk/genimage.cfg
@@ -1,6 +1,6 @@
 image sdcard.img {
 	hdimage {
-		gpt = "true"
+		partition-table-type = "gpt"
 	}
 
 	partition fsbl1 {
diff --git a/board/octavo/osd32mp1-red/genimage.cfg b/board/octavo/osd32mp1-red/genimage.cfg
index 0caad0b4b8..3f86579b98 100644
--- a/board/octavo/osd32mp1-red/genimage.cfg
+++ b/board/octavo/osd32mp1-red/genimage.cfg
@@ -1,6 +1,6 @@
 image sdcard.img {
 	hdimage {
-		gpt = "true"
+		partition-table-type = "gpt"
 	}
 
 	partition fsbl1 {
diff --git a/board/olimex/stmp1_olinuxino/genimage.cfg b/board/olimex/stmp1_olinuxino/genimage.cfg
index 2f00ee979a..02800db8d4 100644
--- a/board/olimex/stmp1_olinuxino/genimage.cfg
+++ b/board/olimex/stmp1_olinuxino/genimage.cfg
@@ -1,6 +1,6 @@
 image sdcard.img {
 	hdimage {
-		gpt = "true"
+		partition-table-type = "gpt"
 	}
 
 	partition fsbl1 {
diff --git a/board/seeed/stm32mp157c-odyssey/genimage.cfg b/board/seeed/stm32mp157c-odyssey/genimage.cfg
index 170dedc254..4c18a2eb04 100644
--- a/board/seeed/stm32mp157c-odyssey/genimage.cfg
+++ b/board/seeed/stm32mp157c-odyssey/genimage.cfg
@@ -1,6 +1,6 @@
 image sdcard.img {
 	hdimage {
-		gpt = "true"
+		partition-table-type = "gpt"
 	}
 
 	partition fsbl1 {
diff --git a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
index 03fba8daf0..ff4aeceeed 100644
--- a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
+++ b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
@@ -1,6 +1,6 @@
 image sdcard.img {
 	hdimage {
-		gpt = "true"
+		partition-table-type = "gpt"
 	}
 
 	partition fsbl1 {
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
