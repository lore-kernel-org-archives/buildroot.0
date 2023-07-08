Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822FCEB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 19:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 203F3405A5;
	Sat,  8 Jul 2023 19:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 203F3405A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sqfhkt-x3Fl6; Sat,  8 Jul 2023 19:42:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46452405E7;
	Sat,  8 Jul 2023 19:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46452405E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C6761BF2B9
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 19:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66ECC60ACC
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 19:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66ECC60ACC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eYnNM1hmaTPq for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 19:42:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CD0B60A9D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CD0B60A9D
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 19:42:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DEB2BA4C0E86;
 Sat,  8 Jul 2023 21:41:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43470)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIDoU-0005KE-04;
 Sat, 08 Jul 2023 21:41:50 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 21:41:48 +0200
Message-Id: <20230708194149.3441129-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708194149.3441129-1-bernd@kuhls.net>
References: <20230708194149.3441129-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688845310;
 bh=R0T5BbRs+apmgzmbpSK/WActxf/ikRf6V1bPQgQEK1U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GBhHs5jamsL0iARA5I2B2LTmyKhXO1S7AkXHQ9HIGQ6tjJ3qbpcJ4r8Re6paeIAZH
 FgPRbJp1/OHH1ixEPJFhRC9Rad9uXqEHpg90PXiHe5tIiiBTEgjX+BluGlgA10Q5Nq
 PU/FWaa5wV3eyDSC5NcbvgjPNOL73TSAQN5+U4zEpWMUEPF1GLp2MDvIrA6IAdNq24
 EFumFgZXFCmsDOidlmFhjr88q3uKj86qKBrHJQoBrLvjp15Mbi38/t0gRXloErSwJU
 QWVBRQ8Lkcael4cJtDDN857fli6S7ApEQQFMVNqV2SK5SrOcT+PTzGHc56x2LXXfEB
 6Jrb7Tpon22Pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=GBhHs5ja
Subject: [Buildroot] [PATCH 5/6] package/perl-net-http: bump version to 6.23
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
 package/perl-net-http/perl-net-http.hash | 3 +--
 package/perl-net-http/perl-net-http.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-http/perl-net-http.hash b/package/perl-net-http/perl-net-http.hash
index f02fd90808..094b9e5da0 100644
--- a/package/perl-net-http/perl-net-http.hash
+++ b/package/perl-net-http/perl-net-http.hash
@@ -1,6 +1,5 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  1d46019fb8559070a5ec1d838b690657  Net-HTTP-6.22.tar.gz
-sha256  62faf9a5b84235443fe18f780e69cecf057dea3de271d7d8a0ba72724458a1a2  Net-HTTP-6.22.tar.gz
+sha256  0d65c09dd6c8589b2ae1118174d3c1a61703b6ecfc14a3442a8c74af65e0c94e  Net-HTTP-6.23.tar.gz
 
 # computed by scancpan
 sha256  0ed700a4bfc022e999d83407f71ab62ead96662d8f7bbebfd857376bf3ed6528  LICENSE
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index b4cef6188b..08e81f95a1 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_HTTP_VERSION = 6.22
+PERL_NET_HTTP_VERSION = 6.23
 PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
 PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_NET_HTTP_LICENSE = Artistic or GPL-1.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
