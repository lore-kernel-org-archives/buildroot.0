Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92130E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 15:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CDA083B15;
	Thu, 19 Dec 2024 15:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRUwM3PT-hGw; Thu, 19 Dec 2024 15:22:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53DCA83B42
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53DCA83B42;
	Thu, 19 Dec 2024 15:22:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AD1B730
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 15:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35D7D4028D
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 15:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PghFxB5Xr3T3 for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 15:22:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 19BFF400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19BFF400DA
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19BFF400DA
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 15:22:08 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aabbb507998so169722866b.2
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 07:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734621727; x=1735226527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uIpAD1aA0+3TO4uaTTe7Q0TCeJ5FYOSP+OkfJN0HzVs=;
 b=T3kEciXFqSDqSH1QEpHvwCBZ61FHqrX2QGqa0XrJ9nwsVyuSkPu/rvPhdfmGOfrFO2
 Clxqo4ZakaGp1Be+zOsiM37ATqwobCzRODElDQsgTzUnaI35wjDFQNEczng8IFWKKAQo
 4usbNX8eiDJe0makP9SnX/qSvEl2qanZLOUGIPwcYg6QYC5k/erB+SKRmZSb/kgYhtxj
 nlhWyqxKoazYw4/nCEguKqoUrSy4pVUCF+TQpDCubSOhnUlPH0WDiUlwvift5RdV02O7
 NVwwF8s+4MwMOmZixAmlUugEQEaf0IROL7WlOwLiV4F/qXQXSJsSwqln5ciQGcpnZvQp
 FCSg==
X-Gm-Message-State: AOJu0YxIJP4kTvpTiaWIUeiJZpg0iVOnirwi4wdX438vK/+ySNrT8ZBS
 QBEeyRp38/q9pCGV/wlZfufyVSSlY4030acqlAO+QjwtbDDtZfhZlHHnZQ==
X-Gm-Gg: ASbGncviSq/eEhnyYtrPAAsiY83ZdSyQ5g33rJN/OIGuoVNJrPycZjrqoIwfzI+OJmm
 bynRU1Rin5Fx1WlIj4RweylrIeeR8jYyw8SQVOOQGqMkTD71FLapxZPDAlYWGXvEWzbXKFFej2u
 VqTJOnQiGp/fWOqrV/5HN7+blFgY6LMJ6N+3uyPCKPOAQG74xqE3F94ud5r20KNY1uPHQXFQxw1
 rRCzX8ncRydtljX8uLYFy3By/fWDfWjtl9GnwCivXjfDnTa6HmdVyLvgzB0IcMaHnt3av+zpQ==
X-Google-Smtp-Source: AGHT+IFCnl2OkPkHkAL4Frdo18yCn2M9rEyk1X725jb9R9cizC6XsKV500G6ItT9y5HpJ64Q7gbS+Q==
X-Received: by 2002:a17:907:7756:b0:aa6:aedb:6030 with SMTP id
 a640c23a62f3a-aabf4972aefmr538108366b.52.1734621726491; 
 Thu, 19 Dec 2024 07:22:06 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f070a7bsm75504166b.201.2024.12.19.07.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 07:22:05 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Date: Thu, 19 Dec 2024 16:21:11 +0100
Message-Id: <20241219152105.298310-6-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241219152105.298310-1-heiko.thiery@gmail.com>
References: <20241219152105.298310-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734621727; x=1735226527; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uIpAD1aA0+3TO4uaTTe7Q0TCeJ5FYOSP+OkfJN0HzVs=;
 b=CHb+LpGlfODtVCGmQINzcL4t9XuKr850Z4o4qqGoqM2k4LIvniZfqEhOYk55tP7YpR
 L1Y0o4Ra02tx53cd5HW32BHmTkUmNVj010Ss6zda/TLL6ivpu4n0wCQvS48roXKfU0lv
 p+pClp6lY8LuTQWN78yeFKI6yNNt1jyyOIXblH7w4gQ/nRQyAZE0MReQRgSFlN5sT3wT
 S1x0y81FTR7jyckr7YGZOe+Ck1xPE48crVztXMW934aFecOhyJUCG9ozTJcitQwOxyc7
 Keys6LOIQng3CZKIWkOpq7JvM/UMrmiTsipoLvHGUGWA+NHOXAVTSwJLTCCKhubgVgX6
 JPxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CHb+LpGl
Subject: [Buildroot] [PATCH 6/6]
 support/testing/tests/package/test_netopeer2.py: add new test
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSGVpa28gVGhpZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29tPgotLS0K
IERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIC4u
Li90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZXRvcGVlcjIucHkgICB8IDQwICsrKysrKysr
KysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmV0b3BlZXIyLnB5
CgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggMzUzNDQ1OGE5Ni4u
MzczZTBlMWY3ZiAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0x
Mzg5LDYgKzEzODksNyBAQCBGOglwYWNrYWdlL3JhdWMvCiBGOglwYWNrYWdlL3N5c3JlcG8vCiBG
OglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3lhbWxsaW50LnB5
CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl95YW1sbGludC5w
eQorRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZXRvcGVlcjIucHkKIEY6
CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfc3lzcmVwby5weQogCiBOOglIZXJ2
w6kgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+CmRpZmYgLS1naXQgYS9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25ldG9wZWVyMi5weSBiL3N1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmV0b3BlZXIyLnB5Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLmYxNzlkODI1MDQKLS0tIC9kZXYvbnVsbAorKysgYi9zdXBwb3J0L3Rl
c3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25ldG9wZWVyMi5weQpAQCAtMCwwICsxLDQwIEBACitp
bXBvcnQgb3MKK2ltcG9ydCB0aW1lCisKK2ltcG9ydCBpbmZyYS5iYXNldGVzdAorCisKK2NsYXNz
IFRlc3ROZXRvcGVlcjIoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKKyAgICBjb25maWcgPSBpbmZy
YS5iYXNldGVzdC5CQVNJQ19UT09MQ0hBSU5fQ09ORklHICsgXAorICAgICAgICBmIiIiCisgICAg
ICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQorICAgICAgICBCUjJfUEFDS0FHRV9ORVRPUEVF
UjI9eQorICAgICAgICBCUjJfUEFDS0FHRV9ORVRPUEVFUjJfQ0xJPXkKKyAgICAgICAgIiIiCisK
KyAgICBkZWYgcnVuX25ldG9wZWVyX2NsaV9jbWQoc2VsZiwgY21kcyk6CisgICAgICAgIGNtZCA9
ICJuZXRvcGVlcjItY2xpIDw8RU9GXG4iCisgICAgICAgIGNtZCArPSAiXG4iLmpvaW4oY21kcykK
KyAgICAgICAgY21kICs9ICJcbkVPRiIKKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PayhjbWQpCisK
KyAgICBkZWYgdGVzdF9ydW4oc2VsZik6CisgICAgICAgIGNwaW9fZmlsZSA9IG9zLnBhdGguam9p
bihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgInJvb3Rmcy5jcGlvIikKKyAgICAgICAgc2VsZi5l
bXVsYXRvci5ib290KGFyY2g9ImFybXY1IiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGtl
cm5lbD0iYnVpbHRpbiIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBvcHRpb25zPVsiLWlu
aXRyZCIsIGNwaW9fZmlsZV0pCisgICAgICAgIHNlbGYuZW11bGF0b3IubG9naW4oKQorCisgICAg
ICAgICMgVGhlIGRhZW1vbiB0YWtlcyBzb21lIHRpbWUgdG8gc3RhcnR1cAorICAgICAgICB0aW1l
LnNsZWVwKDIpCisKKyAgICAgICAgIyBDaGVjayBpZiB0aGUgRGFlbW9uIGlzIHJ1bm5pbmcKKyAg
ICAgICAgc2VsZi5hc3NlcnRSdW5PaygibHMgL3Zhci9ydW4vbmV0b3BlZXIyLXNlcnZlci5waWQi
KQorICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKCJwcyBhdXggfCBncmVwIFtuXWV0b3BlZXIyLXNl
cnZlciIpCisKKyAgICAgICAgIyBSdW4gQ0xJCisgICAgICAgIGhlbHBfY29tbWFuZCA9IFsKKyAg
ICAgICAgICAgICJoZWxwIiwKKyAgICAgICAgICAgICJxdWl0IiwKKyAgICAgICAgXQorICAgICAg
ICBzZWxmLnJ1bl9uZXRvcGVlcl9jbGlfY21kKGhlbHBfY29tbWFuZCkKLS0gCjIuMzkuMgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
