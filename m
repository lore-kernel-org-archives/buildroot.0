Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2073FC71141
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 12:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E707680DA0;
	Sat, 14 Jun 2025 12:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2dhjI4zmz0l; Sat, 14 Jun 2025 12:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36F8F81008
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36F8F81008;
	Sat, 14 Jun 2025 12:58:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CBA691A4
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 12:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1B0D607B2
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 12:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACGqkVUvLyqO for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 12:58:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 035456080F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 035456080F
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 035456080F
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 12:58:48 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a4fd1ba177so1760496f8f.0
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 05:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749905927; x=1750510727;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xRhv6tMDseTQJPsmIOMw47B0jWT73oQGzlTGhU7kjT0=;
 b=JUkJHDSEqv4yARChVqC4cLr5i6X+4IHh9oEOl1kYwQmSghXbvonCEw5HN9Xckr3yXv
 GF/I9pN42t2e/4rBDU8pZyGGD/h31AW+MAP9QXvHwyKzW87mW/WB2y/LVwLIJTfoG/gC
 y+maKzD2609x+SNxtB+V76B/GcFdr9HrY3KtR4kE3LeaIx8baB2ChL3eXCkVEC8Z75CA
 wO+FMecdevKjIMb1rhH0E6c4l4PU4OVKOimo2ZyBU1KUaJ0jSP63ilboXRiL4wPOe8g7
 OmL53GTWNuin37kqVHkbybtS8Y34aW/Qs9Wy+KJv2Eea/d0L2lWitW+gc+hbVjq0Zjdd
 tmHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9SXwWJQacjrJdQZxBiQtlF04qEtX9akJQObPpzZ9/SdX5P9f/LvnaDKeEZgWN0Gyoy1fmrSTLi9c=@buildroot.org
X-Gm-Message-State: AOJu0YwxITwVDUSPnFBljjHNyWcPSc9Z521sqCnpBBVUwGi/O5PjbIfV
 6ppW4C7+Ul2jPDWLaQFlKoO1jgmjasPfCawg9MIO0zwXjLYZPvYllekrN/0mwzkFsOU=
X-Gm-Gg: ASbGnctJxa/VCztyaHKFAh7scHjqEwCeT1y8DQHH2mQGsjdnZqkypL5NNN1R2xM4Edi
 zJRwVe8Okeis+asVt3mpYrRWI1l72liJ3mPqo7Ohpszq3AUdZdjJk7/7g1HUYWKX6r2N/0QQXem
 VzqERinphNiVLqdq4GBfKMIVlSOxyXnOmakJYBuicqmH1WFWgQPtbUbKpDXOqnRVZ/+NYYpkw2B
 9VkIxhQyUdx9h4YqAqYf5D3+nSyy2kS1EwjzWnIKK/E1Sd5AWV4VS9VOD3ItqTWwrLnQw9WYgy9
 vGeigdNPzIy/tKXNoXZ9xBYEZnXNlQ0JaNomR66H1Myl12ocuBrwX+LpQ5dv6/sIMyPd5ld4GE+
 nqEg2vGbKdsQryW2jCdTH9/ZXvlWGlydtleg38sbBf1NkjeXUSreWXzbbMtWutKY6vP7PGUwi+3
 aGcvOGW+ludfBEz1mAAZVoxEbA
X-Google-Smtp-Source: AGHT+IHiUM7i+gNpri0l7A/tvZcoJRV91w8QMwflxoi7p31c10b6vhKufSJrhfC0al409ZxtocKbig==
X-Received: by 2002:a05:6000:4025:b0:3a4:dfbe:2b14 with SMTP id
 ffacd0b85a97d-3a572e6817cmr2683354f8f.16.1749905926937; 
 Sat, 14 Jun 2025 05:58:46 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5689e5f3dsm5181784f8f.0.2025.06.14.05.58.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Jun 2025 05:58:46 -0700 (PDT)
Message-ID: <8f36c186-25b0-4db9-ba64-3d02eea3936e@smile.fr>
Date: Sat, 14 Jun 2025 14:58:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Dick Olsson <hi@senzilla.io>
References: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
 <20250607-loongarch-v2-4-90bc4fda9080@flygoat.com>
Content-Language: fr
In-Reply-To: <20250607-loongarch-v2-4-90bc4fda9080@flygoat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749905927; x=1750510727; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xRhv6tMDseTQJPsmIOMw47B0jWT73oQGzlTGhU7kjT0=;
 b=G75rFG5ic/uA0r3vQmhjTd87v9a9mr1L2IA2tLzqERoR0bQrb+aIOdduja+8LjH+ev
 67dAYQSfSUK0Syp9kHP8B1e2s7AwhB+o7dCVQeaDrCxYn71C08qPj86Ev32HJ6bKPt83
 O47u7Z4HRcFH6W/jEX4Puuw4cNYz5UJABCF5o=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=G75rFG5i
Subject: Re: [Buildroot] [PATCH v2 4/9] package/musl: Enable LoongArch64
 support
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

SGVsbG8gSmlheHVuLCBBbGwsCgpMZSAwNy8wNi8yMDI1IMOgIDIwOjEyLCBKaWF4dW4gWWFuZyBh
IMOpY3JpdMKgOgo+IG11c2wgaW50cm9kdWNlZCBMb29uZ0FyY2g2NCBzdXBwb3J0IGluIDEuMi41
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNv
bT4KClJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KCkJl
c3QgcmVnYXJkcywKUm9tYWluCgoKPiAtLS0KPiAgcGFja2FnZS9tdXNsL0NvbmZpZy5pbiB8IDEg
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9tdXNsL0NvbmZpZy5pbiBiL3BhY2thZ2UvbXVzbC9Db25maWcuaW4KPiBpbmRleCBhNmUy
YWYwNTRjMzU0ZmIxMDc4ZmY5MThmMTA1OGRhMzM2N2E0NmEwLi43MDQ3NTMyNmY1YjI5ZjRiOTAz
ZTkxZTJiZTlkNTJmM2I1NDc5MDdkIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbXVzbC9Db25maWcu
aW4KPiArKysgYi9wYWNrYWdlL211c2wvQ29uZmlnLmluCj4gQEAgLTUsNiArNSw3IEBAIGNvbmZp
ZyBCUjJfUEFDS0FHRV9NVVNMX0FSQ0hfU1VQUE9SVFMKPiAgCWRlZmF1bHQgeSBpZiBCUjJfYXJt
Cj4gIAlkZWZhdWx0IHkgaWYgQlIyX2FybWViCj4gIAlkZWZhdWx0IHkgaWYgQlIyX2kzODYKPiAr
CWRlZmF1bHQgeSBpZiBCUjJfbG9vbmdhcmNoNjQKPiAgCWRlZmF1bHQgeSBpZiBCUjJfbTY4a19t
NjhrCj4gIAlkZWZhdWx0IHkgaWYgQlIyX21pY3JvYmxhemUKPiAgCWRlZmF1bHQgeSBpZiBCUjJf
bWlwcwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
