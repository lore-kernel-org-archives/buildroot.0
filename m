Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016DEEE49A5
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 13:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A29798116B;
	Wed, 11 Sep 2024 13:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZH-wWAhgk2fZ; Wed, 11 Sep 2024 13:18:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6AF981300
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6AF981300;
	Wed, 11 Sep 2024 13:18:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7AEC91BF342
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69DA160A61
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 13:18:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BbkvXMtuxYpX for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 13:18:43 +0000 (UTC)
X-Greylist: delayed 351 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 11 Sep 2024 13:18:42 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 22992608D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22992608D7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.30;
 helo=mail.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22992608D7
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 8B91F164E2;
 Wed, 11 Sep 2024 15:18:40 +0200 (CEST)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id TlvOaWq2_QFF; Wed, 11 Sep 2024 15:18:40 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id 8E88E164DB;
 Wed, 11 Sep 2024 15:18:36 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 15:18:29 +0200
Message-ID: <20240911131830.2313769-1-christian@klarinett.li>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from; s=sel2011a; t=1726060720; bh=jA
 3fJp5TUs2++Fk6xoh6mAZTAZkdgmVzAL0ZZoIL1dM=; b=laZX10F3Vc8UM35BgX
 d8kTfuQsL10IASRh8xDKX/jIu5tJY39k4jAAg8nSaxsGRzQ2HnpEOUhzBkB63VEE
 G0g3D3T3SVnOiHcXrHTNFOWIuD0kzab9ojMRWBjqmDYTWSDtvNeari5tyOU1PEVd
 6lVPRWQcxxFzj0xAolUrmBgYA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=klarinett.li header.i=@klarinett.li header.a=rsa-sha256
 header.s=sel2011a header.b=laZX10F3
Subject: [Buildroot] [PATCH] package/qt6/qt6svg: host variant depends on
 host-qt6base
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

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
 package/qt6/qt6svg/qt6svg.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index a9d7eaef51..08570c7f9c 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -36,5 +36,8 @@ QT6SVG_DEPENDENCIES = \
 	host-pkgconf \
 	qt6base
 
+HOST_QT6SVG_DEPENDENCIES = \
+	host-qt6base
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
