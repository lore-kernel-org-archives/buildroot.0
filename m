Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21635CD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA43F413C5;
	Mon,  4 May 2026 14:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BJJw_ri_84tt; Mon,  4 May 2026 14:55:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 321AD413D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906550;
	bh=98NTox5XtoxCJgQ2vSxvlcYnSOHM57hmZjqzn3TsCOY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JRflmxF31QnwIrIfGGpvruP5qygU9gQLWXgsLJ2At9woOxKC23hwZw3aCd3sK6mZz
	 fMdNaTD++1JyUW1Bc6rW2aXSfn+OTBfbPjNpnZ7AKCv8Pxc/SqGwCl6H4TO+byf7p7
	 bkMc5UrbAvHOhrGtCFDnN6vJyupxD4SlOwvhtBqY+W2Di65DCpoYo7plL5zJTk7lAV
	 LLLnpeZ0ZuwMJWXjZ9thT9fcJFmcLzOYbbbOg52RTm4g6TYomAXcbGZvJEztXa0vR9
	 1nPVfkSDnZ0FmRERxBVtzr32duE2woyIqYrC/XxvH8IP+plBk25m8SguzoODxfHB17
	 VvJOL3r6niftA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 321AD413D7;
	Mon,  4 May 2026 14:55:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE11525D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3704614FF
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_2przeP-8hn for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:55:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A4166613FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4166613FA
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4166613FA
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:55:47 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-43fe608cb92so2461878f8f.2
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906545; x=1778511345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cbgpzvfbXYuaOi/Hz8InzgJ8/O+czgWDD8yDBBJd8FA=;
 b=CW6FkDqeWtRi8jlYyEMKIti+xFO+8ZIjnN50Ft078zbergwLafBFLYjh9JIbig2qzT
 Q8fyA3sJdPbFWkBMEQlqAyU+OdvzubxJaSYex8r3vgvMS+M1acvy33LMKBbvd9CYXo9X
 CHQyI2zcRk65oRYqAdngRySOy2HiPZwaj4ZC3GMg3dvCgCa2BgYG89HJeUH54OUfCVdz
 QIbW5FBO8CnjlhycpaDlor8iV4FfAMq/J6/CcREbE54zEZhbNt64F1uUB9zvAQxSXrPX
 ef4d5XYFPRYRYhn79asxOUUcIjbQSsLBbVttTjpnd9Rzxu1UAM6ZqZJVHIWiuRm2gsxC
 yb4A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/IXG/VZ1lrvSxfFkMAxYO/5I4niZjpiyWD++fqeU0aTQo5jywgftu4X1INCOwQbHSU6gpH1kl1M0Q=@buildroot.org
X-Gm-Message-State: AOJu0YyFby2xLGETDQ0e2Lt50pcjX8NnL5flJaFOZ+hT6ga0tzIUD0ov
 jovWMlLFtdkT8ND5yU3dQ0eqY1qPGBty+iRTS88UQVCRKCUONCxpv2VxAG6TnjPNONA=
X-Gm-Gg: AeBDietIM019DG7IXInFurqQGr+wDxj/Dcyx2JJGTM6gz83VtqUrbrI1X0/UyMAlTUx
 gtyYlEsnC+MrR0JH3gLjanCwTaGVGfQkTOX+GAT4tTIOYoI9bZrtBAfLl+/oFycjtbyvFkul+eh
 PntDPxTe1sj8U8Om65tq5OPAJrwq8tu1Puo8WMEVv3MBFtcxdnhDn6i8kXss6GndJBWGej+UuEw
 m90rUda2XCON5hE2SvLvqOqo61n5AVH5g5SUDrDnSrj1m9+aIG02zpoRt7WuyTWT/wQxoOxnz8V
 z6SaVHlk1UjZxJkMA1JtUkZtg7AmCZR1c6p5iv2x7xwlqDzsrwJad28wvgH0hF3emJssoiw9McX
 1rwZOscYVsmoF/JQfcwSvLuGGPbIEtdmKINNLoSyiVH3UOrHv+RjFJRp+yLEBv8xMgVFQ4IffoN
 OiNPdZfZsCv6dtlzSoNQrfvHfoOQ==
X-Received: by 2002:a05:6000:2088:b0:43d:70b3:7edf with SMTP id
 ffacd0b85a97d-44bb32fcec0mr17275201f8f.12.1777906545569; 
 Mon, 04 May 2026 07:55:45 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a8ea7cf6asm26942123f8f.8.2026.05.04.07.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:55:45 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  4 May 2026 16:55:44 +0200
Message-ID: <20260504145544.24754-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501152758.2610763-8-bernd@kuhls.net>
References: <20260501152758.2610763-8-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906545; x=1778511345; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cbgpzvfbXYuaOi/Hz8InzgJ8/O+czgWDD8yDBBJd8FA=;
 b=W77nPUUCP1dT6KJljy8KjUUALlI8nm0l9gyc2sALrJm71wH+jCxcIDi6psoZLYbSVV
 dr/9q3jHezB775DQX/UJz2KcnNYtHECscy41MAeE072DxPCGh6XFxIKLvReaRXtOEjrU
 jdE1t8BvJKLVCYVec5yclAUM5BX6J/uOle/qGXGbc0z4L9NBpr67tpDuFbHqtw/96f+C
 trp5Yf+og/Mb7TiNNqYXUfJlHwgBi+JPZ3LjK7HJg1QF55tr6jEbRUKl5RNtPSE0HQIE
 IuAJFtgyd/dJEKIjMdpc3hzUqI/uQo2tEkgHwjj6HjHRAQ57VwBHMteR2fXbBAnGg5Bs
 9eZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=W77nPUUC
Subject: Re: [Buildroot] [PATCH v4 07/21] package/cups-filters: add upstream
 patch to fix CVE-2025-64524
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

Hi,

In reply of:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

> ---
>  ...ix-infinite-loop-caused-by-crafted-f.patch | 83 +++++++++++++++++++
>  package/cups-filters/cups-filters.mk          |  3 +
>  2 files changed, 86 insertions(+)
>  create mode 100644 package/cups-filters/0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch
> 
> diff --git a/package/cups-filters/0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch b/package/cups-filters/0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch
> new file mode 100644
> index 0000000000..e9900e5672
> --- /dev/null
> +++ b/package/cups-filters/0002-rastertopclx.c-Fix-infinite-loop-caused-by-crafted-f.patch
> @@ -0,0 +1,83 @@
> +From b03866fd2e251a6d822a5e8c807c8d47b4d2dce2 Mon Sep 17 00:00:00 2001
> +From: Zdenek Dohnal <zdohnal@redhat.com>
> +Date: Wed, 12 Nov 2025 16:02:20 +0100
> +Subject: [PATCH] rastertopclx.c: Fix infinite loop caused by crafted file
> +
> +Infinite loop happened because of crafted input raster file, which led
> +into heap buffer overflow of `CompressBuf` array.
> +
> +Based on comments there should be always some `count` when compressing
> +the data, and processing of crafted file ended with offset and count
> +being 0.
> +
> +Fixes CVE-2025-64524

This line needs to be changed to the following as documented in [1]

```
CVE: CVE-2025-64524
```

To be correctly picked up as a patch. This is not checked yet by `check-package` unfortunately

[1] https://buildroot.org/downloads/manual/manual.html#additional-patch-documentation

> +
> +Upstream: https://github.com/OpenPrinting/cups-filters/commit/b03866fd2e251a6d822a5e8c807c8d47b4d2dce2
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
