Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A239CCA1005
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 14:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4769C60E15;
	Tue,  2 Sep 2025 14:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eHukcxSOn7m8; Tue,  2 Sep 2025 14:57:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FB1C60DE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FB1C60DE8;
	Tue,  2 Sep 2025 14:57:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFF9710E
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 14:57:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96376415F0
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 14:57:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnSYtqD97FtG for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 14:57:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 68D9640FB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68D9640FB7
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68D9640FB7
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 14:57:03 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45a1b065d59so37975035e9.1
 for <buildroot@buildroot.org>; Tue, 02 Sep 2025 07:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756825021; x=1757429821;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AxVwzOLP87zaJpGkd2Xn81d8/8NzPU3044+PvaSZrE0=;
 b=EGMc9luNbAg62WPxtatCrAuH+TLsbsYgbNQ3Z4bdLevs0rBWvgwoAHBoWyGsQF33DA
 J5zQS3E+j4B6O0gzbVcFqARHBHmPUlqPK0HwU/e0c0L0AXwqwLKPWcqF/BgsA0Nkw/NP
 jWGi9eNFu3DiJYCQk1RIKJuRYYTPwO86mnGFRDP7iIwooD59xqw6PQACTXS9unN4qUVe
 7jfnqye9EVwdo7hUod1OCPP6HKp3ZVs2HfU/FQyp+/8k3gLDUgLbdm6lZa3LRd+JwJHC
 cHnScgfkWtdube5cE1tU7ugRWDd0lHXn0hecXCOkBl5qshIRZAuaMpbUjkDLhAFufswg
 2P8w==
X-Gm-Message-State: AOJu0YyvUP/rRCDS6mV86KkSqgLXri+gdzxXQsjmlre5B4OB3c8vQ+hl
 hW1qwvJ3WrYk8hVMZrTiKLzyIpxggeovBTzEM+kXEYC/pc+4ZTubtV0GofdLRwgQ0gM=
X-Gm-Gg: ASbGncucKU3oha+1l3qEstD/7MPLopM/Q1vi+FIuViLDuAB7JEparzlO9zo232fWuI1
 MDV2jyhwZJOr+m+TFBTwVpxbZHHLoqbhLzWkFrdR4BJN40Q3jBhaRM5ScrVbi7pfmQDkfk9zarX
 vJ5ex5+R6sad0wE8wVt6UZh3VbXVB6J05mTZWHuHDa2VrOZnCccuoGDP5vwhKf2lQRy3Z/weGji
 z7RGPZxtJnuFgsr+R+183fO5/owi5ek4yy6j4juWfJPhe+KwBRvTKMfCXDGPy0KmbgM4wwx5gTP
 scr9nb0XasymACmhI+s2QJ0mt0WFw4ivuyaMv5yM3ov1Fav6BpPjV57MZ5R41xzfUKkMd29cv4u
 ZFb/mTvgnEmKlUcYvmKXpYaczjhswNMEOHoLCGLmrBZNExLEhe30P88aduxxp7810cHbWvOAV6h
 51QSyOVkedMiVe
X-Google-Smtp-Source: AGHT+IFD3/DMuSqg3v822Udkq/uf8x0FSwmF4uImYBMiRdlTbAHISyzACitLkwaM4BFPLj0ZDzfV4Q==
X-Received: by 2002:a05:600c:138c:b0:45b:75f0:2d66 with SMTP id
 5b1f17b1804b1-45b8553da82mr90778685e9.4.1756825021248; 
 Tue, 02 Sep 2025 07:57:01 -0700 (PDT)
Received: from [10.5.90.83]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7e7f0dfasm197637715e9.7.2025.09.02.07.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 07:57:00 -0700 (PDT)
Message-ID: <cdae50eb-2553-4baf-ac3d-450838705c32@smile.fr>
Date: Tue, 2 Sep 2025 16:56:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, David Pierret <david.pierret@smile.fr>,
 Romain Naour <romain.naour@smile.fr>
References: <20250902134250.622347-1-elmehdi.younes@smile.fr>
 <20250902154936.1563f079@windsurf>
Content-Language: en-US
In-Reply-To: <20250902154936.1563f079@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756825021; x=1757429821; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AxVwzOLP87zaJpGkd2Xn81d8/8NzPU3044+PvaSZrE0=;
 b=QQ2gzHgguFi/W5J/5rLBC8apgk0EV6qE3KLkWNi1lUri9Es09XOJyQU0pQXEO1UOQx
 9Lv2K7KW2O0k8I6ETOWkKcUUrUFgevmPoSTTGLHqioIijrFJSnQgWzLFXvPQjQZG2Chi
 yLpXaBrfWGjGMKgHPgrGaYM3fYhQ8odCSQs5A=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=QQ2gzHgg
Subject: Re: [Buildroot] [PATCH 1/1] package/bat: fix build with GCC 15
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkxlIDAyLzA5LzIwMjUgw6AgMTU6NDksIFRob21hcyBQZXRhenpvbmkgYSDDqWNyaXTCoDoKPiBI
ZWxsbywKPgo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPgo+IE9uIFR1ZSwgIDIgU2VwIDIwMjUg
MTU6NDI6NTAgKzAyMDAKPiBFbCBNZWhkaSBZT1VORVMgPGVsbWVoZGkueW91bmVzQHNtaWxlLmZy
PiB3cm90ZToKPgo+PiBCYXQgcHVsbHMgaW4gdGhlIG9uaWcgY3JhdGUgKHZlcnNpb24gNi40LjAp
IHRocm91Z2ggc3ludGVjdCB3aXRoIHRoZQo+PiBkZWZhdWx0ICJyZWdleC1vbmlnIiBmZWF0dXJl
LiBUaGlzIGNyYXRlIGRlcGVuZHMgb24gdGhlIE9uaWd1cnVtYSBDCj4+IGxpYnJhcnkgKHZpYSBv
bmlnX3N5cyksIHdoaWNoIGZhaWxzIHRvIGJ1aWxkIHdpdGggR0NDIDE1IGR1ZSB0byBDMjMKPj4g
a2V5d29yZCBjb25mbGljdHMuIE5ld2VyIHZlcnNpb25zIG9mIG9uaWcgZml4IHRoaXMgaXNzdWUs
IGJ1dCBiYXQKPj4gY2Fubm90IGRpcmVjdGx5IHVwZGF0ZSB0aGUgb25pZyB2ZXJzaW9uIGJlY2F1
c2UgaXQgaXMgcGlubmVkIGJ5IHN5bnRlY3QuCj4+Cj4+IFRvIHJlc29sdmUgdGhlIGJ1aWxkIGZh
aWx1cmUsIGFwcGx5IGEgcGF0Y2ggdGhhdCByZXBsYWNlcyB0aGUKPj4gInJlZ2V4LW9uaWciIGZl
YXR1cmUgd2l0aCAicmVnZXgtZmFuY3kiIGluIGJhdCdzIG1pbmltYWwtYXBwbGljYXRpb24KPj4g
ZmVhdHVyZSBzZXQuIFRoaXMgc3dpdGNoZXMgYmF0IHRvIHVzZSB0aGUgcHVyZS1SdXN0IGZhbmN5
LXJlZ2V4IGVuZ2luZQo+PiBpbnN0ZWFkIG9mIE9uaWd1cnVtYSwgYXZvaWRpbmcgdGhlIHByb2Js
ZW1hdGljIG9uaWdfc3lzIGRlcGVuZGVuY3kuCj4+Cj4+IEZpeGVzOgo+Pgo+PiAgICBodHRwczov
L2F1dG9idWlsZC5idWlsZHJvb3QubmV0Lz9yZWFzb249YmF0LSUKPiBUaGlzIGxpbmsgZG9lc24n
dCBtYWtlIHNlbnNlIGFzIGl0IGNhbiBjb250YWluIGZhaWx1cmVzIHVucmVsYXRlZCB0bwo+IHRo
aXMgb25lLCBlc3BlY2lhbGx5IGluIHRoZSBmdXR1cmUuIFlvdSBuZWVkIHRvIGluY2x1ZGUgdGhl
IGxpbmsgdG8gb25lCj4gc3BlY2lmaWMgYnVpbGQgcmVzdWx0LgpJIGNhbiBmaXggdGhpcyBpbiBh
IHYyIGlmIG5lZWRlZC4KPgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9iYXQvMDAwMS1SZXBsYWNl
LXJlZ2V4LW9uaWctYnktcmVnZXgtZmFuY3ktaW4tbWluaW1hbC1hcHBsaWNhLnBhdGNoIGIvcGFj
a2FnZS9iYXQvMDAwMS1SZXBsYWNlLXJlZ2V4LW9uaWctYnktcmVnZXgtZmFuY3ktaW4tbWluaW1h
bC1hcHBsaWNhLnBhdGNoCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAw
MDAuLjZkMTNjNDA2Y2MKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9wYWNrYWdlL2JhdC8wMDAx
LVJlcGxhY2UtcmVnZXgtb25pZy1ieS1yZWdleC1mYW5jeS1pbi1taW5pbWFsLWFwcGxpY2EucGF0
Y2gKPj4gQEAgLTAsMCArMSw0MCBAQAo+PiArRnJvbSA5YjY3MjdkZjI1ZTQ1MjIyYjM4NjNkYmU1
ZjViYzU4MjM3YjY4YWI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+PiArRnJvbTogRWwgTWVo
ZGkgWU9VTkVTIDxlbG1laGRpLnlvdW5lc0BzbWlsZS5mcj4KPj4gK0RhdGU6IFR1ZSwgMiBTZXAg
MjAyNSAxNDowMjoxMSArMDIwMAo+PiArU3ViamVjdDogW1BBVENIXSBSZXBsYWNlIHJlZ2V4LW9u
aWcgYnkgcmVnZXgtZmFuY3kgaW4gbWluaW1hbC1hcHBsaWNhdGlvbgo+PiArCj4+ICtUaGUgZGVm
YXVsdCAiYXBwbGljYXRpb24iIGZlYXR1cmUgZW5hYmxlcyAibWluaW1hbC1hcHBsaWNhdGlvbiIs
IHdoaWNoCj4+ICtpbiB0dXJuIHB1bGxzIGluIHRoZSAicmVnZXgtb25pZyIgZmVhdHVyZSBvZiBz
eW50ZWN0LiBUaGlzIGJyaW5ncyBpbiB0aGUKPj4gK29uaWcgY3JhdGUgKHZlcnNpb24gNi40LjAp
IGFuZCBpdHMgZGVwZW5kZW5jeSBvbmlnX3N5cywgd2hpY2ggZmFpbCB0bwo+PiArYnVpbGQgd2l0
aCBHQ0MgMTUgZHVlIHRvIEMyMyBrZXl3b3JkIGNvbmZsaWN0cy4KPj4gKwo+PiArSXQgaXMgbm90
IHBvc3NpYmxlIHRvIHNpbXBseSB1cGRhdGUgdGhlIG9uaWcgY3JhdGUgZnJvbSBiYXQgaXRzZWxm
LAo+PiArc2luY2UgaXRzIHZlcnNpb24gaXMgcGlubmVkIGluZGlyZWN0bHkgYnkgc3ludGVjdC4g
VG8gYXZvaWQgdGhpcwo+PiArZGVwZW5kZW5jeSBhbmQgZml4IHRoZSBidWlsZCwgcmVwbGFjZSAi
cmVnZXgtb25pZyIgd2l0aCAicmVnZXgtZmFuY3kiIGluCj4+ICsibWluaW1hbC1hcHBsaWNhdGlv
biIuIFRoaXMgbWFrZXMgYmF0IHVzZSB0aGUgcHVyZS1SdXN0IGZhbmN5LXJlZ2V4Cj4+ICtlbmdp
bmUgaW5zdGVhZCBvZiBPbmlndXJ1bWEsIHJlbW92aW5nIHRoZSBuZWVkIGZvciBvbmlnX3N5cyBh
bmQgYWxsb3dpbmcKPj4gK3RoZSBwYWNrYWdlIHRvIGJ1aWxkIHdpdGggR0NDIDE1Lgo+PiArCj4+
ICtVcHN0cmVhbTogbm90IHN1Ym1pdHRlZAo+IFdoeT8KCkRvIHlvdSBtZWFuIHdoeSB3ZSBhcmUg
c3dpdGNoaW5nIGZyb20gJ3JlZ2V4LW9uaWcnIHRvICdyZWdleC1mYW5jeScsCgpvciB3aHkgdGhl
IHBhdGNoIGhhcyBub3QgYmVlbiBzdWJtaXR0ZWQgdXBzdHJlYW0/Cgo+Cj4+ICtkaWZmIC0tZ2l0
IGEvQ2FyZ28udG9tbCBiL0NhcmdvLnRvbWwKPj4gK2luZGV4IDgwZDE5MzIxLi45M2EwN2ExZCAx
MDA2NDQKPj4gKy0tLSBhL0NhcmdvLnRvbWwKPj4gKysrKyBiL0NhcmdvLnRvbWwKPj4gK0BAIC0y
OSw3ICsyOSw3IEBAIG1pbmltYWwtYXBwbGljYXRpb24gPSBbCj4+ICsgICAgICJjbGFwIiwKPj4g
KyAgICAgImV0Y2V0ZXJhIiwKPj4gKyAgICAgInBhZ2luZyIsCj4+ICstICAgICJyZWdleC1vbmln
IiwKPj4gKysgICAgInJlZ2V4LWZhbmN5IiwKPj4gKyAgICAgIndpbGQiLAo+PiArIF0KPiBBcmUg
eW91IHN1cmUgdGhpcyB3b3Jrcz8gUGF0Y2hlcyBhcmUgYXBwbGllZCAqYWZ0ZXIqIHRoZSBkb3du
bG9hZCBzdGVwLAo+IGR1cmluZyB3aGljaCB3ZSBkbyB0aGUgQ2FyZ28gdmVuZG9yaW5nLiBBbHNv
LCBpZiB5b3UgcHVsbCBpbiBtb3JlCj4gZGVwZW5kZW5jaWVzLCBJIHdvdWxkIGV4cGVjdCB0aGUg
aGFzaCBvZiB0aGUgdGFyYmFsbCB0byBjaGFuZ2UsIHNpbmNlCj4gd2UgaGFzaCB0aGUgdGFyYmFs
bCBhZnRlciBDYXJnbyB2ZW5kb3JpbmcuCj4KPiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nIGhlcmU/
CkluIHRoaXMgcGF0Y2gsIEkgc3dpdGNoZWQgdGhlIGZlYXR1cmUgZnJvbSAncmVnZXgtb25pZycg
dG8gJ3JlZ2V4LWZhbmN5Jy4KVGhpcyBkb2VzIG5vdCBhZmZlY3QgdmVuZG9yaW5nIGluIG91ciBj
YXNlLCBzaW5jZSB2ZW5kb3JpbmcgaXMgYmFzZWQgb24KQ2FyZ28ubG9jay4gSW4gdGhlIGN1cnJl
bnQgQ2FyZ28ubG9jaywgJ3N5bnRlY3QnIGFscmVhZHkgbGlzdHMgYm90aAonZmFuY3ktcmVnZXgn
IGFuZCAnb25pZycgYXMgZGVwZW5kZW5jaWVzLiBUaGVyZWZvcmUsIHRoZSBzZXQgb2YgY3JhdGVz
CmluY2x1ZGVkIGluIHZlbmRvcmluZyByZW1haW5zIGV4YWN0bHkgdGhlIHNhbWUgYmVmb3JlIGFu
ZCBhZnRlciB0aGUgcGF0Y2gKKEkgdGVzdGVkIHRoaXMgbG9jYWxseSkuCgpXaGF0IHJlYWxseSBj
aGFuZ2VzIGlzIG9ubHkgYXQgY29tcGlsZSB0aW1lOiBhZnRlciB0aGUgcGF0Y2gsIENhcmdvIGJ1
aWxkcwp3aXRoICdmYW5jeS1yZWdleCcgaW5zdGVhZCBvZiAnb25pZycvJ29uaWdfc3lzJy4KCkRv
IHlvdSB0aGluayBJIHNob3VsZCBhdm9pZCB0aGlzIGFwcHJvYWNoPyBJZiBzbywgSSBjYW4gbG9v
ayBpbnRvIGFub3RoZXIKd2F5cyB0byBmaXggdGhpcwo+Cj4gVGhvbWFzCgpUaGFua3MKCkVsIE1l
aGRpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
