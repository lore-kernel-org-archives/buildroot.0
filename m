Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2ED9CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD951615C3;
	Fri, 29 May 2026 08:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SU9Rda7Z-96F; Fri, 29 May 2026 08:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5FF4615CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043441;
	bh=f3qeGLQicN4YRD4W5FqU7iy8yPxcDCCWKQC+XvvhPX8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xl+PeeM7PEDJ5SbMfirfuz5aneZ/Ku16vkbH8PlfZdcefDtZt05RcR5Gq6dajbW8N
	 P5lcvEJ0iFKJ+RjUPqzw52+py2SnsZc4CTktE/z3pYEyoGkeG6D3KYuYyENVxgNzjC
	 dLR578TUsgWxv3FhuOx7qVpQR3qh6Rk3J9rDWa5gBjUaL9gtYYJr8fQigif5tL71kl
	 4muekpEWj5TExdw12kO3TS4UGtrYPUPsobBM4PdmkixUC6pcHBH60yB0rvASjM/lUq
	 R5LBw2ewivYu47JcSDsFhLowQmnk3rVKaICImL7l53UKEv+HdYERYu0d9bd426ZiAz
	 6rF4Ic9B9f/GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5FF4615CB;
	Fri, 29 May 2026 08:30:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2851288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C17A442343
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xetFQiRLIc9a for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9D9E142331
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D9E142331
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D9E142331
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:28 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-45ef42dfb26so58456f8f.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043427; x=1780648227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0kdYeOXhre0r5C4ICqgo8HfSJNntjGW/Pomdg9kHKYs=;
 b=VItmKRpdFHYzXislXKJ/XMnY5qaCQSY0jZZtfzP4kmfa3yX/Y55r0RA9ZvwXguhHbI
 /8rFpdfisPZq32ATf7yWh3zo46UhXIB8DjKlwFLJibt0HlK5cdfQ0I/L+NBLJh5wGCjJ
 mDltIJAF3yfcvEWEbUqZd1ryENhYiXcL9f29ecCYp5/Lfkid9dpVd6jMcTZxeIC3DYFR
 Dm1eULIUGXNi5Ptx5CWEzRFib1UbZLgs+G922h2FH+QJh7BN05f/DDFJcVgoIElODjfv
 7WERGn9G55Z/Mu6lgJRysnm+PlTX8Q2goMYhf90cRiocxmRmMNueiGFGZrXWzPNFmQ8b
 6y2w==
X-Forwarded-Encrypted: i=1;
 AFNElJ85e6TKXar0d+kI1Mjs7gY7cCUwfXfd1eYbt6L8aikc1KIQujcDtaG9LyEEQz53BkThCi2UN24vcVk=@buildroot.org
X-Gm-Message-State: AOJu0YwJmufU7MSbyxzIdZCd35hYkh5nRT8FAWPQf/mlo1L6758vwC9F
 B8guE1kF+ndYiJwQq4F8BNhuLltB5phzAf5pzcbt/zrAze2r3c0EOOgo6MLK6E+QYxlIbFh1vuK
 WAGQj
X-Gm-Gg: Acq92OF/kec0RiaDLKIRDGFtxlNgjU8XrKU4HH0NGASDaPSljMFrClUKFggk2i6OwNe
 IQM+uEnQLj1RMvQm/+VuKgDJNAbWYP+G2Eas5fBhr3EFdk8X4wBDUWJQPtn+9XYt7jfiG5Kmfqr
 XDViLcKt+QjoYp7QyArQWpiRLuZJbden0hlya3iNpPJlSa3KcEh/g8oKVwz6qnVPu5l6xEBCggB
 5x2eoNOHqk52BrnIPiLPIRV+QSGS59/Z5zTSVh4py5Xf3JsZGXYKsB+9LDhfwazqSbflyeLfsJ6
 Q9iUGeBdyCekhPGMvvbSlAmXsMJn4cwV40zq9uAVa9sWgFYcRwHnaMtMWZJdIxbVp+A783rOxdx
 k2W/vHXJhcFnEhGibmEdsABaRQIr0ZNj/j+ioxHyKasKoJwqyTrTSAxM3gEHVYuJoEVMrpQlCh7
 fZVdR5PyzWumtCC2nGVn0+hCi35SlZg0BFi61qHVdTIn7C+iLWxW3Y1wJwIg==
X-Received: by 2002:adf:e5c6:0:b0:455:fbb:28bb with SMTP id
 ffacd0b85a97d-45ef145c28dmr2401971f8f.35.1780043426599; 
 Fri, 29 May 2026 01:30:26 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354cd7csm1760468f8f.18.2026.05.29.01.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:26 -0700 (PDT)
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:25 +0200
Message-ID: <20260529083025.59604-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260515-virglrenderer-v7-1-1f1814b65ccd@gmail.com>
References: <20260515-virglrenderer-v7-1-1f1814b65ccd@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043427; x=1780648227; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0kdYeOXhre0r5C4ICqgo8HfSJNntjGW/Pomdg9kHKYs=;
 b=Dw4g0iXLvvecYXsboiV4ZaPh1w0iOfuTXBJV6Uhvqsu9X0mV6exmrk6am2EGH9SGzF
 LlrzVeASJ4XwZ8k+AMLLUuoVBHHFCpuvTzrED5SRJj17A+JXog8DdYUQ3Vx0VCwg6Qlq
 4EYNYS0744dA58E5TBJNzPpSiaerxtVoauzyRisYhlFEPu8zJK+HSEpZXuVC8KVNXyXx
 sjZHZDpACEBLIOWxQfZ5iyITAZTsji/yxRkv5v5AVwrUPVrmHyDGLPpOrbkw5z3SgvxN
 c0IWFiRt8E2UHo2kZfmjRrgoIiRY2HGU47wRgyaW4f02BYdRT1QK4mfTJPbWlyS+rHZI
 OtyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Dw4g0iXL
Subject: Re: [Buildroot] [PATCH v7 1/8] package/weston: add EGL dependency
 for XWayland
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
> BR2_PACKAGE_WESTON_XWAYLAND currently depends on BR2_PACKAGE_LIBEPOXY,
> which implicitly requires either libGL or libEGL. However, the XWayland
> glamor support uses libepoxy with EGL, so express that dependency
> directly.
> 
> This avoids relying on libepoxy's package-level dependencies to provide
> the EGL backend.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/weston/Config.in           | 6 ++++--
>  package/x11r7/xwayland/xwayland.mk | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index 774b75d5fb..6f61c3c561 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -123,6 +123,7 @@ comment "X11 (nested) compositor needs X.org enabled"
>  
>  config BR2_PACKAGE_WESTON_XWAYLAND
>  	bool "XWayland support"
> +	depends on BR2_PACKAGE_HAS_LIBEGL
>  	depends on BR2_PACKAGE_LIBEPOXY
>  	depends on BR2_PACKAGE_XORG7 # xwayland
>  	depends on BR2_USE_MMU # xwayland
> @@ -136,8 +137,9 @@ config BR2_PACKAGE_WESTON_XWAYLAND
>  	select BR2_PACKAGE_XLIB_LIBXCURSOR
>  	select BR2_PACKAGE_XWAYLAND
>  
> -comment "XWayland support needs libepoxy and X.org enabled"
> -	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_LIBEPOXY
> +comment "XWayland support needs libepoxy w/ EGL and X.org enabled"
> +	depends on !BR2_PACKAGE_HAS_LIBEGL || !BR2_PACKAGE_XORG7 || \
> +		!BR2_PACKAGE_LIBEPOXY
>  
>  comment "XWayland support needs a toolchain w/ threads, dynamic library"
>  	depends on BR2_USE_MMU
> diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
> index 8fa5260f47..5902f85d4f 100644
> --- a/package/x11r7/xwayland/xwayland.mk
> +++ b/package/x11r7/xwayland/xwayland.mk
> @@ -30,7 +30,7 @@ XWAYLAND_CONF_OPTS = \
>  	-Ddtrace=false \
>  	-Ddocs=false
>  
> -ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_LIBEPOXY),yy)
>  XWAYLAND_CONF_OPTS += -Dglamor=true
>  XWAYLAND_DEPENDENCIES += libepoxy
>  else
> 
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
