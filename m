Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DFBE99071
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 10:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DB1B82D75;
	Fri, 10 Apr 2026 10:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id He5AOWQ-zWw1; Fri, 10 Apr 2026 10:26:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2EB9829FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775816794;
	bh=wYnFQTLaAnqKEujedRo5QmDvCkPhLzpw025EqOVEyiA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rthZCAC+JNSpXu3IU5PjXJZmsV7A3WbaaHs6vikz/xXEIvApfveB41kpla4xMjZFI
	 vhd5DDwDwcfi8FcZXCU8xp+svz4oEYzPydXBmdJ+9bwSgFsIPqgO+CoQjqYyA4VpcA
	 L1zekB8fvLv+Fwq5L419xErU9x3X1Y+8/oCvIMn1QMOCCi40JzKr/FRYDiQTDRkVJo
	 f4tG0q1ol3POZVqkQODYtibhZrmJQ1mZxH4mSWs8NJPvAsbsUGg7QFW/4DHFgsDBL5
	 E9JqTBgw6ngP8Wa2ZQuQp28mB/8BM2ygHfwtIAY2RX2Xm4YT9/XRDKnzawgdQx6Zf2
	 xIUjeY0Yt2CGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2EB9829FE;
	Fri, 10 Apr 2026 10:26:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B33C194
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 10:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4101760BB0
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 10:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tw_Y8YZbhmjX for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 10:26:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3609560B8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3609560B8B
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3609560B8B
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 10:26:31 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-488b3f8fa2bso23132585e9.1
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 03:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775816790; x=1776421590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qeAZkQ8u67vk/PIKrnhMr3JRu3MU9ozp3xN6DhLJCZA=;
 b=fqVnaeT6g8CTAg15q60fojFGInZUoXix/MfyA9RRM3WDiHfq6WU/xLViDcSR+3i9/V
 A1nNc1pNokROMjRhX+2Vw9njzMahRaujxmDzNJ9J85hcwlTeaKHHJFvioGARBgh2/kuV
 4IzmEFG8/Ax60tWvUWyvCn2coeI4s7ydVlW+F4D/TZjsAkvut6rmcpa2OX+UYFc4EhSh
 1tDADwcZQitWzno+LFx7apuslj1FRIqZJD2oZvi1TymFfT8w/5O8jgMmUW3sFvSuZQhC
 XFgp8jTi55cZbsPkRJmZLOE7S/8dXGZIOIuxCBWpAwZXhGq2Ud0iNHXa3zvurQjhXFgu
 cCyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFqTzEtTwKEoaZnb415wOoDe3OIJRCQ3vNzCnmlBvAh2RMjeUQiLqcaPjQkP1IjddopeZlvOFfmZg=@buildroot.org
X-Gm-Message-State: AOJu0Yz9/w1XGIZUNvovpT3Yv+O5soyNEHup48Oym/DJCK5yadIapQv8
 lg9LJCPd2X2K6+DdtxN7mnUdckqScOHNpf8KuAQCf6923LWNHFznFF6mX+0Yswd1QwoMVdJqloV
 Idc15yFY=
X-Gm-Gg: AeBDieuDPrJv+HDjkwEkxCpEf4cG7xdmMUDvpc2KWFhCw4zrxRvoLKJx3lXZplPyb9I
 Q2GnXEICwlHyI3ubaqMaMBVlNvWEChemaqXcYqwDGetyYjY2s7JvitOCOQLzzyGN+ybJYk5b1DW
 JqDNjWCsB7aIj+L7+/AjVJS7jOeKRQ3TU9ASvlcOiW5yeTpJQnCFJ43ldZmjg/q2QHyHegeBLI8
 nLJeKVhPTr9P9SdfXRW6J7sE26oaXfCtb2sczTQs3mRCXfwn2wMZASDPENvUZRsctUV0p46mAnZ
 NbWaoBGfcevtb+fsqJEWvPgSk4f9AWozWwD5HryqMD5UUcCANZfsp3VVP9s6IcAUS4DoJFDv+S6
 GM9YDYQ6IuapTnKoyqg5vjh1O0aqEcBSEZJRLJzeXVqbeTVbqMN6F8xSXqWJSHI5xm9RdqQDDkS
 dsKPCRFyEqVQ2CsCs/e08kRY2Xq1w=
X-Received: by 2002:a05:600c:a406:b0:488:aa33:dc8f with SMTP id
 5b1f17b1804b1-488d6781cf5mr23216645e9.0.1775816789835; 
 Fri, 10 Apr 2026 03:26:29 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5b3cbb2sm64709915e9.13.2026.04.10.03.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 03:26:29 -0700 (PDT)
To: yann.morin@orange.com
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Fri, 10 Apr 2026 12:26:28 +0200
Message-ID: <20260410102629.144216-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <7b86fd0c400abfa616573d98d996c3a32cf87135.1775020521.git.yann.morin@orange.com>
References: <7b86fd0c400abfa616573d98d996c3a32cf87135.1775020521.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775816790; x=1776421590; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qeAZkQ8u67vk/PIKrnhMr3JRu3MU9ozp3xN6DhLJCZA=;
 b=LkY3jz21dzflRGYUAzsK3CER6FwgQmLeYKfin+XfQSxczOA+7zfGu5/FPIf20rZg6R
 xeq+1tQ/SP2sBpNy08VYj+te7aC5eCowDEhi12Ackxgj+N3ziJsbQQVfMPhNEVBfpqdY
 P7gEAE+wokxe9UL+J/6K6QOvReJv8gg7ScQgBisLWxCI25v1RT422r1nsXM5A/Z3NdAG
 m194DaHudOqGGKnJFq48LtbrijnfYq1uVn6t/UtfUVgqfD61XsoWwoAkNBY3L+nTA5mG
 OQtb3DKsckHantBRnLG1KO3YhjfCzYPh7lapZNmMjhW7zNcwY2LkmPqI559aKpVS//C2
 ndDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LkY3jz21
Subject: Re: [Buildroot] [PATCH] package/mosquitto: disable building the
 crtl-shell for host variant
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCkluIHJlcGx5IG9mOgo+IFRoZSBjdHJsLXNoZWxsLCBpbiBtb3NxdWl0dG9fY3Ry
bCwgb3B0aW9uYWxseSB1c2VzIGEgbGluZS1lZGl0aW5nCj4gbGlicmFyeSwgZWl0aGVyIGxpYmVk
aXQgb3IgcmVhZGxpbmUuIFRoZXJlIGlzIGEgc2luZ2xlIG9wdGlvbiAoaW4KPiBtb3NxdWl0dG8p
IHRoYXQgZHJpdmVzIHdoZXRoZXIgdG8gYnVpbGQgYWxsIHRoZSBhb3BwcyBvciBub25lLCBidXQK
PiBmb3IgdGhlIGhvc3QgdmFyaWFudCwgd2UncmUgb25seSBpbnRlcmVzdGVkIGluIG1vc3F1aXR0
b19wYXNzd2QsCj4gbm90IG1vc3F1aXR0b19jdHJsIChub3IgdGhlIG90aGVycyBlaXRoZXIpLgo+
IAo+IEV4cGxpY2l0bHkgZGlzYWJsZSB0aGUgY3RybC1zaGVsbCwgdG8gYXZvaWQgYnVpbGQgZmFp
bHVyZXMgd2hlbiB0aGUKPiBob3N0IGhhcyBhIG1peGVkIGluc3RhbGxhdGlvbiBvZiByZWFkbGlu
ZSBvciBsaWJlZGl0IHRoYXQgaXMgbm90Cj4gY29tcGF0aWJsZSB3aXRoIG91cnMuCj4gCj4gRml4
ZXM6Cj4gICAgIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy84NTYvODU2
MzUyZGRkNjkwZGM4YjIzMTRkNDZhNmE4MzdkNzRjMjM3ZDY5Zgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW5Ab3JhbmdlLmNvbT4KPiBDYzogUGV0ZXIgS29yc2dh
YXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgo+IENjOiBUaXRvdWFuIENocmlzdG9waGUgPHRpdG91
YW4uY2hyaXN0b3BoZUBtaW5kLmJlPgo+IENjOiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3Rl
aGxlQGFybS5jb20+Cj4gQ2M6IEpvc2VwaCBLb2d1dCA8am9zZXBoLmtvZ3V0QGdtYWlsLmNvbT4K
PiAKPiAtLS0KPiBOb3RlOiBJIHdhcyBub3QgYWJsZSB0byByZXByb2R1Y2UgdGhlIGlzc3VlIGxv
Y2FsbHksIHNvIEkgYW0gbm90IGNlcnRhaW4KPiBvZiB0aGUgZml4LiBWaW5jZW50LCBKb3NlcGgs
IGlmIHlvdSBjb3VsZCB0ZXN0IGluIHlvdXIgYXV0b2J1aWxkZXJzIChvcgo+IHByb3ZpZGUgdGhl
IGBkcGtnIC0tZ2V0LXNlbGVjdGlvbnNgIG9yIHNpbWlsYXIgZm9yIEFyY2guLi4pCj4gLS0tCgpU
byBkb3VibGUgY2hlY2ssIGRvZXMgYSBiYWNrcG9ydCB0byAyMDI1LjAyLnggbmVlZHMgdG8gYmUg
ZG9uZSBvciBpdCdzIGEgcmVzdWx0Cm9mIHRoZSByZWNlbnQgdmVyc2lvbiBidW1wID8KClRoYW5r
cywKQmVzdCByZWdhcmRzLApQRVJBTEUgVGhvbWFzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
