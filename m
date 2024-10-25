Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B540D149F3
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 21:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2695B60665;
	Fri, 25 Oct 2024 21:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tmzWnv2O7XwZ; Fri, 25 Oct 2024 21:33:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 164E160635
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 164E160635;
	Fri, 25 Oct 2024 21:33:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C6D2281F
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0928406CF
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MkPKvjXpdOow for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 21:33:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3AB34406C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AB34406C5
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AB34406C5
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:33:22 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42f6bec84b5so24824655e9.1
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 14:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729892000; x=1730496800;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NxvQCQEwIfe+W0UBie4PdiRen1KQDAzP49TemZTXiqo=;
 b=lIWZwuUky1Xy19n84kTp0NMHgjslFAipVKc+ocXtp3vT1qRcgcCoIylEzPM+qQf2Eu
 xKCQqXB8pKlVFXFkTPvSfhxc8+eJ/NffSRrjlveJ2RfWvwmK9E9lxMN+POTgPaR0wfe6
 UrFLXxNhJaxS5KBZ2sHGqsdUezQR02K+QRCAgn55F59w6IFAsJobzI3QiG65NxNOFBGu
 FrC6gFenZHRjmRzGW7zYibCv+i/AWia29hpb8GJ/B0bZx0akotyAlQb3MePxFU6m0OoG
 1LbAg9yL9dL/xleaohVvUCrJMUqptsCkX70o5CL5Y1B4Icog1QIZwy7m5F69OacykSVG
 WCqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlgrpC0nohy/rQY3er65Jv7AEyHmRgQR7BFroD9M/JNhT3uMtqYk9QXwsGhUPv+08OYwv9Pncacyk=@buildroot.org
X-Gm-Message-State: AOJu0YwUr8S0Lre8kfi11Wi5FZX2TsCGxkPkwoNAEZwpiib9qbMPYij4
 v9XroegGvb+qWCqGPVD55uJESiAvUTsUGUNROWT5yZuNReUPNdZ/4UnWurfMDTiku5hImCjS85h
 I
X-Google-Smtp-Source: AGHT+IGVNqKLlETvGo+gGI/aS6TbsZds8IPszjrdXOLI26QO708ShTzsXJmzXbmb/Yw/qpzTrHHawg==
X-Received: by 2002:a05:600c:1d06:b0:42e:d4a2:ce67 with SMTP id
 5b1f17b1804b1-4319acb200bmr5111205e9.17.1729891999099; 
 Fri, 25 Oct 2024 14:33:19 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b9d008sm2519082f8f.107.2024.10.25.14.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 14:33:18 -0700 (PDT)
Message-ID: <7b5d311e-71df-4530-b664-f7845fd6d9c5@smile.fr>
Date: Fri, 25 Oct 2024 23:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <Zuk9llv/MKRiTvog@waldemar-brodkorb.de>
Content-Language: fr
In-Reply-To: <Zuk9llv/MKRiTvog@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1729892000; x=1730496800; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NxvQCQEwIfe+W0UBie4PdiRen1KQDAzP49TemZTXiqo=;
 b=yLdTN0uS8lvP2GTSUG0bDWUJHEBanuDQI7IszGLVKj9dJvjRIInb5zZhOv2wpVL8W7
 VHH4ftM150fDKDd/NRJ05eISR6dvF0daAoBmFmiZMZ9mQ8xePffCYwP24XdLVI4WJx7F
 NWKvtKMRO7rgrxoHBJrCV4GBBYaUc0MZvPp5Y=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=yLdTN0uS
Subject: Re: [Buildroot] [PATCH v2 3/3] package/qemu: update to 9.1.0
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

TGUgMTcvMDkvMjAyNCDDoCAxMDoyOCwgV2FsZGVtYXIgQnJvZGtvcmIgYSDDqWNyaXTCoDoKPiBT
ZWUgaGVyZSBmb3IgY2hhbmdlczoKPiBodHRwczovL3dpa2kucWVtdS5vcmcvQ2hhbmdlTG9nLzku
MQo+IAo+IFRoZSBzdXBwb3J0IGZvciB0aGUgbmlvczIgYXJjaGl0ZWN0dXJlIGdvdCByZW1vdmVk
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdhbGRlbWFyIEJyb2Rrb3JiIDx3YnhAb3BlbmFkay5vcmc+
Cj4gLS0tCj4gdjEtPnYyOgo+ICAgLSBhZGRlZCBDb25maWcuaW4ubGVnYWN5IGVudHJ5IHN1Z2dl
c3RlZCBieSBSb21haW4gCj4gICAtIHRlc3RlZCB2aWEgR2l0bGFiIHNlZSBoZXJlOgo+ICAgICBo
dHRwczovL2dpdGxhYi5jb20vd2J4LWdpdGh1Yi9idWlsZHJvb3QvLS9qb2JzLzc4NDAwMDY0OTcK
PiAtLS0KPiAgQ29uZmlnLmluLmxlZ2FjeSAgICAgICAgICAgIHwgNiArKysrKysKPiAgcGFja2Fn
ZS9xZW11L0NvbmZpZy5pbiAgICAgIHwgNSAtLS0tLQo+ICBwYWNrYWdlL3FlbXUvQ29uZmlnLmlu
Lmhvc3QgfCAxIC0KPiAgcGFja2FnZS9xZW11L3FlbXUuaGFzaCAgICAgIHwgMiArLQo+ICBwYWNr
YWdlL3FlbXUvcWVtdS5tayAgICAgICAgfCAyICstCj4gIDUgZmlsZXMgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Db25maWcuaW4ubGVn
YWN5IGIvQ29uZmlnLmluLmxlZ2FjeQo+IGluZGV4IDZhMTUxOGY0MzkuLjA5MGQzODJlN2UgMTAw
NjQ0Cj4gLS0tIGEvQ29uZmlnLmluLmxlZ2FjeQo+ICsrKyBiL0NvbmZpZy5pbi5sZWdhY3kKPiBA
QCAtMTQ2LDYgKzE0NiwxMiBAQCBlbmRpZgo+ICAKPiAgY29tbWVudCAiTGVnYWN5IG9wdGlvbnMg
cmVtb3ZlZCBpbiAyMDI0LjExIgo+ICAKPiArY29uZmlnIEJSMl9QQUNLQUdFX1FFTVVfVEFSR0VU
X05JT1MyCj4gKwlib29sICJRZW11IE5JT1MyIHN1cHBvcnQgaGFzIGJlZW4gcmVtb3ZlZCIKPiAr
CXNlbGVjdCBCUjJfTEVHQUNZCj4gKwloZWxwCj4gKwkgIFFlbXUgTklPUzIgc3VwcG9ydCBoYXMg
YmVlbiByZW1vdmVkLgo+ICsKPiAgY29uZmlnIEJSMl9QQUNLQUdFX0lQTUlUT09MX1BFTl9SRUdf
VVJJCj4gIAlzdHJpbmcgIklBTkEgUEVOIHJlZ2lzdHJ5IG1vdmVkIHRvIGlhbmEtYXNzaWdubWVu
dCBwYWNrYWdlIgo+ICAJaGVscAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvQ29uZmlnLmlu
IGIvcGFja2FnZS9xZW11L0NvbmZpZy5pbgo+IGluZGV4IDYwOGU0ZDQyOWQuLjJkMTVhYjFlYTkg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9xZW11L0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvcWVt
dS9Db25maWcuaW4KPiBAQCAtMjUyLDExICsyNTIsNiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfUUVN
VV9UQVJHRVRfTUlQU04zMkVMCj4gIAloZWxwCj4gIAkgIE1JUFMgTjMyIGFyY2hpdGVjdHVyZSwg
bGl0dGxlLWVuZGlhbi4KPiAgCj4gLWNvbmZpZyBCUjJfUEFDS0FHRV9RRU1VX1RBUkdFVF9OSU9T
Mgo+IC0JYm9vbCAibmlvczIiCj4gLQloZWxwCj4gLQkgIE5pb3MgSUkgYXJjaGl0ZWN0dXJlLgo+
IC0KPiAgY29uZmlnIEJSMl9QQUNLQUdFX1FFTVVfVEFSR0VUX09SMUsKPiAgCWJvb2wgIm9yMWsi
Cj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfUUVNVV9GRFQgaWYgQlIyX1BBQ0tBR0VfUUVNVV9TWVNU
RU0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11L0NvbmZpZy5pbi5ob3N0IGIvcGFja2FnZS9x
ZW11L0NvbmZpZy5pbi5ob3N0Cj4gaW5kZXggOGRkMGM3ZDExYi4uNGRiMTE0NDkwYSAxMDA2NDQK
PiAtLS0gYS9wYWNrYWdlL3FlbXUvQ29uZmlnLmluLmhvc3QKPiArKysgYi9wYWNrYWdlL3FlbXUv
Q29uZmlnLmluLmhvc3QKPiBAQCAtOSw3ICs5LDYgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0hPU1Rf
UUVNVV9BUkNIX1NVUFBPUlRTCj4gIAlkZWZhdWx0IHkgaWYgQlIyX21pY3JvYmxhemViZQo+ICAJ
ZGVmYXVsdCB5IGlmIEJSMl9taXBzCj4gIAlkZWZhdWx0IHkgaWYgQlIyX21pcHNlbAo+IC0JZGVm
YXVsdCB5IGlmIEJSMl9uaW9zMgo+ICAJZGVmYXVsdCB5IGlmIEJSMl9vcjFrCj4gIAlkZWZhdWx0
IHkgaWYgQlIyX3Bvd2VycGMKPiAgCWRlZmF1bHQgeSBpZiBCUjJfcG93ZXJwYzY0Cj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcWVtdS9xZW11Lmhhc2ggYi9wYWNrYWdlL3FlbXUvcWVtdS5oYXNoCj4g
aW5kZXggNDE5ZGQwZDFiMy4uMTY5ZmUwNTA2OCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3FlbXUv
cWVtdS5oYXNoCj4gKysrIGIvcGFja2FnZS9xZW11L3FlbXUuaGFzaAo+IEBAIC0xLDQgKzEsNCBA
QAo+ICAjIExvY2FsbHkgY29tcHV0ZWQsIHRhcmJhbGwgdmVyaWZpZWQgd2l0aCBHUEcgc2lnbmF0
dXJlCj4gLXNoYTI1NiAgYThjM2Y1OTZhZWNlOTZkYTNiMDBjYWZiNzRiYWFmYTBkMTQ1MTVlYWZi
OGVkMWVlM2Y3ZjVjMmQwZWJmMDJiNiAgcWVtdS05LjAuMi50YXIueHoKPiArc2hhMjU2ICA4MTZi
NzAyMmE4YmE3YzJhYzMwZTJlMGNmOTczZTgyNmY2YmNjODUwNTMzOTYwMzIxMmM1ZWRlOGU5NGQ3
ODM0ICBxZW11LTkuMS4wLnRhci54ego+ICBzaGEyNTYgIDZmMDRhZTgzNjRkMDA3OWExOTJiMTQ2
MzVmNGIxZGEyOTRjZTE4NzI0YzAzNGMzOWE2YTQxZDFiMDlkZjYxMDAgIENPUFlJTkcKPiAgc2hh
MjU2ICBkYzYyNjUyMGRjZDUzYTIyZjcyN2FmM2VlNDJjNzcwZTU2Yzk3YTY0ZmUzYWRiMDYzNzk5
ZDhhYjAzMmZlNTUxICBDT1BZSU5HLkxJQgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvcWVt
dS5tayBiL3BhY2thZ2UvcWVtdS9xZW11Lm1rCj4gaW5kZXggMTZjZmYxM2QxOC4uZTlmNjUyMGQ4
OSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3FlbXUvcWVtdS5tawo+ICsrKyBiL3BhY2thZ2UvcWVt
dS9xZW11Lm1rCj4gQEAgLTYsNyArNiw3IEBACj4gIAo+ICAjIFdoZW4gdXBkYXRpbmcgdGhlIHZl
cnNpb24sIGNoZWNrIHdoZXRoZXIgdGhlIGxpc3Qgb2Ygc3VwcG9ydGVkIHRhcmdldHMKPiAgIyBu
ZWVkcyB0byBiZSB1cGRhdGVkLgo+IC1RRU1VX1ZFUlNJT04gPSA5LjAuMgo+ICtRRU1VX1ZFUlNJ
T04gPSA5LjEuMAo+ICBRRU1VX1NPVVJDRSA9IHFlbXUtJChRRU1VX1ZFUlNJT04pLnRhci54ego+
ICBRRU1VX1NJVEUgPSBodHRwczovL2Rvd25sb2FkLnFlbXUub3JnCj4gIFFFTVVfU0VMSU5VWF9N
T0RVTEVTID0gcWVtdSB2aXJ0CgpUaGUgdHdvIEJSMl9QQUNLQUdFX1FFTVVfVEFSR0VUX05JT1My
IGluIHFlbXUubWsgbXVzdCBiZSByZW1vdmVkIHRvby4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
