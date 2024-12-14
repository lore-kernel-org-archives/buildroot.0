Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CECDE7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 20:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A46A8463E;
	Sat, 14 Dec 2024 20:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BrkEFKMYscSQ; Sat, 14 Dec 2024 20:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1AB284615
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1AB284615;
	Sat, 14 Dec 2024 20:44:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 080E6C5
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9F654010C
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:44:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSa4ZFce6Fxx for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 20:44:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E8B44011D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E8B44011D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E8B44011D
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:44:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c243.dip0.t-ipconnect.de [79.214.194.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6596BA4C3B8B;
 Sat, 14 Dec 2024 21:44:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42442)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tMYzk-000000004eK-2Vjt;
 Sat, 14 Dec 2024 20:44:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 21:44:09 +0100
Message-Id: <20241214204413.2666219-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1734209053;
 bh=dnTcYdvUdtlD6vfW4MitXp9tJIha1w/izugOv0nssHU=;
 h=From:To:Cc:Subject:Date:From;
 b=d458W7x14fMqv4nYR8DjsJC8hFiC4ukyEK2w7opZ1Tl/aFNCzwU6d9vTq5ODw3uv5
 2c0k1oaDGT30QDtA0K8Ax89cjsEuiaZogJZedJRUVCgx8PK6cI8ZroFUZ48Mfez4b2
 YimVPeumPEHkZ3V/bnCfo3XPPzgEusb2UDNsMD8vPMloEPLuNl/aQWu6Z6D6bEmCGN
 ZEwM3yeycZAwcmJ3YNz/tgXyXkB0+i5cJL6Z3bsqiLL9E2KpQx3lwWBXev0T7Ams6C
 4BoUkeRZ/KB5uusxTmjWJKXilvMd2CZZTyj5GpF4LTCDOQp0RZLNUg8h1SOp29lm1V
 l/OAHIleF1F5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=d458W7x1
Subject: [Buildroot] [PATCH 1/5] package/perl-html-tagset: bump version to
 3.24
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

Updated license filename and hash due to markdown conversion and updates
to copyright years:
https://github.com/libwww-perl/HTML-Tagset/commits/dev/README.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/perl-html-tagset/perl-html-tagset.hash | 6 +++---
 package/perl-html-tagset/perl-html-tagset.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-html-tagset/perl-html-tagset.hash b/package/perl-html-tagset/perl-html-tagset.hash
index 648f75f649..2940ed6e59 100644
--- a/package/perl-html-tagset/perl-html-tagset.hash
+++ b/package/perl-html-tagset/perl-html-tagset.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  d2bfa18fe1904df7f683e96611e87437  HTML-Tagset-3.20.tar.gz
-sha256  adb17dac9e36cd011f5243881c9739417fd102fce760f8de4e9be4c7131108e2  HTML-Tagset-3.20.tar.gz
+md5  f8db8974f5e7fe7df2a58263a7b00552  HTML-Tagset-3.24.tar.gz
+sha256  eb89e145a608ed1f8f141a57472ee5f69e67592a432dcd2e8b1dbb445f2b230b  HTML-Tagset-3.24.tar.gz
 
 # computed by scancpan
-sha256  275cc182d78ac2db6856442c5d334c925350fb56fe83ee3577f5850317423419  README
+sha256  ffe7dd5ca8da47fbbd00d35f57b2f17fffcc2b2eb91417d1e3df68fa1841262c  README.md
diff --git a/package/perl-html-tagset/perl-html-tagset.mk b/package/perl-html-tagset/perl-html-tagset.mk
index c6b5f69134..c1a9210087 100644
--- a/package/perl-html-tagset/perl-html-tagset.mk
+++ b/package/perl-html-tagset/perl-html-tagset.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_HTML_TAGSET_VERSION = 3.20
+PERL_HTML_TAGSET_VERSION = 3.24
 PERL_HTML_TAGSET_SOURCE = HTML-Tagset-$(PERL_HTML_TAGSET_VERSION).tar.gz
 PERL_HTML_TAGSET_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PETDANCE
 PERL_HTML_TAGSET_LICENSE = Artistic or GPL-1.0+
-PERL_HTML_TAGSET_LICENSE_FILES = README
+PERL_HTML_TAGSET_LICENSE_FILES = README.md
 PERL_HTML_TAGSET_DISTNAME = HTML-Tagset
 
 $(eval $(perl-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
