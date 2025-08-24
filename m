Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E8ACA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 09:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 646DC61700;
	Sun, 24 Aug 2025 09:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2b6wGu8kfPc; Sun, 24 Aug 2025 09:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80B1B61621
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80B1B61621;
	Sun, 24 Aug 2025 09:33:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F6CE19C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 402338408A
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrQHDOun7E1j for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 09:33:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F2CC083F62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2CC083F62
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2CC083F62
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:33:34 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45a1ac7c066so21837595e9.1
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 02:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756028013; x=1756632813;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iWvjTtkRBDBeFO0oEewVQMN8EDIzJxGyJVr+808rjQg=;
 b=brXJZCHZi2871eRceiXXuezQXmaRdTjBu9/tUBoZfn0zRqenpmFFtnG5//K/iGuhE/
 bzOC6qb3OlDgFc0bvaDpzvBYdfMfdOsLxVZPgBbWbAI/gRyun8i4F6hpJp2FWxsPipfL
 FizG/gbQfbKiyS331cGndUAkMFtthhf92drdm0w/+NIv4U6xIYisodpyMcOBhfJ5EDvl
 jw+EX4A7fyHSLNHKDnAJGpijpHHkS0WOqSSyt2/MNwaO+0wT5SkCc+jLlrneE7nW7rSU
 WpDJw3NpEM0s0AYNDyKkHvGiU6ByuKYizak0+dL980knYTEnzyoLOGpj4L8Y3j2qLbi8
 hm5g==
X-Gm-Message-State: AOJu0YylWy11R4JfgJV5NkCEymc0HODBHn9FYM1IZFgB3yQNv4u3IDzH
 +q7CxNxd6UkRI1+v8wnmaiBXcB/O/bL1Jy4lcO5IzsapehjcJnvmjmEVQe2Eq+OQjV0=
X-Gm-Gg: ASbGncv3V5u/+LoyDLPauEjAkZUrE3l52EmXARnNuJoOBLoYZDHiBYrNgeoxRc5qedV
 xkD7l8llaPpPlW/VhaoEyr6werOLpmyR7xzS4LMa5TDajm+xa7da6f2R3NUlAFiOmXqq6HJx++G
 TE2SFXvPIVy9ZOy4nXxy3YDebvDN/sbYvvxDzIY7rKHUtTg1hglQ4UW1c3mXIj0RAvnLTMdwfER
 UoGxAsFGQCBxYUIYz8MEodNhg4DVr35/NKdWArBSOnRVuZKQ5hayCT7GyB0Tr04SD733w7zM0ab
 qgoijrupn09Y7wBdCAUXz7g/2+Jm7Nd+C55VoCefS79g3QThB194frqZ0bL12x//ydOdNf7ImwB
 kOKDoPlrQzSZgs++wWoFMeSbBVQMnA79fIYjMhObJ+h1RQBKTBb9Pj61YbVtqoXYxBDOEiYmzcM
 pj1a9Q+eQKlbkfFYpcKFuETCFQHkqq3XhyB78hKGwxJBUykUjEb4nuD9aZEF1S
X-Google-Smtp-Source: AGHT+IH5A32kj0j63RBjD5Q8vrKWyB5qIk2snmMFEeRdAvRPvpF/E5lK5ewkPLqjRaS4vPi+AmtRxw==
X-Received: by 2002:a05:600c:1c9d:b0:45b:47e1:f602 with SMTP id
 5b1f17b1804b1-45b4d81618emr101699435e9.17.1756028012649; 
 Sun, 24 Aug 2025 02:33:32 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b4e2ca03bsm73977915e9.3.2025.08.24.02.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Aug 2025 02:33:32 -0700 (PDT)
Message-ID: <cc0f34e2-366d-4f78-a8e7-5c163e57c3c2@smile.fr>
Date: Sun, 24 Aug 2025 11:33:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>, Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
References: <20250818132436.338635-1-fiona.klute@gmx.de>
 <CA+h8R2pxc0gy4pjVnBJr596Z6RTsMV25svYwP-OLOwigzTb6Cw@mail.gmail.com>
Content-Language: fr, en-US
In-Reply-To: <CA+h8R2pxc0gy4pjVnBJr596Z6RTsMV25svYwP-OLOwigzTb6Cw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756028013; x=1756632813; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iWvjTtkRBDBeFO0oEewVQMN8EDIzJxGyJVr+808rjQg=;
 b=WeJuDhWQwnhSlM494IIcMnlexCtzCw7pqDX+1iiAqbBaByJ1xIgLYMh/h/t7RCk3TF
 6jRy7fP2UYceANMDkMaKZW0dzHOsixuoq/fV71yMPfVaVYcZlRRKhhUDeKz8gqfT2ns7
 7sYhyxyxFiFzj5hoV/vE6h8wlNOBRCZiTvrEo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=WeJuDhWQ
Subject: Re: [Buildroot] [PATCH 1/1] package/docker-engine: prefer cgroup v2
 with kernel >=5.4 and no systemd
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

SGVsbG8gRmlvbmEsIENocmlzdGlhbiwKCkxlIDE5LzA4LzIwMjUgw6AgMDU6NTMsIENocmlzdGlh
biBTdGV3YXJ0IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBIaSBGaW9uYSwKPiAKPiBPbiBN
b24sIEF1ZyAxOCwgMjAyNSBhdCA2OjI04oCvQU0gRmlvbmEgS2x1dGUgPGZpb25hLmtsdXRlQGdt
eC5kZT4gd3JvdGU6Cj4+Cj4+IEZyb206ICJGaW9uYSBLbHV0ZSAoV0lXQSkiIDxmaW9uYS5rbHV0
ZUBnbXguZGU+Cj4+Cj4+IFdpdGhvdXQgc3lzdGVtZCBwYWNrYWdlL2RvY2tlci1lbmdpbmUgcmVx
dWlyZXMgYW5vdGhlciB3YXkgdG8gbW91bnQKPj4gL3N5cy9mcy9jZ3JvdXAsIHNvIGZhciB1bmNv
bmRpdGlvbmFsbHkgcHJvdmlkZWQgYnkKPj4gQlIyX1BBQ0tBR0VfQ0dST1VQRlNfTU9VTlQgZm9y
IGNncm91cCB2MS4gSG93ZXZlciwgaXQgaXMgcHJlZmVyYWJsZSB0bwo+PiB1c2UgY2dyb3VwIHYy
IGlmIHBvc3NpYmxlLiBXaGV0aGVyIERvY2tlciBjYW4gdXNlIGNncm91cCB2MiBkZXBlbmRzIG9u
Cj4+IHRoZSBrZXJuZWwgdmVyc2lvbiwgdGhlIERvY2tlciBkb2N1bWVudGF0aW9uIGxpc3RzIHRo
ZSByZXF1aXJlbWVudCBhcwo+PiAidjQuMTUgb3IgbGF0ZXIgKHY1LjIgb3IgbGF0ZXIgaXMgcmVj
b21tZW5kZWQpIiBbMV0uCj4+Cj4+IFNlbGVjdCBCUjJfUEFDS0FHRV9DR1JPVVBGU19WMl9NT1VO
VCBpbnN0ZWFkIG9mCj4+IEJSMl9QQUNLQUdFX0NHUk9VUEZTX01PVU5UIGlmIHRoZSBrZXJuZWwg
aGVhZGVycyBtYXRjaCB0aGUgcmVjb21tZW5kZWQKPj4gdmVyc2lvbi4KPj4KPj4gWzFdIGh0dHBz
Oi8vZG9jcy5kb2NrZXIuY29tL2VuZ2luZS9jb250YWluZXJzL3J1bm1ldHJpY3MvI3J1bm5pbmct
ZG9ja2VyLW9uLWNncm91cC12Mgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBGaW9uYSBLbHV0ZSAoV0lX
QSkgPGZpb25hLmtsdXRlQGdteC5kZT4KPj4gLS0tCj4+IEkgbm90aWNlZCBEb2NrZXIgd2FzIHVu
Y29uZGl0aW9uYWxseSBwdWxsaW5nIGluCj4+IEJSMl9QQUNLQUdFX0NHUk9VUEZTX01PVU5UIHdo
aWxlIGludmVzdGlnYXRpbmcgYSBEb2NrZXIgd2FybmluZyBhYm91dAo+PiBtZW1vcnkgY2dyb3Vw
IG5vdCBiZWluZyBhdmFpbGFibGUsIGFuZCBpbmRlZWQgbXkga2VybmVsIGNvbmZpZyBoYXMKPj4g
Q09ORklHX01FTUNHIGVuYWJsZWQsIGJ1dCBub3QgdGhlICJoaWdobHkgZGlzY291cmFnZWQiICh0
byBxdW90ZSBpdHMKPj4ga2VybmVsIGNvbmZpZyBkZXNjcmlwdGlvbikgQ09ORklHX01FTUNHX1Yx
LiBTd2l0Y2hpbmcgdG8gdjIgb24KPj4gc3VmZmljaWVudGx5IHJlY2VudCBrZXJuZWxzIHNlZW1z
IGVxdWFsbHkgaGlnaGx5IHByZWZlcmFibGUuCj4+Cj4+IEknbSBub3Qgc3VyZSBpZiBwYWNrYWdl
L21vYnktYnVpbGRraXQgc2hvdWxkIGJlIGFkanVzdGVkIHRvIG1hdGNoIHNvCj4+IHRoZSBkZXBl
bmRlbmNpZXMgd29uJ3QgY29uZmxpY3QuIEN1cnJlbnQgQnVpbGRraXQgZGVmaW5pdGVseSB3b3Jr
cwo+PiB3aXRoIGNncm91cCB2MiwgYnV0IHRoZSBwYWNrYWdlZCB2ZXJzaW9uIGlzIGZhaXJseSBv
bGQuCj4+Cj4+ICBwYWNrYWdlL2RvY2tlci1lbmdpbmUvQ29uZmlnLmluIHwgMyArKy0KPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9Db25maWcuaW4gYi9wYWNrYWdlL2RvY2tlci1l
bmdpbmUvQ29uZmlnLmluCj4+IGluZGV4IDYzMzhlZWVlZjEuLmQ1OTFlZTRlM2IgMTAwNjQ0Cj4+
IC0tLSBhL3BhY2thZ2UvZG9ja2VyLWVuZ2luZS9Db25maWcuaW4KPj4gKysrIGIvcGFja2FnZS9k
b2NrZXItZW5naW5lL0NvbmZpZy5pbgo+PiBAQCAtNyw3ICs3LDggQEAgY29uZmlnIEJSMl9QQUNL
QUdFX0RPQ0tFUl9FTkdJTkUKPj4gICAgICAgICBkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgY29u
dGFpbmVyZAo+PiAgICAgICAgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTElCU0VDQ09NUF9BUkNI
X1NVUFBPUlRTICMgbGlic2VjY29tcAo+PiAgICAgICAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJ
Tl9IRUFERVJTX0FUX0xFQVNUXzNfMTcgIyBsaWJzZWNjb21wCj4+IC0gICAgICAgc2VsZWN0IEJS
Ml9QQUNLQUdFX0NHUk9VUEZTX01PVU5UIGlmICFCUjJfUEFDS0FHRV9TWVNURU1EICMgcnVudGlt
ZSBkZXBlbmRlbmN5Cj4+ICsgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX0NHUk9VUEZTX1YyX01P
VU5UIGlmICFCUjJfUEFDS0FHRV9TWVNURU1EICYmIEJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9M
RUFTVF81XzQgIyBydW50aW1lIGRlcGVuZGVuY3kKPj4gKyAgICAgICBzZWxlY3QgQlIyX1BBQ0tB
R0VfQ0dST1VQRlNfTU9VTlQgaWYgIUJSMl9QQUNLQUdFX1NZU1RFTUQgJiYgIUJSMl9UT09MQ0hB
SU5fSEVBREVSU19BVF9MRUFTVF81XzQgIyBydW50aW1lIGRlcGVuZGVuY3kKPj4gICAgICAgICBz
ZWxlY3QgQlIyX1BBQ0tBR0VfQ09OVEFJTkVSRCAjIHJ1bnRpbWUgZGVwZW5kZW5jeQo+PiAgICAg
ICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX0dPCj4+ICAgICAgICAgc2VsZWN0IEJSMl9QQUNL
QUdFX0lQVEFCTEVTICMgcnVudGltZSBkZXBlbmRlbmN5Cj4+IC0tCj4+IDIuNTAuMQo+Pgo+IAo+
IExHVE0KPiAKPiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVy
dHVyZS51cz4KPiAKPiBNaW5vciBwb2ludCwgZXZlbiBpZiB0aGUga2VybmVsIGlzIGF0IGxlYXN0
IDUuNCwgdGhlIG9sZCBjZ3JvdXAgdjEKPiBmb3JtYXQgbWlnaHQgc3RpbGwgYmUgZW5hYmxlZCBi
eSBhIGtlcm5lbCBhcmd1bWVudCwgb3IgdGhlICJoeWJyaWQiCj4gd2hpY2ggaGFzIGJvdGguIEJ1
dCB0aGVyZSBpcyBubyB3YXkgdG8ga25vdyB3aGF0IHJ1bnRpbWUga2VybmVsCj4gYXJndW1lbnRz
IHdpbGwgYmUgc2V0IG9uIHRoZSBCdWlsZHJvb3Qgc2lkZSwgc28gd2Ugd2lsbCBoYXZlIHRvIGFz
c3VtZQo+IHBlb3BsZSB3aWxsIG1pZ3JhdGUgdG8gZWl0aGVyICJoeWJyaWQiIG9yICJ2MiIgd2hl
biB1c2luZyBEb2NrZXIsCj4gd2hpY2ggaXMgYWNjZXB0YWJsZSBhcyBpdCdzIGJlZW4gdGhlIGRl
ZmF1bHQgaW4gYWxsIG1ham9yIGRpc3Ryb3MgZm9yCj4gcXVpdGUgYSB3aGlsZSBub3cuCgpCUjJf
UEFDS0FHRV9ET0NLRVJfRU5HSU5FIGlzIHVzZWQgYnkgVGVzdERvY2tlckNvbXBvc2VSdW5jIGFu
ZApUZXN0RG9ja2VyQ29tcG9zZUNydW4gdGVzdHMuIEJ1dCB3aGlsZSB0aGlzIHRlc3QgdXNlcwpC
UjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fWDg2XzY0X0NPUkVfSTdfR0xJQkNfU1RBQkxF
IHRvb2xjaGFpbiB0aGF0CnByb3ZpZGUgQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzVf
NCwgaXQgc3RpbGwgdXNlcyBhbiBvbGQgNC4xOS4yNjIga2VybmVsCih3aGVyZSBjZ3JvdXAgdjIg
aXMgcHJvYmFibHkgbWlzc2luZykuCgpXaXRoIHRoaXMgcGF0Y2ggYXBwbGllZCwgZG9ja2VyIGVy
cm9yIG91dCB3aXRoOgoKZG9ja2VyOiBFcnJvciByZXNwb25zZSBmcm9tIGRhZW1vbjogZmFpbGVk
IHRvIGNyZWF0ZSB0YXNrIGZvciBjb250YWluZXI6IGZhaWxlZAp0byBjcmVhdGUgc2hpbSB0YXNr
OiBPQ0kgcnVudGltZSBjcmVhdGUgZmFpbGVkOiBydW5jIGNyZWF0ZSBmYWlsZWQ6IHVuYWJsZSB0
bwpzdGFydCBjb250YWluZXIgcHJvY2VzczogZXJyb3IgZHVyaW5nIGNvbnRhaW5lciBpbml0OiBl
cnJvciBzZXR0aW5nIGNncm91cApjb25maWcgZm9yIHByb2NIb29rcyBwcm9jZXNzOiBicGZfcHJv
Z19xdWVyeShCUEZfQ0dST1VQX0RFVklDRSkgZmFpbGVkOiBmdW5jdGlvbgpub3QgaW1wbGVtZW50
ZWQKCkNhbiB5b3UgaGF2ZSBhIGxvb2sgYXQgVGVzdERvY2tlckNvbXBvc2VSdW5jIGFuZCBUZXN0
RG9ja2VyQ29tcG9zZUNydW4/CgpUaGFua3MhCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4g
VGhhbmtzLAo+IENocmlzdGlhbiBTdGV3YXJ0Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
