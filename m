Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09340C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 12:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1D7C41308;
	Sun, 16 Feb 2025 12:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DZGB2a5l4MK0; Sun, 16 Feb 2025 12:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 991414130F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 991414130F;
	Sun, 16 Feb 2025 12:39:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C960172
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD59380C2E
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDTyGkeoTz5F for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 12:39:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9CCE880C49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CCE880C49
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9CCE880C49
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 12:39:29 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4396e9ee133so5499225e9.0
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 04:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739709567; x=1740314367;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xfnsX1SoFaC+0TbLu2d0nwhWzlQArKX1XJY2CFQgmTc=;
 b=lMXSKEvLK8PEfrONAy21kCZdqgcizqqL4Q4hgI+tFO//gKusUx+R6FbHbQdZg6//C8
 EkpzG82vV41pl+g1Xk64JeHUKjVI5mxF3cBE2w2LestGghBBRiq64NExu9F5A8uegGTw
 LLyNNsqHfcKoKBIrB4znWo21D46X9KtcCDUxeQpDC0srFU+PmcBMRlGM78GwcdKhBQdW
 cVxJ43AIt/eY6t29sxMgYrzWIDvk8tgRtQ/B6zALG+e7uxTNwuCPDFN19xKLbNWJsw8P
 /qpxwjB95eWZf/KynhcEyzAqxVd8RfqlMxB9TB6SnZdOWX/5DA6RAh8ibwWkT70BNLBo
 E/4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ1yumf1hbpLiUg+I0Lhn4ImEdZehFrLCSz18mZpBOvwFQyxJquQ6zN+b281lB8cpdw9USwYuVSKM=@buildroot.org
X-Gm-Message-State: AOJu0Yyxzvn0XfhQ5OhxMW8koYdmHWGhwCl0Fz3SRBOh3k/mTsESJKaK
 esij16W8BU+hcfjzr6T/mfXIGBRrebXx8xCdze3Scm6QtqubqVCwHAuK0zvKQWwPb3LzqrOBkGv
 X
X-Gm-Gg: ASbGnctKWvKVzTX0jlyw4eY/nX+YuLphttJ18iR53JHE3WwgL6GuorgfPXGNkr9Sa46
 iOOzmCRhIGB6xdyW0KHKhYfVtQ84o0ihNNTWXPyU16MW7AqZZb6e+2B1TqGxGDxRPD6OhXPxNKe
 jczXdjQbKhOTYCUXDxO74SpTozv9oMYz58BQ3I3LTU1RdxQOtRk5Y5oeO4a7HFIlSWGKU8Kdjen
 nGFZVgPqqvhCirdAYC7HLgkl4ELVkYW3XP0h4XtE4klVTpHe1tWNclZ5poIkn9GsW0CxA4LpPGI
 L4MaFt2l3nMml7JvNBzifw4CZeJClyRzg3nYFTCiO/PO6NlHvnT7NCVeSHhsyA2GNvn4P2J3//W
 4ApAxfLnK1K/nLXLm8i6FvUjGRdUyv4pT8h/nQdWdmEvWjg==
X-Google-Smtp-Source: AGHT+IFbEoA98xl7LCdPJS8zmxEWGgAT8CrOLJzQqLT15P8JdtA5O3GT7AdroKNuBDLl8g+Wad8I+g==
X-Received: by 2002:a05:6000:711:b0:38f:23c4:208c with SMTP id
 ffacd0b85a97d-38f24d74b2emr14619047f8f.18.1739709567079; 
 Sun, 16 Feb 2025 04:39:27 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f85c2sm9889158f8f.91.2025.02.16.04.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2025 04:39:26 -0800 (PST)
Message-ID: <67e216f7-9783-41f5-9c55-6fa224a7aa22@mind.be>
Date: Sun, 16 Feb 2025 13:39:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Frager, Neal" <neal.frager@amd.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>, "romain.naour@smile.fr"
 <romain.naour@smile.fr>, "Simek, Michal" <michal.simek@amd.com>
References: <20250214165402.1128194-1-neal.frager@amd.com>
 <20250214225831.23731a2d@windsurf>
 <SA1PR12MB561562D664DF42BDA071B195F0F92@SA1PR12MB5615.namprd12.prod.outlook.com>
 <5649b489-e2c5-4504-a928-58409a547768@mind.be>
 <SA1PR12MB56150FD6D7047F9A6929919EF0F82@SA1PR12MB5615.namprd12.prod.outlook.com>
Content-Language: en-GB
In-Reply-To: <SA1PR12MB56150FD6D7047F9A6929919EF0F82@SA1PR12MB5615.namprd12.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739709567; x=1740314367; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xfnsX1SoFaC+0TbLu2d0nwhWzlQArKX1XJY2CFQgmTc=;
 b=WrDXK2MyXs8WI6v8GhHRe3wpxIAiDGmyrosNsywMvNM7+JshuvOwEfgaet4cMT1v5A
 p9FGvhaLAjm0oUGPTrGnov4XI5B6RzWtnkFnOnYTVsrdQC8tK8pbKpRUxmantgnBengv
 BcW6WrsUSOTmim3oM4fEfIXzCH58jM9KnJGlgjwSIPN8IZTL3ZGzsuR8p03qaOCseC25
 Xlj68pkGhQUoAM04SEfDm/GoK6L331LXqP9ZfXigTpDozjnt/yTgRCNe8tyNvC0CK7H9
 1x45TCFJOYMYsG2uzq5MEZkzZcj761WKUwzS5vj3SN2iWsYATkUlKfA65Idfafi9d5ug
 8FWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WrDXK2My
Subject: Re: [Buildroot] [PATCH v2 1/4] package/binutils-bare-metal: add
 multiple tuple support
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

CgpPbiAxNi8wMi8yMDI1IDEzOjIyLCBGcmFnZXIsIE5lYWwgd3JvdGU6Cj4gSGVsbG8gQXJub3V0
LAo+IAo+PiBIZWxsbyBUaG9tYXMsCj4+IAo+Pj4gSGVsbG8gTmVhbCwKPj4gCj4+PiBUaGFua3Mg
Zm9yIHlvdXIgd29yayBvbiB0aGlzIHRvcGljLiBPdmVyYWxsLCB0aGUgYXBwcm9hY2ggeW91IGhh
dmUKPj4+IHRha2VuIGlzIGV4YWN0bHkgd2hhdCBJIGhhZCBpbiBtaW5kLCBzbyB0aGF0J3MgdmVy
eSBnb29kLiBJIG9ubHkgaGF2ZQo+Pj4gc29tZSBpbXBsZW1lbnRhdGlvbiBkZXRhaWxzIHRvIGNv
bW1lbnQgb24gYmVsb3cuCj4+IAo+Pj4gT24gRnJpLCAxNCBGZWIgMjAyNSAxNjo1Mzo1OSArMDAw
MAo+Pj4gTmVhbCBGcmFnZXIgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+
IHdyb3RlOgo+IFtzbmlwXQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC0tZGlzYWJsZS1pbml0ZmluaS1hcnJheSBcCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLS1kaXNhYmxlLW11bHRpbGliIFwKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtLWRpc2FibGUtd2Vycm9yOyBcCj4+IAo+Pj4gSSB0
aGluayB0aGUgZmluYWwgc2VtaS1jb2xvbiBoZXJlIGlzIG5vdCBuZWVkZWQuCj4+IAo+PiBXaXRo
b3V0IHRoZSBzZW1pLWNvbG9uLCBJIGdldCB0aGUgZm9sbG93aW5nIGNvbmZpZ3VyZSBlcnJvcjoK
Pj4gCj4+IGNvbmZpZ3VyZTogV0FSTklORzogeW91IHNob3VsZCB1c2UgLS1idWlsZCwgLS1ob3N0
LCAtLXRhcmdldAo+PiBjb25maWd1cmU6IGVycm9yOiB1bnJlY29nbml6ZWQgb3B0aW9uOiBgLXAn
Cj4+IAo+PiBJdCBzZWVtcyB0aGF0IHRoZSBsb29wIHdyYXBzIGFyb3VuZCB0aGUgbmV4dCBta2Rp
ciBpbnN0cnVjdGlvbiB3aXRoIHRoZQo+PiBjb25maWd1cmUgdW5sZXNzIHRoZSBpbnN0cnVjdGlv
bnMgYXJlIHNlcGFyYXRlZCB3aXRoIGEgc2VtaS1jb2xvbi4KPj4gCj4+IEhvd2V2ZXIsIHlvdSBh
cmUgY29ycmVjdCB0aGF0IHRoZSBzZW1pLWNvbG9uIGlzIG5vdCBuZWVkZWQgZm9yIHRoZQo+PiBi
dWlsZCBhbmQgaW5zdGFsbCBzdGVwcyBzaW5jZSB0aGVzZSBhcmUgc2luZ2xlIGluc3RydWN0aW9u
IGxvb3BzLgo+IAo+PiDCoFRoYXQgc2hvdWxkbid0IG1ha2UgYW55IGRpZmZlcmVuY2UgdGhvdWdo
IC0gdGhlIG5ld2xpbmUgYW5kIHRoZSBsZWFkaW5nIHRhYiAKPj7CoHRlbGwgbWFrZSB0aGF0IHRo
aXMgaXMgYSBuZXcgY29tbWFuZC4gSXQgc2hvdWxkbid0IG1ha2UgYSBkaWZmZXJlbmNlIHRvICdt
YWtlJwo+PsKgaWYgdGhlcmUgYXJlIG9uZSBvciBtb3JlIGNvbW1hbmRzIG9uIHRoZSBsaW5lLgo+
IAo+PsKgQWxzbywgd2hlcmUgZG9lcyB0aGF0ICctcCcgZXZlbiBjb21lIGZyb20/IEkgZG9uJ3Qg
c2VlIGl0IGFueXdoZXJlIGluIHRoZQo+PsKgY29uZmlndXJlIGNvbW1hbmRzLi4uCj4gCj4gSSBh
Z3JlZSBpdCBzaG91bGQgbm90IGJlIG5lZWRlZC4KPiAKPiBCdXQgaWYgeW91IGxvb2sgYXQgdjMg
b2YgdGhpcyBzZXJpZXMgYW5kIHJlbW92ZQo+IHRoZSBzZW1pLWNvbG9uIGZyb20gdGhlIGVuZCBv
ZiB0aGUgY29uZmlndXJlCj4gY29tbWFuZCwgeW91IHdpbGwgc2VlIHRoaXMgZXJyb3Igd2l0aCB0
aGUgLXAKPiBzZWVtaW5nIHRvIGNvbWUgZnJvbSB0aGUgbWtkaXIgY29tbWFuZAo+IHdoaWNoIGlz
IHRoZSBmaXJzdCBjb21tYW5kIHRvIHJ1biBpbiB0aGUgbmV4dAo+IGl0ZXJhdGlvbiBvZiB0aGUg
bG9vcC4KCiAgVGhlIHRyYWlsaW5nIFwgcHV0cyB0aGUgdHdvIGNvbW1hbmRzIG9uIHRoZSBzYW1l
IGxpbmUuIEZvciB0aGUgb3RoZXIgdHdvIHlvdSAKZGlkbid0IGFkZCBhIHRyYWlsaW5nIGJhY2tz
bGFzaCBzbyBpdCdzIGRpZmZlcmVudCBsaW5lcy4uLgoKICBDYW4gYmUgZml4ZWQgd2hpbGUgYXBw
bHlpbmcuCgogIFJlZ2FyZHMsCiAgQXJub3V0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
