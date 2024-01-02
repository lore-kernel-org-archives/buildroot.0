Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E665FC47073
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 08:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EA9E40743;
	Tue,  2 Jan 2024 08:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EA9E40743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9VWZsxKn1tj; Tue,  2 Jan 2024 08:36:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D494A405D8;
	Tue,  2 Jan 2024 08:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D494A405D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 136CE1BF5A6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC51D81343
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:36:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC51D81343
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4B1vgqLvlYSe for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 08:36:11 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4F6C81334
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 08:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4F6C81334
Received: by mail.gandi.net (Postfix) with ESMTPA id BE4BB20009;
 Tue,  2 Jan 2024 08:36:07 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Tue,  2 Jan 2024 09:36:05 +0100
Message-ID: <20240102083606.3055201-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704184567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+hHDKs8+XLvpY/64hs7uAll0Cnsi553Py/1XBi1cy/Q=;
 b=cpM7jPHzyy6KJ/F2I0ULCzssxq0SjwcfevHD51AraXYLw3ZdnvDP/ZjIFYAd/OTUpOsQNl
 E6loH9cdU8svgeh4TzugLqV6xohuqsLpKa6kwq8jUGS/Xv4kdeoo5K86V8FsZCfsUZzCBN
 QlqbbVYiEpRmtTQRbFu9f/wIi27TWyf2XlbZx2o1/gq9qnbkZEkrDGAlmUBVial2PjVXlD
 KecziKRHlCGtiT0aF5AojsVd9F3ILxVy5/0382BFqVJXBK+ve722aO2zM5o6UjBVqHP0HC
 YuYTxRkYnKrYBkAHTkH3cucivmBvZtOQ3TLFS27OsO0VYHrKSNm2anEq8YNLIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cpM7jPHz
Subject: [Buildroot] [PATCH v2] Config.in: change default optimization level
 from -Os to -O2
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Historically, Buildroot has defaulted to -Os as the gcc optimization
flags. However, this default is probably not the most appropriate
anymore, and this commit therefore changes the default to -O2.

Here are some arguments in favor of this change:

- Most Buildroot users use Buildroot for platforms that have a
  reasonable amount of storage, and the difference between -Os and -O2
  in terms of code size is no longer than significant compared to the
  size of storage available on average embedded Linux devices
  typically found these days.

- -Os can have a pretty bad performance impact, compared to -O2.

- -Os is much less widely tested than -O2. For example, with recent
   versions of gcc, there are parts of Qt5 that segfault when compiled
   with -Os and work perfectly fine with -O2. Yes, it's a compiler bug
   that should be fixed, but in the mean time, having a default that's
   more widely used/tested makes sense.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 554b4062eb..bd4bf872aa 100644
--- a/Config.in
+++ b/Config.in
@@ -474,7 +474,7 @@ config BR2_STRIP_EXCLUDE_DIRS
 
 choice
 	prompt "gcc optimization level"
-	default BR2_OPTIMIZE_S
+	default BR2_OPTIMIZE_2
 	help
 	  Set the optimization level for gcc
 
@@ -520,6 +520,7 @@ config BR2_OPTIMIZE_2
 	  -falign-loops -falign-labels -ftree-vrp -ftree-pre. Please
 	  note the warning under -fgcse about invoking -O2 on programs
 	  that use computed gotos.
+	  This is the default.
 
 config BR2_OPTIMIZE_3
 	bool "optimization level 3"
@@ -548,7 +549,6 @@ config BR2_OPTIMIZE_S
 	  -falign-loops -falign-labels -freorder-blocks
 	  -freorder-blocks-and-partition -fprefetch-loop-arrays
 	  -ftree-vect-loop-version
-	  This is the default.
 
 config BR2_OPTIMIZE_FAST
 	bool "optimize for fast (may break packages!)"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
