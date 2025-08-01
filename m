Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360A0C87FCA
	for <buildroot@archiver.kernel.org>; Fri,  1 Aug 2025 20:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E24C061BC5;
	Fri,  1 Aug 2025 20:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cK9QQk2c-8BI; Fri,  1 Aug 2025 20:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1644E60BA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1644E60BA2;
	Fri,  1 Aug 2025 20:02:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EFC6813D
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 20:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED2D9400EC
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 20:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gawJrqWqapTH for <buildroot@buildroot.org>;
 Fri,  1 Aug 2025 20:02:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7BFDD402ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BFDD402ED
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BFDD402ED
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 20:02:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0723.dip0.t-ipconnect.de [91.58.7.35])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 934A7A4C2FAB
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 22:02:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35072)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uhvxp-000000001hP-2xJV
 for buildroot@buildroot.org; Fri, 01 Aug 2025 20:02:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 Aug 2025 22:02:50 +0200
Message-Id: <20250801200250.2622544-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1754078570;
 bh=nMRbNKPtntiRZJn1yMGgdm6E186ZJFIfOIxQOTsERus=;
 h=From:To:Subject:Date:From;
 b=FxPUo4lAj5dlMUbYfjJhEssNg/qdiHVT4sPZtSHx4NlByWJb2wLeVv02/d3Zt423y
 skwldVjBQt6M5DGNJMpq/D8jAyx7RSN/jaB84fDLQKdX5dCUyTwgln1HWUkQldT7Iw
 okAy4Ypnra1StaBTZ4pXbRMzu71lqmMIXxS6ouwqpj//R/8Tj/5XVxnric/9gZOzmc
 vJCBWp3Gz8wZ65F7Z9BEpom0vccfbpPb1qks9jZUCxRyHMzyLlDsvRLciH+7tmnO8I
 Pktzk89yedxVNWjBsDLHY6UBfYq7uIOtzYkDUrxBAFdzELG9qZilsE8EyzzsdeAPL3
 7PAlfTTWrPvbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=FxPUo4lA
Subject: [Buildroot] [PATCH 1/1] package/libcec: bump version to 7.1.1
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

Changelog:
https://github.com/Pulse-Eight/libcec/blob/libcec-7.1.1/debian/changelog.in

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcec/libcec.hash | 2 +-
 package/libcec/libcec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcec/libcec.hash b/package/libcec/libcec.hash
index ad6da123b2..b04c724668 100644
--- a/package/libcec/libcec.hash
+++ b/package/libcec/libcec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7fd60dfd25b0b116c58439bb70158c1d5fd8fd492ad2a1a3b39b826bb50b54f6  libcec-7.1.0.tar.gz
+sha256  7f7da95a4c1e7160d42ca37a3ac80cf6f389b317e14816949e0fa5e2edf4cc64  libcec-7.1.1.tar.gz
 sha256  0137261d24ce001fc5237aacddd267533e0f150ac23cf21acffea599f7358f7a  LICENSE.md
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index e5c3453689..312e8b5acc 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = 7.1.0
+LIBCEC_VERSION = 7.1.1
 LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPL-2.0+
 LIBCEC_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
