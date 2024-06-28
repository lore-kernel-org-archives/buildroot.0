Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD711C30658
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 16:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83B9A40BB7;
	Fri, 28 Jun 2024 16:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smkofb0Ro8iu; Fri, 28 Jun 2024 16:48:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43A1841E51
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43A1841E51;
	Fri, 28 Jun 2024 16:48:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B6A01BF39D
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 16:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3581E60A6C
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 16:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4_GczzhrYeo for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 16:48:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 16F6F60838
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16F6F60838
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16F6F60838
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 16:48:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cda5.dip0.t-ipconnect.de [79.214.205.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 69C14A4C0F39
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 18:48:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51390)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sNElX-000000000EJ-3CBf
 for buildroot@buildroot.org; Fri, 28 Jun 2024 16:48:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 18:48:03 +0200
Message-Id: <20240628164803.11217-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240628164803.11217-1-bernd@kuhls.net>
References: <20240628164803.11217-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719593284;
 bh=FODuN11UL1UvY7245yHqNx1rwLloNTGko0wymgOxgbY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AS50OASzfrtGaWXTRuVZIPhS+os/OSYlPl/wPi4d/s6iviXY1cOxhusJ8XhAT5ujl
 sgALs6MFhMZEYMQKnX4p+aLqS3b2O7W446bD5MstYY4abvOLRG13eUke4cuCO25yG2
 gb52YNPviccnZS3vGn828/SD+WV/H4ntLzZC8kpv+aEoZtTN1R9TFYEznW21vIPtF7
 IL5HVY7SFCtHLl/+cJ2ShLgnJ/nQ7W4174LHBm/HG2+GSt0JVntDKtkO5SXI/ziwXx
 MNQjmDC1SKwTbvK79UuowcabvJwd40x+1+/YhQ8DziAQovPaYUzsqHcE3WkE5DsnS6
 T1yjhpK7ioM9w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=AS50OASz
Subject: [Buildroot] [PATCH 2/2] package/alsa-utils: bump version to 1.2.12
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

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.11_v1.2.12#alsa-utils

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/alsa-utils/alsa-utils.hash | 2 +-
 package/alsa-utils/alsa-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index bf98f578cd..bff223f942 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9ac6ca3a883f151e568dcf979b8d2e5cbecc51b819bb0e6bb8a2e9b34cc428a7  alsa-utils-1.2.11.tar.bz2
+sha256  98bc6677d0c0074006679051822324a0ab0879aea558a8f68b511780d30cd924  alsa-utils-1.2.12.tar.bz2
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 3ece7ddca4..e77e36fc55 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.2.11
+ALSA_UTILS_VERSION = 1.2.12
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
