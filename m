Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A753C77B7F
	for <buildroot@archiver.kernel.org>; Fri, 27 Jun 2025 12:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F6ED8448B;
	Fri, 27 Jun 2025 12:20:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sD61k_alzOR5; Fri, 27 Jun 2025 12:20:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89230844A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89230844A1;
	Fri, 27 Jun 2025 12:20:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A9241D7
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 12:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A34A612A1
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 12:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYsnft0b6zEL for <buildroot@buildroot.org>;
 Fri, 27 Jun 2025 12:20:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 63F0B608D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63F0B608D4
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63F0B608D4
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 12:20:04 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-450cf0120cdso17991435e9.2
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 05:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751026802; x=1751631602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9tvmcTvOuxq6Kfud7iTHMZ793b3x5SmMb7cleCkKcjQ=;
 b=PBp9HmJycoURT8LLLfuEG8zLXjYwPC1+qwCrkK3F+ymM1P1HS4bRS3ML8fW0kOV6CQ
 fSyKFgaOvJu0lvzreTCVijzYD15zZR8lWbltW8TLxGy7UPONs3zxWZIW9AMzG0fSdOrF
 ZzqidMmwn85Wj9Ge7/+RAkXMsV7rAeAZfPxWW0jHR201yQbGqLxBesYbD2FsJDzO6h/9
 SHf/tixZUbJ+oH8y/DPxpuzcLfNSyJO43n8O0VsXPFs5XgywpkReLbNKtGJQTID88KWS
 Jw8VJAPO6PmIKxLounoQrJoiPUZxj3v/zvvoQYslogkLoU9H74DNpT7O4jHwacesP7b4
 Aj3g==
X-Gm-Message-State: AOJu0YyGPqtTyfYqGUh5z33jUQAp5zLJbWNJUemmixINgYi19gbzWhIK
 L1+TWF2iwDA3K4biPWCOrkKL1wsD4M26prNkOuCpRYSQLunPiPCZiJql+U8XPqUxFCFqsggh7TO
 qY0QiPFA=
X-Gm-Gg: ASbGncsq1pSR9mb4YEORFj5WSo7Z+CyUadWlPl7/GqPVtCSoTSh9gFE3WlU5Ed2M/CS
 0yiO6WjiGz7bLU3ES9KN5I3HKwGrfMbSCPh/5KYTEScYE82yqsxS7wm1Ox+PlvRrg5HSDAemr6e
 iDqvi2eU3Sw0HWsmu8IcvJodTGFItoOT1ptykkHXCzhLdFk3L512EHBR4rwcZ2aweqbzei7E6Nq
 i1w4SopiDiWOy5Erpe7a4RN9/nsOPfxZPo2xKuNOIB1/SpPfoOSyGGyGGl74RvlHfrrj/AXM1BK
 dHroiFiSisj/+R1elecleM+fLuyHRDvuYS2hQeXwb+5meBFIHk53+jJmeDzDVegzbm50qRcTQqx
 iiv6WmA==
X-Google-Smtp-Source: AGHT+IHi0vY25nMpURJ1K7Ln4rDdtoFaKXfIY3S4k9af8GLW+p024SKqRE2nKLwNlPYD0uHe9MlcXA==
X-Received: by 2002:a05:600c:a41:b0:43c:eeee:b713 with SMTP id
 5b1f17b1804b1-4538ee83b1amr26899605e9.20.1751026802115; 
 Fri, 27 Jun 2025 05:20:02 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([213.211.140.212])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a390c88sm51949885e9.8.2025.06.27.05.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 05:20:01 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 27 Jun 2025 14:19:44 +0200
Message-ID: <20250627121948.1933049-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751026802; x=1751631602; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9tvmcTvOuxq6Kfud7iTHMZ793b3x5SmMb7cleCkKcjQ=;
 b=Zlr578kwstdvgBPULJ4C4oUIqX+gj6TzYsBRT0+xPkidflhGrauzB0HWjj/93os0Uc
 4YB23bAagr7lJMSIDBYSyyXMPhBf3Qt6WmpEru/pam768gjop6X43xC4ygB/RcYerlBt
 giM/6meo9Pu/EndTPd6So2O6+E/wUdrHUHUh427m1UW5YxY3lmciZ0NUl4t1yWo1aUPL
 hQnyusrbarsDO7GiPvnFNnM2Kf1gXGfUKl0wpwy5U0/NFxIqo8XK3osFyXRYdkN5861Z
 D7wPASYz6WfGPpIhm1/EGySSyTWz7CnULPo0wCcRcwnyhQ2ythfpjsIV3oq8Pmcbv7ub
 fo8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Zlr578kw
Subject: [Buildroot] [PATCH 1/2] support/testing: add new test for
 nginx-modsecurity
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyB0ZXN0IHZlcmlmaWVzIHRoYXQgd2UgY2FuIHJ1biBuZ2lueCB3aXRoIHRoZSBtb2RzZWN1
cml0eQpkaXJlY3RpdmVzLgpJdCBhbHNvIGNoZWNrcyBhIHZlcnkgc2ltcGxlIHJ1bGUgdGhhdCBi
bG9ja3MgcmVxdWVzdHMgY29udGFpbmluZyB0aGUKa2V5d29yZCAiYmxvY2ttZSIuCgpTaWduZWQt
b2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQog
REVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysKIC4u
Li90ZXN0cy9wYWNrYWdlL3Rlc3RfbmdpbnhfbW9kc2VjdXJpdHkucHkgICB8IDM2ICsrKysrKysr
KysrKysrKysrKysKIC4uLi9vdmVybGF5L2V0Yy9uZ2lueC9tb2RzZWN1cml0eS1ydWxlcy5jb25m
ICB8ICA3ICsrKysKIC4uLi9vdmVybGF5L2V0Yy9uZ2lueC9uZ2lueC5jb25mICAgICAgICAgICAg
ICB8IDE1ICsrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25naW54X21v
ZHNlY3VyaXR5LnB5CiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF9uZ2lueF9tb2RzZWN1cml0eS9vdmVybGF5L2V0Yy9uZ2lueC9tb2RzZWN1cml0
eS1ydWxlcy5jb25mCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF9uZ2lueF9tb2RzZWN1cml0eS9vdmVybGF5L2V0Yy9uZ2lueC9uZ2lueC5jb25m
CgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggZDEyNzM2NGE1OC4u
NTczMWI0YmJlMCAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0y
ODUwLDYgKzI4NTAsOCBAQCBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVf
cHl0aG9uX3NkYnVzLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVf
cHl0aG9uX3NkYnVzX25ldHdvcmttYW5hZ2VyLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
cGFja2FnZS9zYW1wbGVfcHl0aG9uX3VybGxpYjMucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2ptZXNwYXRoLnB5CitGOglzdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X25naW54X21vZHNlY3VyaXR5CitGOglzdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X25naW54X21vZHNlY3VyaXR5LnB5CiBGOglzdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9weW11cGRmLnB5CiBGOglzdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9yc2EucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3MzdHJhbnNmZXIucHkKZGlmZiAtLWdpdCBhL3N1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbmdpbnhfbW9kc2VjdXJpdHkucHkgYi9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25naW54X21vZHNlY3VyaXR5LnB5Cm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjFiMzRjMDhlMjAKLS0tIC9kZXYvbnVsbAor
KysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25naW54X21vZHNlY3VyaXR5
LnB5CkBAIC0wLDAgKzEsMzYgQEAKK2ltcG9ydCBvcworCitpbXBvcnQgaW5mcmEuYmFzZXRlc3QK
KworCitjbGFzcyBUZXN0TmdpbnhNb2RzZWN1cml0eShpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgor
ICAgIG92ZXJsYXkgPSBpbmZyYS5maWxlcGF0aCgidGVzdHMvcGFja2FnZS90ZXN0X25naW54X21v
ZHNlY3VyaXR5L292ZXJsYXkiKQorICAgIGNvbmZpZyA9IGluZnJhLmJhc2V0ZXN0LkJBU0lDX1RP
T0xDSEFJTl9DT05GSUcgKyBcCisgICAgICAgIGYiIiIKKyAgICAgICAgQlIyX1RPT0xDSEFJTl9F
WFRFUk5BTD15CisgICAgICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTj15CisgICAg
ICAgIEJSMl9VU0VfTU1VPXkKKyAgICAgICAgQlIyX1RBUkdFVF9ST09URlNfQ1BJTz15CisgICAg
ICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU9fR1pJUD15CisgICAgICAgIEJSMl9ST09URlNfT1ZF
UkxBWT0ie292ZXJsYXl9IgorICAgICAgICBCUjJfUEFDS0FHRV9OR0lOWD15CisgICAgICAgIEJS
Ml9QQUNLQUdFX05HSU5YX0hUVFA9eQorICAgICAgICBCUjJfUEFDS0FHRV9OR0lOWF9NT0RTRUNV
UklUWT15CisgICAgICAgICIiIgorCisgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgorICAgICAgICBj
cGlvX2ZpbGUgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJyb290ZnMu
Y3BpbyIpCisgICAgICAgIHNlbGYuZW11bGF0b3IuYm9vdChhcmNoPSJhcm12NSIsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICBrZXJuZWw9ImJ1aWx0aW4iLAorICAgICAgICAgICAgICAgICAg
ICAgICAgICAgb3B0aW9ucz1bIi1pbml0cmQiLCBjcGlvX2ZpbGVdKQorICAgICAgICBzZWxmLmVt
dWxhdG9yLmxvZ2luKCkKKworICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKCJuZ2lueCAtViIpCisg
ICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soIndnZXQgaHR0cDovL2xvY2FsaG9zdC9pbmRleC5odG1s
IikKKyAgICAgICAgc2VsZi5hc3NlcnRSdW5PaygiZ3JlcCAtRiAnV2VsY29tZSB0byBuZ2lueCEn
IGluZGV4Lmh0bWwiKQorICAgICAgICBjbWQgPSAid2dldCAtcSAtTyAvZGV2L251bGwgLS1zZXJ2
ZXItcmVzcG9uc2UgMj4mMSAiIFwKKyAgICAgICAgICAgICJodHRwOi8vbG9jYWxob3N0L2Jsb2Nr
bWUvIDI+JjEgfCBhd2sgJy9eICBIVFRQL3twcmludCAkMn0nIgorICAgICAgICBvdXQsIHJldCA9
IHNlbGYuZW11bGF0b3IucnVuKGNtZCkKKyAgICAgICAgc2VsZi5hc3NlcnRFcXVhbChyZXQsIDAp
CisgICAgICAgICMgQ2hlY2sgZm9yIEhUVFAgNDAzIFVuYXV0aG9yaXplZDoKKyAgICAgICAgc2Vs
Zi5hc3NlcnRFcXVhbChvdXRbMF0sICI0MDMiKQpkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2UvdGVzdF9uZ2lueF9tb2RzZWN1cml0eS9vdmVybGF5L2V0Yy9uZ2lueC9t
b2RzZWN1cml0eS1ydWxlcy5jb25mIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF9uZ2lueF9tb2RzZWN1cml0eS9vdmVybGF5L2V0Yy9uZ2lueC9tb2RzZWN1cml0eS1ydWxlcy5j
b25mCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjk0YTEzMmE5YzcKLS0t
IC9kZXYvbnVsbAorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25naW54
X21vZHNlY3VyaXR5L292ZXJsYXkvZXRjL25naW54L21vZHNlY3VyaXR5LXJ1bGVzLmNvbmYKQEAg
LTAsMCArMSw3IEBACitTZWNSdWxlRW5naW5lIE9uCitTZWNSdWxlIFJFUVVFU1RfVVJJICJAY29u
dGFpbnMgYmxvY2ttZSIgXAorICAgICJpZDoxMDAwMDEsIFwKKyAgICBwaGFzZToyLCBcCisgICAg
ZGVueSwgXAorICAgIHN0YXR1czo0MDMsIFwKKyAgICBtc2c6J0Jsb2NrZWQgcmVxdWVzdCB3aXRo
IGZvcmJpZGRlbiBrZXl3b3JkIGluIFVSSS4nIgpkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2UvdGVzdF9uZ2lueF9tb2RzZWN1cml0eS9vdmVybGF5L2V0Yy9uZ2lueC9u
Z2lueC5jb25mIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9uZ2lueF9tb2Rz
ZWN1cml0eS9vdmVybGF5L2V0Yy9uZ2lueC9uZ2lueC5jb25mCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAuLjNkMWI5OTA1NTcKLS0tIC9kZXYvbnVsbAorKysgYi9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X25naW54X21vZHNlY3VyaXR5L292ZXJsYXkvZXRj
L25naW54L25naW54LmNvbmYKQEAgLTAsMCArMSwxNSBAQAorZXZlbnRzIHsKKyAgICB3b3JrZXJf
Y29ubmVjdGlvbnMgMTAyNDsKK30KKworaHR0cCB7CisgICAgc2VydmVyIHsKKyAgICAgICAgbW9k
c2VjdXJpdHkgb247CisgICAgICAgIGxpc3RlbiA4MDsKKyAgICAgICAgbG9jYXRpb24gLyB7Cisg
ICAgICAgICAgICByb290ICAgaHRtbDsKKyAgICAgICAgICAgIGluZGV4ICBpbmRleC5odG1sIGlu
ZGV4Lmh0bTsKKyAgICAgICAgICAgIG1vZHNlY3VyaXR5X3J1bGVzX2ZpbGUgL2V0Yy9uZ2lueC9t
b2RzZWN1cml0eS1ydWxlcy5jb25mOworICAgICAgICB9CisgICAgfQorfQotLSAKMi40OS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
