Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8477DFCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FEAE42151;
	Fri,  6 Mar 2026 19:53:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxtizYuS-moX; Fri,  6 Mar 2026 19:53:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED28242146
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826814;
	bh=NDsKkCsfVsWjFB33moiBZysd+HtVSvprh7oyDdFljpo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gcsQDa55BFWaetJOUEmAnosYFytPdSYdCqOWNb5CWr0uTutbv2EXiyr34/FK1cC+u
	 td4kTwn3Q70c+eqYh2wdvJFYltGk6YcR8okmTHwaXjo2f6voNIO5jCn0T/+I9M7NFJ
	 R01ewxlh0BshFnEgK5ivoM5eDZu4KP7b5vszEz5eQg5QvWecDW8QZThmDCc4GL2YzM
	 Yi1I029LGyupdE85yYcCWLDp01lPr8Pii3ts+nrjfmzhKTKsb/5dMuCBW2bwOGR6ee
	 6MtarANTugK+PkmfUkAVJujUE/KtOkg7z9X7HPnaDEin3H1/AhFpYTd9jKPEcvG6QS
	 5XptkDLIfvfyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED28242146;
	Fri,  6 Mar 2026 19:53:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 574A025B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37B7242089
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yWZZ5ePckJ6i for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE33E42077
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE33E42077
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE33E42077
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:17 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48372efa020so85582595e9.2
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826796; x=1773431596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lmLWDy8dHEN65UTLzDVZW0OhgADiYVkIWYIVB8itUG8=;
 b=fq6jb7rRS47yU8SiZDVOxF7Kk7s4cR6SrKCTI/i7wh6ArqK62XA2hnD+en8daEmnzp
 jFebbBuavcxQbT921brhg8HS1jQns+yhg1vkSo+XeD3WV54dNj1YQ0XEfYMprVYaoP5F
 VvdZmUcKAjmpo3h9SwrJXyrDoixH1SdyrSYJP2j1VLzFnzxRhGRFjMEKjOdpHnumKQcQ
 K52lYf6BzC+c3xbv9/B5NpHZHc517EvjP1LOj9WnvE1oHe1ziQfkHr/L488mL1QcyP42
 OCfymh6wNOG2Bf7eAGBaC4YzKy4K6em5OL0n2i+6eHSGr/t30jjE/SDVyM7nMPDEp/kJ
 hwvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR4uGGuTAVNfjwQOAF/cDTBXcP/aMNSKHZ4XHLe2SVWz1zkHx6qwi8k60BKnyoGLcXlSwKWBkIyNk=@buildroot.org
X-Gm-Message-State: AOJu0YxuhIdGqKjgG7ngdSUu2lxAI0Q2p0Fu2X94UKvJ2aVDcdKZpcoj
 7+y0MR7y+u9hWUZtJUkrsRMvJlWeQ+dDtHAejzLt/z75oeft4byUETfuLH3kcO2O7k4=
X-Gm-Gg: ATEYQzwr30DQDX0Z9Y2HibPGG6Fvcu758NY96HBo0m73QBYLCZtFjnEe2xlw2PfQJsR
 boQmHoHH5Vezh0NFllQoRouWuuByejrV2wGI6zGg7jcQpclDm58BcrhFyhl7QzM1ehEKSlYkwuN
 widLuJ5af7b2sYbGx8A+G40Jm7VK5mneE9yNPiElg/uoCDaSwyR/WFIqxc588u+pnVqOG8aKUU0
 IXMycbkBQN6Xg++mTLRT+Nu43IgRbHdhmOV1nEZPIcaqLMSykIyRnFP9ZCZMurPbIrq13ZaFr+L
 +B2q1ChcwwLQXUoGhuAPUqMvRf6p2IGEQ6//QsWs+aFROwfsbMgqE3bUlOQMmxJFQfyBm5aIcxL
 XA//JzBvoYba0ERn+1v98Ni5xQUYyCXRQZ/dBoSm2WSXD0uy1Na0JEHZJPyZ3/72LWAkyfrS24q
 ZiR/yDmboErZ1J42Q=
X-Received: by 2002:a05:600c:8b01:b0:477:561f:6fc8 with SMTP id
 5b1f17b1804b1-485269195afmr54757365e9.5.1772826795738; 
 Fri, 06 Mar 2026 11:53:15 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4852767dd5fsm55562025e9.1.2026.03.06.11.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:15 -0800 (PST)
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:15 +0100
Message-ID: <20260306195315.7959-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228194406.1906845-1-aperez@igalia.com>
References: <20260228194406.1906845-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826796; x=1773431596; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lmLWDy8dHEN65UTLzDVZW0OhgADiYVkIWYIVB8itUG8=;
 b=WQ6kqks9mI7RrTcbrD05JEaN4eM7rX8HoPil5c3V4cpY0m+HPhkFLl4ZYS2PTGX7Hf
 pl4256tBBJHOlTWHL3s5ju86NSTVGfWxm8VJikT4ZwugAz/iCzX7A8LjFEYwnyeQm9Eo
 1sheMr5aX69uSwSY2MaSHRAcNZSrCUJ6/ki9uJflMrtiNFKj3WBkI5+cJfsKtT8tx6Qp
 yWAOldm5U+v0ydzWcdUArYZMQQ8yUk0QGe5IvB/4LLht0yLGipPfcBA93AyeWU8KS3XI
 /zEA1J3lQHgzdtZkHuSGnJQ7EEjkn/c2kZQf2bGQ9CoSR9ncw3gFdIpWUzlP4lxGCPwD
 FJ/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WQ6kqks9
Subject: Re: [Buildroot] [PATCH] package/webkitgtk: disable JIT for all MIPS
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
>  package/webkitgtk/webkitgtk.mk | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index d9aa48f024..161807bc5a 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -173,18 +173,16 @@ else
>  WEBKITGTK_CONF_OPTS += -DENABLE_JOURNALD_LOG=OFF
>  endif
>  
> -# JIT is not supported for MIPS r6, but the WebKit build system does not
> -# have a check for these processors. The same goes for ARMv5 and ARMv6.
> +# JIT is not supported for MIPS, ARMv5, and ARMv6, but the WebKit build
> +# system does not have a check for some of these target processors.
> +#
>  # Disable JIT forcibly here and use the CLoop interpreter instead.
> +# Also, we have to disable the sampling profiler and WebAssembly, which
> +# do NOT work with ENABLE_C_LOOP.
>  #
> -# Also, we have to disable the sampling profiler and webassembly,
> -# which does NOT work with ENABLE_C_LOOP.
> +# Upstream bug: https://bugs.webkit.org/show_bug.cgi?id=278559
>  #
> -# Upstream bugs: https://bugs.webkit.org/show_bug.cgi?id=191258
> -#                https://bugs.webkit.org/show_bug.cgi?id=172765
> -#                https://bugs.webkit.org/show_bug.cgi?id=265218
> -#
> -ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
> +ifeq ($(BR2_ARM_CPU_ARMV5)$(BR2_ARM_CPU_ARMV6)$(BR2_mips)$(BR2_mipsel),y)
>  WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON \
>  	-DENABLE_SAMPLING_PROFILER=OFF \
>  	-DENABLE_WEBASSEMBLY=OFF
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
