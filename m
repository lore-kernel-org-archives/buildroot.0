Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720CAE7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 20:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3646384642;
	Sat, 14 Dec 2024 20:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 871pUxBVydsL; Sat, 14 Dec 2024 20:45:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 426538464C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 426538464C;
	Sat, 14 Dec 2024 20:45:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C2838D0
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1413606FA
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apBEZvfG_kQl for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 20:45:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A98AF606E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A98AF606E0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A98AF606E0
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:45:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c243.dip0.t-ipconnect.de [79.214.194.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9AF8FA4C3E36;
 Sat, 14 Dec 2024 21:44:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42442)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tMYzk-000000004eK-3Z4T;
 Sat, 14 Dec 2024 20:44:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 21:44:13 +0100
Message-Id: <20241214204413.2666219-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241214204413.2666219-1-bernd@kuhls.net>
References: <20241214204413.2666219-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1734209053;
 bh=4mhwTClzbSSDJqnyai9rJ33gZB3CAATSp2fePXz1WKI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JRedK1bMpGqRprU3nb7c4kJrNti8iDgRAEXF2l2jBmxQS5HPwLPoBEyWukWtmwUQl
 ApL/awyr923werUxIjQ2XB6d4+rfYU2uZDcBb33tLJCzWvL6aVDivyCv5L96y3jEO4
 UIu418cNtihUEdaNgzPIldyN4q/+DM3++yE93VBmwhUw4A5y3MjhRHNcafzjf92dFe
 61dzTC1I6sPE8KhiZdz4M1QGZdYWwmusqfSDIPgw6dHsLGIMOO2e8E9mehsup7A36o
 De+4Q66bv4CNYF+rUCGLa52+yXmfexPUYZ+zIAv7DhgbGV2BVevxlClDvex6+aYVqt
 HP5ZOPiDAT+HQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=JRedK1bM
Subject: [Buildroot] [PATCH 5/5] package/perl-uri: bump version to 5.31
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
index fb70f0c266..889c02e9a1 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  34cf48b69c4fbcc40cfebac94af39424  URI-5.29.tar.gz
-sha256  a34b9f626c3ff1e20c0d4a23ec5c8b7ae1de1fb674ecefed7e46791388137372  URI-5.29.tar.gz
+md5  b5388d5b86e1870a80ad95c153bf41fd  URI-5.31.tar.gz
+sha256  b9c4d58b2614b8611ae03a95a6d60ed996f4b311ef3cd5a937b92f1825ecc564  URI-5.31.tar.gz
 
 # computed by scancpan
 sha256  a1730c55839ce3c9182c92e3387ba8f683ad6ab8b4a3257553a20c4db194c2cf  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index d02a729dc2..40775d19f9 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 5.29
+PERL_URI_VERSION = 5.31
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_URI_LICENSE = Artistic-1.0-Perl or GPL-1.0+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
