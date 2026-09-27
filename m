Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7586C9832F
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAA4240A2B;
	Sun, 27 Sep 2026 10:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1X-mDMmA10i; Sun, 27 Sep 2026 10:51:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E618E40A3E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506306;
	b=f/8NjiM1QMhbHGaPcpmS6xdtIYtMz1QHTWpE49HWd5KUx91qj1jrwLo1ZuFL6QLOhPye
	 6xCuPqj+EB6VarKLu8M/8j43IfzKwL2zpqkjecP35vzNBQaHPaIzJjSSoh2KIT/gmzqZ1
	 Fju/AXi24RqBp1o1dRiXcuUptCykIMfKIRw2qXePVbTosKjQVsxJbyMwRGMDJjqBMvLEq
	 77ljUcy0IbbgZKD0YwFqQQbMzGZZZo89kAgmeCmHLK1WvVy5Dj0hPNYEBM8dE83GUpHk4
	 yXS10zyQdL+dNH+ujKRtxcdXbbTXw8Hvy7j2dNHDMyCSw20+MESTMmCHblvi29jmvFg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506306;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=A+U3E0kRimxbvQCmPuKn9xXmQGkLkoZlcJfU7X0HAVo=;
	b=swZ/03+eTWP3zeAkcTRxe61cDa8UfA0Eoz/H8oFnPQki8ApnX0CMnjzUtXlG6nO+drE9
	 lCmnyvKRwdbE9qpXbKmq9fsoSpctFjaDY6wfUxkFuPS8SNPqt2lOaxs/ZmLU5NozXYwFG
	 cCH5jFplK19RMtvq7uDGUaD2HV0A39vnHpYspCVqT2mV+nioZVTpA5W2O90CsR+m/w2dc
	 kL8G2kCPwSYEelynBAa6TW/prhp4423MXjrPw2cUIZ3H4eio2lN1H8hOi631UqZFOYc1m
	 axyEZWpl+qjkcznNM1H0x0W+L7BbXGzBdJj5aZ3m2lYhuO/z3leNqNGNZESMW5FOIBw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506306;
	bh=A+U3E0kRimxbvQCmPuKn9xXmQGkLkoZlcJfU7X0HAVo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kU9Bx4IiY+cGnL6BiRTP2nqgM1Zg6BnVfFDp8DTCoYzlLTv8FN9lMQu5tyiRm9TYp
	 Tx5RKku+r+n8vahJ7t57a+On/S9KM0uT9C1JayYLeufEBAMeRihKpG9Im5Ec3AhQIx
	 e4/WnuCqAeeq8+UDHRV3p9ZBsYbSPcVxxkUR/swuGeAX88B3YkiPHMiAtS/0ce+3lK
	 bzYkn6K1lZyNqmyP9fFa+0xKxTtPZEggVS3nlPskDNZEHnOGTA6A6u+1z63AxLJ3cb
	 Za2Qz9r42v7nILr2jKZkv5lco+AhtW6gBdVLQcwEdJGMCg4UvAV9zX9/p2oIZjmTdp
	 sRvcFIq/A611A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E618E40A3E;
	Sun, 27 Sep 2026 10:51:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44285D1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35832810CA
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHtbt2Muf10l for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:51:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7DBD2810C6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506303;
 b=ZdmWkvYyMOLrcRzLRT7xc9VXYXByJwiEZ2y8wdnC8g09uvpClLcQx/SIjCo2BbSMNUDL
 LLZ0TUv4OWvk68r0WtArK7xUMcYAY5PU+vtNpts7QUPuItnpuCxw4o0gkg+JhQ7+OhJlW
 kYuePPVszEFSFHEerBBq2KIkjRlbHSnthk+0vRx7MOBXJJi8ogwoPOVN+F19t9ZbLNyck
 bCe4dIQaii1XPtuenCIlAnw6PeVc2KkDyGxILJswcwSrPsUlrxV3Azba7tRuYTYGAPLkD
 szSJfx1PBOXdDG4XCWYFe2FeCDTwg04zGM7ulCDFM+d23oN3nRQ0vtqVpinIfYfPcgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506303;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=/SxQ5M9MWo73y6heqXDx3jERTgyWCvo47jAL+wR1bHY=;
 b=bgv9ZCldpUAFd4SUzmqGwhjO/mrpQ2SnIuiDLoz4y3IvwMs1AvhbGvewHdUqOLWgsgZ6
 A+pfRz9Vfi6dMGYRrZfiN32tFVM6d4rQrF/KhWnkEWbZUMsRtcBY+FpoEabZ+euCyrH24
 +pDeIcApLVA+jxk+uF1xvjVg2XjYETXSNu8oO83/ggoyKpGm7p1bkmCrXk/oYL9Ns2TEX
 GAakzlR3Md1V7iN6mmBaWBaB3X9nA2lhou3lZrTdINU/uOt9C7P3BZotv+wUBi5EAncxw
 cGf/WBBUMg/Xxfhb4XDsfucJbPxYvbbUS++0A/QMChajtSrRyidL5fUa88ldFJXHpvg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=eU2DYPf+; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=eU2DYPf+
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DBD2810C6
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505849;
 bh=/SxQ5M9MWo73y6heqXDx3jERTgyWCvo47jAL+wR1bHY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=eU2DYPf+r3evGHmBOPfNyUEBzWXA0r6EBo6LyFXet/sIBubc2dQrvx3UpeiCDaoiW
 1MoKFR2KR/eqv7Ig5OSmG3VmumlANRAZq3vyjFils8QyDlUOKEq5QAgjyuk3unQ3T9
 72PtmpX/3BtFxPa0wrISiU5AGPE0Im8HvGquSs/t4fgrppGIEumQrph6gXc3j48GGj
 WZed1BDGzTz6oVhFD6xi/lrNku+9W7z+6dFhWGmSUcix7w/Mtvh1CnFBGSwBOCzwoW
 eHzbOG/eRpX2ZNfYzOc9Wi3e+U3ScZHCL5uRbg2Kcj3oUjrPt3Qt55pCSM8VuTy4Lc
 hDiM/ngU7n2qw==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 QRbvDipBrtcwZVm4uRVEbEo691Gfeg/OuJfxBtTEXG7TgfH98Iw/0/dw7fQglATwCGVmPQ/kcrf
 US+4mjs42Y4te6K2JQs4eebWHMQbOpu5RaGban5qqGqzdS+Q1cUPfgTitmu4OdfFEBEbxFp5RTk
 ynnx+DYHqxDsU3f9wSk6ckOIxgVncQ92YWNuzOZpG+l10Fk21m1ebkUN8bVaN5ZlKSaFD7l/U+P
 fmEk/NSyNs1WUB7tbFA2y82+3JuiO+Wkb/Vo6U9gj6Rrl9bLobl1JHgeYQAIMr3jGC1VLcayLTr
 Ebjn8ggmwWNlqHv/WpwvldRpKF8B/3juM/xSiQHGhuVT50QdHODiwredJG+AZeGNSGoSHLNvDb7
 ls57CoIkYHr43iDhG1Gux3wR43BBfvDoyvHRHgEhXU9UBlSmD4fuSgV5MY9ADW3mcZFH4Q8HF9L
 /HhYxe0xi0L3I7ToTDdbLT7utmR2e+CJKdrQgjNY5u4LjFZEFGIkwoUv6V35RiCIuOg3Qci347m
 1FvFa0IylSlkPZvgR9u31wjDEMXVbXhL5O4RU4Y5g909wJPPf6K0P+GiBgqhnWR7M8sidllvAWy
 Uvtf+a0QFTSstGTKbe071I2kxu7g4HTOIUpN22tAEwW8PtBzXNnn0ja0N8SmLPD0a2tBcyXixoJ
 1hNKU8UI+myLHLs0kkIdCjoKxEN2x5wP6DWQuYmOs8mHkIqVYJ1PvZGPBx9fmPg==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3D203A4C4FA2;
 Sun, 27 Sep 2026 12:44:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLY-0000000007a-1bI8;
 Sun, 27 Sep 2026 10:43:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:41:52 +0200
Message-ID: <20260927104301.1801638-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v6 14/82] package/boost: math needs container
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

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 63c50d9835..e88f497f6a 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -257,6 +257,7 @@ comment "boost-log needs a toolchain not affected by GCC bug 64735"
 config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
+	select BR2_PACKAGE_BOOST_CONTAINER
 	select BR2_PACKAGE_BOOST_RANDOM
 	help
 	  Boost.Math includes several contributions in the domain of
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
