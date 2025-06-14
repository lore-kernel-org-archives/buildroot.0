Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDCFEC71135
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 12:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9DAF6080F;
	Sat, 14 Jun 2025 12:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7webBP0UyAsc; Sat, 14 Jun 2025 12:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E26F06081F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E26F06081F;
	Sat, 14 Jun 2025 12:57:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C81281A4
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 12:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B94FA4078D
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 12:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s4_u8CDYhd-L for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 12:57:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BDE244077C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDE244077C
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDE244077C
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 12:57:50 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-450ce3a2dd5so28106815e9.3
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 05:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749905869; x=1750510669;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YH9COMgwgzD8j4MEPeMS0+jQ4nb0sjz4PFXJDVNR9DU=;
 b=WnpB9vb5oQENOPUh+9p6pcboyRChUm7PVJn2x9iKCFeVRLX6b96iJ2PO67XOcDA53m
 dExsqBf9DE12scMGTFMnhawhbGwtC5JrSSiYaq9fTYRSP4fDviFGuOIObP9VRvB3QdUS
 P/O4xHbldboX5bbhhLXDRlRoNjnShHwSaAeB3Nf2TIrMNE9lrIklTsGWA3vVajDLaxCO
 6f6LeocmMnihGyj04tWoc0nq/HSy+7L5qONutS4sxU3GLYir9GRCN/bPp6+S0hcy4fnr
 aS3yJ3JH++dUeRBL4v4isBMY6bRW2HwAAXdCgRh9FzDhCIcpbmHvxrmwCm8xN5BQs1pc
 UqHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs0y6KLSwxbxSYN5twszLxiWjc41IYZwm9heDx1pTeuHWYZNNEtXCHUeZrRTGIGVQceEaMk1eQcf8=@buildroot.org
X-Gm-Message-State: AOJu0YzjioG2LTMAzfmKwn87qCU6RGmkLDZUoFkr5CD8txFq9HAFZUVr
 nQZU5JBCkMuoltQedDRtM0NfobNKdhkkeGXJsGwyyyvGh+lhPxCQ3B6OFUsLSHKmNjA=
X-Gm-Gg: ASbGncsj9I/rYoY9sS5Yf09WANzyU3BZz/Nmh5zauC7PfP6oefl+Y+b5bFRIBZt162g
 cpQS8qYZ3vinFzhItmoOOjUi9kdqmBC35zDBR6/Pzo1fit98AItnxjtkeHgADB525YURKZWNlQJ
 vsKOd3h1mLh1/kqbxHbVDjf/CZxRUT1+KyyGEokp0ZIE3IJ1uTen1zapAQetVeo2RFiVXFgI4ZQ
 GlAUyMeALmXMe9NJsenTbtoZ+jBHHBkNbZWqcji2e6USbM/65VWJ8IT9kCYnNqA6qhYcGoabxFQ
 JOD4vNxXDdPFKqr6pz5JHb9LmhWRx4LoxPbFELOBjmvklxIhc8a4Z3OVE06uElDn2cPaGMy6Iwc
 x8h1/nK6KEFKLrmnrrAxLv7VnYVSCWppqhSNnfSlL2YtsHGjZnPdTDDMGVUuH2Xne6403trzmNu
 Qi1lbOVVsWAr64eoSW3XAyI0VV
X-Google-Smtp-Source: AGHT+IGcx9Jdg4Rte8IDQP3fUT6Itwiq6yLGV5QxEZC7hykXNoG2R1CDOksb3m1Gm6/NQGh+NlSHPw==
X-Received: by 2002:a05:600c:1c08:b0:442:f97b:87e with SMTP id
 5b1f17b1804b1-4533ca4e4b7mr32307585e9.6.1749905868761; 
 Sat, 14 Jun 2025 05:57:48 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a7e980sm5036620f8f.41.2025.06.14.05.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Jun 2025 05:57:48 -0700 (PDT)
Message-ID: <c48f4495-dd1d-4cfe-ae25-00fa2428906c@smile.fr>
Date: Sat, 14 Jun 2025 14:57:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Dick Olsson <hi@senzilla.io>
References: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
 <20250607-loongarch-v2-3-90bc4fda9080@flygoat.com>
Content-Language: fr, en-US
In-Reply-To: <20250607-loongarch-v2-3-90bc4fda9080@flygoat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749905869; x=1750510669; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YH9COMgwgzD8j4MEPeMS0+jQ4nb0sjz4PFXJDVNR9DU=;
 b=v7QclpzG7byXQlexNhJlQ6y5VjRD/viO1A1CFf1mz5xMZR1hJv6k5TWsj+oOJjhdO+
 QB8nJnICVlYYHPer4/7CZtAGEMBVzJ+qcirTKlU3pHhly1XyZd9XNthlk0Xha2EWIOiZ
 aJIlvf7uYiPE3YQA6mQQskKlyO8UfpDQCJi10=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=v7QclpzG
Subject: Re: [Buildroot] [PATCH v2 3/9] package/glibc: Enable LoongArch64
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
IMOpY3JpdMKgOgo+IEdsaWJjIGludHJvZHVjZWQgTG9vbmdBcmNoNjQgc3VwcG9ydCBpbiAyLjM2
LCBpdCByZXF1aXJlcyBrZXJuZWwKPiA1LjE5IHRvIGJ1aWxkLgoKV2l0aCB0aGlzIHBhdGNoIGFw
cGxpZWQsIHlvdSBjYW4gcmVtb3ZlIEJSMl9BUkNIX0hBU19OT19UT09MQ0hBSU5fQlVJTERST09U
CmludHJvZHVjZWQgaW4gdGhlIHByZXZpb3VzIHBhdGNoLgoKT3RoZXJ3aXNlOgogIFJldmlld2Vk
LWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KCkJlc3QgcmVnYXJkcywK
Um9tYWluCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHln
b2F0LmNvbT4KPiAtLS0KPiAgcGFja2FnZS9nbGliYy9Db25maWcuaW4gICAgICAgICAgICAgICAg
IHwgMiArKwo+ICB0b29sY2hhaW4vdG9vbGNoYWluLWJ1aWxkcm9vdC9Db25maWcuaW4gfCA0ICsr
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9nbGliYy9Db25maWcuaW4gYi9wYWNrYWdlL2dsaWJjL0NvbmZpZy5pbgo+IGluZGV4
IDUyNzUyZTk3NWU0OTRhYWJlNjdiMjdiNjAxZGVmYzUwNGRiYmE5NGEuLjlhNGZlNmYzZGIwYTFj
YTRmMWFkMzdmN2UxZWE3MDk2NjRlMjU0ZDUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9nbGliYy9D
b25maWcuaW4KPiArKysgYi9wYWNrYWdlL2dsaWJjL0NvbmZpZy5pbgo+IEBAIC01LDYgKzUsNyBA
QCBjb25maWcgQlIyX1BBQ0tBR0VfR0xJQkNfQVJDSF9TVVBQT1JUUwo+ICAJZGVmYXVsdCB5IGlm
IEJSMl9hYXJjaDY0Cj4gIAlkZWZhdWx0IHkgaWYgQlIyX2FhcmNoNjRfYmUKPiAgCWRlZmF1bHQg
eSBpZiBCUjJfaTM4Ngo+ICsJZGVmYXVsdCB5IGlmIEJSMl9sb29uZ2FyY2g2NAo+ICAJZGVmYXVs
dCB5IGlmIEJSMl9tNjhrX202OGsKPiAgCWRlZmF1bHQgeSBpZiBCUjJfbWlwcwo+ICAJZGVmYXVs
dCB5IGlmIEJSMl9taXBzZWwKPiBAQCAtMzUsNiArMzYsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0Vf
R0xJQkNfU1VQUE9SVFMKPiAgCSMgdG9vbGNoYWluL3Rvb2xjaGFpbi1idWlsZHJvb3QvQ29uZmln
LmluCj4gIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF8zXzIKPiAg
CWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzNfMTAgfHwgIUJSMl9w
b3dlcnBjNjRsZQo+ICsJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hFQURFUlNfQVRfTEVBU1Rf
NV8xOSB8fCAhQlIyX2xvb25nYXJjaDY0Cj4gIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEVB
REVSU19BVF9MRUFTVF80XzUgfHwgIUJSMl9NSVBTX05BTl8yMDA4Cj4gIAlkZXBlbmRzIG9uIEJS
Ml9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF81XzQgfHwgIUJSMl9SSVNDVl8zMgo+ICAJZGVw
ZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hFQURFUlNfQVRfTEVBU1RfNV8wIHx8ICFCUjJfUklTQ1Zf
NjQKPiBkaWZmIC0tZ2l0IGEvdG9vbGNoYWluL3Rvb2xjaGFpbi1idWlsZHJvb3QvQ29uZmlnLmlu
IGIvdG9vbGNoYWluL3Rvb2xjaGFpbi1idWlsZHJvb3QvQ29uZmlnLmluCj4gaW5kZXggMDE3M2Y0
MGQ5NzY4YmMyNzlkYWI3YzZhNTBmZTY0ZDc1MDFhYTE5Mi4uMGJjY2RjODE3Y2M5ZjdlMTVkMjI4
NTI4NWU4YzkzY2Q0MzIyODhmNiAxMDA2NDQKPiAtLS0gYS90b29sY2hhaW4vdG9vbGNoYWluLWJ1
aWxkcm9vdC9Db25maWcuaW4KPiArKysgYi90b29sY2hhaW4vdG9vbGNoYWluLWJ1aWxkcm9vdC9D
b25maWcuaW4KPiBAQCAtNDgsNiArNDgsMTAgQEAgY29tbWVudCAiZ2xpYmMgbmVlZHMgYSB0b29s
Y2hhaW4gdy8ga2VybmVsIGhlYWRlcnMgPj0gMy4yIgo+ICAJZGVwZW5kcyBvbiBCUjJfUEFDS0FH
RV9HTElCQ19BUkNIX1NVUFBPUlRTCj4gIAlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX0hFQURF
UlNfQVRfTEVBU1RfM18yCj4gIAo+ICtjb21tZW50ICJnbGliYyBvbiBMb29uZ0FyY2g2NCBuZWVk
cyBhIHRvb2xjaGFpbiB3LyBoZWFkZXJzID49IDUuMTkiCj4gKwlkZXBlbmRzIG9uIEJSMl9sb29u
Z2FyY2g2NAo+ICsJZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzVf
MTkKPiArCj4gICMgZ2xpYmMgPj0gMi4yNiByZXF1aXJlIGtlcm5lbCBoZWFkZXJzID49IDMuMTAg
b24gcG93ZXJwYzY0bGUuCj4gIGNvbW1lbnQgImdsaWJjIG9uIHBvd2VycGM2NGxlIG5lZWRzIGEg
dG9vbGNoYWluIHcvIGhlYWRlcnMgPj0gMy4xMCIKPiAgCWRlcGVuZHMgb24gQlIyX3Bvd2VycGM2
NGxlCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
