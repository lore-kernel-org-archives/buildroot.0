Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F89AEE49A6
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 13:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBA9F81347;
	Wed, 11 Sep 2024 13:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OFfBcjxKw8Og; Wed, 11 Sep 2024 13:20:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EDC181361
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EDC181361;
	Wed, 11 Sep 2024 13:20:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 938031BF342
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8192240D63
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQOqDoUw8hlT for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:20:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.30;
 helo=mail.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66D0A40C53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66D0A40C53
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66D0A40C53
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id A76B816466;
 Wed, 11 Sep 2024 15:20:40 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id iozA7qXghwjB; Wed, 11 Sep 2024 15:20:40 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id EEBC9164ED;
 Wed, 11 Sep 2024 15:20:36 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:20:20 +0200
Message-ID: <20240911132021.2318073-2-christian@klarinett.li>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911132021.2318073-1-christian@klarinett.li>
References: <20240911132021.2318073-1-christian@klarinett.li>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from; s=
 sel2011a; t=1726060840; bh=DunpTj0RgLASQxSTsEHBzmEG7x/DnzmeSxQsW
 TLzA1Y=; b=SZDgv5eFh8gGuUKkWDPtBlHAVXrmV2J3Vj4ycs0Ho0gLcr8Y+rcxM
 PSh9A632DuFMHLfjy1eoTPXWGezGnbgW6Cq4iyz7GPF9x17cBMKCz2UoNnPmtsIl
 UgM0VXYKrOilK4o0noqMflrDepNEctSVL8gLNYJ5IisEm2VB6ynA00=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=klarinett.li header.i=@klarinett.li header.a=rsa-sha256
 header.s=sel2011a header.b=SZDgv5eF
Subject: [Buildroot] [PATCH 2/2] package/qt6/qt6tools: enable QML support in
 linguist
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
From: Christian Hitz via buildroot <buildroot@buildroot.org>
Reply-To: Christian Hitz <christian@klarinett.li>
Cc: Christian Hitz <christian.hitz@bbv.ch>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

When BR2_PACKAGE_QT6DECLARATIVE_QUICK is enabled the qt linuguist tool
lupdate should support QML/JS files.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
 package/qt6/qt6tools/qt6tools.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index ccb246f6a6..a4ae2a1d3f 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -42,11 +42,12 @@ QT6TOOLS_DEPENDENCIES = \
 	qt6base \
 	host-qt6tools
 
+HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
+
 ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
 QT6TOOLS_DEPENDENCIES += qt6declarative
+HOST_QT6TOOLS_DEPENDENCIES += host-qt6declarative
 endif
 
-HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
-
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
