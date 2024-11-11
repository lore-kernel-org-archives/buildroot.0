Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80E9D2E9F0
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 14:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C7CC80B42;
	Mon, 11 Nov 2024 14:26:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RP7ZXWKsqQAH; Mon, 11 Nov 2024 14:26:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B8CE80B76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B8CE80B76;
	Mon, 11 Nov 2024 14:26:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CAEB86C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC73A605A0
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXqaRlFN7xsN for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 14:26:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E58DA6001B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E58DA6001B
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E58DA6001B
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:26:51 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-720d5ada03cso4640988b3a.1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 06:26:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731335211; x=1731940011;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L1pKHlqM/sSntPpoUNAysG5+7j+xZjQSwA1U9UIcutA=;
 b=h8rpP/g87PHgAaAfp7DcOii/dPTtcYucYHjDQ/xxfU3zzQHZHdV7T4ZybOwBLgQKo6
 QU0OYjInxnC0EFgs4hEI+ktBCLaVerbm6CEqm041cWlLDzYru9fgtkD+OlgVrSEi3oUW
 DQJhC0Q0FIql02wovTnFtohM+S/zlqCIqW+XznCfAUOyAujVscBKD/OKOvKV3uWuOL05
 0qWRsMJxH/w7VntTl3SMhXzUI18KbfPshFKVaPdNR8neKro+4EdDfECdpbvXc4mpdEKQ
 hqKa9ytz0tufgS4Um+exyb2bxNi95YH+SFZJGTluc4pwZN3Nzz7q2WA70Kjpthf1oQLG
 Xn9g==
X-Gm-Message-State: AOJu0YzmAzDlI6E/qUm1N6Jn2bbPGxKXPwaLAlj6sUk1AxlFFe0WSjOj
 L/pf8kmx3T+pZYGSEZQuIJDVIrM6nh8/xh7OSVYX6tYhgM4H2gsAV1StHIATMd3B2W3OxfhXlj0
 ZnEGL6h8bg+WW6It0/JkdUjE5cyvCOA==
X-Google-Smtp-Source: AGHT+IHsAWv+TcZqVyxqmYV4sJ+7II1yxdTEP3JY44uT+L5k5h4LEUeVSs2/ccExyymAcAN7rWpRSkbDhThhsa43sjo=
X-Received: by 2002:a05:6a00:3cd1:b0:71e:64fe:965f with SMTP id
 d2e1a72fcca58-72413350e9cmr17600021b3a.20.1731335210848; Mon, 11 Nov 2024
 06:26:50 -0800 (PST)
MIME-Version: 1.0
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
 <20241109-genimage-partition-type-uuid-v1-1-9f23180c7195@gmail.com>
 <ZzICaWfSt7aJ2y1B@ryzen>
In-Reply-To: <ZzICaWfSt7aJ2y1B@ryzen>
From: Brandon Maier <brandon.maier@gmail.com>
Date: Mon, 11 Nov 2024 08:26:39 -0600
Message-ID: <CADwxmT=bajsScNg33csd+zBRBEkTyo3YjBiW553Tmr860MKzRg@mail.gmail.com>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Niklas Cassel <cassel@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731335211; x=1731940011; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L1pKHlqM/sSntPpoUNAysG5+7j+xZjQSwA1U9UIcutA=;
 b=Im+ol6p6LspJ7whxQMq3qfVlfORuVCe0BfDAZEFje1s3tCsqPXK5AYfggl9JmrbtC8
 VEhiiwudoz3XbUzgjpY5zecnlGL7eOFdlxFm3zK7NbbVBDDN/C7XztniztLaa0ix2gC6
 0DnqxYfE/P4jP54jEJV8nSPXqoVHaYpvBk/bMfEJQvj3se7XBWKTaopPO3yJCJp5srX0
 Z2JWJGqm2xJ+51dRiJrC95TRqDnTJeb+BdOwaA5xCcTXA8N7lk/NLt9XnZSMajjtNT4s
 40ogQ7t1QlpYuNwoHOfjInM8LgQ5XxiiXvSL2LtsV67Wqn6vzQLZcmalULIDNIO7xs4m
 MBAg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Im+ol6p6
Subject: Re: [Buildroot] [PATCH 01/17] docs/manual/writing-rules: add
 shortcuts for genimage partition-type-uuid
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTmlrbGFzCgpPbiBNb24sIE5vdiAxMSwgMjAyNCBhdCA3OjEx4oCvQU0gTmlrbGFzIENhc3Nl
bCA8TmlrbGFzLkNhc3NlbEB3ZGMuY29tPiB3cm90ZToKPgo+IExpa2UgeW91IHdyb3RlIGluIHRo
ZSBjb3ZlciBsZXR0ZXIsIHRoaXMgc2VyaWVzIGlzIG9ubHkgcGFydGlhbGx5Cj4gaW1wbGVtZW50
aW5nIFRob21hcycgc3VnZ2VzdGlvbiwgd2hpY2ggd2FzOgo+ICJNeSBwb2ludCBpcyB0aGF0IHdl
IHdhbnQgKmNvbnNpc3RlbmN5Ki4gU28gZWl0aGVyIHdlIHVzZSAiTCIgZm9yIGFsbAo+IHJvb3Rm
cyBwYXJ0aXRpb25zLiBPciB3ZSB1c2Ugcm9vdC0ke0FSQ0h9IGZvciBhbGwgcm9vdGZzIHBhcnRp
dGlvbnMuIgo+Cj4KPiBXaGlsZSB0aGlzIHNlcmllcyBpcyBqdXN0IGNvbnZlcnRpbmcgR1VJRHMg
dG8gdXNlIGEgc2hvcnRjdXQsIGlmIHRoZXJlIGlzCj4gb25lIGF2YWlsYWJsZSwgSSBzdGlsbCB0
aGluayB0aGF0IHdlIGNhbiB1cGRhdGUgdGhlIGRvY3VtZW50YXRpb24gdG8gYmUKPiBldmVuIHN0
cmljdGVyLCBzb21ldGhpbmcgbGlrZToKPgo+ICJGb3IgdGhlIHJvb3RmcyBwYXJ0aXRpb24sIHRo
ZSBwYXJ0aXRpb24gdHlwZSBHVUlEIHNob3VsZCBiZSBzZXQgdG8gdGhlCj4gYXJjaGl0ZWN0dXJl
LXNwZWNpZmljIHNob3J0Y3V0IChlLmcuIHJvb3QtYXJtNjQpLCByYXRoZXIgdGhhbiB0aGUgZ2Vu
ZXJpYwo+ICtMKyBzaG9ydGN1dCAoZ2VuZXJpYyBMaW51eCByb290ZnMpLiBBbiBleHBsaWNpdCBw
YXJ0aXRpb24gdHlwZSBHVUlEIHNob3VsZAo+IGFsd2F5cyBiZSBzcGVjaWZpZWQgZm9yIHRoZSBy
b290ZnMgcGFydGl0aW9uLiIKCkkgbGVmdCBpdCBvdXQgb2YgdGhpcyBzZXJpZXMgYXMgSSBoYXZl
bid0IGxvb2tlZCB0b28gY2xvc2VseSBpbnRvCndoaWNoIG9mICJMIiBvciAicm9vdC0qIiBpcyBi
ZXR0ZXIuIEl0IGRvZXNuJ3Qgc2VlbSBsaWtlIGEgc2ltcGxlCmNob2ljZSwgYXMgVS1Cb290IGhh
cyBhIGxvdCBvZiBib2FyZC1zcGVjaWZpYyBzZXR0aW5ncy4KCkRvIHlvdSBhbmQgVGhvbWFzIGZl
ZWwgY29uZmlkZW50IHRoYXQgcm9vdC0kQVJDSCBzaG91bGQgYmUgdGhlIHByZWZlcnJlZCB0eXBl
PwoKPgo+Cj4gVGhhdCB3YXkgd2UgY2FuIHJlbW92ZToKPiAiRXZlbiB0aG91Z2ggdGhlIHNob3J0
Y3V0ICtMKyBpcyB0aGUgZGVmYXVsdCB2YWx1ZSBvZiBfZ2VuaW1hZ2VfLAo+IHdlIHByZWZlciB0
byBoYXZlIGl0IGV4cGxpY2l0bHkgc3BlY2lmaWVkIGluIG91ciArZ2VuaW1hZ2UuY2ZnKyBmaWxl
cy4iCj4KPiBJIGRvbid0IGxpa2UgdGhpcyBzZW50ZW5jZSwgYmVjYXVzZSBpdCBjb3VsZCBiZSBp
bnRlcnByZXRlZCBhcyB0aGF0Cj4gYnVpbGRyb290IHByZWZlcnMgdG8gaGF2ZSB0aGUgR1VJRCBl
eHBsaWNpdGx5IHNwZWNpZmllZCAocmF0aGVyIHRoYW4KPiBoYXZpbmcgdGhlIHNob3J0Y3V0IGV4
cGxpY2l0bHkgc3BlY2lmaWVkKS4KCkFncmVlZCwgaWYgd2UgY2FuIG1pZ3JhdGUgYWxsIHRoZSBi
b2FyZHMgdG8gcm9vdC0kQVJDSCB0aGVuIHdlIGNvdWxkCnJlbW92ZSB0aGlzIGxpbmUuCgpGb3Ig
bm93LCBJIGNhbiBtb3ZlIHRoaXMgbGluZSBkb3duIHRvIHRoZSBzZWN0aW9uIGZvciAiK0wrIi4g
VGhhdCB3YXkKaXQncyBub3QgZW1waGFzaXplZCBpbiB0aGUgbWFpbiBib2R5LgoKVGhhbmtzIQpC
cmFuZG9uIE1haWVyCgo+Cj4KPgo+IEtpbmQgcmVnYXJkcywKPiBOaWtsYXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
