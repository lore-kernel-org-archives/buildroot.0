Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B56AC9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02FD640A3C;
	Sun, 27 Sep 2026 10:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZH0UKXvcMXov; Sun, 27 Sep 2026 10:51:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2858240A3E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506269;
	b=P3LTow8bfo/nTb/DmcDnZ2hAnoAEOCkovq2JIzzQXMZ+PZkDThhO5yK+YXWDqf8Rj/zy
	 hajm4GFWM8rNnErvg0o9vChnWghp3ScVHN3Y+A2b2nI8LuiQm60VZROO39r54IHmMI3vc
	 wBRCWB/rWRP6GQCOQqgVJ69BuR0A2adVNMty91ejB86Xhtpa+QpUA8ed+YcFCU8ofR8wi
	 CcEbDyopC96/lX9PTt1rMZk1n5NVYgQdewEYxgyNA0NdD/JAVTkpBWfFou79N21vMxMeo
	 vCZMfqf7rhNQhXn4P6++/rNQb6FCgomzzmxJ2zcdDmmGibaaOy4LcW45E8HYLHi/sYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506269;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nz5XpQdSlW74We8AQuXzE+eV6Rrr9ZIogFf/zIKi8i8=;
	b=QQxdxfDkWzpXQf9DP0Yic2E63QCnL6gbcyenzH5hR9OmylWi/LWGaq3YWo6ObhKKXUVJ
	 25sAl45TvDtfPSSk4CaPQf8+AINSVXWro6j2QUbjkOp7dRaPJZavj+WIhTVA+oJNISUEc
	 1o3wP5OfSFVryMhJepNGLDWoinFPpeZfw66379u6Y5koOc0CGGZRqbTnw2Z+MmvI/lAhj
	 QAZH07xJGcB5ze9VNJhrv6n/KazCdzYSBdm1w70FCo5/Y3N33uXXF1t2FNuVM/RTDiNq+
	 dmoIG95cfPvF23bHQFQCYY+bul/5nOID4i+n1vb+3sFSSIvj9rvY3pQMNgBgPHnFplg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506269;
	bh=nz5XpQdSlW74We8AQuXzE+eV6Rrr9ZIogFf/zIKi8i8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iJ/2nl/0L62W6HyRHWxZAeKUl2smYc4eDR+4J23r1Ah2IjAttZ0tc6t7xgkcPAwzw
	 tVNu12bCu4wiB9/Kg+tzfLz/1wusfpsWr/XfHdt4pr2Aa6eOe4t+w1IKqDa/e91dRm
	 pAX0UZ7X4H85gO0MeflaSds3qAM6NMRhQjULnl+uSktf+bPjeOMm8txHPYTcmH2DnT
	 PGQvPjUc3Nh+2RrPFBoccv6a98dKxbznyYkl8xpvgedA9j/YP1Lm0TqlX+15yE9Czv
	 4lOI/KRgoBzZ9W+HCkNKyVAcx/faNyhWblOJdtEPvmtnEUgfWE/17kyjLjB4J7pyPf
	 nYa0Rt9xv04PA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2858240A3E;
	Sun, 27 Sep 2026 10:51:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 888A1335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8611F40068
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SW7ESvtbhWEB for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:51:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C859940059
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506267;
 b=krAiIPow+2rLeKLR2QydxgdpOhNSzJYXB1VwGKniCeJfgrCU2HXb8D0+xGNtJi2R4owN
 9NbEPlCcW+jxm+OsCFiIkTALPkzNin6suW5Zt93p5bdUISdew9UcxtLGwELtJAU+X9PnE
 W0V6aP0TBSYNzAZHaJuB8G48AgLysRYN5JGLT57MsXyj6sEDo56Kw6/BZIcBgV64XEp1W
 /kWNwUpTkc/hgvPnVz+EB0NFT7T5GzzvztMrJuvI3dtQkf2X/LRbQU4tyQeOLViOR5aPg
 qxr2p0ld8fht8YmMbFkX6Jv5YCqDQEmYWf/31VHoDGyF7AoUS959Y/tO4VKRm8jmI8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506267;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=7NPk/uUkBmssHUlWNUxp966O2lxAH9z27jY7Z+uq8bI=;
 b=ZdPbro9KxC9OewHOxYB8gjZvv6MVB6JXMA1f7k1Arj/m8xuN7nSMoYl3ck01K25n2EkU
 2g/wd0CFyf7XDcT2MLzEenX9lzKZ7Qt+xooDB9EwRmMfYz0EfgV8x32/roMoETddSwyMk
 hLwpfAqhGyNmBG/sXnR1JcrzGtw/WNJInR9jjd8ty581c6VyRER0ehhGStSiUY2m+yrPY
 Yo29TsIZQLy/wrtzZzRDgihxALFDLNICf6TQEVI0VSVJblmqXiYgZMU1k+nDq0vmztwhg
 HE+Oq8MdvkcKrLxrHqdTOrYLJl6DoUyveDWmlXt7+GKqGEZ2sGdDghnw61zEJlqFy/g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bm+bSqWm; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=bm+bSqWm
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C859940059
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505847;
 bh=7NPk/uUkBmssHUlWNUxp966O2lxAH9z27jY7Z+uq8bI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bm+bSqWmfDtzh9Ch8/f0KGfWcWGqXRN7wOW6APzVPeEy7IC9i3uqkpu3gYQl/lvwz
 jhXa13vD+nlNLv1HiTc7IyDakG6P7Ly9WCWG6XdZ+qWBsxoixjg19phXcNo0U95123
 RwPPgxYqp5aNBxNfFgShtFoArfEK8ttD9ifH3ntThicvO5n0fQVMb1+RIMM8GZtK2G
 DWR4j0htznLOfyUUoghUuh5p0c2HUoYDY7rtj1hsV0PmT/K5xjjZwleM3MkkaLyz1w
 qnMx4kbCQ6WXaIlvtuatHPsSdw/f1ijlaLqSvzT9F++i1/y68YEZQdvuVzf+ME9ikh
 UEVwuhSuH3WPw==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 PZ/9yPepucIiRekPWhrS3tv9hk1zjEJv+1FkKNtSV4WTZgKB9TYLh2BC36WFZvmDiBAlYUUGmMx
 EpZvp1EX1VyfUTzjwlIFmDwkEH1yMoqSj1pnzJvCxh1UAh919ut5Iy7V4/q49SRsHbKKpoyPgW/
 A4s8vZRzyBSA7MeiorovAoXOUiRqiYez6ilhUEKlU6Y+luTENKyWwDPTHMqkCUF5B2D2+MsDhPn
 6mmUY/aep2TpgCGKs0eWUYlHaZHl5Q31JvDHtNsqGIbHidoizu0s4fyuJ/A3gLP26TkIKWH873M
 cwqz2bNnN6knODGfRnWL3+SENAEW4u+8SUXLFnr0XXsSV7IgM7sU4IxThQS80iwAGNwYw1cPDF5
 RA1XUTsc6RJRWDzDjGYs4X835FPkzzVKn7SAemqfslDYo+REsrA8mCff9evvKnHdB5+Ze80IYY2
 VNAvZAZHK30p6ij1TkggV6WaZZs5+6pvNu8i1RvsXuzOM0HVrXcAeJSRZK6rsqj/eCws6evaGOq
 hbLmW6ZPyidXykIUc2KJgMYb69Vi+2rV1IF75g/23z+5LudECZlMlPaXXrdFz1XtbMC9AjnAWKc
 MbRhW4P1pUEgCPRd0wd2DZkiUNu679LB4crRuet1A7tIfHYuJ2XLmulmN4vmp2n/PyqQ/GpGK9V
 jaqyyvlN+DquPC/34mLo=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2FC75A4C4F9F;
 Sun, 27 Sep 2026 12:44:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLY-0000000007a-0Z9m;
 Sun, 27 Sep 2026 10:43:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:41:49 +0200
Message-ID: <20260927104301.1801638-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v6 11/82] package/boost: fix coroutine
 dependencies
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
 package/boost/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 929a9c3869..f22f263538 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -102,21 +102,21 @@ comment "boost-contract needs a toolchain w/ NPTL"
 config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-context
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context, boost-thread
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
 	select BR2_PACKAGE_BOOST_CONTEXT
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	help
 	  deprecated coroutine library, the non-deprecated coroutine2
 	  library is a header-only library and does not need to be
 	  selected.
 
 comment "boost-coroutine needs a toolchain w/ C++11, gcc>=4.8"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "boost-coroutine needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_DATE_TIME
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
