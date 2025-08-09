Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5B3C87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 20:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3CA260DC5;
	Sat,  9 Aug 2025 20:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_-qNZL3f0RQ; Sat,  9 Aug 2025 20:53:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1467A60C18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1467A60C18;
	Sat,  9 Aug 2025 20:53:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFB8C1D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 20:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AD4F860DA9
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 20:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cC54zioUQfIX for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 20:53:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 911AE60846
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 911AE60846
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 911AE60846
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 20:53:29 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b78294a233so2726831f8f.3
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 13:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754772807; x=1755377607;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dy/SSQ7PWJ07Vh0JKYRotxZXtoIH7fFh5rtTj4Of/VQ=;
 b=WLRxQJtfFa5WI7BTRxnJPITyQqrY5nq+jFqInJ9JP6lBs5ygPcF1CJzDGWqxJDC0IG
 GXoGVATus9mj6WkvhgydSEG4vA6mVa10Na6DtHiWyneyKNfNoFsWeXzTT7QXk8KCPXea
 BKc1H9bg2PTNDvszpm8u8vcdHYkAuKr/RAetJ3ngTsozp6vCQgTBibp+Mp/JDNcV4Ye6
 g5y2RGdOsgRBaPmPygYvKEVda0d8kDAqFYwOerCLdLx5Xyb/ibJvwRKHsohnJ3ARCa1W
 zp29SBSdrxbInG3RD6q/5dZWRcjhl2E7deY8lCAl03zgjFxQ0WJzkdn30nXNtKEhvlCu
 BFJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdT6ADpmIuY4aWe3jIMfNDSrU25GQtxKvywWtlo/dARRi4sSsaSXOnpqH0J3QTSbrqGt+ozo4JTG0=@buildroot.org
X-Gm-Message-State: AOJu0YxqbtXSRurBR08gUbr3lcYDkSBuU+daS9NwwseC9PaM/G86bBhu
 fniUQfrnHJ4BTPzVmmHeY5Ne2V8CfkXtCbz994QG8aD+vVBJJ5KvbUfWPOvw/HkNpWP8pDSd6Q+
 tuRI+
X-Gm-Gg: ASbGncsuhIU8LdAV5fc/tlfcBJYJf9X3m4tk+ZR5YThTzVnKgsuKV8PmRhwq2mxQOW+
 2JOA76GOgsU+xK8gQfA2zpIRR/3owqFkt9509rD5acnUro8kMkZm7wTLkvEdqAccJ0g6RV4ugXo
 9iP1u/9sl2MuB4VIqXv6F9Uxm3y2ORlKJfFOPf27Rits7p+VMdm+u29FOYbnHJZCe2qWnq57FNY
 dIo9gcew8p09phP55PZGQaY7CvCNBA7M2JD6vzPyyuXr0Tkdr/nFfJn4DPA1TU4iGzFrpZjGp73
 vzMQCQG3+Xjtos6VluJOwuaXhty0wwYYOxWBZ6AElJUr6bKejH3XgkjLzGk7rdGwhX0mjSarf6A
 CA3EAzsD32lf9iD57huoHGkv2NaeDcMwoxPIZjvDfARkzVarK2KkSlL8ZN6fcOYaN737QepSfEf
 6SvKtihRFCaYOE2PEr3HTk3yAo2km2Qnt2cv3gP7ij0zxTbIY0k6jDLR3o0B/+v9dfrCh3TQA=
X-Google-Smtp-Source: AGHT+IFqwmDw2FBnJDBOoWr0MBlBFhQJiI1x0nfHM6Aqw2hVWJ57X8LfrkxuJXPKEpHPzCg/k6UpuA==
X-Received: by 2002:a05:6000:4310:b0:3b7:8f50:f469 with SMTP id
 ffacd0b85a97d-3b900b449c9mr6815950f8f.1.1754772807466; 
 Sat, 09 Aug 2025 13:53:27 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e0e70218sm217837555e9.20.2025.08.09.13.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Aug 2025 13:53:27 -0700 (PDT)
Message-ID: <78bc824b-bd82-4ad0-8f0a-29c40cae0ed8@smile.fr>
Date: Sat, 9 Aug 2025 22:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
References: <20250809201954.333758-1-thomas.perale@mind.be>
Content-Language: fr
In-Reply-To: <20250809201954.333758-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754772807; x=1755377607; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dy/SSQ7PWJ07Vh0JKYRotxZXtoIH7fFh5rtTj4Of/VQ=;
 b=CKNGPkXaDXqssyw1pghaOX7Q70xX5nyRI2L5/0QkKqS4XIfTQ3r9xMN7lQyF7XMJ1m
 MVg+Vwu7Vz2MLgfkcOZuDodcDpGpOZXHXiNyEJ85W2mGsArrFBbM28jmVfQl4A2zpIjz
 3lc49SmCyqNBoiBdKDcMNBGjc/pL2kpCp6Fk8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=CKNGPkXa
Subject: Re: [Buildroot] [PATCH v2] package/tini: fix build w/ musl
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAwOS8wOC8yMDI1IMOgIDIyOjE5LCBUaG9tYXMgUGVyYWxl
IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBXaGVuIGJ1aWxkaW5nIHRpbmkgd2l0aCBtdXNs
IGxpYmMsIHRoZSBmb2xsb3dpbmcgZXJyb3Igb2NjdXJzIGR1ciB0bwo+IG1pc3NpbmcgZGVjbGFy
YXRpb24gb2YgJ2Jhc2VuYW1lJzoKPiAKPiBgYGAKPiAvaG9tZS9idWlsZHJvb3QvaW5zdGFuY2Ut
MC9vdXRwdXQtMS9idWlsZC90aW5pLTAuMTkuMC9zcmMvdGluaS5jOiBJbiBmdW5jdGlvbiAncHJp
bnRfdXNhZ2UnOgo+IC9ob21lL2J1aWxkcm9vdC9pbnN0YW5jZS0wL291dHB1dC0xL2J1aWxkL3Rp
bmktMC4xOS4wL3NyYy90aW5pLmM6MjI3OjM2OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24g
b2YgZnVuY3Rpb24gJ2Jhc2VuYW1lJyBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0K
PiAgIDIyNyB8ICAgICAgICAgZnByaW50ZihmaWxlLCAiJXMgKCVzKVxuIiwgYmFzZW5hbWUobmFt
ZSksIFRJTklfVkVSU0lPTl9TVFJJTkcpOwo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBefn5+fn5+fgo+IG1ha2U6ICoqKiBbcGFja2FnZS9wa2ctZ2VuZXJpYy5t
azoyNzM6IC9ob21lL2J1aWxkcm9vdC9pbnN0YW5jZS0wL291dHB1dC0xL2J1aWxkL3RpbmktMC4x
OS4wLy5zdGFtcF9idWlsdF0gRXJyb3IgMQo+IG1ha2U6IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9t
ZS9idWlsZHJvb3QvaW5zdGFuY2UtMC9idWlsZHJvb3QnCj4gYGBgCj4gCj4gVGhpcyBlcnJvciBj
YW4gYmUgcmVwcm9kdWNlZCB3aXRoOgo+IAo+IGBgYAo+IGNhdCA+LmNvbmZpZyA8PEVPRgo+IEJS
Ml9hYXJjaDY0PXkKPiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiBCUjJfVE9PTENIQUlOX0VY
VEVSTkFMX0JPT1RMSU49eQo+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9BQVJDSDY0
X01VU0xfQkxFRURJTkdfRURHRT15Cj4gQlIyX1BBQ0tBR0VfVElOST15Cj4gRU9GCj4gbWFrZSBv
bGRkZWZjb25maWcKPiBtYWtlIHRpbmkKPiBgYGAKPiAKPiBUaGlzIHBhdGNoIGFkZHMgdGhlIHVw
c3RyZWFtIGNvbW1pdCBbMV0sIHRoYXQgZml4ZXMgdGhpcyBpc3N1ZSBieQo+IGluY2x1ZGluZyBg
bGliZ2VuLmhgLgo+IAo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20va3JhbGxpbi90aW5pL2NvbW1p
dC85MjRjNGJkNjAyODQ1NzE4ODk0MmVjYmZkYzc1ZTZhMzQzZmE5Mzk1Cj4gCj4gRml4ZXM6IGh0
dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9mMGQvZjBkMTBjZDI1ZjNiMGUy
YTRhZjcyNjZmNzQxN2IzMzllYTVkMjQyYQo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJhbGUg
PHRob21hcy5wZXJhbGVAbWluZC5iZT4KClRoYW5rcyBmb3IgdGhlIHJlc3BpbiEKCkFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gLS0tCj4gIC4uLnVw
cG9ydC1wb3NpeC1iYXNlbmFtZS1mcm9tLW11c2wtbGliYy5wYXRjaCB8IDc2ICsrKysrKysrKysr
KysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDc2IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvdGluaS8wMDAxLXN1cHBvcnQtcG9zaXgtYmFzZW5hbWUtZnJvbS1t
dXNsLWxpYmMucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS90aW5pLzAwMDEtc3VwcG9y
dC1wb3NpeC1iYXNlbmFtZS1mcm9tLW11c2wtbGliYy5wYXRjaCBiL3BhY2thZ2UvdGluaS8wMDAx
LXN1cHBvcnQtcG9zaXgtYmFzZW5hbWUtZnJvbS1tdXNsLWxpYmMucGF0Y2gKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjE3NDQ1ZDViM2IKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvcGFja2FnZS90aW5pLzAwMDEtc3VwcG9ydC1wb3NpeC1iYXNlbmFtZS1mcm9tLW11
c2wtbGliYy5wYXRjaAo+IEBAIC0wLDAgKzEsNzYgQEAKPiArRnJvbSA5MjRjNGJkNjAyODQ1NzE4
ODk0MmVjYmZkYzc1ZTZhMzQzZmE5Mzk1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9t
OiBIYXVrZSBNZWhydGVucyA8aGF1a2VAaGF1a2UtbS5kZT4KPiArRGF0ZTogU3VuLCAxNCBBcHIg
MjAyNCAxNTozMzo1MSArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIFN1cHBvcnQgUE9TSVggYmFz
ZW5hbWUoKSBmcm9tIG11c2wgbGliYwo+ICsKPiArTXVzbCBsaWJjIDEuMi41IHJlbW92ZWQgdGhl
IGRlZmluaXRpb24gb2YgdGhlIGJhc2VuYW1lKCkgZnVuY3Rpb24gZnJvbQo+ICtzdHJpbmcuaCBh
bmQgb25seSBwcm92aWRlcyBpdCBpbiBsaWJnZW4uaCBhcyB0aGUgUE9TSVggc3RhbmRhcmQKPiAr
ZGVmaW5lcyBpdC4KPiArCj4gK1RoaXMgY2hhbmdlIGZpeGVzIGNvbXBpbGF0aW9uIHdpdGggbXVz
bCBsaWJjIDEuMi41Lgo+ICtgYGBgCj4gK2J1aWxkX2Rpci90YXJnZXQtbWlwc18yNGtjX211c2wv
dGluaS0wLjE5LjAvc3JjL3RpbmkuYzoyMjc6MzY6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlv
biBvZiBmdW5jdGlvbiAnYmFzZW5hbWUnIFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9u
XQo+ICsgIDIyNyB8ICAgICAgICAgZnByaW50ZihmaWxlLCAiJXMgKCVzKVxuIiwgYmFzZW5hbWUo
bmFtZSksIFRJTklfVkVSU0lPTl9TVFJJTkcpOwo+ICtidWlsZF9kaXIvdGFyZ2V0LW1pcHNfMjRr
Y19tdXNsL3RpbmktMC4xOS4wL3NyYy90aW5pLmM6MjI3OjI1OiBlcnJvcjogZm9ybWF0ICclcycg
ZXhwZWN0cyBhcmd1bWVudCBvZiB0eXBlICdjaGFyIConLCBidXQgYXJndW1lbnQgMyBoYXMgdHlw
ZSAnaW50JyBbLVdlcnJvcj1mb3JtYXQ9XQo+ICsgIDIyNyB8ICAgICAgICAgZnByaW50ZihmaWxl
LCAiJXMgKCVzKVxuIiwgYmFzZW5hbWUobmFtZSksIFRJTklfVkVSU0lPTl9TVFJJTkcpOwo+ICsg
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgfl4gICAgICAgICAgfn5+fn5+fn5+fn5+fn4K
PiArICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgIHwKPiArICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICBjaGFyICogICAgIGludAo+ICsgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgJWQKPiArCj4gK2BgYGAKPiArCj4gK2Jhc2VuYW1lKCkgbW9kaWZp
ZXMgdGhlIGlucHV0IHN0cmluZywgY29weSBpdCBmaXJzdCB3aXRoIHN0cmR1cCgpLCBJZgo+ICtz
dHJkdXAoKSByZXR1cm5zIE5VTEwgdGhlIGNvZGUgd2lsbCBoYW5kbGUgaXQuCj4gKwo+ICtTaWdu
ZWQtb2ZmLWJ5OiBIYXVrZSBNZWhydGVucyA8aGF1a2VAaGF1a2UtbS5kZT4KPiArVXBzdHJlYW06
IGh0dHBzOi8vZ2l0aHViLmNvbS9rcmFsbGluL3RpbmkvY29tbWl0LzkyNGM0YmQ2MDI4NDU3MTg4
OTQyZWNiZmRjNzVlNmEzNDNmYTkzOTUKPiArU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBlcmFsZSA8
dGhvbWFzLnBlcmFsZUBtaW5kLmJlPgo+ICstLS0KPiArIHNyYy90aW5pLmMgfCAxNSArKysrKysr
KysrKy0tLS0KPiArIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+ICsKPiArZGlmZiAtLWdpdCBhL3NyYy90aW5pLmMgYi9zcmMvdGluaS5jCj4gK2luZGV4
IDc5MTRkM2EuLjQxZDE1MDYgMTAwNjQ0Cj4gKy0tLSBhL3NyYy90aW5pLmMKPiArKysrIGIvc3Jj
L3RpbmkuYwo+ICtAQCAtMTQsNiArMTQsNyBAQAo+ICsgI2luY2x1ZGUgPHN0ZGxpYi5oPgo+ICsg
I2luY2x1ZGUgPHVuaXN0ZC5oPgo+ICsgI2luY2x1ZGUgPHN0ZGJvb2wuaD4KPiArKyNpbmNsdWRl
IDxsaWJnZW4uaD4KPiArIAo+ICsgI2luY2x1ZGUgInRpbmlDb25maWcuaCIKPiArICNpbmNsdWRl
ICJ0aW5pTGljZW5zZS5oIgo+ICtAQCAtMjI0LDE0ICsyMjUsMTkgQEAgaW50IHNwYXduKGNvbnN0
IHNpZ25hbF9jb25maWd1cmF0aW9uX3QqIGNvbnN0IHNpZ2NvbmZfcHRyLCBjaGFyKiBjb25zdCBh
cmd2W10sIGkKPiArIH0KPiArIAo+ICsgdm9pZCBwcmludF91c2FnZShjaGFyKiBjb25zdCBuYW1l
LCBGSUxFKiBjb25zdCBmaWxlKSB7Cj4gKy0JZnByaW50ZihmaWxlLCAiJXMgKCVzKVxuIiwgYmFz
ZW5hbWUobmFtZSksIFRJTklfVkVSU0lPTl9TVFJJTkcpOwo+ICsrCWNoYXIgKmRpcmMsICpibmFt
ZTsKPiArKwo+ICsrCWRpcmMgPSBzdHJkdXAobmFtZSk7Cj4gKysJYm5hbWUgPSBiYXNlbmFtZShk
aXJjKTsKPiArKwo+ICsrCWZwcmludGYoZmlsZSwgIiVzICglcylcbiIsIGJuYW1lLCBUSU5JX1ZF
UlNJT05fU1RSSU5HKTsKPiArIAo+ICsgI2lmIFRJTklfTUlOSU1BTAo+ICstCWZwcmludGYoZmls
ZSwgIlVzYWdlOiAlcyBQUk9HUkFNIFtBUkdTXSB8IC0tdmVyc2lvblxuXG4iLCBiYXNlbmFtZShu
YW1lKSk7Cj4gKysJZnByaW50ZihmaWxlLCAiVXNhZ2U6ICVzIFBST0dSQU0gW0FSR1NdIHwgLS12
ZXJzaW9uXG5cbiIsIGJuYW1lKTsKPiArICNlbHNlCj4gKy0JZnByaW50ZihmaWxlLCAiVXNhZ2U6
ICVzIFtPUFRJT05TXSBQUk9HUkFNIC0tIFtBUkdTXSB8IC0tdmVyc2lvblxuXG4iLCBiYXNlbmFt
ZShuYW1lKSk7Cj4gKysJZnByaW50ZihmaWxlLCAiVXNhZ2U6ICVzIFtPUFRJT05TXSBQUk9HUkFN
IC0tIFtBUkdTXSB8IC0tdmVyc2lvblxuXG4iLCBibmFtZSk7Cj4gKyAjZW5kaWYKPiArLQlmcHJp
bnRmKGZpbGUsICJFeGVjdXRlIGEgcHJvZ3JhbSB1bmRlciB0aGUgc3VwZXJ2aXNpb24gb2YgYSB2
YWxpZCBpbml0IHByb2Nlc3MgKCVzKVxuXG4iLCBiYXNlbmFtZShuYW1lKSk7Cj4gKysJZnByaW50
ZihmaWxlLCAiRXhlY3V0ZSBhIHByb2dyYW0gdW5kZXIgdGhlIHN1cGVydmlzaW9uIG9mIGEgdmFs
aWQgaW5pdCBwcm9jZXNzICglcylcblxuIiwgYm5hbWUpOwo+ICsgCj4gKyAJZnByaW50ZihmaWxl
LCAiQ29tbWFuZCBsaW5lIG9wdGlvbnM6XG5cbiIpOwo+ICsgCj4gK0BAIC0yNjEsNiArMjY3LDcg
QEAgdm9pZCBwcmludF91c2FnZShjaGFyKiBjb25zdCBuYW1lLCBGSUxFKiBjb25zdCBmaWxlKSB7
Cj4gKyAJZnByaW50ZihmaWxlLCAiICAlczogU2VuZCBzaWduYWxzIHRvIHRoZSBjaGlsZCdzIHBy
b2Nlc3MgZ3JvdXAuXG4iLCBLSUxMX1BST0NFU1NfR1JPVVBfR1JPVVBfRU5WX1ZBUik7Cj4gKyAK
PiArIAlmcHJpbnRmKGZpbGUsICJcbiIpOwo+ICsrCWZyZWUoZGlyYyk7Cj4gKyB9Cj4gKyAKPiAr
IHZvaWQgcHJpbnRfbGljZW5zZShGSUxFKiBjb25zdCBmaWxlKSB7CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
