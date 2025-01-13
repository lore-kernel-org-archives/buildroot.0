Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1E9E7719F
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 13:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC6E740471;
	Mon, 13 Jan 2025 13:18:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8GJrQvywLWF; Mon, 13 Jan 2025 13:18:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EFBE402E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EFBE402E9;
	Mon, 13 Jan 2025 13:18:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2540D940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FBE980CF2
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYr7sv3bUGgW for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 13:18:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA80F80CC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA80F80CC8
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA80F80CC8
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:18:06 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361f796586so44054145e9.3
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 05:18:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736774285; x=1737379085;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y7kQNq6hI1pQeq9M7402huWQbN6bc8Rx/yV+VFVQpGw=;
 b=Oqu/lP4PGDoVseMarMHn4Mhg+yRRFOeO89A8f3rBxHwtJIA2DIUN4bkQ71dKfL0ly2
 oMr4avwbQV3PGKIOwFdpD6gTiurUoyrG7lZdpbAKilb1did5ddeL2PU/HO8+CI6KqDws
 3U5q8YljBDc46GHwy3W+QQUQS5cv9RWkro9JHv0/C0v0I9A/X6HmsRghDISxDheRSNzF
 +jSwSUjtXKRNWF63Q5/PWiR1Rr15YNRDp9TLoZHEBDYmSrsQO9rpQA3GB0RuM4nc77y/
 xHJEQPIOO5YINPSoJPte6WGK4XDeZHtwGelSLT9axcHTEDVHv7+1AxvUw4Rre9j0zco/
 D1iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMzsUig4iEx/Fhf/kYPyU/9rXjJx9z/azqvgQhUMCIiIgPiQtJY3hR55Nmn9DVzzTCDZAnp+rwwME=@buildroot.org
X-Gm-Message-State: AOJu0YzXswiCQU02lnrah7IxrcHUjNtBvWf46kG8T/A+2jLuPBmV7eBj
 FxAlooTmBTjfQ6ObwetFRNocxF0+NdKSeXRLXb1gDZxZr9ILC+D8zAjsqbJBu1qGZ2nxPyt23Vf
 A
X-Gm-Gg: ASbGnctpt9bIRUajGfGVvN71NNIxtVh3SehX5RNziujUb+6kVv/jwrIXpbhIncbBysm
 85jvPRk6CHANV92mmRvGtwdWjZRj7M2GTQ0cazbPX15hn/5w0zPZvilGxYsw8EnBBoqjmODRdu/
 DhnUzJQajRb4B10jCOCdb8GM9+syzMOxWNbLCMYrsIoToG1O1gpJJqW8uyN5ACfk22A5eMb59Ey
 WPzh88zKliM9s8rVd17I1jwMBnXUrM9v7pMPqH63JeWdgDW7x+dx6ZzInVEPcoExh7kD2YDVOlo
 l1veE8u7xYsMAKcSPdfJUs/wKUIvgKbTKjgXnXIbt4YE+3Ws05AszizKh9w3yUt32VzezKxKwQ9
 /W6Kmx6HQWJzDpt0P
X-Google-Smtp-Source: AGHT+IH/EyuSqqsjLRGKFAdZ2k+s84k/amgdGCDETaZ5s0BcWOIWQbtGYZkyAbdnn+SpE564zcq76A==
X-Received: by 2002:a05:600c:a0a:b0:434:a04d:1670 with SMTP id
 5b1f17b1804b1-436e25548e3mr84512805e9.0.1736774284801; 
 Mon, 13 Jan 2025 05:18:04 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9dc8826sm142640855e9.11.2025.01.13.05.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 05:18:04 -0800 (PST)
Message-ID: <893b5d32-9a29-49c9-9907-56bc511c0d35@smile.fr>
Date: Mon, 13 Jan 2025 14:18:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: David Laight <david.laight.linux@gmail.com>,
 Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
References: <20250111162841.3456137-1-romain.naour@smile.fr>
 <20250111171843.35dff62f@pumpkin>
Content-Language: en-US
In-Reply-To: <20250111171843.35dff62f@pumpkin>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736774285; x=1737379085; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y7kQNq6hI1pQeq9M7402huWQbN6bc8Rx/yV+VFVQpGw=;
 b=NnopnFemfR4YcrgJQ1FFq2HNdG1ltInxYUanYlj30aHwhRtV4oIOWWZsjdXFQIA+uf
 +MwNqpfr8EbxJ80dHroho54O12ol2GX8pg2bC+H/cgzxfSqGm9PR1v7SS27Bkm85CvR+
 hgGztBfDowdoU7g8u9BDea3OU6SKG/wYxMSh8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=NnopnFem
Subject: Re: [Buildroot] [PATCH] support/dependencies/dependencies.sh:
 ensure wget2 is > 2.2.0 for metalink support with -O
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

SGVsbG8gRGF2aWQsIEFsbCwKCkxlIDExLzAxLzIwMjUgw6AgMTg6MTgsIERhdmlkIExhaWdodCBh
IMOpY3JpdMKgOgo+IE9uIFNhdCwgMTEgSmFuIDIwMjUgMTc6Mjg6NDEgKzAxMDAKPiBSb21haW4g
TmFvdXIgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+IAo+
PiBBcyByZXBvcnRlZCBieSBKdWxpZW4gT2xpdmFpbiwgaW4gc29tZSBjYXNlcyB0aGUgIndnZXQg
LU8gb3V0cHV0IC4uLiIKPj4gZG9lcyBub3QgZ2V0IGhvbm9yZWQgd2hlbiBHTlUgV2dldDIgaXMg
dXNlZCBhcyBkcm9wLWluIHJlcGxhY2VtZW50IGZvcgo+PiBHTlUgV2dldC4KPj4KPj4gRm9yIGV4
YW1wbGUsIHF0NiogcGFja2FnZXMgYXJjaGl2ZXMgYXJlIGZhaWxpbmcgKGR1ZSB0byBtdWx0aXBh
cnQKPj4gZG93bmxvYWRzOiBIVFRQIHJlc3BvbnNlIDIwNik6Cj4+Cj4+ICAgW0ZpbGVzOiAxICBC
eXRlczogNDYuMDBNIFszODguMzlLQi9zXSBSZWRpcmVjdHM6IDEgIFRvZG86IDAgIEVycm9yczog
MTg0Cj4+Cj4+ICAgc2hhMjU2c3VtOiBbLi4uXS9idWlsZC8ucXRiYXNlLWV2ZXJ5d2hlcmUtc3Jj
LTYuOC4xLnRhci54ei5iRlhremMvb3V0cHV0OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4+
ICAgRVJST1I6IHdoaWxlIGNoZWNraW5nIGhhc2hlcyBmcm9tIHBhY2thZ2UvcXQ2L3F0NmJhc2Uv
cXQ2YmFzZS5oYXNoCj4+ICAgRVJST1I6IHF0YmFzZS1ldmVyeXdoZXJlLXNyYy02LjguMS50YXIu
eHogaGFzIHdyb25nIHNoYTI1NiBoYXNoOgo+PiAgIEVSUk9SOiBleHBlY3RlZDogNDBiMTQ1NjJl
ZjNiZDc3OWJjMGUwNDE4ZWEyYWUwOGZhMjgyMzVmOGVhNmU4YzBjYjNiY2UxZDZhZDU4ZGNhZgo+
PiAgIEVSUk9SOiBnb3QgICAgIDoKPj4gICBFUlJPUjogSW5jb21wbGV0ZSBkb3dubG9hZCwgb3Ig
bWFuLWluLXRoZS1taWRkbGUgKE1JVE0pIGF0dGFjawo+Pgo+PiBGZWRvcmEgNDAgaXMgb25lIG9m
IHRoZSBmaXJzdCBMaW51eCBkaXN0cmlidXRpb24gcHJvdmlkaW5nIEdOVSBXZ2V0MiBhcwo+PiB3
Z2V0IFsxXS4gU29tZSBpbmNvbXBhdGliaWxpdHkgaXNzdWVzIHdpdGggV2dldDEueCBhcmUgZGlz
Y292ZXJlZCB3aXRoCj4+IGVhcmx5IFdnZXQyIHZlcnNpb25zLgo+Pgo+PiBUaGlzIGlzIHRoZSBj
YXNlIGhlcmUgd2l0aCBXZ2V0MiAyLjIuMCBhbmQgTWV0YWxpbmsgaGFuZGxpbmcgdGhhdAo+PiBp
Z25vcmUgLU8gb3B0aW9uIFsyXVszXS4KPj4KPj4gVGhlIGlzc3VlIHdhcyBub3Qgbm90aWNlZCB1
bnRpbCBub3cgc2luY2UgdGhlIGRvd25sb2FkIGluZnJhc3RydWN0dXJlCj4+IHVzZXMgYSBtaXJy
b3IgKHMuYi5vKSBhcyBmYWxsYmFjay4KPj4KPj4gU2luY2Ugd2dldCAtTyBpcyBwYXJ0IG9mIG91
ciBkb3dubG9hZCBpbmZyYXN0cnVjdHVyZSBzaW5jZSAyMDEyLjA1IFs0XSwKPj4gZW5zdXJlIHdn
ZXQyIGlzIGF0IGxlYXN0IDIuMi4xIG9yIGFueSBuZXdlciB2ZXJzaW9uIHRoYXQgY29udGFpbnMg
dGhlCj4+IC1PIGZpeCBbNV0uCj4+Cj4+IFsxXSBodHRwczovL2ZlZG9yYXByb2plY3Qub3JnL3dp
a2kvQ2hhbmdlcy9XZ2V0MmFzV2dldAo+PiBbMl0gaHR0cHM6Ly9naXRsYWIuY29tL2dudXdnZXQv
d2dldDIvLS9pc3N1ZXMvNjg1Cj4+IFszXSBodHRwczovL2dpdGxhYi5jb20vZ251d2dldC93Z2V0
Mi8tL2Jsb2IvMDY1MWIwYTQ0N2U0ZDZkZDNmMTAwODAwZDBkOTNkYjkwZjJiZDJmYi9kb2NzL3dn
ZXQyLm1kIy1vLS0tb3V0cHV0LWRvY3VtZW50ZmlsZQo+PiBbNF0gaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2NmMjQ4NmJmMzE3ZTRiYmY4OGM4MDFm
Yjk2MTgzYmE2MmJlNzhjYzgKPj4gWzVdIGh0dHBzOi8vZ2l0bGFiLmNvbS9nbnV3Z2V0L3dnZXQy
Ly0vY29tbWl0LzE1YzA2YzJmMmE1ZjVlYWE5NjI4OTNiZWVjOTdhNTIxMTc0M2VjMDUKPj4KPj4g
UmVwb3J0ZWQtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+PiAtLS0KPj4gIHN1cHBv
cnQvZGVwZW5kZW5jaWVzL2RlcGVuZGVuY2llcy5zaCB8IDE1ICsrKysrKysrKysrKysrKwo+PiAg
MSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL3N1cHBv
cnQvZGVwZW5kZW5jaWVzL2RlcGVuZGVuY2llcy5zaCBiL3N1cHBvcnQvZGVwZW5kZW5jaWVzL2Rl
cGVuZGVuY2llcy5zaAo+PiBpbmRleCBmYjBkZWZkMGM5Li5lNDk4MzFhM2ZkIDEwMDc1NQo+PiAt
LS0gYS9zdXBwb3J0L2RlcGVuZGVuY2llcy9kZXBlbmRlbmNpZXMuc2gKPj4gKysrIGIvc3VwcG9y
dC9kZXBlbmRlbmNpZXMvZGVwZW5kZW5jaWVzLnNoCj4+IEBAIC0xODQsNiArMTg0LDIxIEBAIGZv
ciBwcm9nIGluIHBlcmwgdGFyIHdnZXQgY3BpbyB1bnppcCByc3luYyBiYyBjbXAgZmluZCB4YXJn
cyAke0RMX1RPT0xTfSA7IGRvCj4+ICAJCQlleGl0IDEKPj4gIAkJZmkKPj4gIAlmaQo+PiArCj4+
ICsJaWYgdGVzdCAkcHJvZyA9ICJ3Z2V0IiA7IHRoZW4KPj4gKwkJV0dFVF9WRVJTSU9OPSIkKHdn
ZXQgLS12ZXJzaW9uIHwgaGVhZCAtbjEgfCBjdXQgLWQgJyAnIC1mMykiCj4+ICsJCVdHRVRfTUFK
T1I9IiQoZWNobyAiJHtXR0VUX1ZFUlNJT059IiB8IGN1dCAtZCAuIC1mIDEpIgo+PiArCQlXR0VU
X01JTk9SPSIkKGVjaG8gIiR7V0dFVF9WRVJTSU9OfSIgfCBjdXQgLWQgLiAtZiAyKSIKPj4gKwkJ
V0dFVF9QQVRDSD0iJChlY2hvICIke1dHRVRfVkVSU0lPTn0iIHwgY3V0IC1kIC4gLWYgMykiCj4g
Cj4gSG93IGFib3V0Ogo+IAkJSUZTPSIuJElGUyIKPiAJCXNldCAkKHdnZXQgLS12ZXJzaW9uKQo+
IAkJV0dFVF9NQUpPUj0kMwo+IAkJV0dFVF9NSU5PUj0kNAo+IAkJV0dFVF9QQVRDSD0kNQo+IAkJ
SUZTPSIke0lGUyMufSIKPiAKPiBTYXZlcyBhbGwgdGhvc2UgZm9yaytleGVjLgoKVGhpcyBzY3Jp
cHQgbWF5IGFsc28gcmVxdWlyZXMgc29tZSByZXdvcmsgdG8gYXZvaWQgc3VjaCBmb3JrK2V4ZWMu
Ckkgd2FudGVkIHRvIGtlZXAgc2ltaWxhciAic3R5bGUiLgoKPiAKPj4gKwo+PiArCQkjIFdnZXQy
IDw9IDIuMi4wIGlzc3VlIHdpdGggLU8gOiBodHRwczovL2dpdGxhYi5jb20vZ251d2dldC93Z2V0
Mi8tL2lzc3Vlcy82ODUKPj4gKwkJaWYgWyAiJHtXR0VUX01BSk9SfSIgLWVxIDIgXSAmJiBcCj4+
ICsJCQkhIFsgIiR7V0dFVF9NQUpPUn0iIC1lcSAyIC1hICIke1dHRVRfTUlOT1J9IiAtZ2UgMiAt
YSAiJHtXR0VUX1BBVENIfSIgLWd0IDAgXSA7IHRoZW4KPiAKPiBEb2Vzbid0IHRoYXQgYWxzbyBm
YWlsIGZvciAyLjMuMCA/Cj4gSSB0aGluayB0aGlzIGlzIG9rOgo+IAkJaWYgWyAkV0dFVF9NQUpP
UiA9IDIgJiYgJFdHRVRfTUlOT1IkV0dFVF9QQVRDSCAtbGUgMjAgXSA7IHRoZW4KPiBhbnkgdHdv
IGRpZ2l0IG1pbm9yL3BhdGNoIHdpbGwgZmFpbCB0aGUgdGVzdC4KPiAoQW5kIHRoZXJlIGNhbid0
IGJlIGFuIHNlcGFyYXRvcnMgLSBzbyBxdW90ZXMgYXJlbid0IG5lZWRlZC4pCgpUaGFua3MgZm9y
IHNwb3R0aW5nIHRoaXMgbWlzdGFrZSEKCkkgd2FzIHdvbmRlcmluZyBpZiBpdCdzIGFsbG93ZWQg
Ynkgc2hlbGxjaGVjayBidXQgSSBub3RpY2VkIHRoaXMgc2NyaXB0IChhbW9uZwpvdGhlcnMpIGlz
IG5vdCBjaGVja2VkIGJ5IHNoZWxsY2hlY2suCgouY2hlY2twYWNrYWdlaWdub3JlOgpzdXBwb3J0
L2RlcGVuZGVuY2llcy9kZXBlbmRlbmNpZXMuc2ggU2hlbGxjaGVjawoKQXQgbGVhc3QgaXQgd291
bGQgcmVxdWlyZXMgYSAic2hlbGxjaGVjayBkaXNhYmxlPVNDMjA4NiIuCgpUaG91Z2h0cz8KCkJl
c3QgcmVnYXJkcywKUm9tYWluCgo+IAo+IAlEYXZpZAo+IAo+IAo+PiArCQkJZWNobwo+PiArCQkJ
ZWNobyAiWW91IGhhdmUgR05VIFdnZXQyICcke1dHRVRfVkVSU0lPTn0nIGluc3RhbGxlZC4gR05V
IFdnZXQyID4gMi4yLjAgaXMgaXMgcmVxdWlyZWQiCj4+ICsJCQlleGl0IDE7Cj4+ICsJCWZpCj4+
ICsJZmkKPj4gIGRvbmUKPj4gIAo+PiAgaWYgdGVzdCAiJHttaXNzaW5nX3Byb2dzfSIgPSAieWVz
IiA7IHRoZW4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
