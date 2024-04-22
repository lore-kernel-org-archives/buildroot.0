Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10141C4345F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 12:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CE3E608B3;
	Mon, 22 Apr 2024 12:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOXGJE1zWIzl; Mon, 22 Apr 2024 12:29:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C56860672
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C56860672;
	Mon, 22 Apr 2024 12:29:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 019F31BF322
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 12:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1F264021F
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 12:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dyjYcbTDJMtZ for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 12:29:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F50E40219
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F50E40219
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F50E40219
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 12:29:14 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2dcbcfe11f8so30339341fa.2
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 05:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713788952; x=1714393752;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=frk7T4zxn2vnJeiz9MFZYOchFX+yD4j1jZ+D6kM0+Rk=;
 b=R43sa+hELdXrxm2gDzKypoKiE0e61fzhvs4aqXg2QwOfOLSfz6zX5f4p/MLdVuG2Jr
 JSRxwhyJcMPZ5v5dcs2dfXQnZX6K6RguMyh95RFGOMN4ULwKMMkFWbbyIzEUhO9u4vC9
 6WGXf82mtVtRxWUikTbIjHV1qt5/JkTXr8mM6i8xGOClKehXnQE4SY8b06yyasrcE/Yb
 jk/i7myXAdj9D7fSu3nOGjV3SC/n0y1vpW6M+UwKurml/8Q7OgLkTw1/t+Ovlu20J60A
 krS1L1SUCXMY1HC6mimBZNzQFknBpsBVOHRWFtokPDVgG1EnNQ3txHsAiFcIaCym7hSw
 RcqQ==
X-Gm-Message-State: AOJu0YwbWMRSNTmshEDL2u60qNnnErWL16aE10zl3yHxowT689xGsdKa
 +A9Phs/MFUp8/HoeM0Ec4CSNWhfKbQVDO0orV/dC03khby+e+q5+m1+nf5V9inPe3A2OP5N+lJC
 uS0LIg8+XA/5IgUzwcYHd4AHXJOI=
X-Google-Smtp-Source: AGHT+IFmPpsZpfRYdieMzN9kaHEKNxMcQqoS2MAFbcrv2cw0cPgixbNMQDVZick9tETKZ/mfVF2w+OlWJAyGWy6M2MM=
X-Received: by 2002:a05:651c:1034:b0:2da:dfd1:8abf with SMTP id
 w20-20020a05651c103400b002dadfd18abfmr7704840ljm.48.1713788951703; Mon, 22
 Apr 2024 05:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kv4F+h1KZOiYTJ2ZActM6FMekfUc-OSQYt+ABEjdCsncA@mail.gmail.com>
 <20240422141405.10ed2e21@gmx.net>
In-Reply-To: <20240422141405.10ed2e21@gmx.net>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 22 Apr 2024 14:28:59 +0200
Message-ID: <CAGm1_ks=J-wT0QrPxMFO+DrXsRXYCLGnUdGJhaHUwOLaqPER+Q@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1713788952; x=1714393752; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=frk7T4zxn2vnJeiz9MFZYOchFX+yD4j1jZ+D6kM0+Rk=;
 b=XfDYJ8CddSBXRRo7WBEX7XtD4RZ2fHZO6Z7pH0gGptkIJ+xFRLIoIWZJaKJHRrveRN
 oXLC+DYnD/lobGILhyWUCa/hRqju69wHwNqdLqvp/z2aKE+H43w6gaW0n5xh5nO9asmN
 QHzYwqCx25U3wWlBequIyVPppEMKrgDSzsmH5btRBaM/Qut7bRR0n2aiUex+ec86HZp0
 1VnGr7eGhSzdMW3PZ9wLm03G2ec3uVPuqGJOT6mmLI1/jbocuEFjeJl6+ueUpP6d300V
 IDLjBWSPrB+XCbB3/Xfy0xg0+n/u96RBASs5Vk3vMQXPAodF3lg60kBhWWAIRZ9K1lRF
 /LfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XfDYJ8Cd
Subject: Re: [Buildroot] pkg-meson.mk: support for the host python packages
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBBcHIgMjIsIDIwMjQgYXQgMjoxOeKAr1BNIFBldGVyIFNlaWRlcmVyIDxwcy5yZXBv
cnRAZ214Lm5ldD4gd3JvdGU6Cj4KPiBPbiBNb24sIDIyIEFwciAyMDI0IDEyOjQ2OjA0ICswMjAw
LCBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+Cj4g
PiBsaWJnbGliMiAyLjgwLjAgcmVxdWlyZXMgaG9zdC1weXRob24tcGFja2FnaW5nIHRvIGJ1aWxk
IHRoZSBsaWJyYXJ5IFsxXS4KPiA+Cj4gPiBXaGF0IGlzIHRoZSBiZXN0IHdheSB0byB0ZWxsIG1l
c29uL25pbmphIHdoZXJlIHRvIGxvb2sgZm9yIG91ciBob3N0Cj4gPiBweXRob24gcGFja2FnZXM/
Cj4gPgo+ID4gWzFdIGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9nbGliLy0vY29tbWl0
L2ZjNmYwNjEyN2NmZjlmZTNlNDY0YjViZThjOTJlYTA4YTY3OWI2MjAKPgo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2xpYmdsaWIyL2xpYmdsaWIyLm1rIGIvcGFja2FnZS9saWJnbGliMi9saWJnbGli
Mi5tawo+IGluZGV4IGMwNmRlZDJhNWIuLjgxOTI4MjkxMGEgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9saWJnbGliMi9saWJnbGliMi5tawo+ICsrKyBiL3BhY2thZ2UvbGliZ2xpYjIvbGliZ2xpYjIu
bWsKPiBAQCAtMzQsOSArMzQsMTEgQEAgSE9TVF9MSUJHTElCMl9DT05GX09QVFMgPSBcCj4KPiAg
TElCR0xJQjJfREVQRU5ERU5DSUVTID0gXAo+ICAgICAgICAgaG9zdC1wa2djb25mIGhvc3QtbGli
Z2xpYjIgXAo+ICsgICAgICAgaG9zdC1weXRob24zIGhvc3QtcHl0aG9uLXBhY2thZ2luZyBcCj4g
ICAgICAgICBsaWJmZmkgcGNyZTIgemxpYiAkKFRBUkdFVF9OTFNfREVQRU5ERU5DSUVTKQo+Cj4g
IEhPU1RfTElCR0xJQjJfREVQRU5ERU5DSUVTID0gXAo+ICsgICAgICAgaG9zdC1weXRob24zIGhv
c3QtcHl0aG9uLXBhY2thZ2luZyBcCj4gICAgICAgICBob3N0LWdldHRleHQgXAo+ICAgICAgICAg
aG9zdC1saWJmZmkgXAo+ICAgICAgICAgaG9zdC1wY3JlMiBcCgpUaGlzIGp1c3QgYnVpbGRzIHRo
ZSBwYWNrYWdlIGJ1dCBtZXNvbiB3b24ndCBsb29rIGluCmhvc3QvbGliL3B5dGhvbjMuMTEvc2l0
ZS1wYWNrYWdlcy8gZm9yIHJlZ2V4LgoKU2hvdWxkIG9uZSBqdXN0IGFkZCBhIFBZVEhPTlBBVEgg
cG9pbnRpbmcgdG8KaG9zdC9saWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzIGJlZm9yZSBpbnZv
a2luZyBtZXNvbi9uaW5qYSBhcyB3ZSBkbwp3aXRoIFBZVEhPTk5PVVNFUlNJVEU/CgpZZWdvcgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
