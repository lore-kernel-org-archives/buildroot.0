Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B52FE8306F
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 09:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3346360855;
	Tue,  3 Feb 2026 09:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5HAafeR1Wat; Tue,  3 Feb 2026 09:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4091D60631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770110918;
	bh=dX/DCThJuGKnQyHKlvn1Al4g+0WJVBVE965rdkDFLnY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Syk77FEuG1rW+BSgHeoQWDi28Yjd0IQuOuE3YGhZODfhH7wwyFcXJTq2WDYwEMIvA
	 gjITuuAsZJXQEfDqy3+zjzSfDRmwOARS68viX2+4Nk5bT5yGLwtKadtVR7fMBtPCxk
	 7yhRQSK4cuAu3EP+1IawKjlHCZV8UdQI4Kxm7GhkhzxEzCWpc/Kv+cIBK88iBGiTn1
	 XKvYAJg0gYuo7NDOsDjjC+6/f1oMRJrjHQvePSlEFDXan4e048TfrS+l6YKD50LC6Q
	 go6m1uHHHhehFSKKAaOtDCCrNkGvxdLa/jWRJJf8maoR4ByUGokGPm5OmxmXWV6O0y
	 yoQjN4wffIeog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4091D60631;
	Tue,  3 Feb 2026 09:28:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65EBA1A6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52B074050D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oj2AP7KSKZCA for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 09:28:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DA4374043E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA4374043E
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA4374043E
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:28:35 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-42fb2314f52so3129831f8f.0
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 01:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770110913; x=1770715713;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6vYb84ZGdTUxV5jc/UpM+yoo06C01zun7JvUadkw6q0=;
 b=MuqT3VcKDzieGLoWlA5sk3R2hm7ODL0WsSPXvbOWZ7DaY19HZQF2/8tkvc9CNnG3dg
 mqO958HJUGN23a9Z+W4dOuFhzHXKzxugBR8ysR+LK8LAQ3jpaLqZhlieNAt8Y1u+1mZ8
 m/nZD3wP3rv7X4A6Gr89uMHlOYLatCNVN6bSLo0CArS5/ZlZnBVk40Xy2z0Txxsd0ucw
 VeTtN/xCbj6hJgl+H8JfEOmM0Sx8i9n3BFG+p35kyoUzeckoEHX0L/5MTNcTwWzjpe7b
 b1mTOjj+pqO+PRrOhyw/syQqIvKuLODDG3MlvhInfT26Kyl2jBKYCyKZDrSQjt4PqUaX
 KSVA==
X-Gm-Message-State: AOJu0Yzoa2AgizxAoUGV/brKFRLvQU202ZHgs5V/ZoCmXBUcZyTvLmJp
 FWtY6LGddSBnssD8j0VFfUzFUUzXzqh+zg+seLtdo59qmkvUOabBBDeZGtF8OEXabVUjkH7DwKc
 PSf4Zdjs=
X-Gm-Gg: AZuq6aI0ZBxZVGd3vj40LHUZzcpHoQzdHrbcwnwxr6eTxcZjmpR/R5U4qMPhccT2BBm
 BjkkBIwoUgc3Vw8H5gVFnYNpdnRkybk5T9F1OnAfWCV0/D7zjYzduvASvjhv+8FZeIgLgHABhDC
 QwtY/3Yp90WCdDUPL19zLYtSODLv0xPRorVQpcSgVyyKuTibrrDCB7sFPnli6B72bqKvQIr9mdL
 0TeAeONFJMIOOI4oDOiJWyiSwB53/d9QeR2swmc5iXoIhFbW/DJiPvGWaHxhjahehuyfxicfyn1
 VT0kCyqcif3x/J3RFuuASVW3Zvf73dTycSJn3kxbOrkpXnFABtzYRJVOY52RbLL7FSNocAHXdjb
 180NRwQ6moryWbhDtmZOOSlbuo7c7nqZjTSI8Jn5zDH3o2CFljMKYDGn0Wcl7rKSTSd9KgACmg2
 0ieHKj7oCLbbnJBerXDs3C6N93WeT6rp4tIdGnzZnImxlvqNWkUEV6Gwq/mqk=
X-Received: by 2002:a05:6000:4023:b0:432:851d:35ef with SMTP id
 ffacd0b85a97d-435f3aaea50mr21741396f8f.42.1770110913172; 
 Tue, 03 Feb 2026 01:28:33 -0800 (PST)
Received: from [172.16.2.211] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1322f40sm48806099f8f.34.2026.02.03.01.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 01:28:32 -0800 (PST)
Message-ID: <c8defb4d-4f5f-4bdf-8ff9-4adad5891fcd@mind.be>
Date: Tue, 3 Feb 2026 10:28:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
References: <20251228213710.2591716-1-james.hilliard1@gmail.com>
 <20251228213710.2591716-2-james.hilliard1@gmail.com>
 <CA+h8R2rJFvtnP4DD7qwGx0smh7sgkDeptMUibqhJgSUuUO3Lyw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CA+h8R2rJFvtnP4DD7qwGx0smh7sgkDeptMUibqhJgSUuUO3Lyw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770110913; x=1770715713; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6vYb84ZGdTUxV5jc/UpM+yoo06C01zun7JvUadkw6q0=;
 b=H/2uvE4+5pAjJCcc9c/Y9JC6d1IRWGHDXecpoNmEOnUOyRsxyqZPOJkeboWUy0pW+Z
 10jrKHlh9zLzLB+TtiDofcnTXVV1S82lNWIx5+qIrsLZ938lp7q2KBX5IDLpklmev2yl
 RdIjfpTwKufF6x0aijsw80zBmOiB4x1qAQZYNvvbaFgPiWMA5lybwY2STJ04MVDF6uFF
 Of/rZ8OPxTAn+DPkGgckaY9QmNVX6rxX9v/IOb6OOb3OqMM4m6YMiyuo5f5Qgq9qQZ0C
 faL8dQU7sXdd0KA7BgSWAm/hu72KMe4pllbgq8UebUMfQarww2Ggf4o9CCIlFTSKCLpn
 xbsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=H/2uvE4+
Subject: Re: [Buildroot] [PATCH v6 2/3] package/pkg-golang.mk: make GOPROXY
 configurable
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsIENocmlzdGlhbiBhbmQgYWxsLAoKV2UganVzdCBkaXNjdXNzZWQgdGhpcyBz
ZXJpZXMgSVJMLgoKT24gMjkvMTIvMjUgMDE6MzEsIENocmlzdGlhbiBTdGV3YXJ0IHZpYSBidWls
ZHJvb3Qgd3JvdGU6Cj4gSGkgYWxsLAo+Cj4KPiBPbiBTdW4sIERlYyAyOCwgMjAyNSBhdCAxOjM3
4oCvUE0gSmFtZXMgSGlsbGlhcmQKPiA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6
Cj4+IEJSMl9HT1BST1hZIG5vdyBjb25maWd1cmVzIHRoZSBHbyBtb2R1bGUgcHJveHkgVVJMIHVz
ZWQgdG8gZG93bmxvYWQgR28gbW9kdWxlcwo+PiBzcGVjaWZpZWQgaW4gcHJvamVjdCBnby5tb2Qg
YW5kIGdvLnN1bSBmaWxlcy4gQnkgZGVmYXVsdCwgaXQgdXNlcyBHb29nbGUncwo+PiBvZmZpY2lh
bCBHbyBtb2R1bGUgbWlycm9yIGF0IHByb3h5LmdvbGFuZy5vcmcsIGZhbGxpbmcgYmFjayB0byBk
aXJlY3QgZG93bmxvYWRzCj4+IGlmIHRoZSBtb2R1bGUgaXMgbm90IGZvdW5kIGluIHRoZSBtaXJy
b3IuCj4+Cj4+IFRoZSBkZWZhdWx0IHZhbHVlIGZyb20gdGhlIHRvb2xjaGFpbiBjYW4gYmUgcmVh
ZCB3aXRoICJnbyBlbnYgR09QUk9YWSIKWy0tU05JUC0tXQoKPj4KPj4gK2NvbmZpZyBCUjJfR09Q
Uk9YWQo+PiArICAgICAgIHN0cmluZyAiR28gbW9kdWxlIHByb3h5Igo+PiArICAgICAgIGRlZmF1
bHQgImh0dHBzOi8vcHJveHkuZ29sYW5nLm9yZyxkaXJlY3QiCkluIG15IG9waW5pb24gKHdpdGgg
bXkgTFRTIHN0ZXdhcmQgaGF0KSwgd2Ugc2hvdWxkbid0IGNoYW5nZSB0aGUgZGVmYXVsdCAKaW4g
QnVpbGRyb290IHRvIGdvIHRocm91Z2ggdGhlIHByb3h5IGZpcnN0LCBhcyBpdCBtYXkgaW50cm9k
dWNlIApzdXBwbHktY2hhaW4gcmVsYXRlZCB2dWxuZXJhYmlsaXRpZXMuCgpXb3VsZCB5b3UgY29u
c2lkZXIgc2V0dGluZyB0aGUgZGVmYXVsdCB0byBgZGlyZWN0YCAoYXMgaXQgaXMgY3VycmVudGx5
KSwgCmFuZCB0aGVuIGluIHRoZSBoZWxwIHRleHQgYmVsb3cgKG9yIHRoZSBCdWlsZHJvb3QgdXNl
ciBtYW51YWwpLCBpbmRpY2F0ZSAKdGhhdCBzb21lIHBhY2thZ2VzIG1heSBhY3R1YWxseSByZXF1
aXJlIHRvIHVzZSAKImh0dHBzOi8vcHJveHkuZ29sYW5nLm9yZyxkaXJlY3QiLCBhdCB0aGUgdXNl
cidzIG93biByaXNrID8KCktpbmQgcmVnYXJkcywKVGl0b3VhbgoKPj4gKyAgICAgICBkZXBlbmRz
IG9uIEJSMl9QQUNLQUdFX0hPU1RfR09fVEFSR0VUX0FSQ0hfU1VQUE9SVFMKPj4gKyAgICAgICBo
ZWxwCj4+ICsgICAgICAgICBUaGUgR28gbW9kdWxlIHByb3h5IFVSTCB1c2VkIHRvIGRvd25sb2Fk
IEdvIG1vZHVsZXMuIEJ5Cj4+ICsgICAgICAgICBkZWZhdWx0LCBpdCB1c2VzIHRoZSBvZmZpY2lh
bCBHbyBtb2R1bGUgbWlycm9yLCBmYWxsaW5nIGJhY2sKPj4gKyAgICAgICAgIHRvIGRpcmVjdCBk
b3dubG9hZHMgaWYgdGhlIG1vZHVsZSBpcyBub3QgZm91bmQgaW4gdGhlIG1pcnJvci4KPj4gKwo+
PiArICAgICAgICAgVGhlIHZhbHVlIGNhbiBiZSBvbmUgb2Y6Cj4+ICsgICAgICAgICAgIC0gQ29t
bWEtc2VwYXJhdGVkIGxpc3Qgb2YgcHJveHkgVVJMcwo+PiArICAgICAgICAgICAtICJvZmYiIHRv
IGRpc2FibGUgYWxsIGRvd25sb2Fkcwo+PiArICAgICAgICAgICAtICJkaXJlY3QiIHRvIGRvd25s
b2FkIGRpcmVjdGx5IGZyb20gc291cmNlIHJlcG9zaXRvcmllcwo+PiArCj4+ICsgICAgICAgICBT
ZWUgaHR0cHM6Ly9nby5kZXYvcmVmL21vZCNtb2R1bGUtcHJveHkKPj4gKwo+PiAgIGNvbmZpZyBC
UjJfQ1BBTl9NSVJST1IKPj4gICAgICAgICAgc3RyaW5nICJDUEFOIG1pcnJvciAoUGVybCBwYWNr
YWdlcykiCj4+ICAgICAgICAgIGRlZmF1bHQgImh0dHBzOi8vY3Bhbi5tZXRhY3Bhbi5vcmciCj4+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy1nb2xhbmcubWsgYi9wYWNrYWdlL3BrZy1nb2xhbmcu
bWsKPj4gaW5kZXggMjZkYTdiZTcxYi4uM2UzODhjYjI1NyAxMDA2NDQKPj4gLS0tIGEvcGFja2Fn
ZS9wa2ctZ29sYW5nLm1rCj4+ICsrKyBiL3BhY2thZ2UvcGtnLWdvbGFuZy5tawo+PiBAQCAtMTAx
LDcgKzEwMSw3IEBAICQoMilfUE9TVF9QQVRDSF9IT09LUyArPSAkKDIpX0dFTl9HT01PRAo+PiAg
ICQoMilfRE9XTkxPQURfUE9TVF9QUk9DRVNTID0gZ28KPj4gICAkKDIpX0RMX0VOViArPSBcCj4+
ICAgICAgICAgICQkKEhPU1RfR09fQ09NTU9OX0VOVikgXAo+PiAtICAgICAgIEdPUFJPWFk9Imh0
dHBzOi8vcHJveHkuZ29sYW5nLm9yZyxkaXJlY3QiIFwKPj4gKyAgICAgICBHT1BST1hZPSQkKGNh
bGwgcXN0cmlwLCQkKEJSMl9HT1BST1hZKSkgXAo+PiAgICAgICAgICAkJCgkKDIpX0dPX0VOVikK
Pj4KPj4gICAjIElmIGJ1aWxkaW5nIGluIGEgc3ViIGRpcmVjdG9yeSwgZG8gdGhlIHZlbmRvcmlu
ZyBpbiB0aGVyZQo+PiAtLQo+PiAyLjQzLjAKPj4KPiBUaGlzIFBSIGhhcyBiZWVuIGhhbmdpbmcg
Zm9yIGEgd2hpbGUgLSBJIHJlY29tbWVuZCBtZXJnaW5nIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4KPgo+IEJlc3QgcmVnYXJk
cywgaGFwcHkgaG9saWRheXMsIGhhcHB5IG5ldyB5ZWFyLCBldGMgOikKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
