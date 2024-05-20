Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDABC25B77
	for <buildroot@archiver.kernel.org>; Mon, 20 May 2024 19:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B14A4605D4;
	Mon, 20 May 2024 19:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKe0bqRzkQe0; Mon, 20 May 2024 19:41:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDC0C60612
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDC0C60612;
	Mon, 20 May 2024 19:41:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 372691C4CB2
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 19:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BADC81F83
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 19:41:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HaqwjxA_C9zv for <buildroot@lists.busybox.net>;
 Mon, 20 May 2024 19:41:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.162;
 helo=smtpcmd14162.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 81B6781F79
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81B6781F79
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81B6781F79
 for <buildroot@buildroot.org>; Mon, 20 May 2024 19:41:41 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 98t8svTx30ADe98t8slFXB; Mon, 20 May 2024 21:41:38 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 20 May 2024 21:41:35 +0200
Message-Id: <20240520194136.2470200-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGTGXZNM2yx7dTAvXsByYygL/8InqFyovHaeGKgn1UwWjPzbdGvUCo/Ydo4CGDjhw6IN/kMDsNZ/R9kxNnxYnUwVqMxBDWoCmaKsOe55i07rniSwKHJL
 TBx7++vJ0yd4GbPrpN7S+zWxsuM/1Lv5Du6l4vIrvE+PebnI20LW2PXyHCktElzPbC7MykRAnv1pCxuMC4aQ5cIv3Z37fVXpSpsi4S4+s2YTx7LQhhh7M1fg
 PtvuvcXULdaOe+P0L2PBklEOODrVMSIjc5Yu2NWqf8V7wDKBaVxcw9bEjm8el8qXhFj/6hzvQ/HIRKtI+7hM9B1I6wuxb/Fhbu7MNxOXrq5tc+BFWeiozFgz
 luPOic3N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1716234098; bh=Zwtkd6Fgvakv24SzeGklL+/vngEouJUYHcdO7Y8Vgoc=;
 h=From:To:Subject:Date:MIME-Version;
 b=a+8rCUYsCdaX093NdqrelNbCgeDjtQOcv5j/heaTLx8tCnrlsl47EF0rRAZQSvwyj
 lbfoQGgMZrCNgY6/5+ibaW0zHv14s2exHOdT26j6YNl8YOvWZHTeYUm7B7scHmTVfy
 /NAZls59TzeF+r4tyJt72bb1mdB+Ci2liHuV2V20b6iLmsZe1y8rgdYDUh6Eyo0VR7
 aREPvR2ROnEQbUQ1u55Bni7kHUiuJr1cn+KJo+6pkGBiZylMS4W+/PEGCjnSxegI4O
 YZMCyaCzfZTU4dz0U8MgDfOrmjjWW/RGKj4IjlaxrUJfHLa7Y2YzwXtgVGQpUfVbfP
 huWUYYco4f7Fw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=a+8rCUYs
Subject: [Buildroot] [PATCH] package/rtl8189es: bump to version 2024-05-19
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this version we can build with Linux 6.9.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189es/rtl8189es.hash | 2 +-
 package/rtl8189es/rtl8189es.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
index 1ef46436fb..1b1aefdd5c 100644
--- a/package/rtl8189es/rtl8189es.hash
+++ b/package/rtl8189es/rtl8189es.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b28c15f4631f4151ea6fca96d59aec931766af49ccb7a0d5e1080fc41a323713  rtl8189es-eb51e021b0e1b6f94a4b49da3f4ee5c5fb20b715.tar.gz
+sha256  5ab565057ac81527ac579edfdd2a1e42b9ceb2f2924b2ade88a11849443789e4  rtl8189es-30a52f789a0b933c4a7eb06cbf4a4d21c8e581aa.tar.gz
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index 8bac0a125f..11735ba112 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189ES_VERSION = eb51e021b0e1b6f94a4b49da3f4ee5c5fb20b715
+RTL8189ES_VERSION = 30a52f789a0b933c4a7eb06cbf4a4d21c8e581aa
 RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
 RTL8189ES_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
