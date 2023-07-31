Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3FAEB64DD
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 02:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5E9E400D0;
	Mon, 31 Jul 2023 02:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5E9E400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id scCmW0pUQzsG; Mon, 31 Jul 2023 02:44:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E18240167;
	Mon, 31 Jul 2023 02:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E18240167
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CCFF1BF3D0
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 02:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CA4081404
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 02:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CA4081404
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZpTGCXMAS_J for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 02:44:26 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FF1B813A3
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 02:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FF1B813A3
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-522aad4e82fso2810116a12.0
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 19:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690771464; x=1691376264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tmoxqW7Soa9TX+zaJH62vNV9Uai7zx7B/AsODkOWB8g=;
 b=OlH4uZF3N3XnNKudPAiX1rzi7Be2mSZqs7bHQ8dBIyFJUbOLl6Y8f+zVGW620HMKWG
 zJyRtQk7E2JPwE+umxblrdYNQ+07a7AZH+sOJDfIV9VYBaKI60snQlbKnEGs4bletsHx
 18QAARU+Wc7jq3/8RsM/CLmetZ5C4TmUEKDU55ks94gMlVnodIg23sYaKeD/pSVvdRdo
 2ocn4aue34ysfJo+WV/F7sOLFzb4iZoNkU9ge3xSv1edCNWH8stlyhXgIY4rg6LnUHtw
 KdmgvFgr9mfG3R3ruABmNQSnoa+eIH52romVCQ2NS2CkPBmQ8QuS1N6OD6F3Bcweg5dY
 h7RQ==
X-Gm-Message-State: ABy/qLZqe0REfjCOfx6csawoAphD2V2mz0PGnFxvsQki9tZdo7X4LUmX
 1/j10JHCU458eS7L7mdgHL0AQButp9erTQAWKNo=
X-Google-Smtp-Source: APBJJlF6OKzyjM0iUn/FxIv1+poN5yzDfCFAT+Lv6gDyLJxoJm1swHDdiDff1s9CnfSA6dteo2zj8A==
X-Received: by 2002:a17:906:2181:b0:992:16bb:2b6e with SMTP id
 1-20020a170906218100b0099216bb2b6emr5027219eju.29.1690771463721; 
 Sun, 30 Jul 2023 19:44:23 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51]) by smtp.gmail.com with ESMTPSA id
 i22-20020a170906265600b0098cf565d98asm5464313ejc.22.2023.07.30.19.44.22
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jul 2023 19:44:22 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5222bc916acso5242481a12.3
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 19:44:22 -0700 (PDT)
X-Received: by 2002:a17:906:76ce:b0:99b:7f52:ccd5 with SMTP id
 q14-20020a17090676ce00b0099b7f52ccd5mr5251364ejn.10.1690771461859; Sun, 30
 Jul 2023 19:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230729212159.403148-1-thomas.petazzoni@bootlin.com>
In-Reply-To: <20230729212159.403148-1-thomas.petazzoni@bootlin.com>
Date: Sun, 30 Jul 2023 19:44:10 -0700
X-Gmail-Original-Message-ID: <CA+h8R2ospoNPXMZgjboLcvDT+jaw2Nzi9vGL6=k=RNrxuMurnw@mail.gmail.com>
Message-ID: <CA+h8R2ospoNPXMZgjboLcvDT+jaw2Nzi9vGL6=k=RNrxuMurnw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690771464; x=1691376264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tmoxqW7Soa9TX+zaJH62vNV9Uai7zx7B/AsODkOWB8g=;
 b=DWBogJOxmMq8rWViMziSEJpwd7KSzE8unhvzPPAeJTxeWBzTUt9RzsK6iXVSXhFsA8
 mu+gjM++cQopPzfmT0BVN+7I7Zb/lPb5gnJ7qCkNi9Kh0KKbkl6FeJIJHlvQDXVs/Tko
 NWFSql76pK7jVXpkCQZWU+D05ana4PpseE7ey6M9/6bNnuWSOj1Ro/CU0grs01ykOL8S
 Ehw0RsPRSw+A1cWv72/kiiuxpfJnThfYB0npypdTE2jAX0954ahBP29+Q6M+CLsEFR1a
 p6aA1qSf71tLgX6GNME7Lh0/SO7ATBOULJOv7lnVQeyQ2G03Eo1mkq/J8SkJPCdP2Iqm
 PdBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=DWBogJOx
Subject: Re: [Buildroot] [PATCH] package/crun: allow building with uClibc
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
Cc: Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpPbiBTYXQsIEp1bCAyOSwgMjAyMyBhdCAyOjIy4oCvUE0gVGhvbWFzIFBldGF6em9uaQo8
dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiB1Q2xpYmMgbm93IHByb3Zp
ZGVzIGZleGVjdmUoKSwgc28gY3J1biBjYW4gYnVpbGQganVzdCBmaW5lIHdpdGgKPiB1Q2xpYmMu
IEhvd2V2ZXIsIGFyZ3Atc3RhbmRhbG9uZSBpcyBuZWVkZWQsIGp1c3QgbGlrZSBpdCB3YXMgbmVl
ZGVkCj4gZm9yIG11c2wuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgoKVGhhbmtzIQoKUmV2aWV3ZWQtYnk6IENocmlzdGlh
biBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
