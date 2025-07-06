Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB52C83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 17:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB3AE81E28;
	Sun,  6 Jul 2025 17:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50OTiUl1GMUb; Sun,  6 Jul 2025 17:16:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0542881E5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0542881E5E;
	Sun,  6 Jul 2025 17:16:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B022415F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 17:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1FEF40CC0
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 17:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7iChoQfZeu1l for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 17:16:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13A8A40A83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13A8A40A83
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13A8A40A83
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 17:16:44 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a525eee2e3so1450651f8f.2
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 10:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751822203; x=1752427003;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lBmUmrApBT54OJLB5JKVQY8o3PxEt8kYC5O4yE8WKa0=;
 b=v5deKcQbiG+HfUlTFiyCIBKHfeEflzdRVK/A+aS6X6GkQ8hyyoEHr0IkcUHNG/fr8T
 bbJrf4rKHPoavvkvr9fkW0QAYTa8NEF9PLO59beQhPexJW3qsWAEXBxeSgHSzeDYFZnv
 yOHMCS40rMha8lZ6+NED9UzHfWw1ctnoWdHKsr/yZFYZGWuUKCJCPwmWGUa2aeS4rpre
 baImBW+a7b+DAwBCPdl0Wi7yb+WpEHxYDqgYXOOA0e9QSLyjUdWJ61i0uxMNAK7967Hd
 zYZQYWDN4Jw9128ldeOBweK5AqnWWUFHpzFmNufU1aWBVtgkc46Kx6w7Tnn+RxcbQZcE
 zCng==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4e9esU4By5ITNlK1Pd0cNIqPt07cjcv42iZDF18ZtYbFxLJrruIV304rFiezRf6z+N51WVObqruI=@buildroot.org
X-Gm-Message-State: AOJu0YxFB5R0F5FhVKPGzB6JxQlTEExu5EwWECaX+XDqOLXEJW29yYSt
 KdmjpSnjf+YWH6VsLZEWGDtju1GME9k6h++j5ywS7Erecz+H5ihJT0Qh7Kr/dYnOLzs=
X-Gm-Gg: ASbGncsLvTOY2QqgFqBlRc0WNH+y1mX9G/jhIQUElbT+VpHw+fwPMjOcu22JaXa/UMu
 ZWPvvsyZ6tzZ8EkbtJDVwXGjcFylud/33DxUc6fHMyGIWKch7vXUu/b1s+sOQchUd4QAvGlbk8y
 PexVYiH2O2eDq6J/6LZpsQPJk8wql1kEWZjzax6LuZYiGDPsvtGaw/H76i6gllodzVBpzpuklrq
 OdLp2gfaelqYEd8ZOHc2KXnHcZtVU1ck5zR2e66GaaFioRzQJIAGpVWGcgAgsJwXtE/g/Uvs8++
 k5VfpuDTl8Tvu3D2ENfnp5lW8yv95eNe3XzLixFIkEzsD7QTGfYL4KWwc32TGKDaNRwAbs3+hgx
 vGTuG+UbHsuMVsmaS5sThA6MoJdn+ZDEy4o4FOtKtHuffQvjAkaolEO5NhKH34j3+115/TogAFy
 S+Y9TbvyMR9lvujc2vVuNuTSQ4
X-Google-Smtp-Source: AGHT+IEGnPGndcDB3gSxoFWrrNWRkBSaMdGZ4zysetwBIlWWY96K+TlGvwc8iL378m54cspUqgx14g==
X-Received: by 2002:a05:6000:4312:b0:3a5:2465:c0c8 with SMTP id
 ffacd0b85a97d-3b49a9ff53cmr4006145f8f.7.1751822203018; 
 Sun, 06 Jul 2025 10:16:43 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b966cbsm7848272f8f.49.2025.07.06.10.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jul 2025 10:16:42 -0700 (PDT)
Message-ID: <73afb65e-6622-4f64-8d2e-f9c08ae56119@smile.fr>
Date: Sun, 6 Jul 2025 19:16:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunog@fr24.com>, buildroot@buildroot.org
References: <20250611100915.1562316-1-nunog@fr24.com>
Content-Language: fr, en-US
In-Reply-To: <20250611100915.1562316-1-nunog@fr24.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751822203; x=1752427003; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lBmUmrApBT54OJLB5JKVQY8o3PxEt8kYC5O4yE8WKa0=;
 b=uGhMYWj70O5gwg0jOy5GoRXBJM9FlPlylXsXtzYndfXrh5w2pPJXsjBLSHYG00NEw7
 +PIrCs7zBWV9VLSErSGzCOlNcawynzKq25OfpF92dpkKjaOP1nEIN75OiJ1O7+Q8ulOh
 jLkmDMhh14LRmC33tlGqBxRJOYVuajIQKP/qk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=uGhMYWj7
Subject: Re: [Buildroot] [PATCH V2] package/systemd: disable fchmodat2 as
 changes are not visible in fakeroot
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

SGVsbG8gTnVubywgQWxsLAoKTGUgMTEvMDYvMjAyNSDDoCAxMjowOCwgTnVubyBHb27Dp2FsdmVz
IGEgw6ljcml0wqA6Cj4gV2hlbiBmY2htb2RhdDIgaXMgY2FsbGVkIGluIHN5c3RlbWQgdG1wZmls
ZXMsIGl0c2VsZiBjYWxsZWQgYnkKPiBmYWtlcm9vdF90bXBmaWxlcy5zaCwgdGhlIGNoYW5nZXMg
d2lsbCBub3QgYmUgdmlzaWJsZSBpbnNpZGUgdGhlCj4gZmFrZXJvb3QsIG1ha2luZyB0aGUgY2hh
bmdlcyBsb3N0IGZvciB0aGUgcHVycG9zZSBvZiByb290ZnMgZmlsZQo+IHBlcm1pc3Npb25zLgo+
IAo+IFRoaXMgd291bGQgYWZmZWN0IGJ1aWxkcyB3aGVuIGhvc3Qga2VybmVsID49IDYuNi4KClRo
aXMgcGFydGlhbGx5IHJldmVydCBhbiBzeXN0ZW1kIHVwc3RyZWFtIGNvbW1pdCBbMV0KCkNhbiB5
b3UgcHJvdmlkZSBhIHdheSB0byByZXByb2R1Y2UgYW5kIG5vdGljZSB0aGUgaXNzdWU/CldoYXQg
d2FzIHlvdXIgc3lzdGVtZCBhbmQgZmFrZXJvb3QgdmVyc2lvbj8KQ2FuIHlvdSByZXBvcnQgdGhp
cyBpc3N1ZSB0byBmYWtlcm9vdCB1cHN0cmVhbT8gKG9yIHN5c3RlbWQgbWF5YmUpCgpbMV0KaHR0
cHM6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC9jb21taXQvYWRlY2ZiM2JjMGJlMGRlZjQ5
NDMzMjc3ZmNhZDUzMzM4OTM3NTZjYwoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gU2lnbmVk
LW9mZi1ieTogTnVubyBHb27Dp2FsdmVzIDxudW5vZ0BmcjI0LmNvbT4KPiAtLS0KPiAgLi4uLWFz
LWNoYW5nZXMtYXJlLW5vdC12aXNpYmxlLWluLWZha2UuaHBhdGNoIHwgMzYgKysrKysrKysrKysr
KysrKysrKwo+ICBwYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tayAgICAgICAgICAgICAgICAgICAg
fCAgNSArKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL3N5c3RlbWQvaG9zdC1vbmx5LXBhdGNoZXMvMDAwMS1EaXNhYmxl
LWZjaG1vZGF0Mi1hcy1jaGFuZ2VzLWFyZS1ub3QtdmlzaWJsZS1pbi1mYWtlLmhwYXRjaAo+IAo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N5c3RlbWQvaG9zdC1vbmx5LXBhdGNoZXMvMDAwMS1EaXNh
YmxlLWZjaG1vZGF0Mi1hcy1jaGFuZ2VzLWFyZS1ub3QtdmlzaWJsZS1pbi1mYWtlLmhwYXRjaCBi
L3BhY2thZ2Uvc3lzdGVtZC9ob3N0LW9ubHktcGF0Y2hlcy8wMDAxLURpc2FibGUtZmNobW9kYXQy
LWFzLWNoYW5nZXMtYXJlLW5vdC12aXNpYmxlLWluLWZha2UuaHBhdGNoCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5mMTY3MzVkZjQ3Cj4gLS0tIC9kZXYvbnVsbAo+
ICsrKyBiL3BhY2thZ2Uvc3lzdGVtZC9ob3N0LW9ubHktcGF0Y2hlcy8wMDAxLURpc2FibGUtZmNo
bW9kYXQyLWFzLWNoYW5nZXMtYXJlLW5vdC12aXNpYmxlLWluLWZha2UuaHBhdGNoCj4gQEAgLTAs
MCArMSwzNiBAQAo+ICtGcm9tIDc4ZTMxY2MwOTMxZTU2Njc3NDI2MDA5NTc0MTEzMjZjZmNkOWM4
M2QgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206ID0/VVRGLTg/cT9OdW5vPTIwR29u
PUMzPUE3YWx2ZXM/PSA8bnVub2dAZnIyNC5jb20+Cj4gK0RhdGU6IFdlZCwgMTEgSnVuIDIwMjUg
MDk6NTE6NTAgKzAxMDAKPiArU3ViamVjdDogW1BBVENIXSBEaXNhYmxlIGZjaG1vZGF0MiBhcyBj
aGFuZ2VzIGFyZSBub3QgdmlzaWJsZSBpbiBmYWtlcm9vdAo+ICtNSU1FLVZlcnNpb246IDEuMAo+
ICtDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPiArQ29udGVudC1UcmFu
c2Zlci1FbmNvZGluZzogOGJpdAo+ICsKPiArV2hlbiBmY2htb2RhdDIgaXMgY2FsbGVkIGluIHN5
c3RlbWQgdG1wZmlsZXMsIGl0c2VsZiBjYWxsZWQgYnkKPiArZmFrZXJvb3RfdG1wZmlsZXMuc2gs
IHRoZSBjaGFuZ2VzIHdpbGwgbm90IGJlIHZpc2libGUgaW5zaWRlIHRoZQo+ICtmYWtlcm9vdCwg
bWFraW5nIHRoZSBjaGFuZ2VzIGxvc3QgZm9yIHRoZSBwdXJwb3NlIG9mIHJvb3RmcyBmaWxlCj4g
K3Blcm1pc3Npb25zLgo+ICsKPiArVGhpcyB3b3VsZCBhZmZlY3QgYnVpbGRzIHdoZW4gaG9zdCBr
ZXJuZWwgPj0gNi42Lgo+ICsKPiArU2lnbmVkLW9mZi1ieTogTnVubyBHb27Dp2FsdmVzIDxudW5v
Z0BmcjI0LmNvbT4KPiArLS0tCj4gKyBzcmMvYmFzaWMvZnMtdXRpbC5jIHwgMiAtLQo+ICsgMSBm
aWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvc3JjL2Jhc2lj
L2ZzLXV0aWwuYyBiL3NyYy9iYXNpYy9mcy11dGlsLmMKPiAraW5kZXggMDRmNzI5MGNjMi4uMmNh
ODA4MDc4ZSAxMDA2NDQKPiArLS0tIGEvc3JjL2Jhc2ljL2ZzLXV0aWwuYwo+ICsrKysgYi9zcmMv
YmFzaWMvZnMtdXRpbC5jCj4gK0BAIC0yOTgsOCArMjk4LDYgQEAgaW50IGZjaG1vZF9vcGF0aChp
bnQgZmQsIG1vZGVfdCBtKSB7Cj4gKyAKPiArICAgICAgICAgYXNzZXJ0KGZkID49IDApOwo+ICsg
Cj4gKy0gICAgICAgIGlmIChmY2htb2RhdDIoZmQsICIiLCBtLCBBVF9FTVBUWV9QQVRIKSA+PSAw
KQo+ICstICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsgICAgICAgICBpZiAoIUlOX1NFVChl
cnJubywgRU5PU1lTLCBFUEVSTSkpIC8qIFNvbWUgY29udGFpbmVyIG1hbmFnZXJzIGJsb2NrIHVu
a25vd24gc3lzY2FsbHMgd2l0aCBFUEVSTSAqLwo+ICsgICAgICAgICAgICAgICAgIHJldHVybiAt
ZXJybm87Cj4gKyAKPiArLS0gCj4gKzIuNDMuMAo+ICsKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9z
eXN0ZW1kL3N5c3RlbWQubWsgYi9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tawo+IGluZGV4IDcx
ZmUwZGU1NTAuLjZmZDAzN2UxNDAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9zeXN0ZW1kL3N5c3Rl
bWQubWsKPiArKysgYi9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tawo+IEBAIC0xMDM0LDYgKzEw
MzQsMTEgQEAgSE9TVF9TWVNURU1EX05JTkpBX0VOViA9IERFU1RESVI9JChIT1NUX0RJUikKPiAg
IyAqIHRodXMgcmUtdHdlYWsgcnBhdGggYWZ0ZXIgdGhlIGluc3RhbGxhdGlvbiBmb3IgYWxsIGJp
bmFyaWVzIHRoYXQgbmVlZCBpdAo+ICBIT1NUX1NZU1RFTURfSE9TVF9UT09MUyA9IGJ1c2N0bCBq
b3VybmFsY3RsIHN5c3RlbWN0bCBzeXN0ZW1kLSogdWRldmFkbQo+ICAKPiArZGVmaW5lIEhPU1Rf
U1lTVEVNRF9OT19GQ0hNT0RBVDIKPiArCSQoQVBQTFlfUEFUQ0hFUykgJChARCkgcGFja2FnZS9z
eXN0ZW1kL2hvc3Qtb25seS1wYXRjaGVzIDAwMDEtRGlzYWJsZS1mY2htb2RhdDItYXMtY2hhbmdl
cy1hcmUtbm90LXZpc2libGUtaW4tZmFrZS5ocGF0Y2gKPiArZW5kZWYKPiArSE9TVF9TWVNURU1E
X1BPU1RfUEFUQ0hfSE9PS1MgKz0gSE9TVF9TWVNURU1EX05PX0ZDSE1PREFUMgo+ICsKPiAgZGVm
aW5lIEhPU1RfU1lTVEVNRF9GSVhfUlBBVEgKPiAgCWZvciBmIGluICQoYWRkcHJlZml4ICQoSE9T
VF9ESVIpL2Jpbi8sJChIT1NUX1NZU1RFTURfSE9TVF9UT09MUykpOyBkbyBcCj4gIAkJWyAtZSAk
JGYgXSB8fCBjb250aW51ZTsgXAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
