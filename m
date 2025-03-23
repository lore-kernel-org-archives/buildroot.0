Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8327C36008
	for <buildroot@archiver.kernel.org>; Sun, 23 Mar 2025 19:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73E54820AE;
	Sun, 23 Mar 2025 19:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7PwvS38HEvt; Sun, 23 Mar 2025 19:07:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B43BF820B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B43BF820B8;
	Sun, 23 Mar 2025 19:07:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B1AC1B8
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 19:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8192C60709
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 19:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkM1HeyNoRPG for <buildroot@buildroot.org>;
 Sun, 23 Mar 2025 19:07:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CFAE4606D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFAE4606D5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFAE4606D5
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 19:07:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c591.dip0.t-ipconnect.de [79.214.197.145])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EDADBA4C35DF
 for <buildroot@buildroot.org>; Sun, 23 Mar 2025 20:07:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53686)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1twQfo-0000000014B-2YIn
 for buildroot@buildroot.org; Sun, 23 Mar 2025 19:07:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 23 Mar 2025 20:07:52 +0100
Message-Id: <20250323190752.3336361-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1742756872;
 bh=hC8Ef40UAx4azU0l/Wifyvoc5ianCwKdKA8V4yLYVhw=;
 h=From:To:Subject:Date:From;
 b=GGH2AM2n7Y3hYe/hn6u3MIufCFLkv9WJ5c6awwdCFpC3peS9Ym3PWHeH6JtuDjoI/
 MiP675Dv9n8myqDRtyGxn9w6aqVFYW273NI7DbHNKnE60toHEPSZiMpE1QJ1MYa/gY
 03K72GZpnUI6Op3/itV+RWcCEtIQvQ2Cif2/aNmEkNC0dgcAMcx9fF5C+HnWR6Fv5D
 jj7bfa5KTjyE9lffxCSTc7BtEzoYyyXo1MO7/xWJt0K6C6Mpd10H42rBV5SaUp/KUe
 4cXwzG+1DAPhI2yXzbQV+nidmALhHtSlvzUT9ZL8zBDOXaXx2kXSbNdeCy08/WkBOE
 O2IiB4n5jdooA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=GGH2AM2n
Subject: [Buildroot] [PATCH] package/tvheadend: bump version
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 3f86b3ff3b..7b47e9ae71 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f31cf06dcc40313e9b77331827201e74ed75c4d18156394581ca1a4ae55aa888  tvheadend-26ec161fb3c903f8b0d0be8b54d1b67c596fb829.tar.gz
+sha256  9c2e13a70f97cf4c9b37cd93bfd03a7a1e0b7f3b18080c40ef99b8917642dbd7  tvheadend-653bd0400b4413db96b80c807f0f7524f9248adb.tar.gz
 sha256  16aaf037a2d00e6e7804de64619887fc7539f1ede99e3282c86dfbc61c2af63e  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 812ab4e9ab..a9bd98ebea 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 26ec161fb3c903f8b0d0be8b54d1b67c596fb829
+TVHEADEND_VERSION = 653bd0400b4413db96b80c807f0f7524f9248adb
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
