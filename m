Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEF4C3ABC3
	for <buildroot@archiver.kernel.org>; Sat, 10 May 2025 20:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11BA981365;
	Sat, 10 May 2025 20:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELlnq5CfhCLX; Sat, 10 May 2025 20:31:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47F6B81444
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47F6B81444;
	Sat, 10 May 2025 20:31:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4639FE0
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 297B460A39
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EH_rS2s-j8sF for <buildroot@buildroot.org>;
 Sat, 10 May 2025 20:31:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 02E67608DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02E67608DB
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02E67608DB
 for <buildroot@buildroot.org>; Sat, 10 May 2025 20:31:51 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-54b09cb06b0so4263064e87.1
 for <buildroot@buildroot.org>; Sat, 10 May 2025 13:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746909109; x=1747513909;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9scNFJiELuwIxzsMnsmJTQYrOl88mGxIk44Owz66C8g=;
 b=YrhAzqAeFLyASwiG9Ur9Kfe3M5S4qYGJvkUicqrd2Zu+0W1igX4tTLhtsVLVWs0t3i
 grOjJaihcC4VAvPdL4OsiN6qK/F393kePx536Wnh8akripx9cvbgAnH+HAM4EnGUPoDk
 wR1mmFpOenPcv2Yo+MeW2socnQoWitVNte9s9U/3V8obkqGbH2CnOL/vtVo1Iebchzqj
 8kP4AZRmKUwPP5uwrLsPN9RqAMumKprqYXAcixJ0KBk9QbeNv+y+H18n6IisuKHBhyN/
 RnEstr+Gj1LzOcB3Vf0df7AuA7deHppeLqgUmg6JL+LC5BG9A/8wmmJ9l5EiZSG5SQzX
 i4Ug==
X-Gm-Message-State: AOJu0Yw0EciIVLXKFvPsfZzJ6C6T7caO7M8gCTh78bU3rifeusSvtI7f
 PsvvOLps82wtIyRW1Hgry2yZSpOoOVfM2IloWZwhI7ab/Hh/tXUISr7wBFqY
X-Gm-Gg: ASbGnctkgcdQLXcDCIdYP8ixxkBXUktlB1WnIlT0tcseWj8lZhmz0eoi2BbOVTMUgD8
 HTMy/bX2yvepP53utLd8JIBn728me/34nUYWay7UHHrz53lHvmaJN3KWiseUoORJyjjllRdPYNX
 4Gi1NtereccTHZa1ZTQ4VTrJBHVmCr4ABmiaDMJ6YkXfigCUApzoFw9b/1w44xqZCmPwkkn9LUp
 A6FEo0VBhDiFHuZdvYfch2Eq5wVtcb31XW2ADRgfJ+orFZIGwqHXo6uMXomvh5cUthJhxqUlpP8
 GWfmdxP7m7cd9YmTtSxVUpYc4nPqhr2xBpjusbRLGM15aUmYiSodWWkUYeSnKkamT8Hwxnoy4ag
 ihYZFVv9/ug==
X-Google-Smtp-Source: AGHT+IGtGtKpM45ao7FN5xMp3D21wpqnH1vFkWVthD70Y8v6WzFwa6D3MYa0vdW0DHMJzHLX7FLcgA==
X-Received: by 2002:a05:6512:620c:b0:54f:c887:c7ca with SMTP id
 2adb3069b0e04-54fc887c812mr2054150e87.45.1746909108831; 
 Sat, 10 May 2025 13:31:48 -0700 (PDT)
Received: from tollan.lan (b106.broadband9.quicknet.se. [194.132.233.106])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645cf27sm810561e87.88.2025.05.10.13.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 May 2025 13:31:47 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Sat, 10 May 2025 22:31:21 +0200
Message-ID: <20250510203122.1916485-6-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510203122.1916485-1-lazzer@gmail.com>
References: <20250510203122.1916485-1-lazzer@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746909109; x=1747513909; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9scNFJiELuwIxzsMnsmJTQYrOl88mGxIk44Owz66C8g=;
 b=W0I4l86Pbl+6kVRt4MibKZq8i59QjJUBQUJfq00+3IIIvqTpvE8SV9PU4Z/bURyxrW
 F/9BYDc/x57m0BgFn7rPwDCQhyZvf2EAt26G96i6g8oR6ab4YcNs/v6XgEJCjJoLeZwU
 9dqqRXwpcp1xpwPNAGTroVIAuPwqombqUQwHJ0syX7lu0kQZI8tH8LGWBshHkLiLUYOz
 G213vbGq0Fewqf9orWpUq/Mxahdmbmt1o/oiwJS7cr0Hxo/Qr3YyjypiVLzjUL0gYAb7
 haMjlOyR1+7BXN9zJ/vOjV8ciZp7lP1B7NUaQsh3rwHmsQK6ArTH/LteN5VK9BUN+2Tp
 jjmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W0I4l86P
Subject: [Buildroot] [PATCH v2 5/5] package/libnetconf2: Update dependencies
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

U2luY2UgbGlibmV0Y29uZjIgaXMgcG9zc2libGUgdG8gYnVpbGQgd2l0aG91dApPcGVuU1NMIGFz
IGxvbmcgYXMgRU5BQkxFX1NTSF9UTFMgaXMgbm90IHNldCwKYWRkaW5nIG9wdGlvbiBCUjJfUEFD
S0FHRV9MSUJORVRDT05GMl9TU0hfVExTIHRvCm9wdC1pbiB0aGlzIGZlYXR1cmUuCgpTaWduZWQt
b2ZmLWJ5OiBNYXR0aWFzIFdhbHN0csO2bSA8bGF6emVyQGdtYWlsLmNvbT4KLS0tCiBwYWNrYWdl
L2xpYm5ldGNvbmYyL0NvbmZpZy5pbiAgICAgIHwgIDcgKysrKysrKwogcGFja2FnZS9saWJuZXRj
b25mMi9saWJuZXRjb25mMi5tayB8IDEzICsrKysrKysrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwg
MTYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xp
Ym5ldGNvbmYyL0NvbmZpZy5pbiBiL3BhY2thZ2UvbGlibmV0Y29uZjIvQ29uZmlnLmluCmluZGV4
IDE3NjMyNDMxMjAuLjFiYTIxNDk2YjYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlibmV0Y29uZjIv
Q29uZmlnLmluCisrKyBiL3BhY2thZ2UvbGlibmV0Y29uZjIvQ29uZmlnLmluCkBAIC0xMiw2ICsx
MiwxMyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTElCTkVUQ09ORjIKIAogCSAgaHR0cHM6Ly9naXRo
dWIuY29tL0NFU05FVC9saWJuZXRjb25mMgogCitpZiBCUjJfUEFDS0FHRV9MSUJORVRDT05GMgor
Y29uZmlnIEJSMl9QQUNLQUdFX0xJQk5FVENPTkYyX1NTSF9UTFMKKwlib29sICJTU0gvVExTIHN1
cHBvcnQiCisJc2VsZWN0IEJSMl9QQUNLQUdFX09QRU5TU0wgaWYgIUJSMl9QQUNLQUdFX01CRURU
TFMKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCQ1VSTAorCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJT
U0gKK2VuZGlmCiBjb21tZW50ICJsaWJuZXRjb25mMiBuZWVkcyBhIHRvb2xjaGFpbiB3LyB0aHJl
YWRzLCBkeW5hbWljIGxpYnJhcnkiCiAJZGVwZW5kcyBvbiBCUjJfVVNFX01NVQogCWRlcGVuZHMg
b24gQlIyX1RPT0xDSEFJTl9IQVNfU1lOQ180CmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm5ldGNv
bmYyL2xpYm5ldGNvbmYyLm1rIGIvcGFja2FnZS9saWJuZXRjb25mMi9saWJuZXRjb25mMi5tawpp
bmRleCAwZDc0YmQ3MzZkLi5hOGMyOGIzZWNlIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm5ldGNv
bmYyL2xpYm5ldGNvbmYyLm1rCisrKyBiL3BhY2thZ2UvbGlibmV0Y29uZjIvbGlibmV0Y29uZjIu
bWsKQEAgLTIzLDExICsyMywxNiBAQCBlbHNlCiBMSUJORVRDT05GMl9DT05GX09QVFMgKz0gLURF
TkFCTEVfU1NIPU9GRgogZW5kaWYKIAotaWZlcSAoJChCUjJfUEFDS0FHRV9MSUJPUEVOU1NMKSwg
eSkKLUxJQk5FVENPTkYyX0NPTkZfT1BUUyArPSAtREVOQUJMRV9UTFM9T04KK2lmZXEgKCQoQlIy
X1BBQ0tBR0VfTElCTkVUQ09ORjJfU1NIX1RMUykseSkKK0xJQk5FVENPTkYyX0NPTkZfT1BUUyAr
PSAtREVOQUJMRV9TU0hfVExTPU9OCitMSUJORVRDT05GMl9ERVBFTkRFTkNJRVMgKz0gbGliY3Vy
bAoraWZlcSAoJChCUjJfUEFDS0FHRV9NQkVEVExTKSx5KQorTElCTkVUQ09ORjJfREVQRU5ERU5D
SUVTICs9IG1iZWR0bHMKK2Vsc2UKIExJQk5FVENPTkYyX0RFUEVOREVOQ0lFUyArPSBvcGVuc3Ns
CitlbmRpZgogZWxzZQotTElCTkVUQ09ORjJfQ09ORl9PUFRTICs9IC1ERU5BQkxFX1RMUz1PRkYK
K0xJQk5FVENPTkYyX0NPTkZfT1BUUyArPSAtREVOQUJMRV9TU0hfVExTPU9GRgogZW5kaWYKIAog
aWZlcSAoJChCUjJfUEFDS0FHRV9MSUJYQ1JZUFQpLHkpCkBAIC0zOCw3ICs0Myw3IEBAIEhPU1Rf
TElCTkVUQ09ORjJfQ09ORl9PUFRTID0gXAogCS1ERU5BQkxFX1RFU1RTPU9GRiBcCiAJLURFTkFC
TEVfVkFMR1JJTkRfVEVTVFM9T0ZGIFwKIAktREVOQUJMRV9TU0g9T0ZGIFwKLQktREVOQUJMRV9U
TFM9T0ZGCisJLURFTkFCTEVfU1NIX1RMUz1PRkYKIAogJChldmFsICQoY21ha2UtcGFja2FnZSkp
CiAkKGV2YWwgJChob3N0LWNtYWtlLXBhY2thZ2UpKQotLSAKMi40My4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
