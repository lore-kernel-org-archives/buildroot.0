Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB81C432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 12:05:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 171D360EFF
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 12:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 171D360EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2D07832D0;
	Tue,  3 Aug 2021 12:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pHpvzSRs8SUz; Tue,  3 Aug 2021 12:05:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D12E83183;
	Tue,  3 Aug 2021 12:05:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF0D31BF29F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 12:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C04D606E9
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 12:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gnCfkrKfW0Pl for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 12:05:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 825DA60602
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 12:05:25 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id u20so27921478ljo.0
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 05:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lVxffvxWB/NhNQrg7N63OZZKdInYqCyRYbcRPRqH/CM=;
 b=T0xeqjAe0f8ogZk9NGovy9pP4YICcsozeMr6btJLZQU8cC5eiBeUxaV1aGxN2tmKk2
 UVZBlWXXw6GJ6dBHpu6kH7oL+sfkCIeKG6Y0lfcIOzjtTsfXgSOz/yRzh2yafjDgpDPR
 YZYcRNwjeaPsqbJLUv5pb/i3g/+vOsBa237Vq3qK8zjDY0EA2Escds7v3vnvW3owyYv9
 QGtH5TPmca7Tc+oQIMCGv+cBkyGb7kRYj8VIa5S7LgtFGzijqiB+hGvyYp0i3HS5Y76u
 IBKRxoUlo9Rbjj50dSqeHtazA41W5bUlifhHBkDN/3oaJET1mSXLWhqhfM/8JMMCXHk2
 +Knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lVxffvxWB/NhNQrg7N63OZZKdInYqCyRYbcRPRqH/CM=;
 b=ip6TIQNJcvcZyYriAquVkDmZrsx5JfcodIFSf1ICqpkDoZpOeVbEtY/5/ROMe46EsF
 w9IZvvkkdhtGFBx3KNXIeCeUnQAdoXYBxqiu3CV2gs4AbY+AgvxOmPwajA+1KatoD54s
 yNi6Z6XxDdLVWB1AvXR76LkgrULqTkKMqJfDhIQ14WHaXvTdAQREAUTRQdr54/elKmsg
 2beYYfjPsgq08PTtOIc/kqpp8rp1UR1z6Rj9LHMaHsNFpOriYQDnov7GFVJ8XRfvzL9I
 T5cJfCbSahU/H1993uqnSYeMNhWidF77p1qLMTJPoLNoRe2ukZGaK/+1joFi7kdtMwbQ
 vZaA==
X-Gm-Message-State: AOAM5332SLLGneIj/qWrKR2JoYKCLqi/Di9TYDmuzWo8rpvOqFejXVz+
 r12FAWe4AbNLW+ZdwIkZ3HZU4b4EXDpgj0zSss4=
X-Google-Smtp-Source: ABdhPJyq6yRQuLkGHWSPgkkaOeE28jfAy/zlVEDR76tycVazUPpnMBsVFg6FeLBLAwsQczY2EbX0ZRp9rXkH2tZtxHc=
X-Received: by 2002:a2e:9843:: with SMTP id e3mr14067610ljj.498.1627992321895; 
 Tue, 03 Aug 2021 05:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210803091918.2777403-1-fontaine.fabrice@gmail.com>
 <20210803112911.1deab0c2@windsurf>
In-Reply-To: <20210803112911.1deab0c2@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 3 Aug 2021 14:05:10 +0200
Message-ID: <CAPi7W82bFBxJycNc3rGYtadWFiq4UO85j+QF8OZKRo-+gcPZfw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gpsd: fix workaround for gcc
 bug 68485
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gVGhvbWFzLAoKTGUgbWFyLiAzIGFvw7t0IDIwMjEgw6AgMTE6MjksIFRob21hcyBQZXRh
enpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPgo+IEhlbGxv
IEZhYnJpY2UsCj4KPiBUaGFua3MgZm9yIGxvb2tpbmcgaW50byB0aGlzLiBBZGRpbmcgR2l1bGlv
IGluIENjLgo+Cj4gT24gVHVlLCAgMyBBdWcgMjAyMSAxMToxOToxOCArMDIwMAo+IEZhYnJpY2Ug
Rm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gIEdQU0Rf
TERGTEFHUyA9ICQoVEFSR0VUX0xERkxBR1MpCj4gPiAtR1BTRF9DRkxBR1MgPSAkKFRBUkdFVF9D
RkxBR1MpCj4gPiAtCj4gPiAtR1BTRF9TQ09OU19FTlYgPSAkKFRBUkdFVF9DT05GSUdVUkVfT1BU
UykKPiA+Cj4gPiAgR1BTRF9TQ09OU19PUFRTID0gXAo+ID4gICAgICAgYXJjaD0kKEFSQ0gpIFwK
PiA+IEBAIC00NSw3ICs0MiwxMyBAQCBHUFNEX1NDT05TX09QVFMgKz0gbGliZ3BzbW09bm8KPiA+
ICBlbmRpZgo+ID4KPiA+ICBpZmVxICgkKEJSMl9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfNjg0ODUp
LHkpCj4gPiArIyBGaWx0ZXIgb3V0IGFueSBvcHRpbWlzYXRpb24gZmxhZ3MgdG8gYmUgc3VyZSB0
aGF0IC1PMCB3aWxsIGJlIHVzZWQKPiA+ICtHUFNEX1NDT05TX0VOViArPSAkKGZpbHRlci1vdXQg
LU8lLCQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKSkKPiA+ICtHUFNEX0NGTEFHUyArPSAkKGZpbHRl
ci1vdXQgLU8lLCQoVEFSR0VUX0NGTEFHUykpCj4KPiBBcmUgeW91IHN1cmUgYm90aCBhcmUgbmVl
ZGVkPwpZZXMsIEknbSBzdXJlLCBpdCBkb2Vzbid0IHdvcmsgaWYgSSBkb24ndCBhbHNvIGZpbHRl
ciBvdXQgQ0ZMQUdTCnByb3ZpZGVkIGJ5IFRBUkdFVF9DT05GSUdVUkVfT1BUUy4KQnV0IGFmdGVy
IGRpZ2dpbmcgYSBiaXQgbW9yZSBpbnRvIHRoaXMsIEkgZm91bmQgYSBiZXR0ZXIgc29sdXRpb24s
IC1PMAptdXN0IGFsc28gYmUgcGFzc2VkIGluIENYWEZMQUdTLgo+Cj4gSW5kZWVkLCB3ZSdyZSBk
b2luZyB0aGlzOgo+Cj4gR1BTRF9TQ09OU19FTlYgPSAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykK
Pgo+IEdQU0RfQ0ZMQUdTID0gLi4uCj4KPiBHUFNEX1NDT05TX0VOViArPSBDRkxBR1M9JChHUFNE
X0NGTEFHUykgQ0NGTEFHUz0kKEdQU0RfQ0ZMQUdTKQo+Cj4gU28gdGhlIENGTEFHUz0kKEdQU0Rf
Q0ZMQUdTKSBzaG91bGQgd2luIG92ZXIgdGhlIENGTEFHUyB0aGF0IGFyZQo+IG9yaWdpbmFsbHkg
aW4gJChUQVJHRVRfQ09ORklHVVJFX09QVFMpLgo+Cj4gSW4gb3RoZXIgd29yZHMsIGNhbiB5b3Ug
dHJ5IHRvIHNlZSBpZiB0aGUgc2ltcGxlcjoKPgo+IC1HUFNEX0NGTEFHUyA9ICQoVEFSR0VUX0NG
TEFHUykKPgo+IGlmZXEgKCQoQlIyX1RPT0xDSEFJTl9IQVNfR0NDX0JVR182ODQ4NSkseSkKPiBH
UFNEX0NGTEFHUyA9ICQoZmlsdGVyLW91dCAtTyUsJChUQVJHRVRfQ0ZMQUdTKSkgLU8wCj4gZWxz
ZQo+IEdQU0RfQ0ZMQUdTICs9ICQoVEFSR0VUX0NGTEFHUykKPiBlbmRpZgo+Cj4gZG9lc24ndCB3
b3JrID8KPgo+IFRoYW5rcywKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28t
b3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5l
ZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
