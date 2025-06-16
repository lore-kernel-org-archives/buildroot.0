Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D01C71159
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 19:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09C0B808BA;
	Mon, 16 Jun 2025 19:14:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6BLfD_WsXem; Mon, 16 Jun 2025 19:14:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C7D58109F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C7D58109F;
	Mon, 16 Jun 2025 19:14:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9200816B
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77F0E40AC2
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ADGouwQ1Qfk for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 19:14:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A284E40AFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A284E40AFA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A284E40AFA
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:14:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01bf.dip0.t-ipconnect.de [91.58.1.191])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CA6FDA4C059A;
 Mon, 16 Jun 2025 21:13:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38054)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uRFHK-000000004q4-19QK;
 Mon, 16 Jun 2025 19:13:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 16 Jun 2025 21:13:58 +0200
Message-Id: <20250616191358.3479543-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750101238;
 bh=wsACfQygyJr9XACP5lUDqYlwzPgysPkLAMHLxG5fsMM=;
 h=From:To:Cc:Subject:Date:From;
 b=o9b4Yqnwi4cVFd0Q96PGHadBK3RTk+id0E5KAs6n+ANXr5EP/+ksagFD9/rSmKTFl
 PMDo/S0TlWcGODkzKnbHAU3wd2ham+JoeCJe/wQZQvyg3QHPMWRf1e/qHGCr3thnGv
 4buuaevA/NL8xa4JJ4O6HBkl5ZfsGZXJANIww9Nw6BqwXOhzhYM3gBGS9SrJf+FnB6
 tUv4PgYI4x3Ss0mFnsUzgHC4QbwZGUP67YTdX+Wu2tpM2QFPWlwjHA+bp9b9HuLw4h
 kQ7nPbZ/r3PblivI6RY4uvRimu/YreVB2ckHnPCH0hWqa6ByP+jyuSDXOh46i+48v5
 SIIdXOYfv0AWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=o9b4Yqnw
Subject: [Buildroot] [PATCH 1/1] package/perl-net-dns: bump version to 1.50
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
index 42b6b091e1..3a3693bea0 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  72334908f48a93da40ed13ab9ab0bef4  Net-DNS-1.48.tar.gz
-sha256  e55f3e71a31c2b856024bf5061b1160b03f879d80135414f38d8220476944753  Net-DNS-1.48.tar.gz
+md5  1ca152f2eec8f66ef4ae7243697197cc  Net-DNS-1.50.tar.gz
+sha256  c660500b9d96e5aa2b16d9f4260b6f9f05b5602d3c4bea0ca39b45bcd02ba993  Net-DNS-1.50.tar.gz
 
 # computed by scancpan
 sha256  1e44fcf65509b47a251eda0ce1f8bd6aefa13517e38cb1e95b8d36120fb15452  LICENSE
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index bdc0410df8..05924c1055 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.48
+PERL_NET_DNS_VERSION = 1.50
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
