Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F25C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 053C440D88;
	Sun, 20 Sep 2026 14:11:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zEJCmKXj5qi; Sun, 20 Sep 2026 14:11:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1D77540D8E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913482;
	b=LJUF8N2zZjEb3vhSVnOyj+c2QCMC6/lliyXCHpYSTVfAp3HCorPslWmwDQf+lBA2p8Mm
	 HiRdQH/CaUCsGNokFg+IgvIoOva2hU/M4yilNNtaNsmvwzguJVmjC4rRGQaLVIH9ACGjn
	 0y9rxhs04r2WpoNMw87wZ96KkVLV90x7tQwYioqjkZLF2eviyZVMB5fpHiZuJW1vKpEHZ
	 VwZS0mQvVQDLU83IUzu5jirpCSPQOyIDXtQ10Nml0antBEGBGUv5gbyms7xlIOEoNwx5Y
	 z+hc4fn0sA77eV2aZeBVqtgsTB8Q15OfrAIyGDjZagXXEdKUYPKoP9AM3/QNE09w/Dg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913482;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7HJQcqabToS50lIpqdaHWmxm3w2SRGOYz/TVG5/Tzus=;
	b=UcqmNRcZO1BNxk+Pd5ET2+QlotRjrtChqzlieTYPTsyX/Q9QzMMS1MWHuRGn9rf6k1NJ
	 ZZSBcbTFK3lI5SeebUGUvPBKSxw8UIqeMzCqDP/K5JQN+p2Tr5aSZOvPyaJTmW+huzzeI
	 CjKnDG2hq8G9HWF3Gzya87Bbav+GF2hnwZgP0natU8eQ2WyLHHwvg4+QhVw4SIj2QDDyk
	 k3AU7HSiMQSG6MaQ9499oGBJdRildVv3WPZJvDBhEUcOTzT5wXagtPeU9O4VYlcA0aary
	 yWDO9Aelvok1ee1r8NBr0J3WiYGo0TFKVrFKbEHk0RMxRWeTTLuUW1ca6EY7Ls4G5sw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=LB9qA1oI;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913482;
	bh=7HJQcqabToS50lIpqdaHWmxm3w2SRGOYz/TVG5/Tzus=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZryXF2DTmQK0dsocmdaWBovP8FYccGdjbsGdSrQfE0THpHBYhK4+D7zisrwl/8aGF
	 /tqhLr3r+oOanyL4CwPfQ7qHG1n5JvgpMiLu0FSUbWwdmgG7LI185SAh52WBOqBwVW
	 RHrcdGVb/7yM0U18Pu2zxIUbawm4j/Sxk6yL1eaGnltG0oY4H4H8aJ6Pr5Ses3E+ND
	 DHRx2xyIFrWKkZD86w3sL2OKI3yBdICcZKNVrziWa9wf+8IEWzrSCqToXFnJgZFW0e
	 ArU2eIGhAScVCwHjjHZ9I5zXKR95O02C8WcZtDIC5H0DX67mQ0R6c8TCybyomff0VO
	 MosjreGOdQchA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D77540D8E;
	Sun, 20 Sep 2026 14:11:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17605392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F175A40D8E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:11:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5uwOQKhi2GYv for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:11:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0FCDC40D88
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913479;
 b=GtUSCy74gTG20Uep/3o0ymLdsKDbptlFQ9UA63qdV68Kv2inRFZlazoZSprjmTYOPucb
 LpiFskzBUYWqXxo9UVS4nd6WGY0bKemxyLXog8o8GPgzzyKteyrg5UtNme+Q2bb7F62fA
 KMC/yuVXOnXkrN5u79hg5F7J7dk+oOAcpNKCDxwR61W5XbKOymP7BbaHD0OiYpwDOdPQ0
 SgFrJzUdXgU5nswGwWvsXTqSN8YtaI2cb+fNxmzrAWOcQPOp2gLTel088WjOypsjgaThg
 +ozEYel3iXdN4P7sjxVfXhQWt3GuNDpHkjvmG03jSeoTXDBHjAl0JX1oeAuu9Z/u2WQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913479;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UTTrzdFT64qWE94loi2rLwOT8Cr/BOq6ifW37i0ttzk=;
 b=ovYqvRBDQA2bp+/cH/juv+VN8uzFNdNjVvtFLOFQ9Z3seWjQeIAshJwiPP77G8aJ+X1y
 GTO2So4Bf72JLuU7T2f4sBmLlME7PCnd4OS7x8KoH90MBpwOQwwyl1wbzvKN2Ab/dWt35
 SEEN6MVLJXSLbDPszpTvRuPiL1HQuGNdDBqdcOp8KsztjdFAbRnkRppiamEIBC0vw7IW/
 c4EiU+vnW4jljETYo7hJN3yfHPyrXV7XZzY37oRWWlPhqfpH5c+x/q+Vd6/2McPp52CTC
 HD26WfESV9Dx1VBM2d+ylA6UCIDrQii6Uviu3TpkZVSo/NcB2iWHsiTWkIVKoyJDm0w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=LB9qA1oI; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=LB9qA1oI
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FCDC40D88
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913230;
 bh=UTTrzdFT64qWE94loi2rLwOT8Cr/BOq6ifW37i0ttzk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LB9qA1oI/1oW9vrj3RGsvmcGOyU0NIuCVTBK5+xG3P/5ufUhq9aAuxilm40zkw2A9
 YWxBTT2nnoalJe1Q2kOqVuYbQZYv1MkorNyyiHxxCfURdj5F84/hpwws+fu9PQnEUZ
 Xi5oXKqIETnRUaRczwqCwwy2nMre6xjxZRh7g/6XlQXYH0q3ZvErGwd8X+2EyD3jCA
 OPWDd87zmUXh59C1MnRUuV375K+0vzaCCuMOeu6P9kRlj69df34e4+2MlqnFjDRmi8
 LXwSXZTsrRxlYwKxdiTMfawZV3kQ8YOiDXirdIZ0B0vCrv0q+vc3gExeCI039czZX7
 dr2a3d9+qyhdQ==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:nD57cjP9lhBioS/OiDVxfbyBNd4PbOAXrVyvw2pEMQD5+vnHAA3AGP5kaowQQDft+9j3tk9qcz2petiFwhx+8gaDQwNel6iGbwxgEn2la0hVLG8oi9Sz+0XzuFhYzrAOqn7HrpblEqy6zllejZwHZrSPi6vKaVXQaImZZVVE4vn8aZFX25wq9kGqXxLRlS4jrSDKNwlnoupJqkF/3OfbqikhrmqA9cyz1oh7qcNdcO/QOwZA68Yw/ojiYSq/ifaHcgjRX3/9kA6KFk6salnNP0ljIQNN1C7U0tt+CHfJ/UFwBolOpgmgIL4WifFOCIZdzQrJxr6EghZx2YFr92AYWkPtmkPnLkmmDjheUM7Lkc32lCF1ReSPEgElGCv13lwoS9kFEsmngKf5TXZATcWT7jgTVWekuVkf6/b9lV1h4pLbxCZG8v7rPxSeH0Mh0cYjzlC0yJxnI4whMaSUMYy7Jb1udPA6dFxL2Zcpwk9VIuGHVPrasgsQmhbqpSj8nXWFJigjKA14wJI46oSVtOjKAoXyD0dEWoRvBEH86Oq5rCp1Gj62RgdKQinH52aQia+DFaOmqcTCFqiXSLTH2eiVzlVCtNkUSeh+zZff+QSI50/2Sm
 wqZGTAbyyqmHpJ4Ql+Hp1oqMBMev6MVzE870Pk2oGTZ68ZbBeL/rrlTldozSECPbRK7+3FeA00
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0DA05A4C4865;
 Sun, 20 Sep 2026 16:07:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBG-000000002J9-0mno;
 Sun, 20 Sep 2026 14:06:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:12 +0200
Message-ID: <20260920140605.3005461-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 14/66] package/poco: bump version to 1.15.3
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
