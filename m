Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0518DC98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3570407F4;
	Sun, 27 Sep 2026 10:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSIa51-7H1QU; Sun, 27 Sep 2026 10:44:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E7B2140816
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790505887;
	b=p4doMsLJUVD5RpobvlRyHmAdPFAusyWejBGZnztVAEuW2MmdwZ0zMoD40pK8BopbRwXq
	 8XiPmEVuAOP/zp0wyBHnF54trgWIf+mDoBFhcPIZGukPvFB9nqlkWZklY1pteAwzBKJRc
	 7zGcNuSXyF3O6GS9izsaXUSPoVxasAvxLV1pqW8NBFJrIlJjSRXPgx3jBDPH2wNTaMuVH
	 i6cgwtFL9oNZ1GLvnVm94cXx9D69O7OI8RcOdEj6MdFUN95tXrXtJMHAK5nbQO2c6YY4j
	 o/dxT8uQpJ/OVJhN/LykNl5bClMh2602rBV74fpsyfX2cYTOP56QlgTpJKORSK2R9OA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790505887;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RC1mqZlCEq/inRCzdAdqMUR61Xf3PEdSU4KYb4cIzKk=;
	b=heG5ye4OuO3D5QLauOS5ZMZEiya/8pGPk/S/oZOiIZ6+1a94wrPuqYDEVVgFGGSGtqSp
	 i6CEk2U+KVOSNL2kosPghJxWYQ5DHAsVFcP9QJDmj5GBKXtUu+BYnXNrVza+gL3uF2+YP
	 1LbOyssoxK9oi3Gvr5wmzGJDyVuTjQPgZtigGq7R20ZErYuv+KQ5ZYJchRaIQugIkyh9p
	 KuSQz25mjYVTfqqHVgTPZuUMsdqIwuqQuVxfvHqJl+55d52W80dih4FlIrP7rLj3zyLsH
	 hp/ijKlVVYIXzTbDZAeerCIbD58+GShhcJ5ZPd5o/k5JIWKpN3pyLHriCP0Ibpdwl9A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=PZg8llxo;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790505887;
	bh=RC1mqZlCEq/inRCzdAdqMUR61Xf3PEdSU4KYb4cIzKk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=G+ojDWAd1qB8c8he4MZ1fWI8bcdRcWoSHODWd6jmwqDXcPIkuX9NDPHg0abQQaSAK
	 Gyd/8l0TERY1+kOeMABUFb+y3FiCAFF+B2vwJBEkgrhZsNZZX5bmZpFVQpCJuci3DI
	 yRSNgv+yYLyDXZi/KkP47DSM7JMll997ALhoOD/nyDhBtV7LAtXm6f0TfTDWRNH2ak
	 fY7LeGasSgaiXRMmxnO/MVLQBVVM4daU14EjyWZk8+MQVt+zDjyFQHpzEnRbtqVVB5
	 hM1plCfGMYFfPORETbEMCMKDPM92S+DL2iE9pDAcsd/KaUxLiSX9Y9+23RjICBA783
	 VfhE08mxKkYuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7B2140816;
	Sun, 27 Sep 2026 10:44:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C49D1334
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B650B40824
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AtBrpIsPxJ9C for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:44:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ECBC040816
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790505884;
 b=NaNJZOSHFowsDoJGJPQb6SBl1JscG2D08TIBoUJCHy1udNaPbiAkcY+vq5eVCfKK/ibS
 3V+Mvky7LYY9osVjW+mRuf1v89PkuAUOZ0d5x3ASQJhAblWMQQbuyabSY4JE2KC604eUQ
 B0rO9udG2yMlR64DU6LZLRqUu/aKp2Ho1Z49Rr7PIOGAQqp/pDf3G3Fgb1NYKnzlFIw+Q
 thVemqb/N3vQBsGwn6REva7OOg5cSFRXAg481lKdZzuN3HnHbbcw2kjFtTPG4+NnA0XVc
 GlNjh2/ORGK7bAYqwJzHOqz0VaLOun0T75aloScyG1gK1VLAUhXyX9HsvF6enuPp4Bg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790505884;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=7zd0cpasMipnAz9SM5mQcf1zmsPH7JP1LjAOMbFx7ms=;
 b=gYGxTyOzptOGPgPPZ4s17gaa5nD+QQrfclzWhbximNa1tAwE4B1z+m9GPdvguX64qP49
 kE9MFNbJQGupGioolJAbuePGl0hS/uu/JBn9GZDVnW+8Y8MduDSdGotdUUtXmyN8Yc6+6
 AgboAvfceke8zVCGb1tj49m4j3DoyNJF4Q8JzyugenX8uFrgBXuIVM3hyXzTYG46nkrvC
 XgpIDPX4utHwrBLoNG0uoQevxA/jgSK2uFHZqFKnO5x5WidSaqxJXMwnVus94yGS8gyxT
 SYrRmG2YVdjM7/r442+W+/IKssTNYqVhlC/YrhV/PnuxQY5cuk55Py4KTnhiYjhUGXA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PZg8llxo; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=PZg8llxo
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECBC040816
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505785;
 bh=7zd0cpasMipnAz9SM5mQcf1zmsPH7JP1LjAOMbFx7ms=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PZg8llxolyod+EibTm4C3lPBBfTCtLajzh8jQRZn0491s598LwMvBeyjWvYE2PXac
 pFCDx9GPjSWIPeNn0OZa9xJpg4D4Kzaz5Q3632LdbalXXMO81n1fKLPCppX41JmebB
 Cuy+ggw3YtjV+fW1CJNIlcpUZrD323pTlOxiKsSl+txuYmgUNuuI9fVpMM2dK70sD7
 BAYvnhzGCu8VNj+iJABCXTorkyU23hFHve+mI+c6pKKn+hyadszFia95twsH6cKmXT
 8blJPrcN8K2HdD0BrcGNOWEjvw4HvT4KDpMicF/6n0g99KLauaMMSWZXuLmlnPrgI2
 vPWLbOqkXEoHQ==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 vI3g6Hq607MYFKradJ2ocie8S1TnytjW0BvulAJZtWI7lTBmuPSlUOD/UfmzIyv9A5We0sOQLWH
 RIIsEx/UFtN0kXO8f4p3owcYk7EpQRy+C/j/zfx1m6OQpZ00KBrSwHhYoTk5OPKTzn907qyaUx0
 6IMOGrAxcSbiPfuhot4d8M9qWDUBneGBDVc6hBOGDCBm43J4VJXLDm/q8gf4pre6XXqrgRfpAYY
 mLd2BTHqZir8mwTMaO4aPfvas1kjoYhcwSPATf69fCEpQ1US3qmWh+XHPFFuHOdoCP7+4wxoHQz
 XUlV2S3pbpM+sh6Kg2dIN9QVyS2OBtNLjxrdOF8f1erX10pzHumPOsvaBeFnrWjmxB9fpdEKLOt
 XUHV4hId7qTd5OqiO7DIx0MJzUkwo6URDfd7/m9qNU+UiwYU3n2UNt93sWOEQ/vk85VYL1sbvHS
 /wzUVgNMBodp0As8vofZJrcAuQlnfvmcSL8mcgLcaO6Q9l/V+X5b9z+a7F9dqHcKu1wnmSc/nQ9
 mjM5RjrpQ0DrdaYejm/5q34iRi851Ydx2ckhNpOefWYaIi73Zql2UxF3pYyuFbU0olcJxhVqweV
 KSH1ye9/kByteDYqty8qzxfqMI68kACrWSUoNQK28/HCZ20InPuU9tZq+UEKT0cm6Lk4cS3lQ5U
 yRli1SJ7LdA==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 516F1A4C4F73;
 Sun, 27 Sep 2026 12:43:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLX-0000000007a-3HB9;
 Sun, 27 Sep 2026 10:43:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:41:45 +0200
Message-ID: <20260927104301.1801638-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v6 07/82] package/boost: add switch for
 boost-process
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

since boost 1.86 this is a buildable module.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 22 ++++++++++++++++++++++
 package/boost/boost.mk  |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 45b98ec0a2..736255a33c 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -287,6 +287,28 @@ config BR2_PACKAGE_BOOST_NOWIDE
 	help
 	  Library for cross-platform, unicode aware programming.
 
+config BR2_PACKAGE_BOOST_PROCESS
+	bool "boost-process"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-context
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	select BR2_PACKAGE_BOOST_CONTAINER
+	select BR2_PACKAGE_BOOST_CONTEXT
+    select BR2_PACKAGE_BOOST_DATE_TIME
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	help
+	  Library to create processes in a portable way.
+
+comment "boost-process needs a toolchain w/ C++11, gcc>=4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+comment "boost-process needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-context
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
 config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	bool "boost-program_options"
 	help
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 87a576f277..37ec918aef 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -60,6 +60,7 @@ HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	math \
 	mpi \
 	nowide \
+	process \
 	program_options \
 	python \
 	random \
@@ -142,6 +143,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOG),,log)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_NOWIDE),,nowide)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROCESS),,process)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PYTHON),,python)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_RANDOM),,random)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
