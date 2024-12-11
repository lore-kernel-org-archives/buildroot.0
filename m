Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFBBE7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 09:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FF2C60A7B;
	Wed, 11 Dec 2024 09:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCk5aTDzQU2s; Wed, 11 Dec 2024 09:57:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94F0C60AE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94F0C60AE3;
	Wed, 11 Dec 2024 09:57:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F141ED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 09:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F72D40652
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 09:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xGp8CHHO_q_a for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 09:57:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A142B406C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A142B406C3
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A142B406C3
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 09:57:04 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so3085115e9.1
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 01:57:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733911022; x=1734515822;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3VzmHlzYhPzODyWCvWPNRuUEUL/voAKxUmqWihlDEWw=;
 b=Y3z66te6q5QMKOLnnHykyakVfXqytL7RLBK/fsEZ5PbUt6Gwo7T8BxPAtBtVTbY0j8
 hMzRzEi5Hszawy64eCm5XfIxAGkMLWKLNpmY2Lew7ZeqprhxqKu8Q9ENb+tHRvzoBRX7
 9VkhNYrcFvzmau6RYlrbfpG8Fgjr7NYeYxOCrTnXt9m3d8N6f0LKy3o81CaWXNVrqR8w
 UYGy1Htran1FNI75hxs1lHF5mnhYDBRZ7GSuN0sUJNHwTHK0x5JcAd+ZrUephRxgcN+O
 r5P6ieHIJ0jQITKEg5LrMlPxU0tIXaEO7PQuKQ7cqTbOkrFg8uxCJK8eBSeEBSCdchpX
 BAQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbH9GjL+lbgF/KHS81ZDw5YbGFs8ab5K25cyF90oYamBgYjBanSqGY0yliUwyQuV7zw76vPM8L1Sg=@buildroot.org
X-Gm-Message-State: AOJu0YyWnsGoZL8InC9GclkpqtK+jssJnPG2FSuOO0+3c1PBJvBLl3mo
 V3bJVu+21MxO6XofGG0KuQZYRj6Rdm+xe16GCpLnOEIxFkapUWcIs9BGsxu1f08=
X-Gm-Gg: ASbGncvrQDguiecN9UUh7Mbb3Tf6ABmdntU5/d9MLKJx4uTOKidYdLuMz5JD0jW2AxF
 9TopOo8xjghp1bU9oFj8Vwrq2jVDB8bVnMG2rSetrlvILmpLF7rol2UOF/j9DjyQX+IJdB6EYuh
 A1RczTy6by/PmMODrwfil4ge/Hk8OT3gdlsvyTF1gGmHeRl0Bf8LPjetlNGM671Y1rZixBNpkO9
 UoxSzuSRmlEoJ2EcObDy+1O2idy/D0zXU9vKBDy7cmyRXugAgpPayeRtxg/iSFBK7v0BhOP9JDO
 MxghL3WwZlGrH2IO0VwxBL2VzpCBQFx97fnc0GoUKQ==
X-Google-Smtp-Source: AGHT+IFukAaHVnMR0M97ogWItinrjahBoa9g87b2wsHbIRrKf7t6CNItgSUOsKga/hRgztZEtVFmTw==
X-Received: by 2002:a05:600c:1c14:b0:434:fff1:1ade with SMTP id
 5b1f17b1804b1-4361c3aa6d3mr15176655e9.13.1733911022206; 
 Wed, 11 Dec 2024 01:57:02 -0800 (PST)
Received: from [10.5.90.20]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436199f6896sm32712165e9.14.2024.12.11.01.57.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 01:57:01 -0800 (PST)
Message-ID: <998274a1-2a12-4929-83cc-d866a89a1e93@smile.fr>
Date: Wed, 11 Dec 2024 10:57:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan Brattlof <bb@ti.com>, buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi <X15000177@gmail.com>
References: <20241210-uboot-bump-v1-1-baeb59feef61@ti.com>
Content-Language: en-US
In-Reply-To: <20241210-uboot-bump-v1-1-baeb59feef61@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1733911022; x=1734515822; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3VzmHlzYhPzODyWCvWPNRuUEUL/voAKxUmqWihlDEWw=;
 b=p8h53q/gvrTpb1RfKOH3SYAGryGmMVZBtkuutEo8exDxxV9BADoiMSYYRQJYC6Pakj
 P9tKJ8Aux6kwPngUcXJuL1nG1D5eyeCrzkqXUo0A70o7q0UlEYtw/n+W79AWHZSAUQk9
 5StW14NQxtZmJmkbzYHrIe+mcf3WCAkPfSIE4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=p8h53q/g
Subject: Re: [Buildroot] [PATCH] boot/ti-k3-r5-loader: add host-gnutls to
 dependencies
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

SGVsbG8gQnJ5YW4sIEFsbCwKCkxlIDExLzEyLzIwMjQgw6AgMDA6MzIsIEJyeWFuIEJyYXR0bG9m
IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBOZXdlciB2ZXJzaW9ucyBvZiBVLUJvb3QgbWF5
IHJlcXVpcmUgdGhlIEdudVRMUyBsaWJyYXJ5IHRvIGJlIGluc3RhbGxlZAo+IG9uIHRoZSBob3N0
IG1hY2hpbmUgZHVyaW5nIHRoZSBFRkkgY2Fwc3VsZSBjcmVhdGlvbiBwaGFzZSBvZiB0aGUgVS1C
b290Cj4gYnVpbGQuIEFkZCBob3N0LWdudXRscyB0byB0aGUgbGlzdCBvZiBkZXBlbmRlbmNpZXMu
CgpZb3VyIHJlcGx5IFsxXSBhYm91dCBta2VmaWNhcHN1bGUgdG9vbCB1c2VkIHRvIGJ1aWxkIHRp
Ym9vdDMuYmluIGltYWdlcyB3YXMKcHJvYmFibHkgYSBnb29kIGluZm8gdG8ga2VlcCBpbiB0aGUg
Y29tbWl0IGxvZy4KCkluZGVlZCwgc2luY2UgdS1ib290IDIwMjQuMTAgdGhlIG1rZWZpY2Fwc3Vs
ZSBpcyBub3cgbWFuZGF0b3J5IG90aGVyd2lzZSBiaW5tYW4KZmFpbCAodGVzdGVkIHdpdGggdGhl
IGJlYWdsZWJvYXJkYWk2NCBkZWZjb25kaWYgd2l0aCB1LWJvb3QgMjAyNC4xMCk6CgogIEJJTk1B
TiAgLmJpbm1hbl9zdGFtcAogIEltYWdlICdjYXBzdWxlLXRpYm9vdDMnIGhhcyBtaXNzaW5nIGJp
bnRvb2xzIGFuZCBpcyBub24tZnVuY3Rpb25hbDogbWtlZmljYXBzdWxlCgogIEltYWdlICdjYXBz
dWxlLXN5c2Z3JyBoYXMgbWlzc2luZyBiaW50b29scyBhbmQgaXMgbm9uLWZ1bmN0aW9uYWw6IG1r
ZWZpY2Fwc3VsZQoKICBTb21lIGltYWdlcyBhcmUgaW52YWxpZAoKSSdtIG5vdCBzdXJlIHdlIHdh
bnQgdG8ga2VlcCB0aGUgYWJpbGl0eSB0byBkaXNhYmxlIGhvc3QtZ251dGxzIGRlcGVuZGVuY3kg
Zm9yCnRpLWszLXI1LWxvYWRlciBzaW5jZSBvbmx5IHZlcnNpb24gdXAgdG8gMjAyNC4xMCBkb2Vz
bid0IG5lZWQgbWtlZmljYXBzdWxlIHRvb2wKZm9yIFRJIEszIFNvQ3MuCgpbMV0KaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjQxMDI0MjIzODQzLmQyaHZwcXg2emthenVrZmlA
YnJ5YW5icmF0dGxvZi5jb20vCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQnJ5YW4gQnJhdHRsb2YgPGJiQHRpLmNvbT4KPiAtLS0KPiAgYm9vdC90aS1rMy1yNS1s
b2FkZXIvdGktazMtcjUtbG9hZGVyLm1rIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1s
b2FkZXIubWsgYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPiBpbmRl
eCBlNDI2ZjAzOWUwMjFkLi5kYjVjM2NkYWY4YjY1IDEwMDY0NAo+IC0tLSBhL2Jvb3QvdGktazMt
cjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawo+ICsrKyBiL2Jvb3QvdGktazMtcjUtbG9hZGVy
L3RpLWszLXI1LWxvYWRlci5tawo+IEBAIC00Niw2ICs0Niw3IEBAIFRJX0szX1I1X0xPQURFUl9E
RVBFTkRFTkNJRVMgPSBcCj4gIAlob3N0LXBrZ2NvbmYgXAo+ICAJJChCUjJfTUFLRV9IT1NUX0RF
UEVOREVOQ1kpIFwKPiAgCWhvc3QtYXJtLWdudS10b29sY2hhaW4gXAo+ICsJaG9zdC1nbnV0bHMg
XAo+ICAJaG9zdC1vcGVuc3NsIFwKPiAgCWhvc3QtcHl0aG9uMyBcCj4gIAlob3N0LXB5dGhvbi1q
c29uc2NoZW1hIFwKPiAKPiAtLS0KPiBiYXNlLWNvbW1pdDogY2YzZGQzZTM2NWQ1Mjg3Y2VjZjA4
YTFiMzUzOTQyMzZiZTI5NzE0OAo+IGNoYW5nZS1pZDogMjAyNDEyMTAtdWJvb3QtYnVtcC0yZmEz
ZWYwNzY2OWYKPiAKPiBCZXN0IHJlZ2FyZHMsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
