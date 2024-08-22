Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9175CC3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 13:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BA8860E24;
	Thu, 22 Aug 2024 13:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hbzzd70Y9ARV; Thu, 22 Aug 2024 13:02:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 058DF60DE5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 058DF60DE5;
	Thu, 22 Aug 2024 13:02:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C9E891BF3DF
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 13:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6E76606F8
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 13:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o9aHZqVeplMu for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 13:02:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8CD4D60655
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CD4D60655
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CD4D60655
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 13:02:27 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2f3eabcd293so9016531fa.2
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 06:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724331745; x=1724936545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=APyGX6meR3GTtQ7pyAAsmkLeGIaGDnpGv+Tlogv+hVY=;
 b=vaCT9zFbgy8JYIms+HBe/tc8kmShZ5ssmw7sAmVQyqmxRKHKQmcE/jC7WoMff2YNoh
 KluL437uPXY+w5laKf4BPHIvKFGED+FWh3IkV/yGJbeOJf1otKXrZs/tiLVe6C9S5XpQ
 sURrr96oqdmhpOZOvtID8VoASBmyV99eAyGSq/g9tzRIVt6NmodnF+O4PsfiVgo6bI9d
 ihvm2zNAIN3Mf7Df+sWL9mYQ84PC7+k9rypfu0zIukqGhaFHnthd+U2mLQmWDoazjO40
 IAi9zvSViAnaiv4wmn/NE0ab8uqRQ6HGPJrrrOtT2Gd1FWFfAnaUuKaYZ3TfFpqm4aP/
 3X1g==
X-Gm-Message-State: AOJu0Yy4dKY7cvw9sTlBIYquR/9XUdDWoouN+U1qP9ufNWHltUAdccTs
 8U6FTlAWFRpYexkPEbIK/KQpxxi8W8GsGWntYj7So404oI5AVyTu3Mz2qTlpa8pbqqhBKiE8fjc
 c
X-Google-Smtp-Source: AGHT+IG3EIVWIF3qC7KNjprW34Hb/Dj+X+aC8t2W2OwXOrbXbjw84F+1rHJZqzqeT+guUhSghJp0cw==
X-Received: by 2002:a05:651c:153:b0:2f3:eabc:d26a with SMTP id
 38308e7fff4ca-2f405d9d8b5mr9867731fa.23.1724331743107; 
 Thu, 22 Aug 2024 06:02:23 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a3c9dcesm911352a12.30.2024.08.22.06.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 06:02:22 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1C6D75F930;
 Thu, 22 Aug 2024 14:02:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 14:02:18 +0100
Message-Id: <20240822130220.4135741-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822130220.4135741-1-alex.bennee@linaro.org>
References: <20240822130220.4135741-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724331745; x=1724936545; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=APyGX6meR3GTtQ7pyAAsmkLeGIaGDnpGv+Tlogv+hVY=;
 b=Lmu/gdqkEtlS62vwk2Il3w1MUGUYFoolVkq3OEEUN8lhIdzo7UneLXm0/8YWL7HnF2
 cCnuh6a1+5djLw1VKjQlj16Hwuv6zsQwz7L1KbEMZ3uXwzBoKR7jMNKiNCK/M+l+u2uX
 GwZCLr6jGV8japM8SRJS816Ajvg2cEkasMrSz5T0RYnW1ISukus6NxjvvlHIs5C17GWN
 4jf8jw/wHZbTrHf9Qj8/YhGJ32kbkrI7HinMiLs5TgksWrm9X+rQIwmxdnfOdH2JiI4I
 B15c2udp07ul09g33jD6cWFnk34X7ZTMN1gi8VQAkx0SrjFyzUP/w/B7yVLMdrgGgXVB
 Z3JQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=Lmu/gdqk
Subject: [Buildroot] [PATCH 2/4] package/vkmark: add vmkark benchmarking tool
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2UgYnVpbGQgZnJvbSB0aGUgY3VycmVudCBtYXN0ZXIgYXMgd2UgbmVlZCBmYWlybHkgdXB0byBk
YXRlIGJpdHMgZm9yCmNyb3NzIGNvbXBpbGUgc3VwcG9ydC4KClNpZ25lZC1vZmYtYnk6IEFsZXgg
QmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KLS0tCiBwYWNrYWdlL0NvbmZpZy5pbiAg
ICAgICAgICB8ICAxICsKIHBhY2thZ2UvdmttYXJrL0NvbmZpZy5pbiAgIHwgMzkgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHBhY2thZ2UvdmttYXJrL3ZrbWFyay5oYXNo
IHwgIDMgKysrCiBwYWNrYWdlL3ZrbWFyay92a21hcmsubWsgICB8IDI4ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS92a21hcmsvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS92a21hcmsvdmttYXJrLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Zr
bWFyay92a21hcmsubWsKCmRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2Uv
Q29uZmlnLmluCmluZGV4IGYyYzYzZmZiNmUuLmRkMTZkYzg1NTYgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvQ29uZmlnLmluCkBAIC0zMjQsNiArMzI0LDcgQEAg
Y29tbWVudCAiR3JhcGhpYyBhcHBsaWNhdGlvbnMiCiAJc291cmNlICJwYWNrYWdlL2Zzd2ViY2Ft
L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvZ2hvc3RzY3JpcHQvQ29uZmlnLmluIgogCXNv
dXJjZSAicGFja2FnZS9nbG1hcmsyL0NvbmZpZy5pbiIKKwlzb3VyY2UgInBhY2thZ2UvdmttYXJr
L0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvZ2xzbHNhbmRib3gtcGxheWVyL0NvbmZpZy5p
biIKIAlzb3VyY2UgInBhY2thZ2UvZ251cGxvdC9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdl
L2lndC1ncHUtdG9vbHMvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS92a21hcmsvQ29u
ZmlnLmluIGIvcGFja2FnZS92a21hcmsvQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLjE1ZDhlMzgwZWQKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3Zr
bWFyay9Db25maWcuaW4KQEAgLTAsMCArMSwzOSBAQAorY29uZmlnIEJSMl9QQUNLQUdFX1ZLTUFS
S19GTEFWT1JfQU5ZCisJYm9vbAorCitjb25maWcgQlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZPUl9L
TVMKKwlib29sCisJZGVmYXVsdCB5CisJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IQVNfTElCR0JN
CisJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkRSTQorICAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0Vf
VktNQVJLX0ZMQVZPUl9BTlkKKworY29uZmlnIEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFWT1JfV0FZ
TEFORAorCWJvb2wKKwlkZWZhdWx0IG4KKwlzZWxlY3QgQlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZP
Ul9BTlkKKworY29uZmlnIEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFWT1JfWDExCisJYm9vbAorCWRl
ZmF1bHQgbgorCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJYQ0IKKyAgICAgICAgc2VsZWN0IEJSMl9Q
QUNLQUdFX1ZLTUFSS19GTEFWT1JfQU5ZCisKK2NvbmZpZyBCUjJfUEFDS0FHRV9WS01BUksKKwli
b29sICJ2a21hcmsiCisJZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJTVERDUFAKKwlkZXBlbmRz
IG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRfOSAjIEMrKzE0CisJZGVwZW5kcyBvbiBC
UjJfUEFDS0FHRV9WS01BUktfRkxBVk9SX0FOWQorCXNlbGVjdCBCUjJfUEFDS0FHRV9WVUxLQU5f
SEVBREVSUworCXNlbGVjdCBCUjJfUEFDS0FHRV9WVUxLQU5fTE9BREVSCisJc2VsZWN0IEJSMl9Q
QUNLQUdFX0dMTQorCXNlbGVjdCBCUjJfUEFDS0FHRV9BU1NJTVAKKwlzZWxlY3QgQlIyX1BBQ0tB
R0VfV0FZTEFORF9QUk9UT0NPTFMgaWYgQlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZPUl9XQVlMQU5E
CisJaGVscAorCSAgdm1tYXJrIGlzIGFuIFZ1bGthbiBHUFUgYmVuY2htYXJrLgorCisJICBodHRw
czovL2dpdGh1Yi5jb20vdmttYXJrL3ZrbWFyaworCitjb21tZW50ICJ2a21hcmsgbmVlZHMgYSB0
b29sY2hhaW4gdy8gQysrLCBkeW5hbWljIGxpYnJhcnksIHRocmVhZHMiCisJZGVwZW5kcyBvbiAh
QlIyX0lOU1RBTExfTElCU1REQ1BQIHx8IEJSMl9TVEFUSUNfTElCUyB8fCBcCisJCSFCUjJfVE9P
TENIQUlOX0hBU19USFJFQURTCmRpZmYgLS1naXQgYS9wYWNrYWdlL3ZrbWFyay92a21hcmsuaGFz
aCBiL3BhY2thZ2UvdmttYXJrL3ZrbWFyay5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAuLjQ5NGQwYzQ4MDgKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3ZrbWFy
ay92a21hcmsuaGFzaApAQCAtMCwwICsxLDMgQEAKKyMgTG9jYWxseSBjb21wdXRlZAorc2hhMjU2
ICA5ZjEwNmE2N2NlMWUyYWE0MTQwYmJmOTMyNWNjNTgzNzE1N2Q2NGY5NDU1MzRiYzllNTcyODZk
NjkwYjA4MzQ2ICB2a21hcmstMjAxNy4wOC50YXIuZ3oKK3NoYTI1NiAgZDA4MTQzZTg4MjhkNWI5
ZWQwMDVjYjZkY2VmNGQ4OGE0OWRmMGFjNGM5ZTEzNTZhY2U3MzliNDQ5YzE2NWY1NCAgdmttYXJr
LWFiNmU2ZjM0MDc3NzIyZDVhZTMzZjZiZDQwYjE4ZWY5YzBlOTlhMTUudGFyLmd6CmRpZmYgLS1n
aXQgYS9wYWNrYWdlL3ZrbWFyay92a21hcmsubWsgYi9wYWNrYWdlL3ZrbWFyay92a21hcmsubWsK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMTlkNzk2YTliMAotLS0gL2Rl
di9udWxsCisrKyBiL3BhY2thZ2UvdmttYXJrL3ZrbWFyay5tawpAQCAtMCwwICsxLDI4IEBACisj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyB2a21hcmsKKyMKKyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCisKK1ZLTUFSS19WRVJTSU9OID0gYWI2ZTZmMzQwNzc3MjJkNWFlMzNmNmJkNDBiMThl
ZjljMGU5OWExNQorVktNQVJLX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHZrbWFyayx2a21hcmssJChW
S01BUktfVkVSU0lPTikpCitWS01BUktfTElDRU5TRSA9IExHUEwtMi4xCitWS01BUktfTElDRU5T
RV9GSUxFUyA9IENPUFlJTkctTEdQTDIuMQorVktNQVJLX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtn
Y29uZiB2dWxrYW4taGVhZGVycyB2dWxrYW4tbG9hZGVyIGdsbQorCitpZmVxICgkKEJSMl9QQUNL
QUdFX1ZLTUFSS19GTEFWT1JfS01TKSx5KQorVktNQVJLX0RFUEVOREVOQ0lFUyArPSBsaWJkcm0g
bGliZ2JtCitWS01BUktfQ09ORl9PUFRTICs9IC1Ea21zPXRydWUKK2VuZGlmCisKK2lmZXEgKCQo
QlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZPUl9XQVlMQU5EKSx5KQorVktNQVJLX0RFUEVOREVOQ0lF
UyArPSB3YXlsYW5kIHdheWxhbmQtcHJvdG9jb2xzCitWS01BUktfQ09ORl9PUFRTICs9IC1Ed2F5
bGFuZD10cnVlCitlbmRpZgorCitpZmVxICgkKEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFWT1JfWDEx
KSx5KQorVktNQVJLX0RFUEVOREVOQ0lFUyArPSBsaWJ4Y2IKK1ZLTUFSS19DT05GX09QVFMgKz0g
LUR4Y2I9dHJ1ZQorZW5kaWYKKworJChldmFsICQobWVzb24tcGFja2FnZSkpCi0tIAoyLjM5LjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
