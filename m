Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33080CFB424
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 13:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAE278111C;
	Sun,  6 Oct 2024 13:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5I3PEgkbE3hB; Sun,  6 Oct 2024 13:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FC27810EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FC27810EF;
	Sun,  6 Oct 2024 13:54:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A4CA1BF325
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 13:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 289D4400D9
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 13:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mezIsIJp5KLg for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 13:54:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E7E0F40004
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7E0F40004
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7E0F40004
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 13:54:40 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42e82f7f36aso29896895e9.0
 for <buildroot@buildroot.org>; Sun, 06 Oct 2024 06:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728222878; x=1728827678;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MewK8CRNSEXczBm6RUCy1wyP8W8g6lxWANzwpNhj19E=;
 b=O0O527jTjRVf0ixXY5lRWrit/Yk0TwrHThvo6ee3ZAF7xGo8xpdBJeUsdCzRu1wwpX
 RUveWSnPYV2w8XgBupZwvrwnXX/a/+ESpgpbkv2jdMd/SlAXzZ/iD80WmT39Q1QeYDL/
 7v3k7Bj8UyoXcWQwMyXX+KjoWWfoZQsK6ltsx392uBbOFrS8vffc1noy6beO1mSVeZMJ
 YQJMSRAD7WGEzSYt8BJikhC5pMb1hk/2WhhaZWv+6FvYJa9Ad79ms9f8pQWPoDwGbvek
 mTu2KS58r0n+yCJCKnpivngJwRNPSYmf2T0jtAkyKRVzdS+7S8v3C/m86VSEbaouuQUT
 MNxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUc3pCB+KSkRLzkgaPf/rhKBfYtNVQRIOAqJW7dooQJquxXbhypA7zh2SLHTh/cocWzdgaEC8RZw8=@buildroot.org
X-Gm-Message-State: AOJu0YxchPdUVqwbVC9+99AcQNqb2tMRVb6Gsg/uEX8qJ2V7QDCVSqQP
 lIIghgsBr0Ta3PLXF4pYGB58+kH4Eh3gH9gyH1LMdcKC8kQ+ColFhFYupDH0QppEjzebqGmpyRP
 M
X-Google-Smtp-Source: AGHT+IGXhD62QVCPvMym1V7+rKpGaAzDy03xuAitr3LuHV2dJ2Kuk4whv7ZqwqlkZcLDKGvxsw/wBA==
X-Received: by 2002:a05:600c:4fcc:b0:42f:68e8:d874 with SMTP id
 5b1f17b1804b1-42f85af46d4mr59204705e9.31.1728222878466; 
 Sun, 06 Oct 2024 06:54:38 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f8671933fsm67536855e9.1.2024.10.06.06.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Oct 2024 06:54:37 -0700 (PDT)
Message-ID: <a1dd35c7-a8e4-409b-85b3-ffed23cf5338@mind.be>
Date: Sun, 6 Oct 2024 15:54:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Damien_Th=C3=A9bault?= <damien.thebault@gmail.com>,
 buildroot@buildroot.org
References: <6134c505-71a2-4a03-9117-20422d5213c8@gmail.com>
Content-Language: en-GB
In-Reply-To: <6134c505-71a2-4a03-9117-20422d5213c8@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1728222878; x=1728827678; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MewK8CRNSEXczBm6RUCy1wyP8W8g6lxWANzwpNhj19E=;
 b=AxjO4MvDeWLQRaZeT6SlDC4/sachIeLipaXflHicjdFmk2NX6aXQP09AKLw47JzuRO
 u3FNTxJw8dCT5wenFOWHOLf/xMR8a1V1eyWUNlt/PWuRFSGccs2fpsZT0+BOGnGYDXds
 fJIEnoiX1e8zYuExfizke7qiiUMJ+ci6m/VdfPsAPcta97Q2wtvb/zEfqgJBIthmBOiS
 3S0ZNXwwBawbis1BcW71MEGxeYMtEclrgNviX4lEA6rlLZkeTUrCVg8zFEtUx5WV3GGF
 resYg4lZHeCvwI/aIvGKGqtsYkT32aPy8KZojGj8BbZnNjK1D39OotF5jB+Ar8+ijsYy
 Q3mQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AxjO4MvD
Subject: Re: [Buildroot] [PATCH] package/linux-pam: remove flex dependency
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNS8xMC8yMDI0IDE4OjQ5LCBEYW1pZW4gVGjDqWJhdWx0IHdyb3RlOgo+IGxpbnV4LXBh
bSAxLjIuMCByZW1vdmVkIHRoZSB1c2Ugb2YgeXl3cmFwLCBzbyB0aGUgZmxleCBkZXBlbmRlbmN5
IGlzIG5vdAo+IG5lZWRlZCBub3cgKGhvc3QtZmxleCBpcyBzdGlsbCBuZWVkZWQpLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IERhbWllbiBUaMOpYmF1bHQgPGRhbWllbi50aGViYXVsdEBnbWFpbC5jb20+
CgogIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIEkndmUgYWxzbyBhIEZpeGVzOiAjNDcg
dGFnIHRvIG1ha2Ugc3VyZSB0aGUgdGlja2V0IHlvdSBvcGVuZWQgZWFybGllciBnZXRzIGNsb3Nl
ZC4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gLS0tCj4gICBwYWNrYWdlL2xpbnV4LXBhbS9Db25m
aWcuaW4gICAgfCAxIC0KPiAgIHBhY2thZ2UvbGludXgtcGFtL2xpbnV4LXBhbS5tayB8IDIgKy0K
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGludXgtcGFtL0NvbmZpZy5pbiBiL3BhY2thZ2UvbGludXgt
cGFtL0NvbmZpZy5pbgo+IGluZGV4IDFhYTkwNDUzMzMuLjZiMDhhOWM0YzIgMTAwNjQ0Cj4gLS0t
IGEvcGFja2FnZS9saW51eC1wYW0vQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9saW51eC1wYW0v
Q29uZmlnLmluCj4gQEAgLTUsNyArNSw2IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MSU5VWF9QQU0K
PiAgIAlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMKPiAgIAlkZXBlbmRzIG9uIEJSMl9VU0Vf
TU1VICMgZm9yaygpCj4gICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80
XzkgIyBDMTEvc3RkYXRvbWljLmgKPiAtCXNlbGVjdCBCUjJfUEFDS0FHRV9GTEVYCj4gICAJc2Vs
ZWN0IEJSMl9QQUNLQUdFX0xJQlhDUllQVCBpZiBCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMKPiAg
IAloZWxwCj4gICAJICBBIFNlY3VyaXR5IEZyYW1ld29yayB0aGF0IFByb3ZpZGVzIEF1dGhlbnRp
Y2F0aW9uIGZvcgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpbnV4LXBhbS9saW51eC1wYW0ubWsg
Yi9wYWNrYWdlL2xpbnV4LXBhbS9saW51eC1wYW0ubWsKPiBpbmRleCAxNDMzZWIwMGIzLi5hNWI4
YzkxNTFmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGludXgtcGFtL2xpbnV4LXBhbS5tawo+ICsr
KyBiL3BhY2thZ2UvbGludXgtcGFtL2xpbnV4LXBhbS5tawo+IEBAIC0xNiw3ICsxNiw3IEBAIExJ
TlVYX1BBTV9DT05GX09QVFMgPSBcCj4gICAJLS1kaXNhYmxlLXJlZ2VuZXJhdGUtZG9jdSBcCj4g
ICAJLS1lbmFibGUtc2VjdXJlZGlyPS9saWIvc2VjdXJpdHkgXAo+ICAgCS0tbGliZGlyPS9saWIK
PiAtTElOVVhfUEFNX0RFUEVOREVOQ0lFUyA9IGZsZXggaG9zdC1mbGV4IGhvc3QtcGtnY29uZiBc
Cj4gK0xJTlVYX1BBTV9ERVBFTkRFTkNJRVMgPSBob3N0LWZsZXggaG9zdC1wa2djb25mIFwKPiAg
IAkkKGlmICQoQlIyX1BBQ0tBR0VfTElCWENSWVBUKSxsaWJ4Y3J5cHQpIFwKPiAgIAkkKFRBUkdF
VF9OTFNfREVQRU5ERU5DSUVTKQo+ICAgTElOVVhfUEFNX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
