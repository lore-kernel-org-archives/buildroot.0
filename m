Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6938BEB28D6
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 352BC61142;
	Fri,  6 Feb 2026 08:11:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xePMxwJ6kHRD; Fri,  6 Feb 2026 08:11:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C50861148
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365491;
	bh=PoJ+WbIeID3KB2cBYUl6jJL98Egco+FkqMvur6EtLxc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jkvgylWM5Fc53BasUCaddwq3vBljfwcWhalLfR0YTll9AhNH5pgdK/ecIRH27ndy1
	 +tJvr80BF8LxYc7nkbTQsPetQO93DAzIDcfNmzB2EB5mx2dSINj9W6RZPXEvrzSYV2
	 OgVbrNCJ1b98sId4fbpqtWUioa9mIiSxTNOZs6jYC8d/yndcXsGqVtEFUFHwDSGrNo
	 0k/w17CuTYe5d5QzPOE1aR4eKri+CkKFdlMjyrLWECODXVU+y8/VYNrpel9kSefheY
	 crT3ya5ExhPWpzYipCmDogjNigCgi0741F21VuiDRVMgBc/Z7C7WdUjmfoI3suLe9u
	 bzfw3aTC6rG0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C50861148;
	Fri,  6 Feb 2026 08:11:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 61E7D219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 529E4408AF
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fu4VK2FA2GNs for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1AF1E4018D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AF1E4018D
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1AF1E4018D
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:27 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-480142406b3so14432175e9.1
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365486; x=1770970286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Its5l5YAeYrwYKBiyd0M2FbC5tGUP8h5TT3acIeFj3Q=;
 b=PtK5YC0JrYnvf1zhe+9zj+X+OCE3zhDlHmo/eMP+LW8/3XP/H6y/Jc8IGzdwCIPYtr
 8H9Ow4m9GMBe+f57h8Kv+/FwzcNjI7khhrgd+qqPNheHqzVOlJ3jrA2EDFN/gT9SlP2Z
 22F53eUjWk2drY5vHMq3UZxzWHXe/TNzNX8ewW19f7lZWVU8khuuJ5YBLMjJnQIAml1p
 2yyBPk8B4U4dlwkPIlv57LBGPf/q4zHo2vFk2JuCxxOs3JW/tdpaK0LAizWT5lQYLzZ8
 4wDEo+5aVKyYjELw+WVzzpEMTylPIY8DQvakJ3xTicJJjif8nsRfMzdtljfnHAa7KQIs
 bHsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnixY0LxgsTD66ttkzbj0rMTcrtDUqheddZiAcwyJps3kiLK4Hfd8ippITNr/3oZij5kaKWh7FW4Q=@buildroot.org
X-Gm-Message-State: AOJu0Yzv7W5MqRufid/Fft/KtMfP2uS+RdUefNBeKZdgwW7C/90Y9tMA
 koP1CJcHHq/LpuUeyYrTb5+LHeAL76zBZ8cYRalyE0NjU20uLXfM51Sr5GYQz4YcnWBPloOQxg0
 rj40r
X-Gm-Gg: AZuq6aKHsyhcsELuMcdYHv+gOyoVIzKb6CAFUJ+Ugjn9DRYvikXO0MMHG4YUbfk0fzI
 JO77GD6en/A9noUOn06mV+lIDuawZZXiQ+DgxoOdeqSqaxDUx0osoj7GLevK3Zh0v15M6vJfp1k
 nbK+Q0csnav3qeKL3gqD6rDPzE3kAS/jqqL6leSGgS864zq+pG2CXeG2zieQEftVZSwnPpePreS
 cST5+oAkVERYPtwDFmSNnLphkKLIbWp2w2nzhgXwqI3QDFahbCVdD87cV6wl2Y7v0ni70LoSBk1
 DUGvMX2mNR4LYzAF3bAhFV6Og2Ah32LzXJ/6aHLLKXfQs6drTbQBC2Tdl/32fp6aTRs8419jlgo
 C/BgYy3U2njaWB8qKk3eNq+8uvzvWSs76+gX6C5HvUyb3xwQ9fv3YydV5Veu9JBDjKhN/fd3M70
 gu5o3/q6NnuSlLTA==
X-Received: by 2002:a05:600c:8011:b0:480:39ad:3b7c with SMTP id
 5b1f17b1804b1-483201de61cmr28442595e9.16.1770365485682; 
 Fri, 06 Feb 2026 00:11:25 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483209e0c4fsm12168595e9.18.2026.02.06.00.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:25 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:25 +0100
Message-ID: <20260206081125.31418-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118163823.2922833-1-bernd@kuhls.net>
References: <20260118163823.2922833-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365486; x=1770970286; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Its5l5YAeYrwYKBiyd0M2FbC5tGUP8h5TT3acIeFj3Q=;
 b=eHg63sLwt+VYxtOiXmJJJrS5Ym8Mhy0dyOT7DcamZ7V8O0UDcTOFhCusgNDjzlpJVm
 nUJ1FRFUXKV1Lfb0OpOeRwR7oji4m0Ro857IX9p0Q3DnfGE/U40k/hNIA4mlGBXlzr97
 ZokAiipdp38Fmful/J4Vti6Tt+Bd5pYVtl4Wusmi75wzCJ/fRMo8MbgjnES1uYgJJF3L
 +tLTxcTrjdUKC02FEHPh/fkymBsJtB+AqQqKlPcyyUFIhsbl2qJ6r4cSrqZ8L/mV2RKP
 iXSA8LwmbiPplYct1G3iOp+1mQxZFHTn6cW41dApvB6yvrwH8HV56bblQ4Cxvv+UMnrw
 1cXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eHg63sLw
Subject: Re: [Buildroot] [PATCH 1/2] package/libcdio-paranoia: fix build
 with gcc >= 15.x
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
> Fixes:
> https://autobuild.buildroot.net/results/dbd/dbdb4f386a417f7467b66036e661e77d04b82431/
> https://autobuild.buildroot.net/results/042/042185a8d32765a52986cc0060d3d296a24c662b/
> https://autobuild.buildroot.net/results/fc5/fc5be5e78852f6f66cd631f12a02ac10eb846e97/
> 
> The build error can be reproduced by this gcc 15-based defconfig:
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE=y
> BR2_PACKAGE_LIBCDIO_PARANOIA=y
> 
> while this gcc 14-based defconfig builds without errors:
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_STABLE=y
> BR2_PACKAGE_LIBCDIO_PARANOIA=y
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  ...01-Remove-a-GCC-15-error-on-getopt.c.patch | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 package/libcdio-paranoia/0001-Remove-a-GCC-15-error-on-getopt.c.patch
> 
> diff --git a/package/libcdio-paranoia/0001-Remove-a-GCC-15-error-on-getopt.c.patch b/package/libcdio-paranoia/0001-Remove-a-GCC-15-error-on-getopt.c.patch
> new file mode 100644
> index 0000000000..de927c51bb
> --- /dev/null
> +++ b/package/libcdio-paranoia/0001-Remove-a-GCC-15-error-on-getopt.c.patch
> @@ -0,0 +1,65 @@
> +From c12e48edc5660c70509142349f4020d3f9e36218 Mon Sep 17 00:00:00 2001
> +From: "R. Bernstein" <rocky@gnu.org>
> +Date: Wed, 1 Oct 2025 15:32:52 -0400
> +Subject: [PATCH] Remove a GCC-15 error on getopt.c
> +
> +Fixes Issue #54
> +
> +Upstream: https://github.com/libcdio/libcdio-paranoia/commit/c12e48edc5660c70509142349f4020d3f9e36218
> +
> +[Bernd: backported to 10.2+2.0.1]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/getopt.c |  4 ++--
> + src/getopt.h | 11 +++++++++--
> + 2 files changed, 11 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/getopt.c b/src/getopt.c
> +index e51c35b..dce7144 100644
> +--- a/src/getopt.c
> ++++ b/src/getopt.c
> +@@ -2,7 +2,7 @@
> +    NOTE: getopt is part of the C library, so if you don't know what
> +    "Keep this file name-space clean" means, talk to drepper@gnu.org
> +    before changing it!
> +-   Copyright (C) 1987-2014 Free Software Foundation, Inc.
> ++   Copyright (C) 1987-2015 Free Software Foundation, Inc.
> +    This file is part of the GNU C Library.
> + 
> +    The GNU C Library is free software; you can redistribute it and/or
> +@@ -145,7 +145,7 @@ static struct _getopt_data getopt_data;
> +    whose names are inconsistent.  */
> + 
> + #ifndef getenv
> +-extern char *getenv ();
> ++extern char *getenv (const char *);
> + #endif
> + 
> + #endif /* not __GNU_LIBRARY__ */
> +diff --git a/src/getopt.h b/src/getopt.h
> +index 7cc9167..0a6c1b3 100644
> +--- a/src/getopt.h
> ++++ b/src/getopt.h
> +@@ -1,5 +1,5 @@
> + /* Declarations for getopt.
> +-   Copyright (C) 1989-2014 Free Software Foundation, Inc.
> ++   Copyright (C) 1989-2015 Free Software Foundation, Inc.
> +    This file is part of the GNU C Library.
> + 
> +    The GNU C Library is free software; you can redistribute it and/or
> +@@ -141,7 +141,14 @@ struct option {
> +    arguments to the option '\0'.  This behavior is specific to the GNU
> +    `getopt'.  */
> + 
> +-#ifdef __GNU_LIBRARY__
> ++/* Check for musl C library (<bits/alltypes.h> is musl specific).  */
> ++#if !defined __GLIBC__ && __has_include(<bits/alltypes.h>)
> ++# ifndef __MUSL__
> ++#   define __MUSL__ 1
> ++# endif
> ++#endif
> ++
> ++#if defined __GLIBC__ || defined __MUSL__
> + /* Many other libraries have conflicting prototypes for getopt, with
> +    differences in the consts, in stdlib.h.  To avoid compilation
> +    errors, only prototype getopt for the GNU C library.  */
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
