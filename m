Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A65BE7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 14:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA4D781DE6;
	Wed, 11 Dec 2024 14:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMhirb5Ye4Op; Wed, 11 Dec 2024 14:07:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7BFC82102
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7BFC82102;
	Wed, 11 Dec 2024 14:07:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 392A9ED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 14:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 196CB6101A
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 14:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlEtDRMk1yez for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 14:07:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AF44B6109A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF44B6109A
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF44B6109A
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 14:07:01 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-43618283d48so11168885e9.1
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 06:07:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733926019; x=1734530819;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Q7cLjOqKkuJgYe3uKXEs1VUoaE7Cxr28a1xGmVvUhE=;
 b=NG/ScBfpHRegP7xDfP0dD75yfqMYZ60vOtOpEVQmsCJ8H4lwfAdVhl5G7ESc92dxcj
 1B0pVzrARNoL+Tb8b7Ct8ExNCWnvyWiQTx21LJl0FSmCtkGvlYFuL0Y1hBCPvBpbzZgf
 z70XiC6CrD0bCqlit/pFmgIkKztQ71fJtQUsfOxhQnQvNry1Cz3Du7ac7IkI29AszHSA
 ku7jaeY0DrohgTZRcXks1io4ieLqLWrDJ7Y8Vbnh8hNuzXQPN/gkKEFAOB0vf5C0p/pR
 KyT3qwfxtieboL2L6EkEKAQ2FIgBpkG3SNwCpSFv+VKmorAo/1KyZzlLC8vwTwZ6kos9
 sYog==
X-Forwarded-Encrypted: i=1;
 AJvYcCU86EQngWIo9LbmoPXUNd3N2IY9cyuVnAgRMkN6uz006FNyTjj7hj1NnBQPfGWzLPLmxOUE6ZXXlVI=@buildroot.org
X-Gm-Message-State: AOJu0YyTgIaJlpKjRAYzXMbZ9ewTW/RT7oqNVuX3ndc6oRjGXHIjWSH4
 8DrYBRzhBs0aqydQ9OI2IVPS6KH5tDhHzKt0ljj/YB8G/QrkKZ2NDZSqAN6OCgc=
X-Gm-Gg: ASbGncvSJIWFrG3YC0PXPRjJbfM9CQqf2a7xRETuNi3nAEb/lhuOEQNOt6YY4BK1pmp
 QG6A2+Bgo2eBq68DLTOJvye7VVQDkb9XTfjPfkSyKZF9rclC+q3fi8v3zqmmPDfFgdWkXHCQu7t
 xKiTEc2TrdufDduCzRp6+gZbA2Ev1p9ww+GiHGImnUZUZwCa/0SEpkjTAKYd6ZyuyQEz2SE40HI
 7vSSnAfLOtLjgGqY24B//xBGhmupph1RPoRrTG2fbfIUQGxTCIVi7wBE2RHcRxgRVOz9GFcmAln
 FPmLGL4MYG+0ctfyklPvfwcoxI+O8yZOvQ/Ut72vPg==
X-Google-Smtp-Source: AGHT+IFu2UkMkxW7BVvt6A13l5ArD/WkmPjvOrmWkhzS6S45QO9Fus6c6mKYFVW+vy77B0dk9k65sw==
X-Received: by 2002:a05:600c:5010:b0:436:1b08:4c78 with SMTP id
 5b1f17b1804b1-4361c43bdb4mr27463555e9.31.1733926017703; 
 Wed, 11 Dec 2024 06:06:57 -0800 (PST)
Received: from [10.5.90.20]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434f0d6a825sm139823685e9.20.2024.12.11.06.06.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 06:06:57 -0800 (PST)
Message-ID: <49251bef-cdd1-4dc9-82a0-1c1b1853a8db@smile.fr>
Date: Wed, 11 Dec 2024 15:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20241117123026.532997-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20241117123026.532997-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1733926019; x=1734530819; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3Q7cLjOqKkuJgYe3uKXEs1VUoaE7Cxr28a1xGmVvUhE=;
 b=phkQKKck00VErkuZdQvk0NjA63DbiEJKmtNcLxy8GQ5bdNY7TWPld3EAotAVgGHl15
 27wTKEwWEB+RFN//HfNC/WDWnITJXr9QuB/EB+GBEFYQv0WbG0kBDlntszG8NxDHJZB3
 +14OLWlJ66mA2xvc3YB23nKPc8RSUV6KJZnnc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=phkQKKck
Subject: Re: [Buildroot] [PATCH next 1/1] package/bc: update _SITE to use
 BR2_GNU_MIRROR
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

SGVsbG8gSnVsaWVuLAoKTGUgMTcvMTEvMjAyNCDDoCAxMzozMCwgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBUaGUgYmMgcGFja2FnZSBpcyBkaXN0cmlidXRlZCBvbiB0aGUgR05VIHByb2pl
Y3Qgc2VydmVycy4gU2VlIFsxXQo+IGFuZCBbMl0uIEJ1aWxkcm9vdCBoYXMgdGhlIEJSMl9HTlVf
TUlSUk9SIGNvbmZpZ3VyYXRpb24gd2hpY2ggY2FuCj4gYmUgdXNlZCBmb3IgdGhhdCBwdXJwb3Nl
LiBTZWUgWzNdCj4gCj4gRm9yIGNvbnNpc3RlbmN5IHdpdGggYWxsIG90aGVyIEdOVSBwYWNrYWdl
cywgdGhpcyBjb21taXQgdXBkYXRlcwo+IHRoZSBfU0lURSB0byB1c2UgQlIyX0dOVV9NSVJST1Iu
Cj4gCj4gQXMgYSBzaWRlIG5vdGUsIHRoZSBiYyBwYWNrYWdlIHdhcyBpbnRyb2R1Y2VkIGxvbmcg
dGltZSBhZ28gdXNpbmcKPiBCUjJfR05VX01JUlJPUi4gU2VlIFs0XS4gSXQgd2FzIHRoZW4gdXBk
YXRlZCB0byBhbiBhbHBoYSB2ZXJzaW9uCj4gaW4gWzVdLiBXaGVuIHRoZSBhbHBoYSB2ZXJzaW9u
IHdhcyBubyBsb25nZXIgbmVlZGVkLCBpdCB3YXMgc3dpdGNoZWQKPiB0byB0aGUgbWFpbiBHTlUg
ZG93bmxvYWQgc2VydmVyIGluIFs2XS4KPiAKPiBbMV0gaHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0
d2FyZS9iYy8KPiBbMl0gaHR0cHM6Ly93d3cuZ251Lm9yZy9wcmVwL2Z0cC5odG1sCj4gWzNdIGh0
dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyNC4wOC4y
L0NvbmZpZy5pbiNMMjg2Cj4gWzRdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1
aWxkcm9vdC8tL2NvbW1pdC9jOTVkY2Q0NjQ1MTJlZGU1ZmZkZWY1NTY3NTU4NjExZjA1ZTJlNTJi
Cj4gWzVdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1p
dC8xZmFhN2MzNDRlMTA5ODZhNGFmZDFkMTdiZjZkNDI2NWIzYzgyMWZjCj4gWzZdIGh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC9lZDc1NzJjYzdmZjY5
NTg0MTE2YzRlNzYzYTYwOGFmYzIyNWJkMGM2Cj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9s
aXZhaW4gPGp1Lm9AZnJlZS5mcj4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJl
Z2FyZHMsClJvbWFpbgoKCj4gLS0tCj4gIHBhY2thZ2UvYmMvYmMubWsgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2JjL2JjLm1rIGIvcGFja2FnZS9iYy9iYy5tawo+IGluZGV4IDA2YjZmZWFlNGYu
LjU2OTFjYTllNjcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9iYy9iYy5tawo+ICsrKyBiL3BhY2th
Z2UvYmMvYmMubWsKPiBAQCAtNSw3ICs1LDcgQEAKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
PiAgCj4gIEJDX1ZFUlNJT04gPSAxLjA3LjEKPiAtQkNfU0lURSA9IGh0dHA6Ly9mdHAuZ251Lm9y
Zy9nbnUvYmMKPiArQkNfU0lURSA9ICQoQlIyX0dOVV9NSVJST1IpL2JjCj4gIEJDX0RFUEVOREVO
Q0lFUyA9IGhvc3QtZmxleAo+ICBCQ19MSUNFTlNFID0gR1BMLTIuMCssIExHUEwtMi4xKwo+ICBC
Q19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORyBDT1BZSU5HLkxJQgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
