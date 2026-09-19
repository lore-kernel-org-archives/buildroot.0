Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CEBC982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AF71606A5;
	Sat, 19 Sep 2026 16:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FNtyxoxYBti; Sat, 19 Sep 2026 16:03:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6BCB560677
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833806;
	b=E2Qy4EA4qh/zsGBo2CmKOouDDJuBEdd+AJVaKJrpPILzU0s378uASQEhZgCVT71Hq6ap
	 LgtOxO+D2dE+CjwEMQFiKXcGpYzKTSL57hdACwWLLIEOW+/yJA3mxzaVPUZOTYtyOKfDw
	 l7MGFObKDULo9h5nts5KJ5Mnn8+0LRqZ8OPDT9pCxbxfEY2DmarNZJ+d9pGYqso3SC8Xe
	 n/inAGSDlmxPjgyvdQ/nrKfAXU0ZM+n/9+HYAO/0nFDN1ubze5Xt8VSRtEO5xPs4qGVX8
	 Ry8hRa2d2OGBBYG6Ft3Xg4e9VDWoH0+pJ0n3tYJye+6UFQXuxKg19eVYSmoO1S5c22Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833806;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=235skMEz307yiyV9CXz+xd/ZQkAz+x4P3WQCD2hRQuM=;
	b=ZMpF53n2w0V0PeoaTS/DzuFEsKeXlV5ilPZcl92K8ZFIJlPbw500ozTHAhzwV0eO8HST
	 xOCAsM5MKpHiXYsBcLM8AHceEyDAly3AKWU+lWgiI9KzIJ95bjjo5TOObUptMnYMtJmpQ
	 1GLxRbSAHfZLTRoTIR2GaROEbn9e58y/P7GprHKX3Z0/xksdtxMrRmqzlrkKhMXjB4ZT4
	 k7ihm0/UgkD36KTECzeFHIHVEJ1/2NVUS8xbOOdrJREtkoRA9TKRdT3zI1t//mOU15z3l
	 eRIPyNSQYpsdZCPFWJpnd2afY821ffitrX1UBm+ebSCbxxNnjRhvD2MsLIyIsKnx45A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=d2khXEB3;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833806;
	bh=235skMEz307yiyV9CXz+xd/ZQkAz+x4P3WQCD2hRQuM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HacBjgQGb505+LWSt1t9lWAmUp3X4P5im7rgmesR7N9tFFIaxDCZkiCH5DMI78pWD
	 NWs3bUFScNgJ5KxkxkWDi07+HcHY52KJDbMV4UGDYBKrsw/v8KulqTI5CK7XUboj+e
	 qm87t1JLY2HMFAAlIC+XdtlQ2hsPNjSHEPYBT+x/jxjOU0VEo54znuUWjEulMpzumY
	 cWUnjzRbFDFVAE4VyXbdIvhAVivEjyypH+4sCQcPZ4e5YNUVeUFOGcNkolZbCEikxf
	 ShBZO7wc2lIxcxikbhCymXzdZhN0NFgtEZUbIlDyb/rMnk0R+RPHedokaL4VipHcd9
	 AN3r/9fJwIpsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BCB560677;
	Sat, 19 Sep 2026 16:03:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C3D824D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49F1E60677
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Q6f81vM2oxz for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:03:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 47FC260673
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833804;
 b=qxTpJ9HUlb7ewS7jr7T+bfd/6k+BYBcpatOrPuVv3h7RRhRdgN4QBlh6fcvLLJCY8cSL
 kvNLtNMOu1+QIeKBM4oOdkZRbxDx3Nw77MoW06mg5HdwNvkFUlIJxvLr7hmmhSYPZgXgf
 iDLFhW7acqE+grWeeMmxkIcGP4CQ+ya4foJiUjg6gT+M43/br2lX39VrmFH8R0LusQ9eP
 +DZWB0g9QLx3pz1zPPJbaNCDaVlYDNqfShxlp27TLRJweIuuyWLYsthJwL78+te7T1+9r
 OZvaVxIHv/SsL3EULpANQX9iQ9JBwesQ+zJOvMm6hTkvCmII+IHyycTOFpBR6NAcNNA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833804;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3aKZb4LJYzzut3vuILtIB9xtnqzSTwUpR3VdLJSINBs=;
 b=JZR8yQTwvOr7OjmE2CaKlPi9Zwic+ZjJgSqUiuZFzoZ8kDatWHjIXyVPdxi+Cc1iocfI
 0UxxIrtcsBSvTtkre91LGydheh6i7md1Yu6Ztu4/y569yFplNjxZy4epT27yNUiyWYiq9
 rQZZCoLzKDCAWnp87ED3SlwBt+fiXV5JDNoXDoU72tOhwqqmdZNb+bd93IOW30udWjI54
 7dU3RaZ2YV0Cs8sTSQuRh4aMnzA6ruCBC3bEvAQvf9zU+Hi6hztIgVAVXKh77s5y+s92s
 E5Sqy60tBO+7CuY8QOxyQnxqwu/y9RBT5gNEa3VIPygNdnM6+m0fnzbw8X33joWP8Qg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=d2khXEB3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=d2khXEB3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47FC260673
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833543;
 bh=3aKZb4LJYzzut3vuILtIB9xtnqzSTwUpR3VdLJSINBs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=d2khXEB33tSdy3ExTKEVW/JE0ZAuXjznL5ECKf4qhzF8skEvJUMWbuXnKk/GZYcnE
 1devveXLk3pE+mqzpxbiq8G5V+ynf/plkjLOCkJl3Kp0HbhhzEqwxUzjrFvooaqtmw
 UUOqqbh406+rg+5gXjgIP1jFw4+DDC9q5Z8jQWKcnLrzpUF5BUHvj6CcC8OkgvNNoV
 7iBvZwU7lq0ANA0Ai3yljuCmyoJhh/iFKAS4dz+QTeeuF9Y2laU4a5xPa0y4t3Vu0j
 YLgrBFJiL1QusoNHxXGMtokzl+kQEkuKB96L4pAmD0AZuPjpt2NtXWp6GDTB++q/JB
 d/xg4QD1VK/cw==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:ulyxpm16O5GzQZ0QnUpxe5GEcOp8TePXuArrjcUcy8qsKwi0fiSJhBtyTv30dt8dq+bkKOYeYf+6BqGCeTvkZzIjQGJgWgyHgM++aJaKr2EhL75XqDoiHv6t8Y9RZ3uEXb3Wr2r1Ayrtj/1zuEb6sCr2wLQ0aSS2b+Uj7l0ywPiaBCcwSE/nZ3Y4z/PA12+R6vIbfkZVnGCzbD+pqscTRLk3Cz2DfM8pF2W5SBiKUFs6pyWRaRLabOAOcOAz9JiIGs5EBU0mlQFdpScDf+FeyXUm+He1Ic+iZuqsnykyq4JPNydq1nYoMvboqZwjOpYUQ8cRqbn8UDO1qE6PDnhyPPmCIQBK3GfWiK0HizbEIrGH2VftIzgm7XzWKnQ3tHvt9UqesH5DhWKM/n+s+tem31hpkeP+LLKshy4nD4zeft3SYClquJtrX5NeNUPZkUQWK9cuItFRocCXANL/t5++fZQJI8gejM3TNWAbDEtAaIqRijOBlpUGulC9Qutl4d9M41VSk7jtibTZlXKjiQ2Mv4vlQbV10+RDhK/4dwe6996EW2L/T4UwvMv17VcjUzH/eSsBYvTxuRHOnQb2LmLjCVio3KONCAcIaBMGoHcDGNLyPR
 UwpO/AKY0SIiD+bfLm24jW1fU5gLPKFJiI0bZhXB5fBXMHccJJdfVIqO5jkTEpXbG+uv1S
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 75182A4C47B6;
 Sat, 19 Sep 2026 17:59:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSw-000000005Jx-2bAX;
 Sat, 19 Sep 2026 15:59:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:35 +0200
Message-ID: <20260919155845.5776-71-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 70/77] package/thrift: Fix build with OpenSSL
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
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
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
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
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
 ...recated-OpenSSL-API-ASN1_STRING_data.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch

diff --git a/package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch b/package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch
new file mode 100644
index 0000000000..279daef4e2
--- /dev/null
+++ b/package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch
@@ -0,0 +1,35 @@
+From d586077a37e14446cf385893608ea9e60a59d083 Mon Sep 17 00:00:00 2001
+From: Brad Smith <brad@comstyle.com>
+Date: Sun, 23 Aug 2026 01:26:50 -0400
+Subject: [PATCH] Replace deprecated OpenSSL API ASN1_STRING_data()
+
+ASN1_STRING_data() has been deprecated since OpenSSL 1.1.0. Replace
+with ASN1_STRING_get0_data(). ASN1_STRING_data() has been removed
+with OpenSSL 4.
+
+Upstream: https://github.com/apache/thrift/commit/d586077a37e14446cf385893608ea9e60a59d083
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/cpp/src/thrift/transport/TSSLSocket.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+index bb8dfd13f..48b96ebf7 100644
+--- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
++++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+@@ -770,7 +770,11 @@ void TSSLSocket::authorize() {
+       if (name == nullptr) {
+         continue;
+       }
++#if OPENSSL_VERSION_NUMBER >= 0x10100000
++      const char* data = (const char*)ASN1_STRING_get0_data(name->d.ia5);
++#else
+       char* data = (char*)ASN1_STRING_data(name->d.ia5);
++#endif
+       int length = ASN1_STRING_length(name->d.ia5);
+       switch (name->type) {
+       case GEN_DNS:
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
