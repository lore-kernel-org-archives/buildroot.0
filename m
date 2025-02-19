Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A272C021B0
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 11:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E514D70909;
	Wed, 19 Feb 2025 11:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G2643eM1bwcX; Wed, 19 Feb 2025 11:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1237770963
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1237770963;
	Wed, 19 Feb 2025 11:25:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97923127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 11:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8586C4269A
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 11:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rnCugq1Fhik2 for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 11:25:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A45642683
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A45642683
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A45642683
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 11:25:37 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43989226283so19680255e9.1
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 03:25:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739964335; x=1740569135;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AnAeQfig3uLZ22RjbyIZhdqYUTzgpc9n+ZBE9TrPYxE=;
 b=nQFr1qbiJlDRyFAGCHdXCW947fkE/nmMnAwIOXfP9Q3HHfkBfxZb0MtlFRX09j/IlG
 VcJ93fsfCAq90xoRMS01iu9H18pvx2jq8TYRax5hpafg76aohozyCVsuglK4pd64VBv0
 ij4Joc1UQYprx93p1AvOrxL/ehNHW/e8fQrbHUugIvQTbSET21wm87RnnGprciR6PMIQ
 6a+xGdLglV0wsFyaLXrhfruLN19dl2nLwe+qVztukqb5dVm++PXyUogCJizhwHCmpkgJ
 QOEyTuYUCETpYB2DZp6X7JFkFTtJ5nZdIX5a9tI5tWKgFoA+6QFtair9oFhoqsafKUAa
 5C2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXt4zgOWYta3ZGzJtlCMdo0sSA5hUDDKyR3XmnmFhbJXY2HKEudsqTkhsl5Adt41mM2GDl+6CN24DY=@buildroot.org
X-Gm-Message-State: AOJu0YyGSF8tdupcFsjehpXVjsyUNdoyN4KHCMCOz9SDs/RnQUhALWQY
 qzkoh3EqGrlsG4Y54v0NQS2VP5SqkhHkgg7cStlZM4X+Wg2Bpnphd3a0ZtRjV4U=
X-Gm-Gg: ASbGncsjzkK0jAyynYhM2iIVSuOAIZIJ9/U8V84WllF6yaZa/w0Jvm42+Zl2fzYIJ9H
 pqRV7ln9xjoIVCO/Nto1rVXYrJhz9QCxHhNng9TLOxML3XEKsdZe3clMytb+7YRXNq3tBgGot/S
 GC0F3wQbhLdaGVfKAR94e0eu63OCjlU5C1kXpF7By7ZMZrHjXs/1d8vKErHD4r08NCUqp29tuZQ
 ht8WvwLJ9Vl8uadTfTMohFPfeH1CGbHNIoIEWK9pd6z1Q3ukHnZbFqB69yCewDJFCiQDGFVvjcL
 gXl31Yvkh5JPhfk1p9JR36+pLaHJF7F/7ySCscDZVHxZ2kWOIibYulLwHOShaP4JWPMdHueJtJE
 4BrR01gYYTBdgNFdidzBItZ5/TSIyP93v9gRVyigY5CaEH9+xHnw=
X-Google-Smtp-Source: AGHT+IGRZSGaL3kXS7hPUXgiXP2L5bWSdnR8LXbCM7jRsOGaafeY2lDXSI5D5qPHbFCWLZ32XRAzvw==
X-Received: by 2002:a05:6000:18a9:b0:38d:cf33:31d6 with SMTP id
 ffacd0b85a97d-38f33f11931mr17050413f8f.3.1739964335406; 
 Wed, 19 Feb 2025 03:25:35 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258dab74sm17821330f8f.32.2025.02.19.03.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 03:25:35 -0800 (PST)
Message-ID: <62dee40a-f683-49c9-b546-958943a589ca@smile.fr>
Date: Wed, 19 Feb 2025 12:25:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20250207204258.87410-1-yann.morin.1998@free.fr>
Content-Language: fr
In-Reply-To: <20250207204258.87410-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739964335; x=1740569135; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AnAeQfig3uLZ22RjbyIZhdqYUTzgpc9n+ZBE9TrPYxE=;
 b=ueiOq6b+wvUtj+PvRfArNaNFdX9C5+ns+9KXe4lsjzYYDOcZqMfKuA7kIw4Up/U9j8
 ggj+LP9+XLxlbDbqtTJAYJEq5h10iePYu5D0ZswGyy9D3eIpqWblL+MsQy3th8MpgcLl
 7bPgmt7AjaaZTiM46bOfQKfcZR9Qymduic0yM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ueiOq6b+
Subject: Re: [Buildroot] [PATCH] package/kodi: don't uselessly select
 libdisplay-info
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwgQWxsLAoKTGUgMDcvMDIvMjAyNSDDoCAyMTo0MiwgWWFubiBFLiBNT1JJTiBh
IMOpY3JpdMKgOgo+IENvbW1pdCBjNjE5MzQ2MTExMTEgKHBhY2thZ2Uva29kaTogYnVtcCB2ZXJz
aW9uIHRvIDIxLjAtT21lZ2EpIGFkZGVkIGEKPiBzZWxlY3Qgb250byBsaWJkaXNwbGF5LWluZm8g
ZnJvbSBhIGJsaW5kIG9wdGlvbiB0aGF0IG9ubHkgcmVwcmVzZW50cwo+IHdoZXRoZXIgYSBzcGVj
aWZpYyBzdWJzZXQgb2YgS29kaSBpcyBhdmFpbGFibGUsIG5vdCB3aGV0aGVyIEtvZGkgaXRzZWxm
Cj4gaXMgZW5hYmxlZC4KPiAKPiBUaGlzIGNhdXNlcyB1c2VsZXNzIGJ1aWxkcyBvZiBsaWJkaXNw
bGF5LWluZm8gZm9yIGEgbG90IG9mIGJ1aWxkcyB3aGVyZQo+IEtvZGkgaXMgbm90IGVuYWJsZWQu
Cj4gCj4gTW92ZSB0aGUgc2VsZWN0IHRvIHRoZSBtYW4gS29kaSBzeW1ib2wgaXRzZWxmLCBndWFy
ZGVkIHdpdGggdGhlIHByb3Blcgo+IGNvbmRpdGlvbiwgbGlrZSBhIGZldyBleGlzdGluZyBkZXBl
bmRlbmNpZXMgZm9yIEdCTS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5u
Lm1vcmluLjE5OThAZnJlZS5mcj4KPiBDYzogQmVybmQgS3VobHMgPGJlcm5kLmt1aGxzQHQtb25s
aW5lLmRlPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWlu
Cgo+IC0tLQo+ICBwYWNrYWdlL2tvZGkvQ29uZmlnLmluIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9rb2RpL0NvbmZpZy5pbiBiL3BhY2thZ2Uva29kaS9Db25maWcuaW4KPiBpbmRleCAxOTc3MjYz
ZGI4Li45NjYxYWI0N2JjIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uva29kaS9Db25maWcuaW4KPiAr
KysgYi9wYWNrYWdlL2tvZGkvQ29uZmlnLmluCj4gQEAgLTI3LDcgKzI3LDYgQEAgY29uZmlnIEJS
Ml9QQUNLQUdFX0tPRElfUExBVEZPUk1fU1VQUE9SVFNfR0JNCj4gIAlkZXBlbmRzIG9uIEJSMl9Q
QUNLQUdFX0xJQkdCTV9IQVNfRkVBVFVSRV9ETUFfQlVGCj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNL
QUdFX0hBU19VREVWICMgbGliaW5wdXQKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9LT0RJX1BMQVRG
T1JNX1NVUFBPUlRTCj4gLQlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCRElTUExBWV9JTkZPCj4gIAo+
ICBjb21tZW50ICJrb2RpIG5lZWRzIHVkZXYgc3VwcG9ydCBmb3IgZ2JtIgo+ICAJZGVwZW5kcyBv
biAhQlIyX1BBQ0tBR0VfS09ESV9QTEFURk9STV9TVVBQT1JUUwo+IEBAIC0xMDgsNiArMTA3LDcg
QEAgbWVudWNvbmZpZyBCUjJfUEFDS0FHRV9LT0RJCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfVElO
WVhNTDIKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9aTElCCj4gIAlzZWxlY3QgQlIyX1RPT0xDSEFJ
Tl9HTElCQ19HQ09OVl9MSUJTX0NPUFkgaWYgQlIyX1RPT0xDSEFJTl9VU0VTX0dMSUJDICMgcnVu
dGltZSBVVEYgY29udmVyc2lvbiBzdXBwb3J0Cj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCRElT
UExBWV9JTkZPIGlmIEJSMl9QQUNLQUdFX0tPRElfUExBVEZPUk1fU1VQUE9SVFNfR0JNCj4gIAlz
ZWxlY3QgQlIyX1BBQ0tBR0VfTElCSU5QVVQgaWYgQlIyX1BBQ0tBR0VfS09ESV9QTEFURk9STV9T
VVBQT1JUU19HQk0KPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJYS0JDT01NT04gaWYgQlIyX1BB
Q0tBR0VfS09ESV9QTEFURk9STV9TVVBQT1JUU19HQk0KPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9M
SUJYS0JDT01NT04gaWYgQlIyX1BBQ0tBR0VfS09ESV9QTEFURk9STV9TVVBQT1JUU19XQVlMQU5E
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
