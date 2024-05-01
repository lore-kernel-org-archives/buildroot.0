Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D750C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB30260087;
	Wed,  1 May 2024 19:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDc8efAhwd8Y; Wed,  1 May 2024 19:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E90C6605E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E90C6605E6;
	Wed,  1 May 2024 19:09:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B6E591BF578
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A378D41711
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q7-cQQpElBC5 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:09:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D2DA041710
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2DA041710
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2DA041710
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:09:27 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-34e040ed031so198089f8f.0
 for <buildroot@buildroot.org>; Wed, 01 May 2024 12:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714590565; x=1715195365;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ivAt1TLB7COcFtb5QoozMRhb6Hu5swYriekqq6Svz4g=;
 b=hOcE2KnTDFnRSU50SusfJLH4YIg6hyxooSKMqOA3UBbJmfDzeqAREuvSEP3soNblFB
 fLFsAoLuJATLG1zjdIJC0W0X+HoTF3LI7DdJfDtwaVuy1DfsTKMpIGjd5HgXL9m8uOWf
 nQ58f3CpkNdtuHItKRooRGm6c91qqYm4zrW11shFuJ3enPy0TgNOW+kjiCyHh+cJRp6h
 6Dghz6F6nmsRY9xewRC+bovMWqR+yb5k9Y+Y6OmvH8JJ6mWLDjOVN++EyX6Kj/QVfxlx
 SY8PVAGkinWCJv791nnXlyysANiYNWQdxnoXPJ+yRumpF+sDtkQYqcgTaoEt0X2KjMQ8
 9rYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIhXcv5H+4qPEDz/N+Ufbzf+nrgSTFsK9wyx1aHaKswtRTVjNr7yFjlKxVOc5XQvL4JpoHsoXqFA9zpTuXT8CcTlhZTdd2Yw==
X-Gm-Message-State: AOJu0Yz5ZVt4j+TQimZ4YMf39SfmUr5Ni40eq96g9n85ewQb4U8+Lo4o
 2DKBWK57etgyq6zp2X1v7uEyieKqfdlVi8lnZlFiqu5N5UJUSv42SAyqLdPfCBIiHKbM6VC5avT
 I
X-Google-Smtp-Source: AGHT+IFtu3B88qZzntWEFwFhq8O6mLwRfRT/kZ9I+410pWt6KwhQw3z0QvmO2byz2bNVWLHYVNFzIQ==
X-Received: by 2002:a5d:64ca:0:b0:34d:b243:5415 with SMTP id
 f10-20020a5d64ca000000b0034db2435415mr2672632wri.70.1714590565083; 
 Wed, 01 May 2024 12:09:25 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 d4-20020adfe2c4000000b0034a3a0a753asm33497648wrj.100.2024.05.01.12.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 12:09:24 -0700 (PDT)
Message-ID: <0e92066e-ce6f-4d69-9f43-979c62a4d40c@mind.be>
Date: Wed, 1 May 2024 21:09:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 buildroot@buildroot.org
References: <20220917205253.3737d1c6@windsurf>
 <6338e428-df6e-40db-8a99-9390d150131d@newtesc.com.br>
Content-Language: en-GB
In-Reply-To: <6338e428-df6e-40db-8a99-9390d150131d@newtesc.com.br>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714590565; x=1715195365; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ivAt1TLB7COcFtb5QoozMRhb6Hu5swYriekqq6Svz4g=;
 b=JCKbnE/MK74hUXjUHZbb6lSPXDW4j3jAPbZY77y3Fv7/hd4ALv38hlWCJVWxqsN7FR
 JcJdZqj4qCep97W9zdbFHqpryB2bJlc2K1I8B0/2l9DAq6cDTFWovmvlPucV1EBZNHK3
 P4KJ8CnXuhoPx3F3PurBapL/0RBtgjLiCWLHOZZgL4PT/hVlFkPsZ1g/W6X1IfC7v96v
 ziLEEPgGxFzirYm2M4KA2cV7I9MGyNAKfRqytKySjlBaQnStA3iEOzGisWoFb1KV31Jf
 4DaWj4BRaCvRAoBK5pFu3FE2dgrfziUPRu2px9Tf1h9740lyPtXb/pGppN41iMIz+MWL
 RqMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JCKbnE/M
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-download: add per package
 download fallback disable
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAzMC8wNC8yMDI0IDE5OjU2LCBGbMOhdmlvIFRhcGFqw7NzIHdyb3RlOgo+IFNvcnJ5IHRv
IG5lY3JvYnVtcCwgYnV0IHN1Y2ggYSBmZWF0dXJlIHdvdWxkIGJlIGhhbmR5IHdoZW4gdXNpbmcg
Rk9PX0RMX09QVFMgdG8gCj4gZW5zdXJlIGh0dHAgYXV0aGVudGljYXRpb24uCj4gCj4gVG9rZW5z
LCB1c2VybmFtZXMgb3IgcGFzc3dvcmRzIHdpbGwgYmUgbGVha2VkIHRvIHRoZSBmYWxsYmFjayBz
ZXJ2ZXIgaW4gY2FzZSBvZiAKPiBmYWlsdXJlIG9mIHRoZSBwcmltYXJ5IHNvdXJjZS4gVGhpcyBj
b3VsZCBiZSBzb21lIHNvdXJjZSBvZiB2dWxuZXJhYmlsaXR5CgogIEkgZG9uJ3Qgc2VlIGhvdyBh
bnkgb2YgdGhlc2Ugd291bGQgYmUgbGVha2VkLi4uCgogIEEgdG9rZW4gaXMgcGFzc2VkIGVpdGhl
ciBhcyBhIHBhc3N3b3JkIG9yIGFzIGEgaGVhZGVyLiBUaGVyZSdzIG5vIHdheSB0byAKc3BlY2lm
eSBwZXItcGFja2FnZSB3Z2V0IG9wdGlvbnMgYW55d2F5LCBzbyBJIGd1ZXNzIGl0IHdpbGwgYmUg
cGFzc2VkIGFzIGEgcGFzc3dvcmQuCgogIEEgcGFzc3dvcmQgY2FuIGVpdGhlciBiZSBwYXNzZWQg
aW4gLm5ldHJjIG9yIC53Z2V0cmMgKGluIHdoaWNoIGNhc2UgaXQgaXMgCnNpdGUtc3BlY2lmaWMg
c28gd29uJ3QgYmUgc2VudCB0byBQUklNQVJZX1NJVEUgb3IgQkFDS1VQX1NJVEUpLCBvciBpdCBj
YW4gYmUgCnBhc3NlZCBpbiB0aGUgVVJMLCBhcyBodHRwczovL3VzZXI6cGFzc0BzZXJ2ZXIuY29t
L3BhdGgvc291cmNlLnRhci5negpUaGUgd2hvbGUgdXNlcjpwYXNzIHBhcnQgYWxzbyBkb2Vzbid0
IGdldCB1c2VkIGluIFBSSU1BUllfU0lURSBvciBCQUNLVVBfU0lURS4KCiAgVGhlIGFib3ZlIGFw
cGxpZXMgdG8gaHR0cCBkb3dubG9hZHMuIEZvciBvdGhlciBkb3dubG9hZHMsIGl0IGRvZXNuJ3Qg
ZXZlbiAKbWF0dGVyIGF0IGFsbCwgYmVjYXVzZSB0aGF0IGRvd25sb2FkIG1ldGhvZCB3b24ndCBi
ZSB1c2VkIGZvciBQUklNQVJZX1NJVEUgYW5kIApTRUNPTkRBUllfU0lURSBzbyBhbnkgYXV0aGVu
dGljYXRpb24gc3R1ZmYgd29uJ3QgYmUgdXNlZCBlaXRoZXIuCgogIFNvIGhvdyBkb2VzIGxlYWtp
bmcgdGFrZSBwbGFjZT8KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
