Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD5ECD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAA6B84358;
	Fri, 29 May 2026 08:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXhBeUTAOndl; Fri, 29 May 2026 08:30:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1364A84353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043444;
	bh=O36fTIDfV7Twy3jGqrxcwWw1j8sdNyqL75GPiUdEf/A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UgCWwGgbG3+Tvfu/oCQ5GNnNY3Rx1v7kFGSZChtHweH/ju++XF7CuL69DVByzPfKk
	 OtmIY1bXVdvZoBmV25IiTX9+9gGcq+d7m69wZVNE9XxReXiAT9QmoFR0AevYTopD0S
	 cYj/KefMs9E7DJyudljXRt+bqf5ZGGxQoqLg8NGwO/9WmYpoIaiS/1q8tUcyKdiHOC
	 T2yGeIWSoG4UAGBpFocUVasiCXTTzKd5LN/IAzNcuHMqU+0yt0HzDOYbrdV5e4eth0
	 Sm7MG+gJYZpNKMyvP9xdNFZmcvN+RnXqvOgz0ZH9kkbMeo9nIIE+AjxAsSDBPwWdf4
	 O63Ajn2Jdmt7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1364A84353;
	Fri, 29 May 2026 08:30:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EAD0328E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8066406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z1RB6l8jMw6N for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C06D54070D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C06D54070D
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C06D54070D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:30 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45ef5146b56so22610f8f.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043429; x=1780648229;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Sd0EgdnInjMwmxLOqustcgUYgfDC9FAl21wisIepwsc=;
 b=MfJlcfzDmB6EStxa8CUbZb/ub56m80MfrKbnZ1uaIHAtTvoL2Wve/0WTCDS87N8pOD
 tZPt/hoXFtCDVpu4v+WjeIdsZ1LZBOPQ67IddpI5OE6Z14IgAztK7YNQuuXjBTB42vff
 zSQw2bRq0z0/8TmKKlCqNbEoacJKO00hnLZYQfsvH4VuJIFffe3xL8TNZ6FvKpHVhYbX
 IDHNgEItKlP3c6iRFuImr4lgm3FVaH4d8VwIQFCF7HH/OTrQCj5TxRs2NZIVbetXdgWm
 hIFyBlTu29RAaNlCy2KkeryMJhYeNXOhTzJHTFdIrs02Dw2/UragR7bmPVJswmaqq1Od
 XFIA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/slD4x2q3KNLZjeZG1GDu7XrwbAbR2Owg6IyFHgzM3Rx22SpWZYQO8t5u8d9zlK/lCkR8hS4xxvkc=@buildroot.org
X-Gm-Message-State: AOJu0YxSQ8aEpBR+9gNFtYUloIYvta6WOhyx+jAytQygmRG1QfQcvIeT
 GMO0L0MM6j+7i+mmg3+DGPw4nM7rckBQQYEX+mCHHjpvbeNHY43bEbKnx5sFV1LCxJCAZIvfSOJ
 Mk9td
X-Gm-Gg: Acq92OGVs2By4CYK2mfP3lR1GtvyBDn2YC0tS7BvQxYZBpsWGuAeuJA9XWvDUE7r+jF
 I1HN901f3R8HrC66+NhDmuNIq3Xy7vcbVN/H2QI/4GcgY9nk+QP7AAbd1rd80iBbZp9ChWvp94d
 UPqCCHohYchw3cJBtlr/uBB/aDW6M+mlLmL4Kdk41MfN8/9CDWW3/1SaIwrcEeRLEneVxx4QeP9
 chr7cz1/UX9cR3ow4+aR2BnQ9aff+qgtTfMmguZwt2oCqUM3MUfbsqCmswCpeY5LpZkaiJGJ/oV
 P9iUStGSWNSC0ecLFgdTOP2bJCwiBpZij1cmZlfLOLAm+9IyxDkUZxkwrKDg6VOixKj0ZB7SUvR
 RrSc9StLKbdYS4O/2HISGUKZ4wzd3KPF3Fsb4X8L+MFoVOXacvTM9Jbs4ACZWT9FEtaLghFDgP1
 JvElK6kA0gNd2Chn1N9yU1D8LLp+USR3gtZlo2f05qzPgWvfDhaI/MFNovGNy60etfcBqf
X-Received: by 2002:a05:6000:29dc:b0:45e:f0ca:7380 with SMTP id
 ffacd0b85a97d-45ef132dea7mr1924406f8f.5.1780043428714; 
 Fri, 29 May 2026 01:30:28 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354b7edsm1761304f8f.22.2026.05.29.01.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:28 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:27 +0200
Message-ID: <20260529083027.59712-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516203118.672513-1-giulio.benetti@benettiengineering.com>
References: <20260516203118.672513-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043429; x=1780648229; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sd0EgdnInjMwmxLOqustcgUYgfDC9FAl21wisIepwsc=;
 b=LeFvY/EusEHUuwDIVUTaOQ5EvdZYQtCzQ5k3pSwPFHIz1Tdj41IjhiUt4Q3JlPVEfv
 1/idaciujEq0nGq9LiMhcfbG6JZO4jhVl5F1Gk/msC5HjvVql5kcymzgqGWLqAHLMiqc
 IdWTSxVrw3qf7kuXr+gx7F6TZW6jiSBx/J3qMACV84J/1Md7430HgaVsLJDrWTempTGS
 7J59j2Cxn4hRqvHYHPZo5XL0+NyfW8m+qrvdBVTlnctHUkALDcQ2YXhSTTibj5QO+BOL
 Di0/A6/0Ppsxb9vdA4n9thEjfPOztGP7zBWUs/+Y2y+wlgvmpbir978QbNJMMQ+t2JGz
 9PXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LeFvY/Eu
Subject: Re: [Buildroot] [PATCH v2] package/zlib-ng: fix build failure for
 PowerPC soft-float
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> As suggested in this review[1], when building for PowerPC with soft-float
> enabled, let's also disable both WITH_POWER8/9 that in order disables
> all the possible PowerPC acceleration instructions.
> 
> Fixes:
> https://autobuild.buildroot.org/results/a0fa5a175c546993d818371a0de93b2e9845a183/
> 
> [1]: https://github.com/zlib-ng/zlib-ng/pull/2151/changes#r2803264882
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> V1->V2:
> * change to cleaner Makefile code style as suggested by Romain Naour
> ---
>  package/zlib-ng/zlib-ng.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
> index 59e4e15282..448457799e 100644
> --- a/package/zlib-ng/zlib-ng.mk
> +++ b/package/zlib-ng/zlib-ng.mk
> @@ -30,13 +30,13 @@ else
>  ZLIB_NG_CONF_OPTS += -DWITH_NEON=OFF
>  endif
>  
> -ifeq ($(BR2_powerpc_power8),y)
> +ifeq ($(BR2_powerpc_power8):$(BR2_POWERPC_SOFT_FLOAT),y:)
>  ZLIB_NG_CONF_OPTS += -DWITH_POWER8=ON
>  else
>  ZLIB_NG_CONF_OPTS += -DWITH_POWER8=OFF
>  endif
>  
> -ifeq ($(BR2_powerpc_power9),y)
> +ifeq ($(BR2_powerpc_power9):$(BR2_POWERPC_SOFT_FLOAT),y:)
>  ZLIB_NG_CONF_OPTS += -DWITH_POWER9=ON
>  else
>  ZLIB_NG_CONF_OPTS += -DWITH_POWER9=OFF
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
