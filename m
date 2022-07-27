Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8808CC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 08:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2919760AE0;
	Wed, 27 Jul 2022 08:27:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2919760AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o1ziefcijNFE; Wed, 27 Jul 2022 08:27:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19E926066D;
	Wed, 27 Jul 2022 08:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19E926066D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C22F81BF59A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99A2C40356
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99A2C40356
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwFHXKQl0bJk for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 08:27:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E64BE40438
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E64BE40438
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 08:27:06 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v17so4210851wrr.10
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 01:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EozABZgOIOjSNZfo2NI5bRXu3GSXR3fdvj9bYBlqbtM=;
 b=7HVLIr8J33iomAte4bYcRdNsFFdDwOOkQVYiq41vTTqlXPItcKNvX4zo5Dd07wGVTB
 YFk/PHKKm6CrkaIcIn0QXfhHCNtRCWLfbRZ0PFaE5Es4tx1wE5im2G69Ofub7HfjmZTe
 vehEa2WTcP2Uv9Z6o9wK3ASsWTsR+5iww+H0iHB5bW51m3rx6iVgwxhSBEnIDMVs4YAI
 or3P5D51la1tMMlGMq8I/ZVtb6D0JonSGhCmG62XCE6F4IBF+UBLHOmvbH4WnOtRNpCz
 kmw1eDGXgaSiXm+Y+bzgvDqOMEIFWAijT878WZVal0JbffgcbJJ5KePCH72R78mcPROg
 EcFQ==
X-Gm-Message-State: AJIora/wRg+VifKf63UsbdFl5+ap0uD6Qvs0N2pKl/4NLdErRqUqRUln
 blHmJ0Kn3QVa0dk9VX9vLzKDWA==
X-Google-Smtp-Source: AGRyM1vQzTBPL5VK52h9M1c8+rsaTpUKpZ7XnnST+SriuL7CG/qmNS0SGha/ISLp00OINfPPANVKlw==
X-Received: by 2002:a05:6000:178d:b0:21d:a453:b7c6 with SMTP id
 e13-20020a056000178d00b0021da453b7c6mr14591327wrg.275.1658910424929; 
 Wed, 27 Jul 2022 01:27:04 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:86bb:8231:62d7:1874?
 ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c1d1500b003a326b84340sm1491652wms.44.2022.07.27.01.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 01:27:04 -0700 (PDT)
Message-ID: <c5d7ac74-5835-e376-97ee-e47f517ff53a@smile.fr>
Date: Wed, 27 Jul 2022 10:27:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20220601210939.2350383-1-aperez@igalia.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220601210939.2350383-1-aperez@igalia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EozABZgOIOjSNZfo2NI5bRXu3GSXR3fdvj9bYBlqbtM=;
 b=zCydNZ+tAH+RITAmLNbMfB4aPzDIljK5KYf7ZTanXwFntbEo9orE5X+vq3QQNXr9OO
 cHbHpp2k5LbtGHGgwKhAAhC7qOGFqlnRmIb6CU3OHZW+sKGqpIl2SWMUDLoJlwnNZB2J
 Dstm82upJj0Ah7FJVs4ZJyDc78LYENwEeRUG2rEuqLhbXkLnXJ8KZgA4qxe2+Lk55eKW
 NCICLSjYroPxws1Wcupwnbf+TVXmkcwEikEgz6/FM++gPGOCF3kPzlQF57i5uTIbBv8/
 zt4PsrEivqJs0vg4cplRQVW00gy+I5wgnERFv+CVK19Wn/kRJN2WyC48MfxcYv7HxOC3
 VUVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=zCydNZ+t
Subject: Re: [Buildroot] [PATCH 1/2] package: Add libmanette
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

SGVsbG8gQWRyaWFuLAoKTGUgMDEvMDYvMjAyMiDDoCAyMzowOSwgQWRyaWFuIFBlcmV6IGRlIENh
c3RybyBhIMOpY3JpdMKgOgo+IGxpYm1hbmV0dGUgaXMgYSBsaWJyYXJ5IHdoaWNoIHByb3ZpZGVz
IGEgaGlnaGVyIGxldmVsIGludGVyZmFjZSB0bwo+IGVudW1lcmF0ZSBhbmQgbWFrZSB1c2Ugb2Yg
Z2FtZSBjb250cm9sbGVycyAoZ2FtZXBhZHMsIGpveXN0aWNrcykuCj4gV2ViS2l0R1RLIGNhbiB1
c2UgbGlibWFuZXR0ZSB0byBleHBvc2UgY29udHJvbGxlcnMgdG8gd2ViIGNvbnRlbnQsCj4gd2hp
Y2ggd2lsbCBiZSBlbmFibGVkIG9uIGEgZm9sbG93LXVwIHBhdGNoLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgo+IC0tLQo+ICBE
RVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL0NvbmZp
Zy5pbiAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL2xpYm1hbmV0dGUvQ29uZmln
LmluICAgICAgIHwgMTUgKysrKysrKysrKysKPiAgcGFja2FnZS9saWJtYW5ldHRlL2xpYm1hbmV0
dGUuaGFzaCB8ICA1ICsrKysKPiAgcGFja2FnZS9saWJtYW5ldHRlL2xpYm1hbmV0dGUubWsgICB8
IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDY0
IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGlibWFuZXR0ZS9D
b25maWcuaW4KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGlibWFuZXR0ZS9saWJtYW5l
dHRlLmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGlibWFuZXR0ZS9saWJtYW5l
dHRlLm1rCj4gCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXgg
NzFjYzNkYTZkNy4uNzQwZTlhM2NhNyAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIv
REVWRUxPUEVSUwo+IEBAIC0zNSw2ICszNSw3IEBAIEY6CXBhY2thZ2UvYnViYmxld3JhcC8KPiAg
RjoJcGFja2FnZS9jYWdlLwo+ICBGOglwYWNrYWdlL2NvZy8KPiAgRjoJcGFja2FnZS9saWJlcG94
eS8KPiArRjoJcGFja2FnZS9saWJtYW5ldHRlLwo+ICBGOglwYWNrYWdlL2xpYnBzbC8KPiAgRjoJ
cGFja2FnZS9saWJ3cGUvCj4gIEY6CXBhY2thZ2Uvd2Via2l0Z3RrLwo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4gaW5kZXggMDBmMDYxMDE1Zi4u
MjI0MmFkNDA5ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2th
Z2UvQ29uZmlnLmluCj4gQEAgLTUwNiw2ICs1MDYsNyBAQCBlbmRtZW51Cj4gIAlzb3VyY2UgInBh
Y2thZ2Uva2JkL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9sY2Rwcm9jL0NvbmZpZy5p
biIKPiAgCXNvdXJjZSAicGFja2FnZS9saWJpZWM2MTg1MC9Db25maWcuaW4iCj4gKwlzb3VyY2Ug
InBhY2thZ2UvbGlibWFuZXR0ZS9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvbGlidWJv
b3RlbnYvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL2xpYnVpby9Db25maWcuaW4iCj4g
IAlzb3VyY2UgInBhY2thZ2UvbGludXgtYmFja3BvcnRzL0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9saWJtYW5ldHRlL0NvbmZpZy5pbiBiL3BhY2thZ2UvbGlibWFuZXR0ZS9Db25m
aWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjgyOTdkOGM3
ZjQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9saWJtYW5ldHRlL0NvbmZpZy5pbgo+
IEBAIC0wLDAgKzEsMTUgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX0xJQk1BTkVUVEUKPiArCWJv
b2wgImxpYm1hbmV0dGUiCj4gKwlkZXBlbmRzIG9uIEJSMl9VU0VfV0NIQVIgIyBnZXR0ZXh0Cj4g
KwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKPiArCWRlcGVuZHMgb24gQlIy
X1VTRV9NTVUgIyBmb3JrKCkKClRoZXNlICJkZXBlbmRzIG9uIiBzZWVtcyB0byBiZSByZXZlcnNl
IGRlcGVuZGVuY2llcyBvZiBsaWJnbGliMiwgc28gdXBkYXRlIHRoZQpjb21tZW50IHRvICMgbGli
Z2xpYjIKCkkgYnVpbGQgdGVzdGVkIHdpdGggYW4gIm9sZCIgdG9vbGNoYWluIHdpdGgga2VybmVs
LWhlYWRlcnMgNC45OgoKaHR0cHM6Ly90b29sY2hhaW5zLmJvb3RsaW4uY29tL2Rvd25sb2Fkcy9y
ZWxlYXNlcy90b29sY2hhaW5zL2FhcmNoNjQvdGFyYmFsbHMvYWFyY2g2NC0tZ2xpYmMtLXN0YWJs
ZS0yMDIwLjA4LTEudGFyLmJ6MgoKQnV0IGl0IGZhaWwgdG8gYnVpbGQgZHVlIHRvIHRoZSBmb2xs
b3dpbmcgZXJyb3I6CgouL3NyYy9tYW5ldHRlLWRldmljZS5jOiBJbiBmdW5jdGlvbiDigJhvbl9l
dmRldl9ldmVudOKAmToKLi4vc3JjL21hbmV0dGUtZGV2aWNlLmM6MzgwOjM5OiBlcnJvcjog4oCY
c3RydWN0IGlucHV0X2V2ZW504oCZIGhhcyBubyBtZW1iZXIgbmFtZWQK4oCYaW5wdXRfZXZlbnRf
c2Vj4oCZCiAgMzgwIHwgICBtYW5ldHRlX2V2ZW50LmFueS50aW1lID0gZXZkZXZfZXZlbnQtPmlu
cHV0X2V2ZW50X3NlYyAqIDEwMDAgKwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXn4KLi4vc3JjL21hbmV0dGUtZGV2aWNlLmM6MzgxOjM5OiBlcnJvcjog4oCY
c3RydWN0IGlucHV0X2V2ZW504oCZIGhhcyBubyBtZW1iZXIgbmFtZWQK4oCYaW5wdXRfZXZlbnRf
dXNlY+KAmQogIDM4MSB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV2ZGV2X2V2ZW50LT5p
bnB1dF9ldmVudF91c2VjIC8gMTAwMDsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+CgpsaWJtYW5ldHRlIHJlcXVpcmVzIGEgdG9vbGNoYWluIHdpdGgga2Vy
bmVsLWhlYWRlcnMgYXQgbGVhc3QgNC4xNjoKCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0Lz9pZD0xNTIxOTRmZTlj
M2YwMzIzMmI5YzBkMDI2NDc5M2E3ZmE0YWY4MmY4CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4g
KwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCRVZERVYKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJH
TElCMgo+ICsJaGVscAo+ICsJICBHT2JqZWN0IGxpYnJhcnkgd2hpY2ggcHJvdmlkZXMgYWNjZXNz
IHRvIGdhbWUgY29udHJvbGxlcnMuCj4gKwo+ICsJICBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcv
R05PTUUvbGlibWFuZXR0ZQo+ICsKPiArY29tbWVudCAibGlibWFuZXR0ZSBuZWVkcyBhIHRvb2xj
aGFpbiB3LyB3Y2hhciwgdGhyZWFkcyIKPiArCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUKPiArCWRl
cGVuZHMgb24gIUJSMl9VU0VfV0NIQVIgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9saWJtYW5ldHRlL2xpYm1hbmV0dGUuaGFzaCBiL3BhY2thZ2Uv
bGlibWFuZXR0ZS9saWJtYW5ldHRlLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAuLjk2MDg5Zjk3MWEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9s
aWJtYW5ldHRlL2xpYm1hbmV0dGUuaGFzaAo+IEBAIC0wLDAgKzEsNSBAQAo+ICsjIEZyb20gaHR0
cHM6Ly9kb3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy9saWJtYW5ldHRlLzAuMi9saWJtYW5ldHRl
LTAuMi42LnNoYTI1NnN1bQo+ICtzaGEyNTYgIDYzNjUzMjU5YTgyMWVjN2Q5MGQ2ODFlNTJlNzU3
ZTIyMTlkNDYyODI4YzlkNzRiMDU2YTVmNTMyNjc2MzZiYWMgIGxpYm1hbmV0dGUtMC4yLjYudGFy
Lnh6Cj4gKwo+ICsjIExvY2FsbHkgY2FsY3VsYXRlZAo+ICtzaGEyNTYgIGRjNjI2NTIwZGNkNTNh
MjJmNzI3YWYzZWU0MmM3NzBlNTZjOTdhNjRmZTNhZGIwNjM3OTlkOGFiMDMyZmU1NTEgIENPUFlJ
TkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJtYW5ldHRlL2xpYm1hbmV0dGUubWsgYi9wYWNr
YWdlL2xpYm1hbmV0dGUvbGlibWFuZXR0ZS5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMC4uMTBmMmI4YTQ2Ngo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdl
L2xpYm1hbmV0dGUvbGlibWFuZXR0ZS5tawo+IEBAIC0wLDAgKzEsNDIgQEAKPiArIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKPiArIwo+ICsjIGxpYm1hbmV0dGUKPiArIwo+ICsjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+ICsKPiArTElCTUFORVRURV9WRVJTSU9OX01BSk9SID0gMC4yCj4gK0xJQk1B
TkVUVEVfVkVSU0lPTiA9ICQoTElCTUFORVRURV9WRVJTSU9OX01BSk9SKS42Cj4gK0xJQk1BTkVU
VEVfU09VUkNFID0gbGlibWFuZXR0ZS0kKExJQk1BTkVUVEVfVkVSU0lPTikudGFyLnh6Cj4gK0xJ
Qk1BTkVUVEVfU0lURSA9IGh0dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvbGlibWFu
ZXR0ZS8kKExJQk1BTkVUVEVfVkVSU0lPTl9NQUpPUikKPiArTElCTUFORVRURV9MSUNFTlNFID0g
TEdQTC0yLjErCj4gK0xJQk1BTkVUVEVfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKPiArTElCTUFO
RVRURV9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiArTElCTUFORVRURV9ERVBFTkRFTkNJRVMgPSBc
Cj4gKwlsaWJldmRldiBcCj4gKwlsaWJnbGliMiBcCj4gKwkkKFRBUkdFVF9OTFNfREVQRU5ERU5D
SUVTKQo+ICsKPiArTElCTUFORVRURV9MREZMQUdTID0gJChUQVJHRVRfTERGTEFHUykgJChUQVJH
RVRfTkxTX0xJQlMpCj4gKwo+ICtMSUJNQU5FVFRFX0NPTkZfT1BUUyA9IFwKPiArCS1EZGVtb3M9
ZmFsc2UgXAo+ICsJLURidWlsZC10ZXN0cz1mYWxzZSBcCj4gKwktRGluc3RhbGwtdGVzdHM9ZmFs
c2UgXAo+ICsJLURkb2M9ZmFsc2UgXAo+ICsJLUR2YXBpPWZhbHNlCj4gKwo+ICtpZmVxICgkKEJS
Ml9QQUNLQUdFX0dPQkpFQ1RfSU5UUk9TUEVDVElPTikseSkKPiArTElCTUFORVRURV9DT05GX09Q
VFMgKz0gLURpbnRyb3NwZWN0aW9uPXRydWUKPiArTElCTUFORVRURV9ERVBFTkRFTkNJRVMgKz0g
Z29iamVjdC1pbnRyb3NwZWN0aW9uCj4gK2Vsc2UKPiArTElCTUFORVRURV9DT05GX09QVFMgKz0g
LURpbnRyb3NwZWN0aW9uPWZhbHNlCj4gK2VuZGlmCj4gKwo+ICtpZmVxICgkKEJSMl9QQUNLQUdF
X0xJQkdVREVWKSx5KQo+ICtMSUJNQU5FVFRFX0NPTkZfT1BUUyArPSAtRGd1ZGV2PWVuYWJsZWQK
PiArTElCTUFORVRURV9ERVBFTkRFTkNJRVMgKz0gbGliZ3VkZXYKPiArZWxzZQo+ICtMSUJNQU5F
VFRFX0NPTkZfT1BUUyArPSAtRGd1ZGV2PWRpc2FibGVkCj4gK2VuZGlmCj4gKwo+ICskKGV2YWwg
JChtZXNvbi1wYWNrYWdlKSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
