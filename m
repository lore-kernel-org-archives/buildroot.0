Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5F7C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AC1360E34;
	Fri, 18 Sep 2026 18:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdNwAm1T51gm; Fri, 18 Sep 2026 18:49:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 84E0F60E14
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757357;
	b=M1cMqYjN2cV+strVIburO+0Xb0sD9cBN7tkn09GVvtkU87vik4tN4m1lrCqXDiNq/Ddi
	 jzkhXBXLY1x38j1aohczOZac32MnuiCorr/3mZCDLJz7L+f1Ag9sPJej7TeVHW/5X0dL6
	 TjhSksn5dZQ3l3vNNEeCOsoyOm8sdU0cfq7HzNN90qvFcLRD96EpdeipVou3cZcGigTn3
	 BuDZfcoGnuQros6SRB9rsjReGc7ZFfV7fOy7c0xuXAbAPe5d7jffAc6x+6lhhV5mI0B+D
	 v260fHeKhBOcLXvvgXoh3mkgCbdvbiOP4uM2kSetVdiVwhEjGs6v0/SlBTnRXa4GTSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757357;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7HJQcqabToS50lIpqdaHWmxm3w2SRGOYz/TVG5/Tzus=;
	b=T6ek9dpiO7g55o4zEExzuBaeo+G+ZvAgt5XXgaVyPJhQ+PhgJzc747XEIAjLanqg+zoV
	 TDzbhEZo32v0rMSLuGXiEnzYMMuhagn5/1eH58UD3cfUIQbgGTqaZppbRiENCfW3X/BTv
	 tfPtXQxv3tFfUI+oSX9kPG1PinfxZ6SpxMN4IgxIanpp6tP0HR1nNcVtQEjvg1+cgBXbq
	 Bib2/G37UHllpV/ESGEQN7nV9gnubFgqmVv2tjT9NP7LkZZxBhuuK1GGLlKynkLvQ0Ybn
	 Aw6UoETPJ9TTNWvA1Q/BPFAx0iCiTjlpfRRJ8ttdqUiBP7vu9FRuD/xE5jJzp+HFPMA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757357;
	bh=7HJQcqabToS50lIpqdaHWmxm3w2SRGOYz/TVG5/Tzus=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=N5bJ+YdcMe6keuiXUKAIdNgNUAPM1DH9zFguRQDJXJohRy7F0wcqjT4wABzFr9x92
	 +OcDeNc2wcjtcJBJI6orZAAVTnMnccto1vqV/2CXdJNd+cMPegx7pKCXWNphwXbBfC
	 5XS8NJlZ75sKdGX0Uehrh1yuUjhSM7W8QXp34vwwugTuwE1Rpcj+N7KHSKHsNCXthN
	 IRthTAGBj6LZIYagxOrj+mClciXvLbiRYis6HYHmVBEEQanSxefEqlMN3QqSHLLqwB
	 yJcJyfkghN3q6Uwvj4Osq89bsTyQaNshslIr/MymQT/ZiOtgpJJKJxEME3jEwCRxUU
	 tzeUS1wJIODNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84E0F60E14;
	Fri, 18 Sep 2026 18:49:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E05053B9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C62BE812FE
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7r2zUX4Ve2Zu for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:49:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E9071812FC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757355;
 b=NEAMWYEO6bLx2i6MAr/XIE3PmBBGa0ULNQy0kstT0sdVQiEG9v4NGYKtRY4u77LdltIq
 wPWMvF5DFwzuec5Yse/eGa9rUh8EBHGVXY9vwD5reGbTIx4HQI6V2QaPlFAqSJELj51Nn
 bsRxMvQrazSpLbx4/yoILALa5L/ZGq2Icz4Vs0PbgJfbnVFLqLg36hCtYLwW+vYutTxvo
 yMr7s180ccEwm5rEwYwLfFoqX/hSyQS/Nn3WYj7GfB809MlAcFaSZNR83y5ERZXgvsLlk
 IeqnPpKpCLlI1ITubuDmQDHqxxtZPTPNmPgrDiBzyVeQY5j9UhNvVB6SVQSzhGHdOJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757355;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UTTrzdFT64qWE94loi2rLwOT8Cr/BOq6ifW37i0ttzk=;
 b=SM+85lC39gYCkuoQJ6Q38CwzUqnELrH3u631ZGLC0gjPbBoa4qx7MJ/s6097SB6bTqUr
 2XKe4oivLq4XfCkAY+rUrMx82X2yGInAY+GEW+pAXGNM1yJkIN4cbeiLJW7WfRHFoXguh
 D9XgwSYvngcr3QRcpBL76w7f05H/tttxHIzyB2ub6etscPzn1KyHlhMXEUlMobMcogW6z
 KcyZjF6jHeFdqxiikZ196wFD/6GvumeblVbH9+C8bAIFsHbhmMU2XWqLOH4xrmCU9ph1l
 6sVbYhMD961PtydWi+b7BtOI0+dKKAFxbM5pdepnF2MmlB1lSYnCA/YA/+cW9JbKfRQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=nHTrVM1j; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=nHTrVM1j
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9071812FC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756932;
 bh=UTTrzdFT64qWE94loi2rLwOT8Cr/BOq6ifW37i0ttzk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=nHTrVM1jV/b1Ql+8ece15xqc8McQAh+ww1YGJmvQ1/aEj+3ifZsPcUAgtxeYERmaK
 b5OD8RPOT4ZurfmA6eu1vNonPQ8m7Q/4zX86Xzn6En6wgzRUOCXLNdG0jSApNk0ROx
 FAvYHcgHh++fSJa8Lm/3nYjIogf3Nvt3emI00cw7GDweassaqsKkIZNTZU2yJfc/en
 IlVcNMptnachsCqoaCnvAweDMySLxxBlLxDYjr8tBvDhWTmMaErreVIdFZXZYYUcMm
 gZ5cQ2G6UNcKLmWZcRzreOAWSg6i4EZZLJgJ9urEqT07QWnJz8IblR7Mgat6OrWk0Y
 U5PvdjdQ4585g==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:pIHP2IsFBVJBSU2u/nRqLp08qdvngvQ5c50tl70qC7IZbX+0KzCm8EyGlAQyiW+wE8816pUI+7fLKDuDMCgS8UVPKE4COzPLTX5ViuQd5AFcnA1WpKxAvzoiQCId0EudhnJyczSLH5a7yP/f3Zz/DSLM6x/GpoT+PMmd7Dm2KL3nG00epb7A71VZ4wbHkXeZihItlabR3u5mQ3MtIFnFI9hvoLWNsanOopLVLsiThADJLL3A/7uiMidqoA+aTdllohUkBMgKkferYcXGljWndrOQonS7KztU4gP7r3fWX9veWXJcmuTFuM3Jiod9rdC1jmspek5MwXCIy4N4WK9fjELigpkqn+jaolt1MowkuoxNvTJxJGatzcBQ1byrftXl+1MWVw67fdgaevnCk2AxmOl8tpqOCAFu3iUQtsQDt2aE2d1ZBlxjNZxxojw6YWbQbQP9Ze/az6CQeWZDsjymLNLFNXJxW95EoaoEczU8TBkN9shSHVCzn8br1D+ewTqVXS2HaoYlYPsWro9qmpqtc6rIlXx9G0EiGcN5yq8sHiZAEGhSBQuuEHvA/odwHwoii6kovz+51ZXCMgvjxTbVs4OnFHE2KzlyF71S2zhkylGY84
 ZYfcstLbKSDLeG+RCPTkASYdix9SjaLaoIwsDlDEe0mIK1UOCt7gXsc9YeNRNLNpdWP3wqBK4A
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0D46CA4C4722;
 Fri, 18 Sep 2026 20:42:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWt-000000007cB-04AS;
 Fri, 18 Sep 2026 18:41:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:47 +0200
Message-ID: <20260918184140.3631274-26-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 25/77] package/poco: bump version to 1.15.3
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

https://github.com/pocoproject/poco/blob/poco-1.15.3-release/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/poco/poco.hash | 2 +-
 package/poco/poco.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 6979a9a1e4..4c132f9742 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  47394ea7ddb7b0a40e1a5be896f8f5dc77cfdc4f561d2e7131ecf582df5a0c3a  poco-1.14.2.tar.gz
+sha256  4f112fea59e0c65f0fffe30a4957f8d66cf41528c21dd9903e6d7550022c794e  poco-1.15.3.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 63279d530e..7e2a9014bd 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = 1.14.2
+POCO_VERSION = 1.15.3
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
