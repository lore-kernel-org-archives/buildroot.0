Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C42C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 21:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47C8C402B1;
	Mon,  1 Jul 2024 21:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H2j5HCKyNXcC; Mon,  1 Jul 2024 21:35:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9293C400F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9293C400F5;
	Mon,  1 Jul 2024 21:35:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F13511BF329
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 21:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD59781762
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 21:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NyBuPrVvEdmx for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 21:35:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64F4381517
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64F4381517
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64F4381517
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 21:35:28 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3626c29d3f0so1748085f8f.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 14:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719869727; x=1720474527;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zF7524k5RHtbaJmZCt7Cdk8vo80a4E/g9UaXR32jhH4=;
 b=VtiCl8meAcWru5+bSzvmC+mTk9ru7CfLjmK2stZ5V2a2ZPUszJlW2hZSG5xeUa0kb/
 vFPnX/VvgYeFvJy2TWYFvsuT0oynqJbIx0kSeperij/RrSEjp6aG2wOX+KlAJGabbKIt
 HEBKc/ki7J/WX+Qclr6IoDIBPwtUtkTwF+sOaq5TpV78iJ+ImcMcqiz8uYeVt+Ti7F1N
 QneogCMXCppDYHp+MO3CQXlrRwhTK3iRmXpWfZubpvoA+Uu9MWcJJUuErMGU8et1RB0A
 ZhHLInrIy3rDKmPPk62PjDTN4W605wAScXcNoyFwOOpKskpdHFi1yMhZIPOHhuI3Hd8b
 f80w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrGgUYTCOQzbwzqwewLs5LK8/GXHA/TVByZLkghZtwNfpEOM1ystYbY+ELmrtHtnTXFsbq+xYx0HOVSQSyRkrr8d4k4/IAxA==
X-Gm-Message-State: AOJu0Yxy7dxsd1E/EfxQhBnGRTCpUyqjtTpW9m2tjuBsYAA6TqDDryg7
 4E8ETmWAK3hEGZNE1wU/CKixvBaOMT0jMHnuQXR5IyYA1pndfwU3YHHRxMNiiww=
X-Google-Smtp-Source: AGHT+IFkaeWGDO9/mWJz+WJxOY8ESzaIL0CO4F0DW3treGIFR4TvlhHyBapOJYGy4MXx9ghAaaSDvw==
X-Received: by 2002:a5d:4b91:0:b0:367:3d3a:29d with SMTP id
 ffacd0b85a97d-367756a3af2mr5010784f8f.2.1719869726624; 
 Mon, 01 Jul 2024 14:35:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a1046f2sm11047974f8f.112.2024.07.01.14.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 14:35:25 -0700 (PDT)
Message-ID: <0fda533c-e808-47cc-97ee-5d1b66046f93@mind.be>
Date: Mon, 1 Jul 2024 23:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20240629125521.976475-1-fiona.klute@gmx.de>
 <e710e75e-ddca-4d8f-8b62-2cbb2bdb78ed@mind.be>
 <63d7b817-713a-40ad-b6b7-40f5b9830d97@gmx.de>
Content-Language: en-GB
In-Reply-To: <63d7b817-713a-40ad-b6b7-40f5b9830d97@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719869727; x=1720474527; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zF7524k5RHtbaJmZCt7Cdk8vo80a4E/g9UaXR32jhH4=;
 b=JlO2maVlHJMxpQMxuz5/K+0PTQTysCrJZaw4jOYGHYMGZNpOnM2P733hvPramO0pMF
 dG9ZGjF4XVF26xKjjFDTx9pSmiAMKWAlxhXuJuEK2VvNzRZ+5AduI+ddLTNSrHjNqfTI
 tjTz1gjZ2ae33wWtdKu4q9b8xetpKb3Jp/c5L1dGnmRhdERl5nLHuFuu1OXlqrr10H3W
 vp2CMz+ly+9dyUNdTIas9qdTNSXY5e5yiOXBC44aJHLdqnYqaxfvL+WJZNr23jIu5Kek
 4AyYrnVtltSAaTjFXBRGYqXGhtxaRZSaytu6nQ8Kp1w40a7nxumQkTDN/WZVyfpYoG7v
 DQ5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JlO2maVl
Subject: Re: [Buildroot] [PATCH 1/1] package/python-docker: bump version to
 7.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMS8wNy8yMDI0IDIwOjA3LCBGaW9uYSBLbHV0ZSB3cm90ZToKPiBBbSAzMC4wNi4yNCB1
bSAxNjo1MiBzY2hyaWViIEFybm91dCBWYW5kZWNhcHBlbGxlOgo+Pgo+Pgo+PiBPbiAyOS8wNi8y
MDI0IDE0OjU1LCBGaW9uYSBLbHV0ZSB2aWEgYnVpbGRyb290IHdyb3RlOgo+Pj4gSW1wb3J0YW50
IHVwc3RyZWFtIGNoYW5nZXM6Cj4+Pgo+Pj4gKiBTdXBwb3J0IGZvciBQeXRob24gMy4xMiBoYXMg
YmVlbiBhZGRlZCAoaW4gNy4wLjApLgo+Pj4KPj4+ICogV2Vic29ja2V0IHN1cHBvcnQgaXMgbm8g
bG9uZ2VyIGluY2x1ZGVkIGJ5IGRlZmF1bHQsIGFuZCB0aHVzIHRoZQo+Pj4gwqDCoCBkZXBlbmRl
bmN5IG9uICJ3ZWJzb2NrZXQtY2xpZW50IiAoc2luY2UgNy4wLjApLgo+Pj4KPj4+ICogQnVpbGQg
aGFzIGJlZW4gc3dpdGNoZWQgdG8gaGF0Y2hsaW5nIGFuZCBoYXRjaC12Y3MgKGluIDcuMS4wKSwg
c28KPj4+IMKgwqAgQnVpbGRyb290IG5lZWRzIHRvIHVzZSBwZXA1MTcgYnVpbGQuCj4+Pgo+Pj4g
KiBEZXBlbmRlbmN5IG9uICJwYWNrYWdpbmciIGhhcyBiZWVuIHJlbW92ZWQgKGluIDcuMS4wKS4K
Pj4+Cj4+PiBVcHN0cmVhbSBjaGFuZ2Vsb2dzOgo+Pj4gaHR0cHM6Ly9naXRodWIuY29tL2RvY2tl
ci9kb2NrZXItcHkvcmVsZWFzZXMvdGFnLzcuMC4wCj4+PiBodHRwczovL2dpdGh1Yi5jb20vZG9j
a2VyL2RvY2tlci1weS9yZWxlYXNlcy90YWcvNy4xLjAKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBG
aW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGUrd2l3YUBnbXguZGU+Cj4+Cj4+IMKgwqBBcHBsaWVkIHRv
IG1hc3RlciwgdGhhbmtzLiBTb21ld2hlcmUgYWxvbmcgdGhlIG1haWwgcGF0aCwgdGhlICt3aXdh
Cj4+IHBhcnQgZ290IHN0cmlwcGVkIGZyb20gdGhlIEF1dGhvciB0YWcsIHNvIEkgZml4ZWQgdGhh
dC4KPiAKPiBUaGFua3MgZm9yIG1lcmdpbmchIFRoZSBkaWZmZXJlbmNlIHdhcyBhY3R1YWxseSBp
bnRlbnRpb25hbDogTXkgbWFpbAo+IHByb3ZpZGVyIHVuZm9ydHVuYXRlbHkgZG9lc24ndCBkZWxp
dmVyIG1haWxzIHdpdGggc3ViYWRkcmVzc2luZywgc28gSQo+IHVzZWQgYW4gYXV0aG9yIGFkZHJl
c3Mgd2hlcmUgcGVvcGxlIGNhbiBhY3R1YWxseSByZWFjaCBtZSwgYW5kIGFkZGVkIHRoZQo+IHN1
YmFkZHJlc3Mgc3BvbnNvciBhY2tub3dsZWRnbWVudCAoYXMgc3VnZ2VzdGVkIGluIHRoZSBtYW51
YWwpIG9ubHkgdG8KPiB0aGUgcy1vLWIgbGluZS4KCiAgT2gsIGRhcm4sIHNvIHRoYXQgbWVhbnMg
dGhhdCB0aGUgYXV0aG9yIGluZm9ybWF0aW9uIHRoYXQgZ290IGNvbW1pdHRlZCBpcyAKd3Jvbmcg
bm93Li4uIFNvcnJ5ISBJJ2xsIHRyeSB0byBkbyBiZXR0ZXIgaW4gdGhlIGZ1dHVyZSB3aGVuIG1l
cmdpbmcgeW91ciBwYXRjaGVzLgoKICBJZiB0aGUgZ29hbCB3YXMgc3BvbnNvciBhY2tub3dsZWRn
ZW1lbnQsIHlvdSBjb3VsZCBoYXZlIGRvbmUgaXQgbGlrZSB0aGlzOgoKICAgIEZpb25hIEtsdXRl
IChXaXdhKSA8ZmlvbmEua2x1dGVAZ214LmRlPgoKCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gQmVz
dCByZWdhcmRzLAo+IEZpb25hCj4gCj4+IMKgwqBSZWdhcmRzLAo+PiDCoMKgQXJub3V0Cj4+Cj4+
PiAtLS0KPj4+IEkndmUgZ29uZSBhbG9uZyB3aXRoIHVwc3RyZWFtIGhlcmUgb24gcmVtb3Zpbmcg
dGhlIHdlYnNvY2tldAo+Pj4gc3VwcG9ydC4gSWYgaXQncyBkZXNpcmFibGUgdG8ga2VlcCBpbiBC
dWlsZHJvb3QgcGxlYXNlIGxldCBtZSBrbm93IGhvdwo+Pj4gdG8gZW5hYmxlIGFuIG9wdGlvbmFs
IFB5dGhvbiBwYWNrYWdlIGZlYXR1cmUgaW4gdGhlIGJ1aWxkIHN5c3RlbSBhbmQKPj4+IEknbGwg
dXBkYXRlIHRoZSBwYXRjaC4KPj4+Cj4+PiDCoCBwYWNrYWdlL3B5dGhvbi1kb2NrZXIvQ29uZmln
LmluwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiAtLQo+Pj4gwqAgcGFja2FnZS9weXRob24tZG9ja2Vy
L3B5dGhvbi1kb2NrZXIuaGFzaCB8IDQgKystLQo+Pj4gwqAgcGFja2FnZS9weXRob24tZG9ja2Vy
L3B5dGhvbi1kb2NrZXIubWvCoMKgIHwgOCArKysrLS0tLQo+Pj4gwqAgMyBmaWxlcyBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvcHl0aG9uLWRvY2tlci9Db25maWcuaW4KPj4+IGIvcGFja2FnZS9weXRob24tZG9ja2Vy
L0NvbmZpZy5pbgo+Pj4gaW5kZXggOTQ0OTkyZjI1MS4uNjY5YjllMzQzMyAxMDA2NDQKPj4+IC0t
LSBhL3BhY2thZ2UvcHl0aG9uLWRvY2tlci9Db25maWcuaW4KPj4+ICsrKyBiL3BhY2thZ2UvcHl0
aG9uLWRvY2tlci9Db25maWcuaW4KPj4+IEBAIC0yLDEwICsyLDggQEAgY29uZmlnIEJSMl9QQUNL
QUdFX1BZVEhPTl9ET0NLRVIKPj4+IMKgwqDCoMKgwqAgYm9vbCAicHl0aG9uLWRvY2tlciIKPj4+
IMKgwqDCoMKgwqAgIyBkb2NrZXItZW5naW5lIG1heSBiZSBydW5uaW5nIG9uIGFub3RoZXIgaG9z
dCwgc28gbm8gb3RoZXIKPj4+IGRlcGVuZGVuY3kKPj4+IMKgwqDCoMKgwqAgc2VsZWN0IEJSMl9Q
QUNLQUdFX1BZVEhPTjNfU1NMICMgcnVudGltZQo+Pj4gLcKgwqDCoCBzZWxlY3QgQlIyX1BBQ0tB
R0VfUFlUSE9OX1BBQ0tBR0lORyAjIHJ1bnRpbWUKPj4+IMKgwqDCoMKgwqAgc2VsZWN0IEJSMl9Q
QUNLQUdFX1BZVEhPTl9SRVFVRVNUUyAjIHJ1bnRpbWUKPj4+IMKgwqDCoMKgwqAgc2VsZWN0IEJS
Ml9QQUNLQUdFX1BZVEhPTl9VUkxMSUIzICMgcnVudGltZQo+Pj4gLcKgwqDCoCBzZWxlY3QgQlIy
X1BBQ0tBR0VfUFlUSE9OX1dFQlNPQ0tFVF9DTElFTlQgIyBydW50aW1lCj4+PiDCoMKgwqDCoMKg
IGhlbHAKPj4+IMKgwqDCoMKgwqDCoMKgIEEgUHl0aG9uIGxpYnJhcnkgZm9yIHRoZSBEb2NrZXIg
RW5naW5lIEFQSS4KPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZG9ja2VyL3B5
dGhvbi1kb2NrZXIuaGFzaAo+Pj4gYi9wYWNrYWdlL3B5dGhvbi1kb2NrZXIvcHl0aG9uLWRvY2tl
ci5oYXNoCj4+PiBpbmRleCA4ZTU2MWU5M2E3Li5jOGY4ZTc1MDFhIDEwMDY0NAo+Pj4gLS0tIGEv
cGFja2FnZS9weXRob24tZG9ja2VyL3B5dGhvbi1kb2NrZXIuaGFzaAo+Pj4gKysrIGIvcGFja2Fn
ZS9weXRob24tZG9ja2VyL3B5dGhvbi1kb2NrZXIuaGFzaAo+Pj4gQEAgLTEsNSArMSw1IEBACj4+
PiDCoCAjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL2RvY2tlci9qc29u
Cj4+PiAtbWQ1wqAgYzMxOWU3NTA1NGEyMjY3NzZmMzI3OTdlNTZlYzgyZGHCoCBkb2NrZXItNi4x
LjMudGFyLmd6Cj4+PiAtc2hhMjU2Cj4+PiBhYTZkMTc4MzAwNDViYTVlZjAxNjhkNWVhYTM0ZDM3
YmVlYjExMzk0OGM0MTNhZmZlMWQ1OTkxZmMxMWY5YTIwCj4+PiBkb2NrZXItNi4xLjMudGFyLmd6
Cj4+PiArbWQ1wqAgMDRlOTJhN2I2ZGM4Yjg4ZGRlM2M3Y2NhNjg1MGIyNzfCoCBkb2NrZXItNy4x
LjAudGFyLmd6Cj4+PiArc2hhMjU2Cj4+PiBhZDhjNzBlNmUzZjg5MjZjYjhhOTI2MTliODMyYjRl
YTUyOTllMjgzMWMxNDI4NDY2MzE4NGUyMDA1NDZmYTZjCj4+PiBkb2NrZXItNy4xLjAudGFyLmd6
Cj4+PiDCoCAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwo+Pj4gwqAgc2hhMjU2
Cj4+PiBmMmYwYjA3ZmE1ZTQ5MmMxMWQyN2FhMGQyZjNmMWEwZTY0YjlkMTdmMzJkOGFhNDg5YWUy
YWY5NjA5YWYzM2IywqAgTElDRU5TRQo+Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWRv
Y2tlci9weXRob24tZG9ja2VyLm1rCj4+PiBiL3BhY2thZ2UvcHl0aG9uLWRvY2tlci9weXRob24t
ZG9ja2VyLm1rCj4+PiBpbmRleCBhYjAzYWM2YWYwLi41NWJhNDA1ZjdjIDEwMDY0NAo+Pj4gLS0t
IGEvcGFja2FnZS9weXRob24tZG9ja2VyL3B5dGhvbi1kb2NrZXIubWsKPj4+ICsrKyBiL3BhY2th
Z2UvcHl0aG9uLWRvY2tlci9weXRob24tZG9ja2VyLm1rCj4+PiBAQCAtNCwxNCArNCwxNCBAQAo+
Pj4gwqAgIwo+Pj4KPj4+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+Pgo+Pj4gLVBZVEhPTl9E
T0NLRVJfVkVSU0lPTiA9IDYuMS4zCj4+PiArUFlUSE9OX0RPQ0tFUl9WRVJTSU9OID0gNy4xLjAK
Pj4+IMKgIFBZVEhPTl9ET0NLRVJfU09VUkNFID0gZG9ja2VyLSQoUFlUSE9OX0RPQ0tFUl9WRVJT
SU9OKS50YXIuZ3oKPj4+IC1QWVRIT05fRE9DS0VSX1NJVEUgPQo+Pj4gaHR0cHM6Ly9maWxlcy5w
eXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2YwLzczL2Y3YzlhMTRlODhlNzY5ZjM4Y2I3ZmI0NWFh
ODhkZmQ3OTVmYWE4ZTE4YWVhMTFiYWJhYmY2ZTA2OGQ1ZQo+Pj4gLVBZVEhPTl9ET0NLRVJfU0VU
VVBfVFlQRSA9IHNldHVwdG9vbHMKPj4+ICtQWVRIT05fRE9DS0VSX1NJVEUgPQo+Pj4gaHR0cHM6
Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzkxLzliLzRhMmVhMjlhZWJhNjI0NzEy
MTE1OThkYWM1ZDk2ODI1YmI0OTM0OGZhMDdlOTA2ZWE5MzAzOTRhODNjZQo+Pj4gK1BZVEhPTl9E
T0NLRVJfU0VUVVBfVFlQRSA9IHBlcDUxNwo+Pj4gwqAgUFlUSE9OX0RPQ0tFUl9MSUNFTlNFID0g
QXBhY2hlLTIuMAo+Pj4gwqAgUFlUSE9OX0RPQ0tFUl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+
Pj4gwqAgUFlUSE9OX0RPQ0tFUl9DUEVfSURfVkVORE9SID0gZG9ja2VyCj4+PiDCoCBQWVRIT05f
RE9DS0VSX0NQRV9JRF9QUk9EVUNUID0gZG9ja2VyLXB5Cj4+PiAtUFlUSE9OX0RPQ0tFUl9ERVBF
TkRFTkNJRVMgPSBob3N0LXB5dGhvbi1zZXR1cHRvb2xzLXNjbQo+Pj4gK1BZVEhPTl9ET0NLRVJf
REVQRU5ERU5DSUVTID0gaG9zdC1weXRob24taGF0Y2hsaW5nIGhvc3QtcHl0aG9uLWhhdGNoLXZj
cwo+Pj4KPj4+IMKgICQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKPj4+IC0tIAo+Pj4gMi40NS4y
Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
PiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
