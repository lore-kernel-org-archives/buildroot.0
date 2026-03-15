Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DE9D58B0F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 07:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1B6241119;
	Sun, 15 Mar 2026 07:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVQI3mGxa1f6; Sun, 15 Mar 2026 07:49:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF7FB41101
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773560950;
	bh=YfIp2YgZHU3bpFL2L2zU7oDa0HoVXZ8aawBEENRs8D8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DjrNuTTKurKcy136/llT26hHFoTdjJaoKv5B0Ff5QrIsANKUjMVomCWKueqKRG30B
	 WTxN+cVnN7ubvfSGAFiMNvjF2M5+L3L6USQjxRCiPPOoVAgHerSqfdW8JOh2rRB+7s
	 ZZDRo/lO35K4YrAEPCIAIIMXEV1/c+HdpIWzGk8fdW1aqmyb6PXIKM8oSfOaZhdhXo
	 KDGnxo4heKK0O8h/sluIzm5Hp0bo7ZraxSZc0F2RVG4a/PZlAVwITCykDOiinnBmW9
	 P1YFZDhZOxpZWDBP0OaH4rLbNtsUMRYmsxCo5GmxWyLLKcsvVaoUlBVgg/4UblnQth
	 cCerXYW5aZoQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF7FB41101;
	Sun, 15 Mar 2026 07:49:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96B25201
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 07:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C8E3410FF
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 07:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cuSLLD7TP0zb for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 07:49:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4C738410FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C738410FD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C738410FD
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 07:49:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D927CA4C13F6
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 08:48:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48274)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1gDS-0000000088n-0YOA
 for buildroot@buildroot.org; Sun, 15 Mar 2026 07:48:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 08:48:49 +0100
Message-ID: <20260315074850.8072-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315074850.8072-1-bernd@kuhls.net>
References: <20260315074850.8072-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773560930;
 bh=so3iomDOUit1eMIyAOg7iUg4yV00aVPBd+RoEodnals=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=qfLvBzJYY2aNJmzOW7esxY2foorIkJua1Fl3H0fJu0GMXX3IP4sNRO3LKeEYAUUX1
 y7l5U17N3ehNRZ1A/U24CTgmlvgCl84IEb0z/CP4jHxCBCWdaos426NxBQz/kSLyxP
 Q90+KVQtpblFQ7bwOmhXU9mYlSYCYYynDz6wMtVLBUrolSsSOGQ0x5JYE3S85TT0Pb
 iVSOb+bAU6BAaBpOHDfCI2PSnxpInlTrgPRD+gQSgGvo0B1R3WHw5NB0axIEP8inJA
 RoMEbD7uqLRB6vhhZ00tf/GJaZeHhSzJzq/OfI6iQ+7cgGU3VqerX3g4/Wa9BhrzGo
 njwrE7GbhPIhw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=qfLvBzJY
Subject: [Buildroot] [PATCH 2/2] package/sqlite: bump version to 3.51.3
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

https://sqlite.org/releaselog/3_51_3.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 055e935a4e..7c5068c7aa 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fbd89f866b1403bb66a143065440089dd76100f2238314d92274a082d4f2b7bb  sqlite-autoconf-3510200.tar.gz
+sha256  81f5be397049b0cae1b167f2225af7646fc0f82e4a9b3c48c9ea3a533e21d77a  sqlite-autoconf-3510300.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 795bc32dbf..e9fb874399 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.51.2
-SQLITE_TAR_VERSION = 3510200
+SQLITE_VERSION = 3.51.3
+SQLITE_TAR_VERSION = 3510300
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
