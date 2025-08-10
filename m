Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524D7C87FDA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 19:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 112C840F06;
	Sun, 10 Aug 2025 19:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7u53lorGuW3J; Sun, 10 Aug 2025 19:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EDBF40EFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EDBF40EFE;
	Sun, 10 Aug 2025 19:03:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD38D31
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 19:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C283382532
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 19:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orr_3Ka4KDst for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 19:03:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B6CE082521
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6CE082521
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6CE082521
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 19:03:28 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b8de6f7556so2037738f8f.1
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 12:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754852606; x=1755457406;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qhDLhtA1Q7iZSGoac4DZIb3DZEhEs8ET5dHulP9wf9Q=;
 b=fcmzWjf6JN00BzP6uAmmzeMWU7g2ILInf/OvxRqIwXGXbHse/+sbiqJNASc19441hp
 hn9hZNXITC+iRqovJb+5Xy1Ew03phLbiAshW7cYNRmlgEnUZLFebwbC2MZip40F4sIqA
 r3hcDE3che6oT7I6DVopdGbdCd8gg9LCoA5clWQYXgtAX4ERxXwSNvCrVtw1TgqlaDVH
 q3qlc0/Ulruhohoj8NFRz/X+sijSeNhvi1UoXtJ0GB+/uT0sNPMUZ8b5oKKjAMqdWyP8
 0wy7YABmQSOU5aIKox7KP0fBxZgP1CGDkf1MRbvPkhJ2yIkabFv8/OKwGWu9hIP++TiW
 ZLOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkqam0lPi2xCJb+JyHexSRvr1Ww62TR+r3MlTO8Ohpr8vSmKnBJA00v/Ew4owoiq4/KeKZjyy7Z+U=@buildroot.org
X-Gm-Message-State: AOJu0YwS6UeS5bb9oZRlRmoMwXOJO+b/6aSwrd7BqFhkfngBStyugCwd
 Hsno0wvwQtHx9KVagGDqrk3MtHGmssA2//NlCCKZml1zy8PtoCpne1OR7ds6yBjWbmjeikD1Ncd
 62xoB
X-Gm-Gg: ASbGncvKvpKQ12fGfoRFO07OWG+IsuxTZ2HsU8ntcekEhkkAzl/UNvA1+5bCLoBNuYa
 a4z17QSqbqQ/MHGeZX81eH2nLUEcB/xxkSM/4/KX3iX/u/mCf07CdPBK409eBiBmT/hXXVSi540
 Vf3TUiY7HbjnFnOZ4N3aoKYaxN9tKnA9LUOMGbmSfxCf8NXuTsodv1UXlDd06ubmNMdWwm9JCsM
 GNPXLnNUqxyxDE8sYa5KyzGciCdoULRv2wGRB+Dnhmz0qjcmfB3eoyuHG+QKuexevK5z3N2odj+
 1m6KwMPtqcHKhefdW4A3Lj1EM/iQIjWL3TFyL2Fk4XYL8S8KbARIZZXlvY9PXtjDx/4PJDFJg4/
 jYIvfHXnIvj0n+/X7cZZAKUpVGMSzELubIe19YLrKVdwVCAC2illJ1nRAokqAHP/v7PGzaapTLM
 8Rtxzq58aT2UKdolAZPfrLe2jgRUB8eokRc7UOUFs55NKXI+8r8somKSJfNvqmJRu/3Ws9cX4=
X-Google-Smtp-Source: AGHT+IFpzr09SpgTFwl5MmVmVyBO4meqqsb71m5FgprYEG/w19XPakXVpgS2NhuVAh8sGZjrMlwtsg==
X-Received: by 2002:a05:6000:178a:b0:3b8:f8fd:af5d with SMTP id
 ffacd0b85a97d-3b90092957cmr8100708f8f.11.1754852606482; 
 Sun, 10 Aug 2025 12:03:26 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac574sm37912148f8f.5.2025.08.10.12.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 12:03:26 -0700 (PDT)
Message-ID: <790afc63-c33f-408a-bcfe-e573f68af1d4@smile.fr>
Date: Sun, 10 Aug 2025 21:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Frank Chung <uuidxx@163.com>, buildroot@buildroot.org
References: <20250326170814.2393-1-uuidxx@163.com>
Content-Language: fr
In-Reply-To: <20250326170814.2393-1-uuidxx@163.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754852606; x=1755457406; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qhDLhtA1Q7iZSGoac4DZIb3DZEhEs8ET5dHulP9wf9Q=;
 b=fi0sfhcoVxCBNKjNBjP/TGzdVQHODP1enV1EKrUHU8AluSKOP0f13idzWrJBcclimO
 fW4axmZValsScqE1aJHCfJmPUjxIeOQDJiind1e+v75+ooEiqWNTXXfGU3qcv7EgSv3Z
 IW8uA1svm7kY9xYhlOLIfYwVqwSynthbtc1MY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=fi0sfhco
Subject: Re: [Buildroot] [PATCH 1/1] package/lrzsz: fix patch compatibility
 with musl
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

SGVsbG8gRnJhbmssIEFsbCwKCkxlIDI2LzAzLzIwMjUgw6AgMTg6MDgsIEZyYW5rIENodW5nIGEg
w6ljcml0wqA6Cj4gVGhlIG1hY3JvICJfX0dOVV9MSUJSQVJZX18iIHdhcyBpbnRyb2R1Y2VkIGlu
ICJbUEFUQ0hdIGxpYi9sb25nLW9wdGlvbnMuYzoKPiBpbmNsdWRlIHN0ZGxpYi5oIi4gSG93ZXZl
ciwgbXVzbCBkb2VzIG5vdCBoYXZlIHRoaXMgbWFjcm8sIHdoaWNoIG1ha2VzIGl0Cj4gaW1wb3Nz
aWJsZSB0byBmaW5kIHRoZSByZWxldmFudCBoZWFkZXIgZmlsZSB3aGVuIGNvbXBpbGluZyB3aXRo
IEdDQyAxNC54Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIENodW5nIDx1dWlkeHhAMTYzLmNv
bT4KPiAtLS0KPiAgcGFja2FnZS9scnpzei9scnpzei5tayB8IDUgKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xyenN6L2xy
enN6Lm1rIGIvcGFja2FnZS9scnpzei9scnpzei5tawo+IGluZGV4IDEyZDUyYjhlYmQuLjExNDU4
NWI1Y2EgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9scnpzei9scnpzei5tawo+ICsrKyBiL3BhY2th
Z2UvbHJ6c3ovbHJ6c3oubWsKPiBAQCAtMTMsNiArMTMsMTEgQEAgTFJaU1pfQ1BFX0lEX1ZBTElE
ID0gWUVTCj4gIExSWlNaX0RFUEVOREVOQ0lFUyA9ICQoVEFSR0VUX05MU19ERVBFTkRFTkNJRVMp
Cj4gIExSWlNaX0NPTkZfRU5WID0gTElCUz0kKFRBUkdFVF9OTFNfTElCUykKPiAgCj4gKyMgTWFr
ZSB0aGUgY29kZSBiZWxpZXZlIHdlIGFyZSB1c2luZyBhIEMgbGlicmFyeSBjb21wYXRpYmxlIHdp
dGggZ2xpYmMKPiAraWZlcSAoJChCUjJfVE9PTENIQUlOX1VTRVNfTVVTTCkseSkKPiArTFJaU1pf
Q09ORl9FTlYgKz0gQ0ZMQUdTPSIkKFRBUkdFVF9DRkxBR1MpIC1EX19HTlVfTElCUkFSWV9fIgo+
ICtlbmRpZgoKSSdtIG5vdCBzdXJlIHRoYXQncyB0aGUgcmlnaHQgZml4LgoKQ2FuIHlvdSB0cnkg
dGhlIHBhdGNoIGFkZGVkIHRvIGxyenN6IFlvY3RvIHJlY2lwZSB0byBmaXggdGhlIGJ1aWxkIHdp
dGggZ2NjIDE1PwoKaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWNvcmUvbWVzc2FnZS8yMTM1NDcKClRoaXMgcGF0Y2ggaXMgYXZhaWxhYmxlIGluIGEgUFIgZnJv
bToKaHR0cHM6Ly9naXRodWIuY29tL1V3ZU9oc2UvbHJ6c3oKCkNhbiB5b3Ugc2VuZCBhbiB1cGRh
dGVkIHZlcnNpb24/CgpUaGFua3MhCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gKwo+ICBkZWZp
bmUgTFJaU1pfSU5TVEFMTF9UQVJHRVRfQ01EUwo+ICAJJChJTlNUQUxMKSAtbSAwNzU1IC1EICQo
QEQpL3NyYy9scnogJChUQVJHRVRfRElSKS91c3IvYmluL3J6Cj4gIAkkKElOU1RBTEwpIC1tIDA3
NTUgLUQgJChARCkvc3JjL2xzeiAkKFRBUkdFVF9ESVIpL3Vzci9iaW4vc3oKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
