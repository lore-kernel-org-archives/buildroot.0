Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B72E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 20:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FA8684645;
	Sat, 14 Dec 2024 20:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OEMdT3DH7CCo; Sat, 14 Dec 2024 20:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CFFD8464C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CFFD8464C;
	Sat, 14 Dec 2024 20:44:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABA50D0
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8458241294
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ay7q9VNpQyFq for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 20:44:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 48377411D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48377411D0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48377411D0
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:44:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c243.dip0.t-ipconnect.de [79.214.194.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 87F96A4C3E35;
 Sat, 14 Dec 2024 21:44:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42442)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tMYzk-000000004eK-333j;
 Sat, 14 Dec 2024 20:44:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 21:44:11 +0100
Message-Id: <20241214204413.2666219-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241214204413.2666219-1-bernd@kuhls.net>
References: <20241214204413.2666219-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1734209053;
 bh=VFgt53VXPP/6x1cOBR0vxZCPC3DRsSeW3ksLC7xhQQ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xyp8LDpXwRMdPa/c3OsIi3rm0Nlg907ESPFA1BygW4s83dOvEEZC2Zl0+GFwPbqrY
 hhljTkeNSGI6bLMoPw38TYWrk1yMnTgrsqwrDfEO9woUI5uzJqTe+H5kDmZT9RVz9U
 tOnQ220mYiPLN2PQ2dQe3srcf//ZAT4gncbfvajUbSrmQKlsMKPqXuDM6TBr7xRn8X
 TCGLl72IBD+nhmXMQYzK3HGHOETsNFYIjy0HkNRRIZluQp7Bu9EI4byaCnfgxvRF96
 ALbUnd/rGEaRSrgsoPEoEEMdlIwKeKWlrCTa6V7l3IiKkRcfMrl929YWwdKldcABwR
 adGfrRILkP6kA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=Xyp8LDpX
Subject: [Buildroot] [PATCH 3/5] package/perl-mailtools: bump version to 2.22
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

Changelog: https://github.com/markov2/perl5-MailTools/releases/tag/v2.22

Updated license hash due to version bump.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/perl-mailtools/perl-mailtools.hash | 6 +++---
 package/perl-mailtools/perl-mailtools.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-mailtools/perl-mailtools.hash b/package/perl-mailtools/perl-mailtools.hash
index 317e020ac2..f34f98ae2e 100644
--- a/package/perl-mailtools/perl-mailtools.hash
+++ b/package/perl-mailtools/perl-mailtools.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  69ee516d40011e7e92b77c6f06c0dc01  MailTools-2.21.tar.gz
-sha256  4ad9bd6826b6f03a2727332466b1b7d29890c8d99a32b4b3b0a8d926ee1a44cb  MailTools-2.21.tar.gz
+md5  f41236db9af81d68e1ce8ecc401747f3  MailTools-2.22.tar.gz
+sha256  3bf68bb212298fa699a52749dddff35583a74f36a92ca89c843b854f29d87c77  MailTools-2.22.tar.gz
 
 # computed by scancpan
-sha256  f7558badc4f4875df247bcccb50a8f369bfe4a2c19361f1df7b26ddf6aaaaf6b  README
+sha256  cd861812aad88a61059bea4c9d17a5b6010d97774286bb5e9378cded6523289e  README
diff --git a/package/perl-mailtools/perl-mailtools.mk b/package/perl-mailtools/perl-mailtools.mk
index 900ee41ff5..4a3ab85cf1 100644
--- a/package/perl-mailtools/perl-mailtools.mk
+++ b/package/perl-mailtools/perl-mailtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MAILTOOLS_VERSION = 2.21
+PERL_MAILTOOLS_VERSION = 2.22
 PERL_MAILTOOLS_SOURCE = MailTools-$(PERL_MAILTOOLS_VERSION).tar.gz
 PERL_MAILTOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MA/MARKOV
 PERL_MAILTOOLS_LICENSE = Artistic or GPL-1.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
