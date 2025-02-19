Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831D2C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 22:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4137360B0F;
	Wed, 19 Feb 2025 22:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80p6_D73v29Y; Wed, 19 Feb 2025 22:28:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 359E9610D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 359E9610D0;
	Wed, 19 Feb 2025 22:28:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF54BE0C
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 22:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF81A610D0
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 22:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gUSzCRb0BB_R for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 22:28:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F3AB760B0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3AB760B0F
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F3AB760B0F
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 22:28:44 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4399d14334aso2404815e9.0
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 14:28:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740004123; x=1740608923;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sD4oiN3i30UBFch22JBHTYEKeOj+2A6XCzq070L+SnA=;
 b=Z4rHecU9Wb/8jRq2N2+Hq+EBaxqWlvlYMLg+aGhBoONHcmRK/qvoR92U4bf/o+h12Q
 05AU58lPpgOhNcgG3tPmNJYRgiTJJQC3TMZkwIkm3+n3w3DJ26DakasulL9pHMo6B3HZ
 CGRAGb+euqwP3LLXP1qFeiwPJRt9OWB93/gJtMJG9tL6Ehz2y34x4IiC8hmyCSRICpQx
 POUiz8dpN8FDJg9APzajTXqaEWYj2wEhnfaxQdJJzQ4NQPfee3yOB2GZfuhtt9NjjIdD
 vmda2n78GA70nEHMX3bsc/+/VlRRWWrkKorfgfnie5x131dTSxYu8Kmndkl6t1hMFdNH
 LSMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwE24IRM/zCZgXATivYDyfoFL9MHQh2oYV2aaFhqnyC40xSv2IG4vEEYHD2xIX4qvDKOvo9xbwovY=@buildroot.org
X-Gm-Message-State: AOJu0YyBLrRzEiXIRP3nGQc7yLTMeqZ4dG3txENnkbTmp16XlyvnOBE9
 JEdYijiCjObNUI2S/iMI+Km9nUJ+HIeM5//nMgJUgbxVslPi2FCWDN8fP8HRP3Q=
X-Gm-Gg: ASbGnctgRyhubBk6xAjRv3uMAkAUXeseUHXk90/9LBvu+CnBc9790VOgjjFuhGDyxTI
 YnrDGUeCFpl8zicGvbywfnjzrhuvt6uPqkdyLexHaUyPmRHUWq0zUM2d8wj0bZaU76pi9MZCq4p
 f+66HgU8/uRv3hTep/teutCoFCggNj+nlACwUc6xO+I5Lwvl2BzumC78D2iT9dzzOKytiW0Ind/
 FU4hNfzqUfsznyKXMtZnKnhO4mQHEy00SPgWoWQ4HGLZzXR5M9VZvM6/zpFHe0AT8B2yOQib7B1
 w+sJA48cHTmMNR1gSmGtiV+1t574Qy577hrQ1pnQoWXPqE43jS221wZQFSMNJp2fSDS6+ntfvCB
 xW9ZMoHBXHBm9zNvuvrkdlhE3YSdNuaJn007avcFRtF+ZLh1hpRc=
X-Google-Smtp-Source: AGHT+IHXcxpT1+hQ+9MLGx91K+Zhz05UbACAREyZYRhsT2GvVyUN8u/inA3HoP2R8EtMuu8sKxILTg==
X-Received: by 2002:a5d:4002:0:b0:38f:31fe:6d4f with SMTP id
 ffacd0b85a97d-38f587ca5dfmr3793041f8f.34.1740004122877; 
 Wed, 19 Feb 2025 14:28:42 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ccef7sm19306562f8f.31.2025.02.19.14.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 14:28:42 -0800 (PST)
Message-ID: <68f26f4a-3e60-482a-80d8-7ee486e28da9@smile.fr>
Date: Wed, 19 Feb 2025 23:28:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Petr Vorel <petr.vorel@gmail.com>, Julien Olivain <ju.o@free.fr>
References: <cover.1740003029.git.yann.morin.1998@free.fr>
 <174b93ddde3f154a0056d0edc5ca2230da0072a7.1740003029.git.yann.morin.1998@free.fr>
Content-Language: fr, en-US
In-Reply-To: <174b93ddde3f154a0056d0edc5ca2230da0072a7.1740003029.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1740004123; x=1740608923; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sD4oiN3i30UBFch22JBHTYEKeOj+2A6XCzq070L+SnA=;
 b=U8RPWDX57lCN4uxOiAG9sdRu4HRXxpF3m4qDHUIXCLkty/YUCrs+Jy0EAcMCem3vbO
 Nw96BKCB0Et47XNei/OQEPWhOCdh5v5+wG3R2Op0iOF74i1r2TuoBRKg8DMLzEPgz9o3
 /KiLXHlTBMmsyRFK+61Ad1YcX3LV+PHhkSc1w=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=U8RPWDX5
Subject: Re: [Buildroot] [PATCH 4/4] Revert "package/sqlite: bump version to
 3.49.0"
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

SGVsbG8gWWFubiwKCkxlIDE5LzAyLzIwMjUgw6AgMjM6MTAsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiBzcWxpdGUgMy40OS4wIGhhcyBjaGFuZ2VkIGl0cyBidWlsZHN5c3RlbSwgY2F1c2lu
ZyBhIGxvdCBvZiBicmVha2FnZQo+IGFsb25nIHRoZSBsaW5lcy4KPiAKPiBBbHRob3VnaCBhIGZl
dyBmaXhlcyBoYXZlIGFscmVhZHkgYmVlbiBhcHBsaWVkIChhbmQgcmV2ZXJ0ZWQgaW4gdGhlCj4g
cHJldmlvdXMgY29tbWl0cyksIHRoZXJlIGFyZSByZW1haW5pbmcgcGFpbi1wb2ludHMgdGhhdCBh
cmUgbm90IHRyaXZpYWwKPiB0byBmaXggaW4gYSB0aW1lbHkgbWFubmVyIDoKPiAKPiAgIC0gdGhl
IGJ1aWxkc3lzdGVtIGZvcmNlcyBhbiBycGF0aCB0byAvdXNyL2xpYiwgYW5kIGl0IGlzIG5vdCBv
YnZpb3VzCj4gICAgIGhvdyB0byBwcmV2ZW50IHRoYXQgKGV4Y2VweXQgd2l0aCBwYXRjaGluZyks
Cj4gCj4gICAtIHRoZXJlIGlzIGFuIG9wdGlvbmFsIGRlcGVuZGVuY3kgdG8gemxpYiB0aGF0IGlz
IG5vdCBhY2NvdW50ZWQgZm9yLAo+ICAgICBuZWl0aGVyIGluIHRoZSB0YXJnZXQgbm9yIGluIHRo
ZSBob3N0IHZhcmlhbnRzOyB0aGlzIGNhdXNlcyBpc3N1ZXMKPiAgICAgd2hlbiB0aGUgYnVpbGQg
aG9zdCBoYXMgbGliei1kZXZlbCAob3Igc2ltaWxhcikgYWxyZWFkeSBpbnN0YWxsZWQsCj4gICAg
IGluIHdoaWN4aCBjYXNlIHNxbGl0ZSBkZXRldHMgaXQgYW5kIGxpbmtzIHdpdGggaXQ7IGFzIGl0
IGlzIG1pc3NpbmcKPiAgICAgYW4gcnBhdGggdG8gJChIT1NUX0RJUikvbGliLCB0aGlzIGNhdXNl
c3cgYSBidWlsZCBmYWlsdXJlIHdoZW4KPiAgICAgYW5vdGhlciBwYWNrYWdlIHB1bGxzIGluIHps
aWIuIFNlZToKPiAgICAgaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzFh
ODFjYjdjODhhNDFhMDM3NjdhMWEyMDFlZTA2Mjg0NjhmNjA3NjYvYnVpbGQtZW5kLmxvZwo+ICAg
ICBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvMjAyNTAyMTkxOTUxMTIuR0EyNjMx
NTI4QHBldmlrL1QvI21iN2M3YWM2MzkwMmVkNTU2MjNhNWFkZjVkMWRiNGEzZjYwZGI5ZmVmCj4g
Cj4gRml4aW5nIHRoZSBzZWNvbmQgaXNzdWUgd291bGQgc2VlbSBlYXN5IGVub3VnaCwgYnV0IHps
aWIgY291bGQgZGVwZW5kIG9uCj4gY2NhY2hlICh3aGVuIHRoYXQgaXMgZW5hYmxlZCksIGFuZCBj
Y3FjaGUgZGVwZW5kcyBvbiBzcWxpdGUsIHNvIHRoYXQKPiB3b3VsZCBiZSBhIGNpcmN1bGFyIGRl
cGVuZGVuY3kuIEFuZCB0aGVyZSBpcyBubyBvcHRpb24gaW4gc3FsaXRlJ3MKPiBjb25maWd1cmUg
c2NyaXB0IHRvIGZvcmNlZnVsbHkgZGlzYWJsZSB1c2Ugb2YgemxpYi4uLgo+IAo+IEEgcmV2ZXJ0
IGlzIHRoZSBxdWlja2VzdCBzb2x1dGlvbiB0byB1bmJyZWFrIGZvciB0aGUgdGltZSBiZWluZywg
YXMgdGhlCj4gbmV4dCByZWxlYXNlIGlzIG5lYXJpbmcgZHVlIGRhdGUuIEFub3RoZXIgYnVtcCBj
YW4gYmUgYXR0ZW1wdGVkIGxhdGVyLAo+IHRoYXQgYWRkcmVzc2VzIGFsbCB0aGUgcmVtYWluaW5n
IGlzc3Vlcy4KPiAKPiBUaGlzIHJldmVydHMgY29tbWl0IGRiODU2MzhjZWEzNDE0Y2EwMjkzY2Ji
YjIzNTJlNWIwYjYzYTI1NzkuCj4gCj4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFu
bi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4gQ2M6IFNjb3R0IEZhbiA8ZmFuY3AyMDA3QGdtYWlsLmNv
bT4KPiBDYzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+IENjOiBQZXRy
IFZvcmVsIDxwZXRyLnZvcmVsQGdtYWlsLmNvbT4KCkknbSBhZ3JlZSB3aXRoIHRoZSByZXZlcnQg
cHJvcG9zYWwuIFdlIGFyZSBjbG9zZSB0byAtcmMxIGFuZCB3ZSBzdGlsbCBmaW5kCmlzc3VlcyBm
b2xsb3dpbmcgdGhlIGxhc3QgdmVyc2lvbiBidW1wLgoKQWNrZWQtYnk6IFJvbWFpbiBOYW91ciA8
cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKSSdsbCB3YWl0IGZvciBKdWxpZW4ncyBmZWVkYmFjay4K
CkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAtLS0KPiAgcGFja2FnZS9zcWxpdGUvc3FsaXRlLmhh
c2ggfCAyICstCj4gIHBhY2thZ2Uvc3FsaXRlL3NxbGl0ZS5tayAgIHwgNCArKy0tCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3NxbGl0ZS9zcWxpdGUuaGFzaCBiL3BhY2thZ2Uvc3FsaXRlL3NxbGl0ZS5o
YXNoCj4gaW5kZXggZGRlYzI2MzdiOC4uNWI5MzNmYmE4ZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L3NxbGl0ZS9zcWxpdGUuaGFzaAo+ICsrKyBiL3BhY2thZ2Uvc3FsaXRlL3NxbGl0ZS5oYXNoCj4g
QEAgLTEsMyArMSwzIEBACj4gICMgTG9jYWxseSBjb21wdXRlZAo+IC1zaGEyNTYgIDRkOGJmYTBi
NTVlMzY5NTFmNmU1YTlmYjhjOTlmM2I1ODk5MGFiNzg1YzU3YjRmODRmMzdkMTYzYTA2NzI3NTkg
IHNxbGl0ZS1hdXRvY29uZi0zNDkwMDAwLnRhci5nego+ICtzaGEyNTYgIGFjOTkyZjdmY2EzOTg5
ZGU3ZWQxZmU5OWMxNjM2M2Y4NDg3OTRjOGMzMmExNThkYWZkNGViOTI3YTJlMDJmZDUgIHNxbGl0
ZS1hdXRvY29uZi0zNDgwMDAwLnRhci5nego+ICBzaGEyNTYgIDY2ZTA1NmI2ZTg2ODdmMzJhZjMw
ZDUxODc2MTFiOThiMTJhOGY0NmYwN2FhZjYyZjQzNTg1ZjI3NmU4ZjBhYzkgIHRlYS9saWNlbnNl
LnRlcm1zCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3FsaXRlL3NxbGl0ZS5tayBiL3BhY2thZ2Uv
c3FsaXRlL3NxbGl0ZS5tawo+IGluZGV4IGEyM2Y2ZTFkNjYuLmM4ZjEyYTQyN2EgMTAwNjQ0Cj4g
LS0tIGEvcGFja2FnZS9zcWxpdGUvc3FsaXRlLm1rCj4gKysrIGIvcGFja2FnZS9zcWxpdGUvc3Fs
aXRlLm1rCj4gQEAgLTQsOCArNCw4IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
PiAgCj4gLVNRTElURV9WRVJTSU9OID0gMy40OS4wCj4gLVNRTElURV9UQVJfVkVSU0lPTiA9IDM0
OTAwMDAKPiArU1FMSVRFX1ZFUlNJT04gPSAzLjQ4LjAKPiArU1FMSVRFX1RBUl9WRVJTSU9OID0g
MzQ4MDAwMAo+ICBTUUxJVEVfU09VUkNFID0gc3FsaXRlLWF1dG9jb25mLSQoU1FMSVRFX1RBUl9W
RVJTSU9OKS50YXIuZ3oKPiAgU1FMSVRFX1NJVEUgPSBodHRwczovL3d3dy5zcWxpdGUub3JnLzIw
MjUKPiAgU1FMSVRFX0xJQ0VOU0UgPSBibGVzc2luZwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
