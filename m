Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4E0C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF08160E07;
	Fri, 18 Sep 2026 18:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PytlxV_DjnDm; Fri, 18 Sep 2026 18:47:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A039A60DB9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757220;
	b=PK3Y82cE6ZbiWttuMsqrvcFolciwPRKC74c4H2uD0RWfdhzhJOzPGyAEyhTlhNmznhTG
	 1P/vPLpc2PQIAfs7i6FVVizlYalw7RSGVCk8mnZX+tjqgvsY1LmlaXhlZsEqghMvZ+yvT
	 8kHTSpFJKfCrx3TI2LkpBD6hVDfU9+v1xCiHpC9DBABoeJEpHjL4i+ot1dBDCBfrRMbJr
	 7rYrK6VGAk0k1kEhB3+2Ta7a6Iqqh8AZG0EdTyjUwRGQAGxqtCQlLrEBm2oP5oVFYgVb8
	 CWR9qmwWqtEyPBYeLMt7iiKzWqAMtEamX0L4guSiFdVSs0+WUlU0ACQwUT3griVhH/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757220;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tye6tSHh1abjSnt0/bmPBHrBUPt7Gd+H7nLmSetX4P4=;
	b=nJLZlbwTScI+t90Kat4xsyRIVt8KjlMgclPTW9Txdo2S6rR2fXb6+T+Zry85PC27LaMy
	 LIJ8oIimJxy48k4LTwPJOktWYhlcXZezWEMZFTqsXGlbM8YXNZ6S4rqZNwjcmNV5TYrAA
	 SvNKmNO3+dpRAftmuEodkW7N2kXB3wa8tq/GfWN8Cq1lSoRfMEmzFasUSZK2kjCvropUO
	 +TVPEgWKgjXE/k0kzZSr0iEIMm9ioscWbAYFSyI5cLQxu+QVH2CcOppW0uMwkO5J3yebU
	 pEXUznpMoO3bn6D6CZWtjg9g1QCGJsTQj1HnvMbe/jJ2IKX4LdwGLUDsxgtSdeJuzTA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757220;
	bh=Tye6tSHh1abjSnt0/bmPBHrBUPt7Gd+H7nLmSetX4P4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mcob433EOu4dJIgPsSsi2Z9DJkzvBFLclRLyfqhREmGG8OxMqWng6WqQbbJhUsxWi
	 4gFNTxdwdEC36OdEIUEduwK9pnJBj7ARm1LLvcIo/MUl30XETEvLpmQcP1y/ihE+36
	 jMNxy2BIg072xpw7DSB7/Jp1pYB103bHaZFhRktd/9T/AMaF/MDymEQHfea4bw626s
	 oRsi93z8veLv6SlfBnVGlCH8hQhzFU6gBvA3Ez9NgM4lWVaEk2N3Bf+TQpd6YTnZ5S
	 sxHcR8drbghnW6ZZ6FbENo3it/V8EusClGv46BCBDSEUcEf/3DEy6LEM9uixxEobeM
	 AU9a5c3JzkZbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A039A60DB9;
	Fri, 18 Sep 2026 18:47:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 134B3237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 054ED400AB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nu-opFGWpx56 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:46:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 203444006F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757218;
 b=FEH0tcv57zh93QQ8VD0tRsECqVwvf+KNgEYZT8N1I9femwM1bypwISC/dcTKOb5q+7H2
 o2NxvR038CEahUWW8/n68vAixzAdDnxiNL3uTPzE7m394lGu+EZC1CP0WLlpqqirSJL7r
 hLoSSf1KZ1k0XoevHNk8Ip30Pn94hoU1IpGd6eJr943JwtGNiusi7ewKgkN0Sb0yRtCtl
 NvynWXnh2myG5Bh8cVZt4Qs5+Ak3lJPbF02BFNba/Bj1FUkMOWNWc93fT4Kut3iT4p5DB
 QC1cN26qRp+EPBUXRifmaQibe4sSbG5laOtKhd4R4HLRebRr7J4HOSKvYw8EBcDTJkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757218;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=n9qeUgqkQP0378J8HrA1C33nQzJMtFnfsbkk2uRvb7A=;
 b=EPmQv9lkyHBzy1HgSupDyZ+wwMBPkcC5JgYiy8F2VPMIay7a9yPL8wonolyuyIfFMjeV
 HKrcUxS9qs2ExcwijT17HhW2j3pupL/V9eDqBa5VUNUh23yerR2t4rZpb2/ThuAYDsYku
 p1yNUDV2Ih5ehlDt5UfxmxB3iHId/oKQCPTyn2su/9bLMICkuwNkptSpLVJEO/92VLu5S
 ujd0YvN8lsdm1qYrQ0OHiBeIDTvdgfgAbfnY40wI5p7MHfLPn45OlcADiMM2RP7sks85G
 XpAu8lX7vedpZwZKLbJ4Hz/TIsU6seXNPlBopQht+SvKskxfxatSztgmoi9RlDYhpyw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EE88q8Mn; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=EE88q8Mn
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 203444006F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756926;
 bh=n9qeUgqkQP0378J8HrA1C33nQzJMtFnfsbkk2uRvb7A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=EE88q8MnPERCRjeHDB5H+Q14moz6wrRA4FxJ+lADTl8Pg2Ybo3ODTEUhNjP/9sNyd
 m5tZU8MRAzoQRlJGspjABLTtKy/Yn1kymxkWYY2QOs+1nGQO2D2WK9UBMyhGXa8t8H
 MEZlvheYJf2wVYfS3JU70VZuDDW+oHOXL/hhQhLm0p2V3c2A5j6U3yj4DbMchQVshq
 xT7i+KpzV8Jf1yv6QYHh4NsQsk5WqCs895IZlppa2AzFJUqmj1p9lWGC7lU3bcf/pj
 rXJM4BWSeIb4EPTAnwNEOIvE6Pq7ZI7eugBBTZ8l0ZQBvrafrVvWnW3x9HvludcNen
 1ZR+nPbntfuZw==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:xjvgm04CEGGw8KOK2fuKgm4w/N22y5tIwnyTC6HxaOJFUFIZ9T8tYbwCspmWvDNUVcMJnUOaEFXsh58OIzgv0Wgq2og6PTDDU6gxFKfM23Lt6Wq/Xi+Hk4Pp12XXBfBq/u9STd56Wyk9lq2fOJd1F87dBH7W9x7iKfoN6lKH4+TJFrCJB06U51VqWgqhLHAdtea/g9JgJhohf8AkShXmSo4Uwy9FPebwOgXOwOtiVrGvlCadxTXuchbOzaJEMca6he06Qe7j/bIGjb+RTuMg1XpkXyUZjC7Qf9CGwp3S9kjfmuM+F4kayASErsorPu4sa5d7TU6jXnE6bLij3uOVJfC2p8SUnFe4FTKayOWd6Grb4GQHJ7f9UC9a9IPb7a/Q5K26SrKsjS6PFf860wP4yINB5cpcQPd7RLonlWrTEMBI3PN9EeWjw6FyYebrcn290arpJGpsfoDTwAJ3V//oSLigF5/9TkW6NuJ9gO5dTX3VnpiuR2I0DCGnbEKoDt4N2PgSJVyOUKCqmyNJN0uNZ1HMJULb2AilcrLxTslWvkuUeMlgGxjEg9ut3ATvIzYhF1oYlc+Tsj/C8sEWmrbV9kl7eEQaaCuvT2A1lyVHKAIUsb
 d/vMNLMIAY2de+53ARptQXc/v82ETsG3FcADJV3HSot4c2Q5chNazCpXfCiwAfQ0c9jXrXRjeS
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BFC71A4C4718;
 Fri, 18 Sep 2026 20:42:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dX2-000000007cB-3MkP;
 Fri, 18 Sep 2026 18:41:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:37 +0200
Message-ID: <20260918184140.3631274-76-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 75/77] package/xmrig: Add support for OpenSSL
 4.0.0
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Fix-build-with-OpenSSL-4.0.0.patch   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch

diff --git a/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch b/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
new file mode 100644
index 0000000000..966744abbd
--- /dev/null
+++ b/package/xmrig/0001-Fix-build-with-OpenSSL-4.0.0.patch
@@ -0,0 +1,40 @@
+From 357fab10b79e49dc9b8f42dc6cf425a8124a3f40 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 2 May 2026 16:45:38 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.0.0
+
+src/base/net/tls/TlsGen.cpp: In member function 'bool
+ xmrig::TlsGen::generate_x509(const char*)':
+src/base/net/tls/TlsGen.cpp:118:32: error: invalid conversion from
+ 'const X509_name_st*' to 'X509_NAME*' {aka 'X509_name_st*'}
+ [-fpermissive]
+  118 |     X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
+      |                                ^~~~
+      |                                |
+      |                                const X509_name_st*
+
+https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/xmrig/xmrig/pull/3808
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/base/net/tls/TlsGen.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/base/net/tls/TlsGen.cpp b/src/base/net/tls/TlsGen.cpp
+index ad2e648b..59e4f0c9 100644
+--- a/src/base/net/tls/TlsGen.cpp
++++ b/src/base/net/tls/TlsGen.cpp
+@@ -115,7 +115,7 @@ bool xmrig::TlsGen::generate_x509(const char *commonName)
+     X509_gmtime_adj(X509_get_notAfter(m_x509), 315360000L);
+ 
+     auto name = X509_get_subject_name(m_x509);
+-    X509_NAME_add_entry_by_txt(name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
++    X509_NAME_add_entry_by_txt((X509_NAME *) name, "CN", MBSTRING_ASC, reinterpret_cast<const uint8_t *>(commonName), -1, -1, 0);
+ 
+     X509_set_issuer_name(m_x509, name);
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
