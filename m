Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815D1E6B27C
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 13:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26BA884487;
	Fri,  1 Nov 2024 13:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ySOgi_AxEQA; Fri,  1 Nov 2024 13:43:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAD618447F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAD618447F;
	Fri,  1 Nov 2024 13:43:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67A773B
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 13:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 550C14048D
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 13:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQTODW9WYhG2 for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 13:43:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B860440132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B860440132
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B860440132
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 13:43:45 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3807dd08cfcso1554817f8f.1
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 06:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730468623; x=1731073423;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U7HxwzygZiZDbYB/PHSCA7RHH/lXGrc8lPqyLqx6/pw=;
 b=VIkXo3rA4/3r2m7BuagEVtEaOdEDCPghr36IwjhEyR6bK7x68BaUhs1f0vLgn/uKQc
 exJypNW8vny5GAWbaPsQG5ULIvMDWkdCa64I96Icy/a8jFmCjbhcRIkf+cQ/qLXG/vul
 kjXh27Lt9CKjQONwMtdMCmI1/m3DMqc9oiiDytaNShijr1EXk+rg++b0ZfVpJTuTMcQF
 7/021G+arFCQMcUXUgfA7tx9HOqzTaDCA/x3qi8EX6pGDh9MD9gmiYtqZtHzTdOg8DQS
 +GCG1dM/BGOB7md82R3VrsRQc5e9aQRjWLUBmclh9ohzX08udAXlaZ0LC5+YgWQubKOS
 3wIg==
X-Gm-Message-State: AOJu0YwA0bruaUy2sclr3dxwjfB8yBDDNKa4rh/s6I09Ds7IjyJ5zmLr
 k9/O6VKjrM8tjjRLOYhhcOOUiTZFfjb0vHpVfZKVo3yEqiwTUkcwzkNNYznWF3I=
X-Google-Smtp-Source: AGHT+IEa5ik4makOH/JyzscSw8lGQrpO51XIH8aOiztu269zaBM2fqkhTlZNa3p81hZkkhInrnFOjg==
X-Received: by 2002:a5d:5a13:0:b0:37c:fbf8:fc4 with SMTP id
 ffacd0b85a97d-381c7af3be3mr3622451f8f.59.1730468623061; 
 Fri, 01 Nov 2024 06:43:43 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10ea7a1sm5202741f8f.62.2024.11.01.06.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Nov 2024 06:43:42 -0700 (PDT)
Message-ID: <56a352ef-8ed9-4fea-abb5-9e2b98678f2b@smile.fr>
Date: Fri, 1 Nov 2024 14:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
References: <20241031213348.2057705-1-ju.o@free.fr>
 <20241031213348.2057705-7-ju.o@free.fr>
 <62b6862c-a837-4267-8aa1-f54ab5acb667@smile.fr>
 <6168f547475ebb157af2848ef09b9a22@free.fr>
Content-Language: fr
In-Reply-To: <6168f547475ebb157af2848ef09b9a22@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730468623; x=1731073423; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U7HxwzygZiZDbYB/PHSCA7RHH/lXGrc8lPqyLqx6/pw=;
 b=UNZgjcWKFsVr3TR6ywJ4ZFtVFk8Snnr5GnWPO1b+0BT34hpSz4ZUfFffWl/d6WXfI1
 z+wSLmhEYa7d0X9O2jSy4VCzjcQYYUTbLZ9HTshyu/72QtJli6KaRLv0pcCGjBMSQTEg
 UBHU3LnnHg0aWzckCblKTrRhBhz29LAo+iAeI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=UNZgjcWK
Subject: Re: [Buildroot] [PATCH v3 6/8] support/testing: test_edk2: update
 and re-enable the test
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

SGVsbG8gSnVsaWVuLAoKTGUgMDEvMTEvMjAyNCDDoCAxMjoyMywgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBIaSBSb21haW4sCj4gCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+IAo+IE9u
IDMxLzEwLzIwMjQgMjM6MDksIFJvbWFpbiBOYW91ciB3cm90ZToKPj4gSGVsbG8gSnVsaWVuLAo+
Pgo+PiBMZSAzMS8xMC8yMDI0IMOgIDIyOjMzLCBKdWxpZW4gT2xpdmFpbiBhIMOpY3JpdMKgOgo+
Pj4gVGhlIEVESzIgYnVtcCB0byBzdGFibGUyMDI0MDUgaW50cm9kdWNlZCBhbiBpbmNvbXBhdGli
aWxpdHkgd2l0aCB0aGUKPj4+IFFlbXUgdmVyc2lvbiA1LjIuMCBwcmVzZW50IGluIHRoZSByZWZl
cmVuY2UgRG9ja2VyIGltYWdlLiBGb3IgdGhhdAo+Pj4gcmVhc29uLCB0aGlzIHRlc3Qgd2FzIGRp
c2FibGVkLgo+Pj4KPj4+IFRoaXMgY29tbWl0IHVwZGF0ZXMgQVRGIHRvIDIuMTEgYW5kIGtlcm5l
bCB0byA2LjYuNTgsIGFuZCBlbmFibGVzCj4+PiBob3N0LXFlbXUgaW4gdGhlIGJ1aWxkLCB0byBi
ZSB1c2VkIGJ5IHRoZSBydW50aW1lIHRlc3QgaW5mcmFzdHJ1Y3R1cmUuCj4+Pgo+Pj4gVGhvc2Ug
Y2hhbmdlcyBhcmUgZml4aW5nIHRoaXMgdGVzdCwgd2hpY2ggaXMgd2h5IHRoaXMgY29tbWl0IHJl
LWVuYWJsZXMKPj4+IGl0IGJ5IHJlbW92aW5nIHRoZSBza2lwVGVzdCgpIGludm9jYXRpb24uCj4+
Cj4+IERvIHdlIHdhbnQgdG8gc3dpdGNoIHRvIG5lb3ZlcnNlLW4xID8KPj4gVGhlIHRlc3Qgc3Rp
bGwgd29ya3Mgd2l0aCBjb3J0ZXgtYTU3Lgo+IAo+IEkgdGhpbmsgdGhpcyBraW5kIG9mIHNtYWxs
IGltcHJvdmVtZW50IGNhbiBiZSBkb25lIGxhdGVyLAo+IGluIGZvbGxvd3VwIHBhdGNoZXMuCgpB
Z3JlZS4KCj4gCj4gVGhlIGluaXRpYWwgZ29hbCBvZiB0aGlzIHNlcmllcyB3YXMgdG8gZml4IHRo
ZQo+IHFlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZpZywgd2l0aG91dCBicmVha2luZyB0aGUgcnVu
dGltZSB0ZXN0cy4KPiAKPiBUZWNobmljYWxseSwgdGhpcyB0ZXN0IGNoZWNrcyB0aGUgRURLMiBy
ZWNpcGUgYnVpbGRzIGFuZCBib290cy4KPiBJdCBpcyBub3QgY2hlY2tpbmcgZm9yIHRoZSBTQlNB
IGNvbXBsaWFuY2UuCj4gSW4gdGhpcyBjdXJyZW50IHN0YXRlLCB0aGlzIHRlc3Qgc3VjY2VlZC4K
PiAKPiBUaGlzIHNlcmllcyB3YXMgc3RhcnRpbmcgdG8gYmUgImNvbXBsZXgiIGluIHRoZSBzZW5z
ZSBpcyBpdAo+IG1peGluZyBtYW55IHRvcGljcy4gTXkgaW50ZW50IHdhcyB0byBrZWVwIG90aGVy
IGltcHJvdmVtZW50cwo+IGZvciBsYXRlciwgdG8gbGltaXQgdGhlIG51bWJlciBvZiBjaGFuZ2Vz
LgoKSW5kZWVkLiBNYXliZSB3ZSBjYW4gbW92ZSB0aGUgbmVvdmVyc2UtbjEgY2hhbmdlIGF0IHRo
ZSBlbmQgb2YgdGhlIHNlcmllcyB0bwphdm9pZCBhbnkgY29uZnVzaW9uIHdpdGggdGhlIHRlc3Rz
IHVwZGF0ZT8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBJZiB0aGlzIHNlcmllcyBpcyBt
ZXJnZWQsIGhhdmluZyB0aGUgY2FwYWJpbGl0eSB0byB1c2UgdGhlCj4gaG9zdC1xZW11IGluIHJ1
bnRpbWUgdGVzdHMgd2lsbCBhbGxvdyBtYW55IHBlci10ZXN0IGltcHJvdmVtZW50cywKPiBpbiBp
bmRpdmlkdWFsIGNvbW1pdHMuCj4gCj4+IE90aGVyd2lzZToKPj4gUmV2aWV3ZWQtYnk6IFJvbWFp
biBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IFJv
bWFpbgo+IAo+IEJlc3QgcmVnYXJkcywKPiAKPiBKdWxpZW4uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
