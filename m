Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AA1C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FE8D60F75;
	Sun,  6 Aug 2023 21:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FE8D60F75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9Q2pI7mMj6Q; Sun,  6 Aug 2023 21:48:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5AC160F1A;
	Sun,  6 Aug 2023 21:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5AC160F1A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 429A41BF909
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4ED2860F2C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ED2860F2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ah5Y056J1Fnr for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:47:28 +0000 (UTC)
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B4C4608A6
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B4C4608A6
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1bbf7f7b000so2108950fac.2
 for <buildroot@buildroot.org>; Sun, 06 Aug 2023 14:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691358447; x=1691963247;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s/YHLmscXTRJTYTljk4u427EQSHngysIvlkxwKpkxNs=;
 b=lKqmlJg0XjgnwfaegFOO+/y58YfRF7bsS5oPGVGmMW3MxQZd+ZFK8Cvtks2HuB24iq
 qrOI60kOPkf7PkFMuHxpdFvkTs20k5EzOS35WxJhsvoRdmomxvFDL9h809PQoLt4BSQO
 zPfNyAS9R0ymTC8zktUZMklfuJLu9R4ovhuuCXr2c0+BapaDak2da76ySFUMRbVRUcHv
 DErI2lvmVjR9d+YzNf/AEA5axaqdNmjyODkRm1OeBPSXmfo44KUihnhHtXlV8PjEzC3d
 iX68DaxhdQJLpvwvD80Wfn3/lv5QVxbC8XgtLt/orCKHwrgCHnUPMSJwCK1QqPAcS0+8
 zk3Q==
X-Gm-Message-State: AOJu0Yxfkt1JwHWZfYL/tYWve/5x9HO6jtQRjMHEM9yiNdM1ep1yM9Vt
 6EnmE1qQOaaOZjVMJxjU9xf+gXGlVaopPDMBtsbHh6L2Tgw=
X-Google-Smtp-Source: AGHT+IH7cEhG0UopuntFOzHDjTkzGw63zDro2OYbJ5i/yS1dS9ecA5MS+cwap5FyHN4ZkMefxXy2WeMSqSlgPWzKUJU=
X-Received: by 2002:a05:6870:b489:b0:1be:c688:1cc with SMTP id
 y9-20020a056870b48900b001bec68801ccmr7305795oap.5.1691358446892; Sun, 06 Aug
 2023 14:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230725142120.318785-1-james.hilliard1@gmail.com>
 <20230801102221.264475b0@windsurf>
 <2d73fe79-ae7c-6fab-defd-0d73cff598b8@smile.fr>
In-Reply-To: <2d73fe79-ae7c-6fab-defd-0d73cff598b8@smile.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 6 Aug 2023 15:47:14 -0600
Message-ID: <CADvTj4pv3nd_fVJR9Hfj5At3b7QAPC4y6_c1EGGDtQPm1K2zAQ@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691358447; x=1691963247;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s/YHLmscXTRJTYTljk4u427EQSHngysIvlkxwKpkxNs=;
 b=YC7A/bdZzq7JdQ0yc1attBwhx17/OHst9F09d92VRhyR+lyvXktsWMMOLmtNysVNrk
 wEA328tlJEb5Wqy6scLqXVhT7bGHcDaWl6zMVsZNty1bzE9d3239K5vqGsYO2rms9uKY
 fC3Wcy5F4gyobCrykShM6k3t9xNk7xySVS/p1K5x6wa45IsQjSHSbiqSZ1pbOgYckHam
 BpPzTv+67nzxTtz9cKSLSdNqFh5W+cylrYZw9+dAXTBgYdI971OqjOdKgt0EhB94d1dN
 Il5XvbaJuQW7kjQbl5mKt+1DCmCIpMBbU6oO2J+qQlV/vG0TZ52cvCDrivfM6HeyidCW
 JGyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=YC7A/bdZ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-urllib3: bump to version
 2.0.4
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
Cc: Asaf Kahlon <asafka7@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCBBdWcgNiwgMjAyMyBhdCAzOjI14oCvUE0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFv
dXJAc21pbGUuZnI+IHdyb3RlOgo+Cj4gSGVsbG8gVGhvbWFzLCBKYW1lcywgYWxsLAo+Cj4gTGUg
MDEvMDgvMjAyMyDDoCAxMDoyMiwgVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IGEgw6lj
cml0IDoKPiA+IEhlbGxvIEphbWVzLAo+ID4KPiA+IE9uIFR1ZSwgMjUgSnVsIDIwMjMgMDg6MjE6
MjAgLTA2MDAKPiA+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3
cm90ZToKPiA+Cj4gPj4gTWlncmF0ZSBmcm9tIHNldHVwdG9vbHMgdG8gaGF0Y2hsaW5nIHBlcDUx
NyBidWlsZCBiYWNrZW5kLgo+ID4+Cj4gPj4gTGljZW5zZSBoYXNoIGNoYW5nZWQgZHVlIGNvbnRy
aWJ1dG9ycyBjaGFuZ2U6Cj4gPj4gaHR0cHM6Ly9naXRodWIuY29tL3VybGxpYjMvdXJsbGliMy9j
b21taXQvOGU5NDc1NGY4NWM1OWQ4MjZhYzA2MDRkMGRkMmEwYjQxODc0YmIzNgo+ID4+Cj4gPj4g
U2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+
Cj4gPgo+ID4gVGhpcyBjb21taXQgYnJlYWtzIHR3byB0ZXN0IGNhc2VzOgo+ID4KPiA+ICAgICBU
ZXN0UHl0aG9uUHkzQm90bzMgICAgfCBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9i
dWlsZHJvb3QvLS9qb2JzLzQ3Njg1NjE0ODEgIHwgT1JQSAo+ID4gICAgIFRlc3RQeXRob25QeTNC
b3RvY29yZSB8IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pv
YnMvNDc2ODU2MTQ4MiAgfCBPUlBICj4gPgo+ID4gQ291bGQgeW91IHBsZWFzZSBoYXZlIGEgbG9v
az8KPgo+IEZyb20gWzFdCj4gSW1wb3J0RXJyb3I6IGNhbm5vdCBpbXBvcnQgbmFtZSAnREVGQVVM
VF9DSVBIRVJTJyBmcm9tICd1cmxsaWIzLnV0aWwuc3NsXycgaXMKPiBkdWUgdG8gYm90b2NvcmUg
d2hpY2ggZG9lcyBub3Qgc3VwcG9ydCB1cmxsaWIzIDIuMCB5ZXQgWzJdLgo+Cj4gSXQgc2VlbXMg
bWFueSBwcm9qZWN0cyBhcmUgYW5ub3llZCBieSB1cmxsaWIzIDEueCB0byAyLjAgbWlncmF0aW9u
Lgo+Cj4gU2VlIGh0dHBzOi8vZ2l0aHViLmNvbS91cmxsaWIzL3VybGxpYjMvYmxvYi9tYWluL2Rv
Y3MvdjItbWlncmF0aW9uLWd1aWRlLnJzdAo+Cj4gWzFdCj4gaHR0cHM6Ly9naXRodWIuY29tL3Vy
bGxpYjMvdXJsbGliMy9ibG9iL21haW4vZG9jcy92Mi1taWdyYXRpb24tZ3VpZGUucnN0I2ltcG9y
dGVycm9yLWNhbm5vdC1pbXBvcnQtbmFtZS1kZWZhdWx0X2NpcGhlcnMtZnJvbS11cmxsaWIzdXRp
bHNzbF8KPiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL2JvdG8vYm90b2NvcmUvaXNzdWVzLzI5MjEK
Ckxvb2tzIGxpa2UgYW4gdXBkYXRlIHNob3VsZCBiZSBzdWZmaWNpZW50OgpodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjMwODA2MjEzNzQyLjQw
OTc1ODgtMS1qYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLwoKaHR0cHM6Ly9naXRodWIuY29tL2Jv
dG8vYm90b2NvcmUvaXNzdWVzLzI5MjYjaXNzdWVjb21tZW50LTE2NTc2MTM0NzQKCj4KPiBCZXN0
IHJlZ2FyZHMsCj4gUm9tYWluCj4KPiA+Cj4gPiBUaGFua3MgYSBsb3QhCj4gPgo+ID4gVGhvbWFz
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
