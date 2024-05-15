Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575D8C25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 14:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9EA760877;
	Wed, 15 May 2024 14:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dr6L6XILmH2; Wed, 15 May 2024 14:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23E8660882
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23E8660882;
	Wed, 15 May 2024 14:01:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 657991BF2C2
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 14:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A56582020
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 14:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SASi3gxIhTx2 for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 14:01:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7FD318201B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FD318201B
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FD318201B
 for <buildroot@buildroot.org>; Wed, 15 May 2024 14:01:36 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34ef66c0178so4666420f8f.1
 for <buildroot@buildroot.org>; Wed, 15 May 2024 07:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715781694; x=1716386494;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z65JEhswkfjaFKBLImv4uGIfcATxcgLvZ+OBwUbVtdw=;
 b=oVufCYXlBOmi+4FUU1VxyWVx17bwV3JOs9oViYbY5OvG2cr9QfuDkGGAaaDSX4nxI0
 2mIfR3ZbLpBoGdxFFwDDYABBsJxbxMKFuf3ZCN2qEdXTpOa21kh8E8/vHz9hoVR+TKiZ
 LPJuIvtJHeL2rUNqASqrKJcTaPrW9IgyvramvzBlDC2epHawtwIeelpP7eOdbSOiys1K
 xJtX8OaK5q0WzgcwuaKfMpsS4wd74957SyiPLOMkFwZe8UzOYpqc69IMNtZYrWP5Vguq
 TVT0t0ZPm91i/vne2e4hOOybD7CyIpP/Ux5BcBcvgWu25hcMtWKtj1VjbjaLRM7uNsz0
 J8GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlG9npoOk2Qd/eqD1UfQikoRhgEfCUoyDhMZ3ARcYaKizo/H5g1Ycu23+L/kRfUcm6oWVWDAwYWzXuClVuaanpvzAMWN8Ruw==
X-Gm-Message-State: AOJu0YykVuMhlcWVovGge2tfq5om/RIRpo1gYyWipYtC3BHjOHCeDhq5
 6cMJ4PELuMtusOdDHEEBvOFUWzc8S02TgA9uNWEF7QpLr1cyxrtGTk5PxK2S4QA=
X-Google-Smtp-Source: AGHT+IGO2GBah9ZdOz43iRGiFPcCh2Gf87oeeYkyChhfxSQ7Y2++n+7aZtamZwbntyCzFW1ghFFVKg==
X-Received: by 2002:a5d:52cf:0:b0:34a:e73a:67a1 with SMTP id
 ffacd0b85a97d-3504a956039mr14688088f8f.56.1715781694060; 
 Wed, 15 May 2024 07:01:34 -0700 (PDT)
Received: from ?IPV6:2a04:cec0:1030:da2a:210f:2c50:ac23:ce17?
 ([2a04:cec0:1030:da2a:210f:2c50:ac23:ce17])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502baacfdesm16783331f8f.73.2024.05.15.07.01.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 07:01:33 -0700 (PDT)
Message-ID: <888f8476-9bc2-409d-a35d-bb93282627d0@smile.fr>
Date: Wed, 15 May 2024 16:01:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>
References: <20240514154250.1453970-1-james.hilliard1@gmail.com>
 <4e9d5bc99a30a885dddb8aba6145f56d@free.fr>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <4e9d5bc99a30a885dddb8aba6145f56d@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1715781694; x=1716386494;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z65JEhswkfjaFKBLImv4uGIfcATxcgLvZ+OBwUbVtdw=;
 b=XxyzzeetsMoqUPYnXRHSjIohEAhbc7hXBnuFAeYKqe8DHKPHBMjE6txhfEC2SqcZth
 xTkYhWXg5PLZRkqTLdb/EFBRjoycPgJjqxTgqz+v9R6xkboY1P2VeOIl0m6VXoeKZYK8
 OU7bXm3xKwWbCZ9OOoZJMfcxzPPJN1+54lEv/Ymi255VnSYfWFQXqaQvZXmesvbQFTCN
 ImvFNQP+TK9r8lI24zIGe1rdJxe0twZ9I+L5rQmhQ7IPMd6/uFovGKU5uVkJqzkbOdWH
 4tbOX+nWOsyoWVtMTb+zW7Xqo/FjsdGZN7FDGqaZf6J/Wn9HrxqXHJBsKr7BpU1NNeUB
 UaKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Xxyzzeet
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ml-dtypes: skip
 dependency check
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsIEp1bGllbiwgQWxsLAoKTGUgMTQvMDUvMjAyNCDDoCAxOToyNiwgSnVsaWVu
IE9saXZhaW4gYSDDqWNyaXTCoDoKPiBIaSBKYW1lcywKPiAKPiBUaGFua3MgZm9yIHRoZSBwYXRj
aCEKPiAKPiBJIHN1Y2Nlc3NmdWxseSB0ZXN0ZWQgaXQgb24gYnJhbmNoIG1hc3RlciBhdCBjb21t
aXQgOTc2NDI1OCB3aXRoIGNvbW1hbmQ6Cj4gCj4gwqDCoMKgIHN1cHBvcnQvdGVzdGluZy9ydW4t
dGVzdHMgXAo+IMKgwqDCoMKgwqDCoMKgIC1kIGRsIC1vIG91dHB1dF9mb2xkZXIgXAo+IMKgwqDC
oMKgwqDCoMKgIHRlc3RzLnBhY2thZ2UudGVzdF9weXRob25fbWxfZHR5cGVzCj4gCj4gT24gMTQv
MDUvMjAyNCAxNzo0MiwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4+IFRoaXMgcGFja2FnZSBwaW5z
IG92ZXJseSBzdHJpY3QgbnVtcHkgZGVwZW5kZW5jeSB2ZXJzaW9ucyBhcHBhcmVudGx5Cj4+IGZv
ciBjb21wYXRpYmlsaXR5IHJlYXNvbnMgdGhhdCBkb24ndCBhcHBlYXIgcmVsZXZhbnQgdG8gYnVp
bGRyb290Lgo+Pgo+PiBUaGlzIHBhY2thZ2UgYWxzbyBhcHBlYXJzIHRvIHBpbiBhbiBvdmVybHkg
c3RyaWN0IHNldHVwdG9vbHMgdmVyc2lvbgo+PiBmb3IgdW5jbGVhciByZWFzb25zLgoKSSBsb29r
ZWQgYXQgdGhpcyBpc3N1ZSBsYXN0IHdlZWsgd2l0aCB0aGUgc2FtZSBjb25jbHVzaW9ucy4uLgpJ
IHdhcyBhYmxlIHRvIGZpeCB0aGUgc2V0dXB0b29scyB2ZXJzaW9uIGNoZWNrIGJ1dCBpdCB3YXMg
c2lsbCBmYWlsaW5nIHdpdGgKbnVtcHkgY2hlY2sgKGl0IHNlZW1zIG51bXB5IGRlcGVuZGVuY3kg
aXMgbmV2ZXIgZm91bmQgd2hpbGUgY3Jvc3MtY29tcGlsaW5nKS4KCj4+Cj4+IFNlZToKPj4gaHR0
cHM6Ly9naXRodWIuY29tL2pheC1tbC9tbF9kdHlwZXMvYmxvYi92MC4zLjIvcHlwcm9qZWN0LnRv
bWwjTDUxLUw1NQo+Pgo+PiBUbyBmaXggdGhpcyBsZXRzIGp1c3Qgc2V0IHRoZSAtLXNraXAtZGVw
ZW5kZW5jeS1jaGVjayBidWlsZCBvcHRpb24gYW5kCj4+IGlnbm9yZSB0aGUgYnVpbGQgZGVwZW5k
ZW5jeSB2ZXJzaW9uIG1pc21hdGNoZXMgc2luY2UgdGhleSBkb24ndCBhcHBlYXIKPj4gdG8gY2F1
c2UgYW55IGJ1aWxkIGlzc3Vlcy4KCk1heWJlIHdlIHNob3VsZCBhdm9pZCB1c2luZyAtLXNraXAt
ZGVwZW5kZW5jeS1jaGVjayBvcHRpb24gdG9vIGVhc2lseS4gV2UgY291bGQKbWlzcyBhbnkgbmV3
IGRlcGVuZGVuY3kgdXNlZCBieSBmdXJ0aGVyIHJlbGVhc2U/Cgo+Pgo+PiBUaGlzIGVycm9yIHdh
cyBpbnRyb2R1Y2VkIHdoZW4gd2UgbWlncmF0ZWQgc2V0dXB0b29scyB0byBwZXA1MTcgaW4KPj4g
ODkzN2RiOGRkNTk1ZTA5ODg3NTFlNWRiYjU2OGU4NzBiMDdiMzljYy4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gCj4gVGVz
dGVkLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+IAo+PiAtLS0KPj4gwqBwYWNr
YWdlL3B5dGhvbi1tbC1kdHlwZXMvcHl0aG9uLW1sLWR0eXBlcy5tayB8IDEgKwo+PiDCoDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRo
b24tbWwtZHR5cGVzL3B5dGhvbi1tbC1kdHlwZXMubWsKPj4gYi9wYWNrYWdlL3B5dGhvbi1tbC1k
dHlwZXMvcHl0aG9uLW1sLWR0eXBlcy5tawo+PiBpbmRleCA2NzYxMzdlY2YxLi44MDk3MjY1MDc4
IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1tbC1kdHlwZXMvcHl0aG9uLW1sLWR0eXBl
cy5tawo+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1tbC1kdHlwZXMvcHl0aG9uLW1sLWR0eXBlcy5t
awo+PiBAQCAtMTAsNiArMTAsNyBAQCBQWVRIT05fTUxfRFRZUEVTX1NJVEUgPQo+PiBodHRwczov
L2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMzkvN2QvOGQ4NWZjYmE4Ngo+PiDCoFBZ
VEhPTl9NTF9EVFlQRVNfTElDRU5TRSA9IEFwYWNoZS0yLjAKPj4gwqBQWVRIT05fTUxfRFRZUEVT
X0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4+IMKgUFlUSE9OX01MX0RUWVBFU19TRVRVUF9UWVBF
ID0gc2V0dXB0b29scwoKV2UgY291bGQgYWRkIGEgY29tbWVudCBoZXJlIHRvIGV4cGxhaW4gd2h5
IHdlIHNraXAtZGVwZW5kZW5jeS1jaGVjayBoZXJlLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4+
ICtQWVRIT05fTUxfRFRZUEVTX0JVSUxEX09QVFMgPSAtLXNraXAtZGVwZW5kZW5jeS1jaGVjawo+
Pgo+PiDCoFBZVEhPTl9NTF9EVFlQRVNfREVQRU5ERU5DSUVTID0gXAo+PiDCoMKgwqDCoCBob3N0
LXB5dGhvbi1udW1weSBcCj4+IC0tIAo+PiAyLjM0LjEKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gCj4g
SnVsaWVuLgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
