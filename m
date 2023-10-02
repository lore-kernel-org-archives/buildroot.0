Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E3EE74905
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 18:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D2A56103F;
	Mon,  2 Oct 2023 18:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D2A56103F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDbGF3tm3gOZ; Mon,  2 Oct 2023 18:24:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AA95610B4;
	Mon,  2 Oct 2023 18:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AA95610B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 81B7D1BF3B9
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 18:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A971610B4
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 18:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A971610B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id riHybtlJcHfM for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 18:24:36 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8057C6103F
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 18:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8057C6103F
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso925566b.2
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 11:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696271074; x=1696875874;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FI2S0pyYpFLH1H4/PSBb3kzJ13swFH+pxxmk5j2RiYA=;
 b=s/eSnmDYfWmF7W0qfbrpOyViLIQbYn2DDxO/5SCKmDsLjiVortOQlqSt8N9PtOdHPO
 wGkmetTvQhR/J9FbZpG/xaK56tjo66rjNC7wjbb0xdO+19/+53LAxMRGDI4Xd7cEBC5S
 aQoqsqmu83zxKla2C80+CMVc7GMAqLdIk9FVUtUPGvfRpmwSe2y1u5OFyRdUH8x6NP3H
 DAKo/qc1QhH3HTPDVKMZFy/5/xxOODh5j6uFbvHYMXBk8WItGETmIFLsOfqOnuGCySPg
 4c8Gt1S+hnx8WFUbAwZz7cj6a9PP1J4NVCOD3W4BV8jj2DgUPk2NIZvtNW8FoWXywX+Q
 rp8Q==
X-Gm-Message-State: AOJu0YyuT0PO/47VN/2X/WXqZiUH88FEeQon5nVAf0o/J4ojxDXveOx7
 OhTLGtK6Xd1vktNWC5N+kt4X+s9kH5lx4cJ9ws5uZLPT
X-Google-Smtp-Source: AGHT+IFiTPx8l676x3WsarLwAVpDp+R6G4wzWY85Xt1/I1CcKZWR1mUZ83F6DngVdK9K75+SwnkjMQ==
X-Received: by 2002:a17:906:3117:b0:9b2:be4e:4940 with SMTP id
 23-20020a170906311700b009b2be4e4940mr12291412ejx.61.1696271073839; 
 Mon, 02 Oct 2023 11:24:33 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 k8-20020a170906a38800b0099bc2d1429csm17428833ejz.72.2023.10.02.11.24.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Oct 2023 11:24:33 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-9ad8a822508so4610766b.0
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 11:24:32 -0700 (PDT)
X-Received: by 2002:a17:906:24d:b0:9ae:6a8b:f8bb with SMTP id
 13-20020a170906024d00b009ae6a8bf8bbmr12548067ejl.6.1696271072525; Mon, 02 Oct
 2023 11:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231002124736.179251-1-thomas.perale@essensium.com>
 <20231002124736.179251-7-thomas.perale@essensium.com>
In-Reply-To: <20231002124736.179251-7-thomas.perale@essensium.com>
Date: Mon, 2 Oct 2023 11:24:21 -0700
X-Gmail-Original-Message-ID: <CA+h8R2ozo3A1kbhuayah-TnMCZXR6vNjKwUhaNKz-WitnDXnxA@mail.gmail.com>
Message-ID: <CA+h8R2ozo3A1kbhuayah-TnMCZXR6vNjKwUhaNKz-WitnDXnxA@mail.gmail.com>
To: Thomas Perale <thomas.perale@essensium.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1696271074; x=1696875874; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FI2S0pyYpFLH1H4/PSBb3kzJ13swFH+pxxmk5j2RiYA=;
 b=QZRrXDD1uDO8ROpxBgpYuLjb1LnzEax3vdUkIsYiB0Ph4bf/aUuSc7FXZs69MY2J8g
 8D/W7yIxHAG748OQC4uVZ7oFzxMBJowfzEMR+BkQU9DGwqghsYVdpZZ/wAMN9QY9Xmi1
 g8ZGcc08lDv0XRSpjHrCus7wG8rKHg/Kz0+h1+FaW0zR9QvECHLULsDm6jkjWf+M7gmW
 B8u6IHbpgKDwDrhTdtGur6BiCZ7cPLWzFDagLhHgLlmWvKJyPdVju76Z4hIydKD/SuMB
 Sk/JVC1ds+DHCnMiY9x5GDCA/WhBHmBB5GnE3ApUkd3uLKpMuApV5uaUP/7xooDLjmHV
 balQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=QZRrXDD1
Subject: Re: [Buildroot] [PATCH 6/6] support/testing: add tests for Go
 providers
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
Cc: Geoff Levand <geoff@infradead.org>, Fabio Estevam <festevam@gmail.com>,
 Anisse Astier <anisse@astier.eu>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>, Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKVGhhbmtzIGZvciB0aGlzIHNlcmllcywgaXQgbG9va3MgZ29vZCBvdmVyYWxs
LgoKQSBmZXcgbWlub3IgZml4ZXMgZm9yIHRoaXMgcGF0Y2g6CgpPbiBNb24sIE9jdCAyLCAyMDIz
IGF0IDU6NDjigK9BTSBUaG9tYXMgUGVyYWxlCjx0aG9tYXMucGVyYWxlQGVzc2Vuc2l1bS5jb20+
IHdyb3RlOgo+ICtjbGFzcyBUZXN0R29CaW4oVGVzdEdvQmFzZSk6Cj4gKyAgICBjb25maWcgPSBp
bmZyYS5iYXNldGVzdC5CQVNJQ19UT09MQ0hBSU5fQ09ORklHICsgXAo+ICsgICAgICAgICIiIgo+
ICsgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQo+ICsgICAgICAgIEJSMl9QQUNLQUdF
X0hPU1RfR089eQo+ICsgICAgICAgIEJSMl9QQUNLQUdFX0hPU1RfR09fU1JDPXkKPiArICAgICAg
ICBCUjJfUEFDS0FHRV9USU5JRklFUj15Cj4gKyAgICAgICAgIiIiCgpJIHRoaW5rIHlvdSBtZWFu
dCB0byBwdXQgSE9TVF9HT19CSU4gaGVyZSAoZm9yIFRlc3RHb0JpbikuCgo+ICtjbGFzcyBUZXN0
R29Tb3VyY2UoVGVzdEdvQmFzZSk6Cj4gKyAgICBjb25maWcgPSBpbmZyYS5iYXNldGVzdC5CQVNJ
Q19UT09MQ0hBSU5fQ09ORklHICsgXAo+ICsgICAgICAgICIiIgo+ICsgICAgICAgIEJSMl9UQVJH
RVRfUk9PVEZTX0NQSU89eQo+ICsgICAgICAgIEJSMl9QQUNLQUdFX0hPU1RfR089eQo+ICsgICAg
ICAgIEJSMl9QQUNLQUdFX0hPU1RfR09fQklOPXkKPiArICAgICAgICBCUjJfUEFDS0FHRV9USU5J
RklFUj15Cj4gKyAgICAgICAgIiIiCgpJIHRoaW5rIHlvdSBtZWFudCB0byBwdXQgSE9TVF9HT19T
UkMgaGVyZSAoZm9yIFRlc3RHb1NvdXJjZSkuCgpCZXN0IHJlZ2FyZHMsCkNocmlzdGlhbiBTdGV3
YXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
