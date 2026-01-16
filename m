Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8878C982F0
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 18:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C8948309A;
	Fri, 16 Jan 2026 18:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i_2dyZ7R3pga; Fri, 16 Jan 2026 18:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34E5D834DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768587909;
	bh=5EKmYEknCaDlhkgMBGbpdYlDyRLZbpU5XzIBSnlanYc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NizP+zFxltTyY8d7VFdOT0+7bja7bRQo3buuCp5G8faJg7Mn2CRS5J7mVDpEYzJZ2
	 ex1sItpPyOeykD+boOyLbCiqggXXKRb4yQsBKUPifeIkBrJeaFxmcFyA2PfQgp5nZY
	 LLka9gSQzj4vc9HBMn+5OVvUaRq64C37IsIjS97cM0i7Vamx0xG+jPw79EuktFT6l+
	 E33f4/OsQE51EegM90nNar58gxgoOv0Av3h0UAfXXsBoeN0LHEmL2Hvw16xX4IsRtc
	 LftzPp4/kosorsOdGwjk1V+/j9eZMN8osgXFGCQ0oAjy3v8af8U8Yl34BQEKfbGZml
	 iF7n2DYd5aMcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34E5D834DB;
	Fri, 16 Jan 2026 18:25:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93348223
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 18:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F194834DB
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 18:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TSpr2J5b_hGe for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 18:25:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C7CCB8309A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7CCB8309A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7CCB8309A
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 18:25:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd81.dip0.t-ipconnect.de [84.161.189.129])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 566BAA4C322F
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 19:25:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36542)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vgoVK-000000000Zs-03nI
 for buildroot@buildroot.org; Fri, 16 Jan 2026 18:25:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 16 Jan 2026 19:25:01 +0100
Message-ID: <20260116182501.364366-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768587902;
 bh=gdxs8o5J5K92EAjG6fBKAnXuN7Q/6efgCpnk/y3cxjc=;
 h=From:To:Subject:Date:From;
 b=BCAS5Q7jJL3A61xSWCOKwJW6z5SZW/wIlYsmQFaAjJugzgURSoGGKOTM6+d2FIjtQ
 B2/CH+e70q9jVtRYKXYhWVSPD0pvkq+5eBLm/ch9i5Rv/Pj6mLDhirD/iOnQo2dhtt
 Jh1cNkMvBmmSFhTvY5Bl4XrqDz1PBudyWa4Np/DI8cMWGnJYN2FMyLfYg4D6+gwY9A
 zYaSBprSg2HAUdFNyklQZkbGsyEEszS9kUHqqrCOBu3DqkcidFwMZOBXS2YfRbS+qu
 j9iHRNSt7Z4OcJpJdzmyI4Hk2YtEcHSkiHPZ6lzHuH4X9HAazgr2GoKKvD/B45f/Bz
 tqVE/cZ0PT2fQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=BCAS5Q7j
Subject: [Buildroot] [PATCH 1/1] package/php: bump version to 8.4.17
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

Release notes: https://news-web.php.net/php.announce/480

Changelog: https://www.php.net/ChangeLog-8.php#PHP_8_4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 4a9d2e4bb4..23ca842b72 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  f66f8f48db34e9e29f7bfd6901178e9cf4a1b163e6e497716dfcb8f88bcfae30  php-8.4.16.tar.xz
+sha256  28b234e347286158cae921d61283eb1169d89bc9d2e5f5976567260ff38b0bfa  php-8.4.17.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 7524187649..aa6050c1a7 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.4.16
+PHP_VERSION = 8.4.17
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
