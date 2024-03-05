Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5E7C54798
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 20:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3E44417FF;
	Tue,  5 Mar 2024 20:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EV4l6gSZSzsv; Tue,  5 Mar 2024 20:37:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B79D741804
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B79D741804;
	Tue,  5 Mar 2024 20:37:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 540211BF357
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 20:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FF7160F33
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 20:37:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2BIQ7XnNyGWh for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 20:37:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.116;
 helo=smtpdh17-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7B1AB60F54
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B1AB60F54
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B1AB60F54
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 20:37:44 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hbXgrMcjZURZ5hbXgrC0Du; Tue, 05 Mar 2024 21:37:40 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  5 Mar 2024 21:37:39 +0100
Message-Id: <20240305203739.85077-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBMyUdtMdWDmScwSG/Jtda8D7Gp3VRHt2UV7S98UHkOoPrDFW/a7MOFHs1moz3T9+Os/bhU5CDmNLe81kznvJdl5v1Q8FG2rboKuR6al4pxmxUEA/vVb
 WH6eUkdHv+G3r9rvej90p7p7zXOqcX1K6IEThWcaI1umlkAqreMXQyjIeh9rhUw6a/6urxK9OaY+L3PDzfU6RiLVa2huT6t3uPU1wbN0cv1ivi0km/L6ncQR
 gzdbQePTdDdoUedBdDTEXCnZ8j/wow9utUBupkrM9MM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1709671060; bh=tMsuFNNDCb/3p7Eq49vwU6Er9eOPtKHbBQ+d7TPo75I=;
 h=From:To:Subject:Date:MIME-Version;
 b=LllmqOoHqUOtj77QG3wLRKuD/tvVtmVEY5fxP179YOCiSLKZ3X1WTjLS5gASNCDTe
 f03AL+2G4bpBYdwMNFlDLQVQcExEnbdnlLIWZsBpluWqEMbKypoBRCX/ilOhvW1mwb
 2aqW+wYkWzdhpAOiyDYXKpahvpdiDMstQrlqTqEA/EQWvOCvzHwT8+gPTM9GMKlRv2
 mZVyYpqDmYJFidJ57SmgPRQMqTzPUCXH/3zP8N7bwRdCcg4vb1clPzUha3NZVJWvAa
 L7ORNqMRxE4Dy3rlZKZNlkD9bfNiiTZlLQDk2yENIzbPwJ46q9il9/yFu0GRzVfQnL
 QWyPRgurVN/9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=LllmqOoH
Subject: [Buildroot] [PATCH] package/rtl8723bu: bump to 2024-03-03 version
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

This version allows to build with Linux 6.8

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index 66efdaf771..236b9a6726 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  a36511894a612a9a05254e5938dafcc32b5ca46b8912582ccca84708e0f82cf9  rtl8723bu-49cb04d796d44debe965c1597f397f34ae277dbc.tar.gz
+sha256  357c78d6f86794d96530155f9ba102e56421efb6fa43eb33daa0fb57354e8215  rtl8723bu-af3a408d6399655b0db23c2c8720436ca725ca47.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index 7796def113..0ce8b1afad 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = 49cb04d796d44debe965c1597f397f34ae277dbc
+RTL8723BU_VERSION = af3a408d6399655b0db23c2c8720436ca725ca47
 RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
