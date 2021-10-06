Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5555FC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:21:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5A3160230
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5A3160230
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACAA9840E9;
	Wed,  6 Oct 2021 19:21:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HNH0s_5hv-OS; Wed,  6 Oct 2021 19:21:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1983A840F4;
	Wed,  6 Oct 2021 19:21:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B01F01BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FDB660F26
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:21:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wcnVFUMzrEdD for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:21:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 843F060F25
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:21:50 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id x7so13133595edd.6
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 12:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=+LCmqf6bLlp0k/UgK5tdp3FHXnF9/FVmdtzkZhswFMc=;
 b=XUPgB8K+XTq6ZhPR5CMci5xseRnsJXdlw2xZ2Jb4Vfp7hVmhcekVEAtGG9cOES+uwq
 4ggBYD6AkZ6tIPP8CPeK/YN8E6CjYpeUAu5AT9G1ZMaQMJahQN+LbWgrnxpKhWkk0AmA
 Qn/68GJPj/Gkk9riTH2s912gNlR3N8Gx95zgGsq4goOFt+YsSKyeWhhwfkqYHI9jzAUG
 oVWLNhOKm1mJvhpecOuAFhkbkDoevXDSTwHMREsjBSv4RgJfJ8vFpzqMcQ/S5Jd/ZCm7
 iVngsHv5nVp/zn6u98RvqXf9UiT1sZKx6pUeCaTWrTJcWm5mf2ZUhLiDI2kbORScUFyD
 asgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+LCmqf6bLlp0k/UgK5tdp3FHXnF9/FVmdtzkZhswFMc=;
 b=250CKGwpvf1opEwon/u10/VuHXg+aSH+xx6hKE+GcLlmrw5SncTrjdIDFfL81W/svw
 W45zprPovaZQiwBCsb719id5ejdHh3rLudXumY7IoWr8TruktXZIopNbjPi+ZJ7sTXd7
 DCSDTnqDecPb7wGKaT+Mh9XALgSm7njaUplxWNA8+3w2jwwTH76WvCPq6hlua/LzKJeA
 BbkTvt9IFduAVt0WQlaexQ1r/EY+Cl7lFlbzW2VJWka1wzsAJ4h+9KDqGYUVk/6MR9Me
 IUEpPGj4jJsvScFOmQCXnQvpCF00VqZubO5TWSg6979wFJvCuKcF5tPB5i3uo+cs/avs
 SyHw==
X-Gm-Message-State: AOAM531+AfYtRk52uszOF44EOzp12ox6r/KrUURs8ZcIGxZ4EZLfPlOM
 MmQdNpOz/ZxbJufcIsf41znOAA==
X-Google-Smtp-Source: ABdhPJxoix6mGraXUsFAlw4X7o/PfU4WBl+dfJ6BQFcxVKyf3eAII2yQhENcLMkMop3GsIC2nBgS/A==
X-Received: by 2002:aa7:cf06:: with SMTP id a6mr58113edy.108.1633548108630;
 Wed, 06 Oct 2021 12:21:48 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v13sm9213363ejo.36.2021.10.06.12.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 12:21:48 -0700 (PDT)
Message-ID: <4ff7267c-8968-f2c5-1a5a-6be58217b0a2@mind.be>
Date: Wed, 6 Oct 2021 21:21:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
References: <20210922113820.3628-1-jose.pekkarinen@unikie.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210922113820.3628-1-jose.pekkarinen@unikie.com>
Subject: Re: [Buildroot] [PATCH v2] package/wpa_supplicant: Allow mesh
 configuration
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

CgpPbiAyMi8wOS8yMDIxIDEzOjM4LCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+IHdwYV9zdXBw
bGljYW50IGRlZmNvbmZpZyBkb2Vzbid0IGVuYWJsZSBDT05GSUdfTUVTSAo+IGJ5IGRlZmF1bHQs
IGFuZCBjdXJyZW50bHkgdGhlcmUgaXMgb25seSBhIHBhdGggdG8KPiBkaXNhYmxlIGl0IGluIGJ1
aWxkcm9vdC4gVGhpcyBwYXRjaCB3aWxsIHJlc3RvcmUKPiB0aGUgbG9naWMgdG8gZW5hYmxlIGl0
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1
bmlraWUuY29tPgoKICBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFy
bm91dAoKPiAtLS0KPiBbIHYxIC0+IHYyIF0gcy9DT05GSUdfX01FU0gvQ09ORklHX01FU0gvCj4g
Cj4gICBwYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50Lm1rIHwgNCArKystCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2Uvd3BhX3N1cHBsaWNhbnQvd3BhX3N1cHBsaWNhbnQubWsgYi9wYWNr
YWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50Lm1rCj4gaW5kZXggZTkwNzhiOWY4OS4u
M2MwYjBjMWRmYyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBw
bGljYW50Lm1rCj4gKysrIGIvcGFja2FnZS93cGFfc3VwcGxpY2FudC93cGFfc3VwcGxpY2FudC5t
awo+IEBAIC0xMDQsNyArMTA0LDkgQEAgZWxzZQo+ICAgV1BBX1NVUFBMSUNBTlRfQ09ORklHX0RJ
U0FCTEUgKz0gQ09ORklHX1dJRklfRElTUExBWQo+ICAgZW5kaWYKPiAgIAo+IC1pZmVxICgkKEJS
Ml9QQUNLQUdFX1dQQV9TVVBQTElDQU5UX01FU0hfTkVUV09SS0lORyksKQo+ICtpZmVxICgkKEJS
Ml9QQUNLQUdFX1dQQV9TVVBQTElDQU5UX01FU0hfTkVUV09SS0lORykseSkKPiArV1BBX1NVUFBM
SUNBTlRfQ09ORklHX0VOQUJMRSArPSBDT05GSUdfTUVTSAo+ICtlbHNlCj4gICBXUEFfU1VQUExJ
Q0FOVF9DT05GSUdfRElTQUJMRSArPSBDT05GSUdfTUVTSAo+ICAgZW5kaWYKPiAgIAo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
