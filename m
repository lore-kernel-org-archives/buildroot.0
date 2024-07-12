Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FC3C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7338541994;
	Fri, 12 Jul 2024 20:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmLcy0hgg-kN; Fri, 12 Jul 2024 20:08:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1070E419D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1070E419D5;
	Fri, 12 Jul 2024 20:08:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E1921BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0831B4011D
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3UCPMuURZ4tq for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:08:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 893BD4000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 893BD4000B
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 893BD4000B
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:08:14 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4279f48bd94so7301705e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720814892; x=1721419692;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zn/XLBU7bXEvK6uBstjRlQhHT93E6v93818NM8I0ujc=;
 b=dDaEfzNNlMZMtuulFs5L4IoiZwkfpme6zH/edC+rRxQBawZzSUHbPOsZcxGolzCW26
 hyh9i4Qa7WBibaJCzTev9rwoo2DwikKf2nQC/rSgV0z96agls4ogjMg3tEngecJ1TWu+
 MFZD5eRgnVvmanvTPj8K4mQyCa58J9v1osv0GLU85wCg/GsyXDXCoz/R/pbPLtARELd2
 2M9vQygv44DDvU5mQ6xHocs3mEOT76BUeAIHZ5wQ+l/vaEZjT/76xcfo9iW8xEjY/y3y
 9MQMcPWX1MFd3VQxhzuiRtnIAwWMJWzxwVW3TgbuvcJVlFf5XgAqwG6lwW3bECp0/4BQ
 OrKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYydo+XynfzzXIRgLnGluTWyD4ERojU6JGQdwn1H+G27RFmgmfxlUyswxswvF83qydpL+LBHW+phpztqWRtMHvq2kxjuvG8A==
X-Gm-Message-State: AOJu0YxRHSfGzT474fBbeRprNDwLB+UiMPcGHNU3luXbxB8TZSF9oKf5
 fRBevsNfw7DAXOigoriZfY0rgln43DSFpHjfmGq0H5H965KuXLuOsEemQ+MdN/8=
X-Google-Smtp-Source: AGHT+IEOHlEVucxuMIyJ+UDK+hJR9ElRRwSG/ZhlfVL6Mohq7x/F41v0mJZd0fzZovtrMGTapeeCgQ==
X-Received: by 2002:a05:600c:4797:b0:426:6945:75b8 with SMTP id
 5b1f17b1804b1-426708f14ccmr82309135e9.31.1720814892520; 
 Fri, 12 Jul 2024 13:08:12 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2c1e07sm32359095e9.45.2024.07.12.13.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 13:08:12 -0700 (PDT)
Message-ID: <bac58c99-45bc-4d7d-9b34-1fca6bbdfd24@mind.be>
Date: Fri, 12 Jul 2024 22:08:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lang <dalang@gmx.at>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230916154940.746749-1-fontaine.fabrice@gmail.com>
 <37f6d34b-589e-4570-88d7-28aa967d45b5@gmx.at>
 <CAPi7W83Uf-Cjr7EWJEmN_E90FkqBq50jv2vJtK5yk+DJ2CLMTw@mail.gmail.com>
 <8c7c1d56-02a1-4a1f-a5b2-cae3928d79ba@gmx.at>
Content-Language: en-GB
In-Reply-To: <8c7c1d56-02a1-4a1f-a5b2-cae3928d79ba@gmx.at>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720814892; x=1721419692; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zn/XLBU7bXEvK6uBstjRlQhHT93E6v93818NM8I0ujc=;
 b=IaMjR4fUo91wsTsyfGrryj25w9xAKX7IySZgWGZdfbJRXSuVEeIuzw00mhW0H/NSw0
 BWvhokh4ikGd+nDt4Ljgtwm2JCOshYiEj6YT9N0RYr9iSDs0rWy0vg/LXSA7PD31h4hN
 X91z9tO/cwNSB1427SSG+znPWeOBED6vven2hosYVCmmD2vaOOnwZirr1Uj4II7X/Jky
 fCOnFOWUigQJndP4d/RV36X4iOzsDt7lDL0Sk3w7etsTUVi+55OKW+XIUtprcs/Z7KmV
 4/sl62PXbP2FE73PDCDPtCqGQ63VAW+hLFUrKczS5AOU1noSqdtV3/ZOuxlcZ5qgRdDv
 PW/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IaMjR4fU
Subject: Re: [Buildroot] [PATCH 1/1] package/at-spi2-core: propagate dynamic
 library dependency
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Simon Dawson <spdawson@gmail.com>,
 James Knight <james.knight@collins.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBhbGwsCgpPbiAyMC8wOS8yMDIzIDA1OjUxLCBEYW5pZWwgTGFuZyB3cm90ZToKPiBIaSBG
YWJyaWNlLAo+IAo+IE9uIDE5LjA5LjIzIDA4OjIyLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+
PiBIaSBEYW5pZWwsCj4+Cj4+IExlwqBtYXIuIDE5IHNlcHQuIDIwMjMgw6DCoDA2OjQyLCBEYW5p
ZWwgTGFuZyA8ZGFsYW5nQGdteC5hdCA8bWFpbHRvOmRhbGFuZ0BnbXguYXQ+PiBhIMOpY3JpdMKg
OgoKW3NuaXBdCj4+ICAgICAgSSB3b3VsZCBsaWtlIHRvIHByb3Bvc2UgYW5vdGhlciBzb2x1dGlv
biwgdGhhdCB3b3VsZCBmaXggdGhlIHByb2JsZW06Cj4+ICAgICAgU29tZSB3ZWVrcyBhZ28gSSBz
ZW5kIGluIGEgcGF0Y2ggWzBdIHRvIGF0LXNwaTItY29yZSB0aGF0IG1ha2VzIGl0IHBvc3NpYmxl
Cj4+ICAgICAgdG8gZGVzZWxlY3QgdGhlIHJ1bnRpbWUgbW9kdWxlIG5lZWRlZCBieSBHVEsyLiBU
aGlzIG1vZHVsZSBpcyBhbHdheXMgY29tcGlsZWQKPj4gICAgICBhcyBsaWJyYXJ5IGFuZCBzZWVt
cyB0byBiZSB0aGUgb25seSB0aGluZyB0aGF0IHdvdWxkIGZvcmNlICJkZXBlbmRzIG9uICFCUjJf
U1RBVElDX0xJQlMiLgo+Pgo+PiAgICAgIFNvIG15IHByb3Bvc2FsIHdvdWxkIGJlIHRvIG9ubHkg
YWRkIHRoZSAiZGVwZW5kcy4uLiIgaWYgTElCR1RLMiBpcyBzZWxlY3RlZCBhbmQKPj4gICAgICB1
c2UgdGhlIHBhdGNoIHRvIGV4Y2x1ZGUgdGhlIHJ1bnRpbWUgbW9kdWxlLiBXaXRoIHRoaXMgd2Ug
b25seSBuZWVkIHRvIHByb3BhZ2F0ZQo+PiAgICAgIGl0IHRvIExJQkdUSzIuCj4+Cj4+ICAgICAg
VmVyc2lvbiAyLjUwIHdhcyByZWxlYXNlZCBpbiB0aGUgbWVhbiB0aW1lLCB3aGljaCBjb250YWlu
cyB0aGUgbWVudGlvbmVkIHBhdGNoLgo+PiAgICAgIEZvciBzdGFibGUgYnJhbmNoZXMgdGhlIHBh
dGNoIGlzIG5lZWRlZC4KPj4KPj4KPj4gSWYgeW91IGNhbiBkcm9wIHRoZSBkeW5hbWljIGxpYnJh
cnkgZGVwZW5kZW5jeSBmcm9tIGF0LXNwaTItY29yZSwgZmVlbCBmcmVlIHRvIHNlbmQgYW5vdGhl
ciBwYXRjaC4KPiAKPiBJJ20gbm90IGFibGUgdG8gZHJvcCB0aGUgZGVwZW5kZW5jeSBjb21wbGV0
ZWx5Lgo+IEJ1dCB0aGUgc2V0IG9mIGFmZmVjdGVkIHBhY2thZ2VzIHdvdWxkIGRyb3AgZnJvbSAx
MiB0byA3Lgo+IGF0a21tLCBhdGttbTJfMjgsIGd0a21tMywgbGliZ3RrMywgdnRlIHdvdWxkIG5v
dCBiZSBjaGFuZ2VkLgoKICBXZSdyZSBtb250aHMgbGF0ZXIsIHRoZSBidW1wIHRvIDIuNTAuMCBo
YXMgYmVlbiBtZXJnZWQsIHNvIGl0IHNob3VsZCBiZSAKcG9zc2libGUgbm93IHRvIGRyb3AgdGhl
IGRlcGVuZGVuY3kgb24gIVNUQVRJQywgcmlnaHQ/IElJVUMgaXQgdGFrZXMgYSBsaXR0bGUgCm1v
cmUgZWZmb3J0IGJlY2F1c2Ugd2UgYWxzbyBuZWVkIGEgd2F5IHRvIGVuYWJsZS9kaXNhYmxlIHRo
ZSBndGsyX2F0a19hZGFwdG9yIApvcHRpb24uLi4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gSSdt
IG5vdCBxdWlldCBzdXJlIHdoYXQgdGhlIGJlc3QgYXBwcm9hY2ggd291bGQgYmUgdG8gYWxzbyBt
YWtlIGl0Cj4gdmlhYmxlIGZvciBzdGFibGUgYnJhbmNoZXMuCj4gTXkgcHJvcG9zYWwgbmVlZHMg
YSBwYXRjaCBbMF0sIHdoaWNoIHJlbW92ZXMgdGhlIHJ1bnRpbWUgbGlicmFyeS4KPiBOb3Qgc3Vy
ZSB0aGF0IHBhdGNoIHNob3VsZCBiZSBwaWNrZWQgdXAgYnkgc3RhYmxlLgo+IEZvciBtYXN0ZXIg
dGhlIHBhdGNoIGlzbid0IG5lZWRlZCwgYSBidW1wIHRvIDIuNTAgaW5jbHVkZXMgaXQuCj4gCj4g
U28gSSBndWVzcyB0aGVyZSBhcmUgdHdvIG9wdGlvbnM6Cj4gMS4gVXNlIHRoaXMgcGF0Y2ggZm9y
IG1hc3RlciBhbmQgc3RhYmxlLiBCdW1wIGFuZCBkcm9wIGR5bmFtaWMgbGlicmFyeQo+IGRlcGVu
ZGVuY3kgbGF0ZXIuCj4gMi4gVXNlIHRoaXMgcGF0Y2ggZm9yIHN0YWJsZSBvbmx5LiBCdW1wIGFu
ZCBkcm9wIGR5bmFtaWMgbGlicmFyeQo+IGRlcGVuZGVuY3kgZGlyZWN0bHkuCj4gCj4gT25seSBv
cGluaW9ucz8KPiAKPiBSZWdhcmRzLCBEYW5pZWwKPiAKPiBbMF06IGh0dHBzOi8vZ2l0bGFiLmdu
b21lLm9yZy9HTk9NRS9hdC1zcGkyLWNvcmUvLS9jb21taXQvNTIwYTdiMTZiMDA5M2E5NjU1NDJh
Mzg4MGIyZTNiMjc2ZmJlMDZkOAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
