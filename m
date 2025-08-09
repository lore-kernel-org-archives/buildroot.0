Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E8BC87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 20:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BA8440BCA;
	Sat,  9 Aug 2025 20:59:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wi4zIA87M7Hu; Sat,  9 Aug 2025 20:59:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DB4140BC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DB4140BC0;
	Sat,  9 Aug 2025 20:59:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DA0B21B
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 20:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D12C40753
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 20:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2N2IxdbaRpFr for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 20:59:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 774AA40889
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 774AA40889
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 774AA40889
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 20:59:49 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-458b2d9dba5so19989735e9.1
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 13:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754773187; x=1755377987;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eJuY08MiE0DMGtaWdgvw71pD+M+u9gVzxZAuMrUwQxM=;
 b=nbqs+IQU481DxztlZqldi0bJhZBENmELwV30OeFUcqX8XgybzP4pzhm9hVB+R8go0z
 aQd/iMSSBnHkOQ/G9KDPBYoTAlZMwn/9qOVcf0UwVkad5N8ZsCRkqYqApki7r+28v57/
 ZGO/kx/8Tl07KCyEq5+C73W9zsZEzJBth0O3ZxLvxLrOYzhoqGNqGBcw+FR9VRZ9GRuK
 USlzzOcyNKk29qzFwp1nTLfl4Sf03Nsoeyh+3pIjmCXhMwgC4YavpBRttKRiwP/vXdGL
 BWZyVrh06pHIoonEf/tg+At4hTCilNjae1MgnySrnbfDMEBRPjOHVakQODiRCxreNg2f
 rZnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzYAp5wap5cyi73vhyDuAMYxRTGrgKlUEW0sobjgQ7+ZAsEEN/EffIMThnw9D22FJC7n9edLkWPNU=@buildroot.org
X-Gm-Message-State: AOJu0YyhKtGmTPyUIlMq4cV507AR1/9CP4tiKe2N1HMGRWmBkXrdrUIs
 bHrJaEdhHTX37R2n1d7XDemZY/7wgcl5QSUSbwCadzrYCUmRLRA/z0IS7HUTor18sr2yf3sPQCU
 mkOmM
X-Gm-Gg: ASbGncvy5yFY8OHodo/MZdEJf7rMR3UAUa+NAjlMZsbRGbB7J8e0V+JWsyZZuO2SeeR
 IsrD7xj+ZmwMzvuxNkuJaUtMsmi/nLHd/rWJMPr0K7246upqI8OKN8Hi0YCVuEIrfZ1fqhO5A47
 KIVc9ZpfXqDOh+VLwlnC8fWeWrfhRhoeLb8DgDu3NxqUiferZXmJA03vwjei3bMtxPC0cG6aq+g
 Ibb8TkPE8P68KMl+yUddwOj5Onfs8APTcj1O4YHmsJCvcT/iChxQts9KM0/OKWIzd9ZLahbntTj
 tsPduT5m400DfqsVb6nQWWKB3KeYjRDai5mJ81UVPNbcwhX4u+cDDPpUUwhDOT4gYxKVonjHVVb
 IO0zMd5pa+BVdYK7NmV0piaZDvlSVh9/AfOt60Ty+qfxPlFI/2hnIuhZ57BKmIHwMxEongRoKvj
 Ks3lZXS+SO57JQYqJn/Gb8cvSsM8ENO17hSTtOmEvyBTAGyG479kWGuIJcKOER
X-Google-Smtp-Source: AGHT+IEY7OKwpLxt7cblIajVM7dgt/pW+kyXKz3UYQOo2Jt29zxWljcaK1UUrlJa6EVgc9VYaR1hcA==
X-Received: by 2002:a05:600c:3b02:b0:456:475b:7af6 with SMTP id
 5b1f17b1804b1-459f4ea1fa8mr58177635e9.7.1754773187265; 
 Sat, 09 Aug 2025 13:59:47 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac51asm35709307f8f.1.2025.08.09.13.59.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Aug 2025 13:59:46 -0700 (PDT)
Message-ID: <6955632a-7621-406d-a4fa-9c530a62e096@smile.fr>
Date: Sat, 9 Aug 2025 22:59:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
References: <20250809175417.315091-1-thomas.perale@mind.be>
Content-Language: en-US
In-Reply-To: <20250809175417.315091-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754773187; x=1755377987; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eJuY08MiE0DMGtaWdgvw71pD+M+u9gVzxZAuMrUwQxM=;
 b=1KjgLRUSDG7EZMXLXZ3H5beilAa7QonPEnXien4/axcBsYK8d4VB+yyFR7UVCCagEt
 HceHnRhFoRrEEoXWqagns4qiy+FDTu0DUdxeCzzUpsf5xyH+gLkCCuotCzGBkr4x7L2s
 C8/wDAsYnJHJn2wewzn0yW+q96Iw6IWK/CORE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=1KjgLRUS
Subject: Re: [Buildroot] [PATCH] package/libapparmor: remove stale reference
 to patch 0001
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAwOS8wOC8yMDI1IMOgIDE5OjU0LCBUaG9tYXMgUGVyYWxl
IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBUaGUgQVVUT1JFQ09ORiB2YXJpYWJsZSB3YXMg
aW50cm9kdWNlZCBpbiBjb21taXQgWzFdIHdpdGggcmVmZXJlbmNlIHRvCj4gdGhlIHBhdGNoZXMg
dGhhdCBtb2RpZmllZCB0aGUgbTQgYW5kIE1ha2VmaWxlLmFtIGZpbGVzLgo+IAo+IFRoZSBjb21t
aXQgWzJdIHJlbW92ZWQgdGhlIGxhc3Qgc3VjaCBwYXRjaCBidXQgbGVmdCB0aGUgcmVmZXJlbmNl
IHRvIHRoZQo+IHBhdGNoIGFuZCB0aGUgQVVUT1JFQ09ORiB2YXJpYWJsZS4KPiAKPiBMYXRlciwg
Y29tbWl0IFszXSB1cGRhdGVkIHRoZSBtaXJyb3IgdG8gdGhlIGdpdGxhYiBVUkwgdGhhdCBubyBs
b25nZXIKPiBidW5kbGUgYSBwcmUtZ2VuZXJhdGVkIGBjb25maWd1cmVgIGZpbGUsIG1ha2luZyB0
aGUgZXhlY3V0aW9uIG9mCj4gQVVUT1JFQ09ORiBuZWNlc3NhcnkgYW55d2F5Lgo+IAo+IFRoaXMg
cGF0Y2ggcmVtb3ZlcyB0aGUgb2Jzb2xldGUgcmVmZXJlbmNlIHRvIHRoZSBwYXRjaCAwMDAxIHJl
bW92ZWQgaW4KPiBbMl0gdG8gYXZvaWQgYW1iaWd1aXR5IHdpdGggdGhlIG5ldyBwYXRjaCAwMDAx
IGludHJvZHVjZWQgaW4gY29tbWl0IFs0XS4KPiAKPiBbMV0gMDFhODJjMTQwMSBwYWNrYWdlL2xp
YmFwcGFybW9yOiBlbmFibGUgcHl0aG9uIGJpbmRpbmdzCj4gWzJdIDI3Y2QwYjUwMzMgcGFja2Fn
ZS9hcHBhcm1vcjogYnVtcCB0byB2ZXJzaW9uIDMuMC40Cj4gWzNdIDU2NDkyMDJkZGMgcGFja2Fn
ZS9saWJhcHBhcm1vcjogYnVtcCB0byB2ZXJzaW9uIDMuMS43Cj4gWzRdIDI2NDBmNWRjZDAgcGFj
a2FnZS9saWJhcHBhcm1vcjogZml4IGJ1aWxkIHcvIG11c2wKPiAKPiBTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+Cj4gLS0tCj4gIHBhY2thZ2UvbGli
YXBwYXJtb3IvbGliYXBwYXJtb3IubWsgfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRp
b24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJhcHBhcm1vci9saWJhcHBhcm1vci5t
ayBiL3BhY2thZ2UvbGliYXBwYXJtb3IvbGliYXBwYXJtb3IubWsKPiBpbmRleCBmYTU5ZmYyOTI0
Li5iMWM5YTk1MmYwIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGliYXBwYXJtb3IvbGliYXBwYXJt
b3IubWsKPiArKysgYi9wYWNrYWdlL2xpYmFwcGFybW9yL2xpYmFwcGFybW9yLm1rCj4gQEAgLTE2
LDcgKzE2LDYgQEAgTElCQVBQQVJNT1JfREVQRU5ERU5DSUVTID0gaG9zdC1iaXNvbiBob3N0LWZs
ZXggaG9zdC1wa2djb25mCj4gIExJQkFQUEFSTU9SX1NVQkRJUiA9IGxpYnJhcmllcy9saWJhcHBh
cm1vcgo+ICBMSUJBUFBBUk1PUl9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAgCj4gLSMgUGF0Y2gg
MDAwMSB0b3VjaGVzIE1ha2VmaWxlLmFtIGFuZCBtNCBmaWxlcwoKVGhhbmtzIGZvciB0aGUgZGV0
YWlsZWQgYW5hbHlzaXMhCgpVc3VhbGx5IHdlIHByZWZlciBhIHNtYWxsIGNvbW1lbnQgdG8gcmVt
ZW1iZXIgd2h5IHdlIGhhdmUgdG8gdXNlIEFVVE9SRUNPTkYuCgpXaGF0IGFib3V0OgoKIyBnaXQg
cmVwbywgbm8gY29uZmlndXJlCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gIExJQkFQUEFSTU9S
X0FVVE9SRUNPTkYgPSBZRVMKPiAgCj4gICMgTW9zdCBBcHBBcm1vciB0b29scyB3aWxsIHdhbnQg
dG8gbGluayB0byB0aGUgc3RhdGljIGxpYi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
