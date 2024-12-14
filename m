Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A483DE7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 20:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D69284641;
	Sat, 14 Dec 2024 20:44:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DOgTNBy7yvFy; Sat, 14 Dec 2024 20:44:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 760DD8464C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 760DD8464C;
	Sat, 14 Dec 2024 20:44:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F485C5
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 007D784618
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqmMgG1XmaFV for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 20:44:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 14A4A84641
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14A4A84641
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14A4A84641
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:44:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c243.dip0.t-ipconnect.de [79.214.194.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7C58BA4C3E29;
 Sat, 14 Dec 2024 21:44:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42442)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tMYzk-000000004eK-2nBO;
 Sat, 14 Dec 2024 20:44:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 21:44:10 +0100
Message-Id: <20241214204413.2666219-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241214204413.2666219-1-bernd@kuhls.net>
References: <20241214204413.2666219-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1734209053;
 bh=XYSFu75BspzlKFqL7cMN2jIZFDgv1uPRAbC4cZ9GToI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Te/fDjIAAYNDvFJDxkCMWGc85LRe1rchtxyXcQ4jJy7jDwsqMQq33caZSjcm4pRZG
 HCYBHOqAFq7FszPAoZXmUQtE2dUs/asZmGlgLwFgCKzABO+sC2W9v3hUD/1IoMKZ8N
 CIzws2NLE9zisA3ZpWFUYPo5mt7G9xyYTfheO8ZWG0OoCjlqDt7p87Qk7WU7kgwa5k
 Y248+v/KcAHRbrLePhpNlqCPzq/LW4hDRX9G5QXkWi5E96ieftHWpafzmxuOoTdclb
 YjBWVgbMBzb74OI++2zeRnw2ZGV3VXE3kNb0hBRWPP7n09vpdKZIlDP4O+pKUgt2Y9
 HXIxZHlpEZprg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=Te/fDjIA
Subject: [Buildroot] [PATCH 2/5] package/perl-mail-dkim: bump version to
 1.20240923
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

Changelog: https://metacpan.org/dist/Mail-DKIM/changes

Updated license hash due to format changes of the license file.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/perl-mail-dkim/perl-mail-dkim.hash | 4 ++--
 package/perl-mail-dkim/perl-mail-dkim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mail-dkim/perl-mail-dkim.hash b/package/perl-mail-dkim/perl-mail-dkim.hash
index 5b0e77294d..8269b06308 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.hash
+++ b/package/perl-mail-dkim/perl-mail-dkim.hash
@@ -1,5 +1,5 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-sha256  0fa09a93a00f43ac91017a91628265ae7d47deb507e2770532bbb2597550d3d4  Mail-DKIM-1.20230630.tar.gz
+sha256  45de46f5dc4d23bcb6ad6401759881dd43968eab20e73f6f79d9557467de20ee  Mail-DKIM-1.20240923.tar.gz
 
 # computed by scancpan
-sha256  ffaa40feb768566e52d93879fedd2c5483828b6de483874f30a0a4425351555f  LICENSE
+sha256  c6a290f7f171362fae67166a1394374358237c37fd35cd7ae6ec1b116a797161  LICENSE
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index 4f4d86ee10..4fd855aca8 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.mk
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MAIL_DKIM_VERSION = 1.20230630
+PERL_MAIL_DKIM_VERSION = 1.20240923
 PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
 PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MB/MBRADSHAW
 PERL_MAIL_DKIM_LICENSE = Artistic or GPL-1.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
