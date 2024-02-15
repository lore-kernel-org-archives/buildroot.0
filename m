Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDC0C4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 11:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2636B40A01;
	Thu, 15 Feb 2024 11:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jamrBprLMOlM; Thu, 15 Feb 2024 11:26:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E27C6404EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E27C6404EE;
	Thu, 15 Feb 2024 11:26:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CA951BF575
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 11:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A0186085B
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 11:26:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LQWvztekRSzB for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 11:26:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C1B68607EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1B68607EF
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1B68607EF
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 11:26:55 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-411f895c8b6so6418045e9.1
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 03:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707996414; x=1708601214;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1DQHmZNnPV7VtrejRpyMoBHDNOfnAqnkuw8d0EZIg2M=;
 b=uKwoDgx9Sj4B25X36Iw+efOcbRAGXx7ggdpc4qGIFI4fSDed5Cz2o6/M8CfG/XC7cN
 6+Wi949P0T1OF+LNTg+sDbwRxnbdChQcOnop1WmLRFbBdylt/UuU5uaeXoQwJELw3Cqy
 4dslivJj6xmyxFm+EA7oLeqsQQW/xb/P1i8KFmGkH8QwbcS0ok5JQUb+XyAxSQ+UihKh
 MV2Kbbe9mpqZWkgG+4g/O9tLDbQjPQAb8x6k4395qbyEGe296/3DcJovu8YnxgR/QUAY
 kUdlXb9mecfgJ0WNp9dK8ZfrFpLe6C6HH3FWDxeMweftFzOU476Cc1VY77fCofN5nsmo
 +c5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2Bj6lzcgQ945BDyGVpcHN4rKqozgZKRwTqkByB0Ejy8sCAIggiJsVMNZVJyTymXTqP6fcdcLWzg1KTGvK1FzXw6lBi0emCA==
X-Gm-Message-State: AOJu0YztQwYVcC374N8HzoKD+gW+2FCHJTwie7atmJ85GKBcHml4ZcM+
 MdLHlzwt6vCo/5OSEPcpacpb6cm/B/DSzJhDx+RnRXwv2v66ciLx8BMtqQT04xM=
X-Google-Smtp-Source: AGHT+IET18n3jyDRx+9WhC4qoFKevQxhr0FAFCNdJ7colu9JjuzGv46rFeqrsNiX9vi6WPqEJ2/Ehg==
X-Received: by 2002:a05:600c:3d8e:b0:410:e54c:68e2 with SMTP id
 bi14-20020a05600c3d8e00b00410e54c68e2mr1231017wmb.9.1707996413719; 
 Thu, 15 Feb 2024 03:26:53 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 hg27-20020a05600c539b00b0040fc56712e8sm1630033wmb.17.2024.02.15.03.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 03:26:53 -0800 (PST)
Message-ID: <7e253e56-25f4-494a-98d9-e0d908517acd@smile.fr>
Date: Thu, 15 Feb 2024 12:26:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, buildroot@buildroot.org
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-22-romain.naour@smile.fr>
 <8981fdd9313957b6f0174ac03006db1063b395f7.camel@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <8981fdd9313957b6f0174ac03006db1063b395f7.camel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707996414; x=1708601214;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1DQHmZNnPV7VtrejRpyMoBHDNOfnAqnkuw8d0EZIg2M=;
 b=TL8zmopczCSJEvvFmSfMVQWRuyYVrokBPIF/EWZ6zu7E52thfn6IuUVxmvmgDdAWC8
 XEtmakuqlPm8yoVfX2vhQq2wpFexLPmq4k8t2Yj5uz6GpIMXmghT0qC/ctQbU2tCFcal
 yPucv7LsTHPS99G/+HffX76pk3Imfl5v0Ua/MSNnE75PQ7gSVnx7SmLVO4f2QSsXqNnJ
 SOT1T60XBn3FbGlteXZsutmt8ZFvvWYPAkHL2ClO1xd9OMB3Xgd4FRqIUot/cBPMw1eJ
 Lt8SnaK5sYi3bFbAE5c+nkkLQ8uC8ZIog0WeITb5UuEs4lCLvO3aeCETgUDvuVuXYENb
 EZBw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=TL8zmopc
Subject: Re: [Buildroot] [PATCH 21/21] boot/ti-k3-image-gen: remove package
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleGFuZGVyLAoKTGUgMTUvMDIvMjAyNCDDoCAxMToyMCwgQWxleGFuZGVyIFN2ZXJkbGlu
IGEgw6ljcml0wqA6Cj4gSGkgUm9tYWluLAo+IAo+IE9uIFR1ZSwgMjAyNC0wMi0xMyBhdCAxODoy
OCArMDEwMCwgUm9tYWluIE5hb3VyIHdyb3RlOgo+PiAtY2hvaWNlCj4+IC0JcHJvbXB0ICJTZWN1
cml0eSB0eXBlIgo+PiAtCWhlbHAKPj4gLQnCoCBUaGUgdGFyZ2V0IFNvQyBzZWN1cml0eSB0eXBl
IG9wdGlvbiBmb3IgaW1hZ2UgZ2VuLsKgIFZhbGlkCj4+IC0JwqAgb3B0aW9ucyBhcmUgImdwIiBm
b3IgR2VuZXJhbCBQdXJwb3NlIGRldmljZXMsICJocy1mcyIgZm9yCj4+IC0JwqAgSGlnaCBTZWN1
cml0eSAtIEZpZWxkIFNlY3VyYWJsZSBkZXZpY2VzLCBvciAiaHMiIGZvciBIaWdoCj4+IC0JwqAg
U2VjdXJpdHkgLSBTZWN1cml0eSBFbmZvcmNpbmcgZGV2aWNlcy7CoCBOb3RlIGZvciBhbGwgSGln
aAo+PiAtCcKgIFNlY3VyaXR5IGRldmljZSB2YXJpYW50cyB0aGUgVElfU0VDVVJFX0RFVl9QS0cg
ZW52aXJvbm1lbnRhbAo+PiAtCcKgIHZhcmlhYmxlIG11c3QgYmUgZGVmaW5lZCBhdCBidWlsZCB0
aW1lIHBvaW50aW5nIHRvIGEgdmFsaWQKPj4gLQnCoCBjb3JlLXNlY2Rldi1rMyBmb2xkZXIgbG9j
YXRpb24sIG90aGVyd2lzZSB0aGUgYnVpbGQgd2lsbAo+PiAtCcKgIGZhaWwsIHNlZQo+PiAtCcKg
IGh0dHBzOi8vZ2l0LnRpLmNvbS9jZ2l0L3NlY3VyaXR5LWRldmVsb3BtZW50LXRvb2xzL2NvcmUt
c2VjZGV2LWszCj4+IC0KPj4gLWNvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNU
WVBFX0dQCj4+IC0JYm9vbCAiZ3AiCj4+IC0KPj4gLWNvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0lN
QUdFX0dFTl9TRUNUWVBFX0hTX0ZTCj4+IC0JYm9vbCAiaHMtZnMiCj4+IC0KPj4gLWNvbmZpZyBC
UjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0hTCj4+IC0JYm9vbCAiaHMiCj4+IC0K
Pj4gLWVuZGNob2ljZQo+IAo+IGFub3RoZXIgb2JzZXJ2YXRpb24gSSBtYWRlIGp1c3Qgbm93OiBw
cmV2aW91c2x5IEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NFQ1RZUEVfR1A9eQo+IHdhcyB0
aGUgZGVmYXVsdCwgd2hpY2ggZGlkbid0IGJvb3Qgb24gbXkgSFMtRlMgU29DLgo+IAo+IFlvdSBw
YXRjaHNldCBzdGFydGVkIG91dC1vZi10aGUtYm94LCB3aGljaCwgSSBjb25jbHVkZSwgbWVhbnMs
IEhTLUZTIGlzIG5vdyB0aGUKPiBkZWZhdWx0IGZvciBBTTYyeC4gSSdtIG5vdCBzdXJlIGlmIHRo
aXMgaXMgYSBwcm9ibGVtLCB0aG91Z2guCj4gCgpJIGRvbid0IHRoaW5rIHNvLCB0aGUgYW02Mngg
ZGVmY29uZmlnIHNob3VsZCBzdGlsbCBiZSBmb3IgR1AgU29DIGJ5IGRlZmF1bHQuCgpPaywgbWF5
YmUgdGhlcmUgaXMgc29tZXRoaW5nIHRvIGltcHJvdmUgaW4gdGhpcyBzZXJpZXMgYnV0IEkgZG9u
J3QgaGF2ZSBhbnkKSFMvSFMtRlMgU29DIGZvciB0ZXN0aW5nLi4uCgpCZXN0IHJlZ2FyZHMsClJv
bWFpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
