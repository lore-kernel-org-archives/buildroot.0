Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECCFC02198
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 07:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E18B411CC;
	Mon, 10 Feb 2025 07:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hq3Ogw4C8opA; Mon, 10 Feb 2025 07:44:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30C2A410CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30C2A410CB;
	Mon, 10 Feb 2025 07:44:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB05B6C
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 07:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8E5E81B6D
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 07:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35tu76rrRZqi for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 07:44:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96B9681AEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96B9681AEA
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96B9681AEA
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 07:44:49 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so40378065e9.1
 for <buildroot@buildroot.org>; Sun, 09 Feb 2025 23:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739173487; x=1739778287;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iI/PkN7ltdHL5LJRcgEA3LFI1MlwlYAfU9PfJ2UdsHM=;
 b=CePmzWRWFghCUZixPePPSjfLHCi5PuDYDayckmnov8vfVT6zC7UkwqsVbEOm/yPpTE
 YZT63jUVENZ0F468XXNxAaLDoY60zyYLi6dP+UlPSeN0yiFnLgUnP+lhWCyJjmEiAYki
 4t6McPRqhJBXDGaz1LmM1yQvDJLpC2uga5WC9DkAPe4p3pp+H2IlpPDjdja2TN+HL8K7
 ct3y7w1S3BtvY54yMiRFL/JHke+ETRosb9CKBPCfvVXlDDAZOv7fqG1gh4EKZsPbUWxr
 T096kY/Cbo0vP7hBf5sHw6ty1/7gwH8WHyae4WKF+KukAknvdxM93jOnogXgdvnLXoHt
 xXKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNEDPnEP8pXRBJj4/UL2xW5tkZMFUJmD4bBF+3KLlkDsnjMJfrhIGDeBXVmha2XxhiKXzvLzNa3yw=@buildroot.org
X-Gm-Message-State: AOJu0YwhdApiR8jblDctSlZ9+rqO2ahtazUhnxnvnlOJWxq5WeRLUx4B
 FM6VMlxk+6TPcN7k1zfkhlru5mtQNiDyPQdlYSbLUqL0oIGByO6hbwLRgiXj47k=
X-Gm-Gg: ASbGncvrC9bWQ++zcWJ31cTI2Yfoi0MY8wHceOnjvYZeyVPqyLj4xCtj8sKzPqB1We4
 9Nv2w1aj0KTgJAVB2fJnORDgh1k3qS0ThvbzLxJwfv+yGMoDIRcFDQpZmlFrzYKhvmQ5ym0pyF/
 hw/7kbTB1MmfIjl5vWG3rM+Ao3EUwJ4Ftrs5o0ttEE+x0qrtO/Ul4L2bBm9ciQ+4pcWU8RP4dds
 IeApwXQ7MYGbUMvAY/2Irfgg9tb6J1cGljfEppkAoxP2s9W/gtuStit6zP1tAn8aba9wTnwjSFH
 1W0i5czWo3Q1JZPjFh0aijPfQv6r95YWgCb+wKTcHYUxrBVJXQ==
X-Google-Smtp-Source: AGHT+IFrjFhgrotb9LN1mbpD/3zFVyDR/uNTfHxHs0dy4B+Xe4T6hLXI/69k4nFf4QcaakafXqFbyw==
X-Received: by 2002:a5d:5f83:0:b0:38d:b448:8ffc with SMTP id
 ffacd0b85a97d-38dc90eec01mr8641236f8f.27.1739173486744; 
 Sun, 09 Feb 2025 23:44:46 -0800 (PST)
Received: from [10.5.0.131] (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391dcae80dsm134324015e9.22.2025.02.09.23.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Feb 2025 23:44:46 -0800 (PST)
Message-ID: <615cd79c-2d9e-4205-a9bc-9f8b66cd8f96@mind.be>
Date: Mon, 10 Feb 2025 08:44:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: bryce.schober@gmail.com
Cc: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org,
 =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>, =?UTF-8?Q?Jos=C3=A9_Mendes?=
 <jp.baltazar.mendes@gmail.com>
References: <20250207171458.1127620-1-fiona.klute@gmx.de>
 <20250207171458.1127620-4-fiona.klute@gmx.de>
 <da600884-960d-4deb-b776-cc78c49acce2@mind.be>
 <CAJpxd046ZwnSh77pxciqCi8tdRhQwiKSb3AjdMkB7+qMvqQcFA@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CAJpxd046ZwnSh77pxciqCi8tdRhQwiKSb3AjdMkB7+qMvqQcFA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739173487; x=1739778287; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iI/PkN7ltdHL5LJRcgEA3LFI1MlwlYAfU9PfJ2UdsHM=;
 b=BAjM1WSoeAtURyZeHSq6pySWW797J1kDpB85cVlj334ah/TtxksnMuKbc/snga6wZf
 9GSVZU28a9LazF/+/dGfUqkEelKd7tELNpYs5i1e8CMdRZQLJNlKXGaLtjA22YoDxpab
 nbXVuLSjG4nSvwDQWkGOcTkxMB6j7+dI8BO7pGU0M4Su9sadDRK7711rC+U0suvid1Df
 9eRL6QDU3q3vCNXEDY1p2wHnCoiby0pWiilpHDE2LYZQjAmWI0Ysy7449/lwCX8V1j1F
 GUEmipd0id1ftQJTf+A/3iFva7MJhqjyusQ+Wg9GRfHP2safd75qm7A6be9s2u/l7QAn
 W83w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BAjM1WSo
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

CgpPbiAwNy8wMi8yMDI1IDIzOjM2LCBicnljZS5zY2hvYmVyQGdtYWlsLmNvbSB3cm90ZToKPiAK
PiBIaSBBcm5vdXQsCj4gCj4gT24gRnJpLCBGZWIgNywgMjAyNSBhdCAxOjM34oCvUE0gQXJub3V0
IFZhbmRlY2FwcGVsbGUgdmlhIGJ1aWxkcm9vdCAKPiA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcg
PG1haWx0bzpidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4+IHdyb3RlOgo+IAo+ICAgICAgwqAgTG9v
a3MgZ29vZCBhdCBmaXJzdCBzaWdodC4gSSdtIHRoaW5raW5nIHRob3VnaDogd291bGRuJ3QgaXQg
YmUgZWFzaWVyIGlmIHdlCj4gICAgIGNvbnZlcnQgYWxsIFJQaSBjb25maWdzIChncmFkdWFsbHkp
IHRvIFUtQm9vdCwgYW5kIG1lbnRpb24gaW4gdGhlIHJlYWRtZSAoYW5kCj4gICAgIGNvbmZpZy50
eHQgY29tbWVudHMpIGhvdyB0byBib290IHdpdGhvdXQgVS1Cb290Pwo+IAo+IAo+IEZZSSwgVS1C
b290IGRvZXNuJ3Qgc3VwcG9ydCB0aGUgUlBpIFBDSS9OVk1lIGludGVyZmFjZSBiZWNhdXNlwqBv
ZiBhIGN1cnJlbnQgbGFjayAKPiBvZiBzdXBwb3J0IGluIHRoZSB1cHN0cmVhbSBrZXJuZWwuIFNv
IHdlIGFyZSBhY3R1YWxseSBtb3ZpbmcgYXdheSBmcm9tIFUtQm9vdMKgaW4gCj4gYSBwcmV2aW91
cyBwcm9qZWN0IHRvd2FyZCB1c2luZyB0aGUgcnBpIGZpcm13YXJlIHN1cHBvcnQgZm9yIGludGVn
cmF0aW5nIHdpdGggQS8gCj4gQiB1cGRhdGUgc3lzdGVtcy4gSSdtIG5vdCBzYXlpbmcgdGhhdCBp
dCBoYXMgdG8gYmUgZWFzeSBmb3IgcGVvcGxlIGxpa2UgdXMsIEknbSAKPiBqdXN0IGNoaW1pbmcg
aW4gd2l0aCB0aGUgZmFjdCB0aGF0IFUtQm9vdMKgaXNuJ3QgYWx3YXlzIHRoZcKgYmVzdCBhbnN3
ZXIgZm9yIGFsbCAKPiB1c2UgY2FzZXMuCgogIFdoYXQgSSBoYWQgaW4gbWluZCBpczogX3JlbW92
aW5nXyBVLUJvb3QgaXMgYWN0dWFsbHkgcXVpdGUgZWFzeSwgeW91IGp1c3QgbmVlZCAKdG8gY2hh
bmdlIHR3byBsaW5lcyBpbiB0aGUgY29uZmlnLnR4dCAoQUZBSVUpLiBUaHVzLCBpdCBtYWtlcyBz
ZW5zZSB0byBtZSB0aGF0IApvdXIgZGVmY29uZmlncyBzaG91bGQgYWxsIGhhdmUgVS1Cb290LCBh
bmQgdGhlIHJlYWRtZS50eHQgY2FuIGV4cGxhaW4gaG93IHRvIApidWlsZCB3aXRob3V0IFUtQm9v
dC4KCiAgUmVnYXJkcywKICBBcm5vdXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
