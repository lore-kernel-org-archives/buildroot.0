Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054E8CA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 10:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8512684502;
	Sun, 24 Aug 2025 10:13:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PqIE0hRVROIY; Sun, 24 Aug 2025 10:13:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 925EB8450E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 925EB8450E;
	Sun, 24 Aug 2025 10:13:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A173E1D9
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 885436172E
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PL3uMBH-DvxE for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 10:13:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7EB7F61700
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EB7F61700
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EB7F61700
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:13:23 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45a1b004a31so26399945e9.0
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 03:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756030401; x=1756635201;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZuMb0Kur9Q2+CtJRin0Hv8trd1MRDy/OX6NKF2/rHpM=;
 b=bU3oQ6B87xFVWgOF8TWqDoTFsI/IEOLljVC3T1AMrDK7MLIkifKcA8Qzf4t+1WGdsc
 oiQsVR+0JPclGlvrDmM8pPlWevJsnWoMRd3zCyaiVWaMmUStFigsSaukw4/fbSneMa3m
 SSc8thf2AiXeiHs284ukeFvv+J5by7K7PhZtwgQMvFwgKfqs/AmkUUcy9UxLr8xuGWCk
 4yWn50U7HwjmeUeVVIBrN1nTfcLES9XKt7aTjjLo1NtJ1MPhRSmCMuMx5AH4wGtZUDiR
 e4fr6RCa3R9MOCN8qzUHobdnOLj/tRVuFEz+mX/Zf9yVQBMwAGmtpey3DRxBhWQ76WYq
 qREg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuAJjMv4kdV9VAI0lF38msmWm3gPuNYIcjlT9xbBbuXJ5/sb+PFLvunGBnbiAyqqUS4R8ZOY3PZ18=@buildroot.org
X-Gm-Message-State: AOJu0YyQKJg5UoNcaKOROGK/OTCH2ktz0FAD1ZX+IZo5oNwe+Fd1kwOn
 g9g4LgI5OP5eK4Yi1YZoiWxE8oRv/t5JBYhdmY+ftSqMuDF5BI3dA3NcZvNhLcdBf5WdUMH2irH
 WQ2vJ
X-Gm-Gg: ASbGncvACZDeA0HrOJxMg2Qan93AnOuU3+M8IdcqDVCxXXLO3aIrfS/PSw6S8eU8YME
 8TcwWEc65RpW6eXdb9adXurbyBpPgZFX9Wc1BGSiLAQ67rVp+Kiya0uIQqEO3e/bNODx4BRmVDa
 WSN2WS4OFwQZK+SnBRab76HVmC+WWUdQkrzZ5r/tOpplP5AyOvRcVjmBnk86U8BdNjRy8zxY/Z4
 w0i5/rBKrQQv9hhoF7SLlpDdDWcCDhB4XsJlpJ/Vft3paYaTUfMXWlJAC0bWQ7qAog4oR4aIo4G
 ZkW9J8loZrlgnhtqTRc5jCdCi0PUSyNpXRSOtMYnhmw+Sa0YTGszNA6/XkZgtLY32GDFgSX+9ey
 HnLHXCWGBYv6Fulzoumz7wgCS8hY3Oz5PJnjOTyA0c2i1I//q3tLh1TvIc58SDrWtmcwMQ07zlI
 XVEdsDVS03G5p3klL9h+ulMSIVk2tdLpvmLpHNvfsP88kddaETaGny1gkdh+cy
X-Google-Smtp-Source: AGHT+IGWdTPeqUHj3cKpAiPO6s0oQ4ryZnNC4AcO4XjJfcHPIilUxad2AgY4zTVlGsvP5b/blRs31g==
X-Received: by 2002:a05:6000:1788:b0:3b7:901c:92ee with SMTP id
 ffacd0b85a97d-3c5dd7b43cfmr7596913f8f.58.1756030401242; 
 Sun, 24 Aug 2025 03:13:21 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c711d9f3a8sm6963311f8f.62.2025.08.24.03.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Aug 2025 03:13:20 -0700 (PDT)
Message-ID: <5a4160cf-a95b-4238-a899-05f0c1abd71c@smile.fr>
Date: Sun, 24 Aug 2025 12:13:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250824092952.289402-1-thomas.petazzoni@bootlin.com>
Content-Language: fr, en-US
In-Reply-To: <20250824092952.289402-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756030401; x=1756635201; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZuMb0Kur9Q2+CtJRin0Hv8trd1MRDy/OX6NKF2/rHpM=;
 b=mW1ZqU2X2U95qhUagq59NfZf5RVGcYaSx+4aR8tKMSU05VmroZjxjB98FVkr0go4LA
 OL/5QNrrkLwhEhobsmTweLcjOziW8eRRoHNUOJc+LiQkqzuMaRdg5tCkftrClzPPg3rq
 sff27UMr2zUjhOKkB9jOCHmfg0q5jYbGo7j1Q=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=mW1ZqU2X
Subject: Re: [Buildroot] [PATCH] linux: select host-openssl for all
 architectures when building latest version
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAyNC8wOC8yMDI1IMOgIDExOjI5LCBUaG9tYXMgUGV0YXp6
b25pIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBTaW5jZSBhdCBsZWFzdCBMaW51eCA2LjE2
LCBidXQgcG9zc2libHkgZWFybGllciwgaG9zdC1vcGVuc3NsIGlzIG5vdwo+IG5lZWRlZCBvbiB0
aGUgdmFzdCBtYWpvcml0eSAoaWYgbm90IGFsbD8pIENQVSBhcmNoaXRlY3R1cmVzLgoKSXQgc2Vl
bXMgcmVsYXRlZCB0byBzaWduYXR1cmUgdG9vbHMgYnVpbGQgZm9yIHRoZSBob3N0IHRoYXQgYXJl
IG5vdyBlbmFibGVkIGJ5CmRlZmF1bHQ6IENPTkZJR19NT0RVTEVfU0lHX0tFWSBhbmQgQ09ORklH
X01PRFVMRV9TSUdfRk9STUFUOgoKJChvYmopL3NpZ25pbmdfa2V5Lng1MDk6ICQoZmlsdGVyLW91
dCAkKFBLQ1MxMV9VUkkpLCQoQ09ORklHX01PRFVMRV9TSUdfS0VZKSkKJChvYmopL2V4dHJhY3Qt
Y2VydCBGT1JDRQpjZXJ0cy9leHRyYWN0LWNlcnQuYzoyMTojaW5jbHVkZSA8b3BlbnNzbC9iaW8u
aD4KCmhvc3Rwcm9ncy1hbHdheXMtJChDT05GSUdfTU9EVUxFX1NJR19GT1JNQVQpICs9IHNpZ24t
ZmlsZQpzY3JpcHRzL3NpZ24tZmlsZS5jOjI1OiNpbmNsdWRlIDxvcGVuc3NsCgo+IAo+IEluZGVl
ZCwgaW4gb3JkZXIgdG8gZml4IGJ1aWxkIGlzc3Vlcywgd2Ugd291bGQgaGF2ZSB0byBhZGQ6IGFy
bWViLAo+IG1pY3JvYmxhemUsIGxvb25nYXJjaCwgbTY4aywgbWlwcywgbWlwc2VsLCBtaXBzNjQs
IG1pcHM2NGVsLCBwb3dlcnBjLAo+IHBvd2VycGM2NCwgcG93ZXJwYzY0ZWwsIHJpc2N2LCBzMzkw
LCBhbmQgcG9zc2libHkgb3RoZXJzLgo+IAo+IFNvIGludGVhZCwgd2hlbiAibGF0ZXN0IGtlcm5l
bCIgaXMgdXNlZCB3aXRoIHRoZSBkZWZhdWx0IGFyY2hpdGVjdHVyZQo+IGNvbmZpZ3VyYXRpb24s
IGFsd2F5cyBzZWxlY3QgaG9zdC1vcGVuc3NsIGluZGVwZW5kZW50bHkgb2YgdGhlCj4gc2VsZWN0
ZWQgYXJjaGl0ZWN0dXJlcy4KCk5vd2FkYXlzLCBldmVuIGJvb3Rsb2FkZXJzICh1LWJvb3QpIG5l
ZWRzIGhvc3Qtb3BlbnNzbAooQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVOU1NMKQoKUmV2aWV3
ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKQmVzdCByZWdhcmRz
LApSb21haW4KCgo+IAo+IEZpeGVzOgo+IAo+ICAgaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm5ldC9yZXN1bHRzLzlhMzE0ZTc1OWY3NjQwZDc2MDAwM2U0NmY4NjE1MzMwMDQ3OGVjNjAvICht
aXBzZWwpCj4gICBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvM2JjYzY3
NGVhNWE3Y2RmMDMxMjAwYjBjZDJmOWY3MTQwMGJhMzkxYy8gKG1pcHM2NGVsKQo+ICAgaHR0cHM6
Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2IyNDk4M2ZkOTFmNDA4ZGU1NjQ3OWI3
ZDdkNTdmYzlmZDMzMzNkN2QvIChzMzkwKQo+ICAgaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm5ldC9yZXN1bHRzL2IyNjJmYzZmNjdhOWZlZDU1ZmFmZmNkZDU4MGQ4OWY0NjY0ZTFlMTYvIChw
b3dlcnBjNjQpCj4gICBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvNDVk
YTE1Mzg0NTdiMTg2NzFmYTE4ZWZlM2UxYWE1N2ExNTU2MTM3MC8gKG02OGspCj4gICBodHRwczov
L2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMGE0NTczNzVkMjUwOWYxYjI5YTQ0OWRm
YTUwZjI5ZmM3ZTU2ZTU2OC8gKGFybWViKQo+ICAgaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm5ldC9yZXN1bHRzLzgxNGNhNWYwNDg4MjdhNjM1ZGVhMDE5OTg3OGZhODJkNTAxMmI2NDkvIChs
b29uZ2FyY2g2NCkKPiAgIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9i
Njg0ZDBiMzdlNTE4N2FhOWIzMTY5MzM1NmY4NTE1ODU3ZDE5ZjdhLyAobWljcm9ibGF6ZSkKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3Rs
aW4uY29tPgo+IC0tLQo+ICBsaW51eC9Db25maWcuaW4gfCA1ICsrLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xp
bnV4L0NvbmZpZy5pbiBiL2xpbnV4L0NvbmZpZy5pbgo+IGluZGV4IGI0YjAyOTVkZmUuLjU2NDcz
ZDFiMDMgMTAwNjQ0Cj4gLS0tIGEvbGludXgvQ29uZmlnLmluCj4gKysrIGIvbGludXgvQ29uZmln
LmluCj4gQEAgLTE3NSwxMiArMTc1LDExIEBAIGNvbmZpZyBCUjJfTElOVVhfS0VSTkVMX1VTRV9E
RUZDT05GSUcKPiAgCj4gIGNvbmZpZyBCUjJfTElOVVhfS0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRf
Q09ORklHCj4gIAlib29sICJVc2UgdGhlIGFyY2hpdGVjdHVyZSBkZWZhdWx0IGNvbmZpZ3VyYXRp
b24iCj4gLQkjIFdlIGtub3cgdGhhdCB0aGUgZGVmYXVsdCBjb25maWd1cmF0aW9uIG9uIHNvbWUg
YXJjaGl0ZWN0dXJlcwo+ICsJIyBXZSBrbm93IHRoYXQgdGhlIGRlZmF1bHQgY29uZmlndXJhdGlv
biBvbiBtYW55IGFyY2hpdGVjdHVyZXMKPiAgCSMgcmVxdWlyZXMgaG9zdC1vcGVuc3NsLCBzbyBz
ZWxlY3QgaXQgZm9yIHRoZSBsYXRlc3Qga2VybmVsCj4gIAkjIHZlcnNpb24uIFRoaXMgaXMgbWFp
bmx5IG5lZWRlZCB0byBmaXggYXV0b2J1aWxkZXIgdGVzdGluZy4KPiAgCXNlbGVjdCBCUjJfTElO
VVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTCBpZiBcCj4gLQkgICAgICAgQlIyX0xJTlVYX0tF
Uk5FTF9MQVRFU1RfVkVSU0lPTiAmJiBcCj4gLQkgICAgICAgKEJSMl9hYXJjaDY0IHx8IEJSMl9h
YXJjaDY0X2JlIHx8IEJSMl9hcmNsZSB8fCBCUjJfYXJjZWIgfHwgQlIyX3NwYXJjIHx8IEJSMl94
ODZfNjQpCj4gKwkgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9MQVRFU1RfVkVSU0lPTgo+ICAJaGVs
cAo+ICAJICBUaGlzIG9wdGlvbiB3aWxsIHVzZSB0aGUgZGVmYXVsdCBjb25maWd1cmF0aW9uIGZv
ciB0aGUKPiAgCSAgc2VsZWN0ZWQgYXJjaGl0ZWN0dXJlLiBJLmUsIGl0IGlzIGVxdWl2YWxlbnQg
dG8gcnVubmluZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
