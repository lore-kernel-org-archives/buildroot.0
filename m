Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDC3C64ED6
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 07:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5399E80FB6;
	Wed,  1 Mar 2023 07:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5399E80FB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ohDHDjUiW56N; Wed,  1 Mar 2023 07:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8EC780E9C;
	Wed,  1 Mar 2023 07:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8EC780E9C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0AB381BF341
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 07:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEA1060AA0
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 07:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEA1060AA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fwGzrLJ5DnVM for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 07:43:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA6EA60760
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA6EA60760
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 07:43:13 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 130so7199120pgg.3
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 23:43:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677656593;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WnmkKTlMqVsY5qme7sT8fmJzfz0TeQav/0zVQ19PaNE=;
 b=UqQxq9XgwbkeczfEhQxMU1MYmjKQofqH+OfH0GIySyIAE40wj3ZYZVP+cVIdLa0vm9
 LFOSl4A6l1xbYElEXYhgCuITeyvjgpWEDgimZPNGDgyO6wGzvMDzJCpJYwVqhY/5wg1I
 Rlwh0yhlR3FKNbFGdt9fHJoVqujx1YeO1CdLx2GWP8b7Ud5gHJpiQerdjRpH6RwhwTOl
 R6Im5E5wt6MHGII+7pEKEseubizV/O9U9jTjWyjQWTSY3mtgVx7X6l4E409ycBYt0Zif
 HtQXLqcq3+htNcg9eEtISfFwsTDarH+nPdOtaQCvZOPa83hVHow5ijT0KiZlwfV3Fml/
 DBWw==
X-Gm-Message-State: AO0yUKVDW0+UbfmT2xNDNfUiwqIkfDAiz8kJe7SFKhGlhId+9R0lAoFT
 5ZwSRq0iYaOZuPMJzHbdADK7sJtRqp8mpfxB3kuaTg==
X-Google-Smtp-Source: AK7set8vImbRpu8+S6MfrtR4da/FJjLh7UtLi7/W9tPxZNcuNsSuO4ECTwGdf5jMe+Q4ReZ7OG9gPsUcOIS2klLMdbE=
X-Received: by 2002:a62:ce85:0:b0:606:653c:f19b with SMTP id
 y127-20020a62ce85000000b00606653cf19bmr1016780pfg.5.1677656592636; Tue, 28
 Feb 2023 23:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20221224171920.11256-1-raphael.pavlidis@gmail.com>
 <20230222232157.380b6109@windsurf>
 <20230228130843.GC32199@carcass.dev.6wind.com>
 <CANqv2T3GWoqn6an34HQUW6njK2g=YZCqvoDMh-kfKooVacRMpA@mail.gmail.com>
 <886d6be9-94ba-2bc9-5583-4c9400bf3a76@gmail.com>
 <CANqv2T2r0sbnwdMinzdw7ryw9CUsx=jwCD0hvA3FT2mxVFQz8g@mail.gmail.com>
 <CANqv2T0Riojve2sNUNky28Vt8A=sMwVuZEsTZv66Zace1JnRWA@mail.gmail.com>
 <16816a3d-c62a-c1e9-9409-78541956b1ba@gmail.com>
In-Reply-To: <16816a3d-c62a-c1e9-9409-78541956b1ba@gmail.com>
From: stephane gonauer <stephane.gonauer@6wind.com>
Date: Wed, 1 Mar 2023 08:43:01 +0100
Message-ID: <CANqv2T2odbOu-B-ErOUA+07sdMPEWc8-T695zqumrB-wT6gmXg@mail.gmail.com>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=6wind.com; s=google; t=1677656593;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WnmkKTlMqVsY5qme7sT8fmJzfz0TeQav/0zVQ19PaNE=;
 b=KzoWv6H4/sYjoD96k/qyGqa+gH49ygiiK8BfOpT/EgSuPdxT3Zty0TmbWW1Uxk5FLM
 c6v3QW4AZ9OF5LkhjBp+D2c4zeh9eeqbBUnB/4P/n467laPTxFmSSCq+A0selCPoTW6z
 cUenG+IkCKMykU6MrueTq7Sey/sLMzMknz2ZNuAEGYb/Hs2+Fy0w3k7B7BB32sDZqZw1
 WVcq0A3FC1J6WZQZyiIxx8CHwoxeEzI41Z2P+G8WnHRCw2AUHUVIzpV4C5ZIcA0yTufq
 C/2BQy0qe8tLJ2lURnJRENSh4vOVkBzWEN+0llTfcqAiPBuF9KiVQEKVdgSjeacMmfMh
 9nRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com
 header.a=rsa-sha256 header.s=google header.b=KzoWv6H4
Subject: Re: [Buildroot] [PATCH v4 1/1] package/shadow: new package
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUmFwaGFlbCwKClRlc3Rpbmcgd2l0aCBxZW11IGlzIHByZXR0eSBlYXN5CkhlcmUgYXJlIHRo
ZSBzdGVwIEkgZm9sbG93IDoKCmdpdCBjbG9uZSBodHRwczovL2dpdGh1Yi5jb20vYnVpbGRyb290
L2J1aWxkcm9vdC5naXQKY2QgYnVpbGRyb290CmdpdCBjaGVja291dCAtdCBuZXh0Cm1ha2UgcWVt
dV94ODZfNjRfZGVmY29uZmlnCm1ha2UgbWVudWNvbmZpZyA8PSB0byBhZGQgU0hBRE9XL0xJTlVY
X1BBTSBldGMKbWFrZSAtajgKLi9vdXRwdXQvaW1hZ2VzL3N0YXJ0LXFlbXUuc2gKClRoZSBzY3Jp
cHQgc3RhcnRzIGEgdm0gd2l0aCBhIHNlcmlhbCBjb25zb2xlIGFuZCBpdCBpcyBwYXJ0IG9mIHRo
ZQpidWlsZHJvb3QgcmVwby4KClRoZW4gZWl0aGVyIEkgY2FuIGxvZ2luIChyb290IHdpdGhvdXQg
cGFzc3dvcmQpIG9yIG5vdAoKU3TDqXBoYW5lCgpMZSBtYXIuIDI4IGbDqXZyLiAyMDIzIMOgIDIx
OjM4LCBSYXBoYWVsIFBhdmxpZGlzCjxyYXBoYWVsLnBhdmxpZGlzQGdtYWlsLmNvbT4gYSDDqWNy
aXQgOgo+Cj4gSGkgU3RlcGhhbmUsCj4KPiBPbiAyOC4wMi4yMyAxODoxMCwgc3RlcGhhbmUgZ29u
YXVlciB3cm90ZToKPiA+IEhpLAo+ID4KPiA+IElmIG15IHByZXZpb3VzIGVtYWlsIGlzIG5vdCBj
bGVhciA6Cj4gPgo+ID4gLSBxZW11X3g4Nl82NF9kZWZjb25maWcgKyBCUjJfUEFDS0FHRV9TSEFE
T1cgLT4gd29ya3MKPiA+IC0gcWVtdV94ODZfNjRfZGVmY29uZmlnICsgQlIyX1BBQ0tBR0VfU0hB
RE9XICArIEJSMl9QQUNLQUdFX0xJTlVYX1BBTQo+ID4gLT4gZmFpbHMgYW5kIHRoZXJlIGlzIG5v
ICJzeXN0ZW0tYXV0aCIgZmlsZSBhbnl3aGVyZSBpbiB0aGUgYnVpbGQKPiA+IC0gcWVtdV94ODZf
NjRfZGVmY29uZmlnICsgQlIyX1BBQ0tBR0VfU0hBRE9XICArIEJSMl9QQUNLQUdFX0xJTlVYX1BB
TQo+ID4gKyBCUjJfSU5JVF9TWVNURU1ELT4gZmFpbHMsIHN5c3RlbS1hdXRoIGlzIG5vdCBpbiAv
ZXRjL3BhbS5kIGluIHRoZQo+ID4gdGFyZ2V0IGZvbGRlci4gSSBkb24ndCBrbm93IHdoYXQgaGFw
cGVuIGF0IHJ1bnRpbWUgKGJlY2F1c2UgSSBjYW5ub3QKPiA+IGxvZ2luKSAgaW4gdGhhdCBjYXNl
IEkgYWxzbyBmaW5kCj4gPiB0YXJnZXQvdXNyL3NoYXJlL2ZhY3RvcnkvZXRjL3BhbS5kL3N5c3Rl
bS1hdXRoCj4KPiBUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uLgo+Cj4gPgo+ID4gRG8geW91
IHRoaW5rIHdpdGgvd2l0aG91dCBzeXN0ZW1kIGNhc2Ugc2hvdWxkIGJlIGZpeGVkIGRpZmZlcmVu
dGx5ID8KPiA+IEluIGFueSBjYXNlIHRoZSBtaXNzaW5nIGZpbGUgc2VlbXMgdG8gYmUgL2V0Yy9w
YW0uZC9zeXN0ZW0tYXV0aC4KPgo+IFllcywgdGhlIGZpbGUgaXMgcHJlc2VudCB3aXRoIHN5c3Rl
bWQsIGJ1dCBpdCBpcyBub3QgY29waWVkIGR1cmluZyBib290Cj4gYnkgc3lzdGVtZC10bXBmaWxl
cy5zZXJ2aWNlLgo+Cj4gPgo+ID4gU3TDqXBoYW5lCj4gPgo+IFtTTklQXQo+Cj4gV291bGQgeW91
IGxpa2UgdG8gdGVsbCBtZSwgd2hpY2ggY29tbWFuZCB5b3UgYXJlIHVzaW5nIHdpdGggUUVNVT8g
SQo+IHdvdWxkIGxpa2UgdG8gY2hlY2ssIHdoYXQgaGFwcGVuZWQgKGlmIEkgZmluZCB0aGUgdGlt
ZSB0bykuCj4KPiBUaGFua3MsCj4gUmFwaGFlbCBQYXZsaWRpcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
