Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA8EC02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 08:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAB85848B1;
	Fri, 14 Feb 2025 08:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NRyr7ACdgx_x; Fri, 14 Feb 2025 08:12:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B470C848AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B470C848AA;
	Fri, 14 Feb 2025 08:12:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D6511C6
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 08:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C12A4161C
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 08:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kI2nI29ll2UB for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 08:12:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9303C415DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9303C415DF
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9303C415DF
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 08:12:37 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38dd14c99c3so809740f8f.3
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 00:12:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739520756; x=1740125556;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5Nf37BAofS9Chzq6U/6hvGCw8DmxXJ41nUW2FpTkg+8=;
 b=JwoI2BbMv2MsU7+rMn6oubCE8n54/8ZMCmQIBYce0cb3g77U5siI8CFSoOKDoe+xn/
 0FQFL8LG4gg1k4QldwBJmTSOdTepGANOTqk5E3jRsNiKHKlOBQ/xexojXbeooAl+/FRx
 jBFuCPbJLYzxhz2beHiCM7ppaseCvnEJWuJBqA0MTm+7oocqSkEY8Z8knKZtUu0f6iju
 rnpD7w5zP+3VzuD+80EuKd4xyiqRORmkxeIyVuS0+jiiLvO5cjrdRYteFstlsQlEw04A
 4K/5rqN5oU3p02Q9WHyiGQnDTH6zAy6IahFv/wriyJIZk5qs5j1aaA1jD1y8HNbLofGx
 c5Fw==
X-Gm-Message-State: AOJu0YwGEH9V1iBaBkdSFSE0HVEJPOoGfMfuULntnHjQHZvqdCo9uHkg
 YP52oFZGc53OMD6mNYtGz1FJAwCMjsnp5XGdYnU/XWg7d2fVSn1oeMdXB/gOC40=
X-Gm-Gg: ASbGnctfDQ5WDkffktrKEdJ05wCKOFxKY7Tw6BUYgP8fHMfq92reA7uWDsIYp/B4Iq8
 BQwd4+jiU4SvbrC6zTVqylLOJ4paBQwPJOxDYHEcD5BMR49tnmaeaP3+8LTtQt5DmbOG9jEEf0Z
 4q9MDXBWwd4qaRWxD9NOoQovVETZtfhCcLt/04P7mNLl2dIaS/XiJ4HEvjusLPjV6mfrQUNbp0E
 MyqW2/+irKK74NEU+iQUfEGxa68JgRZima+ggyotgz4lu9Zwn9Jlt/9DsilGusbY0fuGBwh6UPL
 x0fVP+TCzcfhtr0Piu0PnHC3BI8nw7pZZn4vYWRUgrReW9OkiZo=
X-Google-Smtp-Source: AGHT+IH/Qz4aSaeXrJL4cVKfezuaCkbzqxgt6evNVcl0IojIgBx/jmdm8nmyHVzNnKbrZUFSJgKlgA==
X-Received: by 2002:a05:6000:1863:b0:38b:d9a3:6cff with SMTP id
 ffacd0b85a97d-38dea26e512mr12927644f8f.16.1739520755877; 
 Fri, 14 Feb 2025 00:12:35 -0800 (PST)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b432asm3874180f8f.6.2025.02.14.00.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 00:12:35 -0800 (PST)
Message-ID: <9e932bf0-9223-48ed-bd7c-857e8f86a996@mind.be>
Date: Fri, 14 Feb 2025 09:12:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, bryce.schober@gmail.com
Cc: buildroot@buildroot.org, =?UTF-8?Q?Ga=C3=ABl_PORTAY?=
 <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>, =?UTF-8?Q?Jos=C3=A9_Mendes?=
 <jp.baltazar.mendes@gmail.com>
References: <20250207171458.1127620-1-fiona.klute@gmx.de>
 <20250207171458.1127620-4-fiona.klute@gmx.de>
 <da600884-960d-4deb-b776-cc78c49acce2@mind.be>
 <CAJpxd046ZwnSh77pxciqCi8tdRhQwiKSb3AjdMkB7+qMvqQcFA@mail.gmail.com>
 <615cd79c-2d9e-4205-a9bc-9f8b66cd8f96@mind.be>
 <d2495c58-827a-4666-b318-1be64e1bcab8@gmx.de>
Content-Language: en-GB
In-Reply-To: <d2495c58-827a-4666-b318-1be64e1bcab8@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739520756; x=1740125556; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Nf37BAofS9Chzq6U/6hvGCw8DmxXJ41nUW2FpTkg+8=;
 b=bnVxHCNYqfjVw8zIi2D5oj4YjGABCrlWRCQiU0Euwkp2uTiIJPHwKKJ4ZH7Wr5JplQ
 Nly7PFCdCod/Dv6TaDi3RK24lWtZOd+N6htEnl6oAveFDTi7eZRLxjzfq0DTBJoK7pVE
 2HFb86ZJNESCiPFsB+yKtUA6X4eb3SpOLjgHHTjssjqzOmW50iEycd0gvdIpew/wXzmu
 t17oV5kxV87KDBOfIga2BKpI2WUVaOvVaG49fRRlzedJoDB5Bm3nwp00ZPmeT9Wao6Yn
 PDgwcZcLWAolUhXhT2MmmmxeP3h0hovPtWRG0DnJW7vZDWbrZzd2JO25haguv9CKVs8v
 fKcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bnVxHCNY
Subject: Re: [Buildroot] [PATCH v3 3/3]
 configs/raspberrypicm4io_64_uboot_defconfig: new defconfig
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

CgpPbiAxMy8wMi8yMDI1IDIwOjI1LCBGaW9uYSBLbHV0ZSB3cm90ZToKPiBBbSAxMC4wMi4yNSB1
bSAwODo0NCBzY2hyaWViIEFybm91dCBWYW5kZWNhcHBlbGxlOgo+Pgo+Pgo+PiBPbiAwNy8wMi8y
MDI1IDIzOjM2LCBicnljZS5zY2hvYmVyQGdtYWlsLmNvbSB3cm90ZToKPj4+Cj4+PiBIaSBBcm5v
dXQsCj4+Pgo+Pj4gT24gRnJpLCBGZWIgNywgMjAyNSBhdCAxOjM34oCvUE0gQXJub3V0IFZhbmRl
Y2FwcGVsbGUgdmlhIGJ1aWxkcm9vdAo+Pj4gPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnIDxtYWls
dG86YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+PiB3cm90ZToKPj4+Cj4+PiDCoMKgwqDCoCDCoCBM
b29rcyBnb29kIGF0IGZpcnN0IHNpZ2h0LiBJJ20gdGhpbmtpbmcgdGhvdWdoOiB3b3VsZG4ndCBp
dCBiZQo+Pj4gZWFzaWVyIGlmIHdlCj4+PiDCoMKgwqAgY29udmVydCBhbGwgUlBpIGNvbmZpZ3Mg
KGdyYWR1YWxseSkgdG8gVS1Cb290LCBhbmQgbWVudGlvbiBpbiB0aGUKPj4+IHJlYWRtZSAoYW5k
Cj4+PiDCoMKgwqAgY29uZmlnLnR4dCBjb21tZW50cykgaG93IHRvIGJvb3Qgd2l0aG91dCBVLUJv
b3Q/Cj4+Pgo+Pj4KPj4+IEZZSSwgVS1Cb290IGRvZXNuJ3Qgc3VwcG9ydCB0aGUgUlBpIFBDSS9O
Vk1lIGludGVyZmFjZSBiZWNhdXNlwqBvZiBhCj4+PiBjdXJyZW50IGxhY2sgb2Ygc3VwcG9ydCBp
biB0aGUgdXBzdHJlYW0ga2VybmVsLiBTbyB3ZSBhcmUgYWN0dWFsbHkKPj4+IG1vdmluZyBhd2F5
IGZyb20gVS1Cb290wqBpbiBhIHByZXZpb3VzIHByb2plY3QgdG93YXJkIHVzaW5nIHRoZSBycGkK
Pj4+IGZpcm13YXJlIHN1cHBvcnQgZm9yIGludGVncmF0aW5nIHdpdGggQS8gQiB1cGRhdGUgc3lz
dGVtcy4gSSdtIG5vdAo+Pj4gc2F5aW5nIHRoYXQgaXQgaGFzIHRvIGJlIGVhc3kgZm9yIHBlb3Bs
ZSBsaWtlIHVzLCBJJ20ganVzdCBjaGltaW5nIGluCj4+PiB3aXRoIHRoZSBmYWN0IHRoYXQgVS1C
b290wqBpc24ndCBhbHdheXMgdGhlwqBiZXN0IGFuc3dlciBmb3IgYWxsIHVzZSBjYXNlcy4KPj4K
Pj4gwqDCoFdoYXQgSSBoYWQgaW4gbWluZCBpczogX3JlbW92aW5nXyBVLUJvb3QgaXMgYWN0dWFs
bHkgcXVpdGUgZWFzeSwgeW91Cj4+IGp1c3QgbmVlZCB0byBjaGFuZ2UgdHdvIGxpbmVzIGluIHRo
ZSBjb25maWcudHh0IChBRkFJVSkuIFRodXMsIGl0IG1ha2VzCj4+IHNlbnNlIHRvIG1lIHRoYXQg
b3VyIGRlZmNvbmZpZ3Mgc2hvdWxkIGFsbCBoYXZlIFUtQm9vdCwgYW5kIHRoZQo+PiByZWFkbWUu
dHh0IGNhbiBleHBsYWluIGhvdyB0byBidWlsZCB3aXRob3V0IFUtQm9vdC4KPiBUaGF0IG1ha2Vz
IHNlbnNlIHRvIG1lLCBtYWludGFpbmluZyBkZWZjb25maWdzIGZvciBhIGZ1bGwgbWF0cml4IG9m
Cj4gYm9hcmQgdHlwZS9tYWlubGluZSBvciBkb3duc3RyZWFtIGtlcm5lbC91LWJvb3Qgb3Igbm90
IGRvZXNuJ3Qgc2VlbQo+IHByYWN0aWNhbC4gTWF5YmUgaXQnZCBtYWtlIHNlbnNlIHRvIGhhdmUg
YSBzdGFuZGFyZCwgYW5kIG9uZSBleGFtcGxlIGZvcgo+IGVhY2ggb2YgdGhlIHBvc3NpYmxlIGRl
dmlhdGlvbnM/Cj4gCj4gQW5kIG1heWJlIG1lbnRpb24gcG9zc2libGUgcGl0ZmFsbHMgaW4gdGhl
IHJlYWRtZSBhcyBmYXIgYXMga25vd24sIGUuZy4KPiBJIHJlY2VudGx5IGJ1bXBlZCBpbnRvIGRp
ZmZlcmVudCBrZXJuZWwgY29uZmlnIG9wdGlvbnMgdG8gbWFrZSB0aGUKPiBtaWNyb1NEIHNsb3Qg
b24gUGkgWmVybyAyVyB3b3JrIChyZXN1bHQ6IGtlcm5lbCBjYW4ndCBmaW5kIHJvb3RmcyBpZiB5
b3UKPiBzd2l0Y2ggYmV0d2VlbiBkb3duc3RyZWFtIGFuZCBtYWlubGluZSBhbmQgcmV1c2UgdGhl
IGNvbmZpZykuCgogIEluZGVlZCwgc3dpdGNoaW5nIGJldHdlZW4gbWFpbmxpbmUgYW5kIHZlbmRv
ciBrZXJuZWwgaXMgdHlwaWNhbGx5IG1vcmUgCmNvbXBsaWNhdGVkLCBzbyBpdCBtYWtlcyBzZW5z
ZSB0byBoYXZlIGEgc2VwYXJhdGUgZGVmY29uZmlnLiBUaGF0J3MgYWxzbyB3aGF0IHdlIApkZWNp
ZGVkIGluIHRoZSBEZXZlbG9wZXIgTWVldGluZyBpbiBTZXB0ZW1iZXIgWzFdLgoKICBIb3dldmVy
LCBzd2l0Y2hpbmcgYmV0d2VlbiBVLUJvb3QgYW5kIG5vIHUtYm9vdCBpcyBBRkFJVSBqdXN0IGEg
bWF0dGVyIG9mIApjaGFuZ2luZyB0d28gbGluZXMgaW4gdGhlIGNvbmZpZy50eHQuCgogIFJlZ2Fy
ZHMsCiAgQXJub3V0CgpbMV0gaHR0cHM6Ly9lbGludXgub3JnL0J1aWxkcm9vdDpEZXZlbG9wZXJE
YXlzRUxDRTIwMjQjUnVsZXNfZm9yX2RlZmNvbmZpZ3MKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
