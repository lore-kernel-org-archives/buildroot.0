Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC186C48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 19:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C199820C4;
	Sun, 18 Feb 2024 19:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KoL6WE-2VHPY; Sun, 18 Feb 2024 19:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F66A82100
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F66A82100;
	Sun, 18 Feb 2024 19:31:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B56291BF83B
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 19:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A14D1400C8
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 19:31:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5jztYWAsKvZF for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 19:31:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=nunog@fr24.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2DEEC400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DEEC400B5
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DEEC400B5
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 19:31:34 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-412610fb006so3026195e9.1
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 11:31:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708284693; x=1708889493;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r24fV99dCRkJuPK1481AoBRC/5aRw8c3QunDxxv5PZY=;
 b=rwPRepYVkCV2cMxZ2r5nrGQEaMwkJWw362BroQENeW0KaF0+SrAgdWsoHuojNWZeH4
 WsV9Ndod8lpl1/eulOtWGyrOxrZ/B3mYffU0p10/oJgmBbCg8jupYk5g6VcD+zK6BrGq
 f4vmyWS3kiwVNpP8lflzFZ6lPTL54w/1rIdBxo+5oH8JN/FqQ70ypaNhguOrlCjLg+nX
 JWJEgejjIZ74zoBHEB4K0piYf+xb5eLDV44cZbMDi/FBBhumyJWSmtlmqdbhkVlxx//0
 1JEt8TvwTbG1wEsr/o2ZB3vp+EHAcoJA8lV08h0m0tAmPtUtSLRUGU7OUFU2xtaoiRsD
 T4ZQ==
X-Gm-Message-State: AOJu0YxmdA0Gk6Lpj4jaE0wAwCWLAv6M/nvczTGe8BXELYMDcWCvpc6e
 TF0tcmuEzVVs5nclsb61i+8+D0va/xPwjckK7p0wAO+0PSrDdOHYDCdPnFPMpLko8l7KwLcMEjG
 Mvts=
X-Google-Smtp-Source: AGHT+IEu2MFkS1e5pjVMoYMehBm5Wkl21UjPm7Uu1xAeeYeJF7TGxwLW4p9mfyQLs2EZEpN5mKRgXQ==
X-Received: by 2002:a05:600c:3b10:b0:411:aa3c:128d with SMTP id
 m16-20020a05600c3b1000b00411aa3c128dmr12266443wms.15.1708284692656; 
 Sun, 18 Feb 2024 11:31:32 -0800 (PST)
Received: from sky20.internal.fr24.com (bl19-45-33.dsl.telepac.pt.
 [2.80.45.33]) by smtp.googlemail.com with ESMTPSA id
 k10-20020a7bc40a000000b004101f27737asm9057369wmi.29.2024.02.18.11.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Feb 2024 11:31:32 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun, 18 Feb 2024 19:30:55 +0000
Message-ID: <20240218193112.1048370-1-nunog@fr24.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fr24.com; s=google; t=1708284693; x=1708889493; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r24fV99dCRkJuPK1481AoBRC/5aRw8c3QunDxxv5PZY=;
 b=dyW+HOFGMZXXFAT2Xqk5c8wAL+jPpiRY6JDTe2ZJ0Jb2DPZROZDQC4U/swfuun+7EK
 t3Iguiq7Hr97TcafAFHmARtuKx6swX7m6OTJY+/2CFz+Oxn50jDdpwiT5MadjJv8zo1m
 QjbS6dQ/LLXRyiAHcXAujMoVMAV33eRNG30sLqtUM99g8B33i+tBaaK2qK8sXFXWXiv3
 kkmHbbfvY9eWUWnBcNfBgccpAfc4v0iH0/lV5u58u7BUsETk+dQGo51Dvi+VcA2R+WUX
 JA2MgEKrUDp/I6Y9X7ZxVWjsOqYvel8GdPjvBLULnA2gd88fd9WOwo0vSSY7RmWAi5Rv
 bCNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=fr24.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=fr24.com header.i=@fr24.com header.a=rsa-sha256
 header.s=google header.b=dyW+HOFG
Subject: [Buildroot] [PATCH] package/google-breakpad: fix tools option
 identation in menuconfig
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
From: =?utf-8?q?Nuno_Gon=C3=A7alves_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
Cc: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TW92ZSBjb21tZW50IGluIENvbmZpZy5pbiB0byBlbmQgb2YgZmlsZSBzbyB0aGF0CkJSMl9QQUNL
QUdFX0dPT0dMRV9CUkVBS1BBRF9UT09MUyBpcyBwcm9wZXJseSBpZGVudGVkLgoKU2lnbmVkLW9m
Zi1ieTogTnVubyBHb27Dp2FsdmVzIDxudW5vZ0BmcjI0LmNvbT4KLS0tCiBwYWNrYWdlL2dvb2ds
ZS1icmVha3BhZC9Db25maWcuaW4gfCAxNiArKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
Z29vZ2xlLWJyZWFrcGFkL0NvbmZpZy5pbiBiL3BhY2thZ2UvZ29vZ2xlLWJyZWFrcGFkL0NvbmZp
Zy5pbgppbmRleCAwZDIxZmQyZTVjLi41YzdmNGJiN2JhIDEwMDY0NAotLS0gYS9wYWNrYWdlL2dv
b2dsZS1icmVha3BhZC9Db25maWcuaW4KKysrIGIvcGFja2FnZS9nb29nbGUtYnJlYWtwYWQvQ29u
ZmlnLmluCkBAIC0zNSwxNCArMzUsNiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfR09PR0xFX0JSRUFL
UEFECiAKIAkgIGh0dHBzOi8vY2hyb21pdW0uZ29vZ2xlc291cmNlLmNvbS9icmVha3BhZC9icmVh
a3BhZAogCi1jb21tZW50ICJnb29nbGUtYnJlYWtwYWQgcmVxdWlyZXMgYSBnbGliYyB0b29sY2hh
aW4gdy8gd2NoYXIsIHRocmVhZCwgQysrLCBnY2MgPj0gNC44IgotCWRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfR09PR0xFX0JSRUFLUEFEX0FSQ0hfU1VQUE9SVFMKLQlkZXBlbmRzIG9uIEJSMl9QQUNL
QUdFX0hPU1RfR09PR0xFX0JSRUFLUEFEX0FSQ0hfU1VQUE9SVFMKLQlkZXBlbmRzIG9uICFCUjJf
SU5TVEFMTF9MSUJTVERDUFAgfHwgIUJSMl9VU0VfV0NIQVIgfHwgXAotCQkhQlIyX1RPT0xDSEFJ
Tl9IQVNfVEhSRUFEUyB8fCBcCi0JCSFCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMgfHwgXAotCQkh
QlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF84Ci0KIGlmIEJSMl9QQUNLQUdFX0dPT0dMRV9C
UkVBS1BBRAogCiBjb25maWcgQlIyX1BBQ0tBR0VfR09PR0xFX0JSRUFLUEFEX1RPT0xTCkBAIC01
MiwzICs0NCwxMSBAQCBjb25maWcgQlIyX1BBQ0tBR0VfR09PR0xFX0JSRUFLUEFEX1RPT0xTCiAJ
ICBtaW5pZHVtcF9zdGFja3dhbGsgYW5kIG1pY3JvZHVtcF9zdGFja3dhbGsuCiAKIGVuZGlmCisK
K2NvbW1lbnQgImdvb2dsZS1icmVha3BhZCByZXF1aXJlcyBhIGdsaWJjIHRvb2xjaGFpbiB3LyB3
Y2hhciwgdGhyZWFkLCBDKyssIGdjYyA+PSA0LjgiCisJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9H
T09HTEVfQlJFQUtQQURfQVJDSF9TVVBQT1JUUworCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9T
VF9HT09HTEVfQlJFQUtQQURfQVJDSF9TVVBQT1JUUworCWRlcGVuZHMgb24gIUJSMl9JTlNUQUxM
X0xJQlNURENQUCB8fCAhQlIyX1VTRV9XQ0hBUiB8fCBcCisJCSFCUjJfVE9PTENIQUlOX0hBU19U
SFJFQURTIHx8IFwKKwkJIUJSMl9UT09MQ0hBSU5fVVNFU19HTElCQyB8fCBcCisJCSFCUjJfVE9P
TENIQUlOX0dDQ19BVF9MRUFTVF80XzgKLS0gCjIuNDMuMgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
