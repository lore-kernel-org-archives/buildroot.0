Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B792D7833E
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 18:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A74F8402F8;
	Mon,  2 Dec 2024 18:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8OL5xIPq8AXU; Mon,  2 Dec 2024 18:05:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89C7940691
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89C7940691;
	Mon,  2 Dec 2024 18:05:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6310060
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B6FF40134
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdNmZYLw2l6Z for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 18:05:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F175A400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F175A400D1
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F175A400D1
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:05:00 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-385f06d0c8eso946424f8f.0
 for <buildroot@buildroot.org>; Mon, 02 Dec 2024 10:05:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733162699; x=1733767499;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UhhUUBNW7G3pVGEHly4v9V6kLrCmYnaJ1l8yTdiPsyM=;
 b=ubK0DReQynA5PZb2xNBu49ree2IEiJ2aoKpWHjqDoNY+komHOr2IkkeRzcivAnclJR
 t02dUksACoWxXiA7wqy8KLXQQyhpCm/nF4EGVvEh890oed+MCDQr/ZUIngrcWbaDxJSG
 J0fvC6K4FxuIaPhkNcBSNevGbjtDNlFLEAFKrLzW7fSlvdtZoJUCHsbfNCCnN67bHiB6
 qz2rpUOsllc/Di5ojIpUlKtHFlOgrl6eiuZ5WfqDfPNl7cOgedz2coBkB1aD4ikEFLts
 X7ghRodjskrO8Pu/Y+zalksFmr0d39iOCdtikUkTXNGQByoO1ETe0G1xxC9Evu1l/6e4
 mp5A==
X-Gm-Message-State: AOJu0Yw+iP/ETjCDaaO4VjbNndSi/FYX1aWpcYpq2aPcUzfyMOzl1ORb
 7sKFcRBOfT6HbBmt1LUS1uTAJtSBG8lqDkQQarzYnsK59Q/Iy3oWBgZ6L8d5zZpM/eWjrdEQNWK
 J+iE=
X-Gm-Gg: ASbGnctTzG20P5B+thYOltZQg6UWc3P1cW6Jhe85V+fxtIfXzAPCy/BkTL8eAVn49L+
 Vh31KMjzE1dSQ/bYLLbxd1RmTkjgtkxJfCbXEJ0E6FV/k6rTLPF2moeZRdxx0BMlaikcsUrdJda
 5zQ8swFcqIPNY+wAP5cSb7LQc3go3Yenl4/s8P221NRuE0vcvRA/Q2iV/UuzLpdqPve6OUfGNhR
 RDesZ0lWtzZyiFwL+sF6pZ76tiKE121cvb/2ydGK8GxzKtj
X-Google-Smtp-Source: AGHT+IGPXjpFfjBFV/acUkJE8kqNDhW9v7M4hVJS3xEDc5f9fWkHhLicU7HlZ9bHCNdSXidzXEiyuQ==
X-Received: by 2002:a05:6000:156a:b0:385:df73:2f3a with SMTP id
 ffacd0b85a97d-385df7330afmr11176365f8f.14.1733162698463; 
 Mon, 02 Dec 2024 10:04:58 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385dc169d79sm11250323f8f.92.2024.12.02.10.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 10:04:57 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 354265F767;
 Mon,  2 Dec 2024 18:04:57 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,  Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,  Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20241202174008.1134667-7-bernd@kuhls.net> (Bernd Kuhls's message
 of "Mon, 2 Dec 2024 18:40:08 +0100")
References: <20241202174008.1134667-1-bernd@kuhls.net>
 <20241202174008.1134667-7-bernd@kuhls.net>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 02 Dec 2024 18:04:57 +0000
Message-ID: <87y10yc65y.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733162699; x=1733767499; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UhhUUBNW7G3pVGEHly4v9V6kLrCmYnaJ1l8yTdiPsyM=;
 b=iFAxGcv5T2dTRW28LcbX8wGcAnrX3hoqLiGg+cVESGHhIYdOdMNLX57MhWT7iSW6PB
 DyEP7w3omj37GBx0Hi/6bE4qC63+ebSDe0Nc0WiZial8ooQORXbja+Yp7nn+GrpmQzG1
 0m8JjTnEQ3uZVtiDrpqkYTxjyM+5CS4q/c0NJ6V2ybvWFgSXTv8UUtrgWRc+ZZ4L4eEb
 TxtSC5mpwCBNjSDcCTYcWsSgZWqt+eVMJ86FOtHIQMfCYagpWrWhDIsBvgO9PIT3TnR1
 TGvjrDg2j2o6VeY2nE0FeaxNMmlYKOMalwSsbuf+h9+YaB0KHHyMw2tmDs4h/KbrJXU5
 21pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=iFAxGcv5
Subject: Re: [Buildroot] [PATCH 7/7] package/mesa3d: add option to enable
 VIRTIO vulkan driver
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4gd3JpdGVzOgoKPiBGcm9tOiBBbGV4IEJlbm7D
qWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4KPiBUaGUgc3VwcG9ydCBmb3IgVmVudXMgaW4g
TUVTQSBoYXMgYmVlbiBzdGFibGUgc2luY2UgMjMuMiBzbyBhZGQgYW4KPiBvcHRpb24gdG8gZW5h
YmxlIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5h
cm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CgpN
eSBjb21taXQgbWVzc2FnZSBub3cgcmVhZHM6CgpwYWNrYWdlL21lc2EzZDogYWRkIG9wdGlvbiB0
byBlbmFibGUgVklSVElPIHZ1bGthbiBkcml2ZXIKClRoZSBzdXBwb3J0IGZvciBWZW51cyAodGhl
IFZ1bGthbiBWaXJ0SU8gZW5jYXBzdWxhdGlvbikgaW4gTUVTQSBoYXMKYmVlbiBzdGFibGUgc2lu
Y2UgMjMuMiBzbyBhZGQgYW4gb3B0aW9uIHRvIGVuYWJsZSBpdC4KClNpZ25lZC1vZmYtYnk6IEJl
cm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+ClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KTWVzc2FnZS1JZDogPDIwMjQwODIyMTgxNTQ2LjY0OTAw
LTYtYmVybmRAa3VobHMubmV0PgoKLS0tCnYyCiAgLSByZS1iYXNlZCBvbiBCZXJuZCdzIHNlcmll
cwogIC0gbWFrZSBjbGVhciBWZW51cyBpcyB0aGUgZW5jYXBzdWxhdGlvbiBmb3IgVnVsa2FuCiAg
LSBkcm9wcGVkIHB5dGhvbi1weXlhbWwgYXMgbWVyZ2VkIGluIGVhcmxpZXIgYnVtcHMKCi0tIApB
bGV4IEJlbm7DqWUKVmlydHVhbGlzYXRpb24gVGVjaCBMZWFkIEAgTGluYXJvCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
