Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D62E77180
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 20:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAA95605F1;
	Sat, 14 Dec 2024 20:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TH6ty6MA5TrW; Sat, 14 Dec 2024 20:44:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0B51606E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0B51606E9;
	Sat, 14 Dec 2024 20:44:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 84027C5
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 657EF606E0
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z00CRBYqlZZT for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 20:44:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 278DE605F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 278DE605F1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 278DE605F1
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 20:44:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c243.dip0.t-ipconnect.de [79.214.194.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8A9D7A4C3EFF;
 Sat, 14 Dec 2024 21:44:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42442)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tMYzk-000000004eK-3JX1;
 Sat, 14 Dec 2024 20:44:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 21:44:12 +0100
Message-Id: <20241214204413.2666219-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241214204413.2666219-1-bernd@kuhls.net>
References: <20241214204413.2666219-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1734209053;
 bh=/pjZOyPNXdUStx0s/i5no3xsCn568efyxk+gXzks1N8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LrpOu7KNZwqwNGG9x5VXpXYQBVkBrzDs6fEcJrrR3BKitqK8vV8nvcghr+V4DUXN6
 dgp07+PqOVkY6i7XDDM+4rlw45iD/pZccYQ/0oYO8ijR8BLm1MlAddfjp8cUYuQ3wC
 U+j5CI/s/d7nVed1R/uTHKNzQTZPkLmNbvDVVqpy4gDmQM07tr1MylYKL3b1egvQq/
 P2NulIuZojvKNirUsQtAsYxjs3lUodJ7n45Dlq6h8802Uo3ACnmO2Wg8ckIFqCC67f
 advKO5k/xZ44jDB+VKy364zFAbXiV3kLk4cWWO1Kej9ZhybRsNtedrHAIjjpneg+RY
 LvFZEUpmXB6NA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=LrpOu7KN
Subject: [Buildroot] [PATCH 4/5] package/perl-net-dns: bump version to 1.48
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

Changelog: https://metacpan.org/dist/Net-DNS/changes

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/perl-net-dns/perl-net-dns.hash | 4 ++--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index 9bd87d12c9..42b6b091e1 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  7a1c00ef78a6a000bfdf329f24cc5f31  Net-DNS-1.47.tar.gz
-sha256  fec3dab10ac82dbac26b1ae2e367909256f420835d96cda7dc1b508e29938f0b  Net-DNS-1.47.tar.gz
+md5  72334908f48a93da40ed13ab9ab0bef4  Net-DNS-1.48.tar.gz
+sha256  e55f3e71a31c2b856024bf5061b1160b03f879d80135414f38d8220476944753  Net-DNS-1.48.tar.gz
 
 # computed by scancpan
 sha256  1e44fcf65509b47a251eda0ce1f8bd6aefa13517e38cb1e95b8d36120fb15452  LICENSE
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index fc8c77dd67..bdc0410df8 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.47
+PERL_NET_DNS_VERSION = 1.48
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
