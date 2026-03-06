Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA69FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A929614AD;
	Fri,  6 Mar 2026 19:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5xRgmveWb9X; Fri,  6 Mar 2026 19:53:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BAFC61499
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826806;
	bh=406ufibCqlQFVxRl10W939SwRBMjq5vHUcNkMXx6Pzg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VEa95fXIW3nsaMtO7X3ZN5zpZEyEKZftwSVGL5zz5sNuDxREJZuTnRTy2RQ1UwXJ2
	 Wk4QcwOlZViK2YvdmKqRwLnGdxPh0fHbgJrvBZMMUWOEOdQDljm28i+/n/wblxKHWc
	 9PVduEruC6zOm/u9HgBdGUzvMklbOIWZijVPDACJTXYu4CTyuJQo9YGirKARQ7voWG
	 3r9jdhqAF1jduIjWhN7HpDYGnPvHaW4xeO6DvknjNYEBo2J6He8nz9wwuw5qd9PiHP
	 Up4MYeBF/0C73JaGjhkpdpzmMlBnIbObtFtmlQRI2R1X+V6QoFz1k0hUAMbkB1uUVl
	 DeNBZ+8rzv+MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BAFC61499;
	Fri,  6 Mar 2026 19:53:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47DE4223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C9A583D96
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvjsKWHYE0OY for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B03E83D56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B03E83D56
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B03E83D56
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:18 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439c4bde55cso2639773f8f.1
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826797; x=1773431597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W1OI9B6UMMOWGcqC1nXvMbSL3hh4Tre2cKjOqXaAQgY=;
 b=k9K5p6dk5DxExhzjctwM8fVp+0qrvMcT37nw/MTvEW1hF8cc+Ox/uQQiDrTtpKSw8e
 Gn1zL6ITdMPTj2csRBXTVtaG1gS4r8N5fWgvVAsaMBWpMHU1CzJ/y/I4HtO7zAXLDBmO
 eLmwVbQ/1szQ3brDcW2a5xxSvE3m1BfFMEFOomTwLfLCY+A1gggL0/JfcCDARgXi6saR
 lXxYDxlrRh0AdFMdDe6dAAgPcEdLIgg52CVy1uLFhK+Nqleu1rBQtUxW1sykfA/A/Je7
 4caHV7LSEbi3TaCBJA0XKF6ifZ3gOgHl9Qc8Oamvb+Pc9FkcEwqB+dgnSdD1Ug8nYH5n
 V2NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq9ParoEtazXIHZq7zK5wy7mDy4hWF3O9NRiV/oLwh2RVkE+1VqXw/ztP2FvjlwjhpSYJjDv9oC9E=@buildroot.org
X-Gm-Message-State: AOJu0Ywnc1Els0aq1yo0xiHQOVG8DWSOYS//NN59CTZ3JgpYyqGlwhJh
 t0OE5FnHTDj9fA1CmN36eDiVQKViE8ZsWsj8S+Or9uz4mdUFO9ch/3ecX6mrr4wMv9Dn3Qbs/eL
 9Mulm
X-Gm-Gg: ATEYQzwAmgCzMShLGjDm56AdRRcG9kGo1DDtE2Hl308A+tKKnxRTrZ7NO4KilrTevSx
 hIPuW71bmvh7Gm4X9wzk0ji2cMT/e4ppEgrIEWS2wrohy56li40OYRNdx3iESL82lgyuwqZaBU/
 fEGkwMrlz0bqD7BMpvNoEpA5+HXBxMIzVEix/T6xJT2lg+IvV3yLlfxWKRkmZHNDPbinrR60ZSw
 V0DtXkBtdblJV/A1aOWRPdP2pNs8R1y4hXBTDckWTxwKsS0lom8pfIg7HYguXmaIAwNn9lge7DF
 0IS6hrvPo+zvcmnamh+OWc7gfuEcacPcfJc/BBofcfICs1NriB5kOwuQcI/jPV+2BpanLDopGhV
 KG5sRlT29uBUjl0sej4ijC3lztmGr2kr5hJjqSmW0Vnj7k8smqu02EPd7V0PLMNIm75W4fIavzY
 3EHfaxz2TSvXdy4JzsiyItEm6PlQ==
X-Received: by 2002:a5d:5f86:0:b0:439:b59e:5e6a with SMTP id
 ffacd0b85a97d-439da3307b5mr5925628f8f.14.1772826796970; 
 Fri, 06 Mar 2026 11:53:16 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8dbb3sm5238490f8f.4.2026.03.06.11.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:16 -0800 (PST)
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:15 +0100
Message-ID: <20260306195315.8013-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228194903.1908686-1-aperez@igalia.com>
References: <20260228194903.1908686-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826797; x=1773431597; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W1OI9B6UMMOWGcqC1nXvMbSL3hh4Tre2cKjOqXaAQgY=;
 b=iWgx7HZTXdjuR2mQy+z/XKyRxnQ1j8TI4mMWb7DkSG6JkLoVlmi/oRJuaD/nuLbKkO
 RtE9IoX+463oGYMGtD/6xGTbI/NFsi7njRVAwNitBKAMGZOcANW2D/kWMv0N+X57dTq9
 +EFB/BiJOQFXzoZ6Eg6/j17VL/DyUcG+Kz9t2mJFu9CJMZ7XfIMH0E1Sk59OVQa6+wyW
 dWro5+8EyEJbr7cQiT1vUR1V/yf/bL5PlbY1IyljWUrgWsUgkuqWoZK9weE6jkTj/fRo
 UCJqMPOjdSrBWjFtEEXEZLt7JvLJzCikUGg9g9PHyIfexWlBH4IECeqYZYcw+xsnFCBp
 LHag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iWgx7HZT
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: disable JIT for all MIPS
 CPUs
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
> Change the mips32r6 into a blanket BR2_mips[el] check to disable the
> JSC JIT. Upstream removed JIT support for all MIPS processors in
> January 2024 [0], and the change trickled down to stable releases
> starting on version 2.44.0 [1].
> 
> While at it, change the upstream bug links to point to a more
> appropriate bug report.
> 
> [0] https://commits.webkit.org/272866@main
> [1] https://lists.webkit.org/archives/list/webkit-wpe@lists.webkit.org/thread/JM7GLPPKGAB6DIQ2YDHPEIWNOYSUHBC7/
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/wpewebkit/wpewebkit.mk | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index 78c919e309..40708baa33 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -163,18 +163,16 @@ else
>  WPEWEBKIT_CONF_OPTS += -DUSE_GBM=OFF
>  endif
>  
> -# JIT is not supported for MIPS r6, but the WebKit build system does not
> -# have a check for these processors. The same goes for ARMv5 and ARMv6.
> -# Disable JIT forcibly here and use the CLoop interpreter instead.
> +# JIT is not supported for MIPS, ARMv5, and ARMv6, but the WebKit build
> +# system does not have a check for some of these target processors.
>  #
> +# Disable JIT forcibly here and use the CLoop interpreter instead.
>  # Also, we have to disable the sampling profiler and WebAssembly, which
>  # do NOT work with ENABLE_C_LOOP.
>  #
> -# Upstream bugs: https://bugs.webkit.org/show_bug.cgi?id=191258
> -#                https://bugs.webkit.org/show_bug.cgi?id=172765
> -#                https://bugs.webkit.org/show_bug.cgi?id=265218
> +# Upstream bug: https://bugs.webkit.org/show_bug.cgi?id=278559
>  #
> -ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
> +ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_mips)$(BR2_mipsel),y)
>  WPEWEBKIT_CONF_OPTS += \
>  	-DENABLE_JIT=OFF \
>  	-DENABLE_C_LOOP=ON \
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
