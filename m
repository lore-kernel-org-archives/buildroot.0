Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5F1F436BA
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43C2C818EC;
	Fri, 17 Apr 2026 15:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DIZ0yG_2kkwy; Fri, 17 Apr 2026 15:25:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50DC2817AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439508;
	bh=QMXemE2SpUMIxX6jLoZNUfU5cLBDjQSScIOghRfoCZQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l4oCPEFq70dTBP/bJ7PgIdZlllo8Mz8hgT8y6iQfN7qvbQhU61B3cE9azupZR/+cO
	 I5kw2R7/unWTna2c9IJh1xc31uL9LpqWACy/9bAYYM47kOFtfa9NxneLgjyUf3O5Vq
	 lJ25Ec/I/wHiPVI1EQGFCZ6E6KOUWiPmaNijI4iARCl5gJaxUUI0aOWs4k8d98ScPt
	 6APbmWg99o9RTL0iTnfGNWScRIHRp2v3r1GUM238JrBqNsai55AoFv5FOhkEZBxPBs
	 Lc+yLYxnyHf5WKihnWqldV8mSwR78+dhreHVX4R3KTkvGCvD3fZveY83ua9uHNejdc
	 GAK9k3qUZAu0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50DC2817AA;
	Fri, 17 Apr 2026 15:25:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05716259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52BC681367
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSntrGtWyzFy for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:25:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2C47981349
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C47981349
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C47981349
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:25:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so12405695e9.2
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439500; x=1777044300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/hwj/jYicfZbGMiJaH1ub6hNlpItDwL7pzCyjRZUT6Y=;
 b=qbU8urj/SGVZ3iUMYbyf/aXsns4tH89n9ZEo+6yXNAqgGK0wk7bZS3D9tC6cG/qTBn
 nACz3SKJPeJpHFmqwOLdW5LUbqsVI2D9+lYvM0SgBzyKuRHUB5DCs0cVVAwfvdbhue9+
 IFlhz3973icjgjbGIhrQuj8cnYuAnOI9oNafzfB5xChfzJjF0UZ2W/J34iri4hZGOv3E
 zpECYvIjopWHYSFuVrjLXYsDaIC27efIQ6C0tamKfv9J6sPDDlBV75qdMYeBKXtRVZ2g
 Bh63mdPKUwhfJecEU/bxQn3zuqJicSXw5q7gjs/6j5CYAMcPCQSF9olBo0qUpC43oB8B
 2dBg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+krlS1DpvMbi8w8NHtPXvlhGvbiYVHUh/eFoZ77sMkmy/AD71p5I4SVylqfITs2IpWIRaXwJRDvMg=@buildroot.org
X-Gm-Message-State: AOJu0YxThJ7FVr7tBguKoC7wG+vMwy/LMId8tSP3l+f3AdbaV7j+K8QH
 esjQpySpubJQUls8/MVIJDtO3jNJ2HRfaSZDoPB3A00489/C9PHVpSYjpEww9c+HNe9FiQHVscz
 G/UtC
X-Gm-Gg: AeBDievFINR2uv7li5kWzFRGkCkLa04NJJGpAxekDKisanlP2ajVdp1TAbPGcvpLFxZ
 71HVvvMHHHQGFGun2bljPn4AfeFV+GTF47X4LGpoN+2Oysf5v/GqvfZnXdstGoV9laYC3SGKm2k
 ddGCNMiYsMkwxUVMCwp8H+bjutTrIl65eKVXJWS0sDrisnCjhAGGbGkgr2dFS6vLv4snLE4VAxe
 9r66aVyvWusCrH6jszGIZzT9d/+Gw6haeduIOfMoehKKXKfh+wVr7l2HHasmrrCdnwRzNM//07p
 Q61OODEF5Z9ozUWnwYazbHWJiYXBCO81u2vMp3sEZ46OFviKFmuWsoLetS2oHJ/fvJj8R8fhK6c
 LLTmxbZNlZXm6PEudJ2Uoq2HZdIFAvm3MDKWp5MmajV+x8xJXFgZhtPObvjwX+fPkL0Tka2vqZK
 FXmeiEnlsfd2pkXtvDseDoeS1rrvc=
X-Received: by 2002:a05:600d:8408:b0:485:46fd:7887 with SMTP id
 5b1f17b1804b1-488fb74c61fmr38328735e9.13.1776439500069; 
 Fri, 17 Apr 2026 08:25:00 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc17f642sm47283925e9.5.2026.04.17.08.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:24:59 -0700 (PDT)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:24:59 +0200
Message-ID: <20260417152459.313622-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410145709.271512-1-buildroot@bubu1.eu>
References: <20260410145709.271512-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439500; x=1777044300; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hwj/jYicfZbGMiJaH1ub6hNlpItDwL7pzCyjRZUT6Y=;
 b=iPsZ/b+6ojkXQoUl4dxHwdiLeypNtEz6RQsOIWBgpb19vg7VGe0HmbsOeb9saSSPn9
 MdqTPeAZuc/OS1sw1zq+qSzly42BZopxathRozfJOdE2nP+woqHHOYIH0s1mfipkh7QZ
 oqkBueW8vlPm+fNeRgOJBBuZDgeH05NGojSeNieEPeb4dmICQq2RB5Ia4YToykWBSQ3n
 iEygVteE0DN5sQ5nojMbpZ2RP2ZLMlf8hcc6+iHa3ZPzmYJVyN728XOTJHpVzkGeV/zv
 Ia6bsfMJhAjWqxKLVtoTwNoJbeEB2/ruXy9RCUWhI6i2cPU2lq35IVgvBPKP1sEsPuR1
 qZZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iPsZ/b+6
Subject: Re: [Buildroot] [PATCH 1/2] package/libgpiod2: security bump to
 2.2.4
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
> Bug fixes:
> - fix buffer over-read bugs when translating uAPI structs to library types
> - fix variable and argument types where necessary
> - sanitize values returned by the kernel to avoid potential buffer overflows
> - fix memory leaks in gpio-tools
> - add missing return value checks in gpio-tools
> - fix period parsing in gpio-tools
> - use correct loop counter in error path in gpio-manager
> 
> Improvements:
> - make tests work with newer coreutils by removing cases checking tools'
>   behavior on SIGINT which stopped working due to changes in behavior of the
>   timeout tool
> 
> See: https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.2.4
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2026.02.x. Thanks

> ---
>  package/libgpiod2/libgpiod2.hash | 2 +-
>  package/libgpiod2/libgpiod2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
> index 157e605ed5..a12752261a 100644
> --- a/package/libgpiod2/libgpiod2.hash
> +++ b/package/libgpiod2/libgpiod2.hash
> @@ -1,4 +1,4 @@
>  # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
> -sha256  70012b0262e4b90f140431efa841ca89643b02ea6c09f507e23cec664a51b71a  libgpiod-2.2.3.tar.xz
> +sha256  13207176b0eb9b3e0f02552d5f49f5a6a449343ce47416158bb484d9d3019592  libgpiod-2.2.4.tar.xz
>  # Hash for license file
>  sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
> diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
> index 8803a282fe..d83fdbd94a 100644
> --- a/package/libgpiod2/libgpiod2.mk
> +++ b/package/libgpiod2/libgpiod2.mk
> @@ -6,7 +6,7 @@
>  
>  # Be careful when bumping versions.
>  # Dependency on kernel header versions may change.
> -LIBGPIOD2_VERSION = 2.2.3
> +LIBGPIOD2_VERSION = 2.2.4
>  LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
>  LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
>  LIBGPIOD2_LICENSE = LGPL-2.1+
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
