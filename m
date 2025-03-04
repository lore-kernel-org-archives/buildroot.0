Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DD0C021B8
	for <buildroot@archiver.kernel.org>; Tue,  4 Mar 2025 22:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5F6560E46;
	Tue,  4 Mar 2025 22:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GB-v5db4-Ldc; Tue,  4 Mar 2025 22:36:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE67360BA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE67360BA8;
	Tue,  4 Mar 2025 22:36:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CA6B944
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 22:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6909140169
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 22:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ReAyr5E3fV5X for <buildroot@buildroot.org>;
 Tue,  4 Mar 2025 22:36:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 56CCD40148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56CCD40148
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56CCD40148
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 22:36:26 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3f66dfc205dso1539530b6e.3
 for <buildroot@buildroot.org>; Tue, 04 Mar 2025 14:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741127785; x=1741732585;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCeo88251PZbXDFIzho44QIcnD6CPHxfg/ywS4rY1RM=;
 b=d9qmcxjC2gyvsUg/jg/GvdLcDWY6a8IenuE2F4TAyDksS6mpfrpuBOMH+JSUbirY/z
 8pbYBHJnkHibwR2yb2+AS6u0R+TYHLDnmAncXXBG3y6ielBA4cPg6OprQsYiQTNiwoQn
 V4D51gzdHD8MRHC1tCOexdLDk94uMb5iVIwC9tbwxysPiq6D9zxSWy1Ar994aEfgq+Rd
 0dB/Mpl4Dj6uJv6DbA6b1I7bNWXoKzOWfP4cZFAlqcdGIgnCzqXpigybBx4gpC3BJHGV
 +8TcnRwHaCVabG6+NaENm1Wgi1k4nilraTb4v193VuIekrZAWhoOqTVAbhpQy8OuPBrk
 8xoA==
X-Gm-Message-State: AOJu0YwqMi3BmemE0yT3AnZ8WHGwKPHVaPm5AzqPUNO1oYGle6L+ve89
 HGsLd3Bej1QZFdKF1fSqCCsq2NWb+1zV4v5Dc+FbpJcgYiIOpyAr
X-Gm-Gg: ASbGncuyhJNsGdUuwk4MfT5oErlUNwV5ufmtrPrDWRwqgn9NOORCOs5hfOIAOiTaaJZ
 eqc+daUNigdEUdDh0jT6ZFq+3RnMsjanFwAPfGA5xvIrBXaq9Ux6ZYNB7DRfFXjNY8TpCXJ6IX0
 XzLcu/7e51T0MRKTyfgvwVu44CDy0kU9tz+lx0oS40sSzXoZ7ogQXo/UK6Y5bG0EDzdXdGVw0rD
 9VzWzOMx153OfLmvzya1ANTgRpxh3ZjRY1PseMWS1gk6RAXKe/jD0dFB5LLduzr1Gp3VPnlDmJs
 QtFOvLvTrhSI/mVYr1wn/DmuQ0rGvoux423W3Q1dpv9oi4Cg5cUE2P43v6zV+hBxKbwHnQcO
X-Google-Smtp-Source: AGHT+IGOC1BvUEqZrFhHDneqkXhV1UenZwPp3FsgtrVG198+lXHXBFsQ7b8cPYqjg9OO7KNZykOvqA==
X-Received: by 2002:a05:6808:1b12:b0:3f6:72ed:5988 with SMTP id
 5614622812f47-3f68315cdffmr360900b6e.14.1741127783630; 
 Tue, 04 Mar 2025 14:36:23 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f672b69c8esm748608b6e.3.2025.03.04.14.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 14:36:22 -0800 (PST)
Message-ID: <a18ab759-2158-47a6-9c5e-e832b76ca1ba@gmail.com>
Date: Tue, 4 Mar 2025 14:36:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Damien Le Moal <dlemoal@kernel.org>, "Yann E . MORIN"
 <yann.morin@orange.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Niklas Cassel <cassel@kernel.org>
References: <20250218104807.2329338-1-Niklas.Cassel@wdc.com>
 <20250218104807.2329338-2-Niklas.Cassel@wdc.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 WlfRzlpjIPmdjgoicA==
In-Reply-To: <20250218104807.2329338-2-Niklas.Cassel@wdc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741127785; x=1741732585; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=CCeo88251PZbXDFIzho44QIcnD6CPHxfg/ywS4rY1RM=;
 b=IRLMFLzC8nytQEPPHiwYgb2Gsw2PAeNLBrfNKKa9RgEWeqo21/7MulqPwNQ8egxhTk
 tRa9i/qSSuDFliU2wlRWg2GNJ0LE3yLxU/5UkzLup1dBaRzrOFF4iQbISThLJU4h2as0
 fPa+vLlDQmp07IIpcx3GhmGfsrP+ZelFkYdEYnzti506t/Dkb8rNft8dro21zbyDEmdT
 FVJ31iFDlweQDmLAN9yylQVWN1CJgOHSuvLAshieGOJokjK5uP85jFGGUAHtY5StXh9z
 OB9k/pgs6gOwVkjpP7yZ/2PbNMvVXWx7+pHLvjezb7FdQmZh+H95mkCwU2Afc55ivR9z
 uvWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IRLMFLzC
Subject: Re: [Buildroot] [PATCH 2/2] package/linux-tools: selftests: Add
 path containing BPF binary to _BIN_ARCH_EXCLUDE
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2/18/25 02:48, Niklas Cassel wrote:
> From: Niklas Cassel <cassel@kernel.org>
> 
> Enabling BR2_PACKAGE_LINUX_TOOLS_SELFTESTS (on rock5b_defconfig,
> which uses kernel 6.12 at the time of writing), results in:
> 
> make[1]: Leaving directory '/br/output/build/linux-endpoint-test/tools/testing/selftests'
> ERROR: architecture for "/usr/lib/kselftests/tc-testing/action-ebpf" is "Linux BPF", should be "AArch64"
> make: *** [package/pkg-generic.mk:402: /br/output/build/linux-tools/.stamp_installed] Error 1
> 
> To solve this, add /usr/lib/kselftests/tc-testing/ to
> LINUX_TOOLS_BIN_ARCH_EXCLUDE.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
