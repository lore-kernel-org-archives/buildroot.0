Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661AEC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E22382F32;
	Tue,  6 Feb 2024 17:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QxHXC8dqtzyY; Tue,  6 Feb 2024 17:55:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15AF882F99
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15AF882F99;
	Tue,  6 Feb 2024 17:55:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B674A1BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A194582F77
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:55:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9_xfSwhNU5IW for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:55:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96DA882F32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96DA882F32
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96DA882F32
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:55:49 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40fe2ed8746so8093345e9.3
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 09:55:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707242148; x=1707846948;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sxuOLh9F99mQnhC1pHAjBh7/gstKGQFldW4JWVjgL3M=;
 b=WcH87rLtM+daiTQ5LgCXIjv2PH8MKfxr3j/gMcDYvi7XozvrfqqySDiRZOEX9P4q3k
 TNExRO/SISFZHqLQ4lHaLjMXjd5wZ+8xQizzsu0usPMyqBfFCrhZMSa8ZvMx7sKm6ORh
 xPqDIbsXm1U0jWQuTSu74sRCj29cHCuEdleDdMHMgzA6xEpbXIR/Bp84zAa1A3eGBl7M
 l9RktbeEFVipenbn03GRTwjKF57pxnHnJXYn3Ob3M8enAsNNtfxtBw6wIWDnVrGJsj2+
 zCDl7yZDorOX6W++RNj35RsiTXo5BhERHqLfzxCrUxZK9JpqhqGRIoQmqGa417ab1amj
 9q2w==
X-Gm-Message-State: AOJu0Yz7MTulnZLT0ZD5HKcmunzgX7i2N1dFKdPoL3RRkMr0M5umXp9G
 cQka66rOJRccSfPt9W6WYTkLSM+AU4yiYseC0rMvguubYAi14xlSW08CNfa9YS8=
X-Google-Smtp-Source: AGHT+IFcgZu2jA83liFMCO8ShbzT7EULfKapGd+FuOfe9m9kAK11kdJizeolTpTnmuWVL/+sqVPQ8g==
X-Received: by 2002:a05:600c:3ac9:b0:40f:f532:f3 with SMTP id
 d9-20020a05600c3ac900b0040ff53200f3mr914032wms.34.1707242147630; 
 Tue, 06 Feb 2024 09:55:47 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVs3YT8347HyBy/8gFB5BO9TOBKZjU8VHgIjjD5D9usvJwCGtlVeeZR6cq4eLw+82XhIllyXf6fBAs0DEaYIDfzcZK64jxgFYqMo58/2Hw/hFowE/2oOikqLek=
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a5d66c4000000b0033b4796641asm1891649wrw.22.2024.02.06.09.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 09:55:47 -0800 (PST)
Message-ID: <2e4bb17c-ef38-437b-bc6e-853c92f32646@mind.be>
Date: Tue, 6 Feb 2024 18:55:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240106214410.3294887-1-james.hilliard1@gmail.com>
 <20240106214410.3294887-2-james.hilliard1@gmail.com>
 <e0a5819f-4370-4386-896a-7e736f45b54b@mind.be>
In-Reply-To: <e0a5819f-4370-4386-896a-7e736f45b54b@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707242148; x=1707846948; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sxuOLh9F99mQnhC1pHAjBh7/gstKGQFldW4JWVjgL3M=;
 b=WqlDta6uYHQlRti/NnnwDEdmWG3ABX2LRUKwqQ18NK9UeBJKGI0wgjsC2u5I9fNzSY
 QwbOjIN3HZq/bPuy8ha+mlvcWQ9lhcseRAMsxrreIHFyC/z7tIN1magAf8WqfS/WvTQQ
 2N5u2RpeKbRx8TGFrEVYlDRthD0+KSLyVm95neqnBXxC58WLsKApQVPsS9FMFM3mYprr
 yWR4jTGBU9MNv1m3mwMRK8XDItCxIasO3LiT1vyPnQHTUhOmJsStGSt9b5n3HeC9aWUv
 wmt7UD2afR9O3B8UYZMtndx3pVHs/oCcStGQg+tf9BhWsk4YzFoPCr9gPyh495GkhZkm
 Or4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WqlDta6u
Subject: Re: [Buildroot] [PATCH v2 2/4] package/python-aiosqlite: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDA2LzAyLzIwMjQgMTg6MTcsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAwNi8wMS8yMDI0IDIyOjQ0LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPj4gU2lnbmVkLW9mZi1i
eTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4KPiDCoEFwcGxp
ZWQgYm90aCB0byBtYXN0ZXIsIHRoYW5rcy4KCgogwqBTb3JyeSwgSSBnb3QgY29uZnVzZWQgd2l0
aCB0aGUgZGlmZmVyZW50IHZlcnNpb25zLiBJIGFjdHVhbGx5IGFwcGxpZWQgdGhpcyAKdmVyc2lv
biBvZiBweXRob24tYWlvc3FsaXRlLCBidXQgSSB1c2VkIHRoZSBoZWxwIHRleHQgZnJvbSB0aGUg
b3RoZXIgb25lIGJlY2F1c2UgCnRoYXQgd2FzIGJldHRlci4KCiDCoEkgZGlkbid0IGFwcGx5IGFu
eSBvdGhlciBwYXRjaCBmcm9tIHRoaXMgc2VyaWVzIGJlY2F1c2UgdGhlIGxpY2Vuc2Ugb2YgCnBv
ZXRyeS1jb3JlIGlzIG5vdCBjb3JyZWN0LiBUaGUgcmVzdCBvZiB0aGUgc2VyaWVzIGlzIGFsc28g
bWFya2VkIENoYW5nZXMgUmVxdWVzdGVkLgoKCiDCoFBsZWFzZSBhdm9pZCBoYXZpbmcgdGhlIHNh
bWUgcGF0Y2ggKGxpa2UgdGhpcyBvbmUpIGluIHNldmVyYWwgc2VyaWVzLiBJZiB5b3UgCm5lZWQg
aXQgaW4gc2V2ZXJhbCBzZXJpZXMsIGp1c3QgY29tYmluZSB0aG9zZSBwYXRjaGVzIGluIGEgc2lu
Z2xlIHNlcmllcyBhbmQgCm1hcmsgdGhlIHByZXZpb3VzIHZlcnNpb24gYXMgU3VwZXJzZWRlZC4g
VGhhdCBtYWtlcyBvdXIgbGl2ZSBhIGxvdCBlYXNpZXIuCgoKIMKgUmVnYXJkcywKIMKgQXJub3V0
CgoKPgo+IMKgUmVnYXJkcywKPiDCoEFybm91dAo+Cj4+IC0tLQo+PiBDaGFuZ2VzIHYxIC0+IHYy
Ogo+PiDCoMKgIC0gYWRkIG1pc3NpbmcgcHl0aG9uIHNxbGl0ZSBtb2R1bGUKPj4gLS0tCj4+IMKg
IHBhY2thZ2UvQ29uZmlnLmluwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArCj4+IMKgIHBhY2thZ2UvcHl0aG9uLWFpb3NxbGl0
ZS9Db25maWcuaW7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDcgKysrKysrKwo+PiDCoCBw
YWNrYWdlL3B5dGhvbi1haW9zcWxpdGUvcHl0aG9uLWFpb3NxbGl0ZS5oYXNoIHzCoCA1ICsrKysr
Cj4+IMKgIHBhY2thZ2UvcHl0aG9uLWFpb3NxbGl0ZS9weXRob24tYWlvc3FsaXRlLm1rwqDCoCB8
IDE0ICsrKysrKysrKysrKysrCj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygr
KQo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tYWlvc3FsaXRlL0NvbmZp
Zy5pbgo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tYWlvc3FsaXRlL3B5
dGhvbi1haW9zcWxpdGUuaGFzaAo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRo
b24tYWlvc3FsaXRlL3B5dGhvbi1haW9zcWxpdGUubWsKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KPj4gaW5kZXggZjVkMGMwNjMzNC4uZWEw
MjNhODRlZiAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPj4gKysrIGIvcGFja2Fn
ZS9Db25maWcuaW4KPj4gQEAgLTk3OCw2ICs5NzgsNyBAQCBtZW51ICJFeHRlcm5hbCBweXRob24g
bW9kdWxlcyIKPj4gwqDCoMKgwqDCoCBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWFpb3JlZGlzL0Nv
bmZpZy5pbiIKPj4gwqDCoMKgwqDCoCBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWFpb3J3bG9jay9D
b25maWcuaW4iCj4+IMKgwqDCoMKgwqAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1haW9zaWduYWwv
Q29uZmlnLmluIgo+PiArwqDCoMKgIHNvdXJjZSAicGFja2FnZS9weXRob24tYWlvc3FsaXRlL0Nv
bmZpZy5pbiIKPj4gwqDCoMKgwqDCoCBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWFpb3ppcGtpbi9D
b25maWcuaW4iCj4+IMKgwqDCoMKgwqAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1hbGVtYmljL0Nv
bmZpZy5pbiIKPj4gwqDCoMKgwqDCoCBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWFsc2FhdWRpby9D
b25maWcuaW4iCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1haW9zcWxpdGUvQ29uZmln
LmluIAo+PiBiL3BhY2thZ2UvcHl0aG9uLWFpb3NxbGl0ZS9Db25maWcuaW4KPj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uNzdjNzhlYTI1ZAo+PiAtLS0gL2Rldi9u
dWxsCj4+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWFpb3NxbGl0ZS9Db25maWcuaW4KPj4gQEAgLTAs
MCArMSw3IEBACj4+ICtjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX0FJT1NRTElURQo+PiArwqDC
oMKgIGJvb2wgInB5dGhvbi1haW9zcWxpdGUiCj4+ICvCoMKgwqAgc2VsZWN0IEJSMl9QQUNLQUdF
X1BZVEhPTjNfU1FMSVRFICMgcnVudGltZQo+PiArwqDCoMKgIGhlbHAKPj4gK8KgwqDCoMKgwqAg
YXN5bmNpbyBicmlkZ2UgdG8gdGhlIHN0YW5kYXJkIHNxbGl0ZTMgbW9kdWxlLgo+PiArCj4+ICvC
oMKgwqDCoMKgIGh0dHBzOi8vYWlvc3FsaXRlLm9tbmlsaWIuZGV2Lwo+PiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9weXRob24tYWlvc3FsaXRlL3B5dGhvbi1haW9zcWxpdGUuaGFzaCAKPj4gYi9wYWNr
YWdlL3B5dGhvbi1haW9zcWxpdGUvcHl0aG9uLWFpb3NxbGl0ZS5oYXNoCj4+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLmUwNjA2MTM0NmMKPj4gLS0tIC9kZXYvbnVs
bAo+PiArKysgYi9wYWNrYWdlL3B5dGhvbi1haW9zcWxpdGUvcHl0aG9uLWFpb3NxbGl0ZS5oYXNo
Cj4+IEBAIC0wLDAgKzEsNSBAQAo+PiArIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5v
cmcvcHlwaS9haW9zcWxpdGUvanNvbgo+PiArbWQ1wqAgZTgyOWJmOGY2NDFhYjExNWMxYTljYTA0
OTRkMzUyNzjCoCBhaW9zcWxpdGUtMC4xOS4wLnRhci5nego+PiArc2hhMjU2IDk1ZWU3N2I5MWM4
ZDI4MDhiZDA4YTU5ZmJlYmY2NjI3MGU5MDkwYzNkOTJmZmJmMjYwZGMwZGIwYjk3OTU3N2QgCj4+
IGFpb3NxbGl0ZS0wLjE5LjAudGFyLmd6Cj4+ICsjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNo
ZWNrc3Vtcwo+PiArc2hhMjU2IGFiMGMxNzFkYzNlZjhiZjMyNWE4NGJiNzdkODU1NDIxZjI2MTEz
MzVkZGY2ZTA4ODE2YjI5MjJjNGVkYzBmNzYgTElDRU5TRQo+PiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9weXRob24tYWlvc3FsaXRlL3B5dGhvbi1haW9zcWxpdGUubWsgCj4+IGIvcGFja2FnZS9weXRo
b24tYWlvc3FsaXRlL3B5dGhvbi1haW9zcWxpdGUubWsKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
Pj4gaW5kZXggMDAwMDAwMDAwMC4uZTUxM2Q1M2MwMgo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBi
L3BhY2thZ2UvcHl0aG9uLWFpb3NxbGl0ZS9weXRob24tYWlvc3FsaXRlLm1rCj4+IEBAIC0wLDAg
KzEsMTQgQEAKPj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIAo+Pgo+PiArIwo+PiArIyBweXRo
b24tYWlvc3FsaXRlCj4+ICsjCj4+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyAKPj4KPj4gKwo+
PiArUFlUSE9OX0FJT1NRTElURV9WRVJTSU9OID0gMC4xOS4wCj4+ICtQWVRIT05fQUlPU1FMSVRF
X1NPVVJDRSA9IGFpb3NxbGl0ZS0kKFBZVEhPTl9BSU9TUUxJVEVfVkVSU0lPTikudGFyLmd6Cj4+
ICtQWVRIT05fQUlPU1FMSVRFX1NJVEUgPSAKPj4gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQu
b3JnL3BhY2thZ2VzL2VhLzUxLzA2MGVmYTEwYTgxNDE0NWFjZDRlNDJjNmU1ZWQ1NDBiODcxNGNh
ZDUyY2EwMjZjNTkzMGU3YzQ3MzA0OQo+PiArUFlUSE9OX0FJT1NRTElURV9TRVRVUF9UWVBFID0g
ZmxpdAo+PiArUFlUSE9OX0FJT1NRTElURV9MSUNFTlNFID0gTUlUCj4+ICtQWVRIT05fQUlPU1FM
SVRFX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4+ICsKPj4gKyQoZXZhbCAkKHB5dGhvbi1wYWNr
YWdlKSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
