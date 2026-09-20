Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD208C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5A9140DD0;
	Sun, 20 Sep 2026 17:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loLtToreIVOs; Sun, 20 Sep 2026 17:10:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0F9FC40E18
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924218;
	b=oovIRltn4ejZi57oyZD/HQkLinrNzIK/nRuMvi0uC45iRyYob2xyEBkPV0YbF4esLcXV
	 S90ZfPdwnI7LvRV4YoHsqkCVkhu+TtoHyanlGelYzIZHlZV3i5QBeKFSwSku5ZWvQpCOb
	 j9QSICBPv5u7quKjHAX9wXDclrxZxpL+/cCUDhQnEAwolJmH7mwnnTUl0ftsnDtrbwiJP
	 qp08KpiA8y8nXpfQKScntEXLmXaA7isd6LJkSzCdisd0l08/0IhGH+WtyjxI3jasIPL1R
	 GVLO1jaJ5uypPrulJBhE5MdzaXpkk6iPMZZZGBEePfcGAcTbiaceFgQ10xxIFaG6bpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924218;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QYrIiEComcNnDEMrSsLDlyMKtPLSS/BRf02FDmWZwS0=;
	b=l7uXW1QeErPnx83fS9UaoXjvMkfGhxGBJfEQ12aXlgODYMn9NkSVgmZqjM7jRk9Pjlxz
	 tADtM2sX4wP1bJKNQ5YpYMl5w6rNstXNWw51PM4E4sRLKvNgyxX6/VO9z677QMFcDadyA
	 jZLAtWk8aE9coq+Ouptbfn2hZZCFquOI7UWPFVHiCRAuopaadTpZ4u1t7IXtkvz2ABWBk
	 OMKEtp6idcgBTHdOfamOUz9WuvZz5vdu+9w+/75oDzDlGn82Wc1Szla1EeEJfq6dFrP0V
	 2kOUtBfUx3yxbtLIUbj43fkP0+4eZNvhn7vw92/DySGyN3odVqe2J1JIwiUUcVYGanw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924218;
	bh=QYrIiEComcNnDEMrSsLDlyMKtPLSS/BRf02FDmWZwS0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Uyr8PYE+wXZzLGVB+4d+iSr9tjRsr8lAEkLZHYTQrBCwXkAE14c6Y3+YoP0/+yy6B
	 kPeH3flaCdJ8zXVx0Hd/SExkFqU2mImOYC0jGHUeGsXYfesIZSEhELtkJSPW4+LojI
	 lPeCTjXCUvmiJ+oDbI7bafDFsyxYuRtIa/l3KhfD677zdUWNeOy+baoksqh5LCC0JZ
	 n6DkdPQfJHLKk5Ot23dOf1xdJjIWcsq9rRk31IKdPKt01V6YzWtFTnbGFpQMY6wk5m
	 8/2/neZkCRyL6KJ1r3wJOsF5ajpvOV1qa7sIqGxrgSStfkN8dIgzLOsZB+CV54tJq4
	 5pQlYNHH7kfVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F9FC40E18;
	Sun, 20 Sep 2026 17:10:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED10637A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D36D480D92
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:10:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNytKVDOd_J9 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:10:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E42DC80D91
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924216;
 b=pDLqEo79OXm8HHggfG3gfXXO8m3S4W3R5Hg/Uy5+ITCJrgxs12iTEktINyNcom0/310K
 NctZ27gFlj0KaJps5TJmanikRiN7gxGEcBKGPeL+ffDjFF7SNIHPWdqb8k2fWdOBjhzMu
 UUjMoJUrru5cmhpbozY6ToouNQ+YlYCJi6/hjVUT7A0nF2+R9IJdFJawkuteQrYDt+zMt
 c4svndM1wFYNJpUI+gkCTpg4Fal0zd3fu5NbGgMBxRCDIlvN4FK1xvXOxZPi5R7UKbpmi
 MhSfGrl/p9/dxpId1SIBFfakpzWyURlOjzzavECZPXfdEsK3/85rSnz5i/C0LNRxRug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924216;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=oL7odfLleKQDnXJQ2Q4ROmtEalWRPRzYV2TEjxOTsVE=;
 b=T2416vxgeeRsyZgwmulYtfjxyo3okTczWEs6lI2TBgSFw/uzuK4bSFvoTUP94neFDBQi
 7n39dmXvJbqHyAtVuSP92AMBrtuQp5vY6ebR3tdvoP1A02i9Kl9opmMBvYb4/RtZfSzjh
 x+AQGiT5VUKI8xpy4yCWWfWBIPrUPV67Y5HZkkXbbY/f/M+AYuyukH4uFWQjKDFGtbffN
 wV9Mcz7MAsn2BMx3jM1qr14ECLCZLbXmPPpG0BxC7W2dkuOXoxBEILpA0S1yEP/faDxNa
 SiVJQTplMeez2Pkm5RQknKjtzMH05bQEjrNQaw9iXMBeqAiLVyfZIKT+EAre8qdFqXA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=W6nqpQD3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=W6nqpQD3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E42DC80D91
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924142;
 bh=oL7odfLleKQDnXJQ2Q4ROmtEalWRPRzYV2TEjxOTsVE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=W6nqpQD3TsrCjgHFSZwvzCGrMdHAssZ/CpszrccnDhETSPylmft8FBd296nElVLRM
 UDb1pWMtbzWMVqbcOlOJ0yxPZV3PZ5+44MBFymJBULYa+yMZiYcAqyq2JZaP0OTHG3
 S501F37hs1W2FlZZF71odEEDKEppSJHGeifFKKzz5AWwIYWc0RSAauZAbES/Bttuqg
 oxN4sQzv6HEju/QhOQjqpN3OOqLwHH0YoCmaQC727mChhEABefUM+/JlOtEfMf26nl
 FnMnKzjfG3bq+iS7hLyc1M3myy7K+uXSCP4XeEXIlrSMYOT7sYhsuMPsZEVRE+j12E
 tMcglajtb8D+w==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:s2n2Do1fBSeskE7IETAPstT+xlw0NBa5SeJizeXYyVD69qdj/29gxfQShHuHspzoXNLZvVMY4JUDgGTMx6zAoMu2JyIZkUq6dTq7wPGjTRUPlAcNV6qv+dgxHnWyg5qP5I5rCKqUBaL0ZdnfTmB4x8PwryHg7NUOC0q3tMaD9dLbT8VwvAy7B4rMThKZBnlAr8hBhXVOMA3LNyVIs/yDk/hG/4YcgAGhDRCmzJ26JK68wwlY6KY7yzYzA1Y56mWGzjuRIQ1R91djTiH+TmFPzkqOZQUUsaA6I46PEqxC3/hUbx3WLzs6jNP1hafFZZ3eMyk0u6daY6JHuhw/ov4fRHdxa/X30MY06YUp2Ug+tGe/U/9nWVLagLBl2IDHxVELBRVWSMyxKmo0WJpCk2gvmqODh+ouPfATWONMBDYpmR+xSt8yY2mwvrPwWWk/x0pSqIell1Tc62A2kFLNP5ILP1XdxJY6Ff0nzkLQlrLQOyWLil8P7BpACeMXrCLyZlL43iStP6C7RSy2V5tkRwQayzQLViBxPfJ8neSfUYNSWt6biZMVqvxqk/q36eRh8DRQt3HnDfY9rXhlSFCNGZCcNwbHVsOTwDRia84h9Ugrx0rIDz
 RGgSzkwKTPWK9aOZSlzsvdtRHfEuc8W58EQyG+0BzBOEGRiiRDp1J3OvpaiAAJxwwKcK9yZ1A=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C99FAA4C486B;
 Sun, 20 Sep 2026 19:09:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1g-000000000o7-0aGa;
 Sun, 20 Sep 2026 17:08:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:08:05 +0200
Message-ID: <20260920170815.240247-59-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 58/67] package/sudo: Add support for OpenSSL
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
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
 ...-for-getting-an-ASN1_STRING-s-length.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch

diff --git a/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch b/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch
new file mode 100644
index 0000000000..eec375f70c
--- /dev/null
+++ b/package/sudo/0002-Use-accessor-for-getting-an-ASN1_STRING-s-length.patch
@@ -0,0 +1,46 @@
+From f97a34bc7b390f185d544e21b0ef75db1275953e Mon Sep 17 00:00:00 2001
+From: Theo Buehler <tb@openbsd.org>
+Date: Sat, 22 Nov 2025 12:28:50 +0100
+Subject: [PATCH] Use accessor for getting an ASN1_STRING's length
+
+OpensSSL 4 has plans to make ASN1_STRING opaque [1]. hostcheck.c's code
+mostly treats it as opaque, but accesses two lengths. This is API added
+in OpenSSL 0.9.0, so I'm not sure we need a configure check.
+
+WolfSSL only recently const corrected ASN1_STRING_length(), so maybe
+there will be a need to cast away const.
+
+[1]: https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/sudo-project/sudo/commit/f97a34bc7b390f185d544e21b0ef75db1275953e
+
+[Bernd: backported to 1.9.17p2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/iolog/hostcheck.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/iolog/hostcheck.c b/lib/iolog/hostcheck.c
+index dbb900e71..8383d2c49 100644
+--- a/lib/iolog/hostcheck.c
++++ b/lib/iolog/hostcheck.c
+@@ -323,14 +323,14 @@ matches_subject_alternative_name(const char *hostname,
+ #endif
+ 
+             /* IPV4 address */
+-            if(current_name->d.iPAddress->length == 4) {
++            if(ASN1_STRING_length(current_name->d.iPAddress) == 4) {
+                 if (inet_ntop(AF_INET, san_ip, san_ip_str, INET_ADDRSTRLEN) == NULL) {
+                     result = MalformedCertificate;
+                     break;
+                 }
+ #if defined(HAVE_STRUCT_IN6_ADDR)
+             /* IPV6 address */
+-            } else if (current_name->d.iPAddress->length == 16) {
++            } else if (ASN1_STRING_length(current_name->d.iPAddress) == 16) {
+                 if (inet_ntop(AF_INET6, san_ip, san_ip_str, INET6_ADDRSTRLEN) == NULL) {
+                     result = MalformedCertificate;
+                     break;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
