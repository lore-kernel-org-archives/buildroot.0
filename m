Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFB0C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 11:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 278D260D9C;
	Tue, 22 Apr 2025 11:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B6c6L6WwhO7j; Tue, 22 Apr 2025 11:40:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DECC60D80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DECC60D80;
	Tue, 22 Apr 2025 11:40:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F2CC868
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 11:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF44640028
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 11:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yKdW6bVSc8IY for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 11:40:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A11840B5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A11840B5D
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A11840B5D
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 11:40:24 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso44461145e9.3
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 04:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745322022; x=1745926822;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MxgU5yn8HtT5hU+3S5cJsE2HnpQlhMffkAanzyUjg5E=;
 b=YHDhKJrTJaCiqR1BgMlNb8bgOb6pUx8U6IopHfQ7bRaWvldrLUZbht0P5VqgZ85SIj
 nYrZFImQhznRdeue9/zGqV7iUCN6CGnfiGX+j4J/gJEi+t/P9OmEiZSJpFiikyoDmZoH
 28DUOFbJaKOgjFj3H4ZZH94dhq9uw9Ryas8b4JclJFQ4Bv4VYagS/mRfPQ4vd2Uy+uLu
 zYXvqypS+EaLH3NJN+gySy9PO5f7FTnFq8fltq3Al/tm7Iq2cpNCf8BJtsNPffU4YFqc
 aBoBDHI0YabuEGwMIL67K59BI2EWjytOIsmlXa7h+zGIl8HCO3D7YY/EIAGYu54wh0q5
 Byrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTr0H1e7F3lYPKinJjdVxCb0Z8VnqVvLhjEfQ6nsPtT/vkhEsqvGVIx6Heoudnx8SkPZiapY5O5ws=@buildroot.org
X-Gm-Message-State: AOJu0Yw0SxXH2kkAUhnL/LrzfMcBKSy3TeFm9erKE/hy0NKzyXnxXBSS
 jQPIqS1cjXt6WJtekJXAEQzvEi4HePNCzG48xftgdjjujNpVUwrRO51fi4N/3Nw=
X-Gm-Gg: ASbGnct1Gwp+Lqk1IYvBlkqDMjLjDaXdSLpcCGEXwzaht6HC+lX5ODUa673LHrdXEq7
 0Av+1RY41qNdCWM5iB/rYNIMbkKwrRP0S2luI4D3msYESpsXLu/p64a/+UZKFofFhzAG6K2OO2W
 xIUCqEvnrdnWUWNMe8IzwxtuLEwyFTEXFTuaTF8K3a553LSk2igCxPki27lYFdWqMHDkFVKGPUo
 OzVrGZ5uRQVBqpYE4p5TPgU5rdfnw492u+6Nevw9cTwKJwnQgcs2rG5g+PJHv9rB8mO9MusPkqp
 VZ2inVrGjozQAxBzeAA8986g0ScKjHKWTuIYmW7d2N2MC7nrCuMKyWB8MKu3GWAY6Dv2wbriQ1I
 CtVBCFti+4mzPXHgEJCAARjOxKB5RmGTJBWT6Ud2bPw==
X-Google-Smtp-Source: AGHT+IE3UAwxbWyc1io4qiGMIMASUhKiKtP0ssGfYEVXKs2IjrsGahchLFu3iCbD6tffjme9+IYwkA==
X-Received: by 2002:a05:600c:4e8d:b0:43d:1824:aadc with SMTP id
 5b1f17b1804b1-4406ac616d8mr124783685e9.29.1745322022018; 
 Tue, 22 Apr 2025 04:40:22 -0700 (PDT)
Received: from [10.5.90.83]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5bbc57sm173832975e9.18.2025.04.22.04.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 04:40:21 -0700 (PDT)
Message-ID: <a87d64f7-dc96-4f6f-8291-16b916fa75b7@smile.fr>
Date: Tue, 22 Apr 2025 13:40:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret
 <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 James Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Torben Voltmer <mail@t-voltmer.net>, Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20250422074738.821755-1-elmehdi.younes@smile.fr>
 <ca62699d-5cde-4072-922b-b83346d42eff@gmx.de>
Content-Language: en-US
In-Reply-To: <ca62699d-5cde-4072-922b-b83346d42eff@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745322022; x=1745926822; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MxgU5yn8HtT5hU+3S5cJsE2HnpQlhMffkAanzyUjg5E=;
 b=oUP1ha90bhTqUgnEyTXGlD+4iPdScX5kW3l9cQe/mJlOZD3POCKahIE/M3A9M8kAsT
 w8djtX7jgwYBwe9vqQg1fz8WVSniZSOIOy8eD9Om9nGeKL0OluITTJuE9hRUyJXFYsOl
 ZxxO+3GNTF/1d7Y+fCzFqpQdpOIcYLb4sBLQE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=oUP1ha90
Subject: Re: [Buildroot] [PATCH 0/4] package/rust: rust upgrade to version
 1.86.0
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

SGVsbG8gRmlvbmEsIGhlbGxvIGFsbCwKClRoYW5rcyBmb3IgeW91ciB3b3JrLgoKU2luY2UgSSd2
ZSBhbHNvIHN1Ym1pdHRlZCBzZXBhcmF0ZSBwYXRjaGVzIHRvIGJ1bXAgc2V2ZXJhbCBSdXN0Cgpw
YWNrYWdlcywgSSB3aWxsIGJlIGluIGNvbmZsaWN0IHdpdGggc29tZSBvZiB0aGUgaGFzaGVzIGlu
IHRoaXMgY2FyZ28zCgpzZXJpZXMuIEkgd2FzIHBsYW5uaW5nIHRvIHJlZ2VuZXJhdGUgYWxsIHRo
ZSBoYXNoZXMgaW4gYSBmaW5hbCB2ZXJzaW9uCgpvZiB0aGUgcnVzdCBidW1wIHNlcmllcyBvbmNl
IHRob3NlIGluZGl2aWR1YWwgcGFja2FnZSB1cGRhdGVzIGhhdmUKCmJlZW4gcmV2aWV3ZWQgYW5k
IG1lcmdlZC4KCllvdXIgcGF0Y2ggY29tZXMgYXQgdGhlIHBlcmZlY3QgdGltZSAtIEknbGwgaW5j
bHVkZSBpdCBpbiB0aGUgbmV4dCAKaXRlcmF0aW9uCgpvZiB0aGUgUnVzdCBidW1wIHNlcmllcywg
SSdsbCBzZW5kIGEgZmluYWwsIGNsZWFuIHZlcnNpb24gd2l0aCBhbGwgaGFzaGVzCgpyZWdlbmVy
YXRlZCBhY2NvcmRpbmdseS4KCkJlc3QgcmVnYXJkcywKCkVsIE1laGRpIFlPVU5FUwoKTGUgMjIv
MDQvMjAyNSDDoCAxMjozMCwgRmlvbmEgS2x1dGUgYSDDqWNyaXTCoDoKPiBBbSAyMi4wNC4yNSB1
bSAwOTo0NyBzY2hyaWViIEVsIE1laGRpIFlPVU5FUyB2aWEgYnVpbGRyb290Ogo+PiBUaGlzIHBh
dGNoZXMgc2VyaWVzIGJ1bXBzIHJ1c3QgdG8gdmVyc2lvbiAxLjg2LjAgYW5kIHVwZGF0ZXMgYWxs
Cj4+IGNhcmdvLXJlbGF0ZWQgcGFja2FnZXMgdG8gdXNlIHRoZSBjYXJmbzMgbmFtaW5nIHNjaGVt
ZS4KPj4gUGF0Y2hlcyAyLCAzIGFuZCA0IHNob3VsZCBiZSBzcXVhc2hlZCBpbnRvIGEgc2luZ2xl
IGNvbW1pdCwKPj4gYXMgdGhleSBsb2dpY2FsbHkgYmVsb25nIHRvZ2V0aGVyLgo+PiBJIHVzZWQg
bXVsdGlwbGUgY29tbWl0cyBvbmx5IGZvciBiZXR0ZXIgY2xhcml0eS4KPj4KPj4gRWwgTWVoZGkg
WU9VTkVTICg0KToKPj4gwqDCoCBwYWNrYWdlL3J1c3Q6IGZpeCBib290c3RyYXAgd2l0aCBSdXN0
4omlMS44Mwo+PiDCoMKgIHBhY2thZ2UvcnVzdDogYnVtcCB0byB2ZXJzaW9uIDEuODYuMAo+PiDC
oMKgIHBhY2thZ2UvcGtnLWRvd25sb2FkOiBzd2l0Y2ggZnJvbSBjYXJnbzIgdG8gY2FyZ28zCj4+
IMKgwqAgcGFja2FnZTogdXBkYXRlIGFsbCBoYXNoZXMgYWZ0ZXIgY2FyZ28zIHN3aXRjaAo+Cj4g
VGVzdGVkLWJ5OiAiRmlvbmEgS2x1dGUgKFdJV0EpIiA8ZmlvbmEua2x1dGVAZ214LmRlPgo+Cj4g
VGhhbmtzIGZvciB5b3VyIHdvcmsgb24gdGhpcyEKPgo+IEkndmUganVzdCBzZW50IGFub3RoZXIg
cGF0Y2ggdGhhdCBJIHRoaW5rIHNob3VsZCBiZSBpbnRlZ3JhdGVkIGludG8gCj4gdGhpcyBzZXJp
ZXMsIHRvIHJlcGxhY2UgZGVwcmVjYXRlZCAuY2FyZ28vY29uZmlnIHdpdGggCj4gLmNhcmdvL2Nv
bmZpZy50b21sIGluIHRoZSBnZW5lcmF0ZWQgYXJjaGl2ZXMgWzFdLiBCeSBtYWtpbmcgdGhhdCAK
PiBjaGFuZ2UgdG9nZXRoZXIgd2l0aCB0aGlzIFJ1c3QgdXBkYXRlIHdlIGNhbiBnZXQgcmlkIG9m
IHRoZSAKPiBkZXByZWNhdGlvbiB3YXJuaW5nIHdpdGggb25seSBvbmUgYXJjaGl2ZSB2ZXJzaW9u
IChhbmQgcGFja2FnZSBoYXNoZXMpIAo+IGJ1bXAuCj4KPiBCZXN0IHJlZ2FyZHMsCj4gRmlvbmEK
Pgo+IFsxXSAKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290
L3BhdGNoLzIwMjUwNDIyMTAyNDUxLjM5ODc1MTUtMS1maW9uYS5rbHV0ZUBnbXguZGUvCj4KPj4g
cGFja2FnZS9hYXJkdmFyay1kbnMvYWFyZHZhcmstZG5zLmhhc2jCoMKgwqDCoMKgwqDCoCB8wqDC
oCAyICstCj4+IMKgIHBhY2thZ2UvYmF0L2JhdC5oYXNowqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQo+PiDCoCBwYWNrYWdlL2R1c3Qv
ZHVzdC5oYXNowqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoCAyICstCj4+IMKgIHBhY2thZ2UvZXNwZmxhc2gvZXNwZmxhc2guaGFzaMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCj4+IMKgIHBhY2thZ2UvZXphL2V6YS5oYXNo
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAg
MiArLQo+PiDCoCBwYWNrYWdlL2ZkL2ZkLmhhc2jCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQo+PiDCoCBwYWNrYWdlL2h5cGVy
ZmluZS9oeXBlcmZpbmUuaGFzaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0K
Pj4gwqAgcGFja2FnZS9rbW9uL2ttb24uaGFzaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQo+PiDCoCBwYWNrYWdlL2xpYnplbm9oLWMvbGli
emVub2gtYy5oYXNowqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCj4+IMKgIHBhY2th
Z2UvbmV0YXZhcmsvbmV0YXZhcmsuaGFzaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoCAyICstCj4+IMKgIHBhY2thZ2UvbnVzaGVsbC9udXNoZWxsLmhhc2jCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KPj4gwqAgcGFja2FnZS9wYXJzZWMtdG9v
bC9wYXJzZWMtdG9vbC5oYXNowqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KPj4gwqAgcGFj
a2FnZS9wYXJzZWMvcGFyc2VjLmhhc2jCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqDCoCAyICstCj4+IMKgIHBhY2thZ2UvcGtnLWRvd25sb2FkLm1rwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQo+PiDCoCBwYWNrYWdl
L3Byb2NzL3Byb2NzLmhhc2jCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgwqAgMiArLQo+PiDCoCBwYWNrYWdlL3B5dGhvbi1iY3J5cHQvcHl0aG9uLWJjcnlwdC5o
YXNowqDCoMKgwqDCoCB8wqDCoCAyICstCj4+IMKgIC4uLi9weXRob24tY3J5cHRvZ3JhcGh5Lmhh
c2jCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KPj4gwqAgcGFj
a2FnZS9weXRob24tbWF0dXJpbi9weXRob24tbWF0dXJpbi5oYXNowqDCoMKgIHzCoMKgIDIgKy0K
Pj4gwqAgcGFja2FnZS9weXRob24tb3Jqc29uL3B5dGhvbi1vcmpzb24uaGFzaMKgwqDCoMKgwqAg
fMKgwqAgMiArLQo+PiDCoCAuLi4vcHl0aG9uLXB5ZGFudGljLWNvcmUuaGFzaMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KPj4gwqAgcGFja2FnZS9weXRob24tcnBk
cy1weS9weXRob24tcnBkcy1weS5oYXNowqDCoMKgIHzCoMKgIDIgKy0KPj4gwqAgcGFja2FnZS9w
eXRob24tcnRvbWwvcHl0aG9uLXJ0b21sLmhhc2jCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCj4+
IMKgIHBhY2thZ2UvcHl0aG9uLXNlbGVuaXVtL3B5dGhvbi1zZWxlbml1bS5oYXNowqAgfMKgwqAg
MiArLQo+PiDCoCBwYWNrYWdlL3JpcGdyZXAvcmlwZ3JlcC5oYXNowqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCj4+IMKgIHBhY2thZ2UvcnVzdC1iaW4vcnVzdC1i
aW4uaGFzaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEyOCArKysrKysrKystLS0t
LS0tLS0KPj4gwqAgcGFja2FnZS9ydXN0LWJpbi9ydXN0LWJpbi5ta8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQo+PiDCoCBwYWNrYWdlL3J1c3QtYmluZGdlbi9y
dXN0LWJpbmRnZW4uaGFzaMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KPj4gwqAgcGFja2FnZS9y
dXN0L3J1c3QuaGFzaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgwqAgNCArLQo+PiDCoCBwYWNrYWdlL3J1c3QvcnVzdC5ta8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMgKy0KPj4gwqAgcGFja2Fn
ZS9zZW50cnktY2xpL3NlbnRyeS1jbGkuaGFzaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAg
MiArLQo+PiDCoCBwYWNrYWdlL3RidG9vbHMvdGJ0b29scy5oYXNowqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCj4+IMKgIHBhY2thZ2UvdGVhbGRlZXIvdGVhbGRl
ZXIuaGFzaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCj4+IMKgIHBh
Y2thZ2UvdWVmaXNldHRpbmdzL3VlZmlzZXR0aW5ncy5oYXNowqDCoMKgwqDCoMKgwqAgfMKgwqAg
MiArLQo+PiDCoCBwYWNrYWdlL3pveGlkZS96b3hpZGUuaGFzaMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0KPj4gwqAgMzQgZmlsZXMgY2hhbmdlZCwgOTkg
aW5zZXJ0aW9ucygrKSwgOTggZGVsZXRpb25zKC0pCj4+Cj4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
