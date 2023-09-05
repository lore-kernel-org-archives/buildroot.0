Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497A7C83F2C
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 00:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 845E9605B1;
	Tue,  5 Sep 2023 00:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 845E9605B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9zQW45-f9AhH; Tue,  5 Sep 2023 00:33:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEFD6605B3;
	Tue,  5 Sep 2023 00:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEFD6605B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD8991BF964
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 00:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92F30605B3
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 00:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92F30605B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Djm0SZqejczE for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 00:33:37 +0000 (UTC)
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89552605B1
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 00:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89552605B1
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-64f42fcd809so11848796d6.1
 for <buildroot@buildroot.org>; Mon, 04 Sep 2023 17:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693874016; x=1694478816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q4xaN3CsMKuqnp84g3ZpFB8IcvWjNZeWpjYg0z9pEDA=;
 b=dbA2YHMCBgMGyoxA3n5LBm7Fnig1RUV7oRSue70KVnxX4J59/NDSea4p0At19CwKRB
 4OTiJ+PUN/rRZi1B6r87TBy5C3jvxpRmFUtLMpLiva5OhMJxYP1Hf1vsYcteA3xrdWsA
 c7MXy4ahTxV5RqpljHrHWy0HQUrmJT1KESHA5791sg16Wd0k+UUdY96C50Hl1bfiYYo3
 Ltib02JZrM4LaR40ETlDUGWbFzmoyfFV+QebNXO58JbY8K1Y+TfwYF9TdkxU23y0Z/z/
 prGkd1wGlupoTP/cV9Nhg2wTP6kX507OKnOu3LQ849PHJIg6eQFTzHsTyQfd4QMEKIIM
 HR2w==
X-Gm-Message-State: AOJu0Ywggb+DXk7OoGk3XmQoBvWxPc+C1UM8fiBGUVekeb3WTo9lK2/L
 WUEEvDIkMP9WbkVZhCA+ZBL1nH3VhOcp5Ec681idcR7U
X-Google-Smtp-Source: AGHT+IHX2gDeToYwSxDsIfCpmoEJv7Sedym/PZaSFbR1tjmZAFOfsXRZYkmoQZRtGTYTiACAFYjqYe46K5/2uPDkhpg=
X-Received: by 2002:a0c:cb8a:0:b0:64f:6079:306b with SMTP id
 p10-20020a0ccb8a000000b0064f6079306bmr9732689qvk.0.1693874016020; Mon, 04 Sep
 2023 17:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230902191549.44efa583@windsurf>
 <20230903230647.311877-2-patrick.oppenlander@gmail.com>
 <20230904182649.51e17f8d@windsurf>
In-Reply-To: <20230904182649.51e17f8d@windsurf>
From: Patrick Oppenlander <patrick.oppenlander@gmail.com>
Date: Tue, 5 Sep 2023 10:33:25 +1000
Message-ID: <CAEg67G=DubcweQxneXmqYrQtrKfOhd9_h80UmBM753D_gZSv7g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693874016; x=1694478816; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q4xaN3CsMKuqnp84g3ZpFB8IcvWjNZeWpjYg0z9pEDA=;
 b=DDEntfHsiRdxz8DTXpLxm/rD4+K7MlmyGTW/op9Am2tWhR1jxXi82P9CC9bbT8gTf2
 XEdRNYmUI+3UIrRgNQe5hqYoTl71fGWbhumkknZQS8UO5nWmVVnVmNa0ynmPeF2ZCI/U
 7MQOf/5cTlXVIQw7g8AWqdUYVn5obY/EnU/rvGmGTN17gjsugFB8zot4hYrm8LbwksXH
 RxKdbMOuQ+M6itOsirZyKkm25DX9EAwyZJMgEAI9oKA78z57wWJ+Rl8sL3Ogt2UU9/2N
 eWsruSJb6H2qFkHMCw8vZDh5hxP8PUBgbgW5yrtevwMJJY4HOo52t8N57odXwM2NWKKq
 hLKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DDEntfHs
Subject: Re: [Buildroot] [PATCH] ti-k3-r5-loader: support devicetree
 customisation
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKSSBtZXNzZWQgdGhhdCB1cCwgc29ycnkuIEknbGwgc2VuZCBpdCBhZ2Fpbi4K
ClBhdHJpY2sKCk9uIFR1ZSwgU2VwIDUsIDIwMjMgYXQgMjoyNuKAr0FNIFRob21hcyBQZXRhenpv
bmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAgNCBT
ZXAgMjAyMyAwOTowNjowOSArMTAwMAo+IHBhdHJpY2sub3BwZW5sYW5kZXJAZ21haWwuY29tIHdy
b3RlOgo+Cj4gPiBGcm9tOiBQYXRyaWNrIE9wcGVubGFuZGVyIDxwYXRyaWNrLm9wcGVubGFuZGVy
QGdtYWlsLmNvbT4KPiA+Cj4gPiBIaSBUaG9tYXMsCj4gPgo+ID4gc29ycnkgYWJvdXQgdGhhdC4g
UmVzZW5kIGJlbG93Lgo+ID4KPiA+IFBhdHJpY2sKPgo+IFRoaXMgYWxzbyBkb2Vzbid0IHdvcmss
IGJlY2F1c2Ugbm93IHlvdXIgY29tbWl0IGxvZyB3b3VsZCBiZToKPgo+ID09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiBIaSBUaG9t
YXMsCj4KPiBzb3JyeSBhYm91dCB0aGF0LiBSZXNlbmQgYmVsb3cuCj4KPiBQYXRyaWNrCj4gPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQo+Cj4gWW91ciBjb21taXQgbG9nIHNob3VsZCBiZSBhIHByb3BlciBjb21taXQgbG9nLCB3aGlj
aCBleHBsYWlucyB0aGUKPiBjaGFuZ2UgYW5kIGl0cyByYXRpb25hbGUuCj4KPiBUaGFua3MgYSBs
b3QhCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8s
IEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFp
bmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
