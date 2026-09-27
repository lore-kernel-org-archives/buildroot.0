Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68F1C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB37440A64;
	Sun, 27 Sep 2026 10:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmqeIytly3EF; Sun, 27 Sep 2026 10:53:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D71154082A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506383;
	b=FF0uzb2p0egcSp2jtjuchXUo2HLiJafT3NNd3lUvGKrKqJE9/JvpewsZ5CYuknaG/qmQ
	 BHR+KM0uw9d1Ak4+ZSjweEp9KKwBZ466a3CncwLcJNP+mX4K7YBDcTEEKKv5A9rgS0RnX
	 7jK9ds+blgubOiG4Fzhyw70UIPEM1Ch34trzy2M8TKMXi63rveFvM7asQ6uH1oVM/iuk6
	 GhQ9rQob0hspFat/1v1BCccD1YAiZG8B3U8zg+Ajwl8tiBPFDUuKGcvtwCm2OXULo1k2R
	 QDHJyPEieRVTt/cJ7BNZH5dRyZRT7ACLq9h9GjrXBfBL9HOOLfknXy/dUj86E9jIupw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506383;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GeD3kG+rb4RcddF2Z3cRmbiz1xKV4CikmuELhNQ8WCg=;
	b=iFJGDWizaZSWiRKU60aZfMnYLAP+xc0eV37v1TjvN0JpShaKRvrNH6f2+VZ7vQyq4nAN
	 sSzs/sIUjdFf3DEtS26QxnI2Owd+MJ3id+NXuB8b4HQutxl/+0JjHH2NlTZryIAB3dB8W
	 cDvVoHwbz3MktCqsloF6ya+nCJ3CM2eDJQKV4Kys71enOQfCJST2xyEf+p351z9LOzILo
	 iuQvE2yT2HR1wSXLJvGDNu6ns3/CU+pISLjJCIW4OorOrQl579eMUbuxaHqih0Ei9L8m/
	 AkXGgI3MyAWckX7Bbtid5rRLMEla2Js4zRNCADsIyoCQ3M5NpQXPLet0tIj/2Ot5avg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506382;
	bh=GeD3kG+rb4RcddF2Z3cRmbiz1xKV4CikmuELhNQ8WCg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VeOAt8wBrmg5MJS5BMuE8FzE8Ugd6h8dG+GckSNQ4GM338q29Yitu6hSF51dxdkmd
	 Thp3EGRuN5le8LEprrwpLHUvXiG7Pg1FwjarBa/5GQ5QF3rqcI1kBDn61dLz0bgEvx
	 l/7ZOideUTyexLZqQrgLdp5mUjmXHclJwZgTkudQVJPkJgsC24itjOUTin/JcivV2v
	 9h234rZMox5w0Lbinn8IrVhvNyKcZEpToXelSJwS/KS2ms+GG2wmx/O9/uR8QfU0PC
	 1v589+2jfRg/gH32ynnTjfUu1f8fTnZgw0O8MHCPZfmSSt8RWuyNztnIumEj29BXoY
	 YVtFca3IagQ5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D71154082A;
	Sun, 27 Sep 2026 10:53:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E174F335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7EA640068
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:53:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dljk6whiyY87 for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:53:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 05AFC40059
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506380;
 b=MYQkwETT4EcpfEfk+51HLgsxaxhg5XGQKJr75YfzCrElgD/z4ZWRc2rq6XckfdsZtULc
 vSabQtU6KiQhHG09wR6lV614nelrTbbjm6xNYUfU3KX379owap1wc0lX+i7FSX2FwNqSP
 HGNGP/3UuOWyOhNkQfVTYpWUsxEKd0eMlp/JXP4xv+7VAdpke/rpbR7cm2ggc2RGHv9Xb
 BE4skYFrOUSlCg3rgdX6whPFA9ZeOknjRjbQ9vKoIH+FGkygDTyfPaIyJjbXBUAir8VV8
 5iMzNU1s2K7VjOh1UcRwtDtNq3PxiZCczDBsIuufV3YVn8Vggl6hsnBiB4EUJ2lerwg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506380;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=U3zIFxyqP3X+WAEG1FeFPKSfqTcnogofdzCVIeHLZ+c=;
 b=SJBovvq5H4Z3AAdCAt9MouLlJ8jc9l258/nDIz6r4V6g+pewQtzGwvnaAgHtBp2MrDkt
 T+cxmRxrxAkn+8+PhwoWdsGhRrkwnBkcHuf2Ps4xbRKOouuV+VCPPeU3A42uv43uUVZh8
 ujaYfw5Agos8KG5YL4aP36DxYSVPsxFivbM50SaCt46T7H5CkvwtOjA6wpyMuoRe2JYce
 4gEiFNwb60r7wD3V0tDtHjR0Vbn7vDMtvd5iXyr6XDc3KISXi+p32hejkDmhX2/A4mX4j
 7UFc9xmhhQ09BDC6KQiE9JtEP5dCMp9q3eG/rzecHSzcxPW937bYfLUnoVbxYPdQtuA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=p1i+pxVB; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=p1i+pxVB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05AFC40059
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505852;
 bh=U3zIFxyqP3X+WAEG1FeFPKSfqTcnogofdzCVIeHLZ+c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=p1i+pxVBUJQ33wWYAKhwRdU0mmBUnCb/qBJxYrN0tjxw4vu9UVsFa+feIfOnI0o85
 FDZk25m5EIJ602MBTt437/HPVpKK+35L9DhqNgktMXP2KbeXJcPdoRghN0nl62q5K8
 b6C5iJB8m2uFvGFogUSqLEONqO3kpoZi5s/N/M1jlpIM3VbIGmdEnKmJnanpD9VLzJ
 nbOgZjD506uS16Puc5OgwHQkWp6KJLsfpfSHPTAbpJQOQTpu+YiGfsWo6jKA2EpXFq
 WPikopU7PL3Nte+p9XlnhWyDiYgHexKHg5posqLELCUz3P/vR2Yfwb2EkPaVxkmSkH
 96hcd9cW2FLkQ==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 EjE4sEf+6+5B1lbTU6zuYvCUywBU2fk27Kk3WGv1cRlH/uXTACIhnY/aYAxFiy+pX7kvbCVcYRN
 owemoXvzCRpwoL9Um/3kiI87BZtlJnQsauk2hQygwn9w0w/uLanbMTVh7GBnwpWxJk8vNkT4JXh
 DkKNgjgW3ntAORYu8EgL3bJSKryWhsUUC+HYaoVc8zNTV2HCeMWPfM7jFVe0q4jZIBaUztIdi+D
 tFo31CbWEAamz8nABs6/SVLYr6QyvQAklt+b1bPq9L/7CxIJiNkcpKK2kEIvhFoOrVZbVI98bRm
 fZhUr8rbP5Iea0HjYdSU+VH2Yv7eqKld+ZmPRzppsqmep6Yx215A4Y7VhOya1AEIWMKjj4db/9m
 PWO1ao3QB/hSBVfMHmG8E7WXrOSvWx3Ln2bURlnhUVgOmYiaQ0Laoyk+UBme9A0jtpZn40vXWNJ
 vIPQWusTUFieNGv3WT3nJwE8yOszz/z7tSZ94dbAh/rlm14XBBCJdcz6JR/5PfOMAZjzELb6gSn
 l43qXJI782VrQEFwTAfefusRbGT9nmKkiOY+pEnvoLKWntumHtLSEdbHJAnGFogqvEsS7QWI3Ry
 3anP8ZKYN0/SdRwDf5ZsQWaMGMrLvd13omXiovEB7qCMHwep2PrxPum8giIVCzUqSy8DXmJinIf
 dULL5Tn1wKDfEDAVi3f8=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8D8F1A4C4FA7;
 Sun, 27 Sep 2026 12:44:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLZ-0000000007a-0LgO;
 Sun, 27 Sep 2026 10:43:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:41:58 +0200
Message-ID: <20260927104301.1801638-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v6 20/82] package/boost: system: update
 description
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
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

From: Michael Nosthoff <buildroot@heine.tech>

After removing the stub library in 1.89 a CMake config
was added in 1.91 to not break 3rd party packages requiring.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index dede9b946e..5eadbff2d3 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -424,8 +424,8 @@ config BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Extensible Error Reporting.
 
-	  This library is now header only. Building a stub library
-	  is still supported for backward compatibility.
+	  This library is header only. Enabling this option will
+	  install a CMake config file for backward compatibility.
 
 comment "boost-system needs a toolchain w/ C++11, gcc>=4.8"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
