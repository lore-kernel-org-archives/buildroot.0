Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99BDC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A12774055F;
	Sat, 13 Jul 2024 20:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nk_GCpuNMeKM; Sat, 13 Jul 2024 20:09:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40C3440567
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40C3440567;
	Sat, 13 Jul 2024 20:09:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4D4B1BF271
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADD26409E8
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c9VLCCB2Wt6M for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:09:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 492DE409DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 492DE409DD
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 492DE409DD
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:09:34 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-36798779d75so2719678f8f.3
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 13:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720901373; x=1721506173;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bhgFTbWCAzn9wzEldjLpP94CFxysgmq4nd3ohGNstII=;
 b=usSyR6/ujGvmiOA7u5vrk1yRkcqPb3b9gwOdaGXZHtBlmSmwCpQwYWhbPZbf1s2aYA
 shv3Xb2T94yOadeoFVrDU2umPSxUbu1y9txSU5VPc/a7ZwySMxrFXblLZ1HTMRmn+Md8
 yBmxANB6+bq+SLLEjB7ecMKdhkTb/QEAoZhuSTJUAD4CbrxpMF/APxHDogT6/5bi/8pe
 2fg6v7/msfBmovtUGIw3OAAcTgcTFq7BJ8i7PMb6wFQhvxyY2G/LqIRWeWWxrLc5GEGn
 wr/EYi8TmLxLsRb/iLt9gnwmRGKKzYOW2ZOlahCU+9DS30dBxd65HHFa5NPRnnbSq8MH
 j/8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhe4L0nW5rZQ3EM2j2yHfRe+xu9CTgCr0giT9m18Ly8wu4xIZMx6vYNEXPuWl2ZUccUiKKV+FY5okY7mNcXab5vvv0VP8crg==
X-Gm-Message-State: AOJu0YzQIN/VmX1IeT0pfVu6rLvjfIGvpq06JpeWbJcDpzw5dk2NzXIN
 PZ3AUJKCZ3jB8kZhOnVffydG+N+FeMHJ1mNneqHozayPVA7IWi9Q7L+v0fYgM2fLI6/sXcpuMVx
 7d4c=
X-Google-Smtp-Source: AGHT+IHBbGybysEK6cNTiZwiXxIJaVPjc02gj0z5wFBkJzy1D30DWpVGc85dyqIkNtDmJB61J48Pow==
X-Received: by 2002:adf:f20b:0:b0:366:f04d:676f with SMTP id
 ffacd0b85a97d-367cea45b54mr12101018f8f.12.1720901372668; 
 Sat, 13 Jul 2024 13:09:32 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dab3b2bsm2277105f8f.20.2024.07.13.13.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Jul 2024 13:09:32 -0700 (PDT)
Message-ID: <ffa0f733-474e-485d-8da4-6d729139809a@smile.fr>
Date: Sat, 13 Jul 2024 22:09:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20240701-versal-xsa-support-prebuilt-v3-1-3d3e9318d181@collins.com>
 <7d46feba-19c0-4cb4-aeb9-898e863691a3@smile.fr>
 <D2OJRRC9Z5XN.3I6WU5HEIZB24@collins.com>
 <29dbb9d5-e35d-4ea5-bfda-cb4edac504d9@smile.fr>
 <D2OOCH8PNMRR.2A90SMBTA8GG@collins.com>
Content-Language: fr, en-US
In-Reply-To: <D2OOCH8PNMRR.2A90SMBTA8GG@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720901373; x=1721506173; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bhgFTbWCAzn9wzEldjLpP94CFxysgmq4nd3ohGNstII=;
 b=C6Bf/ZVu5g4FehQxKBqmQvjhArHSFilOnysPlBW8VXLFdvBre+Wr3HKGUErADopigf
 JZVgFGZm5WkTEF7i2RwgiNfWhp1qoe+5vQv3IAebGdd5reKioH4ial+P1QI9biJxRzTT
 yu071ZFpqoqYOXkgdF/F8KUam4kCFyoE/THKI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=C6Bf/ZVu
Subject: Re: [Buildroot] [PATCH v3] boot/xilinx-prebuilt: support custom
 boards using XSA
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAxMy8wNy8yMDI0IMOgIDIxOjU2LCBCcmFuZG9uIE1haWVyIGEgw6ljcml0wqA6
Cj4gT24gU2F0IEp1bCAxMywgMjAyNCBhdCA0OjQ2IFBNIFVUQywgUm9tYWluIE5hb3VyIHZpYSBi
dWlsZHJvb3Qgd3JvdGU6Cj4+IEhlbGxvIEJyYW5kb24sCj4+Cj4+IExlIDEzLzA3LzIwMjQgw6Ag
MTg6MjEsIEJyYW5kb24gTWFpZXIgYSDDqWNyaXTCoDoKPj4+IE9uIFNhdCBKdWwgMTMsIDIwMjQg
YXQgNDowOCBQTSBVVEMsIFJvbWFpbiBOYW91ciB2aWEgYnVpbGRyb290IHdyb3RlOgo+Pj4+IEhl
bGxvIEJyYW5kb24sIEFsbCwKWy4uLl0KPj4+Pj4gQEAgLTIwLDEyICszMSwyMiBAQCBpZmVxICgk
KEJSMl9UQVJHRVRfWElMSU5YX1BSRUJVSUxUX1ZFUlNBTCkseSkKPj4+Pj4gICMgV2UgbmVlZCB0
aGUgKi5wZGkgZ2xvYiwgYmVjYXVzZSB0aGUgZmlsZSBoYXMgZGlmZmVyZW50IG5hbWVzIGZvciB0
aGUKPj4+Pj4gICMgZGlmZmVyZW50IGJvYXJkcywgYnV0IHRoZXJlIGlzIG9ubHkgb25lLCBhbmQg
aXQgaGFzIHRvIGJlIG5hbWVkCj4+Pj4+ICAjIHZwbF9nZW5fZml4ZWQucGRpIHdoZW4gaW5zdGFs
bGVkLgo+Pj4+PiAraWZlcSAoJChCUjJfVEFSR0VUX1hJTElOWF9QUkVCVUlMVF9WRVJTQUxfWFNB
KSx5KQo+Pj4+PiArWElMSU5YX1BSRUJVSUxUX1BMTSA9ICQoQEQpL3BkaV9maWxlcy9nZW5fZmls
ZXMvcGxtLmVsZgo+Pj4+PiArWElMSU5YX1BSRUJVSUxUX1BTTUZXID0gJChARCkvcGRpX2ZpbGVz
L3N0YXRpY19maWxlcy9wc21fZncuZWxmCj4+Pj4KPj4+PiBpcyAnXycgY2hhcmFjdGVyIGludGVu
ZGVkIGluICJwc21fZncuZWxmIiBmaWxlIG5hbWUgaW5zdGVhZCBvZiAicHNtZncuZWxmIiBhcwo+
Pj4+IGZvciBYaWxpbnggZGV2IGJvYXJkcz8KPj4+Cj4+PiBJIGhhZCBub3Qgbm90aWNlZCB0aGF0
LiBJIGRvdWJsZS1jaGVja2VkIGFuZCB0aGUgZmlsZSBkb2VzIGhhdmUgJ18nCj4+PiBpbnNpZGUg
dGhlIFhTQSwgYnV0IGRvZXMgbm90IGluIHRoZSBYaWxpbnggcHJlYnVpbHQgcmVwby4gSXQgaXMg
c3RyYW5nZSwKPj4+IGJ1dCB0aGlzIGRvZXMgd29yayBhcyBpbnRlbmRlZC4KPj4KPj4gT2ssIHRo
YXQgaXMgc3RyYW5nZSBpbmRlZWQuCj4+Cj4+IE1heWJlIGEgY29tbWVudCBhYm91dCB0aGF0IGlu
IHRoZSAubWsgd291bGQgYmUgdXNlZnVsPwo+IAo+IE5vIHByb2JsZW0sIEkgc2VudCBhIHY0IHRv
IHJld29yZCB0aGUgY29tbWVudCBibG9jayBhYm92ZSB0byBjYWxsIG91dAo+IHRoZSBwc21fZncu
ZWxmCgpUaGFua3MsIEkgZmluYWxseSBhZGRlZCBhIGNvbW1lbnQgYmVmb3JlIG1lcmdpbmcgdGhl
IFYzLgoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0
LzFkY2IzMTFhZmUxMDQzYmYzNjkwOTllZWM4YjZmYTZhMDZhZGMwZmIKCkJlc3QgcmVnYXJkcywK
Um9tYWluCgoKPiAKPiBUaGFua3MsCj4gQnJhbmRvbgo+IAo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+
IFJvbWFpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
