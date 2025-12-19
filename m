Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F94D7879F
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 18:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13F2D80841;
	Fri, 19 Dec 2025 18:29:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jShZvO5CCJgT; Fri, 19 Dec 2025 18:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD93D81D35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766168966;
	bh=bHVCXuZfmnmbtKIitNPtobBqKPyGDZjjWRdkFewa6Co=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e8KDWRxSpmWWm/8+AbOjJI7WXuh3gwNGC1d2rMObUC7r2ebQ8MPBFTUeC4u28bsRb
	 XyzpLn/cX+P5C3/SKB2iW/uyppaOh1wMj27TB3c5kBcpNAi/h23lPJ6RoXG0VuPGPh
	 A1JLBfvNaQFI5FMucho38t6KmxvwHAe1iybYkWVtCbpu2xr5I2MQ0O00Dy5AA5t+/W
	 8NGILOGelr+GpCFcsYJKdx+bU52X5KDtF2G22PWILazUqaZSJq6Ct8FzlagorXT7+c
	 bUzw0KYqG1MrMeOVRl/OcHZZ046p2J2miIuRYXmNEpNaaKGLgU84nCJM8eWaYRupSB
	 NMgHZuqDYpiXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD93D81D35;
	Fri, 19 Dec 2025 18:29:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74055119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 18:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71BFB40118
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 18:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fuso-mgUlCVv for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 18:29:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8B3B54010A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B3B54010A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B3B54010A
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 18:29:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a05d4.dip0.t-ipconnect.de [91.58.5.212])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 934C9A4C4303
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 19:29:21 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42148)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vWfE9-000000000ZG-2PLE
 for buildroot@buildroot.org; Fri, 19 Dec 2025 18:29:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 19 Dec 2025 19:29:21 +0100
Message-ID: <20251219182921.2148533-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766168961;
 bh=BnNNluxDrBZ5lUKCnA44/oiYm/j5j79mTaU8I/AGIR0=;
 h=From:To:Subject:Date:From;
 b=FXgFM43EfDlnTzN1WGtfi86CSm3lXJbiA7617yzqszbAwenq08PC5er+GCU3wowIM
 6n/NYkPGvCHTKu+MV2kPZnoOba6Zvw9F8QxX5PqOiotMrh7f6UMmuAQqgAgIxfqWsa
 Wi8barCBRkog5idxnoC7rAdJjCGwsHy4dgifh37Taqd9TanTUdtiFWOVLq4rU6Qqf7
 y6symansIvjCds7IpSHgcosFUWpPUI5YaL5iCupd9JdSz42dsTaOY6Pjy3tq54pGGx
 CrEJZq+kJWCIwyc4lBHDArqW0cKcb+TVtcf9I8PD+JdKyvPPYxk8use49hC5YTouP7
 d3MA2ukk/7XNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=FXgFM43E
Subject: [Buildroot] [PATCH 1/1] package/php: security bump version to 8.4.16
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

https://www.php.net/ChangeLog-8.php#8.4.16
https://news-web.php.net/php.announce/478

Fixes CVE-2025-14177, CVE-2025-14178, CVE-2025-14180 & CVE-2025-67899.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 0532adeed6..4a9d2e4bb4 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  a060684f614b8344f9b34c334b6ba8db1177555997edb5b1aceab0a4b807da7e  php-8.4.15.tar.xz
+sha256  f66f8f48db34e9e29f7bfd6901178e9cf4a1b163e6e497716dfcb8f88bcfae30  php-8.4.16.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index cd48cd1bd9..7524187649 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.4.15
+PHP_VERSION = 8.4.16
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
