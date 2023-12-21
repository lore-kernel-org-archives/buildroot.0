Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C87C35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 14:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE5D94210F;
	Thu, 21 Dec 2023 14:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE5D94210F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t52iN6UybXEt; Thu, 21 Dec 2023 14:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AD7541D5F;
	Thu, 21 Dec 2023 14:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AD7541D5F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 650D01BF2EF
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 14:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BA0360AB5
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 14:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BA0360AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ztzu_UDreA9Z for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 14:40:25 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F19B60F20
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 14:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F19B60F20
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-548ce39b101so1062974a12.2
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 06:40:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703169623; x=1703774423;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MsZ+K80gMb0yDBZIS4zYOsgG3he9ABkDxdJGuTzy+t4=;
 b=IndNKp+KXe0IeZf0vbeRyQAGiAI+WPDt4Kwh3KNoqMXPU/7D3dzTKT1hMxbjFqkXkv
 HIcDWmDDGTEhJkDh7yrS4vSaIN6csLYYxsVe4bb4TzJX3ZBvIilvhLjtEObDG2Cqg43K
 ckhHBXV9TyUia+PS2LtSfTzhnXSwQYnR/7emI8CgwgWopDvjyCbGe4XOHppXRHqXPafg
 PMvj8NfcDvCLsmm5xJbo5sR/qlLqNz84xlo+vVs200/ImCYLXRf9IdDZMJ38iGaZwNv+
 uM3EuiuUWi0qmNgT0S7r61EHB8pgcosk+sYq4gI2jmoJ5luMBUi6jjlWtj/Z9+xTLx62
 yeiQ==
X-Gm-Message-State: AOJu0Yxm1Ulopd9WLHbYqhlVR9ZiiZXzUjcybQAZgd5kGWj/9FZl30Mb
 aw5pmpHcnKgrv4E3fe3ezz64H9A0hZi3YzZJWaRsWtjlAU37G8pr
X-Google-Smtp-Source: AGHT+IH9qV0EozETbFUD4/rfPoulvjqJGJawI+Qvu/EjO3a9xRxMDa3c+12Y3XAu3/zjLS2I97PYbumDcPVABCyAeuY=
X-Received: by 2002:a17:907:6d16:b0:a23:4a65:7732 with SMTP id
 sa22-20020a1709076d1600b00a234a657732mr3439043ejc.94.1703169623344; Thu, 21
 Dec 2023 06:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
 <20231221001924.1356215-6-adam.duskett@amarulasolutions.com>
 <20231221093512.0130c521@windsurf>
In-Reply-To: <20231221093512.0130c521@windsurf>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu, 21 Dec 2023 07:40:12 -0700
Message-ID: <CAHDQB6MnDp9YnkF0iay-mte9p8o-9yokvdy1n+i300bUaKGjjA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703169623; x=1703774423;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MsZ+K80gMb0yDBZIS4zYOsgG3he9ABkDxdJGuTzy+t4=;
 b=BR0pznyEdwRhzTrOX9dzIKVrT1v+wY9O0ftu2ZR5fCUHBuq6NDzRnqF5TmVvImWqaG
 eBuZOpZfDnSDOfQpe7MasIy9ZGbpz1JdlRids3ZzgnSxWBgOd0o0utSOtYdecPV7lCRU
 ksdhnTMOkXlK+eilF/3aNrF+WuOwCCEMmR0lE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BR0pznyE
Subject: Re: [Buildroot] [PATCH v3 06/10] package/sway: enable
 default-wallpaper support
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

V29ya3MgZm9yIG1lLiBJIG1pc3NlZCB0aGF0IG9wdGlvbiBpbiB0aGUgc3dheWJnIHBhY2thZ2Uh
CkFkYW0gRHVza2V0dAoKU2VuaW9yIEVtYmVkZGVkIFN5c3RlbXMgRGV2ZWxvcGVyCgpNLiArMTIw
OC01MTUtODEwMgoKYWRhbS5kdXNrZXR0QGFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCgoKQW1hcnVsYSBTb2x1dGlvbnMgQlYKCkpvb3AgR2Vl
c2lua3dlZyAxMjUsIDExMTQgQUIsIEFtc3RlcmRhbSwgTkwKClQuICszMSAoMCk4NSAxMTEgOTE3
MAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KCgoK
T24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMTozNeKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBPbiBXZWQsIDIw
IERlYyAyMDIzIDE3OjE5OjIwIC0wNzAwCj4gQWRhbSBEdXNrZXR0IDxhZGFtLmR1c2tldHRAYW1h
cnVsYXNvbHV0aW9ucy5jb20+IHdyb3RlOgo+Cj4gPiAraWYgQlIyX1BBQ0tBR0VfU1dBWQo+ID4g
Kwo+ID4gK2NvbmZpZyBCUjJfUEFDS0FHRV9TV0FZX0RFRkFVTFRfV0FMTFBBUEVSCj4gPiArICAg
ICBib29sICJJbnN0YWxsIGRlZmF1bHQgd2FsbHBhcGVyIgo+ID4gKyAgICAgc2VsZWN0IEJSMl9Q
QUNLQUdFX1NXQVlCRwo+Cj4gSSBkb24ndCBoYXZlIGEgaGFyZCBmZWVsaW5nIG9uIHRoaXMgb25l
LCBidXQgd2h5IGlzbid0IHRoaXMgaGFuZGxlZAo+IGxpa2UgdGhpczoKPgo+IGlmZXEgKCQoQlIy
X1BBQ0tBR0VfU1dBWUJHKSx5KQo+IFNXQVlfQ09ORl9PUFRTICs9IC1EZGVmYXVsdC13YWxscGFw
ZXI9dHJ1ZQo+IGVsc2UKPiBTV0FZX0NPTkZfT1BUUyArPSAtRGRlZmF1bHQtd2FsbHBhcGVyPWZh
bHNlCj4gZW5kaWYKPgo+IFRoZSBzd2F5YmcgcGFja2FnZSBhbnl3YXkgaGFzOgo+Cj4gICAgICAg
ICBkZWZhdWx0IHkgaWYgQlIyX1BBQ0tBR0VfU1dBWQo+Cj4gU28gdXNlcnMgYXJlIG5vdCBsaWtl
bHkgdG8gbWlzcyBpdCAiYnkgZGVmYXVsdCIuCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRh
enpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2Vy
bmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
