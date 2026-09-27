Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF28C9832F
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A81D64057E;
	Sun, 27 Sep 2026 10:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPGPgsZkuGxT; Sun, 27 Sep 2026 10:52:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E4FBB4055B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506344;
	b=cpK1Kcs0tcGqNfaWA2QL6s7/MJC3ZN9WZRT3jFE07uyrQHTbh+0k0o5YVGclfjgBHtHR
	 AQ7cRDqs9xmvR9il8VAHd7qFw9BebF3at4ysMVJzsYd9/Vpaedxq2QE6RPfN6JmLPeBR8
	 WbWhgSY1D1X87KRlzypDqkawKp8PPKNsL6T1uZ+bLDt2tXy65NacnjJ0joa8i6VDiPN+G
	 HQG3W2ByRh2hoSBEBMSTXvX0YJwXELc1AYhHWoJ2n0QynE+ubGgIDaOWI6RM2OEuLx9Ut
	 61SlUrbkxmt9/nK8KfDU8RWj00FFM0bFvEKTds3AnJk4G9Yjw/RclxEGNz9eTqkt+Cg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506344;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AU1jxV3hgYziUGu7S59RIEC5z5f5aPcXGbSuxphZ2+s=;
	b=sKyA26uKkT2JQkGt85pqU4kuoQpf00vsAEig+SRASGllag65Cj4uc8ZHkmU1vmFNQzCd
	 XjBRyOi6VGFXv7Ies3OxxPLG8otwpOhvwSfO5Da4oxkAQeOXs6KaFCiR7t7RqCL0pYsOj
	 4mDQ0vsYVf/FpnkJd0o8r5BcWb7zEAL0eB8mDNBityYu9nalyQB3SfFlJQBI7HlLEYElI
	 vm+l02cqG+ohQDTvLKRUrXE2NTK3GIkToxtvsJIGqv+R6q5ZzWjFB0mAtY3QKlNe3Td3p
	 BJscAFxdslVQNs6xzdCpvCaUO09XlifnuaEiOoUsEjCDsro/27WeuthpuEjN7h9qW7Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506344;
	bh=AU1jxV3hgYziUGu7S59RIEC5z5f5aPcXGbSuxphZ2+s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nvs1g9DSB6kl/khU4gSSoYIAbzWp/iEPugOtZTQtUVptMMoV0htIZKrNyHvUW65Dv
	 62cqufLJnWxE48+yg44bAuRhVrAondnNu8F9bhLEsCaGRWqZHSkCYKnOGi/1xHgmUi
	 /0qe2SHjJ6/iOA44GW8DA2SZIbsbutvwcotiUJwTIK0Hn6lm9OmYEBVMPCBTZTfcuF
	 Vi3C/riw56nhL8F6wijVMfunZtacews90PbA8uNio3Bnci6maJeeoFN/O9DP4RFlji
	 490fxrpI/G70/4z2qxy5c0/16v+MUUGZsOPSkcKiWDvlBGP3RlXRKqd8FtEKc1DGVH
	 3YhD2HUwsfXjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4FBB4055B;
	Sun, 27 Sep 2026 10:52:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 937E0D1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7941D80BB2
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uzXUmyyFtfIT for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:52:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CEC0F80A86
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506342;
 b=RriRt6uvW5xBe9z2tn1FKrn7FhdRrKYXGsyGFq4D8vO4RG9rZ1AkUkJ++yZWUAoPydx/
 31GN5ZVXOico6iHs4U1Hw8bOTQZIL2Df8M/k5nmYUB7oEZVnvEAeRwaR62EiN3e2+/Kl2
 Rq+eI0QPD/61CEEqxKsn6piWtqOYofbXBy8up1k+9LcuxiZdv8YRctayqGMVZ2HDLDDxa
 7wyVu1w9Q7MtobO5GR92IajDltO6ftq7S/o1foE5R/OhppTcUqHin3YjUncqVdiz/r8UU
 KMSl8TZbhroh/fpF7k22iJ4KOXwvaPwQwkRQwV8HqUPQVcHYNIno8OO+VS3GvLCkLcQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506342;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=TXoVoxlT9AQXUtTXbTZvaHO3o/PC+mzLCHqyvKLTSZ0=;
 b=bdgGnMB/o9anHfJIHy9KerrUhjHhqfn5MKZhiKO9ToBQSSpeBqridQ/7XrR/EygOjf5X
 zO15rnQ67yAX4gsGNNi6IgX84tkcNTDnu+duk2Z2ABIC4p0kkZXwwGlcbgKlKutlwoxNS
 Kk3C8OHuRTJ40n0SROeNj2WRjIF+VaeqngqXbMer0O1Ruv+LwsCX8nUBvxrQn5x6DQ/2H
 GMrl8YPhSWut9W3sfbSrrcF7WSwVmVSCAG6tqGFVoO/qqffTTUgsI5xEr0FyZy0RXlwo5
 SDRGR5K8SXXnRjswtuaCHE7kq7qp02QH3NNY7fRjwtJHGgwOv9Ca+WuVxs871VV7fYw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=MmjZ646n; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=MmjZ646n
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEC0F80A86
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505850;
 bh=TXoVoxlT9AQXUtTXbTZvaHO3o/PC+mzLCHqyvKLTSZ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=MmjZ646nfuqp61+ic8kVC/n6UHcf68E9nhcj9k6xlm1g1xvGk2K+Q29+X+edLRFgL
 anFi5DR94TqBVlaInp7iSq4995vLgtsTWp4g2nWHoSKWaN0GsjKvCwDSRsraBk9tYI
 mfvCEjf8xYjLBiUroQBJnkd0EwynhVUNF9rZ7DqPnBvIHiojbVJxMmBe5mZMEiI4Cq
 F3Nt2yQsNUADpcuYAoCXUAwnWU8Z6GrZUSLSxVH0Z0Xu2aSAwDNIajITyiXwaD7wuV
 aRSWvFpmgFoIbn+7ikzR3RTgg0pfIethTD24FWZMMz3Xcdih7qr92lA4CnkdZY3Hsh
 GrMH5Y7Rq56lg==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 l1biiU89Bakf0ER+MjbtQG5Pm79YTKKrfmTUtMLgTUN3m7atfXucsUmBS5JrAcjFsAjfQ/pfDd1
 8xtm8fAC00+XfOAcG81QfqVAuAG+3+Ve2VU0xuZukO6IsXClUojo5jO6ilnefHPxhZL49KUBaZd
 fJyVUx/WC/6N+rnnX22uWoH0fkojXN9A2ivb1yNLBM5Skw43qeQa8IHkiNGqhxgpbj6PKhMr+sG
 /3UBygdWdx51dWS6R15DPcwTD3kI1nee4WJbRCtXdkAMVLqUu6NF9DjEIcVzhm34tS6EKHsHVbK
 Z+GVl/jiWIUIXKRC1jWvI75uNkgWhke6zsN5JN4OXpyS89mRlqXodbu0HiTQ2tfhUk3zQQQoU8b
 qqMkY2yOMa1K6j+PxVni/8hikkEYPaBDWgdeXI2lOozorPvBbMsmC3in0da9IWmg2Iox2cBrjda
 q+6wTeXPGFkqgm4kGZDaXP1PDbXLnx58BnIRaje7VP0XaQJQ85j4rMNZN59/KhihyZuVvUB6DA/
 BxIbQ57XV3SBdfeegMPkyjjo/muV2eLi9D8tAX7NqBssSZpKT2rypK4FCMwPMqlrLFVw7UT7eV2
 ZTcUfB0S1b/XP87OACH8v13gALUEsLOKh0UyDGNludjiCdxGtKu7JLJh7kDoK/VbwuR2gWQY1xT
 05KfRnpMYiIwICqSjZ78=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 67B56A4C4FA4;
 Sun, 27 Sep 2026 12:44:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLY-0000000007a-2Yzm;
 Sun, 27 Sep 2026 10:43:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:41:55 +0200
Message-ID: <20260927104301.1801638-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v6 17/82] package/boost: wave needs thread
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
index 0f52bbd475..d4626bf79a 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -432,6 +432,7 @@ config BR2_PACKAGE_BOOST_WAVE
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-thread
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SERIALIZATION
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  The Boost.Wave library is a Standards conformant, and highly
 	  configurable implementation of the mandated C99/C++
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
