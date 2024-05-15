Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59F9C25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 19:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DB4181DBF;
	Wed, 15 May 2024 19:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hIA1O9S5EanS; Wed, 15 May 2024 19:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66FEC81DE6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66FEC81DE6;
	Wed, 15 May 2024 19:19:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 64DD81BF3AF
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 19:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5157540126
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 19:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMe0sseViEee for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 19:19:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1153A400D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1153A400D7
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1153A400D7
 for <buildroot@buildroot.org>; Wed, 15 May 2024 19:19:38 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41ff5e3dc3bso41590475e9.1
 for <buildroot@buildroot.org>; Wed, 15 May 2024 12:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715800776; x=1716405576;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nMNKCCwWVbWRsOC66RUemv9+BaSimpOe3yr1BD2Strc=;
 b=XwAngG5qRLDyLg9CpG2LAEI6X9IJTR0qvuUpukryTLdEMfxUzFJzg3DTIAfTcXpTa7
 QQTSyr0GHB2QAxGp/v/La07CPiUlFayxEmUddmmj8lQQSJBvPyOvlQPFrCwdY/TxcNQl
 rKVTEfU/kNFJjlPe+wt/By80dQ9AsD23NcHN1GpGl0gnYkKVm73gcYJct65wjgrKFPoQ
 qdRDLpx6WtHdJR5G0TAFrva7TkngoW4LTVpp/9rlOIkX3GAo6RbqcHTJIIWRhHLEk4oa
 pbVNGQmHqYvAuZlyVaIKjUsBYp1Q/0S2zhUuzMUilSjzN4Jy7b3vbhIyp99yuEUTDAEI
 nARw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2EEy6rHRHezTsgWTFH5bak741hO5i6i79XS/1mQyISQtzwYj/kxHt8L+UEINxZY/4i4bhqvdDmrO5kLF9iIqXHzL2cR873A==
X-Gm-Message-State: AOJu0Yx9PQJfFzInvs/giq3BTuIZvp3L7BtFLZ+FWn0/pp68W2l+PC8i
 vwayK7Sc2H4p3GOM50MFbDc8mnD1USMR0Lzd+PFruLi4DGuY5Rytl1kr3ySq/ceBbQYThejOd7K
 TfPQ=
X-Google-Smtp-Source: AGHT+IF240Cfbux4AteOPfmUT2tCQUKEMquC8v93lhut1MGMsGC6l/1PnIQeAL/g2OZ6k5qL10sugg==
X-Received: by 2002:a7b:c446:0:b0:419:ed35:e312 with SMTP id
 5b1f17b1804b1-41feaa440f5mr120323815e9.21.1715800776025; 
 Wed, 15 May 2024 12:19:36 -0700 (PDT)
Received: from [172.31.9.104] ([213.0.35.99]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f882086f0sm279128395e9.42.2024.05.15.12.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 12:19:34 -0700 (PDT)
Message-ID: <d0cbd392-35af-4501-9703-d9d79db2a984@mind.be>
Date: Wed, 15 May 2024 21:19:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
References: <5647a701-8c5a-4ce6-92c3-3c252e1cd91b@grenoble.cnrs.fr>
 <4c9e89d1-48f6-48a7-b7af-0d429e2256cc@grenoble.cnrs.fr>
Content-Language: en-GB
In-Reply-To: <4c9e89d1-48f6-48a7-b7af-0d429e2256cc@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1715800776; x=1716405576; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nMNKCCwWVbWRsOC66RUemv9+BaSimpOe3yr1BD2Strc=;
 b=bQRXqXxOHMdyKdXXWnOx/t/7Xu0nSJ+cCEFmLPzvrH/XNuTSwdm4iK9ExIW1PKg8tF
 V2ul257pH0tJ2+FxZi/psam0dyf2BRn2xd46bGAwqe/bAdGZfPa18w4tiXwlMCP/51wN
 j4O15OFUHrnC3xWAKmSebdlIYtoPbCfWOFV/3jp/xoWWcwuTv0mf0XALXOvtQ1I2ImK8
 8oQonBx7n4NO/GAFmNBa4qhJ/vkEYHHQ9rfg+2UKgbdycSgkDNZotEA/7oNFhCMI221A
 QtHPmsOjQtgxpDenyan3/K5830SNvBWoo8SeqXwDn68Gr5lk1ngTHSqwiMHRB6cGO4ri
 M1nw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bQRXqXxO
Subject: Re: [Buildroot] Nginx fails to build with GCC 14
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBFZGdhciwKCk9uIDE1LzA1LzIwMjQgMTc6MzEsIEVkZ2FyIEJvbmV0IHdyb3RlOgo+IEhl
bGxvIGFsbCEKPiAKPiBPbiAyMDI0LTA1LTE0LCBJIHdyb3RlOgo+PiBCdWlsZGluZyBuZ2lueCB3
aXRoIEdDQyAxNCBmYWlscyBhdCB0aGUgY29uZmlndXJlIHN0ZXAgd2l0aDoKPj4KPj4gICAgICAu
L2NvbmZpZ3VyZTogZXJyb3I6IGxpYmF0b21pY19vcHMgbGlicmFyeSB3YXMgbm90IGZvdW5kLgo+
IAo+IEl0IHR1cm5zIG91dCB0aGUgaXNzdWUgaXMgaW4gYSB0aW55IHRlc3QgcHJvZ3JhbSB0aGF0
IHRoZSBjb25maWd1cmUKPiBzY3JpcHQgdHJpZXMgdG8gY29tcGlsZSBpbiBvcmRlciB0byBwcm9i
ZSBmb3IgdGhlIGF0b21pY19vcHMgbGlicmFyeS4KPiBUaGUgY29tcGlsYXRpb24gZmFpbHMgb24g
YW4g4oCcaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlwZeKAnSBlcnJvci4gVXAgdG8KPiBHQ0MgMTMs
IGltcGxpY2l0bHkgY2FzdGluZyBiZXR3ZWVuIGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGVzIG9u
bHkKPiBpc3N1ZWQgYSB3YXJuaW5nLiBTaW5jZSBHQ0MgMTQsIHRoaXMgaXMgYW4gZXJyb3IuWzFd
Cj4gCj4gSSBmaXhlZCB0aGUgaXNzdWUgd2l0aCB0aGUgbWV0YS1wYXRjaCAocGF0Y2ggYWRkaW5n
IGEgcGF0Y2gpIGJlbG93LiBNYXkKPiBJIG5vdyBzdWJtaXQgdGhpcyB0byBidWlsZHJvb3Q/IAoK
ICBTdXJlIHlvdSBjYW4hIFRoZSBvbmx5IHRoaW5nIG1pc3NpbmcgaXMgdGhhdCB0aGUgcGF0Y2gg
c2hvdWxkIGhhdmUgYW4gClVwc3RyZWFtOiB0YWcgd2l0aCB0aGUgVVJMIG9mIHRoZSBQUiBvciB3
aGF0ZXZlciB5b3UgbWFkZSB0byBzZW5kIHRoZSBwYXRjaCAKdXBzdHJlYW0uCgo+IFNob3VsZCBJ
IGluc3RlYWQgYXR0ZW1wdCB0byB1cHN0cmVhbSB0aGUKPiBpbm5lciBwYXRjaCBiZWZvcmUgc3Vi
bWl0dGluZyBoZXJlIHRoZSBtZXRhLXBhdGNoPwoKICBOb3QgaW5zdGVhZCwgYnV0IGluIGFkZGl0
aW9uLiBJdCBjYW4gdGFrZSBhIGxvbmcgdGltZSBiZWZvcmUgdGhlIHBhdGNoIGhhcyAKYmVlbiBh
Y2NlcHRlZCB1cHN0cmVhbSBhbmQgdGhlcmUncyBhIG5ldyByZWxlYXNlLgoKPiBBbnkgY29tbWVu
dHMgb24gdGhlc2UgPiBwYXRjaGVzIGFyZSB3ZWxjb21lLgo+IAo+IFJlZ2FyZHMsCj4gCj4gRWRn
YXIuCj4gCj4gWzFdIGh0dHBzOi8vZ2NjLmdudS5vcmcvZ2NjLTE0L3BvcnRpbmdfdG8uaHRtbCNp
bmNvbXBhdGlibGUtcG9pbnRlci10eXBlcwo+IAo+IC0tID44IC0tCj4gU3ViamVjdDogW1BBVENI
IDEvMV0gcGFja2FnZS9uZ2lueDogZml4IGNvbXBpbGUgZXJyb3IgaW4gY29uZmlndXJlIHNjcmlw
dAo+IAo+IEJ1aWxkaW5nIHdpdGggR0NDIDE0IGZhaWxzIGF0IHRoZSBjb25maWd1cmUgc3RlcCB3
aXRoOgo+IAo+ICAgICAgLi9jb25maWd1cmU6IGVycm9yOiBsaWJhdG9taWNfb3BzIGxpYnJhcnkg
d2FzIG5vdCBmb3VuZC4KPiAKPiBUaGUgZXJyb3IgaXMgbm90IGNhdXNlZCBieSBhIG1pc3Npbmcg
bGlicmFyeSwgYnV0IGJ5IGFuIHVucmVsYXRlZAo+ICJpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBl
IiBlcnJvciBpbiB0aGUgdGVzdCBwcm9ncmFtOgo+IAo+ICAgICAgLi4uCj4gICAgICBjaGVja2lu
ZyBmb3IgYXRvbWljX29wcyBsaWJyYXJ5Cj4gICAgICBvYmpzL2F1dG90ZXN0LmM6IEluIGZ1bmN0
aW9uICdtYWluJzoKPiAgICAgIG9ianMvYXV0b3Rlc3QuYzo5OjQ4OiBlcnJvcjogcGFzc2luZyBh
cmd1bWVudCAxIG9mICdBT19jb21wYXJlX2FuZF9zd2FwJyBmcm9tIGluY29tcGF0aWJsZSBwb2lu
dGVyIHR5cGUgWy1XaW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCj4gCj4gVGhpcyB1c2VkIHRv
IGJlIGEgd2FybmluZywgYnV0IGl0IGlzIGFuIGVycm9yIHNpbmNlIEdDQyAxNC5bMV0KPiAKPiBG
aXggdGhpcyBieSBwYXRjaGluZyB0aGUgdGVzdCBwcm9ncmFtIGluIG9yZGVyIHRvIHVzZSB0aGUg
Y29ycmVjdAo+IHBvaW50ZXIgdHlwZXMuCj4gCj4gWzFdIGh0dHBzOi8vZ2NjLmdudS5vcmcvZ2Nj
LTE0L3BvcnRpbmdfdG8uaHRtbCNpbmNvbXBhdGlibGUtcG9pbnRlci10eXBlcwo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZyPgo+IC0tLQo+ICAg
Li4uaXgtY29tcGlsZS1lcnJvci1pbi1jb25maWd1cmUtc2NyaXB0LnBhdGNoIHwgNDAgKysrKysr
KysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKykKPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL25naW54LzAwMTEtRml4LWNvbXBpbGUtZXJyb3ItaW4t
Y29uZmlndXJlLXNjcmlwdC5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL25naW54LzAw
MTEtRml4LWNvbXBpbGUtZXJyb3ItaW4tY29uZmlndXJlLXNjcmlwdC5wYXRjaCBiL3BhY2thZ2Uv
bmdpbngvMDAxMS1GaXgtY29tcGlsZS1lcnJvci1pbi1jb25maWd1cmUtc2NyaXB0LnBhdGNoCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5mODE2MGExZGEyCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbmdpbngvMDAxMS1GaXgtY29tcGlsZS1lcnJvci1p
bi1jb25maWd1cmUtc2NyaXB0LnBhdGNoCj4gQEAgLTAsMCArMSw0MCBAQAo+ICtGcm9tIGUxYmNh
YzgzN2Y2YWVhYmM0ZGRlY2UwNmVjYmNmMmJjY2E4ZGQ2NTEgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCj4gK0Zyb206IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZyPgo+ICtEYXRl
OiBXZWQsIDE1IE1heSAyMDI0IDE2OjM1OjI3ICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gRml4
IGNvbXBpbGUgZXJyb3IgaW4gY29uZmlndXJlIHNjcmlwdAo+ICsKPiArQnVpbGRpbmcgd2l0aCBH
Q0MgMTQgZmFpbHMgYXQgdGhlIGNvbmZpZ3VyZSBzdGVwIHdpdGg6Cj4gKwo+ICsgICAgLi9jb25m
aWd1cmU6IGVycm9yOiBsaWJhdG9taWNfb3BzIGxpYnJhcnkgd2FzIG5vdCBmb3VuZC4KPiArCj4g
K1RoZSBlcnJvciBpcyBub3QgY2F1c2VkIGJ5IGEgbWlzc2luZyBsaWJyYXJ5LCBidXQgYnkgYW4g
dW5yZWxhdGVkCj4gKyJpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIiBlcnJvciBpbiB0aGUgdGVz
dCBwcm9ncmFtOgo+ICsKPiArICAgIC4uLgo+ICsgICAgY2hlY2tpbmcgZm9yIGF0b21pY19vcHMg
bGlicmFyeQo+ICsgICAgb2Jqcy9hdXRvdGVzdC5jOiBJbiBmdW5jdGlvbiAnbWFpbic6Cj4gKyAg
ICBvYmpzL2F1dG90ZXN0LmM6OTo0ODogZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMSBvZiAnQU9f
Y29tcGFyZV9hbmRfc3dhcCcgZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIFstV2luY29t
cGF0aWJsZS1wb2ludGVyLXR5cGVzXQo+ICsKPiArRml4IHRoZSBlcnJvciBieSB1c2luZyB0aGUg
Y29ycmVjdCBwb2ludGVyIHR5cGVzLgo+ICsKPiArU2lnbmVkLW9mZi1ieTogRWRnYXIgQm9uZXQg
PGJvbmV0QGdyZW5vYmxlLmNucnMuZnI+Cj4gKy0tLQo+ICsgYXV0by9saWIvbGliYXRvbWljL2Nv
bmYgfCAyICstCj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiArCj4gK2RpZmYgLS1naXQgYS9hdXRvL2xpYi9saWJhdG9taWMvY29uZiBiL2F1dG8vbGli
L2xpYmF0b21pYy9jb25mCj4gK2luZGV4IGQxZTQ4NGEuLjBmMTJiOWMgMTAwNjQ0Cj4gKy0tLSBh
L2F1dG8vbGliL2xpYmF0b21pYy9jb25mCj4gKysrKyBiL2F1dG8vbGliL2xpYmF0b21pYy9jb25m
Cj4gK0BAIC0yMCw3ICsyMCw3IEBAIGVsc2UKPiArICAgICAgICAgICAgICAgICAgICAgICAjaW5j
bHVkZSA8YXRvbWljX29wcy5oPiIKPiArICAgICBuZ3hfZmVhdHVyZV9wYXRoPQo+ICsgICAgIG5n
eF9mZWF0dXJlX2xpYnM9Ii1sYXRvbWljX29wcyIKPiArLSAgICBuZ3hfZmVhdHVyZV90ZXN0PSJs
b25nICBuID0gMDsKPiArKyAgICBuZ3hfZmVhdHVyZV90ZXN0PSJ2b2xhdGlsZSBzaXplX3QgIG4g
PSAwOwoKICBUaGUgaW50ZXJmYWNlIGFjdHVhbGx5IGRlZmluZXMgaXQgYXMgQU9fdCwgc28gcGVy
aGFwcyB1c2UgdGhhdCBpbnN0ZWFkIG9mIAp2b2xhdGlsZSBzaXplX3Q/CgoKICBSZWdhcmRzLAog
IEFybm91dAoKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoIUFPX2NvbXBhcmVfYW5kX3N3
YXAoJm4sIDAsIDEpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMTsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBpZiAoQU9fZmV0Y2hfYW5kX2FkZCgmbiwgMSkgIT0gMSkK
PiArLS0KPiArMi4zNC4xCj4gKwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
