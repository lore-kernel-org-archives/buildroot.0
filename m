Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C330C54E58
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 13:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D40B817AA;
	Sun, 24 Mar 2024 13:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WpJqaZzwFG2X; Sun, 24 Mar 2024 13:05:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18DFA8175E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18DFA8175E;
	Sun, 24 Mar 2024 13:05:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 584191BF5A2
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 13:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50ED160780
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 13:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5oMPDRVjyOq for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 13:04:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B3FFA605F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3FFA605F8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3FFA605F8
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 13:04:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EAA7DA4C2FAB
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:04:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46050)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1roNWt-000000005LU-14Za
 for buildroot@buildroot.org; Sun, 24 Mar 2024 13:04:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 14:04:51 +0100
Message-Id: <20240324130451.29707-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1711285492;
 bh=rjY/9/+J8eBhPOfOeesQTsRdMrD5e+m9O4d/Kfvjouw=;
 h=From:To:Subject:Date:From;
 b=twB6Xr1TrgDCLIp6KJwiW5sSZuoB/NrbIds11aHMAuHAqonwKChO7dwfDKWZEZCnq
 ivya1Lslf2BaMtxLgCssGHMBf1wWboBu7Fbhl/Mf3lfoAmqnkDMdlnLkcnbfCW+hpI
 1ZFb7/U/WiqM1yJd8KU7kRblGpQwCfvp0RRia2TtL9SpS1AHB7QpkhgM1IhNAWXDig
 z2CnZULK6xA2LV6d8NZS0fLYglOeK0JSuRp9vrLW3dFGsBYQcYbdHsgRtLjweAztbi
 htBfsD0hhbEPFNbdmN10H+d+Qmt12/ub8KgF5MukbhXNS2dxIZwgE4h3Ht/SBb2Fg2
 B8j63YTSOot9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=twB6Xr1T
Subject: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 1.4.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dav1d/dav1d.hash | 4 ++--
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index 0b2c53ec21..a62193810e 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,4 +1,4 @@
-# From https://download.videolan.org/pub/videolan/dav1d/1.3.0/dav1d-1.3.0.tar.xz.sha256
-sha256  6d8be2741c505c47f8f1ced3c9cc427759243436553d01d1acce201f87b39e71  dav1d-1.3.0.tar.xz
+# From https://download.videolan.org/pub/videolan/dav1d/1.4.1/dav1d-1.4.1.tar.xz.sha256
+sha256  8d407dd5fe7986413c937b14e67f36aebd06e1fa5cfec679d10e548476f2d5f8  dav1d-1.4.1.tar.xz
 # Locally computed
 sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index 3650f28730..74c68d1660 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 1.3.0
+DAV1D_VERSION = 1.4.1
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
 DAV1D_SITE = https://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
