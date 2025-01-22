Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DB0C02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 10:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DACAD6F6A4;
	Wed, 22 Jan 2025 10:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybLQs7Z5hNf2; Wed, 22 Jan 2025 10:52:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD03F6F6AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD03F6F6AD;
	Wed, 22 Jan 2025 10:52:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C453BD7
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 10:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B21A36F6A4
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 10:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGQREHXPgAxI for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 10:52:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 21C646F68B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21C646F68B
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21C646F68B
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 10:52:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso77217465e9.2
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 02:52:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737543138; x=1738147938;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1wjYd0KYUYks0yWJFXyvwkNXIIdIGzHyBbv5d+9BbJg=;
 b=hT7Ftn9fretW1+M2wbQXbCwfzIVp0sIpH8h6upwLSDJe8iGA2g211fdZpZ5wUa8q+2
 cT0KnccMAx6j7wnYfZvanNNebDuQ5eRRD01aZmj6v2RUHLs9zzoDoN1GeWxww6V5P1Vo
 UO9JQJjNlnX+d73AxESgXM0FXIDax+D67Dxuzgn/iFLhHwX2BHrEZGLTj6gWyecPuYVk
 A+RJ++kb2qhzBiKSKO3ypvmniL6Q4mrHR0/lpeiNM23vd+RlZ1E91q4cBhDcYxrg37D+
 k15ySPfJZ1Vy+/2aZ7HCxs5klUDhGSSwhk+PBBQ1LYLKRlcXcKGBk3Wqp7rRQc5wUVFb
 kEkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCViHMnOXWRvDXIPSkfXMfgRRqaLqINq3A/HwuQhYYLLcupxqClufTE3VVwMEC+ruTuRKX6V7hPiGP4=@buildroot.org
X-Gm-Message-State: AOJu0YzeDOcucEnBleH+4Jw4ZuGsL14od6QghDDDO9pQRHJ3L1ax6SHN
 NmGAiiICI5AooC5BwG+1TYuhjbg0P51zur4aNbujqR2XlBCFBoyhhhv2S94utzk=
X-Gm-Gg: ASbGncudS3MtiV7Gf7DVIgd68zKweMnazAsAq02eSGF7CJueJ9bpctG/bhEtab5x8u7
 +yedL7cbAU7+hdu8cg9cvk9LoJLTr/wmqdfTlxWUfRyKZ1HjovqDU9etNpNYNE2OfW4m8maHRcG
 P7ZQFw/xJsKjfdCzdh0A/KQW43vHmxsh0uaZllo6O/cIl3tnmnKZjZnn6DHj5iQgBowt+Y2yGN/
 IHrcp/hKJx/aYgLirmJWVZ7lP0whUc/T2ZOkBtk52LJjvcJOFkGfwt8qrZhRGXRENm3eXXGU6QW
 v6YkO11FZrqCTvGwvCMSNhbXoZk2/38Jbb+m3Ve+P9WABWh9Ga/WllmLpZ2MGsgQsZiVdhWD2L4
 6ruvrr1L1pTFNF2MROn6idhJZ
X-Google-Smtp-Source: AGHT+IEd1mB4NUMFfUJDoGDjpKl2RqbVjzyjY5QDsLzB+1BPIZSjbYifX4uUcWsy3wVJNE2BQOXoOA==
X-Received: by 2002:a05:600c:1da6:b0:436:1971:2a4 with SMTP id
 5b1f17b1804b1-438913ef340mr198348515e9.17.1737543137651; 
 Wed, 22 Jan 2025 02:52:17 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b318c176sm20762095e9.3.2025.01.22.02.52.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2025 02:52:17 -0800 (PST)
Message-ID: <5de84d6d-dafb-432c-9308-0b8d7e93fdd3@mind.be>
Date: Wed, 22 Jan 2025 11:52:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, Michael Walle <mwalle@kernel.org>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Buildroot development <buildroot@buildroot.org>
Cc: Chris Packham <judge.packham@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
References: <93f83afb-6987-441c-8e06-dab4d43b828f@grenoble.cnrs.fr>
 <D6UG5Z1HUN9N.GWVHB4L823ZC@kernel.org>
 <5576c173-c1a6-4c85-91dc-b8a6b0a54ba6@smile.fr>
Content-Language: en-GB
In-Reply-To: <5576c173-c1a6-4c85-91dc-b8a6b0a54ba6@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1737543138; x=1738147938; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1wjYd0KYUYks0yWJFXyvwkNXIIdIGzHyBbv5d+9BbJg=;
 b=No5YPJACSRzNj2gvEI5BZ4tHGPsxCLqhCn9PcNt7wiFX4EjK3C0qmRU2x6Um6oYBaI
 UaP6H+HlROijjRdv+Sbgdm7RO1fCUP+r+MLVm5sN0QdU+ak4MeJHvyzWwYNXIZKleaaJ
 IdEKFLqM/KjGeZjuzwGkWELmxb29SL3T6yeLXRyCC4tTDcKsHdj97jvY6sc+5SJ2XHU6
 llvgPsoJeeLhjKFD3RgpoqYoU9VuB+b30acmb/cn2M2s50cv2qc1C+wiowihLXIlKOYZ
 NXCewCnfW7Ob6S4pCOROICrbu27gqbWGcX37NFhqdAJnJvSYUcwU66f454xK+gfE3X86
 kDVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=No5YPJAC
Subject: Re: [Buildroot] [PATCH v3 1/1] linux: make out-of-tree DTS work
 with newest kernels
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMi8wMS8yMDI1IDExOjQwLCBSb21haW4gTmFvdXIgd3JvdGU6CltzbmlwXQo+IFRoZSBw
cm9ibGVtIGlzIHRoYXQgd2UgZGVmaW5lIHRoZSBwYXRoIHRvIHRoZSBPT1QgZHRzIGZpbGUgbGlr
ZSB0aGlzOgo+IAo+IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIPSJib2FyZC9hY21l
c3lzdGVtcy9hY3F1YS1hNS9hdDkxLXNhbWE1ZDNfYWNxdWEuZHRzIgo+IAo+IFNvIHdlIGNhbid0
IGV4dHJhY3QgdGhlIHZlbmRvciBwcmVmaXggZnJvbSBpdCBldmVuIGlmIGl0IHdvdWxkIGxvb2sg
bGlrZSB0aGlzOgo+IAo+IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIPSJib2FyZC9h
Y21lc3lzdGVtcy9hY3F1YS1hNS9kdHMvbWljcm9jaGlwL2F0OTEtc2FtYTVkM19hY3F1YS5kdHMi
Cj4gCj4gTm90ZTogdGhlIHZlbmRvciBwcmVmaXggaXMgbm90IGFsd2F5cyBvbmUgc3ViLWRpcmVj
dG9yeToKPiAKPiAgICBhcmNoL2FybS9ib290L2R0cy90aS9vbWFwL2RyYTcuZHRzaQo+ICAgIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2dvb2dsZS9nczEwMS5kdHNpCj4gCj4gV2UgcHJvYmFi
bHkgbmVlZCBhIG5ldyBvcHRpb24gdG8gcHJvdmlkZSBzb21ldGhpbmcgbGlrZSBhIGR0cyAib3Zl
cmxheSIKPiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfT1ZFUkxBWSAoc2ltaWxhciB0byBC
UjJfUk9PVEZTX09WRVJMQVkpIHRvIGNvcHkgYQo+IGR0cyBkaXJlY3RvcnkgZGlyZWN0bHkgdG8g
JChMSU5VWF9BUkNIX1BBVEgpL2Jvb3QvZHRzLwo+IAo+ICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VT
VE9NX0RUU19PVkVSTEFZPSJib2FyZC9hY21lc3lzdGVtcy9hY3F1YS1hNS9kdHMiCj4gCj4gICAg
Ym9hcmQvYWNtZXN5c3RlbXMvYWNxdWEtYTUvZHRzLwo+ICAgIOKUlOKUgOKUgCBtaWNyb2NoaXAK
PiAgICAgICAg4pSU4pSA4pSAIGF0OTEtc2FtYTVkM19hY3F1YS5kdHMKPiAKPiBEb2luZyBzbywg
dGhlIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIIHNob3VsZCBiZSBkZXByZWNhdGVk
LgoKICBBbHRlcm5hdGl2ZWx5LCB3ZSBjYW4gZGVmaW5lIGFuIGFkZGl0aW9uYWwgY29uZmlnIHZh
cmlhYmxlIApCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfRElSRUNUT1JZIHRoYXQgY29udGFp
bnMgdGhlIHN1YmRpcmVjdG9yeSB0byB3aGljaCAKdGhlIGN1c3RvbSBEVFMgaXMgY29waWVkLiBT
byBgbWljcm9jaGlwYCwgYHRpL29tYXBgLCBvciBgZXh5bm9zL2dvb2dsZWAuCgogIERpc2FkdmFu
dGFnZTogd2UgY2FuJ3Qgc3VwcG9ydCBtdWx0aXBsZSBkdHMgZnJvbSBkaWZmZXJlbnQgdmVuZG9y
cy4gTm90IHN1cmUgCmlmIHRoYXQgaXMgZ29pbmcgdG8gYmUgYW4gYWN0dWFsIHVzZSBjYXNlLCBi
dXQgcGVvcGxlIGRvIGNyYXp5IHRoaW5ncy4uLiBCdXQgSSAKdGhpbmsgZm9yIHRoZSBjb21tb24g
Y2FzZSAob2Ygb25seSBhIHNpbmdsZSBvciBhIGxvdyBudW1iZXIgb2YgRFRTZXMgdGhhdCBhbGwg
CnVzZSB0aGUgc2FtZSBDUFUgKGZhbWlseSkgc28gYXJlIGluIHRoZSBzYW1lIGRpcmVjdG9yeSkg
aXQgd29ya3Mgd2VsbCBhbmQgaXMgCm11Y2ggZWFzaWVyIGZvciB0aGUgdXNlci4KCiAgUmVnYXJk
cywKICBBcm5vdXQKCj4gCj4gVGhvdWdodHM/Cj4gCj4gWzFdCj4gaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzhmYjUyMDk4ODU5ZmE1Y2Y3ZWNmNGRi
MzBmZjhlMDI3NjY4NzgzMmYKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4gCj4gCj4+Cj4+
IC1taWNoYWVsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
