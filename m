Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B59C3DA4B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B42B41976;
	Fri, 12 Jul 2024 14:00:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3oyCJYUc73H; Fri, 12 Jul 2024 14:00:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2825419A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2825419A0;
	Fri, 12 Jul 2024 14:00:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A011B1BF59E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D2D784567
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2wGJgCbE3R-I for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:00:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A07784524
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A07784524
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A07784524
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:00:51 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52e9f863c46so2214776e87.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720792849; x=1721397649;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PMO/kceejrWUZX8z7BXbSbRDkPB+kvNvm+Nbap9hbDY=;
 b=D/BAn64/x8mT6OjNr1r9fmSQ3vTD/hw5PyadNycLwjS7E8P2sjSXXyDFWyKmGF/ABD
 dhOJS7IT3JvVYmjZFTJslVPCAQ0238qAFMMlp309fWXw48NhPww6LX3o129NJbXqgGiP
 CpdcldbmJ5F/HdCKgpq/nTWQa3h+aIZu3/FIKSZ+NCVqK3x9qK6SjUYnBCazuCtXaESh
 dGrhXo06PxrWWtENrJ6gVWyv10pKTFzEKVhtWueFp28SBOktodLss+0XRMnAUYyswVsI
 OaoaKKec/AD1WO6kQJqoq5GIH/oHhsKJfUt4/a2cV9fJWP2pL9GRpfm0/XwBSkbtXBmw
 pbVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVTlgRysbOyMxIq0J/FqwNfcPn5kQXdV1zunALiylWlfX/PMslGRZCkYMyR3IOD8Z96w/uUag0DdtS7BerqxupXZRxC+0g1g==
X-Gm-Message-State: AOJu0YyF5//Q+ymc5MtfJ9aeEAWyBNF3KeRw3mlQNJJlBQ/PsQJFsXLf
 RdZgKfg0fAv173p/YoKeULzjdZaYgKD3BcNn1Qu+3/v/R89uEynlt6ig+K/Xaf4=
X-Google-Smtp-Source: AGHT+IFRHuBzas6BdZIGsCFPKtwhslUWGFkdoc7yBMvwqQiaK/pj6beZE371/fQaXmcMr5jmh1ZIMA==
X-Received: by 2002:a05:6512:ba6:b0:52e:bdd4:610b with SMTP id
 2adb3069b0e04-52ebdd4635dmr6599526e87.4.1720792848901; 
 Fri, 12 Jul 2024 07:00:48 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-426740d88bcsm98551125e9.1.2024.07.12.07.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 07:00:48 -0700 (PDT)
Message-ID: <1fd0cad0-d90a-42ed-b220-4c35e678e038@smile.fr>
Date: Fri, 12 Jul 2024 16:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, buildroot@buildroot.org
References: <20240524-loongarch64-v1-0-d24078d79cd5@flygoat.com>
 <20240524-loongarch64-v1-4-d24078d79cd5@flygoat.com>
Content-Language: fr, en-US
In-Reply-To: <20240524-loongarch64-v1-4-d24078d79cd5@flygoat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720792849; x=1721397649; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PMO/kceejrWUZX8z7BXbSbRDkPB+kvNvm+Nbap9hbDY=;
 b=eueMxmJdhIcIASF65DRIvvqp7TWlEvkWnpImTlUhztcAL6XOvndihfZf534bIb+mgx
 2G1zumkrsmp6W0TSxp2o1qTirYKO0/fHrdlvAuPfVkfhbVN69nEdhqacc0pQu/RBB8Zo
 UBhyA0uYGYJTjwtCXIyyYB3eDXReFcv4N6vK0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=eueMxmJd
Subject: Re: [Buildroot] [PATCH RESEND 4/7] package/{glibc,
 musl}: Enable LoongArch64 support
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmlheHVuLAoKTGUgMjQvMDUvMjAyNCDDoCAyMTozNiwgSmlheHVuIFlhbmcgYSDDqWNy
aXTCoDoKPiBCb3RoIG11c2wgYW5kIGdsaWJjIGhhdmUgcHJvcGVyIExvb25nQXJjaCBzdXBwb3J0
LgoKSXQgd291bGQgYmUgZ3JlYXQgaWYgeW91IGNhbiBhZGQgdGhlIGZpcnN0IHJlbGVhc2Ugb2Yg
Z2xpYmMgYW5kIG11c2wgd2l0aApMb29uZ0FyY2ggc3VwcG9ydCBpbiB0aGUgY29tbWl0IGxvZy4K
CkFsc28sIGNhbiB5b3Ugc3BsaXQgaW50byB0d28gc2VwYXJhdGUgY29tbWl0PwoKRGlkIHlvdSBu
b3RpY2UgcHJldmlvdXMgcGF0Y2ggc2VyaWVzIGFib3V0IExvb25nQXJjaDY0IHN1cHBvcnQ/Cgpo
dHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvWmtPT0Qv
OE5xSDNjVGpsUEB3YWxkZW1hci1icm9ka29yYi5kZS8KCkluIHRoaXMgcGF0Y2gsIGdjYyBhbmQg
YmludXRpbHMgdmVyc2lvbnMgd2VyZSByZXN0cmljdGVkIHdoZW4gdGhlIExvb25nQXJjaDY0CnN1
cHBvcnQgaXMgbWlzc2luZy4KCldpdGggdGhhdCBhZGRlZCwgeW91IGNhbiBzYWZlbHkgcmVtb3Zl
IEJSMl9BUkNIX0hBU19OT19UT09MQ0hBSU5fQlVJTERST09UIGFkZGVkCmVhcmxpZXIgaW4gdGhl
IHNlcmllcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiBUaGV5IGFsbCByZXF1aXJlIGtlcm5l
bCBoZWFkZXIgZnJvbSBhdCBsZWFzdCA1LjE5IHRvIGJ1aWxkLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT4KPiAtLS0KPiAgcGFja2FnZS9n
bGliYy9Db25maWcuaW4gICAgICAgICAgICAgICAgIHwgMiArKwo+ICBwYWNrYWdlL211c2wvQ29u
ZmlnLmluICAgICAgICAgICAgICAgICAgfCAxICsKPiAgdG9vbGNoYWluL3Rvb2xjaGFpbi1idWls
ZHJvb3QvQ29uZmlnLmluIHwgNCArKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ2xpYmMvQ29uZmlnLmluIGIvcGFja2FnZS9n
bGliYy9Db25maWcuaW4KPiBpbmRleCA4MWM2NDA4M2Y0NzMuLjQ4NGVhMzk0YTJmMiAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL2dsaWJjL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvZ2xpYmMvQ29u
ZmlnLmluCj4gQEAgLTUsNiArNSw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9HTElCQ19BUkNIX1NV
UFBPUlRTCj4gIAlkZWZhdWx0IHkgaWYgQlIyX2FhcmNoNjQKPiAgCWRlZmF1bHQgeSBpZiBCUjJf
YWFyY2g2NF9iZQo+ICAJZGVmYXVsdCB5IGlmIEJSMl9pMzg2Cj4gKwlkZWZhdWx0IHkgaWYgQlIy
X2xvb25nYXJjaDY0Cj4gIAlkZWZhdWx0IHkgaWYgQlIyX202OGtfbTY4awo+ICAJZGVmYXVsdCB5
IGlmIEJSMl9taXBzCj4gIAlkZWZhdWx0IHkgaWYgQlIyX21pcHNlbAo+IEBAIC0zNCw2ICszNSw3
IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9HTElCQ19TVVBQT1JUUwo+ICAJIyB0b29sY2hhaW4vdG9v
bGNoYWluLWJ1aWxkcm9vdC9Db25maWcuaW4KPiAgCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9I
RUFERVJTX0FUX0xFQVNUXzNfMgo+ICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hFQURFUlNf
QVRfTEVBU1RfM18xMCB8fCAhQlIyX3Bvd2VycGM2NGxlCj4gKwlkZXBlbmRzIG9uIEJSMl9UT09M
Q0hBSU5fSEVBREVSU19BVF9MRUFTVF81XzE5IHx8ICFCUjJfbG9vbmdhcmNoNjQKPiAgCWRlcGVu
ZHMgb24gQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzRfNSB8fCAhQlIyX01JUFNfTkFO
XzIwMDgKPiAgCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzVfNCB8
fCAhQlIyX1JJU0NWXzMyCj4gIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9M
RUFTVF81XzAgfHwgIUJSMl9SSVNDVl82NAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL211c2wvQ29u
ZmlnLmluIGIvcGFja2FnZS9tdXNsL0NvbmZpZy5pbgo+IGluZGV4IGE2ZTJhZjA1NGMzNS4uNzA0
NzUzMjZmNWIyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbXVzbC9Db25maWcuaW4KPiArKysgYi9w
YWNrYWdlL211c2wvQ29uZmlnLmluCj4gQEAgLTUsNiArNSw3IEBAIGNvbmZpZyBCUjJfUEFDS0FH
RV9NVVNMX0FSQ0hfU1VQUE9SVFMKPiAgCWRlZmF1bHQgeSBpZiBCUjJfYXJtCj4gIAlkZWZhdWx0
IHkgaWYgQlIyX2FybWViCj4gIAlkZWZhdWx0IHkgaWYgQlIyX2kzODYKPiArCWRlZmF1bHQgeSBp
ZiBCUjJfbG9vbmdhcmNoNjQKPiAgCWRlZmF1bHQgeSBpZiBCUjJfbTY4a19tNjhrCj4gIAlkZWZh
dWx0IHkgaWYgQlIyX21pY3JvYmxhemUKPiAgCWRlZmF1bHQgeSBpZiBCUjJfbWlwcwo+IGRpZmYg
LS1naXQgYS90b29sY2hhaW4vdG9vbGNoYWluLWJ1aWxkcm9vdC9Db25maWcuaW4gYi90b29sY2hh
aW4vdG9vbGNoYWluLWJ1aWxkcm9vdC9Db25maWcuaW4KPiBpbmRleCAwMTczZjQwZDk3NjguLjBi
Y2NkYzgxN2NjOSAxMDA2NDQKPiAtLS0gYS90b29sY2hhaW4vdG9vbGNoYWluLWJ1aWxkcm9vdC9D
b25maWcuaW4KPiArKysgYi90b29sY2hhaW4vdG9vbGNoYWluLWJ1aWxkcm9vdC9Db25maWcuaW4K
PiBAQCAtNDgsNiArNDgsMTAgQEAgY29tbWVudCAiZ2xpYmMgbmVlZHMgYSB0b29sY2hhaW4gdy8g
a2VybmVsIGhlYWRlcnMgPj0gMy4yIgo+ICAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9HTElCQ19B
UkNIX1NVUFBPUlRTCj4gIAlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX0hFQURFUlNfQVRfTEVB
U1RfM18yCj4gIAo+ICtjb21tZW50ICJnbGliYyBvbiBMb29uZ0FyY2g2NCBuZWVkcyBhIHRvb2xj
aGFpbiB3LyBoZWFkZXJzID49IDUuMTkiCj4gKwlkZXBlbmRzIG9uIEJSMl9sb29uZ2FyY2g2NAo+
ICsJZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzVfMTkKPiArCj4g
ICMgZ2xpYmMgPj0gMi4yNiByZXF1aXJlIGtlcm5lbCBoZWFkZXJzID49IDMuMTAgb24gcG93ZXJw
YzY0bGUuCj4gIGNvbW1lbnQgImdsaWJjIG9uIHBvd2VycGM2NGxlIG5lZWRzIGEgdG9vbGNoYWlu
IHcvIGhlYWRlcnMgPj0gMy4xMCIKPiAgCWRlcGVuZHMgb24gQlIyX3Bvd2VycGM2NGxlCj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
