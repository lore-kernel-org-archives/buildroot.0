Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A808C83F1A
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 06:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 260A140B15;
	Sat, 12 Jul 2025 06:35:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anqFcmgbCo2a; Sat, 12 Jul 2025 06:35:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E44940A20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E44940A20;
	Sat, 12 Jul 2025 06:35:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DFEA106
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 06:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 601424024E
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 06:35:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6FW7bD382eHz for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 06:35:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.208.52;
 helo=mail-ed1-f52.google.com; envelope-from=th.huth@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 71A1E4000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71A1E4000B
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71A1E4000B
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 06:35:37 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-608acb0a27fso3870623a12.0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 23:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752302135; x=1752906935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9/MuEYaCn8OI+7d9tbtapSGcoDdg55Es20gRMBN6rBM=;
 b=NriSSCetEsWJCQaiknCgS4Y7uhqv4uhm8IwtGlgMvUODssfv+HPy1aw84aAzjBrfmI
 Ne+7ln200oCFWqn2h1K3Qi6rhrw48XCDtOnS1FWjijw+MYuJ3nAZcfQn1QEGFrgVzZse
 VLiTtYglSDexMpCNvhonOhsycK8MfQmZ+t7K/mWqcrR61SXmifVqqkm9xqNpNqAdjaM/
 dvM+4fyUrxrHO1tY0bRCl4z9ExH3OnOgeWyt3NCaXOFSaWExsypuxrQ3gOAnbbpC56jb
 HrqMDpdqnv15XN/xubjT8DocqU34r4z/eAlQkBFnYGq+CxKKB9vceTaDyUj4gIcT4hRv
 O9NA==
X-Gm-Message-State: AOJu0YxBHZReiheIyQQwGXNqOK/IEWAx2MRBFmry4NWLTAlJJ+6Nkvd0
 Js+pk74gc7Jr4PyT2+BI9llBuHGPSlfyO3SalEOMhVDvw6HFxeQ7r5f3
X-Gm-Gg: ASbGnctmHDMH4UWS6RLJF6G21OtGMgNNQWQ3NYypvyZ5ftGWx+4n+w3l+aAU+MkAjNi
 35f4XCnhG3NkRvIk7aq4nC35Yw2cDCXkEvjzglD+nmMquZmqfc42njSyIyY9MF7KXCKkUhD0XFu
 3N5f/wulSIC2UD1du8e8whihwylh6ICO/xyuEpwP6OOyn86VVv1R6bss1UpfJ2PWfaSoRRsLiQ9
 Z1Jgzw5e/Q1+Vkh+y/fTOTh9GEI6VSnoUm8/0jaRQppk+gVOlOwsp0WFbwggnuXjqxJhzV7Uboe
 4y/4OqqLzfoR3CRlXVXOx5DK1XEOtBHHNtEmhzmIEE72wvgRBJaXP0YM0YcURsoq0IByRxhOuCX
 NuL7QdGpTv1bbycYjOTw9yqebpwaok2u4kO5P8OM/mOe6K/YhvhqZ7A==
X-Google-Smtp-Source: AGHT+IFqbmovYtXFRK3hWv3cJJ9hRq1TJTwCao9u/zZTzhCV2pP26Tbi3EStJeBpsmT94EgnDGdwpw==
X-Received: by 2002:a05:6402:274b:b0:60c:403c:ab77 with SMTP id
 4fb4d7f45d1cf-611e84799e2mr5525553a12.19.1752302134706; 
 Fri, 11 Jul 2025 23:35:34 -0700 (PDT)
Received: from tpx1 (ltea-047-064-115-149.pools.arcor-ip.net. [47.64.115.149])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-611db7d59e3sm2447610a12.44.2025.07.11.23.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 23:35:34 -0700 (PDT)
Date: Sat, 12 Jul 2025 08:35:31 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Cyril Bur <cyrilbur@gmail.com>
Message-ID: <20250712083531.11258feb@tpx1>
In-Reply-To: <20250711164407.799041-7-alex.bennee@linaro.org>
References: <20250711164407.799041-1-alex.bennee@linaro.org>
 <20250711164407.799041-7-alex.bennee@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=tuxfamily.org
Subject: Re: [Buildroot] [RFC PATCH v2 6/7] package/kvm-unit-tests: honour
 BR2_ARM64_PAGE_SIZE
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

QW0gRnJpLCAxMSBKdWwgMjAyNSAxNzo0NDowNCArMDEwMApzY2hyaWViIEFsZXggQmVubsOpZSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz46Cgo+IFRoZSBsYXRlc3Qga3ZtLXVuaXQtdGVzdHMgZGVm
YXVsdHMgdG8gNGsgYnV0IHRoZXJlIGlzIG5vIHJlYXNvbiB3aHkgd2UKPiBzaG91bGRuJ3QgaG9u
b3VyIHRoZSBzeXN0ZW0gcGFnZSBzaXplIGlmIGl0IGlzIHNldC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4gLS0tCj4gIHBhY2thZ2Uv
a3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsgfCA4ICsrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKykKClJldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8aHV0aEB0
dXhmYW1pbHkub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
