Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97895C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 11:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A5DD40457;
	Wed, 27 Jul 2022 11:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A5DD40457
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2CVct67Z2xjp; Wed, 27 Jul 2022 11:08:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAA0C403D0;
	Wed, 27 Jul 2022 11:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAA0C403D0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37DC81BF46D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11AE140382
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 11:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11AE140382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IjV9PwP_yolI for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 11:08:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 054994035D
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 054994035D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 11:08:18 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id b6so10294198wmq.5
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 04:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y1EV1OxnzmXXbpfHicRR3ACGqP4jh5z59GsVdNTrphw=;
 b=F5AedmlGqeP9VRNxY1EYEG/5EGGkg3YKZelOteyb8fdvlUUhBfGaXFaKtV/NKlorhk
 4tOXpDUHiTW/Zc6BF1VC1bu7qEQjJn1ocTzZk65etR4dTHPD8f1x75Gx4SKq3YocN8r7
 bdz5WRwP2Tx0NOYx7GR/mqga597v7wwLFELGqzEQE/EwHnB+FS2rCUwWyski31h4yxQ2
 5KNQZqhSe8UifZAt+S5zukTSPcQnYtOD1ToOjTSt6Y492hbNs/G48gzo4ZpnfhsRUsIE
 uz3klRp/RGO572dcrNSJaUVdbJx6HbIdXz6ihT045or2IoraIzY5Edxch5I1pWhuJMz7
 1gqA==
X-Gm-Message-State: AJIora9c8AgWIB3Cl+ed1KijHnoUiegr6s5mv2QADl2oK8hWjKzdIb8N
 5n7hOOc/tChOGksTdQBlarjRDGL8yd67/A==
X-Google-Smtp-Source: AGRyM1sK4VzfkFVKwg59+ciiFPMprF3i7qZeSiq6zXSb6gpGfQB0+lrC0ypBxvBgmSeCKjKrmeOQaQ==
X-Received: by 2002:a05:600c:2194:b0:3a3:bea:1017 with SMTP id
 e20-20020a05600c219400b003a30bea1017mr2602603wme.44.1658920097114; 
 Wed, 27 Jul 2022 04:08:17 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a7bc003000000b003a2e7c13a3asm1941016wmb.42.2022.07.27.04.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 04:08:16 -0700 (PDT)
Message-ID: <d0804aa5-6883-85c8-134f-d16489eb70bd@mind.be>
Date: Tue, 26 Jul 2022 22:55:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>,
 =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
References: <20220726131249.2009383-1-thomas.petazzoni@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220726131249.2009383-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=y1EV1OxnzmXXbpfHicRR3ACGqP4jh5z59GsVdNTrphw=;
 b=Ov8JPcbFqIOnGzYlqFhn7imnPoLBYpZL2sh7hSAOmBhN911RnAbD+y53XWzF3P3SgV
 eEfBnksd5YXqSa/4OUo0hOEmWt/wJbgY5gE1EDhtLhGsmZl1PCMCm/a3I/GlEgfxguXj
 ppcPgx+ZfmOxIWsQgJG+uWlAi5AUxNRclgltgnrWP8+IlwsoEZmJCjvs0sSekyjNaLY1
 pOv/KSjhbsnb4jfWi3EGJRkantjv84t1IHQ9Hp4wbYDjJlUNrhjcV5xo65UvJMCizuO9
 tMmIUEaMq72QFV3DV9Fvl5Q26KK2lC3Ld5URgbJ+IUTCRJh2pwv1dAluwAciZIRwZr9U
 SX8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ov8JPcbF
Subject: Re: [Buildroot] [PATCH 0/2] Add support for configurable page size
 on ARM64
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNi8wNy8yMDIyIDE1OjEyLCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgo+IEhlbGxvLAo+
IAo+IEhlcmUgaXMgYSBuZXcgaXRlcmF0aW9uIG9mIHRoZSBzdXBwb3J0IGZvciBjb25maWd1cmFi
bGUgcGFnZSBzaXplIG9uCj4gQVJNNjQsIGJhc2VkIG9uIGVhcmxpZXIgd29yayBmcm9tIMWBdWth
c3ogU3RlbG1hY2gKPiA8bC5zdGVsbWFjaEBzYW1zdW5nLmNvbT4sIGJ1dCBmYWlybHkgc2lnbmlm
aWNhbnRseSBjaGFuZ2VkLgo+IAo+IEhvcGVmdWxseSB0aGlzIGl0ZXJhdGlvbiBjYW4gbWFrZXMg
aXQgd2F5IHVwc3RyZWFtIQo+IAo+IFRob21hcwo+IAo+IFRob21hcyBQZXRhenpvbmkgKDIpOgo+
ICAgIHBhY2thZ2UvdWNsaWJjOiBkZWZpbmUgQlIyX1VDTElCQ19UQVJHRVRfQVJDSCBmb3IgQVJN
NjQKPiAgICBhcmNoOiBhZGQgc3VwcG9ydCBmb3IgY29uZmlndXJhYmxlIHBhZ2Ugc2l6ZSBvbiBB
Uk02NAoKICBCb3RoIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MhCgogIFJlZ2FyZHMsCiAgQXJu
b3V0Cgo+IAo+ICAgYXJjaC9Db25maWcuaW4uYXJtICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMjUgKysrKysrKwo+ICAgYXJjaC9hcmNoLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMTEgKysrKwo+ICAgYXJjaC9hcmNoLm1rLmFyYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDkgLS0tCj4gICBsaW51eC9saW51eC5tayAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgOCArKysKPiAgIHBhY2thZ2UvdWNsaWJjL0NvbmZpZy5pbiAgICAgICAg
ICAgICAgICAgICAgICB8ICAxICsKPiAgIHBhY2thZ2UvdWNsaWJjL3VjbGliYy5tayAgICAgICAg
ICAgICAgICAgICAgICB8IDEzICsrKysKPiAgIC4uLi90ZXN0cy90b29sY2hhaW4vdGVzdF9hYXJj
aDY0XzY0ay5weSAgICAgICB8IDY1ICsrKysrKysrKysrKysrKysrKysKPiAgIDcgZmlsZXMgY2hh
bmdlZCwgMTIzIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gICBjcmVhdGUgbW9kZSAx
MDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Rvb2xjaGFpbi90ZXN0X2FhcmNoNjRfNjRrLnB5
Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
