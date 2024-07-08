Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DCCC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 11:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E0248111F;
	Mon,  8 Jul 2024 11:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G-SHTdu6SWmJ; Mon,  8 Jul 2024 11:07:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E6A981117
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E6A981117;
	Mon,  8 Jul 2024 11:07:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 513A21BF352
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 11:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3ECB960769
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 11:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POWJ4ael7xy5 for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 11:07:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3B77D60767
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B77D60767
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B77D60767
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 11:07:13 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2eea8ea8bb0so13080251fa.1
 for <buildroot@buildroot.org>; Mon, 08 Jul 2024 04:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720436831; x=1721041631;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EpzXMzlbn4hGONx3c+jnGauCS4H1wolzVKzpe6c7rlU=;
 b=BmG19ug6y9MwLys+thzfYKlCtiwbfquTy67BGF56KEFk4JX5g/qpPfNfIT4V5GndZA
 tVxoCWmcFewWhRMr15w+AucyEgL1XyrLS/0PpgZ2LaJ3+WqzzQpSVcIk75N9oBH99NLN
 FTOTXSwQ7X23K8Q4ghsukbWiO4KzV0sj20DpQ526q7DhP7UbCoEIlVlbl1hdQZnwgltb
 eOZwbejsN0HNhZ3rXUXs0HHS3LSqbvzrIunF4kqCO4Ybw2lcCpVbsZpnPnWhrN3HwrQU
 nVPQfAQTJNyn3Yv/5tYVQPls7Z0fVpCXIcuHxNqjoIiQ8bvX4TpQZbz4LHHCvG7fZ3Bp
 t+Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuh0zLKOhYahXsebEP8kCtQtWz3brzj5TKMWAStq0GKcBaxirqtt1bqyn0ls5uvsShKL2uu3KTR738RPx7ltAS2KqHKMQw8A==
X-Gm-Message-State: AOJu0YzenBYO66fL5490Q+y6g/0Oxp1AqNf/NtjrarFQsBwYXA7ha0ne
 0EcI0JeLZrlh0f2e2hUI+ISLKZrWBCmksfr0f7qITev0gxF15lFOqM5owzZuIjs=
X-Google-Smtp-Source: AGHT+IE19HTgTWjVo04v/K0FaAAnQ9/eMIlR0a5CsG4b53N42dpX3HCmLjmNBiUNuoSRZVpdiLnrRQ==
X-Received: by 2002:a2e:9ad4:0:b0:2ee:8566:32cb with SMTP id
 38308e7fff4ca-2ee8ed91179mr85361461fa.16.1720436831556; 
 Mon, 08 Jul 2024 04:07:11 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36797bff8cbsm11938471f8f.14.2024.07.08.04.07.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jul 2024 04:07:11 -0700 (PDT)
Message-ID: <2e24e1d1-5b0a-49a7-85cf-d13203d6137a@mind.be>
Date: Mon, 8 Jul 2024 13:07:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>, buildroot@buildroot.org
References: <20240703082850.750420-1-sairon@sairon.cz>
 <20240703082850.750420-4-sairon@sairon.cz>
 <e5dab416-8316-4691-8ef6-3bfa00dd626c@mind.be>
 <339f64fe-2d7f-4442-9058-cecdf1d918b9@sairon.cz>
Content-Language: en-GB
In-Reply-To: <339f64fe-2d7f-4442-9058-cecdf1d918b9@sairon.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720436831; x=1721041631; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EpzXMzlbn4hGONx3c+jnGauCS4H1wolzVKzpe6c7rlU=;
 b=ZZLHH5Zvz93Szrz6WiCl9OZjikqEI4IxLMXkN55o5gDCNJXwjc6YqPaYxtdRG+9iHT
 1HjW0TemGS6qcTMezTIcU2RE0F/BDXrJgnpSpuCkksCYDI2FIKBSHwTFCav3kAp7hseK
 LDjBVpE27gTYwt/sIsLeK5URo6WoIOT+6OnbBVzANjPyujFFySBLUFP60k+oeO5UKclc
 87bGZnhV+3hmhI1v/FrQRZ8uUa7Y1tGnzaXhsgEYVESPNzYLSkMOzOeOS3BEVACYtSXs
 gNBIWzTFgGL+tq9dkYanV4J8HL4AbuTDSiHdPZNy0L4TpA7n+Ol/NjaYWmG3CAN8YDpr
 x98A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZZLHH5Zv
Subject: Re: [Buildroot] [PATCH 3/4] fs/erofs: add LZMA compression,
 allow configurable compression level
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Gao Xiang <hsiangkao@aol.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOC8wNy8yMDI0IDEyOjU2LCBKYW4gxIxlcm3DoWsgd3JvdGU6Cj4gSGkgQXJub3V0LAo+
IAo+IE9uIDA0LiAwNy4gMjQgMjI6MTgsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Pgo+
PiDCoMKgSXQgd291bGQgYmUgdXNlZnVsIHRvIGhhdmUgaGVscCB0ZXh0IGZvciB0aGVzZSBvcHRp
b25zLCBpbiBwYXJ0aWN1bGFyIAo+PiBleHBsYWluaW5nIGEgYml0IGFib3V0IHRoZSBzaXplL3Nw
ZWVkIHRyYWRlb2Zmcy4gQmFzaWNhbGx5IHN0dWZmIHRoYXQgeW91IGNhbiAKPj4gZ2V0IGZyb20g
ZXJvZnMgZG9jdW1lbnRhdGlvbi4gRm9yIHN1cmUsIHRoZSBvcmlnaW5hbCBoZWxwIHRleHQgKHRo
YXQgZXhwbGFpbnMgCj4+IHRoYXQgSEMgc3RhbmRzIGZvciBIaWdoIENvbXByZXNzaW9uKSBzaG91
bGRuJ3QgYmUgcmVtb3ZlZC4KPj4KPiAKPiBJIGRvbid0IHdhbnQgdG8gYXJndWUgYnV0IEknbSBu
b3Qgc3VyZSBpZiB3ZSBzaG91bGQgZ28gdG9vIGRlZXAgaGVyZS4gVGhlcmUncyAKPiBhbHNvIG5v
IGVsYWJvcmF0ZSBleHBsYW5hdGlvbiBvZiBvcHRpb25zIHRoYXQgYXJlIGF2YWlsYWJsZSBmb3Ig
b3RoZXIgCj4gZmlsZXN5c3RlbXMgYW5kIHRoZSBwZXJmb3JtYW5jZSBtYXkgZGVwZW5kIG9uIHZh
cmlvdXMgZmFjdG9ycywgaW5jbHVkaW5nIHRoZQoKICBGb3IgbW9zdCBvdGhlciBmaWxlc3lzdGVt
cywgdGhlIGNvbXByZXNzaW9uIGlzIG9ubHkgdGhlIGltYWdlIHRoYXQgZ2V0cyAKY29tcHJlc3Nl
ZDsgdGhlIGFjdHVhbCBmaWxlc3lzdGVtIHVzZWQgb24gdGhlIHRhcmdldCB3aWxsIGJlIHVuY29t
cHJlc3NlZC4KCiAgTW9yZSBpbXBvcnRhbnRseSB0aG91Z2g6IGl0J3Mgbm90IGJlY2F1c2Ugb3Ro
ZXIgZmlsZXN5c3RlbXMgZG9uJ3QgaGF2ZSBhIGdvb2QgCmhlbHB0ZXh0IHRoYXQgd2Ugc2hvdWxk
IGNvbnRpbnVlIHRoYXQgYmFkIHRyZW5kIDotKQoKPiBoYXJkd2FyZSB0aGUgc3lzdGVtIGlzIHJ1
bm5pbmcgb24uIFNvIG1heWJlIGp1c3Qgc29tZXRoaW5nIGxpa2UgYSBhIHNob3J0IAo+IG1lbnRp
b24gdGhhdCBMWk1BIGlzIG11Y2ggc2xvd2VyIGJvdGggZm9yIGNvbXByZXNzaW9uIGFuZCBkZWNv
bXByZXNzaW9uIGJ1dCAKPiBnaXZlcyBiZXR0ZXIgY29tcHJlc3Npb24gcmF0aW9zPwoKICBZZXMs
IHRoYXQncyBleGFjdGx5IHdoYXQgSSB3YXMgbG9va2luZyBmb3IuIEFsc28gdGhlIGlkZWEgaXMg
dG8gcmV1c2UgdGhlIApkZXNjcmlwdGlvbnMgdGhhdCB1cHN0cmVhbSBnaXZlcy4gSWYgdXBzdHJl
YW0gZG9lc24ndCBoYXZlIGFueSBkZXNjcmlwdGlvbiwgaXQncyAKT0sgZm9yIG1lIHRvIGxlYXZl
IGl0IGVtcHR5IChqdXN0IG1lbnRpb24gdGhhdCBmYWN0IGluIHRoZSBjb21taXQgbWVzc2FnZSku
Cgo+Pj4gK2VuZGNob2ljZQo+Pj4gKwo+Pj4gK2lmIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0xa
NEhDCj4+PiArCj4+PiArY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0xaNEhDX0xFVkVM
Cj4+PiArwqDCoMKgIGludCAibHo0aGMgY29tcHJlc3Npb24gbGV2ZWwiCj4+PiArwqDCoMKgIGRl
ZmF1bHQgOQo+Pj4gK8KgwqDCoCByYW5nZSAxIDEyCj4+PiArwqDCoMKgIGhlbHAKPj4+ICvCoMKg
wqDCoMKgIFNwZWNpZnkgdGhlIGNvbXByZXNzaW9uIGxldmVsIGZvciBsejRoYyBjb21wcmVzc2lv
bi4KPj4KPj4gwqDCoFRoaXMgc2hvdWxkIGV4cGxhaW4gYWxzbyB0aGF0IGhpZ2hlciB2YWx1ZXMg
Y29tcHJlc3MgbW9yZSBidXQgYXJlIHNsb3dlciAKPj4gKGFzc3VtaW5nIHRoYXQgdGhhdCBpcyBj
b3JyZWN0IDotKSApLgo+Pgo+IAo+IFRoYXQgc2hvdWxkIGJlIGNvcnJlY3QuIE9yIHRvIGJlIG1v
cmUgcHJlY2lzZSwgbWFpbmx5IHRoZSBjb21wcmVzc2lvbiBzcGVlZCAKPiBkZWNyZWFzZXMgd2l0
aCBoaWdoZXIgbGV2ZWwsIEFGQUlLIGRlY29tcHJlc3Npb24gc3BlZWQgc2hvdWxkIGJlIGZhaXJs
eSBzdGFibGUgCj4gKHNhbWUgZ29lcyBmb3IgTFpNQSkuCgogIENvbXByZXNzaW9uIHRpbWUgaXNu
J3QgcmVhbGx5IGEgcmVsZXZhbnQgZmFjdG9yIGJlY2F1c2UgaXQncyBidWlsZCB0aW1lIG9ubHkg
CmFuZCBpdCBzaG91bGQgYmUgbXVjaCBhbmQgbXVjaCBsZXNzIHRoYW4gdGhlIHRpbWUgb2YgdGhl
IGJ1aWxkIGl0c2VsZi4uLiBFeGNlcHQgCmlmIHRoZSBpbXBhY3QgaXMgcmVhbGx5IGh1Z2UuCgog
IFNvIGlzIGl0IHJlYWxseSB1c2VmdWwgdG8gaGF2ZSB0aGlzIGFzIGFuIG9wdGlvbj8gV2h5IG5v
dCBoYXJkY29kZSBpdCB0byB0aGUgCm1heGltdW0gbGV2ZWw/IChJLmUuIGtlZXAgaXQgbGlrZSBi
ZWZvcmUsIGEgaGFyZGNvZGVkIHZhbHVlLCBqdXN0IGNoYW5nZSB0aGUgCnZhbHVlIGZyb20gOSB0
byAxMi4pCgo+Pj4gK2VuZGlmICMgQlIyX1RBUkdFVF9ST09URlNfRVJPRlNfTFo0SEMKPj4+ICsK
Pj4+ICtpZiBCUjJfVEFSR0VUX1JPT1RGU19FUk9GU19MWk1BCj4+PiArCj4+PiArY29uZmlnIEJS
Ml9UQVJHRVRfUk9PVEZTX0VST0ZTX0xaTUFfTEVWRUwKPj4+ICvCoMKgwqAgaW50ICJsem1hIGNv
bXByZXNzaW9uIGxldmVsIgo+Pj4gK8KgwqDCoCBkZWZhdWx0IDYKPj4+ICvCoMKgwqAgcmFuZ2Ug
MCAxMDkKPj4KPj4gwqDCoEEgYml0IHNpbGx5IHRvIHNwZWNpZnkgYSByYW5nZSBpZiB2YWx1ZXMg
MTAtOTkgYXJlbid0IHZhbGlkIGFueXdheS4uLiBCdXQgCj4+IE9LLCBpdCdzIGRpZmZpY3VsdCB0
byBnZXQgYXJvdW5kIHRoYXQuCj4+Cj4gCj4gSW5kZWVkIGl0IGlzLCBidXQgaXQncyB3aGF0IG1r
ZnMuZXJvZnMgZG9lcy4gQWx0ZXJuYXRpdmUgd291bGQgYmUgdG8gc3BsaXQgaXQgdG8gCj4gdHdv
IG9wdGlvbnMgLSB0aGUgY29tcHJlc3Npb24gbGV2ZWwgYW5kIGEgZmxhZyBmb3IgZXh0cmVtZSBj
b21wcmVzc2lvbiwgYW5kIHRoZW4gCj4gImNhbGN1bGF0ZSIgdGhlIHZhbHVlIGluIHRoZSBtYWtl
ZmlsZS4gQnV0IEknbSBub3Qgc3VyZSBpZiBpdCdzIGJldHRlciB0byBkbyBpdCAKPiBsaWtlIHRo
aXMgKHRvIGF2b2lkIGluY29ycmVjdCB2YWx1ZXMgdG8gYmUgc2V0KSwgb3IgdG8gcHJvdmlkZSBy
YXRoZXIgCj4gdHJhbnNwYXJlbnQgY29uZmlndXJhdGlvbiBvcHRpb25zIGZvciB0aGUgdW5kZXJs
eWluZyBta2ZzIHRvb2wuIFdEWVQ/CgogIEtlZXAgaXQgbGlrZSBpdCBpcyAtIHdlIGdlbmVyYWxs
eSBwcmVmZXIgdG8gZm9sbG93IGNsb3NlbHkgdG8gd2hhdCB1cHN0cmVhbSBkb2VzLgoKCiAgUmVn
YXJkcywKICBBcm5vdXQKCgo+PiDCoMKgSSBkb24ndCB0aGluayBzdHJpcHBpbmcgaXMgbmVlZGVk
IGZvciBpbnQgb3B0aW9ucywgaXMgaXQ/Cj4gCj4gSSBkb24ndCB0aGluayBzbyBlaXRoZXIsIGl0
J3MgYSBsZWZ0b3ZlciBvZiBhIGRpZmZlcmVudCB3YXkgSSBoYW5kbGVkIGl0IGluIG15IAo+IHBy
b3RvdHlwZSB3aGljaCBJIHRoZW4gYmxpbmRseSBjb3B5LXBhc3RlZC4gSSdsbCBmaXggaXQgaW4g
dGhlIG5leHQgc2VyaWVzLgo+IAo+IFJlZ2FyZHMsCj4gSmFuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
