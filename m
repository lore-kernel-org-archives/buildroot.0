Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0D8E6B278
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 14:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 296808446D;
	Fri,  1 Nov 2024 14:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YxucRiN6KJ9m; Fri,  1 Nov 2024 14:08:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A0928447C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A0928447C;
	Fri,  1 Nov 2024 14:08:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 98177725
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 14:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 851EE4048F
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 14:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxV5pl6XRNm1 for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 14:08:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF08540132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF08540132
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF08540132
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 14:08:06 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2fb5638dd57so20061491fa.0
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 07:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730470084; x=1731074884;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OyuuFGUtkuv0KSulU6PbBLoLVbKCLCR1SlLQkKa7YCw=;
 b=P0egI/F87rI8u+SCV+sGuJvTwQdggqMQn3See54l+vCj8u3eOotta6r+BZ2EqgPa44
 0mS+QuUORMuBKg7HUtl6/iiSEvASuGNsZTt1FETWBYxq7sWnMLTyc7s+cD2nsLoICFIi
 roKoCWYXpqudQYRuJglWJZLnoI/cQre7Ju6pqEF6fHoLC7MVLGYp2ElShqiDp154o7tT
 trfUtXQghG+r5tzk1o3ldggs9ofuqC7B3LgpvmDJNjBGQfJH8S9h/kqXfRT4L7xALyYp
 M/UqzHe4NNfrgiT5BZmvolQEM6HPWoYzv3BilXB7TZ+71d6ILglgmEJmCOlfCn8gbw5y
 lEyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3ySPImmD2ZhFLfe1hW7HEu9toWPWeU299hTaJNzYoCnZnZh4eWi7jUf53WNBlKAx1pB5xZr1OtkI=@buildroot.org
X-Gm-Message-State: AOJu0Ywi4DALSQAblGzqIwamb1gZO8162W/soFy0ikOPkkCIA0kZe7zB
 7YjYpx3wJSnj+LYKkuHTi9HoDqD2+Vn1SGnlO8SKBa9pMXaLGXsbjNSZWCkCaWk=
X-Google-Smtp-Source: AGHT+IHgm3kKhggF9RGQLLCl3J43pfM6p8LiAW7qIOY1SoJT0Yaujqma6Cm8pi1ovs3CLg+OltJ+dw==
X-Received: by 2002:a2e:4a12:0:b0:2f7:4ccd:8918 with SMTP id
 38308e7fff4ca-2fcbe09c5bemr91335191fa.43.1730470084153; 
 Fri, 01 Nov 2024 07:08:04 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd947b2bsm96717365e9.25.2024.11.01.07.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Nov 2024 07:08:02 -0700 (PDT)
Message-ID: <36c913a8-7186-4ee6-9d7b-6cf5657ea0e4@smile.fr>
Date: Fri, 1 Nov 2024 15:08:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour via buildroot <buildroot@buildroot.org>
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20241030221140.2520388-1-romain.naour@smile.fr>
 <20241031135337.0303f7ae@windsurf>
Content-Language: fr, en-US
In-Reply-To: <20241031135337.0303f7ae@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730470084; x=1731074884; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OyuuFGUtkuv0KSulU6PbBLoLVbKCLCR1SlLQkKa7YCw=;
 b=NLFVLrw+cxOKvOYkGvC4Nx2UmZsBvgfwFKmRtQZZraciCw9ilYtr2r9Zx8sAUVBq/X
 +UWoNTN5s9R0OrR1QJ59yAJp0IlmfXJoqYSl7ZmjrkhBM/dub47i4f8FhRXeHjYfvBYP
 JtwT8t2ioMABWsfVVWHsFNORvX0A4iMmyBv+c=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=NLFVLrw+
Subject: Re: [Buildroot] [PATCH] package/python-twisted: add missing
 python3-zlib dependency
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

SGVsbG8gVGhvbWFzLAoKTGUgMzEvMTAvMjAyNCDDoCAxMzo1MywgVGhvbWFzIFBldGF6em9uaSBh
IMOpY3JpdMKgOgo+IE9uIFdlZCwgMzAgT2N0IDIwMjQgMjM6MTE6NDAgKzAxMDAKPiBSb21haW4g
TmFvdXIgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+IAo+
PiBUZXN0UHl0aG9uVHdpc3RlZCBkb2Vzbid0IHRyeSB0byBpbXBvcnQgYWxsIHB5dGhvbi10d2lz
dGVkIG1vZHVsZXMgYW5kCj4+IGRvZXNuJ3QgZGV0ZWN0IHRoYXQgemxpYiBtb2R1bGUgaXMgaW1w
b3J0ZWQgYXQgbGVhc3QgYnkKPj4gdHdpc3RlZC93ZWIvY2xpZW50LnB5IGFuZCB0d2lzdGVkL2Nv
bmNoLgo+IAo+IFRoaXMgY29tbWl0IGxvZyByZWFsbHkgaXNuJ3QgY2xlYXIsIGVzcGVjaWFsbHkg
d2hlbiBsb29raW5nIGF0IHRoZQo+IHBhdGNoIGJlbG93Lgo+IAo+IEluZGVlZCwgdGhlcmUgaXMg
YWxyZWFkeSBhIGZhaWx1cmUgKnRvZGF5KiB3aXRob3V0IGFueSBjaGFuZ2UgdG8gdGhlCj4gdGVz
dCBjYXNlLCBhbmQgdGhlIGZhaWx1cmUgaXMgdGhhdCB6bGliIGlzIG1pc3NpbmcgaW4gdGhlIGRl
cGVuZGVuY3kuCj4gCj4gQnV0IGluIGFkZGl0aW9uIHRvIGFkZGluZyB0aGUgemxpYiBkZXBlbmRl
bmN5LCB5b3UgKmFsc28qIGV4dGVuZCB0aGUKPiB0ZXN0IHNjcmlwdCBieSBpbXBvcnRhbnQgc29t
ZSBtb3JlIG1vZHVsZXMsIGFzIGlmIHRoaXMgd2FzIG5lZWRlZCB0bwo+IHRlc3QgdGhlIHpsaWIg
ZGVwZW5kZW5jeS4KPiAKPiBTbyBpdCdzIG5vdCByZWFsbHkgY2xlYXIgdG8gbWUgd2hhdCB5b3Un
cmUgdHJ5aW5nIHRvIHNheSBoZXJlLiBDb3VsZAo+IHlvdSBjbGFyaWZ5PwoKQ3VycmVudGx5IHRo
ZSB0ZXN0IFRlc3RQeXRob25Ud2lzdGVkIGlzICpub3QqIGJyb2tlbiBbMV0gc2luY2UgaXQgZG9l
c24ndCB0ZXN0CmFsbCBtb2R1bGVzIHByb3ZpZGVkIGJ5IHB5dGhvbi10d2lzdGVkIHBhY2thZ2Uu
CgpEdWUgdG8gdGhpcywgb3RoZXIgcnVudGltZSB0ZXN0IGxpa2UgVGVzdFB5dGhvblB5M01hZ2lj
V29ybWhvbGUgb3IKVGVzdFB5dGhvblB5M1R4dG9yY29uIGFyZSBjdXJyZW50bHkgYnJva2VuLgoK
VGVzdFB5dGhvblR3aXN0ZWQgc2hvdWxkIGhhdmUgZmFpbGVkIGR1ZSB0byBtaXNzaW5nIHpsaWIg
KGhlbmNlIG15IHNsaWdodCB1cGRhdGUKaW4gc2FtcGxlX3B5dGhvbl90d2lzdGVkLnB5KQoKWzFd
Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnM/bmFtZT10
ZXN0X3B5dGhvbl90d2lzdGVkLlRlc3RQeXRob25QeTNUd2lzdGVkClsyXSBodHRwczovL2dpdGxh
Yi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzgxOTk5OTI2ODcKWzNdIGh0dHBz
Oi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvODE5OTk5MjY0NgoK
QmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFRob21hcwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
