Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C999C61DBD
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 21:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1585380C45;
	Tue, 25 Aug 2026 21:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4HyZexWh6AnO; Tue, 25 Aug 2026 21:47:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787694421;
	bh=6UTigDGgihv4icghAqpV54xXObtogsyNuxN3pB0tZQ4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=VJK68Rpnc+N0ZLVLp4kh6KMWaJi57lfpZlbRENQqJFElZFxZApYSqU8jYI6n/qOUC
	 +0b+alD15aoJpHlFBHqq1GLL4i+TohLdfR96syvusvvje0qJj/+F4fXHmK0mssXkKN
	 59iWapzHMKhd2Xk8MV1yAE65TkpMfnImbBOb2qsuuNVlczWKzoZJS3zyf7ebGieDdJ
	 EqjdIkEdPM3nPbLpdAu541nWNEvcASVhSBgTWZQ0AaUTkhjiJhR8b82ZV6S+KMjszM
	 w6rv7tN2guUeGB1WmyJkp/0YlweoK7yFtjKkojEGIlYCcPuyJ7Szqf5qsnP/FdLNLe
	 MwkUvNnOillSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BEF980C46;
	Tue, 25 Aug 2026 21:47:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C16933C3
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7BFC80C45
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VGgzDPBHDbSs for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 21:46:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BF6A80C38
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:46:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BC13B4E413B4
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:46:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7AE73604C4;
 Tue, 25 Aug 2026 21:46:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7420F11C7A93D; 
 Tue, 25 Aug 2026 23:46:51 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 25 Aug 2026 23:46:49 +0200
Message-ID: <20260825214649.3710109-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/bind: fix thread dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit 54f96add94901511862df18e527e456982005b8e ("package/bind:
security bump version to 9.20.24") the depends on
BR2_TOOLCHAIN_HAS_THREADS_NPTL was incorrectly downgraded to
BR2_TOOLCHAIN_HAS_THREADS:

-       depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
+       depends on BR2_TOOLCHAIN_HAS_THREADS # liburcu, libuv

This is wrong because libuv depends on
BR2_TOOLCHAIN_HAS_THREADS_NPTL. This causes unmet dependencies:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBUV
  Depends on [n]: BR2_TOOLCHAIN_HAS_THREADS_NPTL [=n] && BR2_USE_MMU [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=y]
  Selected by [y]:
  - BR2_PACKAGE_BIND [=y] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=y] && BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS [=y]

Fix that by switching back to the BR2_TOOLCHAIN_HAS_THREADS_NPTL
dependency.

Fixes: 54f96add94901511862df18e527e456982005b8e ("package/bind: security bump version to 9.20.24")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bind/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index 6f5f14a6bb..ab8ddcd0a2 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_BIND
 	bool "bind"
 	depends on BR2_USE_MMU # fork(), libcap, libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
-	depends on BR2_TOOLCHAIN_HAS_THREADS # liburcu, libuv
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_INSTALL_LIBSTDCPP # liburcu
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
@@ -48,9 +48,9 @@ config BR2_PACKAGE_BIND_TOOLS
 
 endif
 
-comment "bind needs a toolchain w/ threads, dynamic library, C++, gcc >= 4.9"
+comment "bind needs a toolchain w/ NPTL, dynamic library, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
 		|| BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
 		|| BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
