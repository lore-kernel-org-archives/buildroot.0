Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45014C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 005EF6066E;
	Sat, 19 Sep 2026 16:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugrxFxq_o1pk; Sat, 19 Sep 2026 16:07:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1EC0D606B1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834034;
	b=Y/iXYTX2aQ7jWhaAEb9gvB8o+SZ6K6ti8Tv95qBKk971ynpaDC8nk++ASri/M5WpKDMY
	 rLthYz7fkNxg6s/QwwniFEiOQIft73KqfyRNOLISkcqwsVMU5/l4BrAMHt+C12XQGH4qW
	 zS68RWipKHkvURohkUy1M2K+7OI6wXdV3bUXuDuntryKk8luSsQVG4VY8neRYmE3nP1c1
	 oBY5DVEb3Xd4ThCIACGQMJCmCmV5DTu4c5vdCQBZAvXTMjp4jLfwxwZMpJjcrcXNNn5Gj
	 xNGqNg+AQO70UwMsNOtnNYv3qGyUdzOcIwQoQwop75US2Z6GyfTChQKrnXSevhLs8tw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834034;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QsIOSNeeF6eNUk1SzxTi6cVVk6a01ZOuu9ouF6/ioW8=;
	b=Kx+pxA7F9j89j8K4wFbN4CLWY0kp+BA2Xw0Bp1pRVX72INENexwvKXLM3zyxN87vDCfS
	 U+u/JChlFxFEodCG0vHZVSlt/kPdI9DdnIL9ketpzbnu7v/OtLQewNNcyR8AWdfznEwuT
	 bkyIl3O/Rfu3NPMQoj6PM5U42/EiNFp9V4bkE7vx2x8bMXbXd+dpsKhuslqorZCYC5IzR
	 GjNJ9vZ+K0di/zBcpTyVINavggW2kybwN11GeYBRiFLvuadSg+bD6eE9JZB3DcBApT/8G
	 r4FA9tqs6J5pIvj9K62HaYbFpM64Ee2NYy3j44b3a+Sy9fAZ2hqY1RFEqoTjKpnT4lA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834034;
	bh=QsIOSNeeF6eNUk1SzxTi6cVVk6a01ZOuu9ouF6/ioW8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=C/yA8QseYmCpbLx1k1rB+izWipNLvPEMHBMopmH9ewXOY4ic3KPiiYsohcHcqO5hd
	 k5w3vI1hdjTZddN3Hkc23Qa4ATKOHUt7KgWgz77gF3JNX6M6JI2dv15RXeuJp8QqCA
	 HvueVGUhm39dF8MJO29ebTnfeTCX7ZrcersItLX2Xkv4LR41XlefRZZoumbSUGS93r
	 +CDiMOD5Hs6xHIBssUB6K4U7VnYElNcSEekdaMI+RMg3OCAJHVQUm+q6kkW43rXEN+
	 e1sxkv6B0RgmqOwEKs/vvqZMMWJ6ogzKgTwm0sjyMWVAXRVXAuUBdTr7+E3VzHRsIX
	 BZM17L5oAwodA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EC0D606B1;
	Sat, 19 Sep 2026 16:07:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D7FD524D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE1ED40AE5
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bEFavBdd-4wI for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:07:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A835340BBC
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834029;
 b=nRRY0e+dnTRw7kt1AjugtO78391fB2mYN6iIkLd+QsSP5THicD0cs4QqZyIm2saa3EUA
 uNeJTAFJAc8Gl7GS9MT1MTimuCvZ7Iv3FmexeXd4U5nBnyED79mi230ZqU61kHnanSqV2
 P3LmAqY6gPcis+PKQ2JHPCZGnUBcG4bp0rTAMbS7hhzcTFofayIFSqavCY85lYLUr4lA2
 2E2aYzmgkfcUVMxH15+Uiqxi0Tp1hAblNcq2iT4P3PyFKgL0dBC4CGw53Mua2PI5lJR3j
 +AACaUPWxIdS1juZlgQSCW0Epws77AdVgkW5UoBK1v9sOXmrwU8nO2uVCF9YWRsV2Rw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834029;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eS+ZYrlXorlxC5Msf5x7HU5ym7C392UqGLKTnC7hbes=;
 b=CLpJBiudTPva7p228lN5Ujm4r5KxzqUKnrvwP/jRDFXCQMGW4dTGhMxnhUvpTS1bs2/R
 koru9QopVXTRb2SMpr4X5KdjwdiW+3JngWpzpjdfdzdB7840aDPPvNr6SGp78j75EPy+J
 MwthHEGB1Q8HU7OPBVLBHkMcXVw51yzTlug32ZiKq0wfuiy/XVUHT31meO2iuH+eAKryx
 Jpzvf1uqN2quH/XSoDKfUeHKCwsNNO0vyBKvH9kQMenKUne/hnLtbw9eHQOgs+tSQHTlo
 llUnjegVQ48wDO9Wh+DbjEIJn5agbPgMH71WHjU/3U6zp3tfRe1HyKvpXB1wMBSVTXw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZMs0G6Xu; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ZMs0G6Xu
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A835340BBC
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833548;
 bh=eS+ZYrlXorlxC5Msf5x7HU5ym7C392UqGLKTnC7hbes=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZMs0G6Xu85nhCrbXGdmRi7cHKVSTHe4BuuEp6Ei1QzQA33P66deCkBy2mqL6QZDR7
 PWy7LgsI2FDf6A5GR+gLbe78KhyOLdo3R+O25pULmPYsb/q3+B2V8zbuUK/i4RjrAi
 O4hdj54NU+CMOFbA0zne6qJvqSdSqSciBAugZPXEB+S4fvDvo/rqPH77D/Q4ERXcjw
 ClXB+pyiNR6eXNnwc2C1x2ZBDpBR/XzkAE6PaF7A5UXz8wsqImdMrtgaUYL1dqxwK7
 J6gO+wGfx3x2+hIzhPYryAFuPIaMuPXgtECCvmYehN0D60cUA1ykDQ2AStq6xuZHo0
 OQEhZm1mpwrkg==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:P4DpebkCZc/xeCv5P09MldO58e50+XkkR62MU7Q7ohZpdaG7f8d+V2DCpcPwSz6gqq6svxP9HqOpMBuWheTdN3BvU7RBctAKaBe3boCst8GGLHjXSNuHLfqQ85yS0vb3sv5lfq85gaKeNQMa3F2CE9YO4Bnxaz2661S2YgWLGLr5ZfU0U/CuPoyyel0opVyqPi3kQLHLzsDZnZ+4hXBsuL6OWTMTw+fTGt80shHW4lQNJkduE7QLSxm0OaQ0hm9dWIpjmlgUwj9e018rWlJS0BT9JxFqDIvlW5MH4pjoPwIMu8sMtFhI0qhFa/IQj1bSnuPwcEnaP05f+kM9GNZKJ2rXrYyygNF8hx+CAnWIhYoQTGCjaarxOt8CCCzM8fPp6nNbQN3QKDSDxZ69WCC2nYEV5BWPml1+QLLXLRkzCInjGaPCrqhxsSvI5z8g7XsxZSR/qC25dXyF9NMLBQKRiDR9ttYB0SStuATKBNGlw1rAmhwlknD1nI0FARyHkHr+qhVU7PC2mqqBgdQtsQLbgZR757w87LjwEVJZCVsBqO9A8pTHkYRZ7rgoU1/oNodY0IEB/19d8oMCnioWAGZtgm0cHzJlmDPTI4zRDdjbLpUE4/
 kgqcKzTa7QYceaXiFwJGF7ZbUjQ6jDXKPhiWvDUq8hT+xW8bq6hT3zQ5EQcWNc2vKZg0P8
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7E973A4C47C3;
 Sat, 19 Sep 2026 17:59:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSp-000000005Jx-1ZZu;
 Sat, 19 Sep 2026 15:58:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:58 +0200
Message-ID: <20260919155845.5776-34-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 33/77] package/boinc: Fix build with OpenSSL
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
 ...fix-a-build-failure-with-openssl-4.0.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch

diff --git a/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch b/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
new file mode 100644
index 0000000000..22e2ef65a7
--- /dev/null
+++ b/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
@@ -0,0 +1,26 @@
+From 9cdcef8261be4891b4814c6f728dcee65027e5da Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <locutusofborg@debian.org>
+Date: Wed, 26 Aug 2026 12:27:54 +0200
+Subject: [PATCH] Adapt code to fix a build failure with openssl-4.0
+
+Upstream: https://github.com/BOINC/boinc/commit/9cdcef8261be4891b4814c6f728dcee65027e5da
+
+[Bernd: backported to 8.2.15]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/crypt.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/crypt.cpp b/lib/crypt.cpp
+index 17a9b57b3eb..b54e2f050ad 100644
+--- a/lib/crypt.cpp
++++ b/lib/crypt.cpp
+@@ -774,7 +774,7 @@
+     DATA_BLOCK sig_db;
+     BIO *bio;
+     X509 *cert;
+-    X509_NAME *subj;
++    const X509_NAME *subj;
+ 
+     if (signatures->signatures.size() == 0) {
+         printf("No signatures available for file ('%s').\n", origFile);
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
