Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74BDCA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 19:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97D41613AC;
	Wed, 10 Sep 2025 19:14:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dqf6k88X74ih; Wed, 10 Sep 2025 19:14:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC67D6060B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC67D6060B;
	Wed, 10 Sep 2025 19:14:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 926CA2BB3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 19:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 753DD841BD
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 19:14:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPDE2XSjKga5 for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 19:14:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7377B841A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7377B841A0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7377B841A0
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 19:14:00 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5679dbcf9d8so2159895e87.0
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 12:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757531638; x=1758136438;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A6RJQo80/wcf/N/EsE3Mg/QryGwJc4dTJG9Tf6BwEdc=;
 b=f9viYtVpVhmWryQWKnILeLVT3k9axvqwBo8wenr625lbAZBcZuuHi0W/kZCmVmKE+1
 4EuSUaFKkWP0IzNkRdpjL4jC5CmjRRAxBeuh5misDUpZuGNwCsfiMVZ1ZcfRgWDAvYJT
 LHuUYlUOwUZ8soU6bqVfRk4RGQsJwBhIZ9S+MDXpsgarEDMpsQ6aoIZfkaoTKT6WVE25
 I8jQNkdKRAMxpZL99uhDRpMY20tGRhMUJkiVppcUxlhwH43YGb78ivaRKDLM7I7WOCed
 sZ283Qy86v/v5eAO4R1BsjBc/xZOURawzXkzJ5BZnv9866DK5CFKjwaioSnqSdWU8Mes
 EUpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi5XLw7bIlIATLBvNi4VDmXgKLC82dCu/dfeLhCZuHzkku2zhF19killBLjuKXzUF0UCNzAXJQJeY=@buildroot.org
X-Gm-Message-State: AOJu0YzTZA4mMdZhDGlYGVKCR01tOLW5J2DRFvauqE3SshUjKJMtSpQ6
 vhLwfrzlFrw/lma9cXVVpPCpquItWGFkDtLa1yrwXCmJZIibt+SparQXfF3ua0Tpkc2wR1menZD
 QdMO0qkOduQ==
X-Gm-Gg: ASbGncv+SmKPKIOXCB0jCAYG5w3z1FPhrahws/f6lmqk3rWL7Knm2sa0DhP1sVKyh+l
 TvnSIyPaJRT7jcx/O3eMINIZewznrb6XWRp/9mkEsdee85UUuXMTJ5SA8NEKu+Zn9BXaYp8udIt
 BD9fd/OjkXvoJVCliJy5Q88o2eLSmXBYdc0xi4zAXMidRNGBs+dC2E5V1KGlhy+/9+SySwIqxDv
 SjY0u3m1xdJpWhg751g8EgeAgpLhAGIaK8f3A2Kh6XLHs6hIY0uxIS/Abrc6WUk/L7Qhdqts4xi
 8VVMu/YjFTWjK+33mAvsOfWY6ovrbBdan2xkoCV8k5QlZsLfj72YsORv6fCH4yZ1aoHf3Fgh7f8
 OuC7Qh1tMVVFJqSWjyeWHvd3fpNPs/aIiJmbwtzmDQmtVbwlUxuPB7b8nGyufSsth8A==
X-Google-Smtp-Source: AGHT+IHt//14c1601a0S2418+LHnFjxYOZ4EGa5D/PLCgcu0J20gnh5rRPy2LD0pmfMmFjvXDxVptA==
X-Received: by 2002:ac2:4bce:0:b0:55f:4fac:3f2d with SMTP id
 2adb3069b0e04-5625ee79710mr5354613e87.6.1757531637972; 
 Wed, 10 Sep 2025 12:13:57 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56db891175csm40328e87.21.2025.09.10.12.13.57
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 12:13:57 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-336bbcebca9so56234911fa.1
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 12:13:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX35E+25PaMTAAGO9fL/djGjcAQTOtmh2orBuHqkBdHjG1/pT4gTMvaYAHRplsGs65dvzDtcDMTkAE=@buildroot.org
X-Received: by 2002:a05:651c:2113:b0:348:9ed5:ce33 with SMTP id
 38308e7fff4ca-3489ed5d246mr24352271fa.36.1757531636892; Wed, 10 Sep 2025
 12:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751377540.git.yann.morin@orange.com>
 <d23125d705a0c24ca91071624d507392ecfe7b0d.1751377540.git.yann.morin@orange.com>
 <a8b668d1-24da-4b18-8235-e98a29732884@smile.fr> <aL/bdHOwN/ENpcOl@yd-6wlzhs3>
 <CA+h8R2rxQ6Na-hG=BLZrNvL=Wu5bwur_8YeC3wNdFkjrKfsP4Q@mail.gmail.com>
 <69b87840-6431-412e-9f27-a8acb3112a7e@smile.fr> <aMFj2gv8Icxm+IDh@yd-6wlzhs3>
 <CA+h8R2prwcPxD-8QF+hYg0zAj22zT_Guo3LcXXFStpR8E82zXA@mail.gmail.com>
In-Reply-To: <CA+h8R2prwcPxD-8QF+hYg0zAj22zT_Guo3LcXXFStpR8E82zXA@mail.gmail.com>
Date: Wed, 10 Sep 2025 12:13:45 -0700
X-Gmail-Original-Message-ID: <CA+h8R2ojX40fLh2SQmfGRXsTNO4PzNke=eaa7p+S7Rzg0fo_rA@mail.gmail.com>
X-Gm-Features: Ac12FXyTZSqFpBoIBdsLmrktx07DIPeZ18nMosnky_fpANjrdZGV_0Jql2oBW9g
Message-ID: <CA+h8R2ojX40fLh2SQmfGRXsTNO4PzNke=eaa7p+S7Rzg0fo_rA@mail.gmail.com>
To: yann.morin@orange.com
Cc: Romain Naour <romain.naour@smile.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1757531638; x=1758136438; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A6RJQo80/wcf/N/EsE3Mg/QryGwJc4dTJG9Tf6BwEdc=;
 b=dZvlEk1MkvKrZHj9EAa26ln7GMdCuR9Epg6k7Eqz9MZH5LMypzCQ2j6kFBtUR/ZwjO
 dtc27W3/3WFpgJBICyE1vg29ik/37QlszWPIHkeDtO04mVKfTBWTbY4UQPP9T0LwbTMK
 4a+zNbHzxdXsMa2Ti9qtrBBnK2v5pkx+0Y9ZuCwF5wTHS7IzCLAvHTkBojg8xcJHtMBQ
 04385IZk8f/9ax6WBQfFbPlboDNTi+vAuMTMtBihSpRUqU5TlXD63lGT0ALb7xXlvEj1
 PnF+n+4evioCt4VE7JjmMwolW7G9sPBbbs+rbO6Z/s25/SO/Vdj3R+OcUeztOTaSnwI8
 Zfjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=dZvlEk1M
Subject: Re: [Buildroot] [PATCH 1/4 v2] package/pkg-golang: simplify
 installing multiple binaries
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

aGkgWWFubiwKCk9uIFdlZCwgU2VwIDEwLCAyMDI1IGF0IDEyOjA34oCvUE0gQ2hyaXN0aWFuIFN0
ZXdhcnQKPGNocmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4KPiBZYW5uLAo+Cj4gT24gV2Vk
LCBTZXAgMTAsIDIwMjUgYXQgNDo0MeKAr0FNIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+IHdyb3Rl
Ogo+ID4KPiA+IFJvbWFpbiwgQWxsLAo+ID4KPiA+IE9uIDIwMjUtMDktMTAgMTM6MTkgKzAyMDAs
IFJvbWFpbiBOYW91ciBzcGFrZSB0aHVzbHk6Cj4gPiA+IExlIDA5LzA5LzIwMjUgw6AgMTk6NTYs
IENocmlzdGlhbiBTdGV3YXJ0IGEgw6ljcml0IDoKPiA+ID4gPiBPbiBUdWUsIFNlcCA5LCAyMDI1
LCAxMjo0N+KAr0FNIDx5YW5uLm1vcmluQG9yYW5nZS5jb20KPiA+ID4gPiA8bWFpbHRvOnlhbm4u
bW9yaW5Ab3JhbmdlLmNvbT4+IHdyb3RlOgo+ID4gPiA+ID4gV2hhdCBhYm91dCB0aGUgc3RhdHVz
IG9mIHRoaXMgc2VyaWVzPyBDaHJpc3RpYW4gaGFzIHByb3ZpZGVkIGhpcwo+ID4gPiA+ID4gUmV2
aWV3ZWQtYnkgYSB3aGlsZSBiYWNrLi4uCj4gPiA+ID4gSXQgc3RpbGwgbG9va3MgZ29vZCB0byBt
ZSEKPiA+ID4gVGhhbmtzIGZvciB0aGUgcmVtaW5kZXIhCj4gPiA+IE5vdyB0aGUgMjAyNS4wOCBp
cyByZWxlYXNlIChhbmQgbmV4dCBtZXJnZWQgaW4gbWFzdGVyKSwgd2UgY2FuIGdvIGFoZWFkLgo+
ID4gPiBCdHcsIEkgcmVwbGFjZWQgMjAyNS4wOCBieSAyMDI1LjExIGluIHRoZSBsYXN0IGNvbW1p
dC4KPiA+Cj4gPiBJIG1pZ2h0IGhhdmUgYmVlbiBhIGxpdHRsZSB0aW55IHdlZW55IGJpdCB0b28g
b3B0aW1pc3RpYy4g8J+YnAo+ID4KPiA+ID4gQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KPgo+
IE5vdyB0aGF0IHRoaXMgaXMgbWVyZ2VkLCBob3cgZG8gSSByZW5hbWUgYSBidWlsZCBiaW5hcnkg
YmVmb3JlIGluc3RhbGxpbmc/Cj4KPiBIZXJlJ3MgYW4gZXhhbXBsZToKPgo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9za2lmZm9zL2J1aWxkcm9vdC9ibG9iL3NraWZmL3BhY2thZ2UvZ2VudWluZXRvb2xz
LWltZy9nZW51aW5ldG9vbHMtaW1nLm1rCgpPaCwgSSBndWVzcyB3ZSBjYW4gc3RpbGwganVzdCBz
ZXQgQklOX05BTUUuIElnbm9yZSEKClRoYW5rcywKQ2hyaXN0aWFuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
