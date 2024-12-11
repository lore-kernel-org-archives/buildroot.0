Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0BDE7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 16:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 882D34091F;
	Wed, 11 Dec 2024 16:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUntNfhW1WMd; Wed, 11 Dec 2024 16:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6712A40928
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6712A40928;
	Wed, 11 Dec 2024 16:16:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A55A1ED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 16:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92F6B61112
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 16:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cA-7H51w0Rve for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 16:16:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8E41B60F35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E41B60F35
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E41B60F35
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 16:16:36 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-4361f796586so8245115e9.3
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 08:16:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733933794; x=1734538594;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dryvEHjGRy5ioZrxZPLLeuSfG+9FI3MegxmYAW8vzHo=;
 b=w93g+bZGwDsBQc4kSSDcxBbtaYomlRiVxkUuixrvsHs8+xcA7eUvfH/5BZOXKtTSXA
 g/TuYbMZdce7ZTGomwVvI3Wpq2hIZgToIIwCBmSYa6yukHEFyeCmZT80wUIsz8pRnJjD
 2wmbODeuIOqD+VrsWV/xucOCfaJA+FkzaIRBuWlDq4c/ZCfZ18yNWtFsA22WcrOUMj3Y
 QPvOco7pWv1p1V6eyizEKrN+qpXvCtjPE7vBakZs3FqCXhRy13odLuVkYeeUAjA3Cb42
 16oWAR55wmOvtigmWxYx/sWmv3vI2WRj+qVpk3dd94mXwn6AWwZ54+cWsP4Up7ryDi9X
 DsNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgEp7BH5k9XIyocQAUJA/yJAKFbqasMbX+xnmCf1LsM/a7+XBgF03Fn9YAL+XwwR9lba6/LBeFJzM=@buildroot.org
X-Gm-Message-State: AOJu0YzaJvkIfV6YnBk+YE4NXKP9EQXogtpdbqtgKiMWMtXuZ0Q5cKox
 jWSMFKI3k3xZlqonmfKYcCpbrgnZetWJL+Q6UlfPohII2eenM9PUjI9p5o+b/T0ayNI2GX7c8lE
 OLYeaFw==
X-Gm-Gg: ASbGnctMQWatjDtDCZghki997vj3vdDoh/BsTc+q/XOIm8YoD+9A+c02O0L1AmeRpCk
 IuF3oByQhri1DRNg8KLUaPrE2dfikHOKGHUCYsKev7FpwtE7eHWAuFIX5bGAfjcVUoVeS14Qjts
 67XdfkkBEhkjPNw1zKW/NctnjkoYw7nFSjBlQ3K6+0Ytce4I1hmDz/f9YWhmVafwcxjDOvyhLiN
 jWnTbyoUkDx3JSbqLXgy6pAVBWdVvZJ2SEdghHyiWgsQJOoYipv51sjB6MoR2v4zN2zaYZhaM/G
 tL/ms+XN01AqLSJyk6NiYA/a8jjhouNVjp1EbEOP/A==
X-Google-Smtp-Source: AGHT+IGC/uVWMJ7q+qQMiifm+XtLMEdNV49EjrmoeSGAdnZwkv7wqnWPaZ1QDa9xi24jHDRx5Kyjqg==
X-Received: by 2002:a05:600c:1d20:b0:434:fec5:4ed1 with SMTP id
 5b1f17b1804b1-4361c42e66bmr28366825e9.26.1733933794420; 
 Wed, 11 Dec 2024 08:16:34 -0800 (PST)
Received: from [10.5.90.20]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4361b7a46c1sm32391015e9.33.2024.12.11.08.16.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 08:16:34 -0800 (PST)
Message-ID: <bb9013c4-af77-44c4-b1ea-8a3d4f2ef6eb@smile.fr>
Date: Wed, 11 Dec 2024 17:16:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20241117124504.539423-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20241117124504.539423-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1733933794; x=1734538594; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dryvEHjGRy5ioZrxZPLLeuSfG+9FI3MegxmYAW8vzHo=;
 b=zo4EJdBojGkw2nv8VrxAqzQx+fl24Iqigb5+TPD3Nj689oh7fXIsJ6xfj8aJMAaS56
 gW4vCkaiobK3TEq0AI3nj0H7UtJs29xfdAIgZSHbE5trWbDtD5pt1pxt+D8XB3vE6tRY
 xJq72tpLZEnA8dPxKUMtw7pAQdGL0C2fspBD8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=zo4EJdBo
Subject: Re: [Buildroot] [PATCH next 1/1] package/freeipmi: update _SITE to
 use BR2_GNU_MIRROR
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

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAxNy8xMS8yMDI0IMOgIDEzOjQ1LCBKdWxpZW4gT2xpdmFp
biBhIMOpY3JpdMKgOgo+IFRoZSBmcmVlaXBtaSBwYWNrYWdlIGlzIGRpc3RyaWJ1dGVkIG9uIHRo
ZSBHTlUgcHJvamVjdCBzZXJ2ZXJzLgo+IFNlZSBbMV0gYW5kIFsyXS4gQnVpbGRyb290IGhhcyB0
aGUgQlIyX0dOVV9NSVJST1IgY29uZmlndXJhdGlvbgo+IHdoaWNoIGNhbiBiZSB1c2VkIGZvciB0
aGF0IHB1cnBvc2UuIFNlZSBbM10uCj4gCj4gRm9yIGNvbnNpc3RlbmN5IHdpdGggYWxsIG90aGVy
IEdOVSBwYWNrYWdlcywgdGhpcyBjb21taXQgdXBkYXRlcwo+IHRoZSBfU0lURSB0byB1c2UgQlIy
X0dOVV9NSVJST1IuCj4gCj4gWzFdIGh0dHBzOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvZnJlZWlw
bWkvZG93bmxvYWQuaHRtbAo+IFsyXSBodHRwczovL3d3dy5nbnUub3JnL3ByZXAvZnRwLmh0bWwK
PiBbM10gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi8y
MDI0LjA4LjIvQ29uZmlnLmluI0wyODYKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFp
biA8anUub0BmcmVlLmZyPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJk
cywKUm9tYWluCgo+IC0tLQo+ICBwYWNrYWdlL2ZyZWVpcG1pL2ZyZWVpcG1pLm1rIHwgMiArLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9mcmVlaXBtaS9mcmVlaXBtaS5tayBiL3BhY2thZ2UvZnJlZWlwbWkv
ZnJlZWlwbWkubWsKPiBpbmRleCBlMjhmNjNmNzE1Li5mYmJmZDUzNmU0IDEwMDY0NAo+IC0tLSBh
L3BhY2thZ2UvZnJlZWlwbWkvZnJlZWlwbWkubWsKPiArKysgYi9wYWNrYWdlL2ZyZWVpcG1pL2Zy
ZWVpcG1pLm1rCj4gQEAgLTUsNyArNSw3IEBACj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4g
IAo+ICBGUkVFSVBNSV9WRVJTSU9OID0gMS42LjE0Cj4gLUZSRUVJUE1JX1NJVEUgPSBodHRwczov
L2Z0cC5nbnUub3JnL2dudS9mcmVlaXBtaQo+ICtGUkVFSVBNSV9TSVRFID0gJChCUjJfR05VX01J
UlJPUikvZnJlZWlwbWkKPiAgRlJFRUlQTUlfTElDRU5TRSA9IEdQTC0zLjArLCBCU0QtbGlrZSAo
c3VuYm1jKQo+ICBGUkVFSVBNSV9MSUNFTlNFX0ZJTEVTID0gXAo+ICAJQ09QWUlORyBDT1BZSU5H
LmJtYy13YXRjaGRvZyBDT1BZSU5HLmlwbWljb25zb2xlIENPUFlJTkcuaXBtaS1kY21pIFwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
