Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A76BFD0048
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 10:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B595B409EB;
	Sun,  1 Mar 2026 10:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ITkKle1dUl9; Sun,  1 Mar 2026 10:26:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C481240A5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772360815;
	bh=Os9C4iYMuInri7lrhSBQCVsqz9QGVKd8yFYCMJnyKd8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RBafCko6xSQwmw8Ft4d8jupRSh+MMUCdxjBuK+fuGdcoa5DTHEf/M/9Ep10cKmwZg
	 wgniBNgONSXBwjEV5ChBkVZ4oMLus9Xf8BIzfZXdL2v0DQYO3mp0BgDst42eaCMgOg
	 fxUhNKMGjjZC4rjtjifG+bnGgM4hs4Imjautfjk/Fw1jpmxyNXxEUsmbDHl6yCzgjq
	 K45xcKj+GEZqEprSZDgqb+1UdYHEtv90uHmAuTZsYjPgtFhtx5w/FVWlRqyuDx7r3t
	 a+y56aB2fZTlH8eY58fL6t1atQJBdHuN6bkyOf8v77PAERHy29hwcZeXj5Nj9VaaRx
	 hNFyqD732Su7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C481240A5D;
	Sun,  1 Mar 2026 10:26:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B65F231
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 10:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98A3660792
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 10:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HhenN1pa03Mx for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 10:26:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.149;
 helo=smtpdh19-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5A2FC6061E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A2FC6061E
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A2FC6061E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 10:26:50 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id we0dvcnieclBZwe0dvTl4W; Sun, 01 Mar 2026 11:26:47 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Simon Dawson <spdawson@gmail.com>
Date: Sun,  1 Mar 2026 11:26:46 +0100
Message-ID: <20260301102646.594814-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBeuSMlVTwW1wbwZXfhoO9pfbTpT3B7LPoO7iANG1HwPgrpiNeaWU313yHQk88D9vhYrQ9XhF3BtY0lirudBqDgyMKS5bZwZiz3H04rQj5Npn9isSnJp
 NWQnzRGdKcYT2GIP1PHDaQVtXQ1GnrhCHPgTm5ZJQyOykTntf/zdXqMojVt4ScMWw0wCz8jHOQQ9zIpvyirYL9PObRLv9lKPwLTqlhciKJyYYdZAvrymz3QX
 3GVRDjnf6iUp/mEiCM80Up3TitF/WFCacOZpinjGvdTK71b6dqZeKtVnQUrnEmesABs0qtJgESjd8x69+WKzgQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1772360807; bh=C2hpNEmrrWa+vvZDtvC2ftdAaUYbM83YPFupaXxJ3Uo=;
 h=From:To:Subject:Date:MIME-Version;
 b=NNN+dTDoT3LBKsrORLDr2T5pW9RHRTzwGJ7wP2IORXzyaBbUOdYCMdRsepTtWu6Gc
 c74ry6Qcw9qO/9W0SXG0iepp+soOXsBN+V2e1SbqKHUSkHEknvQ748XMNUz4r33maM
 SJ0yDVZrAJAYCcdlkiu5t6JqFg53A9MK0wBom3XbyivtCpRTVDGJkFdoS4U7gHzfSv
 hVQELCwkzIhYZn0WTjduAmkwW3tpAb8xwkwiep0OAqe+iAGfVQ/eIZz1xbu86IFkDz
 iwqn+NjTAigwFj5W1cQ0X2Vpo9K6jYdqugODNVhqXcxIWyY/410Y93+IA66bExoSHV
 f/TK8Lhn72XiQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=NNN+dTDo
Subject: [Buildroot] [PATCH] package/minicom: bump to version 2.11.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Release Notes:
https://salsa.debian.org/minicom-team/minicom/-/releases/2.11.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/minicom/minicom.hash | 2 +-
 package/minicom/minicom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
index 92a50d010c..8d5f646dd2 100644
--- a/package/minicom/minicom.hash
+++ b/package/minicom/minicom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  90e7ce2856b3eaaa3f452354d17981c49d32c426a255b6f0d3063a227c101538  minicom-2.10.tar.bz2
+sha256  87cf0da91af0531357cd61b8e1906b907edd2c9ef82f9ae74c277e1893d0f98c  minicom-2.11.1.tar.bz2
 sha256  cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 0c9b1ae434..c799fcd23a 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINICOM_VERSION = 2.10
+MINICOM_VERSION = 2.11.1
 MINICOM_SOURCE = minicom-$(MINICOM_VERSION).tar.bz2
 MINICOM_SITE = \
 	https://salsa.debian.org/minicom-team/minicom/-/archive/$(MINICOM_VERSION)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
