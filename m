Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A27CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 14:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4568D40AD3;
	Wed,  8 Oct 2025 14:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThRt6nh2FsBk; Wed,  8 Oct 2025 14:19:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B34440B63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B34440B63;
	Wed,  8 Oct 2025 14:19:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48222226
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 14:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26B1680D48
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 14:19:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YhzOPGAr-zGQ for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 14:19:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4FF9D80BA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FF9D80BA0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FF9D80BA0
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 14:19:17 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b48d8deafaeso16055166b.1
 for <buildroot@buildroot.org>; Wed, 08 Oct 2025 07:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759933155; x=1760537955;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5kSHWMEuG45NeX33H8uVzAew8Lv0PmF2z9sPdJvXA2U=;
 b=J4C6xVcLizNi5meglASybzdRWYFAmVllc044tMYIOsixxUFobbrCYngXaoOB5NpeD8
 mOLBtS2ESvNyFJiv+9aOjn3VhL3f9ByyE5ooXc9HyJPtgQGqePTh7MPBcu8vdiYa1+jw
 q8RHYiBHEIkKX6rckSnI+zRa9fkWnCZri6fN0pFlW43Jn+L2TQPcCwgtcevW/QvQrB6p
 +l22OqKNJArcW54EfMsVq65B0jRbFJ8bmz4ArhmEtnBt7Fo55awDqgxfu0qpO+//a4Xe
 ZDLR/r/veGKNx4aEMKLH87i1FO6Aa0R6C43d145cjCqArRi3M6cXAluuzBcSp6mGea9F
 XNwA==
X-Gm-Message-State: AOJu0YxY7oYPDDNPM79jYkoQk9F/oYUYuvzn7yxonsz7guXHpwSVnd9e
 hT+b8edgJBOhCqmf8W2jIJDnlorZF6fJNYH7BrxkHQexTyy0JZLmJJclQkLzM956VUs=
X-Gm-Gg: ASbGnctSiIaB6z31R8XHR6n0NSuJTOAeeM+F8+Ro8qYAQwyA7GfhhrgMm5Es6/PxUQJ
 8CrJbzgUKF6bY2UdeKciyMkZBhTTGu1Fnl3CUtWeboA8miHHAz2mUXp9DP+Ll4JyNCWKBiOMo5M
 rcVQGq7DSf+lTAJNewBTVnwbaNVc2KBUZW7xInsceKJTLcDSEzCPnj+92DE+biguv8mBkuDHaJh
 N/s8ME+Oucds+0Dv6P/a+eA+F6PQQ+yF0jFiY7MKZRVdf9YiS7BpxKqF2A7O4LicamEqBMwKp7r
 DkIYI1CCKtK4iuhkq/byuAMPKBcoWgZinBxrhNDLA2arbn61aYoHEwn847zxBk9/ZAm5ahq6e14
 YDt8lgFRJcdZBY5Z3Xu+s/UeMICdlJic3jmLEhPTJqICkLD8X9Imb280ihHGvTHw=
X-Google-Smtp-Source: AGHT+IHq1w32GUxIRdiAYCCczN2aN0VsC8/ngjGVJI5CZxErwVwNPIOVfTM02x+EmBPv3qx8x5CGTg==
X-Received: by 2002:a17:907:7fa4:b0:b3c:82d5:211c with SMTP id
 a640c23a62f3a-b50aae981e1mr458918566b.27.1759933155270; 
 Wed, 08 Oct 2025 07:19:15 -0700 (PDT)
Received: from [192.168.129.33] ([109.136.97.112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4ffb161d92sm388847066b.21.2025.10.08.07.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 07:19:14 -0700 (PDT)
Message-ID: <8e7059a6-5e7f-40f3-8575-d41003d80064@mind.be>
Date: Wed, 8 Oct 2025 16:19:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <john.ernberg@actia.se>,
 =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Alistair Francis <alistair@alistair23.me>
References: <20251007164756.893264-1-titouan.christophe@mind.be>
 <aOYpXF3P53jPhGtV@debian> <588646e8-70c5-4d3a-bd54-dde2274124df@actia.se>
Content-Language: en-US
In-Reply-To: <588646e8-70c5-4d3a-bd54-dde2274124df@actia.se>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1759933155; x=1760537955; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5kSHWMEuG45NeX33H8uVzAew8Lv0PmF2z9sPdJvXA2U=;
 b=QcqYzK5BIxlHDQwNq3u5UA1YLU4UwcvIiKzz7UtXC1rcw6nNbEmsv95BD0eLoPi4D/
 2Kl6RQcrv56cA5+DWVWq1wuCb/kzBUBoR8mO00IDvRcY390/OyxRlUTPtN7T4WGrm0EU
 D/2MBYcyv36DPFSXeGra/VtJ42UoVEnN3+hhvdj28ian/snKkR5XkdtMMVAAkk4SebKk
 ovKi90g2Zs5nef9GbEYL7ozeYs1w196LFt/xDRMQJfflM0OvqGMz7cTPtxFfFCCYcshW
 7u/MhbJrMY0zoBn6J06Pt1yhiHTJ+lBSg3QOfGIR00ZcMZCDo9eTOO+yQiQRSSsMZpRr
 8sUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QcqYzK5B
Subject: Re: [Buildroot] [PATCH] package/xen: security bump to v4.20.1
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

SGVsbG8gVmluY2VudCwgSm9obiBhbmQgYWxsLAoKVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgbG9v
a2luZyBhdCB0aGlzIHBhdGNoLgoKT24gOC8xMC8yNSAxMjoxOCwgSm9obiBFcm5iZXJnIHdyb3Rl
Ogo+IEhpIFRpdG91YW4sIFZpbmNlbnQsCj4KPiBPbiAxMC84LzI1IDExOjA1IEFNLCBWaW5jZW50
IFN0ZWhsw6kgd3JvdGU6Cj4gICA+IE9uIFR1ZSwgT2N0IDA3LCAyMDI1IGF0IDA2OjQ3OjUzUE0g
KzAyMDAsIFRpdG91YW4gQ2hyaXN0b3BoZSB2aWEKPiBidWlsZHJvb3Qgd3JvdGU6Cj4gICA+PiBS
ZW1vdmUgcGF0Y2hlcyB0aGF0IGFyZSBhcHBsaWVkIHVwc3RyZWFtLCBhbmQgYWRhcHQgbGljZW5z
ZSBoYXNoCj4gZm9sbG93aW5nCj4gICA+PiB1cHN0cmVhbSBjb21taXQgN2IwNjhhYzg5MDI0MzA4
ODYyYzRmNDQ4ZGQyNDg2NDVkMmI4ZTg4Mgo+ICAgPj4gKCJSZW1vdmUgZXh0cmEgY29waWVzIG9m
IGxpY2Vuc2VzIGFuZCBsaWNlbnNlIGhlYWRlcnMiKQo+ICAgPj4KPiAgID4+IEFkZCBuZXcgcGF0
Y2ggdG8gZml4IGEgY29tcGlsYXRpb24gaXNzdWUgd2l0aCBnY2MxNQo+ICAgPgo+ICAgPiBIaSBU
aXRvdWFuLAo+ICAgPgo+ICAgPiBUaGFuayB5b3UgZm9yIHdvcmtpbmcgb24gcmVmcmVzaGluZyB0
aGUgeGVuIHBhY2thZ2UsIGFuZCBmb3IKPiBwcmVwYXJpbmcgdGhpcwo+ICAgPiBkZXRhaWxlZCBs
aXN0IG9mIENWRXMhCj4gICA+Cj4gICA+IEkgZmVhciBidW1waW5nIHhlbiB0byA0LjIwIHdpbGwg
bm90IGNvbXBpbGUgc28gZWFzaWx5OyBpbiBmYWN0IHRoaXMKPiBwYXRjaCBkb2VzCj4gICA+IGlu
ZGVlZCBicmVhayB0aGUgZm9sbG93aW5nIHRlc3RzOgo+ICAgPgo+ICAgPiAtIHRlc3RzLnBhY2th
Z2UudGVzdF94ZW4uVGVzdFhlbkFhcmNoNjQKPiAgID4gLSB0ZXN0cy5wYWNrYWdlLnRlc3RfeGVu
LlRlc3RYZW5Bcm12NwpPbiBteSBzaWRlLCBJIGhhZCBvbmx5IGJ1aWx0IFhlbiBpdHNlbGYgKGFu
ZCBub3QgdGhlIHRvb2xzKSwgd2l0aCB0aGUgCmZvbGxvd2luZyBjb25maWd1cmF0aW9uOgoKQlIy
X2FhcmNoNjQ9eQpCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5B
TF9CT09UTElOPXkKQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FBUkNINjRfR0xJQkNf
U1RBQkxFPXkKQlIyX1BBQ0tBR0VfWEVOPXkKCkl0IGNvbXBpbGVzIHdpdGhvdXQgYW55IGlzc3Vl
LgoKSG93ZXZlciwgd2hlbiBlbmFibGluZyB0aGUgdG9vbHMgKEJSMl9QQUNLQUdFX1hFTl9UT09M
Uz15KSBsaWtlIHRoZSAKdGVzdHMgZG8sIHRoZXJlIGlzIGluZGVlZCBhIHByb2JsZW0gd2l0aCBh
IGdpdCByZXBvIGFzIHlvdSByZXBvcnRlZAo+ICAgPgo+ICAgPiBCdW1waW5nIFhlbiBpcyBzb21l
dGhpbmcgSSBoYXZlIHRyaWVkIG9uIG15IHNpZGUgYXMgd2VsbCwgYW5kIEkgaGF2ZQo+IHJlYWxp
emVkCj4gICA+IHJlY2VudGx5IHRoYXQgYSBzdWJzdGFudGlhbCBjaGFuZ2UgaGFzIGhhcHBlbmVk
IGJldHdlZW4gWGVuIDQuMTkgYW5kCj4gNC4yMDogdGhlCj4gICA+IHFlbXUteGVuIGZvbGRlciBp
cyBub3Qgc2hpcHBlZCBpbiB0aGUgYXJjaGl2ZSBhbnltb3JlLiBbMV0KPiAgID4KPiBYZW4gZG9l
cyBzdXBwb3J0IHVzaW5nIHRoZSBzeXN0ZW0gcWVtdSBhcyB3ZWxsLCBhbmQgdGhlIHFlbXUgcGFj
a2FnZSBpbgo+IGJ1aWxkcm9vdCBpcyBuZXcgZW5vdWdoLiBJIHdhcyBkYWJibGluZyBhIGxpdHRs
ZSBiaXQgd2l0aCBpdCAgYSB5ZWFyIGFnbwo+IGJ1dCBkaWRuJ3QgZ2V0IGZhciBlbm91Z2ggdG8g
cnVuIGFueSBzaWduaWZpY2FudCB0ZXN0cy4KPgo+IFhlbiBidWlsZGluZyB3b3VsZCBuZWVkIC0t
d2l0aC1zeXN0ZW0tcWVtdT15ZXMsIGFuZCBJIGZvcmdvdCB3aGF0IHN3aXRjaAo+IHdhcyBuZWVk
ZWQgZm9yIHFlbXUuCj4KPiBJdCBjb3VsZCBiZSBhbiBhdmVudWUgdG8gZXhwbG9yZSBhcyB3ZWxs
LgpJIHdpbGwgbG9vayBpbnRvIHlvdXIgc3VnZ2VzdGlvbnMgIQoKUmVnYXJkcywKVGl0b3VhbgoK
Pgo+IEJlc3QgcmVnYXJkcyAvLyBKb2huIEVybmJlcmcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
