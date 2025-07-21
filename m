Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3914FC83F26
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 15:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AC2B413B4;
	Mon, 21 Jul 2025 15:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmwUuQJYVu5S; Mon, 21 Jul 2025 15:48:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 245E84279C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 245E84279C;
	Mon, 21 Jul 2025 15:48:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8653E127
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3FC640245
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbZmzrkMRnyF for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 15:48:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DDE914016C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDE914016C
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDE914016C
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 15:48:21 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ae0d758c3a2so734616466b.2
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753112899; x=1753717699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aUfis/NKTaxJoIKvIoTr/ZilrPfYHm+MK9jSOUArTV0=;
 b=FlhyIZALJjUWMez0v7tJiLd/mEvq1wpP95vgrXnzW2t0GO7dw6czOPGH7QFiUw69jt
 FdF5AmxMyQXeU3mCaDQ1prDT7UO6uh3hY3YiooCMMPnCowGhobQW6D3R6bLQrxW2aRJD
 grvBucqrk9p0a6E1Gu1Qsb/TpFngNjmDnUNjWq/V0a+yPjlNcOL68mSrzeShfq35lRll
 HsKGJV/PixcuKBp/XceUt6QqY/18DiAEC1lA5vrL7+r/EKMyF58lsrOKAMK2RUXjXYN1
 BNqSZ+3aovHMcQmLQHTdtxiXzM0y63aXRbH3IL4WNigoqI8je74EA2qxiQEAWLdeJ3YQ
 zJsw==
X-Gm-Message-State: AOJu0YxJrF8Z+4YoH6azcOblYNqP7rpuDWX31QQmcZ4GZBT+wjfwHo/h
 GtqB+oQx36qzDRGU2RoZvVvWJ9BDoI6jhkWO8DcwGOwQo8A9I+spe6YrYLhUGfKJq9lsSz1D9Po
 MdSEO
X-Gm-Gg: ASbGncs77xTHPoMRJUSYunAxYAT/u/BtHCLWKkTbicDhwMZUKJ4mTHDdFPys9hqXmlg
 G1EkZsmk6y1ZHhwIhDBSWG7yRl/TFXepLGqv12IGMwBXk03ylFn6SUU7vnBzIonbks3ElOhmge4
 kIpHlVhCcbIiPP6luT3PH8Fr6N3owZLcwh5guCiywM4fDcw+S8eKOrRvpFsFZ85OhkFSOC4jiXx
 pIVs9F04aEK4iNl8120euOw5fvSyVzEinf1xUgIcU1hOcHc4ROC+4GPWerUKSb7TnrDI0wB4pY6
 pNzzWb86GBHrqhSXa5PZ+L3QCj336yRxvaV0YFuPCvU382qzA7Z+rtnPlyApxMTWBCmCudlgtYg
 JkeM3zaEVOp7y59KImuw3cjU=
X-Google-Smtp-Source: AGHT+IH6OV02O2shZY6EidTLg2CtEh0qXqlUzH8OHI5US23DOdZb1LMwtsN2u6cdxs/e+2dGFvnSGA==
X-Received: by 2002:a17:907:f1c5:b0:ad1:e4e9:6b4f with SMTP id
 a640c23a62f3a-ae9c9b14a30mr2308350766b.36.1753112899191; 
 Mon, 21 Jul 2025 08:48:19 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c7d7bd6sm701183266b.47.2025.07.21.08.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 08:48:15 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6CC4C5F83D;
 Mon, 21 Jul 2025 16:48:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Mon, 21 Jul 2025 16:48:07 +0100
Message-ID: <20250721154812.787883-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250721154812.787883-1-alex.bennee@linaro.org>
References: <20250721154812.787883-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753112899; x=1753717699; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aUfis/NKTaxJoIKvIoTr/ZilrPfYHm+MK9jSOUArTV0=;
 b=iFVYRSe/TJD8wpq4vFKQ3EMpLAYoI9bBb9nSRQ60gOW1I1/LciEQm/n7QZ8cYAZVjD
 PLa+uGKxliI1ZUicjrCI8GJP36GeYNA7c+uUCQGhmDrQo2jKnnSjt8mvWRRNoUromltL
 2A9VWwZdgeHfIVeerFnGjo0dRmNDbtChuELpEdtHAQNhbK83PilW8s/mPwoHHqJj6ilY
 H0YmoeHkjMwmcTdHjqc/OBoH9yF18j7cPZ0+Z7vFasa89b4Qg6glovCmEYox+79VMz/H
 DXnpIlSu3tmv9LMDnCD50B21LbISCNMS25jmfQpZKLVPfCUQzKjCvQ56J0UtkUAwHJrT
 VaZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=iFVYRSe/
Subject: [Buildroot] [PATCH v3 6/9] package/kvm-unit-tests: honour
 BR2_ARM64_PAGE_SIZE
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
Cc: Thomas Huth <huth@tuxfamily.org>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGxhdGVzdCBrdm0tdW5pdC10ZXN0cyBkZWZhdWx0cyB0byA0ayBidXQgdGhlcmUgaXMgbm8g
cmVhc29uIHdoeSB3ZQpzaG91bGRuJ3QgaG9ub3VyIHRoZSBzeXN0ZW0gcGFnZSBzaXplIGlmIGl0
IGlzIHNldC4KClJldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8aHV0aEB0dXhmYW1pbHkub3JnPgpT
aWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Ci0tLQog
cGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tayB8IDggKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bS11
bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0t
dW5pdC10ZXN0cy5tawppbmRleCBkYzY0MTZiMGViLi45OTA3OTVkYjAwIDEwMDY0NAotLS0gYS9w
YWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rCisrKyBiL3BhY2thZ2Uva3Zt
LXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsKQEAgLTM1LDYgKzM1LDE0IEBAIEtWTV9VTklU
X1RFU1RTX0NPTkZfT1BUUyA9XAogCS0tcHJvY2Vzc29yPSIkKEdDQ19UQVJHRVRfQ1BVKSIgXAog
CS0tZW5kaWFuPSIkKEtWTV9VTklUX1RFU1RTX0VORElBTikiCiAKK2lmZXEgKCQoQlIyX0FSTTY0
X1BBR0VfU0laRV80SykseSkKK0tWTV9VTklUX1RFU1RTX0NPTkZfT1BUUyArPSAtLXBhZ2Utc2l6
ZT00aworZWxzZSBpZmVxICgkKEJSMl9BUk02NF9QQUdFX1NJWkVfMTZLKSx5KQorS1ZNX1VOSVRf
VEVTVFNfQ09ORl9PUFRTICs9IC0tcGFnZS1zaXplPTE2aworZWxzZSBpZmVxICgkKEJSMl9BUk02
NF9QQUdFX1NJWkVfNjRLKSx5KQorS1ZNX1VOSVRfVEVTVFNfQ09ORl9PUFRTICs9IC0tcGFnZS1z
aXplPTY0aworZW5kaWYKKwogIyBGb3IgYWxsIGFyY2hpdGVjdHVyZXMgYnV0IHg4Ni02NCwgd2Ug
dXNlIHRoZSB0YXJnZXQKICMgY29tcGlsZXIuIEhvd2V2ZXIsIGZvciB4ODYtNjQsIHdlIHVzZSB0
aGUgaG9zdCBjb21waWxlciwgYXMKICMga3ZtLXVuaXQtdGVzdHMgYnVpbGRzIDMyIGJpdCBjb2Rl
LCB3aGljaCBCdWlsZHJvb3QgdG9vbGNoYWlucyBmb3IKLS0gCjIuNDcuMgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
