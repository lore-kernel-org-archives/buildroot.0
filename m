Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C788DCA9EC0
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 868DE60AC5;
	Sat, 10 Oct 2026 09:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5UccZG5IwKN; Sat, 10 Oct 2026 09:22:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4FF2A60AA7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624167;
	b=OBrocrB1base107nxhU7xllzWkDYcdgTyrWb/hNegauiABkKoVejxw5zVZL4V7ZQrC81
	 kK4HKuYJ2j5iRn3PLkK/oW0r1scQRr7nRWQLQu2tnPvkRVZ56IvV+1XrPAPXTyUgrnLvL
	 NvP/avG86eb2exKOoWrd1suguweJe0JsYwNGzF94VXYSGTS/S/YRVN45/Vw7qV34Jy9x8
	 OmI9Fp+fK/gwyFEcm+nKp+Z97/KtIajnZSLD0UmgnIeCHwa8k8AzAWdCMW0G/H6xwEzcQ
	 xlOnA8UeOA7PMfvLSRofvl8mf0QmtPb2vb3JPrbFlYRTdixu7T9ST8ScOouLK+qArvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zWFLLKjrFSwXFmVRdKwtGQ4YYUJrg3TK2yhDEBPOZmc=;
	b=Cs5p/fr41HfoRW39LDq4Cv1UdfxLiGa/FYF8K2OwxGB86mO+/WUFD3y0plrkYp0TyHwx
	 lh1srJ8x09vcR/cKeFS00ch+bAD6vWGekvl17HtxMoX1rUbt2iBSAWJV/5u/NHY3w7r0J
	 7a92/jvgd7HfqvrivFAQ43Ecn2tEt1f92Fm1riGdk5ZAkhU4Q2XR/7DlcmY9pSiIK5xMz
	 AoRph2HWIBMDrF165g1CmaAjbUZ0ajv3kg0pG6jGWq5RnhaJoRmzCvMOepgdvA/TuWiC2
	 QXWqvcuiIXhfFxGu6c25+nAfCC+jLoFNW9vIVyDtBXU2o1A9GUR3/Z6zG6rBG7OhrPw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624167;
	bh=zWFLLKjrFSwXFmVRdKwtGQ4YYUJrg3TK2yhDEBPOZmc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SRLljTno3v5raRmDq20Ya/QkS5b766KBXcPrd00u1XBhbmYnuZANENx0EQMs/c22t
	 HCQFavi5is2+43IcdcCSfSitXS7+QKw6pcxs5636H6HQp48tPRQiZeLtYthqKYKzvK
	 DbNE8i00/fOWsGtadBPIugNVKcTSgUavmcxETj/SPIslJ+lrlnL33/ic044NJGg3eV
	 Hvopo9VjTi3lJIjFFQMd71cZtE2oFCAPby9xBKKzQSE30shgh0VLaUaD0C4Zj2O5jg
	 5yluNaF/wQBFn9VM5nN6bbq8CPuff3kwsFrciQRciKpjMgqfwEHUEufpVTv47154Ho
	 xpb5TrMfTVTAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FF2A60AA7;
	Sat, 10 Oct 2026 09:22:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2538B75
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1626581008
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1uUs1mn-pLCk for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:22:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1000380E3A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624160;
 b=EKwfI9GIXlAlmdtd6xZFGpOyLOdQkuObqsOlfPsh7/5hDCPCSlChyat50tYL40t9NpjM
 MUikj+HIRyGskTYKTb042LlEDF2QkV0C+I7ROA4t+E92mq+lwv1jCQ+7O+IunzPlDEHVL
 99KFtXaUEsIMItdhm+LKkLz6TF4jveZqjxVXh3QyXnDjR4ZwnZJ/tRVGQ0aSw2fr5Fiv5
 9HQDelOauTZSiVyGc0XzRMgIEhZrys3PwQHRFzH9JT3LaoGjg0WdgP3RfQ1nRmgbn+wYf
 8E6DD7qaXI93cEqFfxXcw+qSwAhXUYU5Szqc5NEPIdr48oRJmWK4NK4hS/6XtNkBAyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624160;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=bsLKFW39T9Ht4hBpT0Ke89giHDA30pMYct8G3H5Em1A=;
 b=I4hX7sH+nNw+SrHqdoIvX9kZMs6m9+P7Sj3dkxidGgkiIluDUxYtwsRiibGeHET9WU05
 gD0pxxhtD7II5vdKSEy2GYrMqwGuBnf0pisC3uY+M0muANo+K+fm3K6yKZHr3U977qNBd
 zsoOHCgSftXdK6BjXwM+QBvSYmvfdyO6i6oqqxy3E6xoa9qYMJgvpMMGysPKVJ1ErnXyJ
 pNMKPIaIbf/l7oWHZiHmqJzIEz+8WAMxvOGWa0RmuZU99u2JGcKuWEE9WhezLVTklxvRB
 VmSWMihdtxR4y3rGAybakbVrhCnKJTirC2b/uF26/b0NJ0TlGIrXjeiSfNctaXPuIkg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="gvWe4bz/"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1000380E3A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:22:39 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49d0da752ffso5206765e9.3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624158; x=1792228958;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bsLKFW39T9Ht4hBpT0Ke89giHDA30pMYct8G3H5Em1A=;
 b=nACiinsFqk+vEygmDx0F/ovKgZqwkAAA0bbzZQ8Aclkln0Q2nDdiVGVyiMXYNHlKTo
 lXFctoobqVRS7wa1lT4mLfdDsCfg514Cy4hQpppJ05rS75dPQH81kxN/oPtSRKLWgh7/
 T7erCp7lxk+0151OkjPtzpHqpF8KiZ/p/BQOQslVaorwCS5q92A/7Gt372sbs7YqPgC4
 YsA6o/igj5KeateCM1hPLlVTdwwGDgShsXQYherN/4YkDDd8WxisM1VW0nvrzLHLMByl
 NH1bR7oS9/IjoCB0g1GBIJPR4hEPizbUovlVU8D7wcHSWIcOs4b/hNnCOfgkm6PkhIs6
 NcXQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzPnxMrQXwWVAVlCZKp81knXMOMApeCmxQ+Y06+MgcQEOVBruFfLUBZqfRlTlbx8XT3w0RmyqeRf7k=@buildroot.org
X-Gm-Message-State: AFq9FYLQJrT7fvEk5banuNmBz745M3lE9r5NMGcOfMgXr+ofp6sMACmx
 Nytgljwg1IfeJjX0Wj9FQPPTgRkwy17FRABOWc13sREHJ9AUbSNvizPo3kZBFjakf8NKRJZbnQe
 KC5apeZU=
X-Gm-Gg: AYBFou2hiMIFhVXwk+WXfprgxqSjR0t6KOEfJ75CrkrYx4x6z4bcUxXvRxIKaNdEKdH
 JP6kiifksnmFNKTQU106LguQL336fay9UQtcRX84g7d8BDo9ak6qJTaKMLSXurBWfpEcoIbYOam
 fKdTVM8+syy9GvtuB/eUthoY5a4sxYik7oSFxwfsRNAwm8yZG6GwbuFutLt3ZQepjoRwmXXZzxu
 AsSVOSWTNeZz9QkQV+mNcxyxEbY4gxlSJWYyb+2NLLjzpWCcUjW45rgUmKopMC1MP+QDmKjtjLy
 eYO8Hey1RaDbAgw0yrCvd90S/rrJZVU9r1bNkx199JA7QP+JG41/cqggSMkPt5nplMrPFckWFFr
 h/BcYs/I4bpUi6XqY2yF9pbkAZagT4/Htw6r4iBIVTjSemuABhx7iEJDjRCvG4JYJb3i2+iYMit
 5KgfwrZ7/+Wc3xyUbkber67uY97RCwWFgCVpvJ0dz59wJrxPQ5NlSnI3d7F6guq3XitgFwKXtKb
 v59AX2NcMDYeEtnxmLpxl9nErFw5CIjeN4uayQZWAxJxBDhej2AKFu5KSzW4aVGZIg=
X-Received: by 2002:a05:600c:8214:b0:4a1:6425:be69 with SMTP id
 5b1f17b1804b1-4a18e4b4db8mr84784215e9.17.1791624157631; 
 Sat, 10 Oct 2026 02:22:37 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a195002123sm55126725e9.1.2026.10.10.02.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:22:37 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:22:36 +0200
Message-ID: <20261010092236.138636-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002214711.1164231-1-bernd@kuhls.net>
References: <20261002214711.1164231-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/libpng: remove autoreconf
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
> Buildroot commit 08ad91052b69090b74220d89b13cfc29fb86ed72 removed
> 0001-riscv-Support-only-RVV-1.0.patch but forgot to remove its
> associated autoreconf.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
>  package/libpng/libpng.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
> index 96afc684db..1915941b82 100644
> --- a/package/libpng/libpng.mk
> +++ b/package/libpng/libpng.mk
> @@ -11,8 +11,6 @@ LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SE
>  LIBPNG_LICENSE = Libpng-2.0
>  LIBPNG_LICENSE_FILES = LICENSE
>  LIBPNG_CPE_ID_VENDOR = libpng
> -# 0001-riscv-Support-only-RVV-1.0.patch
> -LIBPNG_AUTORECONF = YES
>  LIBPNG_INSTALL_STAGING = YES
>  LIBPNG_DEPENDENCIES = host-pkgconf zlib
>  HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
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
