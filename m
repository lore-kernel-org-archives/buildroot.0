Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E55C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 18:13:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70B9561040
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 18:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70B9561040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 070DB40282;
	Sun, 24 Oct 2021 18:13:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FKgditCCxGSk; Sun, 24 Oct 2021 18:13:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3770C40247;
	Sun, 24 Oct 2021 18:13:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC8BA1BF420
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 18:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A910F80DC8
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 18:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ygCS2T-KyKhJ for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 18:13:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B07480EE2
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 18:13:36 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id l13so12315923edi.8
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 11:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0bTUNxaTCdEs4eIwVoMtrhhhKMLKTC9mhQVKi9fCzCY=;
 b=RmbzyaC5QW/fU8PxmC4ErXUtNL+CClkzKa1+H8OCjaT3l0n7QppZXTLKsklihIWfGp
 UeXRcqy3Lcn+egdjr8AvfuXnRn2ELVaze+SRowuETUIyT/T3ZbB2TMZm9msqYczvbVMv
 olC3YPOzK+EvlmtLOwMfialRV9D+iZ6H5egSFf07HuNZRego7HAm9j07Za+7Q2uYCR0Q
 KyL7krMXqE6NP24waem81Q2uA7ti1o4hABCgvGrqacHw1GAD4yRSfdpbRckYY0eyltug
 lrRrVBp4vJwuhNao3ZhQGlqeQUI2GYFxwBCI5G8VgEZRS5Tapq4BDf93S++NPombeKEf
 JiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0bTUNxaTCdEs4eIwVoMtrhhhKMLKTC9mhQVKi9fCzCY=;
 b=IYTOaES2WaVa39o2/5TCebaD/dsvKc0GejLktgUXhebGv6YoR9LT1x2X8t5o+pwTjA
 fE2GuwiqhWhTZ79WWg1Kfu3cSuPFIkmBfCkjMtLizEJMRsa9x318/WiB10+0BJlF61Ot
 caarUC7bj04qshi8oIvbNzc1ASPSQDx49n5Pxe9Rp5WHb8piEsAFR47LVPHzVjWIufqX
 E8gDcqwkvl24kGxch0tGx+Mna1oPiY6O5rr+RXkw1hDwAOuLHn24RanUsrEY6/gtE4kH
 87FTBOPhznGupgpM9XgilceFJlGUvnOmkYxttH6khgfE6RgjIRmajavCbF1dZ4ByUyT5
 Hm1Q==
X-Gm-Message-State: AOAM53242ewO+uLjsunouG9HJGujWP37EIfX0yKrfLf1eMdWkZMXA5nN
 VK0KDeZnj1+dnbi7Bs59NBKBS83awGL+VMNr
X-Google-Smtp-Source: ABdhPJyMYknMskDS9C9qsd/FFJnGsjJ40jHOWOJ7hlul+x6kvUNYOhy5q/tq+5/KvEqskHZUqjyeEA==
X-Received: by 2002:a17:907:7d9f:: with SMTP id
 oz31mr16647956ejc.318.1635099215142; 
 Sun, 24 Oct 2021 11:13:35 -0700 (PDT)
Received: from localhost.localdomain (5.26-130-109.adsl-dyn.isp.belgacom.be.
 [109.130.26.5])
 by smtp.gmail.com with ESMTPSA id v15sm7555367edi.89.2021.10.24.11.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 11:13:34 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 20:12:17 +0200
Message-Id: <20211024181221.2608908-2-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024181221.2608908-1-raphael.melotte@mind.be>
References: <20211024181221.2608908-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] package/python-botocore: add missing
 dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIG5ld2x5LWFkZGVkIHRlc3QgdW5jb3ZlcmVkIHNvbWUgbWlzc2luZyBjb3JlIG1vZHVsZXMs
IHNvIGFkZCB0aGVtCm5vdy4KClNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBo
YWVsLm1lbG90dGVAbWluZC5iZT4KLS0tCiBwYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9Db25maWcu
aW4gfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9weXRob24tYm90b2NvcmUvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tYm90b2Nv
cmUvQ29uZmlnLmluCmluZGV4IDRkZjgyZjYxNGMuLjhhZWY3Y2I4OTYgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvcHl0aG9uLWJvdG9jb3JlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL3B5dGhvbi1ib3Rv
Y29yZS9Db25maWcuaW4KQEAgLTQsNiArNCw4IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05f
Qk9UT0NPUkUKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX0RBVEVVVElMICMgcnVudGltZQog
CXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fSk1FU1BBVEggIyBydW50aW1lCiAJc2VsZWN0IEJS
Ml9QQUNLQUdFX1BZVEhPTl9VUkxMSUIzICMgcnVudGltZQorICAgIHNlbGVjdCBCUjJfUEFDS0FH
RV9QWVRIT04zX1BZRVhQQVQgIyBydW50aW1lCisgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhP
TjNfU1NMICMgcnVudGltZQogCWhlbHAKIAkgIExvdy1sZXZlbCwgZGF0YS1kcml2ZW4gY29yZSBv
ZiBib3RvIDMuCiAKLS0gCjIuMzMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
