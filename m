Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57509EB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 19:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00CA6409B5;
	Sat,  8 Jul 2023 19:42:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00CA6409B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7q_p7OZlxokh; Sat,  8 Jul 2023 19:42:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FD58405FA;
	Sat,  8 Jul 2023 19:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FD58405FA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9621B1BF2B9
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 19:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71F7D81F04
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 19:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71F7D81F04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XBsJFA_UIkGH for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 19:42:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EC9081E76
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EC9081E76
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 19:42:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0F2F8A4C0EF5;
 Sat,  8 Jul 2023 21:41:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43470)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIDoT-0005KE-37;
 Sat, 08 Jul 2023 21:41:50 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 21:41:47 +0200
Message-Id: <20230708194149.3441129-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708194149.3441129-1-bernd@kuhls.net>
References: <20230708194149.3441129-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688845311;
 bh=5df64PyHz5eiMw+QxFhqeP2xxHDIf0jfN/H6X0NaBoU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wL4s5ImMIUfg+iKYMUoQopdG6ZKUpltZqfE6bllK0qdaCAG8EdqxAKWSv1yjSgjhi
 HHiIrQD/Z5Jv/ode3fKIhDf0ScW0w4Qa3ZTOzbLB1cljPRa/I8+lxAiDCqXaGMXXPa
 flciKUFGEIyO85zwm38+9oR93Jj5E+Wac6sdIAsYJs18nGVHHyrK/zQj9GAgoUUZaG
 f8qxyUTC+1Dm/lOndImtkh0GbscolBTmPXERNf4attIsG/p6rc9PkfmbtzOTsVaRNO
 6k/7tFMTuFD99bWuI8j5liQrN67W3xMedGislAaGVhkWkN7k47pyouGZ3+tvQXJ4fb
 P+F+gjEDSQ7sg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=wL4s5ImM
Subject: [Buildroot] [PATCH 4/6] package/perl-net-dns: bump version to 1.39
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Removed md5 hash.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/perl-net-dns/perl-net-dns.hash | 3 +--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index a98ac3525d..f6292d242a 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,5 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  b70b74481908d995f57569ab7cfe6432  Net-DNS-1.36.tar.gz
-sha256  143ba0e530f8b727be61ec052974cbf52df5b0afc0582d75b04809e0b2a95ebe  Net-DNS-1.36.tar.gz
+sha256  e99cdedf9f0d60dca16f613e488c5b7f123c2fb24b3346d580cfe7da40851ac6  Net-DNS-1.39.tar.gz
 
 # computed by scancpan
 sha256  1e44fcf65509b47a251eda0ce1f8bd6aefa13517e38cb1e95b8d36120fb15452  LICENSE
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index f4c20c07ad..2626c22d64 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.36
+PERL_NET_DNS_VERSION = 1.39
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
