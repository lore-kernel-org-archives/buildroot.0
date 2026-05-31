Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC1ACD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 14:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27B7B60F7C;
	Sun, 31 May 2026 14:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KiuGxxGsjCMj; Sun, 31 May 2026 14:38:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0BB86088B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780238331;
	bh=F6jt+yc8JrCFTJKrf/AwpibK9rli3HiNdq+PLUEuecU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=geLIkW1nQ4G+E0bHqjJMq9TCfAoxLgdXsAJxML86GwYNoUb6KIkeaulsURUH2AsTn
	 4j1GIrkKycYVPiNeg7skFmDAb0h6F+RlyoccHREor4HZEwPFHxW7KeRbaspgjjtwWk
	 UIWHFpJUY8ojtwLH/RfNJCcajGllASAgRhh0ohKfZCffVlyR6lH46wDnzdJHlKzxVV
	 qQ0e5POPlg6VV6Ib976YKgNbCOHc3jLB2jQ5nXqOTbYhGg9cA5P0908lIArVVrVbc6
	 IZHopIrRxejY1y3siHmj4arVxL8rFWwMvjsKkdcIXOVpqQ1j/QsRlyd5urc4qklaUG
	 G/JfSOVFOU7TA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0BB86088B;
	Sun, 31 May 2026 14:38:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 470B72AA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 446E784D8A
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXTQ2GXTk9Xp for <buildroot@buildroot.org>;
 Sun, 31 May 2026 14:38:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D69084D7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D69084D7C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D69084D7C
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:38:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EBBF3A4C387C;
 Sun, 31 May 2026 16:38:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54352)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wThIy-000000000aC-4A9u;
 Sun, 31 May 2026 14:38:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 16:38:20 +0200
Message-ID: <20260531143820.2967481-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260531143820.2967481-1-bernd@kuhls.net>
References: <20260531143820.2967481-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780238300;
 bh=0smNR895YTDIAYfnL4owCgLkRdjgLgyGbDg3eVOaUS8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tuPfNmr9atE0mnK9EcdiZKMk8bpa0SIboOGBHjlsCuBa+S0WtIdNlxBWh+PlRwYtT
 3l6TB5eJea4NlIEf/hkvojOQlie/ZEsd68LpApJu7NXDo6uQWQLi2eL0vQItoY0Ct6
 77xS0UtBdLhla63EHKPrJaOCYlC638koeSA8VwYQGiVJNvOtT2H/b6S0jx8lb9TYPC
 6D2L+TJAapSRyGvMMmSI/a0ffd6r0jgtYLZXflgy71J6cfTe4rzcE5TF5FmIYdCv6G
 bK2EC4XpzNX0J6MlttrgHxH2JTAGRmG0tJIPltSaZiJAK+ZrowjY6B3AZTqW9lTSFk
 lcdZC39GZnxkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=tuPfNmr9
Subject: [Buildroot] [PATCH/next 3/3] package/sane-airscan: bump version to
 0.99.37
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
Cc: Guillaume Chaye <guillaume.chaye@zeetim.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/alexpevzner/sane-airscan/compare/0.99.36...0.99.37

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/b9ecba89b8b149586c1033c8fab1244fa14c747a

 package/sane-airscan/sane-airscan.hash | 2 +-
 package/sane-airscan/sane-airscan.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sane-airscan/sane-airscan.hash b/package/sane-airscan/sane-airscan.hash
index affd7031d5..e1faa08195 100644
--- a/package/sane-airscan/sane-airscan.hash
+++ b/package/sane-airscan/sane-airscan.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  43d3436c0199496ee18aca4f875fe3926a40a0fae781bc280cdb96f7b5068ac0  sane-airscan-0.99.36.tar.gz
+sha256  b012d4ca8b526e28b0baf1e0dcc1504a1f67118914ee9362201d04a37dbf7e5f  sane-airscan-0.99.37.tar.gz
 sha256  a2631c1b81992bd6f66db6be8b009ed7e3e998d1e2db4de497fa82d65011d373  LICENSE
diff --git a/package/sane-airscan/sane-airscan.mk b/package/sane-airscan/sane-airscan.mk
index 46948ab547..911761317e 100644
--- a/package/sane-airscan/sane-airscan.mk
+++ b/package/sane-airscan/sane-airscan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SANE_AIRSCAN_VERSION = 0.99.36
+SANE_AIRSCAN_VERSION = 0.99.37
 SANE_AIRSCAN_SITE = $(call github,alexpevzner,sane-airscan,$(SANE_AIRSCAN_VERSION))
 SANE_AIRSCAN_DEPENDENCIES = avahi gnutls jpeg libpng libxml2 sane-backends tiff
 SANE_AIRSCAN_LICENSE = GPL-2.0+-with-exception
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
