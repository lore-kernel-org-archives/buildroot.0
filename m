Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82570C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49D0140E10;
	Sun, 20 Sep 2026 14:15:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qieBaw7ZELgF; Sun, 20 Sep 2026 14:15:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 589A540DFC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913724;
	b=q45qXWFxDdEE7uodPG1FvFz0qbB/zl/U/WbJwzeaMr6tHIaPkPh2BvoSOJPLrpUdIPx1
	 1HYC/CpsfLM9JNJtq4pXFnIYR7RuBAEOmaUDQ2RmX6qYMkyua/3dC/oie4NVuX7ATekkd
	 MG9+GfZHlDXeRXvEtCwjbAAx3RoDkkxkbV+gRahzKgrxlUw895OLXkX0zYC8apoS08gDR
	 lfrJKFaERDu90Q8OlvXEpDCduBnM9tJoPvrRuoof15i5K2fWcxPtKnObtSCor5wJNEykk
	 ZE0+oydIVQOYJRGNOj5eaQ7nWLxS9Q97K9Wfcg6kkoRhgJ13UTBLqn1yrobVyuJI7vA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913724;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=N1Ooo2eMWikPMS1dnP0bpJolKTg9wBTi45ZmIQE3gFw=;
	b=YIHVxxiV4IpAa5nbOUGXPVM/90H2ckIU1iDiS4BrTv+Y0CGMv2NVyg7PnF5uTxDQpqT0
	 tHOGf/kivinFZPbAwSeI5+3s9YsOkoGTCeZ67x2gqLARgPai2xwxKp1YIRNHpnlL/R7Ck
	 kDhwmBgrFnFII04NlQt6nU3kQ2CAv2pLpWK9T84PU9IalicwfTGn9QftZVGDy8saq5+5G
	 vgtuXO53X1MwGFi6N/lRmrLKUtb7/hwnjhJmdkl7cmI4vtmfiWRYMmyxPTdj3dsThhZPJ
	 QZWcl2M77JpputfUiBPwqpJPBHX09AQjWM02W0AXqzar1PSoG+8vQcoUBNsJ9d3ndnw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913724;
	bh=N1Ooo2eMWikPMS1dnP0bpJolKTg9wBTi45ZmIQE3gFw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=o0jdw3VjmVq1pi0HuQBBjGZNIFQXu4qts2QIcqBcsliaVJfHVv2rEixu/do8PI5/q
	 pCbzgUV6gVUM01igyfb1AkGri9M20cX8t7n7Zh6MGhP6PpxyOc7nzJ8tuUo7w+PN9S
	 u0huXf4iGthH8J4tjyA40DvFF1BwgJ1gLZ5KE7q6r3ATqmt5IZ4Su042BwC7etN5ko
	 LJovB4uBfdgAkI7QLrEe30FK9idTC/L9S8Z/DHvOW2SOhPkaQ2+ClnVTJD2LZd9B1t
	 LOmZwrXJPKAXWwdu6ZMu2CvYH9/4SmBRjHuaEdG1G/q6eMIPMuSoiEa94xpPhnTaQD
	 2OiGSK97AjwDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 589A540DFC;
	Sun, 20 Sep 2026 14:15:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AAD85371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9014B80F19
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yoj8IQ8AgPZ1 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:15:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A1F7980DC8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913721;
 b=WRLI8CU6pfyvyQg10bfe+54lAhZvKbbry3dXI5NZhSOfJzz+/mR8yyg4y9PwyerHLKQq
 6ckbXJoinOY1iaJxA92kXq+eOY7G0/A40b8dGFWe8smxb8L7DQWOzEdDPh/rXNsOsNbCF
 88ar53aNaZjpxiQ2PSPQozx+R2Rq4yxT2ojbG3fsPSCf2EIeM4hyzBoh+ybvmw84rJ8Ak
 TZ8sF9Yt+r5Vu1PzWLYsKLsTkak1GsRZBQHIlcv1qxYzmsgF9qd6x4M6lwfKPY6ZAt9UL
 20Xb6FWSx/w5TNE8gx1zYWkEQaL8Sq/MEyV60TgXoDfvVSuHDLb0ikKyIjng5j2k5IA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913721;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=fYOWmFJrVr4kJoUPLuonOunRH2BcKGJxc9WTvhOShkU=;
 b=Tz4Grj8+zVNEn2cBXzJtK17yxDFQzZszrpm1YlsITxgdCPszbkx2yDwpL8z0hAILW4SA
 79pBHzbMu1/GJl4N6E40LIz3Sg5DuRR8TxUkMEG7MYhmZ5iuj7k4wHmiMGqzMlel2+XD3
 CbShmsNUxh4bw40tT7HPO1ICg9RLX0CPUsh2ecb39uCX/zPFgEqP8bdi2ERHAYSd3Qt+t
 HEWeoeSfX9Wf9vRrrqqQ2knkpEUX0XCwKqwOmeRws+YVmIca3wIeEuWz+wpbxSxXr/Nw2
 6MpuCsuCYwzUU9NqZuMEYlc8DouqB6iWbazTkkPv/tG4ZtUNncvOWWnHYbqh4MhgUiQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lKb57zlW; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=lKb57zlW
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1F7980DC8
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913239;
 bh=fYOWmFJrVr4kJoUPLuonOunRH2BcKGJxc9WTvhOShkU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lKb57zlWznIeujeZennv1wMPuJMyD7s1VVqaZqbU+g7qPZ2Y0A1q5YBCPNbRfTDZh
 Xx9/ZC/OtqTGYF7t9oQ7dhqCDlzYkWUCThFqvFzFevapT6rlXFHp9f4EPQcqVy9smg
 vayPqhiE0wSQ1kZMqCsRI2d+HTxes8yio1KzrXHEe6yuvKIfy+NnUbTLlcu8CugOmx
 Kalxn7R53xHlPVZbEdKZr9ySTbbEGfRfXfVL87nKWHs1vza5MYqVdFGn7LLU2x76To
 ICNhKFFR1LbFnuE26+ze7jD/gu0d5nGKwyYsp5fhrY8Lbcw22buEnmOJmZxN4nb+Kp
 QeMAUZ/XVH/eg==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:kYL5C6gPglrSwQ1Yy1W4K+2jQ/iTPjqwGezvuz5jyWXX6mMHg28p34ceDjb4UjGINQ7Cwq1Htk/BDT7XP2OfUP76H74ZvZSUyAB51WnjXDgK9LWFhTitYUmrP7rVByvV9sh9SKr2VintZ8XrGd9snCpxBVQGeN90LyZ5yHayblG4iw48o3Y5Zvvu2QgetG6TvcPLnDTuxy3oBdrlsLdoEgCXQRf70F4VdfMAqp3n9I/Ln+4rfRPS6CxUfLCFu3nNfxgPO4K/x8anxGKRv14IcHaCKbNPmqBXEX0axhHXA51iduUsOIoGc0YavQPeNOIXvvA9KSuEDOoYl7gkOTuNjacc5JB4U2OjNBuMHuNW1CCUTODB/uO4YW3p5UJXvSS8sPgcmRM8rDShJuNCuSboiqr57US+y2CgfPhdNpOOW1hEPEPwJ4LrCeBdhu6ITUSQjyvfuYvN86Kjf9B4vukgNK4PSHjt1jXQsbZ5JTqmnvF55k4F50+BPtmVL2e2+EWTErh4ViG9LBczjT7YLhkNnx4PvIu4PjvjUspAQNMtpo9XkFc9OGAbJ0o2hr7fWhDnZfBX3/2FgTb6e2FMoLnQh1iVJV5Kw4RGqmThjaW3KwjYBK
 uDK1VhzLmAb4gv2CRdk/ZPfXj5+IH3FGBhy8bJgqRm5tSiOLQoIwnkEaVd6PZ5J+QYvZAhOYXI
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 18968A4C4879;
 Sun, 20 Sep 2026 16:07:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBJ-000000002J9-0hiI;
 Sun, 20 Sep 2026 14:06:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:31 +0200
Message-ID: <20260920140605.3005461-34-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 33/66] package/ibm-sw-tpm2: Fix build with
 OpenSSL 4.{0, 1}
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
 .../0002-tpm-Update-to-OpenSSL-4.1.patch      | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch

diff --git a/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch b/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
new file mode 100644
index 0000000000..3b4e3d815e
--- /dev/null
+++ b/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
@@ -0,0 +1,28 @@
+From 66921ee5ba05ffb92700b00f17cf1e8b75522aee Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 13 Sep 2026 11:11:24 +0200
+Subject: [PATCH] tpm: Update to OpenSSL 4.1
+
+Upstream: https://github.com/kgoldman/ibmswtpm2/pull/24
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/BnToOsslMath.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
+index 731957e..345d29f 100644
+--- a/src/BnToOsslMath.h
++++ b/src/BnToOsslMath.h
+@@ -77,7 +77,7 @@
+ #include <openssl/ec.h>
+ #include <openssl/bn.h>
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x30600ff0L
++#if OPENSSL_VERSION_NUMBER >= 0x40100ff0L
+ // Check the bignum_st definition against the one below and either update the
+ // version check or provide the new definition for this version.
+ #  error Untested OpenSSL version
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
