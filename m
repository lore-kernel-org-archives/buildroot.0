Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F74CA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C73E641902;
	Wed, 10 Sep 2025 21:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id npPanUMcP1kQ; Wed, 10 Sep 2025 21:09:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65BA241825
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65BA241825;
	Wed, 10 Sep 2025 21:09:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0614234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8730E41509
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7iWZIZmVRpZ for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:09:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 95D2C406AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95D2C406AA
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95D2C406AA
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:09:52 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-56afe77bc1eso1640554e87.0
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 14:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757538590; x=1758143390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DQ/7P0RYQKA065jEIATeURFp3FMRd2GP7+p5GhH0A+8=;
 b=NgdwytBYDrN+2s4bkjo525eOxB9bH9babmCrCYD2j6yOvIqedDk5dDXhRX9kHe6hHN
 ad86ryuLqOaHgexvCkgvWZQY836dlrA5OiNogLTe9GQmQRwyrDljifQCo4O/znjvvPqg
 Z3VynxJfnDVAn2mSuRSj/YKif5i2YYwGyY3RhO8toB+VNQP14OlBZeRws60bBr9N7yId
 NUlYO1+ALiJGplsN4UPm+riUOKw4RKLbCMn0AeCPRAX0Bl2aSZ4tbA2MhgeCg6HqnaD4
 kAWWDaPoqT6anXR6fYYgfgE3csJ120EPUdWJLHEbab1OxJONauFe4NI/I+kADfyLmxvm
 vFlA==
X-Gm-Message-State: AOJu0YzezKr6y+XpP2g5Ki9xeJ5+k6MHphAUeo9blCoHSbns5KNwjAUI
 KDxlfmCfPZGFqku+1IAEpOxd/Nq4b8OnOQ9n8HiimpZG94whw5dJ5O95AT6vN64BkvJMuy+bpzR
 PjuxMve6Jag==
X-Gm-Gg: ASbGncseVp33P/jrSpUIjC2T1rZamZRbIQfVQIc4OtQoHw5fKNNFX+RMO1bc6j7XVI6
 cJ05Um9tq3BdzFn0vCqR3QLEqv8IoccI1d150mFC7y+cw717FDBE4t8NFNRsppAhJJ9gQR0dYT8
 mpj/CSpZdlNeN7qbFAtJ98H+7RNY/S2pm4q88hf0ViytbFQKHwfZixYMVyAFJ6yUeyVxOIplL5S
 mxjnLlYZXX5rzh39cwG1YZVNxJs71d2b+m1+06ug2ys8IUoo5ExeT8nXkXgF9PU/bndoJkC5MyH
 ekc9MS7Cg776f/3tyt7oiWZe5L+YlsUAMnNTgyt4Sr/OyCL0m9MOL6Kz1zUSJg7Re92B306K5KD
 5XTyQPoESQuSrKX59oxzZdhOSmuj/85/7HcUK9bBMgj2PQw52kprK/k15MamLAA==
X-Google-Smtp-Source: AGHT+IFrHvBYbRk5VJNtFHANe4LsJfNmDPhAe+MgfTtYpxEo/ATGiNjEaKvrNgesAxg2qJXpwe9HvQ==
X-Received: by 2002:a05:6512:b05:b0:55f:5526:602a with SMTP id
 2adb3069b0e04-56260e3accamr5637580e87.15.1757538590000; 
 Wed, 10 Sep 2025 14:09:50 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56dbfc518dasm87489e87.106.2025.09.10.14.09.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 14:09:49 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-55f6507bd53so7944928e87.3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 14:09:49 -0700 (PDT)
X-Received: by 2002:a05:6512:3b9e:b0:55f:3faa:7c21 with SMTP id
 2adb3069b0e04-56262668065mr4955417e87.34.1757538588935; Wed, 10 Sep 2025
 14:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250908192435.214306-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20250908192435.214306-1-giulio.benetti@benettiengineering.com>
Date: Wed, 10 Sep 2025 14:09:37 -0700
X-Gmail-Original-Message-ID: <CA+h8R2q8Ky_sYNBD3V3tJ7JZP6PFHQ62KhS4oRNPs5QyvfO5aw@mail.gmail.com>
X-Gm-Features: Ac12FXyWrmLN9QPqoWtfYCZbSH7mFocwqYUe2fncbwEC15NY6_7WZ85taL2a8j4
Message-ID: <CA+h8R2q8Ky_sYNBD3V3tJ7JZP6PFHQ62KhS4oRNPs5QyvfO5aw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Kris Bahnsen <kris@embeddedts.com>, Sergey Matyukevich <geomatsi@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1757538590; x=1758143390; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DQ/7P0RYQKA065jEIATeURFp3FMRd2GP7+p5GhH0A+8=;
 b=KbitCcVSR8tHUl9KZFqVw8NEo6izAHTJK3Fsk68GrhnqXlXoZOv0nKqgsf3mpRzizB
 oUGKMhy0NGaXeL3ke1D+1Rvcb2WZ73Wua0tLljfkpn8OIh2hj88AUN+PmX3nhfrBAeFk
 0gPr8DzYot64CHrbcHckzSWQSrtlgh6AU9rDCD9kjXFmvyXLCJoQrmfmy5XewpZIOjDe
 L2+RMx+PS0v1wLMY1W1thkCynXl93kyprIxqaVgoJqDBEmId7CrkncOPj2CqwjPSRgVA
 WgLWpOQtMCmaIP6OdH6Q+n6DEBXDFp8K6TBNbQyW+18MHyYRtsIscbb5PK9QSpSxxv2C
 Ea9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=KbitCcVS
Subject: Re: [Buildroot] [PATCH] Some WiFi driver fix to build with Linux
 6.16
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

SGkgR2l1bGlvLAoKT24gTW9uLCBTZXAgOCwgMjAyNSBhdCAxMjoyNOKAr1BNIEdpdWxpbyBCZW5l
dHRpCjxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPgo+IEdp
dWxpbyBCZW5ldHRpICg1KToKPiAgIHBhY2thZ2UvcnRsODcyM2J1OiBidW1wIHRvIDIwMjUtMDkt
MDggdmVyc2lvbgo+ICAgcGFja2FnZS9ydGw4NzIzZHM6IGJ1bXAgdG8gMjAyNS0wOS0wOCB2ZXJz
aW9uCj4gICBwYWNrYWdlL3J0bDg4MjFjdTogZml4IGJ1aWxkIGZhaWx1cmUgd2l0aCBMaW51eCA2
LjE2Cj4gICBwYWNrYWdlL3dpbGMtZHJpdmVyOiBmaXggYnVpbGQgZmFpbHVyZSB3aXRoIExpbnV4
IDYuMTYKPiAgIHBhY2thZ2UveHI4MTkteHJhZGlvOiBidW1wIHRvIHZlcnNpb24gMjAyNS0wOC0w
OAo+Cj4gIHBhY2thZ2UvcnRsODcyM2J1L3J0bDg3MjNidS5oYXNoICAgICAgICAgICAgICB8ICAy
ICstCj4gIHBhY2thZ2UvcnRsODcyM2J1L3J0bDg3MjNidS5tayAgICAgICAgICAgICAgICB8ICAy
ICstCj4gIHBhY2thZ2UvcnRsODcyM2RzL3J0bDg3MjNkcy5oYXNoICAgICAgICAgICAgICB8ICAy
ICstCj4gIHBhY2thZ2UvcnRsODcyM2RzL3J0bDg3MjNkcy5tayAgICAgICAgICAgICAgICB8ICAy
ICstCj4gIC4uLi8wMDAxLUZpeC1idWlsZC1mb3Ita2VybmVsLTYuMTYucGF0Y2ggICAgICB8IDM0
ICsrKysrKysrKysrKysrKysrKysKPiAgLi4uLzAwMTQtRml4LWJ1aWxkLWZvci1rZXJuZWwtNi4x
Ni5wYXRjaCAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKwo+ICBwYWNrYWdlL3hyODE5LXhy
YWRpby94cjgxOS14cmFkaW8uaGFzaCAgICAgICAgfCAgMiArLQo+ICBwYWNrYWdlL3hyODE5LXhy
YWRpby94cjgxOS14cmFkaW8ubWsgICAgICAgICAgfCAgMiArLQo+ICA4IGZpbGVzIGNoYW5nZWQs
IDc0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3J0bDg4MjFjdS8wMDAxLUZpeC1idWlsZC1mb3Ita2VybmVsLTYuMTYucGF0Y2gKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvd2lsYy1kcml2ZXIvMDAxNC1GaXgtYnVpbGQtZm9y
LWtlcm5lbC02LjE2LnBhdGNoCj4KPiAtLQo+IDIuNDMuMAo+CgpTZXJpZXMgTEdUTQoKUmV2aWV3
ZWQtYnk6IENocmlzdGlhbiBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
