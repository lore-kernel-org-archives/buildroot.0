Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00F5C3ABCB
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 17:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 918EF4083E;
	Mon, 12 May 2025 17:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hrU6Ipf94kTj; Mon, 12 May 2025 17:35:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C219440911
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C219440911;
	Mon, 12 May 2025 17:35:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 88527150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E3D0607E5
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XbyGpgolfYkc for <buildroot@buildroot.org>;
 Mon, 12 May 2025 17:35:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1664660596
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1664660596
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1664660596
 for <buildroot@buildroot.org>; Mon, 12 May 2025 17:35:17 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-54b09cb06b0so6302868e87.1
 for <buildroot@buildroot.org>; Mon, 12 May 2025 10:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747071314; x=1747676114;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rhOhr3njkX6m2uzLh6vQAE2WWojFrj6geCpXeJ4uYac=;
 b=TPq+gFkRC7yg/MvD2DSgykqN+hPvPTVYCKodUhFkqAXXS2kfZ/wqqzXGje0cW411Sa
 TiWqKXzeBI20JQFCTCQ7pyN/bUYN8LlqI3qTh492sVN3QA3A8V5BYdM/snd+h7tyMDuO
 XYX0/6+L8ZcvNejqzAsNOHa0+R1HVuwdT9GkmRd11N0hCdFZZi6F0YkZ48f+z6sD+/2B
 j4yu5W5kDsMIaEt+rNSBFCzH9eyVTTbgR5IWlsPdrzi/Uf1AOJ002bfEzDKolmjf3tFH
 Fg3BK+ArVsqPeCxQ6i1q2avoN34qkjzUKVdBnjx7B80dmGN2tH6tciSK8TlzfwJKPY1o
 rTCQ==
X-Gm-Message-State: AOJu0Yx/2q14I0vGq5Coa4DnoZPvVN0NlGyVPJdeS5ZwThwYDiBuA4Dm
 VxEAwsjI2S6BDsm9QrXjnUtoaGPiE6+xEzbbnnyGP/UPHmdaWzPKSpbshwzv
X-Gm-Gg: ASbGncski8s3N+XajtAtLmGWLS7zlWiD1qss3MEZ2xW3a5bQHH460WmpfTEREE4qW/e
 gWyoydhMM2VW0v56Z86kPtWiKZMB4fDIjpQas2xOjlghmaZTBbjIClyHnwoEUogZQU1D0zablK9
 pHQSqGW8WQ30xFzHE2o1foq/f16dhptiCIfgl0dv09YPHwuUswgC1FYW59FVIaH7NeAmF5Gm8r2
 Ke9DcoxPyA5VwHhRaziM92AC3Me2DJh/N7jXyK9twMn6w+Y2DnXJyVK+49Kk161C/2kIWjL4Hly
 TSy+SITQMjZXueHIz2z0D/4ttczzmy0v56mWbOy1S62YxngXiL66AwuPh+CNZHUKbV1YlUB3Ffi
 J26bE9lrjGA==
X-Google-Smtp-Source: AGHT+IG7X63FQ+lCcWrvts1Vr/LHssNcplJdLUVt3fjR6INrdhOTHaAjb44G+zxNRtIflaQAauvpIw==
X-Received: by 2002:a05:6512:660d:b0:549:8ed4:fb46 with SMTP id
 2adb3069b0e04-54fc67cbc4bmr3691702e87.26.1747071314117; 
 Mon, 12 May 2025 10:35:14 -0700 (PDT)
Received: from tollan.lan (b106.broadband9.quicknet.se. [194.132.233.106])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc645d93asm1582086e87.101.2025.05.12.10.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 10:35:13 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Mon, 12 May 2025 19:35:03 +0200
Message-ID: <20250512173506.3179898-4-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512173506.3179898-1-lazzer@gmail.com>
References: <20250512173506.3179898-1-lazzer@gmail.com>
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747071314; x=1747676114; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rhOhr3njkX6m2uzLh6vQAE2WWojFrj6geCpXeJ4uYac=;
 b=lztSvN+Ilos6SMMkhNvTuc6ZKk1nVcKKllilXz6j6/XPuWTm3yToi3qhNJKOJ4GfjH
 41zHiropRaiOAGPvJpq6qPSyDj/HVrI46CRoM0pHKS7Xedas2L95O2im6FPjoKleNEOJ
 04+Gqk8cj86RECIaj0IDLDYmjXUsGzeiTVUMWosPpRs2qJHmOXgcF52on9MfaBJFjOxG
 U3MuBI23mYG4/GEUir8OwdXXl16lDsMaxvbSMBEYha0PHb+WX6W9K9/CrJL2SZEfUPeH
 7j5zDzcaXGtUI4SCJDIwsuHu8S9qUsxvOx+gcsbsQcLFvu3wtWxrImszn3+rEg32wm9u
 SlIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lztSvN+I
Subject: [Buildroot] [PATCH v3 3/6] package/libnetconf2: bump to version
 3.7.1
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

Q2hhbmdlbG9nOgogIGVycm9yLXBhdGggZGF0YSBub2RlCiAgIG5vdyB1c2luZyBwcm9wZXIgZm9y
bWF0IHNvIGluIHJwYy1yZXBseSB1c2VzIFhNTCBYUGF0aCBmb3JtYXQgaW5zdGVhZCBvZiBKU09O
CiAgc2V2ZXJhbCBidWdmaXhlcyBhbmQgaW1wcm92ZW1lbnRzCgpEZXBlbmQgb24gbGlieWFuZyB2
My4xMi4yIGh0dHBzOi8vZ2l0aHViLmNvbS9DRVNORVQvbGlieWFuZy9yZWxlYXNlcy90YWcvdjMu
MTIuMgoKU2lnbmVkLW9mZi1ieTogTWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+
Ci0tLQogcGFja2FnZS9saWJuZXRjb25mMi9saWJuZXRjb25mMi5oYXNoIHwgMiArLQogcGFja2Fn
ZS9saWJuZXRjb25mMi9saWJuZXRjb25mMi5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJu
ZXRjb25mMi9saWJuZXRjb25mMi5oYXNoIGIvcGFja2FnZS9saWJuZXRjb25mMi9saWJuZXRjb25m
Mi5oYXNoCmluZGV4IDY3NWM3NmE1MDAuLjJkNjM5NGU4MWIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
bGlibmV0Y29uZjIvbGlibmV0Y29uZjIuaGFzaAorKysgYi9wYWNrYWdlL2xpYm5ldGNvbmYyL2xp
Ym5ldGNvbmYyLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hh
MjU2ICA3MmU5YTY0NjFmYWRiZDIyZjBjZjBkMjNiYTY4ZDYyYjI5N2M4ZjU2NGY3ZjJiZWUwNjk3
NDhmYjY3ZmMzYTI0ICBsaWJuZXRjb25mMi0yLjEuMjgudGFyLmd6CitzaGEyNTYgIGM5NWMwMGFk
ODg3Mjk1ZDFmYTMxMDk4Yzg1OWM3NGUzMzBlZWFkNzhiMmVlZThkMDA4NzAxYWYyZDlkZjgwZTUg
IGxpYm5ldGNvbmYyLTMuNy4xLnRhci5negogc2hhMjU2ICBiZDk2MmFiNDU3YzhhOGNiOGZhYWFh
MzZjMTE0ODQ2ODBmM2M5YTQ3ZGJjMzM2NTA3ODE3YWU4OTM1Mzg0MDY0ICBMSUNFTlNFCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2xpYm5ldGNvbmYyL2xpYm5ldGNvbmYyLm1rIGIvcGFja2FnZS9saWJu
ZXRjb25mMi9saWJuZXRjb25mMi5tawppbmRleCA4ODE2MzkyNmMwLi4wZDc0YmQ3MzZkIDEwMDY0
NAotLS0gYS9wYWNrYWdlL2xpYm5ldGNvbmYyL2xpYm5ldGNvbmYyLm1rCisrKyBiL3BhY2thZ2Uv
bGlibmV0Y29uZjIvbGlibmV0Y29uZjIubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwogCi1MSUJORVRDT05GMl9WRVJTSU9OID0gMi4xLjI4CitMSUJORVRDT05G
Ml9WRVJTSU9OID0gMy43LjEKIExJQk5FVENPTkYyX1NJVEUgPSAkKGNhbGwgZ2l0aHViLENFU05F
VCxsaWJuZXRjb25mMix2JChMSUJORVRDT05GMl9WRVJTSU9OKSkKIExJQk5FVENPTkYyX0lOU1RB
TExfU1RBR0lORyA9IFlFUwogTElCTkVUQ09ORjJfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQotLSAK
Mi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
