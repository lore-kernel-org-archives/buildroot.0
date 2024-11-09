Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F65D5E37F
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 20:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AC5260682;
	Sat,  9 Nov 2024 20:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJEB0nRqAVHn; Sat,  9 Nov 2024 20:52:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63828606C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63828606C7;
	Sat,  9 Nov 2024 20:52:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0903EC2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 20:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBDD5406F5
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 20:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QX4KocMUmzgj for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 20:52:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A2466406F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2466406F4
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2466406F4
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 20:52:44 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-855f2dfb682so1173905241.3
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 12:52:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731185563; x=1731790363;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RdiYkAuGB00qhD4MVc811VKsxVMjWFNKbUUrn/DSs0k=;
 b=HhotOB3qGXM3Mi4XLhNGyuV2g5kvUnk1jyo07DUUNQ8d9gWhSgyi1tK0RCRmqZ6hB0
 QYgqpAfAkEidSmVJZrziaE4rtW/SNc1ah6JNPL0A3ErAXF1QrIe4TQXHROZcXp2pdg0n
 A4UigdbbX894YrCs1XwQKovgNsNPiRqcurTHHxRFPYWJ/CipN7z5IStUL10qE4XbLUXR
 Hvbr40Y/+DKwG9inJHzsvD+sKJsNdgd/7FIh19j3KB2ZsL+IOBxBgDo1rSVFntzUjjiH
 XKDXTBjIJNOME53Sxxm9YvymJYesdC00NN8C4ihd5NdDFk49MUOvntEGWcSfCfJQ+QhH
 LiWQ==
X-Gm-Message-State: AOJu0Yz7DMEvyZXi2WZX6Su7j1nfFZnzh5EfiLkD+udjpz92x6qcVJNG
 oI799z0KYwimpFCr6tdBcjUtVxgHnA7erMPvpetzAaUeMYmR7Bc9OGpz11Aa+QCqXcoTxSfyDhX
 Q1+/VR5ilzTkH40wyocUHtZG7p5zU9cfN
X-Google-Smtp-Source: AGHT+IHYZMf9nT3nQaDfmGN1JWzzP+SBdiHEOelxcUO5q0wYvyyiUWLxj0Lnp2Vkr/wjrQaWJaxdCtnpUT4UziCWesM=
X-Received: by 2002:a05:6102:161e:b0:4a4:8f96:8b5a with SMTP id
 ada2fe7eead31-4aae138d8bcmr6446997137.10.1731185563531; Sat, 09 Nov 2024
 12:52:43 -0800 (PST)
MIME-Version: 1.0
References: <20240818235602.1867361-1-james.hilliard1@gmail.com>
 <f801ef73029a96970d99d8298afe78c1@free.fr>
In-Reply-To: <f801ef73029a96970d99d8298afe78c1@free.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 9 Nov 2024 13:52:32 -0700
Message-ID: <CADvTj4pPXyLTmRwaN_XROg4ZRDaN-_ag7uHStzP9PH+jf8GPrg@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731185563; x=1731790363; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RdiYkAuGB00qhD4MVc811VKsxVMjWFNKbUUrn/DSs0k=;
 b=IXz49oNWBCXSOIE1VQJtEvkjfubHKbeaV7PtvE1hHhPTFOR1+iQ3I9yYzxf5WRIMvG
 Lok00Kd+EyjmzLgmZceJpZZF7hAocEEUC1uIAKaDqz/Fw8uJJ7LpwttlYSI/oHULxLl8
 NbS5b7lgzG5yVMpaixPqx8IuE1z9MRgGcT0xf+WAYZaFHkKU7QyIakwpDKvtnPuCWOfU
 n3zOLYIAtk7AOTdMTWA6rCodQigYlv78CNh4q2PXZcswb1N9IWHvJLjM5YoSW+k+rlNS
 lXzYDTtm0BhsiE/1mfDLI0k4epaoZ5jJC3fxV/i6MVRwF85njCi+4hxzQcKCEgt+Aeyp
 mU/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IXz49oNW
Subject: Re: [Buildroot] [PATCH 1/1] package/uefisettings: new package
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

T24gU2F0LCBOb3YgOSwgMjAyNCBhdCAxOjI54oCvUE0gSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJl
ZS5mcj4gd3JvdGU6Cj4KPiBIaSBKYW1lcywKPgo+IFdoaWxlIHJ1bm5pbmcgYSB0ZXN0LXBrZyBv
biB0aGlzIHBhY2thZ2UsIGl0IHNlZW1zIGFsbAo+IDMyLWJpdCBidWlsZHMgYXJlIGZhaWxpbmcu
IFNlZToKPiBodHRwczovL2dpdGxhYi5jb20vam9saXZhaW4vYnVpbGRyb290Ly0vcGlwZWxpbmVz
LzE1MzQ4OTcyMjUKPgo+IERvZXMgdGhpcyBwYWNrYWdlIG5lZWRzIGEgImRlcGVuZHMgb24gQlIy
X0FSQ0hfSVNfNjQiPwo+IENhbiB5b3UgaGF2ZSBhIGxvb2sgcGxlYXNlPwoKWWVhaCwgYmFzZWQg
b24gdGhvc2UgZXJyb3JzIGl0IGxvb2tzIGxpa2UgaXQgZG9lcywgc2hvdWxkIEkgcmVzcGluCnRo
ZSBwYXRjaCBvciBkbyB5b3Ugd2FudCB0byBqdXN0IGFkZCBpdCB3aGVuIGFwcGx5aW5nPwoKPgo+
IE9uIDE5LzA4LzIwMjQgMDE6NTYsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+ID4gU2lnbmVkLW9m
Zi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gPiAtLS0K
PiA+ICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiA+ICBw
YWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiA+ICBwYWNrYWdl
L3VlZmlzZXR0aW5ncy9Db25maWcuaW4gICAgICAgICB8ICA5ICsrKysrKysrKwo+ID4gIHBhY2th
Z2UvdWVmaXNldHRpbmdzL3VlZmlzZXR0aW5ncy5oYXNoIHwgIDMgKysrCj4gPiAgcGFja2FnZS91
ZWZpc2V0dGluZ3MvdWVmaXNldHRpbmdzLm1rICAgfCAxMiArKysrKysrKysrKysKPiA+ICA1IGZp
bGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS91ZWZpc2V0dGluZ3MvQ29uZmlnLmluCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvdWVmaXNldHRpbmdzL3VlZmlzZXR0aW5ncy5oYXNoCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvdWVmaXNldHRpbmdzL3VlZmlzZXR0aW5ncy5tawo+ID4KPiA+IGRpZmYgLS1naXQg
YS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+ID4gaW5kZXggZDdkMGFmMzU0My4uNGI4MGIyZDBh
OSAxMDA2NDQKPiA+IC0tLSBhL0RFVkVMT1BFUlMKPiA+ICsrKyBiL0RFVkVMT1BFUlMKPiA+IEBA
IC0xNTAzLDYgKzE1MDMsNyBAQCBGOiAgICAgIHBhY2thZ2Uvc2VyZC8KPiA+ICBGOiAgIHBhY2th
Z2Uvc29yZC8KPiA+ICBGOiAgIHBhY2thZ2Uvc3JhdG9tLwo+ID4gIEY6ICAgcGFja2FnZS9zdGIv
Cj4gPiArRjogICBwYWNrYWdlL3VlZmlzZXR0aW5ncy8KPiA+ICBGOiAgIHBhY2thZ2UvemNodW5r
Lwo+ID4gIEY6ICAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9y
dG9tbC5weQo+ID4gIEY6ICAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRo
b25fcnRvbWwucHkKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2Uv
Q29uZmlnLmluCj4gPiBpbmRleCBmMmM2M2ZmYjZlLi40ZjJkMGNmN2IxIDEwMDY0NAo+ID4gLS0t
IGEvcGFja2FnZS9Db25maWcuaW4KPiA+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gPiBAQCAt
NjQ4LDYgKzY0OCw3IEBAIGVuZG1lbnUKPiA+ICAgICAgIHNvdXJjZSAicGFja2FnZS91ZGV2L0Nv
bmZpZy5pbiIKPiA+ICAgICAgIHNvdXJjZSAicGFja2FnZS91ZGV2LWdlbnRvby1zY3JpcHRzL0Nv
bmZpZy5pbiIKPiA+ICAgICAgIHNvdXJjZSAicGFja2FnZS91ZGlza3MvQ29uZmlnLmluIgo+ID4g
KyAgICAgc291cmNlICJwYWNrYWdlL3VlZmlzZXR0aW5ncy9Db25maWcuaW4iCj4gPiAgICAgICBz
b3VyY2UgInBhY2thZ2UvdWh1YmN0bC9Db25maWcuaW4iCj4gPiAgICAgICBzb3VyY2UgInBhY2th
Z2UvdW10cHJkL0NvbmZpZy5pbiIKPiA+ICAgICAgIHNvdXJjZSAicGFja2FnZS91cG93ZXIvQ29u
ZmlnLmluIgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdWVmaXNldHRpbmdzL0NvbmZpZy5pbgo+
ID4gYi9wYWNrYWdlL3VlZmlzZXR0aW5ncy9Db25maWcuaW4KPiA+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi43MzRmOWI4NjRkCj4gPiAtLS0gL2Rldi9udWxsCj4g
PiArKysgYi9wYWNrYWdlL3VlZmlzZXR0aW5ncy9Db25maWcuaW4KPiA+IEBAIC0wLDAgKzEsOSBA
QAo+ID4gK2NvbmZpZyBCUjJfUEFDS0FHRV9VRUZJU0VUVElOR1MKPiA+ICsgICAgIGJvb2wgInVl
ZmlzZXR0aW5ncyIKPiA+ICsgICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19U
QVJHRVRfQVJDSF9TVVBQT1JUUwo+ID4gKyAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfUlVT
VEMKPiA+ICsgICAgIGhlbHAKPiA+ICsgICAgICAgVGhlIHRvb2wgdG8gcmVhZC9nZXQvZXh0cmFj
dCBhbmQgd3JpdGUvY2hhbmdlL21vZGlmeQo+ID4gKyAgICAgICBCSU9TL1VFRkkgc2V0dGluZ3Mg
ZnJvbSBMaW51eCB0ZXJtaW5hbC4KPiA+ICsKPiA+ICsgICAgICAgaHR0cHM6Ly9naXRodWIuY29t
L2xpbnV4Ym9vdC91ZWZpc2V0dGluZ3MKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3VlZmlzZXR0
aW5ncy91ZWZpc2V0dGluZ3MuaGFzaAo+ID4gYi9wYWNrYWdlL3VlZmlzZXR0aW5ncy91ZWZpc2V0
dGluZ3MuaGFzaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAu
LjUwNWI1ZGU1NjYKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3BhY2thZ2UvdWVmaXNldHRp
bmdzL3VlZmlzZXR0aW5ncy5oYXNoCj4gPiBAQCAtMCwwICsxLDMgQEAKPiA+ICsjIExvY2FsbHkg
Y2FsY3VsYXRlZAo+ID4gK3NoYTI1Ngo+ID4gNWQ0ZDZmNzcxZTYxNWRmOWZlZTNkNTMxYzg1ZGFk
OTk0NmVkNzkzZmMwYTBlNjM2ZGVlMWQzNDI3ODBmNzg2Mwo+ID4gdWVmaXNldHRpbmdzLWY5MGFl
ZDc1OWI5YzIyMTdiZWEzMzZlMzdhYjUyODI2MTZlY2UzOTAtY2FyZ28yLnRhci5nego+ID4gK3No
YTI1Ngo+ID4gYWNjMGI4M2UxNTE5ODViYjk0M2QzNWFjMzdlNzUyMmZlZjI4ZDcwN2FmOWE0ODI5
Njc4ZTkyYmFhNDA5YWFmMQo+ID4gTElDRU5TRQo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdWVm
aXNldHRpbmdzL3VlZmlzZXR0aW5ncy5tawo+ID4gYi9wYWNrYWdlL3VlZmlzZXR0aW5ncy91ZWZp
c2V0dGluZ3MubWsKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAw
Li4wNTU5YjFjNTA0Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9wYWNrYWdlL3VlZmlzZXR0
aW5ncy91ZWZpc2V0dGluZ3MubWsKPiA+IEBAIC0wLDAgKzEsMTIgQEAKPiA+ICsjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIwo+ID4gKyMKPiA+ICsjIHVlZmlzZXR0aW5ncwo+ID4gKyMKPiA+ICsjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIwo+ID4gKwo+ID4gK1VFRklTRVRUSU5HU19WRVJTSU9OID0gZjkw
YWVkNzU5YjljMjIxN2JlYTMzNmUzN2FiNTI4MjYxNmVjZTM5MAo+ID4gK1VFRklTRVRUSU5HU19T
SVRFID0gJChjYWxsCj4gPiBnaXRodWIsbGludXhib290LHVlZmlzZXR0aW5ncywkKFVFRklTRVRU
SU5HU19WRVJTSU9OKSkKPiA+ICtVRUZJU0VUVElOR1NfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+
ID4gK1VFRklTRVRUSU5HU19MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+ID4gKwo+ID4gKyQoZXZh
bCAkKGNhcmdvLXBhY2thZ2UpKQo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KPiA+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4KPiBCZXN0IHJlZ2FyZHMsCj4K
PiBKdWxpZW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
