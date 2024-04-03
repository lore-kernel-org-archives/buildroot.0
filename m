Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2420ECD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 21:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C66F416AE;
	Wed,  3 Apr 2024 21:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hodbQs_zffG0; Wed,  3 Apr 2024 21:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C221417C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C221417C2;
	Wed,  3 Apr 2024 21:00:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EFF51BF408
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18E3B8223F
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EV3wjEHvt4t0 for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 21:00:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B3E968223C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3E968223C
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3E968223C
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 21:00:28 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41628f4c665so1089125e9.0
 for <buildroot@buildroot.org>; Wed, 03 Apr 2024 14:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712178026; x=1712782826;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ioz3Rn5yyz76VWZRaLxG2xJAcAZEVMWFjK3CQkQkwVU=;
 b=D2B+lG9+7+OQTeoCkywA44dK0iq2/MQ/PjV/JdKxckfSF1jFejcIyx/El99SsgvWhR
 GzrUvgvi591JYNV8+g61vlVxP4Ypzyn0Op3gxvFMqyKTAXKu5X7d+5XLxa6zvvKPHXVf
 8jL4d7fV+puKQh50gvAY9ZxiyqVHK03COzmUb1D7/Mu0p3+2ox04FiagbBakEwXtVWqW
 jqVDwKfwvdleFKq5+5UhVKKiPUR52aNXV+29apT4k/c4v7ws1rhdHcVpz+Ghzay8ZWB1
 MA5mFQlhew/g7xs+UvfKjZQfXXOvc8d/oH2foLYp/s4crIqpmhXc/aacEzDYckYUAxTo
 jp0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMrbIcFIwcHEmLVXnEf+ZZ5iDoVp0dCqQgE2Kcs7gMIb62jWwMFstc3RG+skR/euA7sjwzTMFpTAcdSxlUiS2l8K0MfFvELA==
X-Gm-Message-State: AOJu0Yy5+SJEmHpqHjVqGp+5koRwZFL7kocR2rBu4Yzmo+UbOTg9davR
 v3lTFdFxej3iVKIZv+aAZqLUBSXvbcbekfWeudfKvxlFI3d/8yADVjaGqO0/bMPdJDvbU5QvBy1
 c
X-Google-Smtp-Source: AGHT+IGmCiE3WIiv66f13RSVzT6jWBdTAxLssggXGASWhNVdWUAucrIPqSwABZrvale7LKpgZDMJoA==
X-Received: by 2002:a05:600c:2ed3:b0:415:67ac:3245 with SMTP id
 q19-20020a05600c2ed300b0041567ac3245mr622834wmn.28.1712178025951; 
 Wed, 03 Apr 2024 14:00:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a05600c350200b00414906f1ea1sm317756wmq.17.2024.04.03.14.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 14:00:25 -0700 (PDT)
Message-ID: <641375f4-12ec-44a9-a80a-5a1fbbfc4e0f@mind.be>
Date: Wed, 3 Apr 2024 23:00:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Boerge Struempfel <boerge.struempfel@gmail.com>
References: <20240123155829.387063-1-bstruempfel@ultratronik.de>
 <20240123155829.387063-2-bstruempfel@ultratronik.de>
Content-Language: en-GB
In-Reply-To: <20240123155829.387063-2-bstruempfel@ultratronik.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712178026; x=1712782826; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ioz3Rn5yyz76VWZRaLxG2xJAcAZEVMWFjK3CQkQkwVU=;
 b=azkJJ+lfyI/GU66JjFXSDxn54laW2XRufooTS9ix2SlDi5ogXk94KvhXcd8M45MC+0
 J0BfltoeSwfpxk7TO9OZSdr+VC59wFKlyftzNIfrv0p1LrD1ir4Tb3dr56T0o42cmzQ9
 s7gbW9X6nlfqgkE2mjWRuJxQELuFBkNyJ4gyswbzrRnbwH4ffopkSQoOZ07KGvI6bKLu
 mBYQUZFRYPkwBqt9q+4jBbEP1iSvvAmU93Q/SfVcim1jeYGI1r372vzaYqIX6Ouj/I1f
 tCB1d8wd+7EfHOvAsm0Hwz21QSC9k41hhFiDWx6v0VT+y1DZsQpbQYq+7HM+0/D66boA
 Z96w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=azkJJ+lf
Subject: Re: [Buildroot] [PATCH v4 1/2] package/libgpiod2: new package
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
Cc: vfazio@xes-inc.com, bonet@grenoble.cnrs.fr, bstruempfel@ultratronik.de,
 Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIzLzAxLzIwMjQgMTY6NTgsIEJvZXJnZSBTdHJ1ZW1wZmVsIHdyb3RlOgo+IEZyb206IEJv
ZXJnZSBTdHJ1ZW1wZmVsIDxib2VyZ2Uuc3RydWVtcGZlbEBnbWFpbC5jb20+Cj4KPiBEdWUgdG8g
YSBzaWduaWZpY2FudCBhcGkgY2hhbmdlIGFzIHdlbGwgYXMgbW9yZSByZWNlbnQga2VybmVsIHZl
cnNpb24KPiByZXF1aXJlbWVudHMsIHdlIGludHJvZHVjZSBhIHNlcGFyYXRlIHBhY2thZ2UgZm9y
IHZlcnNpb24gMi4wIGFuZCBoaWdoZXIuCj4gVGhlIG5ld3BhY2thZ2UgaXMgaW5jb21wYXRpYmxl
IHRvIGxpYmdwaW9kIDEueC4gVGhpcyBhbGxvd3MgZm9yIGl0ZXJhdGl2ZWx5Cj4gdXBkYXRpbmcg
YWxsIGRlcGVuZGVudCBwYWNrYWdlcyB3aXRob3V0IGJyZWFraW5nIGFueXRoaW5nIGFzIGEgcmVz
dWx0Lgo+Cj4gRm9yIG5vdyB3ZSB3aWxsIGhhdmUgbGliZ3Bpb2QyIGRlcGVuZCBvbiAhbGliZ3Bp
b2QuIEhvd2V2ZXIsIGluIHRoZQo+IGZ1dHVyZSwgaXQgbWlnaHQgYmUgcHJlZmVyYWJsZSB0byBo
YXZlIGl0IHRoZSBvdGhlciB3YXkgYXJvdW5kLAo+IHN1Y2ggdGhhdCBwYWNrYWdlcywgd2hpY2gg
c2VsZWN0IGxpYmdwaW9kMiBkb24ndCBoYXZlIHRvIGFsc28gYWRkIHRoZQo+IHRoZSAhbGliZ3Bp
b2QgZGVwZW5kZW5jeS4KPgo+IE5vdGUgdGhhdCB0aGlzIHBhY2thZ2UgZG9lcyBub3QgY29ycmVz
cG9uZCB0byB0aGUgZGViaWFuIGxpYmdwaW9kMiBwYWNrYWdlLAo+IHdoaWNoIGN1cnJlbnRseSB1
c2VzIG9ubHkgdmVyc2lvbiAxLjYuMwo+Cj4gU2lnbmVkLW9mZi1ieTogQm9lcmdlIFN0cnVlbXBm
ZWwgPGJzdHJ1ZW1wZmVsQHVsdHJhdHJvbmlrLmRlPgoKIMKgQXBwbGllZCB0byBtYXN0ZXIsIGFm
dGVyIGRpc2FibGluZyB0aGUgcHl0aG9uIGJpbmRpbmdzLCBhcyByZXBvcnRlZCBieSBNYXJjdXMu
IApJIHRoaW5rIHRoZSBzb2x1dGlvbiBpcyBzaW1wbHkgdG8gYWRkIFBLR19QWVRIT05fU0VUVVBU
T09MU19FTlYgdG8gdGhlIAplbnZpcm9ubWVudCBidXQgSSBkaWRuJ3QgdGVzdCBpdC4KCgogwqBS
ZWdhcmRzLAogwqBBcm5vdXQKCgo+IC0tLQo+ICAgREVWRUxPUEVSUyAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMyArKysKPiAgIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgIHwgIDEg
Kwo+ICAgcGFja2FnZS9saWJncGlvZDIvQ29uZmlnLmluICAgICAgfCAyNyArKysrKysrKysrKysr
KysrKysrKysKPiAgIHBhY2thZ2UvbGliZ3Bpb2QyL2xpYmdwaW9kMi5oYXNoIHwgIDQgKysrKwo+
ICAgcGFja2FnZS9saWJncGlvZDIvbGliZ3Bpb2QyLm1rICAgfCA0MSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAgNSBmaWxlcyBjaGFuZ2VkLCA3NiBpbnNlcnRpb25zKCspCj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJncGlvZDIvQ29uZmlnLmluCj4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJncGlvZDIvbGliZ3Bpb2QyLmhhc2gKPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmdwaW9kMi9saWJncGlvZDIubWsKPgo+IGRpZmYgLS1n
aXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IDk1Mjg4MzdkZDAuLjdhOWQzM2M5
MTEgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtNTIy
LDYgKzUyMiw5IEBAIE46CUJpbGFsIFdhc2ltIDxiaWxhbHdhc2ltNjc2QGdtYWlsLmNvbT4KPiAg
IEY6CWJvYXJkL2Nocm9tZWJvb2svZWxtLwo+ICAgRjoJY29uZmlncy9jaHJvbWVib29rX2VsbV9k
ZWZjb25maWcKPiAgIAo+ICtOOglCb2VyZ2UgU3RydWVtcGZlbCA8Ym9lcmdlLnN0cnVlbXBmZWxA
Z21haWwuY29tPgo+ICtGOglwYWNrYWdlL2xpYmdwaW9kMi8KPiArCj4gICBOOglCb2dkYW4gUmFk
dWxlc2N1IDxib2dkYW5AbmltYmxleC5uZXQ+Cj4gICBGOglwYWNrYWdlL2lmdG9wLwo+ICAgRjoJ
cGFja2FnZS9uY2R1Lwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2Uv
Q29uZmlnLmluCj4gaW5kZXggNWI4YjE1ZmE1NC4uYjFhZGIxODg3NyAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTE3NDgsNiAr
MTc0OCw3IEBAIG1lbnUgIkhhcmR3YXJlIGhhbmRsaW5nIgo+ICAgCXNvdXJjZSAicGFja2FnZS9s
aWJmdGRpMS9Db25maWcuaW4iCj4gICAJc291cmNlICJwYWNrYWdlL2xpYmdwaG90bzIvQ29uZmln
LmluIgo+ICAgCXNvdXJjZSAicGFja2FnZS9saWJncGlvZC9Db25maWcuaW4iCj4gKwlzb3VyY2Ug
InBhY2thZ2UvbGliZ3Bpb2QyL0NvbmZpZy5pbiIKPiAgIAlzb3VyY2UgInBhY2thZ2UvbGliZ3Vk
ZXYvQ29uZmlnLmluIgo+ICAgCXNvdXJjZSAicGFja2FnZS9saWJoaWQvQ29uZmlnLmluIgo+ICAg
CXNvdXJjZSAicGFja2FnZS9saWJpaW8vQ29uZmlnLmluIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2xpYmdwaW9kMi9Db25maWcuaW4gYi9wYWNrYWdlL2xpYmdwaW9kMi9Db25maWcuaW4KPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjk3NzVlZDQyZjkKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvcGFja2FnZS9saWJncGlvZDIvQ29uZmlnLmluCj4gQEAgLTAsMCArMSwy
NyBAQAo+ICtjb25maWcgQlIyX1BBQ0tBR0VfTElCR1BJT0QyCj4gKwlib29sICJsaWJncGlvZDIi
Cj4gKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF81XzEwCj4gKwlk
ZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9MSUJHUElPRAo+ICsJaGVscAo+ICsJICBUaGlzIGlzIGEg
QyBsaWJyYXJ5IHRoYXQgYWJzdHJhY3RzIHRoZSBHUElPIGNoYXJhY3Rlcgo+ICsJICBkZXZpY2Ug
b3BlcmF0aW9ucyBvbiBsaW51eC4KPiArCj4gKwkgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saWJzL2xpYmdwaW9kL2xpYmdwaW9kLmdpdC8KPiArCj4gKwkgIFRoaXMgcGFja2FnZSBp
cyB0aGUgY29udGludWF0aW9uIG9mIHRoZSBsaWJncGlvZCBwYWNrYWdlCj4gKwkgIGZvciB2ZXJz
aW9ucyAyLjAgYW5kIGFib3ZlLgo+ICsKPiArCSAgTm90ZSB0aGF0IGEga2VybmVsIG9mIDUuMTAg
b3IgYWJvdmUgaXMgcmVxdWlyZWQgZm9yIHRoZQo+ICsJICBpb2N0bHMgdG8gd29yay4KPiArCj4g
K2lmIEJSMl9QQUNLQUdFX0xJQkdQSU9EMgo+ICsKPiArY29uZmlnIEJSMl9QQUNLQUdFX0xJQkdQ
SU9EMl9UT09MUwo+ICsJYm9vbCAiaW5zdGFsbCB0b29scyIKPiArCWhlbHAKPiArCSAgSW5jbHVk
ZSBhIHNldCBvZiBjb21tYW5kLWxpbmUgdG9vbHMgZm9yIG1hbmFnaW5nIEdQSU9zLgo+ICsKPiAr
ZW5kaWYKPiArCj4gK2NvbW1lbnQgIkNvbnNpZGVyIHVwZ3JhZGluZyB0byBsaWJncGlvZDIiCj4g
KwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xJQkdQSU9ECj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bGliZ3Bpb2QyL2xpYmdwaW9kMi5oYXNoIGIvcGFja2FnZS9saWJncGlvZDIvbGliZ3Bpb2QyLmhh
c2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmI1NDg4NDk2YjIK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9saWJncGlvZDIvbGliZ3Bpb2QyLmhhc2gK
PiBAQCAtMCwwICsxLDQgQEAKPiArIyBGcm9tIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL3Nv
ZnR3YXJlL2xpYnMvbGliZ3Bpb2Qvc2hhMjU2c3Vtcy5hc2MKPiArc2hhMjU2ICBmYTQwMjRhMDgw
MTIxYzk1ODUwMmY5YTQ2YTViZGE0NGJlYTg1ZTdhNGRkN2ZjYjNkZWFkNDYzYjZmYzQyNjFjICBs
aWJncGlvZC0yLjEudGFyLnh6Cj4gKyMgSGFzaCBmb3IgbGljZW5zZSBmaWxlCj4gK3NoYTI1NiAg
ZWIxN2E1Njk2NmRiNWQ5ODZiZWM0NDllZTQ0ZWQ2MWYwMWY5ZTNmYWZhOTUyZTUyN2RiNjdhOGY5
NTk0ZmQxMSAgQ09QWUlORwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmdwaW9kMi9saWJncGlv
ZDIubWsgYi9wYWNrYWdlL2xpYmdwaW9kMi9saWJncGlvZDIubWsKPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjA3NDllYzNjYzQKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvcGFja2FnZS9saWJncGlvZDIvbGliZ3Bpb2QyLm1rCj4gQEAgLTAsMCArMSw0MSBAQAo+ICsj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgbGliZ3Bpb2QyCj4gKyMKPiArIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gKyMgQmUgY2FyZWZ1bCB3aGVuIGJ1bXBpbmcgdmVyc2lv
bnMuCj4gKyMgRGVwZW5kZW5jeSBvbiBrZXJuZWwgaGVhZGVyIHZlcnNpb25zIG1heSBjaGFuZ2Uu
Cj4gK0xJQkdQSU9EMl9WRVJTSU9OID0gMi4xCj4gK0xJQkdQSU9EMl9TT1VSQ0UgPSBsaWJncGlv
ZC0kKExJQkdQSU9EMl9WRVJTSU9OKS50YXIueHoKPiArTElCR1BJT0QyX1NJVEUgPSBodHRwczov
L3d3dy5rZXJuZWwub3JnL3B1Yi9zb2Z0d2FyZS9saWJzL2xpYmdwaW9kCj4gK0xJQkdQSU9EMl9M
SUNFTlNFID0gTEdQTC0yLjErCj4gK0xJQkdQSU9EMl9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+
ICtMSUJHUElPRDJfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gK0xJQkdQSU9EMl9ERVBFTkRFTkNJ
RVMgPSBob3N0LXBrZ2NvbmYgaG9zdC1hdXRvY29uZi1hcmNoaXZlCj4gK0xJQkdQSU9EMl9DT05G
X09QVFMgPSAtLWRpc2FibGUtdGVzdHMgLS1kaXNhYmxlLWV4YW1wbGVzCj4gKwo+ICtpZmVxICgk
KEJSMl9QQUNLQUdFX0xJQkdQSU9EMl9UT09MUykseSkKPiArTElCR1BJT0QyX0NPTkZfT1BUUyAr
PSAtLWVuYWJsZS10b29scwo+ICtlbHNlCj4gK0xJQkdQSU9EMl9DT05GX09QVFMgKz0gLS1kaXNh
YmxlLXRvb2xzCj4gK2VuZGlmCj4gKwo+ICtpZmVxICgkKEJSMl9JTlNUQUxMX0xJQlNURENQUCks
eSkKPiArTElCR1BJT0QyX0NPTkZfT1BUUyArPSAtLWVuYWJsZS1iaW5kaW5ncy1jeHgKPiArZWxz
ZQo+ICtMSUJHUElPRDJfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS1iaW5kaW5ncy1jeHgKPiArZW5k
aWYKPiArCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfUFlUSE9OMykseSkKPiArTElCR1BJT0QyX0NP
TkZfT1BUUyArPSAtLWVuYWJsZS1iaW5kaW5ncy1weXRob24KPiArTElCR1BJT0QyX0RFUEVOREVO
Q0lFUyArPSBweXRob24zCj4gK0xJQkdQSU9EMl9DT05GX0VOViArPSBcCj4gKwlQWVRIT049JChI
T1NUX0RJUikvYmluL3B5dGhvbjMgXAo+ICsJUFlUSE9OX0NQUEZMQUdTPSJgJChTVEFHSU5HX0RJ
UikvdXNyL2Jpbi9weXRob24zLWNvbmZpZyAtLWluY2x1ZGVzYCIgXAo+ICsJUFlUSE9OX0xJQlM9
ImAkKFNUQUdJTkdfRElSKS91c3IvYmluL3B5dGhvbjMtY29uZmlnIC0tbGRmbGFnc2AiCj4gK2Vs
c2UKPiArTElCR1BJT0QyX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtYmluZGluZ3MtcHl0aG9uCj4g
K2VuZGlmCj4gKwo+ICskKGV2YWwgJChhdXRvdG9vbHMtcGFja2FnZSkpCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
