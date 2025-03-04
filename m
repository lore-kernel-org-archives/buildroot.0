Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86536C282D0
	for <buildroot@archiver.kernel.org>; Tue,  4 Mar 2025 22:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 270ED4094F;
	Tue,  4 Mar 2025 22:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id etXL47vwnQil; Tue,  4 Mar 2025 22:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEB934096A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEB934096A;
	Tue,  4 Mar 2025 22:36:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 685C1D2
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 22:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C49580F0F
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 22:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDXPMbOxueyS for <buildroot@buildroot.org>;
 Tue,  4 Mar 2025 22:36:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E91D982CD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E91D982CD4
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E91D982CD4
 for <buildroot@buildroot.org>; Tue,  4 Mar 2025 22:36:28 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-5fcee9dfcb3so2607323eaf.0
 for <buildroot@buildroot.org>; Tue, 04 Mar 2025 14:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741127788; x=1741732588;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iUzy4rNS9AaRWe9xHdC4UAyoXiGoMPF2i4gkUXJJHh4=;
 b=Cc8PSWKCbyFbIh4BP7xJbkdK0d15IluLhx9Ts0Y/yxkDWteJ56IjtKk0FwupPCN7v0
 JgP0Jwdd36g3YTvyzCYtuhMaUCG4qOrVLBuILWLQ19emCYEm+tNaJbYs54U7CzHuOWR8
 vQuAi2FgbUGj+MmVZ22PODUjGbexCHhBgYXt76kXI0N2SPA4uWySC+h5tFMNS6XqZjls
 f9ZeoCht8sByY+sGCsGCwKKItr2kVd6LpwEPGN1Nk9kiooMoha2yJzge0leUswYxxjEw
 GlaNrtPf+EwLBXIEMc2HxlYEsfrlTkMGmYljIzZoMBzm0ZEjJ8A8OWswrspvTpZG7CRW
 Y37Q==
X-Gm-Message-State: AOJu0YyYuLVhD7x3f5HkAPX4jiHDGs50YLzzMIhMu5XupT0tXr4+qLi8
 IhHyydCJrdfhlem7MP0BFUcPM9CGu/3YzJ5X/k3c5P56AUKtCYgL
X-Gm-Gg: ASbGncuXMcXicxun9eaKWep39A2hAe6VpfgN7x3JGiK52AI1WGH7Od7WnWSBQMK3+/+
 13wPKMsP6qSUsck4eoW+emlMYVjYsvtwqTt4lCOOt2JOPwb0+jU94he+OewQ6+WrlXJV0fdw2g+
 VMkwRwcPrZJzV3kfpaMcJCGnfUszlPkzYUCnZmbCK/Fp1Oa6OSbgNXI7UrZzWJ//1fXlRktEjiQ
 DjH8TqLpSeLqYcToFxE0gOCpQ5qCxj/8O3gY25ugMFIPUYkET13XKrmWoBu5tNxhsFU6hJTlaar
 HTxVH+Luna7Wb5UMl/XVydH6xj0Pz24cU9lOtvvFi5GUTEXTUKGNFHpKBgS7Gu1w8qPljiDH
X-Google-Smtp-Source: AGHT+IFthtf6UsBgqDJJqkbLZG+KbjGaBkP60ybySDjzbywqPhow7Sf9H1ytcQ4MIRHlmeyHLmPj7g==
X-Received: by 2002:a05:6808:250c:b0:3eb:551c:b67b with SMTP id
 5614622812f47-3f6831f49b8mr434410b6e.38.1741127787786; 
 Tue, 04 Mar 2025 14:36:27 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f672b69c8esm748608b6e.3.2025.03.04.14.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 14:36:26 -0800 (PST)
Message-ID: <97dfa344-d277-4367-a73a-52e0b3e61979@gmail.com>
Date: Tue, 4 Mar 2025 14:36:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Damien Le Moal <dlemoal@kernel.org>, "Yann E . MORIN"
 <yann.morin@orange.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Niklas Cassel <cassel@kernel.org>
References: <20250218104807.2329338-1-Niklas.Cassel@wdc.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 WlfRzlpjIPmdjgoicA==
In-Reply-To: <20250218104807.2329338-1-Niklas.Cassel@wdc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741127788; x=1741732588; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=iUzy4rNS9AaRWe9xHdC4UAyoXiGoMPF2i4gkUXJJHh4=;
 b=Ug6AmdH97Py3nlYMJWqAVKwFE4mCgV2NiDwrOPZIllRCG3o9Zz/nEsOZSrfpg2y+FS
 8ERaVA+7asOBAfFLZsoBQl8Ld5ceh2+BHp1Xa4y1w3Nz7jL07DbsajqLFO6pd0L1C9uo
 znXRyogWU3nb8PjunFEhqVO8b7zaeBLPYwau+kq/0PoYw59qrpUIoTvr0PAnSOTvjM6s
 A2VhnHnYoVVsPLAYRcJLvxMJ1A8FviGnxPi1BvYJvpDzwkfApVj7w+xWUhYUbiWVhQQp
 mJQwf3bewe+wjiDiOItXhfBvPgRQxYyTgtuSOVUveIXHlaad97Ug/i1qHpYRiTQJqim/
 nhHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ug6AmdH9
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-tools: perf: Fix
 _BIN_ARCH_EXCLUDE
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
> support/scripts/check-bin-arch has an option -i to exclude a path
> (or many paths by using -i multiple times).
> 
> This was implemented in commit 01d90f0d093f ("spport/check-bin-arch:
> accept arbitrary per-package ignore paths").
> 
> Looking at this feature (which hasn't changed since being added),
> we can see that check-bin-arch automatically adds a trailing slash
> to all entries specified using -i.
> 
> Thus, specifying a path to a file, e.g.
> "/usr/libexec/perf-core/tests/pe-file.exe" will cause check-bin-arch
> to add "/usr/libexec/perf-core/tests/pe-file.exe/" to the IGNORES array.
> 
> When running the main loop, the file
> "/usr/libexec/perf-core/tests/pe-file.exe" will thus not be ignored,
> since it will not trigger a match the pattern that was added to the
> IGNORES array ("/usr/libexec/perf-core/tests/pe-file.exe/").
> 
> This means that the -i option in check-bin-arch only supports directories
> and not files.
> 
> Fix the LINUX_TOOLS_BIN_ARCH_EXCLUDE in
> package/linux-tools/linux-tool-perf.mk.in to specify a directory, as the
> existing LINUX_TOOLS_BIN_ARCH_EXCLUDE can never have actually worked.
> 
> Fixes: a7ad7816262d ("package/linux-tools: Exclude checking PE binaries from perf test")
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
