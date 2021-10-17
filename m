Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEB7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 15:20:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C998F60F48
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 15:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C998F60F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 682BA81774;
	Sun, 17 Oct 2021 15:20:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mmYeBd5t8-j5; Sun, 17 Oct 2021 15:20:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAEC181779;
	Sun, 17 Oct 2021 15:20:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 35AEA1BF2F4
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 15:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32730402C8
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 15:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qbpYrflPiyih for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 15:20:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A70C402C5
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 15:20:09 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id w14so59982281edv.11
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 08:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zDvNHWlkhVRikxYnFLW66hdGdB1Cu+s7OqUQ+sVZeIE=;
 b=SZ0RbSm/ignCNYh52juEYTYOckYCKI+gKVmla0xW86I9EE2eYFcDH+iJAGCaHFFapW
 8qXZGqVkQN5uCdYU1PB3QmV1+PYOc9o/7DrY10llV5nP2QhN0sFBpuGhsuJLb6MO6iLz
 8jma5QBpTNBVguZoInfZL7hTa4RLu6XnwxIaaVeyLQ8tzinmi7iia2ox76Z2i1IHbcAT
 UY2tZD8fNEp3LegTeJzWTZ+vNDP0MzqS2tvFmv9DhWw5OLfjm3pVbh3Ax1vRSljSbJ3b
 Lhi3cqHtkWVUSUhbZHF8yTwUscv0R2ZGCDkdA5A9+NOhdlzjDYKjrUrqlk1lx2SaaUPS
 sgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zDvNHWlkhVRikxYnFLW66hdGdB1Cu+s7OqUQ+sVZeIE=;
 b=p9b2dKVyWLs0NyEUTrl2VMo9aqrOHy0sXboWDadSM9Vj3lnfnt/MoL0zQmssVXIwI1
 e5R714yVF0quUTCvJG81kpqw3u79eFypQHpqqKEfum1bzdXFQDDdh1FP4q66OABd/X6v
 B5l1wzVNNCxwZrgkECrfJLKMTVBopCbjNz2UVd+GHwbIBz803upcuVipl/b/hzCAWr3q
 xF2dXb7HE07aOs70zOOrZSlv/SJF7t2ttxD9Rbsf6GvnEFXPc+km1nnkiKpBxtpgWBBJ
 MTtApE8h4hzF6eIV8DN/h0ulxb4FX/Jlt5YjMAk4hiaEnObBvPMtx0rw0/CpXTG5HIP2
 /BMQ==
X-Gm-Message-State: AOAM530yRTdwzVgkFF+n/qIwq5u5cCtci8suTnfHO7zh5Om1KY3LXN3x
 MjO2yEaxfJUQUxWsrOai3Gwdqw==
X-Google-Smtp-Source: ABdhPJzcCcnMJTUnlidzqdlZdW1NzwE5RXX1mOpTdjIdBs1Wa0gUTUhcK78ar0IBlZlEvMcj4Yra8g==
X-Received: by 2002:a05:6402:399:: with SMTP id
 o25mr5145223edv.275.1634484008100; 
 Sun, 17 Oct 2021 08:20:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gt35sm872646ejc.105.2021.10.17.08.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 08:20:07 -0700 (PDT)
Message-ID: <2c48779f-ad8f-b98c-99d5-ccd428863e3a@mind.be>
Date: Sun, 17 Oct 2021 17:20:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Gilles Talis <gilles.talis@gmail.com>,
 =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>
References: <20211015083830.1971193-1-jose.pekkarinen@unikie.com>
 <CAKcgs2zBHeE_G-LA6dsCRZpLvx6Ox9mf6s_d347cZO+fJZbfxA@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAKcgs2zBHeE_G-LA6dsCRZpLvx6Ox9mf6s_d347cZO+fJZbfxA@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH] package/softhsm2: new package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNy8xMC8yMDIxIDEzOjEzLCBHaWxsZXMgVGFsaXMgd3JvdGU6Cj4gSGkgSm9zw6ksCj4g
Cj4gTGUgdmVuLiAxNSBvY3QuIDIwMjEgw6AgMTA6MzksIEpvc8OpIFBla2thcmluZW4gPGpvc2Uu
cGVra2FyaW5lbkB1bmlraWUuY29tPgo+IGEgw6ljcml0IDoKPiAKCltzbmlwXQo+PiArICAgICAg
IGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTElCT1BFTlNTTAo+Pgo+IEV2ZW4gdGhvdWdoIHRoZSBw
YWNrYWdlIGhhcyBvcGVuc3NsIGFzIGEgZGVwZW5kZW5jeSwgInNlbGVjdAo+IEJSMl9QQUNLQUdF
X0xJQk9QRU5TU0wiIGlzIG1vcmUgYXBwcm9wcmlhdGUgaGVyZS4gSXQgbWVhbnMgdGhhdCBvcGVu
c3NsCj4gd2lsbCBiZSBhdXRvbWF0aWNhbGx5IHNlbGVjdGVkIHdoZW4gc29mdGhzbTIgaXMgc2Vs
ZWN0ZWQuICJkZXBlbmRzIG9uIgo+IG1lYW5zIHRoYXQgeW91ciBwYWNrYWdlIHdpbGwgbm90IGFw
cGVhciBpbiB0aGUgbGlzdCBpZiBvcGVuc3NsIGlzIG5vdAo+IGFscmVhZHkgc2xlY3RlZC4KCiAg
WW91IGNhbid0IHNlbGVjdCBsaWJvcGVuc3NsIHRob3VnaC4KCiAgSW5zdGVhZCwgZWl0aGVyOgoK
LSBpdCB3b3JrcyB3aXRoIGxpYnJlc3NsIGFzIHdlbGwsIGFuZCB5b3Ugc2VsZWN0IEJSMl9QQUNL
QUdFX09QRU5TU0w7IG9yCi0gaXQgZG9lc24ndCB3b3JrIHdpdGggbGlicmVzc2wsIGFuZCB5b3Ug
ZG86CgogICAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTlNTTAogICAgICAgICBzZWxlY3Qg
QlIyX1BBQ0tBR0VfT1BFTlNTTF9GT1JDRV9MSUJPUEVOU1NMCgoKPiBCeSB0aGUgd2F5LCBpdCBz
ZWVtcyBsaWtlIGJvdGFuIGlzIGEgcG90ZW50aWFsIGNyeXB0byBsaWJyYXJ5IGRlcGVuZGVuY3ku
Cj4gSWYgeW91IHdhbnQgdG8gZ2l2ZSB0aGUgdXNlciB0aGUgY2hvaWNlIGJldHdlZW4gdGhlIGNy
eXB0byBsaWJyYXJpZXMgdG8KPiB1c2UsIHBsZWFzZSBoYXZlIGEgbG9vayBhdCBwYWNrYWdlL2xp
YmN1cmwvQ29uZmlnLmluIGluIHRoZSAiY2hvaWNlIgo+IHNlY3Rpb24uCgogIFdlIHVzdWFsbHkg
dHJ5IHRvIGRvIGl0IGF1dG9tYXRpY2FsbHksIGxpa2U6CgoJc2VsZWN0IEJSMl9QQUNLQUdFX09Q
RU5TU0wgaWYgIUJSMl9QQUNLQUdFX0JPVEFOCgooYW5kIHRoZW4gY29uZGl0aW9uYWxseSB1c2Ug
b3BlbnNzbCBvciBib3RhbiBpbiB0aGUgLm1rIGZpbGUpLgoKCj4+ICsgICAgICAgc2VsZWN0IEJS
Ml9QQUNLQUdFX0xJQlRPT0wKPj4KPiBsaWJ0b29sIGRvZXMgbm90IG5lZWQgdG8gYmUgc2VsZWN0
ZWQuIGJ1aWxkcm9vdCBidWlsZCBzeXN0ZW0gd2lsbCB0YWtlIGNhcmUKPiBvZiBpbnN0YWxsaW5n
IGl0IGZvciB5b3UuCgogIGhvc3QtbGlidG9vbCBkb2Vzbid0IG5lZWQgdG8gYmUgc2VsZWN0ZWQu
IFRhcmdldCBsaWJ0b29sLCBob3dldmVyLCBpcyBuZXZlciAKYWRkZWQgYXV0b21hdGljYWxseS4g
VGhhdCBzYWlkLCBpdCdzIHVubGlrZWx5IHlvdSBhY3R1YWxseSBuZWVkIGl0IG9uIHRoZSB0YXJn
ZXQgCi0gYmFzaWNhbGx5IGlmIGl0IGxpbmtzIHdpdGggbGlibHRkbC4KCgoKICBSZWdhcmRzLAog
IEFybm91dAoKW3NuaXBdCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
