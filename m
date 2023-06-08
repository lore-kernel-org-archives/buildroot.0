Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71E0C7EE29
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 17:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F67B611D7;
	Thu,  8 Jun 2023 17:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F67B611D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLgPwrEPd0k4; Thu,  8 Jun 2023 17:50:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FCE561230;
	Thu,  8 Jun 2023 17:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FCE561230
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75EE31BF39C
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 17:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F6C882279
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 17:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F6C882279
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XW_5JsMMi4W2 for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 17:50:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C6F783C28
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C6F783C28
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 17:50:22 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30e5289105cso715075f8f.1
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 10:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686246620; x=1688838620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6w52rAKHSzeaiqQhh/2tkZugx5RxGbGQfOP/R3F5eGc=;
 b=iYDflvexDMR/qcrMEUyTx2tu9eLfAjrGKFYnvupJJKIKFiO7Bea+DfzVXtvEir3LhR
 o9MmnOLBkfVo60MYq5YMuN1kEgxA6+6h8mgWsumtt6R3araoCXp/oXZtbryhNPhqgMe1
 KuoKSViJMTY7rD28nWcqbXbA/cSj56KMZ/EO4VZ7I5hcZt34WmD3784JcUGx7T8WCOOt
 h09kYt5cEDqx02s6h7QBqxVayErnqknHOc4cmoOTV41GwjEp0WpPG9rwVAR9Wj8oEZpC
 LmbEVwvC54eJG75F341H+EwW7ulPQkcHsGkwehaETOFHYA4QUVjebne+lT1tEukLxB6y
 tRwQ==
X-Gm-Message-State: AC+VfDwVZHccgrB4PlcbhB8Pd2DzEEaX8tqLLcJtlgqyx2SCzRDRvWL5
 MBU5sgSX44fgvZdhPJq/p3tLN0x5ty0jHg==
X-Google-Smtp-Source: ACHHUZ6Jv/EM9Z/Tqh6sFnglVgiDgr/7EM4jPYDgkYpJfpgBe5nAhVyAIPIyHIv7nl9wjZFMgRs6MQ==
X-Received: by 2002:a05:6000:1cc6:b0:30e:3dc2:6f2f with SMTP id
 bf6-20020a0560001cc600b0030e3dc26f2fmr2070099wrb.12.1686246620192; 
 Thu, 08 Jun 2023 10:50:20 -0700 (PDT)
Received: from cuervo.lan ([78.30.22.52]) by smtp.gmail.com with ESMTPSA id
 c6-20020adffb46000000b0030ae7bd1737sm2188035wrs.45.2023.06.08.10.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 10:50:19 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 19:50:16 +0200
Message-ID: <20230608175016.1341416-1-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20220724143533.GV2641@scaer>
References: <20220724143533.GV2641@scaer>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686246620; x=1688838620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6w52rAKHSzeaiqQhh/2tkZugx5RxGbGQfOP/R3F5eGc=;
 b=fCdwOLc66I0lHKSeWvhKdbScdecbk4wAWmfs5nIp/TZjQCWi6yEhvjBqID3COZYOWF
 lvVKEFJuznxW2zOOTk+SauoWn7jLO3xVZasv5gupgNTKD27Lt0bpd8dpL9a91C13+05r
 vdA6GqUkf9XjFqOOW89qhCW0zqkECxyUZMqxDfbif4Xymici/lA8Oz/+FAw3ymNY2qXn
 yuiotZGHJXIMrmH9/E+4cj2xKFDngwWnzkLmL8Z6RfycpiuSCGGp4nAspFjeJEXPNJJ5
 B2f3vSHLI3pLI6zigAJRa6DfaIUOMo2JFnjoSkb0WjOfkiN6c0+l68H+vGWhmGqXDdjI
 mPyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fCdwOLc6
Subject: [Buildroot] [PATCH] package/zfs: not using kernel-module infra
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
Cc: Michael Zimmermann <sigmaepsilon92@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

emZzIGFscmVhZHkgYnVpbGRzIHRoZSBrZXJuZWwgbW9kdWxlIGZyb20gdGhlIGF1dG90b29scyBp
bmZyYXN0cnVjdHVyZS4KClNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8
c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgotLS0KIHBhY2thZ2UvemZzL0NvbmZpZy5pbiB8
IDEgKwogcGFja2FnZS96ZnMvemZzLm1rICAgIHwgNSArKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS96ZnMv
Q29uZmlnLmluIGIvcGFja2FnZS96ZnMvQ29uZmlnLmluCmluZGV4IDYyMDljNTg2NWIuLjNiZDlm
OGFiMDIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvemZzL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL3pm
cy9Db25maWcuaW4KQEAgLTExLDYgKzExLDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1pGUwogCWRl
cGVuZHMgb24gQlIyX1BBQ0tBR0VfSEFTX1VERVYKIAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICAj
IHV0aWwtbGludXggKGxpYmJsa2lkKQogCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhS
RUFEUyAgIyBsaWJ0aXJwYworCXNlbGVjdCBCUjJfTElOVVhfTkVFRFNfTU9EVUxFUyAjIG5vdCB1
c2luZyBrZXJuZWwtbW9kdWxlIGluZnJhCiAJc2VsZWN0IEJSMl9QQUNLQUdFX1VUSUxfTElOVVgK
IAlzZWxlY3QgQlIyX1BBQ0tBR0VfVVRJTF9MSU5VWF9MSUJCTEtJRAogCXNlbGVjdCBCUjJfUEFD
S0FHRV9VVElMX0xJTlVYX0xJQlVVSUQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvemZzL3pmcy5tayBi
L3BhY2thZ2UvemZzL3pmcy5tawppbmRleCBlOTk0MTNlNjExLi41MGMxODY2MDQ1IDEwMDY0NAot
LS0gYS9wYWNrYWdlL3pmcy96ZnMubWsKKysrIGIvcGFja2FnZS96ZnMvemZzLm1rCkBAIC0xNSw3
ICsxNSw3IEBAIFpGU19DUEVfSURfUFJPRFVDVCA9IG9wZW56ZnMKICMgMDAwMS1yZW1vdmFsLW9m
LUxlZ2FjeVZlcnNpb24tYnJva2UtYXhfcHl0aG9uX2Rldi5tNC5wYXRjaAogWkZTX0FVVE9SRUNP
TkYgPSBZRVMKIAotWkZTX0RFUEVOREVOQ0lFUyA9IGxpYmFpbyBvcGVuc3NsIHVkZXYgdXRpbC1s
aW51eCB6bGliIGxpYmN1cmwKK1pGU19ERVBFTkRFTkNJRVMgPSBsaWJhaW8gb3BlbnNzbCB1ZGV2
IHV0aWwtbGludXggemxpYiBsaWJjdXJsIGxpbnV4CiAKICMgc3lzdmluaXQgaW5zdGFsbHMgb25s
eSBhIGNvbW1lbnRlZC1vdXQgbW9kdWxlcy1sb2FkLmQvIGNvbmZpZyBmaWxlCiBaRlNfQ09ORl9P
UFRTID0gXApAQCAtODcsNSArODcsNiBAQCBkZWZpbmUgWkZTX0xJTlVYX0NPTkZJR19GSVhVUFMK
IAkkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19aTElCX0lORkxBVEUpCiBlbmRlZgog
Ci0kKGV2YWwgJChrZXJuZWwtbW9kdWxlKSkKKyMgWkZTIGF1dG90b29scyB3aWxsIGNvbXBpbGUg
dGhlIGtlcm5lbCBtb2R1bGVzLCBzbyB0aGVyZSBpcyBub3QgbmVlZGVkIHRvIGV4ZWN1dGUKKyMg
JChldmFsICQoa2VybmVsLW1vZHVsZSkpCiAkKGV2YWwgJChhdXRvdG9vbHMtcGFja2FnZSkpCi0t
IAoyLjQxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
