Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E0FCD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 21:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 927CE613EA;
	Fri, 15 Sep 2023 21:54:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 927CE613EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZbrP9wXVfoya; Fri, 15 Sep 2023 21:54:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB891613E8;
	Fri, 15 Sep 2023 21:54:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB891613E8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62D311BF46A
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BFCC613E8
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BFCC613E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZirwpjYzU7Mx for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 21:54:35 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9282613E5
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 21:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9282613E5
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-502e0b7875dso4318809e87.0
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 14:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694814872; x=1695419672;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/TnmWRPUUqw8boPiQ1H0Uj+eBy/ClWALM3vd4zg0u5A=;
 b=AebAvKs+nmq0wXebjFUeRnSHFnXtL9iz8lnPDMkmltgXQd4FD6igteRKIRiEPsuJVx
 tk0B+O4Gez8qlIQCSyTLkAYS9zC5niJg/cttmbi5npxWMksi5Hvpx1vnnAjqcoiibaX6
 lHdHIgRR13YQkB7nGK0Y9lrbcFfswmaEmFKey7LQL4Pi0xzwlXAveS+jn1yKEIdDQqHC
 0LpoQnqfKVKwkjeOrbTdQOtERpm5Svci9CmrVXgh8T9nSxrtm8mLv3Km/69IN+IP2AW+
 eap0IoJu22iv3FCPBLXKZwuRgnkD/kRgetWLl+Z0uMFVii/mGEuW+sCvBI/r12cJg4MG
 zRPQ==
X-Gm-Message-State: AOJu0YyXj5sZxQWyaHkIcVHF5uq7MFEHVUJYcE3pvshPnAqxjSJt0xCe
 Y3FvgJpeKj2tRaupKd7YwxxcmvXA3H0U1P1H+m4MCq0j
X-Google-Smtp-Source: AGHT+IHpyCP7QnzCMqGdhgAAeHT02v+8RwJgZViNuvZ/8uF3uWofzlCfonYIgOJFfJMg+5ok6nC5JA==
X-Received: by 2002:a05:6512:34ca:b0:500:a39a:1b99 with SMTP id
 w10-20020a05651234ca00b00500a39a1b99mr2367935lfr.38.1694814872049; 
 Fri, 15 Sep 2023 14:54:32 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 i13-20020a170906114d00b00992afee724bsm2878819eja.76.2023.09.15.14.54.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 14:54:30 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-9ad8a33fd0dso322163366b.3
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 14:54:30 -0700 (PDT)
X-Received: by 2002:a17:907:775a:b0:9a9:f14a:22dc with SMTP id
 kx26-20020a170907775a00b009a9f14a22dcmr2607142ejc.8.1694814870339; Fri, 15
 Sep 2023 14:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230724010907.411055-1-christian@aperture.us>
In-Reply-To: <20230724010907.411055-1-christian@aperture.us>
Date: Fri, 15 Sep 2023 14:54:19 -0700
X-Gmail-Original-Message-ID: <CA+h8R2obqn1sg4pReRfb=9rg9sA_Zc8sdUEOvdfT7Knd8mB6qA@mail.gmail.com>
Message-ID: <CA+h8R2obqn1sg4pReRfb=9rg9sA_Zc8sdUEOvdfT7Knd8mB6qA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1694814872; x=1695419672; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/TnmWRPUUqw8boPiQ1H0Uj+eBy/ClWALM3vd4zg0u5A=;
 b=bZx++Pnnx1TGUjOdEfspzFTw1p69eizjFfwZPotGizsnYhPy1+fixBeM2rjhk3l54c
 iUVxVvtQnJTwIkGli6lXg+fFNRovekX3UAD5MmMNxfMw4Ob2sPyLzDIbS/3ZtXDXoJTE
 09zb6plzso+pmiyoLHkBSHqZg68PNOMimwGkEZy8aKD+iPOAbeWm6dE1hIFDdDQoZxme
 F3kR7l9Dfb2yihykvPBmD1btWF7KAQ0q0a2s1YDymW83RuGGlkuXiXej89tSOYIMwzr7
 XcCECQMo4DViy7+K8xRsh1EHUYAGETExNxERJLJD9msNbX0RoinK34eoZFo9U1sKwcR6
 Py8A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=bZx++Pnn
Subject: Re: [Buildroot] [PATCH v3 1/1] package/docker-cli-buildx: new
 package
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKCk9uIFN1biwgSnVsIDIzLCAyMDIzIGF0IDY6MDnigK9QTSBDaHJpc3RpYW4gU3Rl
d2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPiB3cm90ZToKPgo+IGJ1aWxkeCBpcyBhIGRvY2tl
ciBDTEkgcGx1Z2luIGltcGxlbWVudGluZyBleHRlbmRlZCBidWlsZCBmZWF0dXJlcy4KPgo+IGJ1
aWxkeCBpcyB0aGUgZGVmYXVsdCBidWlsZGVyIGFzIG9mIERvY2tlciB2MjMueCwgYW5kIGlmIHRo
ZSBwbHVnaW4gaXMgbm90Cj4gcHJlc2VudCwgdGhlIENMSSB3aWxsIG91dHB1dCBhbiBlcnJvciB3
YXJuaW5nIHRoYXQgaXQgaXMgdXNpbmcgdGhlIGRlcHJlY2F0ZWQKPiBidWlsdC1pbiBidWlsZGVy
IGluc3RlYWQgb2YgdGhlIGJ1aWxkeCBidWlsZGVyLgo+Cj4gSG93ZXZlciwgYnVpbGR4IGlzIGEg
c2VwYXJhdGUgcmVwb3NpdG9yeSBmcm9tIGRvY2tlci1jbGk6IGl0IGlzIGEgcGx1Z2luIHRoYXQK
PiBuZWVkcyB0byBiZSBpbnN0YWxsZWQgYXQgL3Vzci9saWIvZG9ja2VyL2NsaS1wbHVnaW5zIG9u
IHRoZSB0YXJnZXQuCj4KPiBodHRwczovL2dpdGh1Yi5jb20vZG9ja2VyL2J1aWxkeAo+Cj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4KPgo+
IC0tLQo+Cj4gdjEgLT4gdjI6Cj4KPiAgLSBidWlsZHg6IGJ1bXAgdmVyc2lvbiB0byB2MC4xMS4x
Cj4gIC0gaHR0cHM6Ly9naXRodWIuY29tL2RvY2tlci9idWlsZHgvcmVsZWFzZXMvdGFnL3YwLjEx
LjEKPiAgLSBOT1RFOiBkb2NrZXItY2xpLWJ1aWxkeCByZXF1aXJlcyBsYW5ndWFnZSBmZWF0dXJl
cyBmcm9tIGdvMS4yMCEKPiAgLSBEZXBlbmRzIG9uIGJ1bXAgdG8gZ28xLjIwLng6Cj4gICAgLSBo
dHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjMw
NzExMjIwODQ5LjE3MDIzNTgtMy1jaHJpc3RpYW5AYXBlcnR1cmUudXMvCj4KPiB2MiAtPiB2MzoK
Pgo+ICAtIFJlbmFtZSBiaW4gZnJvbSBidWlsZHggdG8gZG9ja2VyLWJ1aWxkeCAoZml4ZXMgZG9j
a2VyIGNsaSBub3QgZmluZGluZyBpdCkKPiAgLSB1cGRhdGUgZG9ja2VyLWNsaS1idWlsZHggdG8g
djAuMTEuMgo+ICAgIC0gaHR0cHM6Ly9naXRodWIuY29tL2RvY2tlci9idWlsZHgvcmVsZWFzZXMv
dGFnL3YwLjExLjIKPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3Rp
YW5AYXBlcnR1cmUudXM+Cj4gLS0tCj4gIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9kb2NrZXItY2xpLWJ1aWxkeC9Db25maWcu
aW4gICAgICAgICAgIHwgMTYgKysrKysrKysrCj4gIC4uLi9kb2NrZXItY2xpLWJ1aWxkeC9kb2Nr
ZXItY2xpLWJ1aWxkeC5oYXNoICB8ICAzICsrCj4gIC4uLi9kb2NrZXItY2xpLWJ1aWxkeC9kb2Nr
ZXItY2xpLWJ1aWxkeC5tayAgICB8IDM2ICsrKysrKysrKysrKysrKysrKysKPiAgNCBmaWxlcyBj
aGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Rv
Y2tlci1jbGktYnVpbGR4L0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9k
b2NrZXItY2xpLWJ1aWxkeC9kb2NrZXItY2xpLWJ1aWxkeC5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL2RvY2tlci1jbGktYnVpbGR4L2RvY2tlci1jbGktYnVpbGR4Lm1rCgpKdXN0
IGEgcXVpY2sgcGluZyByZXF1ZXN0aW5nIHN0YXR1cyBvbiB0aGlzIG1lcmdlIHJlcXVlc3QtCgpU
aGlzIHBsdWdpbiBpcyB0ZXN0ZWQgJiB3b3JraW5nIGZpbmUgJiBpcyBub3cgYSBjcml0aWNhbCBw
YXJ0IG9mCiJkb2NrZXIgYnVpbGQiIHNvIEkgd291bGQgcmVxdWVzdCB0aGF0IHdlIG1lcmdlIHRo
aXMgc29vbi4KClRoYW5rcyEKQ2hyaXN0aWFuIFN0ZXdhcnQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
