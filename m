Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C723C3DA59
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 03:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA308401CE;
	Fri, 19 Jul 2024 03:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MvUHkEnrl0cg; Fri, 19 Jul 2024 03:38:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B061E40881
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B061E40881;
	Fri, 19 Jul 2024 03:38:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAE441BF315
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D828A40329
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 03:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KXst4vJvxYEf for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 03:38:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74CD940146
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74CD940146
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74CD940146
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 03:38:06 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-367963ea053so385011f8f.2
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721360284; x=1721965084;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TsfrtlgVM50rNOOtlnNgKSYOz7yc4lGAr5+1V7EWTZM=;
 b=E5tTBOmRUVGdiKhUy0G/4GDIfA1laZBmIdfU32HljiQpo3Gx0b5J5ZaFYyrLBj1ULh
 He55+xUC3pxFqRmokmX2xAzQu2YjNxWefOGfFHKpP1LgOyiBjkRG7Hjc8/1vmANlwi1t
 bQAHRxsKCCHxNmo3kqOE1/2s6ACyWMTDqGCpiLqCYEUgFvxX+GXeNAVoxzyNlMZUeELU
 4glszyiZH/E3I80FbVzTmUuRGeBIo1s3N/SwcXtYY4/lE8uNC2++Ju9zynI6Zi670V5f
 m4kwgQwO8RC1FruS/5khQPb9VGzVI3G+Agrjnocxoky66LwnxVeCi0GpfA+ijNM/J7t9
 +eTw==
X-Gm-Message-State: AOJu0YzM5V0Qd2rhKAddZkUDMxJU81HrKRxRvxfO/+UcoP1WUkmzOlVg
 nQn2tEa+Cr1mXNozIv/bRBym8lvyhei/2w7kNO/nF7H7u74HLe9C8D6tl3l0VIWrT+7f7E/oAsD
 2LcvfIg==
X-Google-Smtp-Source: AGHT+IEWGArX/sW8eztDH6L5Z6OvpvO9w7z30XSdoreD7TH6nD5ORL0RbwzdpOagCMDKilrYwyDxiw==
X-Received: by 2002:a5d:6445:0:b0:368:4910:8f43 with SMTP id
 ffacd0b85a97d-36849109037mr3222898f8f.3.1721360283702; 
 Thu, 18 Jul 2024 20:38:03 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a33b3f068sm39064566b.97.2024.07.18.20.38.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 20:38:03 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-36798779d75so381047f8f.3
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:38:03 -0700 (PDT)
X-Received: by 2002:a05:6000:184a:b0:367:f054:620a with SMTP id
 ffacd0b85a97d-3683164e06bmr7047728f8f.30.1721360282644; Thu, 18 Jul 2024
 20:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240207022157.2560531-1-christian@aperture.us>
 <87ttmk1wib.fsf@48ers.dk>
In-Reply-To: <87ttmk1wib.fsf@48ers.dk>
Date: Thu, 18 Jul 2024 20:37:51 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qVmF2sXFR587vLX0cVs1MfijBhckDJLtarCHXvRNYYQQ@mail.gmail.com>
Message-ID: <CA+h8R2qVmF2sXFR587vLX0cVs1MfijBhckDJLtarCHXvRNYYQQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1721360284; x=1721965084; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TsfrtlgVM50rNOOtlnNgKSYOz7yc4lGAr5+1V7EWTZM=;
 b=Qmc/EjEJ1gitVw1sfINeM0hW/cQkYQS2fedfWeW0A/thZbypBuNUXPokexX50UREBz
 nPkZGofj9Q2L6kEA2crOpbLlL7TPcvzyDwnSxl0SysD3tO3kyUfv4d5CzcBVexhyWGf0
 +8nqWqYoiyqzhQbk2dSOX0P5nKX8tuG/ytGzWm2OhP79/U3aud1PMhTNiMQh9zce81hx
 2oYtt3Q1u+pAJnAisXDyZz7AohPj40YdbBv7KPz7EPLAuFJJm1A9KSzwpE8g/lUkpUYS
 aweCJoV7gH5HlZ8GuGwNSRhxEAoCpXsw3MOtYiT64WtSKqyY/z38fQ2dPm8GOK1QySHD
 jtOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=Qmc/EjEJ
Subject: Re: [Buildroot] [PATCH v1 1/2] package/docker-engine: bump version
 to v25.0.3
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgpPbiBXZWQsIEZlYiA3LCAyMDI0IGF0IDEyOjU44oCvQU0gUGV0ZXIgS29yc2dh
YXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiB3cm90ZToKPgo+ID4+Pj4+ICJDaHJpc3RpYW4iID09
IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+IHdyaXRlczoKPgo+ICA+
IGh0dHBzOi8vZ2l0aHViLmNvbS9tb2J5L21vYnkvcmVsZWFzZXMvdGFnL3YyNS4wLjMKPgo+IFRo
aXMgaXMgYWxzbyBhIHNlY3VyaXR5IGJ1bXAuIEluIGZhY3QsIGl0IHdvdWxkIGJlIG5pY2VyIHRv
IGZpcnN0IGJ1bXAKPiB0byAyNC4wLjkgd2hpY2ggY291bGQgdGhlbiBiZSBiYWNrcG9ydGVkIHRv
IDIwMjMuMDIueCBhbmQgMjAyMy4xMS54IGFuZAo+IHRoZW4gYWZ0ZXJ3YXJkcyBidW1wIHRvIDI1
LjAuMy4KPgo+IEkgc2VlIHRoZSBidWlsZGtpdCBpc3N1ZXMgYXJlIG5vdCBmaXhlZCBpbiAyNC4w
LjksIGJ1dCBJIGd1ZXNzIGl0IGlzCj4gdW5saWtlbHkgdGhhdCB3ZSBoYXZlIEJ1aWxkcm9vdCBi
YXNlZCBzeXN0ZW1zIEJVSUxESU5HIGNvbnRhaW5lcnMsIHNvCj4gdGhhdCBpcyBwcm9iYWJseSBs
ZXNzIGNyaXRpY2FsLgo+Cj4gQ2FyZSB0byByZXdvcmsgaXQgYXMgdHdvIGJ1bXBzPwoKSSBqdXN0
IHNlbnQgYW5vdGhlciBwYXRjaCB1cGRhdGluZyB0byBsYXRlc3Q6CgpodHRwczovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwNzE5MDMzMzMxLjEzNjA2
LTEtY2hyaXN0aWFuQGFwZXJ0dXJlLnVzLwpodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQwNzE5MDMzMzMxLjEzNjA2LTItY2hyaXN0aWFuQGFw
ZXJ0dXJlLnVzLwoKSXQgbWF5IG9yIG1heSBub3QgYmUgYSBzZWN1cml0eSBidW1wLgoKSSBqdXN0
IHNhdyB5b3VyIGFib3ZlIG5vdGUsIGFwb2xvZ2llcy4gSSBkb24ndCBoYXZlIHRpbWUgcmlnaHQg
bm93IHRvCnJldmlzZSB0aGUgcGF0Y2hlcyBmdXJ0aGVyLgoKQmVzdCByZWdhcmRzLApDaHJpc3Rp
YW4gU3Rld2FydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
