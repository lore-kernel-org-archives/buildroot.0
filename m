Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124A5C71135
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 09:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75AB480D38;
	Sat, 14 Jun 2025 09:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-Ujq8J4KzqT; Sat, 14 Jun 2025 09:48:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2CA780CE0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2CA780CE0;
	Sat, 14 Jun 2025 09:48:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 14DEB1A4
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 09:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF3574043A
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 09:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yj3cSC3hfOT0 for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 09:48:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 945C2402BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 945C2402BC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 945C2402BC
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 09:48:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cb5b.dip0.t-ipconnect.de [79.214.203.91])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B842AA4C0815
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 11:48:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52020)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uQNUs-000000002OE-2NEf
 for buildroot@buildroot.org; Sat, 14 Jun 2025 09:48:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Jun 2025 11:48:22 +0200
Message-Id: <20250614094822.56877-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1749894502;
 bh=s0KfVpk13aWyH64rtTPC9QAoYsCc8UBh+bzHk0ut+tw=;
 h=From:To:Subject:Date:From;
 b=hrZqfrlRZrCZAED6dVttloqtmo+7BIujJGrr1guFGbT51IOhE/FRV4GPn71BkQoO1
 aCO9QX8Ecjc+OKzxh4wcauv4eKQYxJeNvUNfZtD91C94eFrtGLvz9V4XhpURlfBg41
 NnfL0RXAm0lZpsiZYWJNmPT9JbIRCHYNbhXF4JWfji3X96EbegR0C9kjYgppYu2oG6
 NO0U/PCctBAauORuh+XPvv/jZbSr4kmQru4jCf5XmDTNtTFdNcvCts1esO9d81Q3o+
 H6jYUODDgeA8+8CTDBaYsf9Z4sSqhWzzr3pdOzA4NgpeXyRZ8MDC7UUZAmVJE3sxl5
 YwvQqJD5UQhBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=hrZqfrlR
Subject: [Buildroot] [PATCH 1/1] package/bcg729: bump version
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

This bump includes three patches which were added since version 1.1.1
to the cmake files:
https://github.com/BelledonneCommunications/bcg729/commits/master/

One of them fixes build errors with cmake 4.x:
https://github.com/BelledonneCommunications/bcg729/commit/e29952e7ceff64de6fc6f8db43e3b326481280be#diff-1e7de1ae2d059d21e1dd75d5812d5a34b0222cef273b7c3a2af62eb747f9d20aL23-L81

Fixes:
https://autobuild.buildroot.net/results/118/118349d20eae2dccdadab949065f6bc6471c825e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bcg729/bcg729.hash | 2 +-
 package/bcg729/bcg729.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bcg729/bcg729.hash b/package/bcg729/bcg729.hash
index 2eb80a0407..13edabe99b 100644
--- a/package/bcg729/bcg729.hash
+++ b/package/bcg729/bcg729.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  68599a850535d1b182932b3f86558ac8a76d4b899a548183b062956c5fdc916d  bcg729-1.1.1.tar.gz
+sha256  62812779c776620f8fa005fc7c6ae14039d7b2efce66cf9af69c426393b5d062  bcg729-8bec1e5fc072f3669e435edd137eb3da6da2eef7.tar.gz
 sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/bcg729/bcg729.mk b/package/bcg729/bcg729.mk
index f89e535546..d7608447ee 100644
--- a/package/bcg729/bcg729.mk
+++ b/package/bcg729/bcg729.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCG729_VERSION = 1.1.1
+BCG729_VERSION = 8bec1e5fc072f3669e435edd137eb3da6da2eef7
 BCG729_SITE = $(call github,BelledonneCommunications,bcg729,$(BCG729_VERSION))
 BCG729_LICENSE = GPL-3.0+
 BCG729_LICENSE_FILES = LICENSE.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
