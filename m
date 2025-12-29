Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7F1E92FDE
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47DED80DD1;
	Mon, 29 Dec 2025 21:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KpM29zfrbwug; Mon, 29 Dec 2025 21:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8AF880D6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767043338;
	bh=HLfLEn/JjZCEy1fTgUPUDYBfrU6Yl5P0sakudOHvCOE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=rnJd+26ykVva3lrDoLAILH2MIkWHxTSNBkP11drFlPdO8RcRWjjKuha8YHRLfgqKd
	 /28q6tWcPr6Ka4iiPZZQ5ZzrCqYIY/M+JEtfLxyQADrTH15mRwZ6AUisMA+OVQL46B
	 YugGOpgEVVBA3l3XoPEdq4PdDp7CMg585kaOc+8O+pQCI1F9FlRxdFRP2N3XTJmiLv
	 X/DeUXuskoFBBk8AHBorxV8PLoz9leN7gDSmShwb/Q43K4/0l8/aBhFHerT0p8MlmU
	 L6DT9i2VKxff3XrKZ0LkinCBQGYmfzdEH/YxHb4tajgv8S+SfGkMhcK5zFpW3JmI1x
	 AQizgqsHqq9yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8AF880D6C;
	Mon, 29 Dec 2025 21:22:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AD8E6177
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E87F80BDB
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M4McfrXxhHKi for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:22:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A630F80D6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A630F80D6C
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A630F80D6C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso38258585e9.2
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:22:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767043333; x=1767648133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=reKsFCVl0aHXGTaCUiJFKefwg8buNnMTWdX/MTeWkLc=;
 b=OSnB8/fR1eXRAlfTwqnuHoGdjWAe4PDqQaIMiNIvUD/BdCoLmZyUZ7H1eP3ZgVIa+X
 WERVzuFJgGJUITKkL5wLr3818KKiGsnNd90d2oEWfiALiwyOSV9iKmreA/yJOGKdFfJH
 X83ZoW4JdoE1dvWOIN7JlQUS2zbcb8ZgL/JMjHDZlAotPyS6/+PrOV5UK1krdDJzKz25
 SuNEr+83fi0fDbR1U3ZF5xjAuagnLAydsF+P7j6GGssOf2jMnI5DadyNETmdxloHH96Q
 1/iH4JUhkyveInybRZ0eTXGnJAcXzYybLG744yJfHamcNpQ1EdMguvqy+6roPDoC3Guk
 uX2g==
X-Gm-Message-State: AOJu0Ywqkxnkegu+iLRastHCC1fBu6K1GPjRVFBn6OrBrK8B+c6EDRSG
 qv01Si0QsP3A37nykEgUDFpqv3dFqJp9aTCYtPrsdbPLxXjhagLVX6w8aPfMSEXYfv92M4MuROW
 52Au2Aj4=
X-Gm-Gg: AY/fxX5KsEUbC21AsChtoT6o8DlrFUVnAgE1pn3uXw2YXM+QEXrYrMqvmrRcnVBMA63
 egBsUAbqWNfCfNsX7GzfMVWvw+VQF2g+2+IcujwsTQd4djrdmNKoarpuOyRvtdq6P4Su89CNX5d
 +NylkhZF8FJrEQnXzI61d3GT4BqMkyNty/Fw0kj7YAxhlhMfLdnZRS/WDSGZhuLjrYfwg34/x0O
 2EuH09MpW0LvGrqS1aVrJmg26QYSkHf/pR23Xl71VY/8MkUL4UHVBTlQR5A+52ekRssvCZQ/lwD
 hVI6+qUYJzyoP8MSsa2q5jG1WcUMl2v8yfVv8fjvxPgu66IFf3WtWaPUmvb6rqxA66SrOmDrWls
 U2IAIR+g1GWkZkqT/sz3PfgzQ9ksafKciF6DWi6uAsJOkOtB//QFMDwM84n5pNxzeT56Z8wbHc+
 zEanc=
X-Google-Smtp-Source: AGHT+IEc8YW/66YZZFcYYW/tRdvJ7J6L/ragxBC8shFz/Fq136joiysJaXOLKhROQdhFSqXf9GmCOw==
X-Received: by 2002:a05:600c:3b1f:b0:477:bb0:751b with SMTP id
 5b1f17b1804b1-47d20423ca4mr350493655e9.27.1767043333325; 
 Mon, 29 Dec 2025 13:22:13 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbe58sm556813195e9.9.2025.12.29.13.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:22:11 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 22:21:44 +0100
Message-ID: <20251229212149.167902-12-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229212149.167902-1-thomas.perale@mind.be>
References: <20251229212149.167902-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767043333; x=1767648133; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=reKsFCVl0aHXGTaCUiJFKefwg8buNnMTWdX/MTeWkLc=;
 b=X4dGefoEJ4uaDQhtUnonx9liJ2aRDaMk7JytJu8s2v7bE9km30Kbkx1/t1qFfonrOI
 +YJcxLTRnCkY9xYZ6EXMeD3IS9FeZjy8TDs7HuVic5/Y7HCc3ots1cKXgvau+PxVwKN1
 LxfLsclHRZpVIyXBA21CorAQbXW8/Vmlyakcdr1q1m6nlNbkX07lzqKO3fEG85/ydeDA
 fk20fAbMy0kdB08TrsIGXgcXgvgdYlh6vSsfoGajTaAY3JfTCN7mRQdM+JV7geoyvt7u
 uNh8Yn3Qvcd8nQ+pLHEtlb2PozmNT7l5Z8DRgnKYtI2jVuoXu7Am1ZwWdEWbc6B6b2yH
 H/9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=X4dGefoE
Subject: [Buildroot] [PATCH 11/15] package/glibc: remove stale IGNORE_CVES
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

These IGNORE_CVES entries introduced in [2] are then no longer matched to
the glibc package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching
[2] adaae82c58 package/glibc: ignore CVEs not considered as security issues by upstream

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.mk | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index a7727cbad8..924274a7d6 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -34,19 +34,10 @@ GLIBC_IGNORE_CVES += CVE-2025-5702
 # Fixed by glibc-2.41-64-g1e16d0096d80a6e12d5bfa8e0aafdd13c47efd65
 GLIBC_IGNORE_CVES += CVE-2025-8058
 
-# All these CVEs are considered as not being security issues by
+# This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
-#  https://security-tracker.debian.org/tracker/CVE-2019-1010022
-#  https://security-tracker.debian.org/tracker/CVE-2019-1010023
-#  https://security-tracker.debian.org/tracker/CVE-2019-1010024
-#  https://security-tracker.debian.org/tracker/CVE-2019-1010025
-GLIBC_IGNORE_CVES += \
-	CVE-2010-4756 \
-	CVE-2019-1010022 \
-	CVE-2019-1010023 \
-	CVE-2019-1010024 \
-	CVE-2019-1010025
+GLIBC_IGNORE_CVES += CVE-2010-4756
 
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
