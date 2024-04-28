Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89403C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 17:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BC6781331;
	Sun, 28 Apr 2024 17:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWYRfaMGV_vm; Sun, 28 Apr 2024 17:29:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AE3981332
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AE3981332;
	Sun, 28 Apr 2024 17:29:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 661D01BF852
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 17:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 530B860635
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 17:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufQdbH1wwRXM for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 17:29:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6BFEC60633
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BFEC60633
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BFEC60633
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 17:29:21 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41c1b75ca31so3557055e9.2
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 10:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714325359; x=1714930159;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W9a2TSRTD7vviI4ioONovKvOIJGHDT3BV4GY1dbH2Do=;
 b=P09CTGKylmC6z2ydprzloqb54mYjKJ4Sq/nk9TeYCZ+fsZ7ZPtAk9CzzlhQ2I3WNzc
 uX4/svlSltKteATjhkSLT12+OApwKTbZEgdy/2bAPWj6hGfBqV1p6iFuRSesFzeedP/p
 rH40lMSQTg3ELfcVJJ2JzjeKVVz23IuqKrVWmf4SZCX5z+KPvd1jFCZCzl5Wf84XCCMB
 PHYbn2EhjYkivDguW8eur7bw6MjVoXgZeq9iE8YLqn9TryIu8gmbVEGjwjDO0jhVyNuK
 zwWwtusLfo9oE3zXwqDvsgIdO/oivkarZ0dHmSBkrt/BuK2MT6bpA76o41mqFR1Apchs
 shHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPB7ux6+A/n4gUW/W5LMjv0ic4Qn//InkygU41eDp/hO9VuLoQV8UCSV8SvKMyA/naYWYZrmPuZcx8vGWo6F8oHEK4ZQNtbg==
X-Gm-Message-State: AOJu0YxNscJrnFrNy3Vg4ORrIK5Yx9ArHhTWyS89sDzWK1NPf/L1H+qw
 kAFjvpClaty7G2ewkRnPuVm/SeFB+qeR/Qu7LXEgRFik/JbpC0XTvvL6iyHxwlg=
X-Google-Smtp-Source: AGHT+IELe/Z67So3nzBnwsgLjibu1dAm9vSukImVRQj3rHoAkKqF00rcDXdX+KrKR5KYpdm7jhmHJg==
X-Received: by 2002:a05:600c:4f47:b0:41a:f936:5326 with SMTP id
 m7-20020a05600c4f4700b0041af9365326mr7727680wmq.15.1714325359193; 
 Sun, 28 Apr 2024 10:29:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 j28-20020a05600c1c1c00b0041bfb176a87sm4327573wms.27.2024.04.28.10.29.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Apr 2024 10:29:18 -0700 (PDT)
Message-ID: <438387dc-303a-4ca0-9da4-df9fdb195027@mind.be>
Date: Sun, 28 Apr 2024 19:29:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240412132659.1168317-1-thomas.perale@mind.be>
 <20240412132659.1168317-4-thomas.perale@mind.be> <ZhmS9kRYj2AuqBln@landeda>
 <CA+h8R2rLxuogZYE9vuuwOh3-Rif1o=P6go9dAdYE4sjLp=gD=Q@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CA+h8R2rLxuogZYE9vuuwOh3-Rif1o=P6go9dAdYE4sjLp=gD=Q@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714325359; x=1714930159; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W9a2TSRTD7vviI4ioONovKvOIJGHDT3BV4GY1dbH2Do=;
 b=XokL9mK/pNueWlNlk0SUB5P+HuJREVMw0scyR9+P2HRenZyBfFX2SNk/dtMQSs4mPC
 OnS3LnSKOiNFrZNYgsKKcrpu/TEJ84k+dmOem4iuxQKs83zXncQplvY9gVCi8XOS8NMN
 oCQIMP8+g7KHuWfegdT3NCG/KSKAPzoOkAT6EqKZiZnptCBBv/XTzB8aINiUu2EIjxMq
 jsJBXcmTUpZz7HVjBQAT9Ze5in8ZX1b4RuDu1qECfxoSTGhAr9JIQeNLreHUqAFQj3nG
 dWwBayP0GkqGb4arvtwJQQGpBF75r+roOzX9sbzZ9ndt7abUCJoQ1JBHuHZkA7UEsvCh
 smhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XokL9mK/
Subject: Re: [Buildroot] [PATCH 3/6] package/go: make host package a virtual
 package
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
Cc: Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale <thomas.perale@essensium.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNC8wNC8yMDI0IDA4OjI4LCBDaHJpc3RpYW4gU3Rld2FydCB2aWEgYnVpbGRyb290IHdy
b3RlOgo+IEhpIGFsbCwKPiAKPiBPbiBGcmksIEFwciAxMiwgMjAyNCBhdCAxOjAx4oCvUE0gWWFu
biBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+PiBUaGFua3MgZm9y
IHRoaXMgc2VyaWVzLCBpdCByZWFsbHkgbG9va3MgZ29vZCEgOi0pCj4gCj4gSSBhZ3JlZSB0aGF0
IGl0IGxvb2tzIGdvb2QgJiBoYXZpbmcgdGhlIGdvLWJvb3RzdHJhcCBiZWxvdyB0aGUgZ28vCj4g
cGFja2FnZSBpcyBuaWNlLgo+IAo+IEhhdmVuJ3QgZnVsbHkgcmV2aWV3ZWQgaXQgeWV0IGJ1dCB3
aWxsIHRyeSBpdC4KPiAKPj4gSSBhbnl3YXkgaGF2ZSBhIGZldyBjb21tZW50cyBhbmQgcXVlc3Rp
b25zLCBwbGVhc2Ugc2VlIGJlbG93Lgo+Pgo+IAo+PiBOb3QgcmVsYXRlZCB0byB0aGlzIHBhdGNo
LCBidXQgc3RpbGwgcmVsZXZhbnQgdG8gdGhlIGRpc2N1c3Npb246IGl0Cj4+IHdvdWxkIGJlIGV2
ZW4gYmV0dGVyIGlmIHdlIGNvdWxkIGFsc28gaGF2ZSB0aGUgcG9zc2liaWxpdHkgdGhhdCB0aGUK
Pj4gc3RhZ2UtMyBoYXMgdGhlIG9wdGlvbiBvZiBiZWluZyBhIHByZWJ1aWx0IGdvLgo+IAo+IFVz
aW5nIHN0YWdlLTMgYXMgcHJlLWJ1aWx0IGFuZCBob3N0LWdvIGl0c2VsZiBhcyBjb21waWxlZCBm
cm9tIHNvdXJjZQo+IHVzaW5nIHRoZSBwcmUtYnVpbHQgdG9vbGNoYWluIGFzIHRoZSBib290c3Ry
YXAgb25lIGlzIGlkZWFsLgo+IAo+IFRoaXMgaXMgc28gdGhhdCB3ZSBjYW4gY29udHJvbCB3aGlj
aCB2ZXJzaW9uIG9mIEdvIGlzIHVzZWQgZm9yIHRoZQo+IGJ1aWxkIGZvciByZXByb2R1Y2liaWxp
dHkuCj4gCj4gT3RoZXJ3aXNlIGlmIHRoZSBtYWpvciB2ZXJzaW9uIG9mIEdvIGluc3RhbGxlZCBv
biB0aGUgaG9zdCBtYWNoaW5lIGlzCj4gZGlmZmVyZW50LCBpdCBtaWdodCBwcm9kdWNlIGRpZmZl
cmVudCByZXN1bHRzLCBwYXJ0aWN1bGFybHkgd2hlbiB1c2luZwo+IGNnby4KCiAgVGhlICJzeXN0
ZW0iIGdvLCBpLmUuIHRoZSBvbmUgaW5zdGFsbGVkIG9uIHRoZSBidWlsZCBtYWNoaW5lLCBpcyBu
ZXZlciB1c2VkLiAKVGhpcyBwYXRjaCBzZXJpZXMgZ2l2ZXMgdGhlIGNob2ljZSB0byBlaXRoZXIg
KmRvd25sb2FkKiB0aGUgZ28gYmluYXJ5LCBvciBidWlsZCAKaXQgZnJvbSBzb3VyY2UuCgogIEkg
ZG9uJ3QgdGhpbmsgd2Ugd2FudCB0byBoYXZlIHRoZSBvcHRpb24gdG8gdXNlIHRoZSBzeXN0ZW0g
Z28gaW4gQnVpbGRyb290LiBXZSAKZG8gaGF2ZSB0aGF0IGZvciB0aGluZ3MgbGlrZSBjbWFrZSBh
bmQgZ3ppcCwgYnV0IGl0J3MgYSBiaXQgcGFpbmZ1bCB0byBtYWludGFpbi4gCldlIGFsc28gaGF2
ZSBpdCBmb3IgcHl0aG9uMywgYnV0IG9ubHkgZm9yIGEgdmVyeSBzbWFsbCBzdWJzZXQgb2YgcGFj
a2FnZXMgKG5vbmUgCm9mIHRoZW0gUHl0aG9uIHBhY2thZ2VzKS4gQW5kIHNpbmNlIGEgcHJlYnVp
bHQgYmluYXJ5IG9mIGdvIGlzIGFueXdheSBhdmFpbGFibGUgCmZvciBhbG1vc3QgYWxsIHBsYXRm
b3JtcyBzdXBwb3J0ZWQgYnkgR28sIHRoZXJlIGlzIGFic29sdXRlbHkgbm8gcmVhc29uIG5vdCB0
byAKanVzdCBkb3dubG9hZCBpdCB0byBiZSBzdXJlLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAK
PiBCZXN0IHJlZ2FyZHMsCj4gQ2hyaXN0aWFuIFN0ZXdhcnQKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
