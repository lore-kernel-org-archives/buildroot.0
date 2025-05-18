Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7434C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 20:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89A2E408B6;
	Sun, 18 May 2025 20:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iOD4Nd_zUnea; Sun, 18 May 2025 20:54:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9AC4408C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9AC4408C1;
	Sun, 18 May 2025 20:54:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 750061BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65B1660EA0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPtRJTRzTDdM for <buildroot@buildroot.org>;
 Sun, 18 May 2025 20:54:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51F4460E88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51F4460E88
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51F4460E88
 for <buildroot@buildroot.org>; Sun, 18 May 2025 20:54:00 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so40773855e9.3
 for <buildroot@buildroot.org>; Sun, 18 May 2025 13:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747601638; x=1748206438;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S591VZI6gX7jxddEdxyT8B2fXAknKNRadq3GSsfgMV8=;
 b=UYO86m1gyGjJHwoZGm17deHpHaXt8wfRLxInKAsUpBDU+mpTQ+0QdP3GMT6CBS3jIs
 dagHaUcdrxSz2BUl4MeqQTlBeEJkC/yZx2UjGedMjISqCyvLeQj6K1zdykQsruvNK+Jt
 HrGEzrhbsDamsYPX28XhPnC4Y4SYBdEh6lyriouwPwzz1KJ4fAm3CPtIBINAqZZaImam
 CpZ2WzPsLu5YItB21LvUJOwUTsWO0WTc7N32sx4TKCRmcv097bFUbv9xjCrvEUFstMwq
 kvDDHQ7Z9VkSXT3QRxOuBskTejk9Kh4S3maMpbpFGwNcxV7+ynQfQueMrpTFXd4lYfrG
 yeEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNSox1XSO+hQQkY+CW7py7tThdS1K/dcDSvM5q7thfoO+Z4bMaqeZBsMkexaJRKNUHPtF4cRvm7QE=@buildroot.org
X-Gm-Message-State: AOJu0YzFc9rBcJo4htOCEum8MR1xiYUmFqMbosxaL/7GrLH2OGwASDcf
 37UJG/50xDr9CUhb6sTRlKkAfg2mogFOtv7d7p0pA8CwOW8qYJIczYFEkzR0SCL9uzw=
X-Gm-Gg: ASbGncvDEpfDwf2jkkZmhVO7Sx5CKPrJACCgPfUHN9VZfbuOLAq5557BUgtLTu9y10K
 4TkLlbi10V/9RZxKFYSGSs73yNF/0c7Mm5tijace76w3b8ff7wyJTrSod7oGR3JRdvE0tO1IjFD
 pQOLVZbGjwwtSW1WjpHfrQNmcwQevaPhcEdleTXHWNUwUmvGcI1viSR12CeFFkX/NocnTldqVrs
 jdea3QB2AgmbtoqC7o+I+IilAN2zX9KszZGF/QW6dXtVIkALB23V09VUlQDSK/VBR39gnH13FJG
 uSwvDJkweMUnOJ7t2Mfo5kqHfavVVPErjhcZLEPCzS33eHm7J9xVk5591sd7YW4/0BFw8DvtTnP
 kSzcgpEjZmPUeXPFt9RqN2Bnl/NfNILFZm/NcU/k9fRmgoJxyvK8UEF7DmgOU9f3MAjxbvLyOG4
 ztxATp3cHdqw2plRXYwQXs8qVb
X-Google-Smtp-Source: AGHT+IE7DERgy4T+W1AqRlT9DjqL07XIjvP3lsc0EEiZ4bXdEUVw+kSfB+J8dFI3pDWmDb6VSzI9mg==
X-Received: by 2002:a05:600c:3f10:b0:440:6a5f:c308 with SMTP id
 5b1f17b1804b1-442fefef461mr84798785e9.13.1747601638284; 
 Sun, 18 May 2025 13:53:58 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f?
 (2a01cb05949d580083fd25921c9c7a4f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca5a8cfsm10484934f8f.37.2025.05.18.13.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 13:53:57 -0700 (PDT)
Message-ID: <92101a22-1e05-4f26-830d-bc7c5cb7bacf@smile.fr>
Date: Sun, 18 May 2025 22:53:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
References: <20250518115519.3649662-1-bernd@kuhls.net>
 <20250518115519.3649662-2-bernd@kuhls.net>
Content-Language: fr
In-Reply-To: <20250518115519.3649662-2-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1747601638; x=1748206438; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S591VZI6gX7jxddEdxyT8B2fXAknKNRadq3GSsfgMV8=;
 b=miPDHDskaHS8B9vOAAhqSR5JSouK/M3RYt3i+LGHhD8u5+YJrBZG2zk9vriJLUJf0f
 yciYhoUBLUu/YQQB+CD9AIf/UAsCXXVwM/F4byeyohuz0DOiULNkTny1MRCBNLhUA1/Z
 rY2lAYzWqK/LYWJS8HmfK8q+au0oHG6ZuBXn0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=miPDHDsk
Subject: Re: [Buildroot] [PATCH v2 2/5] package/llvm-project: add
 llvm-runtimes package
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

SGVsbG8gQmVybmQsIE1laGRpLCBBbGwsCgpMZSAxOC8wNS8yMDI1IMOgIDEzOjU1LCBCZXJuZCBL
dWhscyBhIMOpY3JpdMKgOgo+IEZyb206IEVsIE1laGRpIFlPVU5FUyA8ZWxtZWhkaS55b3VuZXNA
c21pbGUuZnI+Cj4gCj4gQWRkIGEgbmV3IGhvc3QgcGFja2FnZSB0byBpbnN0YWxsIHRoZSBDTWFr
ZSBtb2R1bGVzIHByb3ZpZGVkIGJ5IHRoZQo+IHJ1bnRpbWVzIGFyY2hpdmUgb2YgTExWTS4gVGhl
c2UgbW9kdWxlcyBhcmUgcmVxdWlyZWQgdG8gYnVpbGQgY29tcG9uZW50cwo+IGxpa2UgbGlidW53
aW5kIHNpbmNlIHVwc3RyZWFtIHJlZmFjdG9yZWQgdGhlIGNvbW1vbiBmbGFnLWhhbmRsaW5nIGxv
Z2ljCj4gaW50byBhIHNoYXJlZCBmaWxlOiBgSGFuZGxlRmxhZ3MuY21ha2VgLgo+IAo+IFRoaXMg
cGFja2FnZSBleHRyYWN0cyBhbmQgaW5zdGFsbHMgdGhlIHJlbGV2YW50IGZpbGVzIHRvCj4gYCQo
SE9TVF9ESVIpL2xpYi9jbWFrZS9sbHZtYCwgd2hlcmUgb3RoZXIgY29tcG9uZW50cyBsaWtlIGxp
YnVud2luZAo+IHdpbGwgbG9vayBmb3IgdGhlbS4KPiAKPiBzZWUgaHR0cHM6Ly9naXRodWIuY29t
L2xsdm0vbGx2bS1wcm9qZWN0L2NvbW1pdC8wYWY2N2QxNjdkNmM4MTFhYmYxMmFkNmMyN2VlMzRl
YzEzNjVlNWZiCj4gCj4gU2lnbmVkLW9mZi1ieTogRWwgTWVoZGkgWU9VTkVTIDxlbG1laGRpLnlv
dW5lc0BzbWlsZS5mcj4KPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMu
bmV0Pgo+IC0tLQo+IHYyOiBubyBjaGFuZ2VzCj4gCj4gIC4uLi9sbHZtLXJ1bnRpbWVzL2xsdm0t
cnVudGltZXMuaGFzaCAgICAgICAgICAgIHwgIDEgKwo+ICAuLi4vbGx2bS1wcm9qZWN0L2xsdm0t
cnVudGltZXMvbGx2bS1ydW50aW1lcy5tayB8IDE3ICsrKysrKysrKysrKysrKysrCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS9sbHZtLXByb2plY3QvbGx2bS1ydW50aW1lcy9sbHZtLXJ1bnRpbWVzLmhhc2gKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0tcnVudGltZXMvbGx2bS1ydW50
aW1lcy5tawo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtLXJ1bnRp
bWVzL2xsdm0tcnVudGltZXMuaGFzaCBiL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0tcnVudGlt
ZXMvbGx2bS1ydW50aW1lcy5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAw
MDAwMDAwLi40OTIwNTBlOGFjCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbGx2bS1w
cm9qZWN0L2xsdm0tcnVudGltZXMvbGx2bS1ydW50aW1lcy5oYXNoCj4gQEAgLTAsMCArMSBAQAo+
ICtzaGEyNTYgIDYzOTRkOGYxMTEyODhjOTE4NDIxNzU2MDM3YzEwYzRmODQ3MTMyNTk5MmUzN2M0
NGNmODgxMWI0ZTNkZGUwMGIgIHJ1bnRpbWVzLTIwLjEuMy5zcmMudGFyLnh6Cj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0tcnVudGltZXMvbGx2bS1ydW50aW1lcy5tayBi
L3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0tcnVudGltZXMvbGx2bS1ydW50aW1lcy5tawo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uODhmMTQyMWYwOAo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtLXJ1bnRpbWVzL2xsdm0t
cnVudGltZXMubWsKPiBAQCAtMCwwICsxLDE3IEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Cj4gKyMKPiArIyBsbHZtLXJ1bnRpbWVzCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
PiArCj4gK0xMVk1fUlVOVElNRVNfVkVSU0lPTiA9ICQoTExWTV9QUk9KRUNUX1ZFUlNJT04pCgpU
aGlzIGRvZXNuJ3Qgd29yayBzaW5jZSBMTFZNX1BST0pFQ1RfVkVSU0lPTiBpcyBzdGlsbCBhdCAx
NS4wLjcsIHNvIHRoZQpkb3dubG9hZGVkIGFyY2hpdmUgZG9lc24ndCBtYXRjaCBydW50aW1lcy0y
MC4xLjMuc3JjLnRhci54eiBoYXNoLgoKWW91IGhhdmUgdG8gZXhwbGljaXRlbHkgYWRkIDIwLjEu
MyBoZXJlIGFuZCBhZGQgYmFjayBMTFZNX1BST0pFQ1RfVkVSU0lPTiBpbiB0aGUKbGx2bSB2ZXJz
aW9uIGJ1bXAgY29tbWl0LgoKVGhpcyBwYXRjaCB3YXMgaW5pdGlhbGx5IGNyZWF0ZWQgYWZ0ZXIg
dGhlIGNvbW1pdCB1cGRhdGluZyBsbHZtIHRvIDIwLjEgYW5kCm1vdmVkIGJlZm9yZSB0aGUgdmVy
c2lvbiBidW1wIGNvbW1pdCB3aGlsZSBjbGVhbmluZyB0byB1cHN0cmVhbSB0aGlzIHBhdGNoIHNl
cmllcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgo+ICtMTFZNX1JVTlRJTUVTX1NJVEUgPSAkKExM
Vk1fUFJPSkVDVF9TSVRFKQo+ICtMTFZNX1JVTlRJTUVTX1NPVVJDRSA9IHJ1bnRpbWVzLSQoTExW
TV9SVU5USU1FU19WRVJTSU9OKS5zcmMudGFyLnh6Cj4gK0xMVk1fUlVOVElNRVNfTElDRU5TRSA9
IEFwYWNoZS0yLjAgd2l0aCBleGNlcHRpb25zCj4gKwo+ICtkZWZpbmUgSE9TVF9MTFZNX1JVTlRJ
TUVTX0lOU1RBTExfQ01EUwo+ICsgICAgICAgIG1rZGlyIC1wICQoSE9TVF9ESVIpL2xpYi9jbWFr
ZS9sbHZtL01vZHVsZXMKPiArICAgICAgICBjcCAtUnYgJChARCkvY21ha2UvTW9kdWxlcy8qICQo
SE9TVF9ESVIpL2xpYi9jbWFrZS9sbHZtCj4gK2VuZGVmCj4gKwo+ICskKGV2YWwgJChob3N0LWdl
bmVyaWMtcGFja2FnZSkpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
