Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE77BCD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6BC2613D7;
	Fri, 29 May 2026 08:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jCMeLr44V3vv; Fri, 29 May 2026 08:30:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0AC561596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043426;
	bh=6KLBc5wa8KIubxHg4aWprh0S3m7zSztlnVWt19dWlbA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ATREHxoYcWju6PjNUYLl6WZYc/lm6yEe/0tnqaf8WPRByfg30yqrQ+hxyH/YUgn/P
	 lAyW0Uanc28h/2f+Ndn+AhMuHElkinhZT0s3qWJkajPk7je63BOv0x4ltgEUxUNUvS
	 YaA8AzG8dQZt0sRRL5Sm/4u17SXYKV/+O3ni7IgP5joEzhKAr3sdTZkN3S+qOsD3NN
	 GbsZ/4HxecDtoPZAqIIILvK19548z2oLbVOlvLxZ9Fon3fbwwsqLxeimrP79DRBL7m
	 9hps6FdI9RVppEWoeUihw5VL4icrFXg7A/nx3C+viBd10NxF2kpTlQ83aPd/+5EmQW
	 fegVr+AiY9d6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0AC561596;
	Fri, 29 May 2026 08:30:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3874028E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33887842CF
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pG8GX_eu5p2y for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2ED74842D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ED74842D7
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2ED74842D7
 for <buildroot@busybox.net>; Fri, 29 May 2026 08:30:15 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4905529b933so52914525e9.0
 for <buildroot@busybox.net>; Fri, 29 May 2026 01:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043413; x=1780648213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o6M6e5KGPX3vSMo03ZeOyTMlwkYE0WxIPqNZ0c6hPxQ=;
 b=lduv2FRZJUvuk2uXTQ8XkmnWkq4jxyjy9CCEFaZpgIO15Q9JjQLoUo0sbgemY/Ycjx
 FoTP6ziQgV9QJIrcaIm/Pd5Sbu2eckz6xL8sZY3j6xiFR75lJmbdSekHjHIcZsl+zUX2
 r3JNUz7d5smdxRtwgcxas68v05xlyl0N18xtofnx2Nr/5rnvg1ksu0nfjQDnCY/NQQnc
 I4gxQJZGpG/Hj1Vx3dd+okQGWfY3WYDedxpGfaAw59MrI1WDjs9udqefS2DZv4GQEpFX
 WC1lp5WRCmF0MgrZ75N0iHNyYUfalYyJpRCN3Ads07rV+iLi77RzlFoP0RGozAOpkUvK
 SXpg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9c/NUhejMVxZ4MZMGckfmikhArcoOJzqZwba175H3nDx/Y/wr/6yttU5XWfKOMjGZrn9iNDd0v4Gk=@busybox.net
X-Gm-Message-State: AOJu0YzdIl6dATQ9KRTRLGtqocLv5s0LQcX3gdWWa6mnvU7kJqepMrTU
 lDx/szxQVemmdr+qn8dj6kYLvUFLgP0x7wVcdVWkWUv3NXW8XOx8lvUcl0nvElKNTkU=
X-Gm-Gg: Acq92OGgwp/GPNYzdDwNTkHDfiynjiweg9dVZiZSHR0BhcSX7RzbUgodE/5Or93/KcP
 uYjI9AGupo/yxpNH7GMwG6pm9B8UcGWKG+yxnSCvQ/odhmKoimFQEL7RK8QJYhQ3rGMWYYcGWu+
 1M46FP3MR+KCj4T3TtmPjiH+fPevpOFykmY6UOuSwQlwrWA9zX13mzMXu2DEJNTKTT6MqopZ4rI
 GIxQQ2kIlxx+CqanVtD9Elbr0JvaoIEw9jyHRPYUFMnHB0QtXI86DbIJTWSdfN+bST3T6lZN5q/
 g954Gjwiat6x4mjq07Zk3Q1qIOqCVeHfGtXJbdWaORCficBnoOeRtL8bUZA40uuNXxL0llYBgt0
 KvpIzyfB22mykIKJRS8AYQCihu7V36mxSz7W2SBtz89JgfGgDKoUH8I7xFa2FUmlZNRGBW9iB+f
 GqOmw/Lsl3zNEoKy8xnfxbPfBIn0D8JaXApyCYYYGfhXfE3T+kjyQ6ReOGLCEj7M4jBvIr
X-Received: by 2002:a05:600c:6a84:b0:490:3d62:f5df with SMTP id
 5b1f17b1804b1-4909c0c6dfbmr22357685e9.30.1780043413058; 
 Fri, 29 May 2026 01:30:13 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909caa7e17sm32059175e9.9.2026.05.29.01.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:12 -0700 (PDT)
To: Francois Perrad <francois.perrad@gadz.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@busybox.net
Date: Fri, 29 May 2026 10:30:12 +0200
Message-ID: <20260529083012.59102-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511073118.25876-1-francois.perrad@gadz.org>
References: <20260511073118.25876-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043413; x=1780648213; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o6M6e5KGPX3vSMo03ZeOyTMlwkYE0WxIPqNZ0c6hPxQ=;
 b=Oj1quyjk0DDlXml/5HIZVO7Nqm+MVsBemSwdHawc1oSjHRQLI/vUyW75FCwVtYLcny
 Kr2L1n65I2va+igEBa0KL0LuE/Xjd6dYjpj1H9a2s+1GKvkpFtv/Z3gWyhVDume3bRXN
 vCVXj99mbcVb+4JJ40myWhbxYdNR+tlPxy889DWX6bYsEAbNaHoEa2KxmR9OcY+h2yG4
 mokFIghO63iuRrMF9IfDtZAAbjI/QHLvAgFl8obhhsRT/Fadgn7kCp0qe0gBxjGa7MyN
 j98dKHYLcaHNHst+wov3753wVdXC4OAVbh65T8spzxGbFl2qHWp0MBQ1T/RLkM8PebnL
 S6LQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Oj1quyjk
Subject: Re: [Buildroot] [PATCH] package/expat: security bump to version
 2.8.1
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
> fixes CVE-2026-45186
> 
> see https://github.com/libexpat/libexpat/blob/R_2_8_1/expat/Changes
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/expat/expat.hash | 4 ++--
>  package/expat/expat.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/expat/expat.hash b/package/expat/expat.hash
> index a0f8b514a..5d34adfc8 100644
> --- a/package/expat/expat.hash
> +++ b/package/expat/expat.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_0
> -sha256  a37bfae0aa9775bd8521ebd85dc456d486f0ff31138f6c91fd902ea732624542  expat-2.8.0.tar.xz
> +# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_1
> +sha256  10b195ee78160a908388180a8fe3603d4e9a12f4755fbf5f3816b23a9d750da0  expat-2.8.1.tar.xz
>  # Locally calculated
>  sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
> diff --git a/package/expat/expat.mk b/package/expat/expat.mk
> index 07c209543..3b529c339 100644
> --- a/package/expat/expat.mk
> +++ b/package/expat/expat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXPAT_VERSION = 2.8.0
> +EXPAT_VERSION = 2.8.1
>  EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
>  EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
>  EXPAT_INSTALL_STAGING = YES
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
