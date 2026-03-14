Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E898D107BCFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BECAA60F23;
	Sat, 14 Mar 2026 07:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2ZtbqfiXz_K; Sat, 14 Mar 2026 07:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6E1760F26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474810;
	bh=30t42dHw7iMSt5IONfhZm7XTRkA7j0DGpfibVGhYxgE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PuNUMjD6QpFNrlWGBo3H69Lv+3pe8H8cREoVFkhNfmihPdOWPgSqMQTugYrtSHqKI
	 9912uJuNJDrdy1e36VRIycDe36WxJCfXF7uftAVyGIUztyM+tTJeqa44wVPkRjoaXs
	 0u1MnLApsNQQQBti7xAIFkjJaHeMnlMr2hhWTyHgt93n73A1HqD8MCqZw5HO4RMZex
	 eGtKfSerjmYJe7Q+61Ls0WKChNI7T9nl5YAnWPfdrBBzXhBlgumvMCCZhDZocP7XHn
	 wWtLuahlz1pW7Q7IZhTlanqOHlQMpKNmKi3NCotMNLBEQgIwf6YRqmO7ZDmMNyiUiZ
	 q1enJVgl8/3kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6E1760F26;
	Sat, 14 Mar 2026 07:53:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14ACA201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE21A407AE
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5IKGHKFJtKU for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:53:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B514440785
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B514440785
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B514440785
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:53:25 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso26020985e9.3
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 00:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773474803; x=1774079603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q1+1EM9JQoEFcp6MutQFO+Kv+kEYxmVCOjBBxbtEk9g=;
 b=VEdT9whXBc7lJUkyQv3ZvxF1IUpgI6fGrUF4Apc88PhvQqXCrbrX0agNQF2tr89S1Z
 QkCtW7vXN1iapx9IeYJn316k68XmGxfs2tbkthPrUggi/ytPxZh05+kW6utwyq7paCf9
 v0utgFY2R7LYJZqd6IffRpESFREt3+Tw1Qi1PzV7bJh1ro/4Lu9qufn72PwaR5KwfRoF
 76TulBFxNjwX9xRDzdQjAHF9Ep6fvoc9pfPpOyd9KFfD5FYcjYwjBNKAAIDxLo2NdOsS
 wJxMfkbm/YtmZUJb/6vCUy3zmPa7PzZGrLMlwhDoE9MlfhaRpPHktpm9rIWbnE0fTBpD
 qvDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjFTxpqOqbTf3KqcUhMRCk7z6g2miejdEP9DMjsUti2LAgtMPKdkZK5LxgtaofN+XBaA5Qsecx14k=@buildroot.org
X-Gm-Message-State: AOJu0YzX+yh4HUEYcvlWbzsI4SN/pmyIgqDCEPHPw28GTuIdRDLE1QM6
 G40+fcKRqoUMySMylAW8GTYUbrn43qhM+1wMYN1LJmJcHA2jf4GlwHswtvxsLzLMWog=
X-Gm-Gg: ATEYQzyb9fNQ0/iTTJU9feQ729nvXuKx8uHlrjiD9BU1chnt0WJfGwjrtpKWVDErCJv
 jfDLVISDsxCrizfwu09MCtPNflNwQpw+MD9Ay+HK6ofIZfTaSSaizDsUChCzVgqsrO10HN8rz5z
 tL7IL6WrdfFytzYvKItUAjAlLJepSxq1/Rq58mQu8qefVLx8O9buF0Hpw71gKwk4SA/DqRY/yKo
 XKJe28Rh8UMD9j7TqS+m6ljuHQRyR914WYsEdCFN8YANW4Ms0OEHi3s7e/59buKeLgeeKBoDv/P
 A5SATCtlaGHJxwR28ByTjoRhVCoYe8K9+bA8i5sBQsi/aAB7ReBilbis5I/DDJnauNJ1z2TXmH0
 QI+cYbbSZN8lt20ySGBr2qdWcteN697LbSFw5LKhTLAVxsOsg60oeWZyVpOf6Z0zjQLRDvKMTg6
 dFCLupdZs1B0GbDV0=
X-Received: by 2002:a05:600c:1d2a:b0:483:a27e:6706 with SMTP id
 5b1f17b1804b1-485566d4e69mr111077865e9.9.1773474803261; 
 Sat, 14 Mar 2026 00:53:23 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b66ffe2sm243666735e9.13.2026.03.14.00.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 00:53:23 -0700 (PDT)
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 14 Mar 2026 08:53:22 +0100
Message-ID: <20260314075322.14664-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304074234.15910-1-chakrabortyshubham66@gmail.com>
References: <20260304074234.15910-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773474803; x=1774079603; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q1+1EM9JQoEFcp6MutQFO+Kv+kEYxmVCOjBBxbtEk9g=;
 b=ZcEFl9ixmKAItMW7nzGOeHrNWL+u2U+1Znq7dI4Fi4BaowmNzGDi/ga5EEaVG3pJhs
 Yvlxzr30rg5CJeC3V6lLhqzJvjsyVDHYjqC5xa3ijJO5D+dsioVwL4wCLLAQrHqPXPcS
 GSwQwQwCcvwYFDnvWwFHBqtliHqaitnZRIHBcmVJOQFLC78d9XfaPoYSfnz5JRf+tO51
 QMRw3QSBY8r1R9i1aRqNQigN+BDbnSSc4M3oJLBE2ABUTQEsnFjU0wvVRB802R1oc7SE
 1g7eYsc+Zw0RG3pW24zdV7ujTraKFaJVvMHz/HlhVvzUIXZ5GJB4WOpo0lBv9tjBBL3z
 P5jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZcEFl9ix
Subject: Re: [Buildroot] [PATCH] package/python3: remove nis and ossaudiodev
 modules
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
> These modules were dropped in Python 3.13 as per PEP 594.
> The current version in Buildroot is 3.14.3.
> 
> - Remove the TODO and related config overrides in python3.mk.
> - Remove BR2_PACKAGE_PYTHON3_OSSAUDIODEV from Config.in.
> - Add BR2_PACKAGE_PYTHON3_OSSAUDIODEV to Config.in.legacy.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to 2025.11.x & 2026.02.x. Thanks

> ---
>  Config.in.legacy           |  6 ++++++
>  package/python3/Config.in  |  5 -----
>  package/python3/python3.mk | 12 ++----------
>  3 files changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index a2a7b06a6d..9a9f83eb36 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,12 @@ endif
>  
>  comment "Legacy options removed in 2026.02"
>  
> +config BR2_PACKAGE_PYTHON3_OSSAUDIODEV
> +	bool "python3 ossaudiodev module removed"
> +	select BR2_LEGACY
> +	help
> +	  The ossaudiodev module was removed in Python 3.13.
> +
>  config BR2_PACKAGE_QEMU_TARGET_CRIS
>  	bool "qemu cris support has been removed"
>  	select BR2_LEGACY
> diff --git a/package/python3/Config.in b/package/python3/Config.in
> index 423e5daabb..f9d3d3aaa2 100644
> --- a/package/python3/Config.in
> +++ b/package/python3/Config.in
> @@ -76,11 +76,6 @@ config BR2_PACKAGE_PYTHON3_DECIMAL
>  	help
>  	  decimal module for Python3.
>  
> -config BR2_PACKAGE_PYTHON3_OSSAUDIODEV
> -	bool "ossaudiodev module"
> -	help
> -	  ossaudiodev module for Python3.
> -
>  config BR2_PACKAGE_PYTHON3_READLINE
>  	bool "readline"
>  	select BR2_PACKAGE_READLINE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index a240349d3e..07cba7c02d 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -28,7 +28,6 @@ HOST_PYTHON3_CONF_OPTS += \
>  # Make sure that LD_LIBRARY_PATH overrides -rpath.
>  # This is needed because libpython may be installed at the same time that
>  # python is called.
> -# TODO: nis and ossaudiodev modules will be dropped in 3.13: https://peps.python.org/pep-0594/
>  HOST_PYTHON3_CONF_ENV += \
>  	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
>  	py_cv_module_unicodedata=yes \
> @@ -38,9 +37,7 @@ HOST_PYTHON3_CONF_ENV += \
>  	py_cv_module__codecs_jp=n/a \
>  	py_cv_module__codecs_kr=n/a \
>  	py_cv_module__codecs_tw=n/a \
> -	py_cv_module__uuid=n/a \
> -	py_cv_module_nis=n/a \
> -	py_cv_module_ossaudiodev=n/a
> +	py_cv_module__uuid=n/a
>  
>  PYTHON3_DEPENDENCIES = host-python3 libffi
>  
> @@ -176,17 +173,12 @@ else
>  PYTHON3_CONF_ENV += py_cv_module__zstd=n/a
>  endif
>  
> -ifneq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
> -PYTHON3_CONF_ENV += py_cv_module_ossaudiodev=n/a
> -endif
> -
>  PYTHON3_CONF_ENV += \
>  	ac_cv_have_long_long_format=yes \
>  	ac_cv_buggy_getaddrinfo=no \
>  	ac_cv_file__dev_ptmx=yes \
>  	ac_cv_file__dev_ptc=yes \
> -	ac_cv_working_tzset=yes \
> -	py_cv_module_nis=n/a
> +	ac_cv_working_tzset=yes
>  
>  # GCC is always compliant with IEEE754
>  ifeq ($(BR2_ENDIAN),"LITTLE")
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
