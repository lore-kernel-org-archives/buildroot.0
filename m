Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0341C71159
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 19:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D13960899;
	Mon, 16 Jun 2025 19:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dzBtU-M6-xw; Mon, 16 Jun 2025 19:13:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4A4D608A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4A4D608A2;
	Mon, 16 Jun 2025 19:13:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8959416B
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B57D605A7
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vA4NytxrgQIH for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 19:13:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 92DEC60809
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92DEC60809
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92DEC60809
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:13:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01bf.dip0.t-ipconnect.de [91.58.1.191])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9B863A4C059A;
 Mon, 16 Jun 2025 21:13:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48734)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uRFGw-000000004m1-0GsB;
 Mon, 16 Jun 2025 19:13:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 16 Jun 2025 21:13:34 +0200
Message-Id: <20250616191334.3479336-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750101214;
 bh=E6/u+UF/ok4x5b/mGrWYPd7Ay9vy8n4yki+/e1YWxp4=;
 h=From:To:Cc:Subject:Date:From;
 b=pATITSR/IBuoAsxVbQwbtBb4e/KYtnkBnROJ4U5BVH9ax6UH9QRNQWy+iqMb9hj45
 qXOv0BSd6TuYNFFv0uLOisVwIU8BAo6exZT6P5eB3B79SaFvfgxjmwt/JdHjhV3in6
 b5CgSdZjLzbstiqE5KGSE1rGWAgdrh7pQWlBebZuvGu+qxP/qtMJp1OA+/+jlFMOGN
 oiGY1vXZUZvQsGoxfoxbrazP+v9BE5Fgj6Rq78fUqGcXBiQVs5sAX0VqiYYpvK2SHB
 Hf2Ik68NUVGeYRqHMFHyg3BeyFy6HBkmm6o3MBYQ39ku4MFQ9S4p9YVlxtWMdkzdXp
 XlnsWft5vcxVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=pATITSR/
Subject: [Buildroot] [PATCH 1/1] package/perl-uri: bump version to 5.32
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

Changelog: https://github.com/libwww-perl/URI/blob/master/Changes

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/perl-uri/perl-uri.hash | 4 ++--
 package/perl-uri/perl-uri.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index 889c02e9a1..b53479803b 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  b5388d5b86e1870a80ad95c153bf41fd  URI-5.31.tar.gz
-sha256  b9c4d58b2614b8611ae03a95a6d60ed996f4b311ef3cd5a937b92f1825ecc564  URI-5.31.tar.gz
+md5  56aa2bc3efb180eceb4c143378ab4327  URI-5.32.tar.gz
+sha256  9632067d34e14e0dae2da94631c4f25a387fcc48d06fa29330e8b3c04c4e913d  URI-5.32.tar.gz
 
 # computed by scancpan
 sha256  a1730c55839ce3c9182c92e3387ba8f683ad6ab8b4a3257553a20c4db194c2cf  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index 40775d19f9..671d1f5a07 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 5.31
+PERL_URI_VERSION = 5.32
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_URI_LICENSE = Artistic-1.0-Perl or GPL-1.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
