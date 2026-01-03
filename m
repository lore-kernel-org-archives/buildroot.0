Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05516C2A061
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 22:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE477607CF;
	Sat,  3 Jan 2026 22:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8pY_U2HvSbI; Sat,  3 Jan 2026 22:43:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D80060AA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767480236;
	bh=mPK0n5cRcKErGQT0FbU1kTm86X8Nk0Z+hrjdcUWjVBM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=pOZgs8Kf2a1aGjvkB6VYmGlYu3+U74UqhalCtaSmO1MyOW0J9VtRw9LRVly6P5jP/
	 X86D8vEwQJ6HWv3AheozT25O0M5w/XQ9RB03nRA8MLIhEtqbKZdmMM827zB/YM3wXb
	 I9UWzsZNeJIzIUJ7puX6noeAZur/5wdplbsT4ChxW7QCKM3iRVkSpHG1T9sShRwD9i
	 vnGarJtyBj//gDfAT27PJD6LNs2wNphwNvobKRc8hSmOlxzsxy7IeRq0OZzIpwv09P
	 lGqRVtFsVHQ1RNv4+qUVNcA3MhBYzRm24LYJ9Cz41k8eY+2S7djykh0Fk5POc3qz7O
	 ypIFQrWtBQHmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D80060AA9;
	Sat,  3 Jan 2026 22:43:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A70C70A
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CD1A80D75
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Gwqjcy0n4NN for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 22:43:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7964A80E6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7964A80E6B
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7964A80E6B
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AAF344E41F39
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 22:43:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 819196072B;
 Sat,  3 Jan 2026 22:43:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 83925113B06D5; Sat,  3 Jan 2026 23:43:50 +0100 (CET)
To: buildroot@buildroot.org
Date: Sat,  3 Jan 2026 23:43:23 +0100
Message-ID: <20260103224330.2933161-10-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
References: <20260103224330.2933161-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767480231; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=gXmZj0qyrf1S2aW7bVmpzu8zMSuMXnroURtPVXLIbLo=;
 b=HUtybOD/R3dGcOKtrmfVpJtJzUg6Zj33Qwbrb8++B8ZX6KALmOMH+sIsRLmxP1XWN+ieFW
 rn/MDAAWYCqo73YE3HhscgiwaSrpYjwJD8uKFulJB1zx8hf82CA4dFpZybGwsxKquXm+CO
 VumuR/sp1mk6x5iUwu23L+kSRf1v9ewOzlc2kCYlGESJOh3aoFWJIrc6441qn/cAL5b0MF
 Bq+K2UF2qGuiXhOyFv8AgqKxFIp8k1v9wP/kf8k8Nytl0g9JQg6Sb1quRI7S1wj0nLK0rp
 mLLGQp3GB9hLwCmf4MqpLqOJqu7oLs2bJCPnyla/clI1fnNEKzpQ1aMrbtDEyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=HUtybOD/
Subject: [Buildroot] [PATCH 10/11] package/perl-dbd-mysql: add missing
 dependencies
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
Cc: Christopher McCrory <chrismcc@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit 8708f3a23a7e28fdb04fc57406e13e6b7ff4a337 ("package/mysql:
drop virtual package"), we no longer have mysql as a virtual package,
and therefore perl-dbd-mysql directly selects mariadb. However,
mariadb as stricter dependencies than what the mysql virtual package
had, and this commit forgot to properly propagate those dependencies,
causing a Config.in warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_MARIADB
  Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && (BR2_TOOLCHAIN_HAS_ATOMIC [=y] || BR2_TOOLCHAIN_HAS_SYNC_8 [=n]) && BR2_USE_WCHAR [=n]
  Selected by [y]:
  - BR2_PACKAGE_PERL_DBD_MYSQL [=y] && BR2_PACKAGE_PERL [=y] && !BR2_STATIC_LIBS [=n] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y]

Fixes: 8708f3a23a7e28fdb04fc57406e13e6b7ff4a337 ("package/mysql: drop virtual package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-dbd-mysql/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/perl-dbd-mysql/Config.in b/package/perl-dbd-mysql/Config.in
index b430e44027..cd75c9d18b 100644
--- a/package/perl-dbd-mysql/Config.in
+++ b/package/perl-dbd-mysql/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_PERL_DBD_MYSQL
 	depends on BR2_INSTALL_LIBSTDCPP # mariadb
 	depends on BR2_USE_MMU # mariadb
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mariadb
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8 # mariadb
+	depends on BR2_USE_WCHAR # mariadb
 	select BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_PERL_DBI # runtime
 	help
@@ -11,7 +13,8 @@ config BR2_PACKAGE_PERL_DBD_MYSQL
 
 	  http://dbi.perl.org/
 
-comment "perl-dbd-mysql needs a toolchain w/ dynamic library, C++, threads"
+comment "perl-dbd-mysql needs a toolchain w/ dynamic library, wchar, C++, threads"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
