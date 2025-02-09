Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5E1C0219B
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 20:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E38D1410CB;
	Sun,  9 Feb 2025 20:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_NKFIhIqAPV; Sun,  9 Feb 2025 20:39:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 802AD411D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 802AD411D0;
	Sun,  9 Feb 2025 20:39:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 311776C
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 20:39:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15E06404B0
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 20:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nb7lPSPLZmKp for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 20:39:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A92E6400E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A92E6400E7
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A92E6400E7
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 20:39:32 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-436284cdbe0so5497635e9.3
 for <buildroot@buildroot.org>; Sun, 09 Feb 2025 12:39:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739133570; x=1739738370;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:sender:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wvyWB8CNOyf0aNhKagsh8kxAe1SgJaDTTnvSAEQFloQ=;
 b=XCRW8+rlqNeb+EQC+p4TT2GoX7wRCY24rj+zfms9oqmqaBv1lQ2gq3uGu1sN19hm+o
 uDEcm1nmbLKkhF9wGqmtXCltVu1mrnziFxM1eLv3mGU926C9mgBQWjsRp1EiEYS+U3mR
 J2on1okqOBi24XE/E/lo5GeuY6sV5OktQrIWT/UdLE17xq5ND8ASBh/AbuVhVXgICKQr
 1whtVC2YTp9j+HmzlTsjyYEWTB+yFlK5ffBuGMjUI3ja67sDk3lMeOdZrb25FvsheOwb
 MPwH30nk6ErV/sLENaKbTmjcp0xb6HQ8WXu/x2vudupQWUwSghkuoewMtO2lRZF7Reox
 Ha5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX78BRTB8VFGnJeQs+ONPVBSOSNFDwDggkn/C03VefYeKBoxAJAeX1DT2LNCQGmN5JDEJm2pJRhr7k=@buildroot.org
X-Gm-Message-State: AOJu0YwW3UJPIku/PgmzPF1VQSy/Z52KuaEFwBMofYMduWC8A66azxxG
 tsqQPuhDnsIBNz1xcJdyj7psqsf+DErutwjzdGhhf2yGy/gD6uTp
X-Gm-Gg: ASbGncvW64uFg4VXfZKcgUNiexAA5j2N1UslpUfzEa/nzX3pZU98kPGh6ywYlVGFjc8
 cSXIN9d9YIAmsb1tiQp4BwfBlrwE3Y4SE5NhRBOhy1U+gdwka5GkUGBnYgJkOAWFD9gzrRDfyOM
 HU+32rg9vVyfC76+Hv3hAN29myesn8B6fLuv+hatBoQ9jEHvK3IXp94MpwcDPDhEE0SYy9h2QyJ
 00q1RbColmuT4PDkiFx6wiQcEIG1oSBQfTXYMvAjVGV/wXR5zhgoe6CkwWr4kxlgej36pT1F2bb
 YduvXnKFfONByXoonSuaxX8=
X-Google-Smtp-Source: AGHT+IF8zmmzrY8G/ygYL+waNJMEslKjsSF9eWBlUsHnCAx7TMpVeSZ3+SEYB7GUv4W4y1mDVm72Cg==
X-Received: by 2002:a05:6000:2c2:b0:38a:8784:9137 with SMTP id
 ffacd0b85a97d-38dc912f253mr3449350f8f.9.1739133570295; 
 Sun, 09 Feb 2025 12:39:30 -0800 (PST)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb22f737sm7516299f8f.24.2025.02.09.12.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Feb 2025 12:39:29 -0800 (PST)
Mime-Version: 1.0
Date: Sun, 09 Feb 2025 21:39:29 +0100
Message-Id: <D7O7EC3FF7WB.2ABWTZ6PYKOOK@gmail.com>
To: "Romain Naour" <romain.naour@smile.fr>, <buildroot@buildroot.org>
Cc: "Mahyar Koshkouei" <mahyar.koshkouei@gmail.com>, "Olivier Benjamin"
 <olivier.benjamin@bootlin.com>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250204173456.201056-1-gael.portay+rtone@gmail.com>
 <20250204173456.201056-2-gael.portay+rtone@gmail.com>
 <27cfddc7-d417-49e3-8344-1be16b5e2f9e@smile.fr>
In-Reply-To: <27cfddc7-d417-49e3-8344-1be16b5e2f9e@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739133570; x=1739738370; darn=buildroot.org;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:sender:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wvyWB8CNOyf0aNhKagsh8kxAe1SgJaDTTnvSAEQFloQ=;
 b=nQcdbGoFcSHd86It2KMIp24vJ7JToIrP0k2P3achghm0NrBda1Tu0SnfEmDg0n7JV6
 6UX/Sd35aHGJ5dVmBXqzB4ldW2+Yzo881DDss1aRcDXpUmlOXw61Deg2k+L3nJXtCJe3
 g3HeP9OZtbHgiR/43GFuqAo4KCAusEzUQyg046x2DI8jDHeDLua/kpk9ALYtzenr6W1o
 Y16UuYvD86Tpjj6lWqoAjx5hLckUi1GdkCsUKNPLQOMYqo/9bW29NMbpA3S78ydcvwEt
 ECW2kr/CfP+AyS9rvEScB2UMMPJLQ91qkg/C6kl/cUyF93sgma9rrqsdT5w4fufZFZYp
 PwXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nQcdbGoF
Subject: Re: [Buildroot] [PATCH v4 1/2] package/rpi-utils: new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUm9tYWluLAoKT24gV2VkIEZlYiA1LCAyMDI1IGF0IDk6NDQgQU0gQ0VULCBSb21haW4g
TmFvdXIgd3JvdGU6Cj4gSGVsbG8gR2HDq2wsIEFsbCwKPgo+IExlIDA0LzAyLzIwMjUgw6AgMTg6
MzQsIEdhw6tsIFBPUlRBWSBhIMOpY3JpdMKgOgo+PiBUaGUgcGFja2FnZSBycGktdXNlcmxhbmQg
aGFzIGJlZW4gbWFya2VkIGFzIGFuY2llbnQgYW5kIGRlcHJlY2F0ZWRbMV0uCj4+IAo+PiBUaGUg
dXNlZnVsIHRvb2xzIChkdG92ZXJsYXksIGR0bWVyZ2UsIHZjbWFpbGJveCwgdmNnZW5jbWQpIHdl
cmUgbW92ZWQgdG8KPj4gdGhlIHJlcG9zaXRvcnkgcnBpLXV0aWxzIHNpbmNlIHRoZW4uCj4+IAo+
PiBUaGlzIGFkZHMgdGhlIG5ldyBwYWNrYWdlIHJwaS11dGlscyBhdCBsYXRlc3QgY29tbWl0IGFz
IHRoZXJlIGlzIG5vCj4+IHRhZ2dlZCBjb21taXQuCj4KPiBCUjJfUEFDS0FHRV9SUElfVVNFUkxB
TkQgaXMgdXNlZCBpbiBzZXZlcmFsIHBhY2thZ2VzLiBTaW5jZSBycGktdXRpbHMgc2hvdWxkCj4g
cmVwbGFjZSBycGktdXNlcmxhbmQgbWF5YmUgaXQncyB0aW1lIHRvIGFsc28gdXBkYXRlIHRoZXNl
cyBwYWNrYWdlcz8KPgoKSW5kZWVkLCBJIHNob3VsZCBjb25zaWRlciB0aGlzOyBhbmQgSSBoYXZl
bid0IHllcyBsb29rIGludG8gdGhlbSAoaS5lLgp3aHkgdGhlIHBhY2thZ2VzIG5lZWQgcnBpLXVz
ZXJsYW5kKS4KCj4gRGlkIHlvdSBjb25zaWRlciBub3Qgb25seSBkZXByZWNhdGluZyBycGktdXNl
cmxhbmQgYnV0IGEgY29tcGxldGUgcmVwbGFjZW1lbnQ/Cj4KCkkgaGF2ZSB0byBjaGVjayBpZiBJ
IGNhbiByZXBsYWNlIGl0IGVudGlyZWx5LgoKVGhlIGRlcHJlY2F0ZWQgcGFja2FnZSBzdGlsbCBj
b250YWluIHNvdXJjZXMgZnJvbSB2YXJpb3VzIGxpYnJhcmllcywKaW5jbHVkaW5nIHRoZSBHTCBi
YWNrZW5kIHVzZWQgYnkgcmFzcGJlcnJ5cGkzX3F0NXdlX2RlZmNvbmZpZy4KCk5vcm1hbGx5LCBp
dCBzaG91bGQgYmUgcmVwbGFjZWQgYnkgbWVzYTNkIGFuZCBpdHMgdmM0IGRyaXZlciAodGhhdApy
ZXF1aXJlcyBORU9OIHN1cHBvcnQgaW4gYnVpbGRyb290KS4KCkJ1dCB0aGUgUmFzcGJlcnJ5IFBp
IDEvWmVyby9aZXJvIFcgdG8gbm90IGhhdmUgTkVPTiBzdXBwb3J0IGFuZCB0aHVzLApycGktdXNl
cmxhbmQgaXMgc3RpbGwgcmVxdWlyZWQgaWYgb25lIHdhbnQgdG8gY29tcGlsZSBRdDVXZWJFbmdp
bmUgZm9yClJhc3BiZXJyeSBQaSAxL1plcm8vWmVybyBXLgoKSSBndWVzcyB0aGUgdmM0IGRyaXZl
ciBkb2VzIG5vdCByZXF1aXJlIHN1cHBvcnQgZm9yIE5FT04gKHYzZCBkb2VzKTsKSUlSQywgSSBj
YW4gY29tcGlsZSB2YzQgZHJpdmVyIGlmIEkgcmV2ZXJ0WzFdIChpLmUuIG5vIGJ1aWxkIGlzc3Vl
KS4KCkkgd2lsbCB0ZXN0IHRvIHJ1biBxdDUgb3BlbmdsIHNhbXBsZXMgdXNpbmcgbWVzYTNkLiBB
bmQgaWYgSSBhbSBhYmxlIHRvCnJ1biB0aGVtIGNvcnJlY3RseSwgSSB3aWxsIGNvbnNpZGVyIHRo
ZSBmdWxsIHJlcGxhY2VtZW50IChpbiB0aGUgcGFja2FnZQpyZXF1aXJpbmcgaXQpLgoKVGhlIHdv
cmsgaXMgc3RpbGwgaW4gcHJvZ3Jlc3Mgb24gdGhhdCBwYXJ0LgoKWzFdOiBodHRwczovL2dpdGxh
Yi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvYTVjZGI1NGVkNzhiMTM2Yzgz
ZGQ0NGFlYmZhMjdmNzE1Y2RhNWVhMwoKPj4gCj4+IFsxXTogaHR0cHM6Ly9naXRodWIuY29tL3Jh
c3BiZXJyeXBpL3VzZXJsYW5kL2NvbW1pdC85NmE3MzM0YWU5ZDVmYzlkYjdhYzkyZTU5ODUyMzc3
ZGY2M2YxODQ4Cj4+IAo+PiBUZXN0ZWQtYnk6IE9saXZpZXIgQmVuamFtaW4gPG9saXZpZXIuYmVu
amFtaW5AYm9vdGxpbi5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5w
b3J0YXkrcnRvbmVAZ21haWwuY29tPgo+PiAtLS0KPgo+IFdoYXQgaGFwcGVuZWQgc2luY2UgdjM/
Cj4KCkNoYW5nZXMgc2luY2UgdjM6CiAtIFVwZGF0ZSBteSBlLW1haWwKIC0gUmViYXNlIG9uIG1h
c3RlcgogLSBBZGQgVGVzdGVkLWJ5OiBPbGl2aWVyIEJlbmphbWluIDxvbGl2aWVyLmJlbmphbWlu
QGJvb3RsaW4uY29tPgoKSSBoYXZlIGFkZGVkIHRoZXNlIGxpbmVzIHRvIHRoZSBjb3ZlcmxldHRl
clsyXS4KClsyXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjUwMjA0MTcz
NDU2LjIwMTA1Ni0xLWdhZWwucG9ydGF5K3J0b25lQGdtYWlsLmNvbS8KCj4+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3JwaS11dGlscy9Db25maWcuaW4gYi9wYWNrYWdlL3JwaS11dGlscy9Db25maWcu
aW4KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uYTI3MjkxNjdh
YQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3BhY2thZ2UvcnBpLXV0aWxzL0NvbmZpZy5pbgo+
PiBAQCAtMCwwICsxLDEyIEBACj4+ICtjb25maWcgQlIyX1BBQ0tBR0VfUlBJX1VUSUxTCj4+ICsJ
Ym9vbCAicnBpLXV0aWxzIgo+Cj4gU2luY2UgaXQncyBvbmx5IHVzZWZ1bGwgZm9yIHJwaSB0YXJn
ZXRzLCB5b3Ugc2hvdWxkIGtlZXAgdGhlIGFyY2hpdGVjdHVyZQo+IGRlcGVuZGVuY2llcyAoYXQg
bGVhc3QpOgo+Cj4gCWRlcGVuZHMgb24gQlIyX2FybSB8fCBCUjJfYWFyY2g2NAo+Cj4gT3RoZXJ3
aXNlLCBpdCBsb29rcyBvay4KPgoKTWFrZSBzZW5zZSwgSSB3aWxsIGFkZGVkIGluIHY1LgoKPiBC
ZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4KCkJlc3QgUmVnYXJkcywKR2HDq2wKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
