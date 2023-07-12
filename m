Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79F4EB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 14:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68BF6611B1;
	Wed, 12 Jul 2023 14:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68BF6611B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e2h88SqC2OL8; Wed, 12 Jul 2023 14:09:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99D8160AD4;
	Wed, 12 Jul 2023 14:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99D8160AD4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 813EC1BF407
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 14:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58A6B402C3
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 14:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58A6B402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MmPvvfC_-__b for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 14:09:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E36084024A
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E36084024A
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 14:09:40 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5746cso78045385e9.2
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 07:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689170979; x=1691762979;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KlQT9Vc7C/Q5qTxbLVhZlnCTPeKESmhWsFGA/QObQhE=;
 b=VBYU5snqHzUl1tx08g0QLscwa+OReOgTxHlEIhrH+j6XJDizpyWSug9ENSNUcrUtCh
 lYUa95su1gShooxuNn1j8W2ICC5UgOYRCmD+8ADMDzafeTgTS2snN4tdcuRDFJ3zK4Jd
 N0yVNct2TZ1lfvuGb+vXYXXHZlNTWiPMqFzWQHDnSkwN1wgZFKRXzrxKQXaxCvfvjylP
 MTQzeERE3QKRp9MEOl/UbNXevdbjmbxnmjXRfda6/BmZ6umCBClTO4wtE9oiQVgLBSep
 IPD4S0kevkeqZtR3bHVF2BtQTnmFcJFgIccQL9UF5pHYBV+/YGA49v8nqCMdJQLDwD1w
 oFhA==
X-Gm-Message-State: ABy/qLbRkisJ+RugPNMcjqonAZGRudCyUUvASxQu0FNKuUmFZ2Cy6UiV
 oYkM/j9T92ETq3W5DSf+w7/6Up7I2yFhFGxSHZM=
X-Google-Smtp-Source: APBJJlFb8PcgXdqg0yRcL8LOGfJJKfDVEd7ZnqIDaBPHxYYT7iNqCl6L7zM4aXfX8dZxGBfrmeow4A==
X-Received: by 2002:a05:600c:251:b0:3fb:e4ce:cc7a with SMTP id
 17-20020a05600c025100b003fbe4cecc7amr18444800wmj.0.1689170978881; 
 Wed, 12 Jul 2023 07:09:38 -0700 (PDT)
Received: from [10.5.2.165]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c280400b003fc07e17d4esm11874363wmb.2.2023.07.12.07.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 07:09:38 -0700 (PDT)
Message-ID: <7230b196-162f-c7f6-bced-47fcc7d4979a@smile.fr>
Date: Wed, 12 Jul 2023 16:09:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20230611115748.801929-1-romain.naour@gmail.com>
 <20230712120557.143513ff@windsurf>
 <4be832e6-521d-67a7-17c0-6f3bcac3587b@smile.fr>
In-Reply-To: <4be832e6-521d-67a7-17c0-6f3bcac3587b@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1689170979; x=1691762979;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KlQT9Vc7C/Q5qTxbLVhZlnCTPeKESmhWsFGA/QObQhE=;
 b=cJztZ8TzBRFZGk8C74B4/kGefp3t7OhzRL1vOJJEOht/R/rnknr2G7mLSE/4aqPCxp
 hF6I82YWAYrXZD9EcjUcM7fyAgz1T2YqZPWa/G5YIo0D5VF8I3Y+zx7wO7vJmwW5paSg
 GfvfoFGl/rMjsXh+fihqoSZf3ELldD/uq1gK6yf/nBXZJTZowdk7CAhvjgh1MUk89i/9
 9/UH57nomc70rduP/oo8fnxZOBdJovjAHJMBvKUvNJVZJBsG8XU9xqHh6B1g7n0EiBwB
 sexYAbviQqdTvuuZevvGsMstFOBAA+Wws5HxU2/JLeJFA+ERHWq2fGAzSSjlRFULie4E
 GQPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=cJztZ8Tz
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: TestGlxinfo: bump
 kernel version to 6.1.x
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

TGUgMTIvMDcvMjAyMyDDoCAxNDo1MiwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gSGVsbG8g
VGhvbWFzLAo+IAo+IExlIDEyLzA3LzIwMjMgw6AgMTI6MDUsIFRob21hcyBQZXRhenpvbmkgdmlh
IGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+PiBIZWxsbyBSb21haW4sCj4+Cj4+IE9uIFN1biwgMTEg
SnVuIDIwMjMgMTM6NTc6NDcgKzAyMDAKPj4gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21h
aWwuY29tPiB3cm90ZToKPj4KPj4+IFRoZSBrZXJuZWwgNi4xLnggaXMgdGhlIGxhdGVzdCBMVFMg
dmVyc2lvbi4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90
ZXN0X2dseGluZm8ucHkgfCAyICstCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4+Cj4+IFRoYW5rcywgSSd2ZSBhcHBsaWVkIGJvdGguIEhvd2V2ZXIs
IGRpZCB5b3Ugbm90aWNlIHRoYXQgdGhpcyBHbHhJbmZvCj4+IHRlc3QgaXMgY3VycmVudGx5IGJy
b2tlbj8gU2VlCj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8t
L2pvYnMvNDYyMTA0NjMyNi4gSXQgZmFpbHMKPj4gYXQgcnVudGltZSBiZWNhdXNlIHRoZSBnbHhp
bmZvIGNvbW1hbmQgY2Fubm90IGJlIGZvdW5kIGluIHRoZQo+PiBmaWxlc3lzdGVtIChJIGhhdmUg
bm90IGludmVzdGlnYXRlZCBmdXJ0aGVyIHRoYW4gdGhhdCkuCj4gCj4gVGhpcyBpcyBzb21ldGhp
bmcgbmV3LCBJJ20gd29uZGVyaW5nIGlmIGl0J3MgcmVsYXRlZCB0byB0aGUgcmVjZW50IG1lc2Ez
ZC1kZW1vCj4gdmVyc2lvbiBidW1wIHRvIDkuMC4wPwo+IAo+IEknbGwgdGFrZSBhIGxvb2suCgpJ
bmRlZWQsIHJldmVydGluZyB0aGUgbWVzYTNkLWRlbW9zIGJ1bXAgZml4ZXMgdGhlIGlzc3VlLgpU
aGUgZ2x1dCBsaWJyYXJ5IHNlZW1zIG5vdCBjb3JyZWN0bHkgZGV0ZWN0ZWQgYnkgdGhpcyBuZXcg
cmVsZWFzZS4KCm1lc2EtZGVtb3MgOS4wLjAKClJ1bi10aW1lIGRlcGVuZGVuY3kgZ2x1dCBmb3Vu
ZDogTk8gKHRyaWVkIHBrZ2NvbmZpZyBhbmQgY21ha2UpCkhhcyBoZWFkZXIgIkdML2dsdXQuaCIg
OiBOTwoKbWVzYS1kZW1vcyA4LjUuMAoKUnVuLXRpbWUgZGVwZW5kZW5jeSBnbHUgZm91bmQ6IFlF
UyA5LjAuMgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBSb21h
aW4KPiAKPiAKPj4KPj4gQmVzdCByZWdhcmRzLAo+Pgo+PiBUaG9tYXMKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
