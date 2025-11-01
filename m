Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB58CCFA02
	for <buildroot@archiver.kernel.org>; Sat,  1 Nov 2025 18:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A088984BD5;
	Sat,  1 Nov 2025 18:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sYDe9XL4zST9; Sat,  1 Nov 2025 18:03:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F96784BD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F96784BD6;
	Sat,  1 Nov 2025 18:03:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C08C2222
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 18:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A560E610A8
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 18:03:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2jXiZmhG600 for <buildroot@buildroot.org>;
 Sat,  1 Nov 2025 18:03:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AE46A61016
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE46A61016
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE46A61016
 for <buildroot@buildroot.org>; Sat,  1 Nov 2025 18:03:07 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso40732505e9.3
 for <buildroot@buildroot.org>; Sat, 01 Nov 2025 11:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762020185; x=1762624985;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5iLvus4xef5KAYKUnUmuZ77hKTJc2Up+8lHsHTT/ocw=;
 b=tj996DbZUNsCLfpGKq+ip46Osdvcgw9VDvbsWwnGS+NrLaBsdK6a+hfqCcWiuV26JX
 DEymozmOY8yMtp88KGV67P5ewOSD5+/rFUpQ/8bba80JCYrhkCUe0J0MzOUv0Q87eshX
 u4dvGZOhupMJ9elPIE3kRxwqaJE+pJ2+LMTg8m4PlLe1PGh0f/W+sxxFiWUzJLhgOmsa
 8t1Pr36qO4dHDi23xIcLCZL4qDbUhf2u2HJGR315uwh/cM6Ms2UrXrLc9P/70ECHD1+G
 gG5RorGZrlbUQyZOQC5ksRgWmmdTeZwweh98YQRE2z3UerOjDsCQIkxV0rukvsyIf1D1
 7DoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9Le7QjH0cpO29EQ+3fH6KZIXnElIJKhSnvFwPaSXRfBewd+50qSZyIbwv64P7q2hh2NHu9YZvs84=@buildroot.org
X-Gm-Message-State: AOJu0YzgLSDAzo4v/c+vk54GOrnnxyDxAMYb1hWtkKSoa1r7pKOdY7CJ
 8Bc9VVp5ISSYcR3yAts7zaAKB6JslLr06XgGG+a5LCSDKtGcrpE7YKMNgdiLl8GoGD8=
X-Gm-Gg: ASbGncuVKCa1uDOOmRTojmsq2LZ8Xv/QpKzQlr1h8ivUeFpMzjs+NjGorwzA66PbWC+
 qmU0NOC+6qEhCGyiHdV1EUIe+D8WGqtJtrD87ANB/7WY6W7FyjWUMmZIvWNS08/Na5j4xPfFTLe
 94lsd8nOcd3Rf5h8alaxGODGzcwHKwgNNt/bwHhanw8mufpsJJNYrG+TlzUQhqLCo4MJUwaEGfU
 MwUODGGV3wCkNiEXrBbUkQj60am96HoHLO9lifNRwvaIha3AWc8FyDY0Acho6kfb8J+hqLUgpZr
 B5rThtQ6A2+ljPQMs2BKzHfUn2yYb6zfGRkh6BdcK1dKxVo87uVh5jYbJarJms9s+7ce4K/xHCu
 38HnCQlYgod9VjGQqjOnbyZ/Ny5GA6ZsANYM3apfva6elyn5pxe0q/o6/bV2dyJAdw025x/HHHD
 pIaIUGGzpLzoO+7mJaB5JDrxKbD05xkJLRe6IZKe0xj+z2la8yeQ==
X-Google-Smtp-Source: AGHT+IHGIu2Vh33jefU8mY4evjl9tGo4RIK2DM+1NWSI/8gVquXsa1qeSrbauuhvw5WcD0zAmLYy3g==
X-Received: by 2002:a05:600d:8399:b0:477:1709:1f2f with SMTP id
 5b1f17b1804b1-477328727d7mr42274775e9.5.1762020185139; 
 Sat, 01 Nov 2025 11:03:05 -0700 (PDT)
Received: from [192.168.4.20] (77.109.92.202.static.edpnet.net.
 [77.109.92.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c383c20sm60553815e9.12.2025.11.01.11.03.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Nov 2025 11:03:04 -0700 (PDT)
Message-ID: <7af0d889-1a5a-43cc-8346-dd1c278c847e@mind.be>
Date: Sat, 1 Nov 2025 19:03:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Baruch Siach <baruch@tkos.co.il>,
 Thomas Perale via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
References: <20250906162551.3715975-2-romain.naour@smile.fr>
 <20250911192608.2672637-1-thomas.perale@mind.be> <87ldmjesxl.fsf@tarshish>
 <DDWEX0A8U40C.1J7DHEPBK82OY@bootlin.com>
 <8cc5e53c-edaf-4fc6-806e-e834e12190a2@mind.be>
 <DDWMCTTEL0E6.2MZJ9IJABBCA2@bootlin.com>
Content-Language: en-US
In-Reply-To: <DDWMCTTEL0E6.2MZJ9IJABBCA2@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1762020185; x=1762624985; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5iLvus4xef5KAYKUnUmuZ77hKTJc2Up+8lHsHTT/ocw=;
 b=X6eSoaSi6KVVTGfE1HPJ7YcDu1Ig32nzIGsAo2aCIgTS+oH0F2xIUDsoxqWMn7saX0
 MzeaXzwnZ8y9R7/sMKRhNYJS47NnAmyTYy5A2eeGpPX5LrY2lnGK00OLMfubcf3vjbM1
 6U14qh2PLe8SIB89JC/DjnKr61iiUX/VhoWqRa/kEGbB647zzXl6igLRb03ZWdmqmZ1s
 KTO9p5Rb8xPEhc5iV5U5Im3O8FfyLSAcrlCqk7XjqLULq0UV5/s4wm/ROpDhMotCqwIU
 65Ic0GaBet4iFclOtiwxBh0cQ0Z6IAmzFIsCiMmSY9n8hQzOMIhlPnAQhY+Ql9Rsnk7W
 Vg2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=X6eSoaSi
Subject: Re: [Buildroot] [PATCH 2/2] package/iozone: Fix parallel build
 problem
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpPbiAxMC8zMS8yNSA0OjM5IFBNLCBBbGV4aXMgTG90aG9yw6kgd3JvdGU6Cj4gSGVsbG8g
VGhvbWFzLAo+Cj4gT24gRnJpIE9jdCAzMSwgMjAyNSBhdCA0OjAwIFBNIENFVCwgVGhvbWFzIFBl
cmFsZSB3cm90ZToKPj4gSGkgQWxleGlzLAo+Pgo+PiBPbiAxMC8zMS8yNSAxMDo1MCBBTSwgQWxl
eGlzIExvdGhvcsOpIHdyb3RlOgo+Pj4gSGVsbG8sCj4+Pgo+Pj4gT24gRnJpIFNlcCAxMiwgMjAy
NSBhdCAyOjUwIFBNIENFU1QsIEJhcnVjaCBTaWFjaCB2aWEgYnVpbGRyb290IHdyb3RlOgo+Pj4+
IEhpIFRob21hcywKPj4+Pgo+Pj4+IE9uIFRodSwgU2VwIDExIDIwMjUsIFRob21hcyBQZXJhbGUg
dmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4+Pj4gSW4gcmVwbHkgb2Y6Cj4+Pj4+PiBBcHBseSBhIHBh
dGNoIGZyb20gbWV0YS1vcGVuZW1iZWRkZWQgZml4aW5nIGEgY3Jvc3MtYnVpbGQgaXNzdWUgWzFd
Lgo+Pj4+Pj4KPj4+Pj4+IFsxXQo+Pj4+Pj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5lbWJlZGRl
ZC9tZXRhLW9wZW5lbWJlZGRlZC9ibG9iL3dhbG5hc2Nhci9tZXRhLW9lL3JlY2lwZXMtYmVuY2ht
YXJrL2lvem9uZTMvaW96b25lMy9wYXJhbGxlbGlzbS5wYXRjaAo+Pj4+Pj4KPj4+Pj4+IEZpeGVz
Ogo+Pj4+Pj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9i
cy8xMTE3Njc3NDQwNSAoVGVzdElvem9uZSkKPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBS
b21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPj4+Pj4gQXBwbGllZCB0byAyMDI1
LjAyLnggJiAyMDI1LjA1LnguIFRoYW5rcwo+Pj4+IE5vdCBpbiAyMDI1LjAyLnggb3IgMjAyNS4w
NS54IGFzIG9mIGE0YWM0MmY0ZTdhNzQgKCJSZXZlcnQKPj4+PiAicGFja2FnZS9maXJld2FsbGQ6
IGFkZCBtaXNzaW5nIG5mdGFibGVzIGpzb24gcnVudGltZSBkZXBlbmRlbmN5IiIpIGFuZAo+Pj4+
IDAyZjRkNjJiYmY5NSAoInBhY2thZ2UvcHl0aG9uMzogZG8gYnVpbGQtdGltZSBkZXRlY3Rpb24g
b2Ygbm9uLXdvcmtpbmcKPj4+PiB0b29sY2hhaW4iKSwgcmVzcGVjdGl2ZWx5Lgo+Pj4gSSB3YXMg
aW52ZXN0aWdhdGluZyBhIGJ1aWxkIGZhaWx1cmUgb24gdGhlIGlvem9uZSBwYWNrYWdlIG9uIGJ1
aWxkcm9vdAo+Pj4gMjAyNS4wMi54LCBhbmQgZXZlbnR1YWxseSBmb3VuZCB0aGlzIHNlcmllcyB3
aGljaCBpbmRlZWQgZml4ZXMgdGhlIGlzc3Vlcwo+Pj4gb2JzZXJ2ZWQgbG9jYWxseS4gQXMgQmFy
dWNoIHN0YXRlZCwgaXQgZG9lcyBub3Qgc2VlbSB0byBiZSBhcHBsaWVkIG9uCj4+PiAyMDI1LjAy
LngsIGRlc3BpdGUgVGhvbWFzJ3Mgbm90aWZpY2F0aW9uLgo+Pj4KPj4+IEFueSBwbGFuIHRvIGV2
ZW50dWFsbHkgYXBwbHkgaXQgb24gMjAyNS4wMi54ID8KPj4+Cj4+PiBUaGFua3MsCj4+Pgo+Pj4g
QWxleGlzCj4+IEFyZSB5b3UgdGFsa2luZyBhYm91dCB0aGUgcGFyYWxsZWxpc20gaXNzdWUgPyBX
ZSBkaWRuJ3QgZW5kZWQgdXAgcGlja2luZwo+PiBpdCBiZWNhdXNlIHRoZSBmaXggY2FtZSBhZnRl
ciB0aGUgdmVyc2lvbiBidW1wIHdoaWNoIGNvdWxkIGltcGx5IHRoaXMKPj4gZXJyb3Igb25seSBo
YXBwZW5zIGFmdGVyIHRoZSB2ZXJzaW9uIGJ1bXAuCj4gTXkgYmFkLCBJIGRpZCBtYWtlIHRoaW5n
cyBjb25mdXNpbmcgYnkgcmVwbHlpbmcgdG8gdGhlIHRocmVhZCBpbnZvbHZpbmcgdGhlCj4gcGFy
YWxsZWwgYnVpbGQgZml4LCBidXQgSSBhbSBpbmRlZWQgcmVmZXJyaW5nIHRvIHRoZSBidW1wIHRv
IGdldCBidWlsZAo+IGZpeGVzIHJlbGF0ZWQgdG8gR0NDIHJhaXNpbmcgZXJyb3JzIGluc3RlYWQg
b2Ygd2FybmluZ3MuCj4KPj4gRm9yIHRoZSBidW1wIGFuZCB0aGUgZ2NjIGZpeGVzLCBpZiBpIHJl
bWVtYmVyIGNvcnJlY3RseSBJIHRyaWVkIHRvIGJ1aWxkCj4+IGl0IGxvY2FsbHkgYW5kIGl0IGRp
ZG4ndCBmYWlsLiBTaW5jZSB0aGUgY29tbWl0IG1lc3NhZ2Ugd2FzIG5vdCBzcGVjaWZpYwo+PiBl
bm91Z2ggYWJvdXQgdGhlIGVycm9yIEkgZGlkbid0IGluY2x1ZGUgaXQuIEJ1dCBJIG1heSBoYXZl
IGRvbmUKPj4gc29tZXRoaW5nIHdyb25nLgo+Pgo+PiBXaGF0J3MgdGhlIGVycm9yIHlvdSBhcmUg
cnVubmluZyBpbnRvID8gVGhlIGJ1bXAgbG9va3MgdG8gYmUgc21hbGwgc28gd2UKPj4gbWlnaHQg
aW5jbHVkZSBpdCBhcyB3ZWxsIG5leHQgd2Vlay4KPiBIZXJlIGFyZSB0aGUgZXJyb3JzIEkgYW0g
c2VlaW5nOgo+Cj4gbGliYmlmLmM6MjA1OjE6IGVycm9yOiByZXR1cm4gdHlwZSBkZWZhdWx0cyB0
byAnaW50JyBbLVdpbXBsaWNpdC1pbnRdCj4gICAgMjA1IHwgY3JlYXRlX3hscyhuYW1lKQo+ICAg
ICAgICB8IF5+fn5+fn5+fn4KPiBtYWtlWzJdOiAqKiogWzxidWlsdGluPjogbGliYmlmLm9dIEVy
cm9yIDEKPiBtYWtlWzJdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgo+IGxp
YmFzeW5jLmM6IEluIGZ1bmN0aW9uICdlbmRfYXN5bmMnOgo+IGxpYmFzeW5jLmM6MzAyOjk6IGVy
cm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnZGVsX2NhY2hlJyBbLVdpbXBs
aWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAgICAzMDIgfCAgICAgICAgIGRlbF9jYWNoZSht
eWdjKTsKPiAgICAgICAgfCAgICAgICAgIF5+fn5+fn5+fgo+IGxpYmFzeW5jLmM6IEluIGZ1bmN0
aW9uICdhc3luY19yZWFkJzoKPiBsaWJhc3luYy5jOjQzMjoxNzogZXJyb3I6IGltcGxpY2l0IGRl
Y2xhcmF0aW9uIG9mIGZ1bmN0aW9uICd0YWtlb2ZmX2NhY2hlJzsgZGlkIHlvdSBtZWFuICdhbGxv
Y19jYWNoZSc/IFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAgIDQzMiB8ICAg
ICAgICAgICAgICAgICB0YWtlb2ZmX2NhY2hlKGdjLGNlKTsKPiAgICAgICAgfCAgICAgICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+fgo+ICAgICAgICB8ICAgICAgICAgICAgICAgICBhbGxvY19jYWNo
ZQo+IGxpYmFzeW5jLmM6IEF0IHRvcCBsZXZlbDoKPiBsaWJhc3luYy5jOjYxODoxOiB3YXJuaW5n
OiBjb25mbGljdGluZyB0eXBlcyBmb3IgJ3Rha2VvZmZfY2FjaGUnOyBoYXZlICd2b2lkKHN0cnVj
dCBjYWNoZSAqLCBzdHJ1Y3QgY2FjaGVfZW50ICopJwo+ICAgIDYxOCB8IHRha2VvZmZfY2FjaGUo
c3RydWN0IGNhY2hlICpnYywgc3RydWN0IGNhY2hlX2VudCAqY2UpCj4gICAgICAgIHwgXn5+fn5+
fn5+fn5+fgo+IGxpYmFzeW5jLmM6NDMyOjE3OiBub3RlOiBwcmV2aW91cyBpbXBsaWNpdCBkZWNs
YXJhdGlvbiBvZiAndGFrZW9mZl9jYWNoZScgd2l0aCB0eXBlICd2b2lkKHN0cnVjdCBjYWNoZSAq
LCBzdHJ1Y3QgY2FjaGVfZW50ICopJwo+ICAgIDQzMiB8ICAgICAgICAgICAgICAgICB0YWtlb2Zm
X2NhY2hlKGdjLGNlKTsKPiAgICAgICAgfCAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fgo+
IGxpYmFzeW5jLmM6NjkyOjE6IHdhcm5pbmc6IGNvbmZsaWN0aW5nIHR5cGVzIGZvciAnZGVsX2Nh
Y2hlJzsgaGF2ZSAndm9pZCgpJwo+ICAgIDY5MiB8IGRlbF9jYWNoZShnYykKPiAgICAgICAgfCBe
fn5+fn5+fn4KPiBsaWJhc3luYy5jOjMwMjo5OiBub3RlOiBwcmV2aW91cyBpbXBsaWNpdCBkZWNs
YXJhdGlvbiBvZiAnZGVsX2NhY2hlJyB3aXRoIHR5cGUgJ3ZvaWQoKScKPiAgICAzMDIgfCAgICAg
ICAgIGRlbF9jYWNoZShteWdjKTsKPiAgICAgICAgfCAgICAgICAgIF5+fn5+fn5+fgo+IGxpYmFz
eW5jLmM6IEluIGZ1bmN0aW9uICdhc3luY19yZWFkX25vX2NvcHknOgo+IGxpYmFzeW5jLmM6ODE1
OjE3OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ3B1dG9uaW51c2Un
IFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAgIDgxNSB8ICAgICAgICAgICAg
ICAgICBwdXRvbmludXNlKGdjLGNlKTsKPiAgICAgICAgfCAgICAgICAgICAgICAgICAgXn5+fn5+
fn5+fgo+IGxpYmFzeW5jLmM6IEluIGZ1bmN0aW9uICdhc3luY19yZWxlYXNlJzoKPiBsaWJhc3lu
Yy5jOjk4Mjo5OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ3Rha2Vv
ZmZpbnVzZScgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICAgOTgyIHwgICAg
ICAgICB0YWtlb2ZmaW51c2UoZ2MpOwo+ICAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+Cj4g
bGliYXN5bmMuYzogQXQgdG9wIGxldmVsOgo+IGxpYmFzeW5jLmM6OTk2OjE6IHdhcm5pbmc6IGNv
bmZsaWN0aW5nIHR5cGVzIGZvciAncHV0b25pbnVzZSc7IGhhdmUgJ3ZvaWQoKScKPiAgICA5OTYg
fCBwdXRvbmludXNlKGdjLGVudHJ5KQo+ICAgICAgICB8IF5+fn5+fn5+fn4KPiBsaWJhc3luYy5j
OjgxNToxNzogbm90ZTogcHJldmlvdXMgaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgJ3B1dG9uaW51
c2UnIHdpdGggdHlwZSAndm9pZCgpJwo+ICAgIDgxNSB8ICAgICAgICAgICAgICAgICBwdXRvbmlu
dXNlKGdjLGNlKTsKPiAgICAgICAgfCAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fgo+IGxpYmFz
eW5jLmM6MTAxNzoxOiB3YXJuaW5nOiBjb25mbGljdGluZyB0eXBlcyBmb3IgJ3Rha2VvZmZpbnVz
ZSc7IGhhdmUgJ3ZvaWQoKScKPiAgIDEwMTcgfCB0YWtlb2ZmaW51c2UoZ2MpCj4gICAgICAgIHwg
Xn5+fn5+fn5+fn5+Cj4gbGliYXN5bmMuYzo5ODI6OTogbm90ZTogcHJldmlvdXMgaW1wbGljaXQg
ZGVjbGFyYXRpb24gb2YgJ3Rha2VvZmZpbnVzZScgd2l0aCB0eXBlICd2b2lkKCknCj4gICAgOTgy
IHwgICAgICAgICB0YWtlb2ZmaW51c2UoZ2MpOwo+ICAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+
fn5+Cj4gbWFrZVsyXTogKioqIFs8YnVpbHRpbj46IGxpYmFzeW5jLm9dIEVycm9yIDEKPiBtYWtl
WzJdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3dvcmtzcGFjZS9idWlsZC9vdXQvb3V0cHV0LWRpYW1v
bmQvYnVpbGQvaW96b25lLTMuNTA2L3NyYy9jdXJyZW50Jwo+IG1ha2VbMV06ICoqKiBbcGFja2Fn
ZS9wa2ctZ2VuZXJpYy5tazoyNzM6IC93b3Jrc3BhY2UvYnVpbGQvb3V0L291dHB1dC1kaWFtb25k
L2J1aWxkL2lvem9uZS0zLjUwNi8uc3RhbXBfYnVpbHRdIEVycm9yIDIKPiBtYWtlWzFdOiBMZWF2
aW5nIGRpcmVjdG9yeSAnL3dvcmtzcGFjZS9idWlsZC9idWlsZC9idWlsZHJvb3QnCj4gbWFrZTog
KioqIFsvd29ya3NwYWNlL2J1aWxkL2J1aWxkL21hdGNoYm94L2J1aWxkcm9vdC5tazo0ODogaW96
b25lXSBFcnJvciAyCj4KPiBJIG1hbmFnZWQgdG8gcmVwcm9kdWNlIHRoZSBidWlsZCBpc3N1ZSB3
aXRoIHRoZSBmb2xsb3dpbmcgbWluaW1hbAo+IGRlZmNvbmZpZyBvbiAyMDI1LjAyLngKPgo+IEJS
Ml9hcm09eQo+IEJSMl9jb3J0ZXhfYTk9eQo+IEJSMl9BUk1fRU5BQkxFX05FT049eQo+IEJSMl9B
Uk1fRU5BQkxFX1ZGUD15Cj4gQlIyX0FSTV9GUFVfTkVPTj15Cj4gQlIyX1RPT0xDSEFJTl9FWFRF
Uk5BTD15Cj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOPXkKPiBCUjJfUEFDS0FHRV9J
T1pPTkU9eQo+Cj4gSWYgaXQgaGVscHMsIHdvdWxkIHlvdSBsaWtlIG1lIHRvIHJlc2VuZCB0aGUg
b3JpZ2luYWwgcGF0Y2ggYW5kIGVucmljaCBpdAo+IHdpdGggdGhvc2UgaW5mbyA/CgpEb24ndCBi
b3RoZXIsIEkgd2lsbCBhcHBseSBpdCBkaXJlY3RseSB3aXRoIGFuIGFkZGl0aW9uYWwgY29tbWVu
dC4gClRoYW5rcyBmb3IgeW91ciBkZXRhaWxlZCByZXBvcnQKClBFUkFMRSBUaG9tYXMKCj4gQWxl
eGlzCj4+IFRoYW5rcyBmb3IgdGhlIG1lc3NhZ2UsCj4+IFBFUkFMRSBUaG9tYXMKPgo+Cj4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
