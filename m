Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5266AC54E58
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 20:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F27B060F89;
	Fri, 15 Mar 2024 20:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m7nddqADzdUK; Fri, 15 Mar 2024 20:24:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 336A360F41
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 336A360F41;
	Fri, 15 Mar 2024 20:24:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16CE71BF30A
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 20:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0377582387
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 20:24:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPeh4nA6wgoi for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 20:24:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C10CC8238E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C10CC8238E
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C10CC8238E
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 20:24:46 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-413f76fcf41so15586105e9.3
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 13:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710534285; x=1711139085;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=06v08UGvepmFBYkcSdGYi1FCIek6T0pNkgjEBYencJc=;
 b=gXdhepZQdPbfgAs/xSy8KXnLa9eHtxd50DlzP27u95TTfAQOU1yza67aX5Xv8lUbt7
 oXDQ1DVbv+MBujTwjxz1MJpg3C64D81DhQ9uFmJHFriZBhK3mBHs2KhnRfmnGtGPqcx/
 wC4p/2CXg0i/p5w85iEgIG3z5QcxRdCREIEduURNZTTyzeFvowaXuDNEXCLdAVtVMsXf
 UXMROoDxKN8QogHvN9LK28vlfXptu34fsyIh66qWCYLm56iI1b9sZ9S69uRn9i6m0sTu
 wNJDU88w8jM4V/3a6DrPM/xohYAksKgjejvgPqswTF6leySsj0K715H63BEoQ2Mxhbyc
 4B0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIhO6/i2PjMLoYE8gcy0pBu/F39FsRMzEQZoARdJN6Sp0NSkvR5oU9/EDFXbCoVyNSu511ZpHGhSyk2YboX40ZRdBonXpKQg==
X-Gm-Message-State: AOJu0YxFjzuDGLIjJZhafrU01dE0JhMms9bgaa6YIqgKtd1oEHbzJNR+
 /VBeQ88Equ/xivaYCOZ5+IfsE/CNRt/GFXVmUP9M48TA0yM3M4x0AxB2vylwnZc=
X-Google-Smtp-Source: AGHT+IERMFv1/TuUcqM+lkiew1bmWzqYbW40yQs2e55xXZ1GNS4Zbe8bI5P6tT+pFOqpWPjZrYuhxg==
X-Received: by 2002:a05:600c:458d:b0:412:e38a:d83e with SMTP id
 r13-20020a05600c458d00b00412e38ad83emr4538183wmo.5.1710534284538; 
 Fri, 15 Mar 2024 13:24:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 e21-20020a05600c4e5500b00413ff10595csm3752981wmq.45.2024.03.15.13.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 13:24:44 -0700 (PDT)
Message-ID: <69789c81-ff85-42db-8bfd-9fcdff835565@mind.be>
Date: Fri, 15 Mar 2024 21:24:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: "Jeremy J. Peper" <jeremy@jeremypeper.com>, buildroot@buildroot.org
References: <20240312201413.781109-1-jeremy@jeremypeper.com>
In-Reply-To: <20240312201413.781109-1-jeremy@jeremypeper.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710534285; x=1711139085; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=06v08UGvepmFBYkcSdGYi1FCIek6T0pNkgjEBYencJc=;
 b=e3Dfva8A7Q6JjJkThN4ZN5LGdASkGU0jNzI06iWFV9ioyTPDKh0Af3xc+RplQ+HEvk
 H4w1ZDYDD95rEn1/qJ7gNNVjz0dLXvoNT1MJmUyW6+CSsdXUpfamHtRATs3Uur1zMKla
 QLJKJ/JAvxpMErjKNVOw9XwaIWTbCRrspvYlSssnW4nN8dtpVQsrPrmXwXcdq49vIYa8
 q0M3OmhwRXzgu3ybaql+kJoH90Tg9+i7ZTO1BhX1I1zTImQHr5ZXGqoDQFXjHNPA6NRl
 eGVap8WUyL1OGzMoR1HlWbKpnhrGGdbPnC3O+UNHt7un7y2Ik0AHn1zSgNIIkEs/Hr+r
 9WGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=e3Dfva8A
Subject: Re: [Buildroot] [PATCH v3] package/targetcli-fb: needs
 python-gobject
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/03/2024 21:14, Jeremy J. Peper wrote:
> add python-gobject to resolve "ModuleNotFoundError: No module named 'gi'" error encountered if built without it.
> add python-gobject's dependencies as well
> and comments to that effect
> 
> Signed-off-by: Jeremy J. Peper <jeremy@jeremypeper.com>

  Something I forgot to mention: in the future, please add a patch changelog 
below the --- line. See [1].

  Regards,
  Arnout

[1] https://nightly.buildroot.org/#_patch_revision_changelog

> ---
>   package/targetcli-fb/Config.in       | 13 ++++++++++++-
>   package/targetcli-fb/targetcli-fb.mk |  2 +-
>   2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/package/targetcli-fb/Config.in b/package/targetcli-fb/Config.in
> index 04c6a1ac..57b1a7cd 100644
> --- a/package/targetcli-fb/Config.in
> +++ b/package/targetcli-fb/Config.in
> @@ -1,12 +1,23 @@
> -comment "targetcli-fb depends on Python"
> +comment "targetcli-fb depends on Python, needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
>   	depends on !BR2_PACKAGE_PYTHON3
> +	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
> +		!BR2_HOST_GCC_AT_LEAST_8
>   
>   config BR2_PACKAGE_TARGETCLI_FB
>   	bool "targetcli-fb"
>   	depends on BR2_PACKAGE_PYTHON3 # python-configshell-fb
> +	depends on BR2_USE_MMU # python-gobject
> +	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # python-gobject
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject
> +	depends on BR2_HOST_GCC_AT_LEAST_8 # python-gobject
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject
>   	select BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
>   	select BR2_PACKAGE_PYTHON_RTSLIB_FB
>   	select BR2_PACKAGE_PYTHON_SIX
> +	select BR2_PACKAGE_PYTHON_GOBJECT
>   	help
>   	  targetcli-fb is a command-line interface for configuring the
>   	  LIO generic SCSI target, present in 3.x Linux kernel
> diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
> index d2cbf79e..dbe36e59 100644
> --- a/package/targetcli-fb/targetcli-fb.mk
> +++ b/package/targetcli-fb/targetcli-fb.mk
> @@ -12,7 +12,7 @@ TARGETCLI_FB_LICENSE = Apache-2.0
>   TARGETCLI_FB_LICENSE_FILES = COPYING
>   TARGETCLI_FB_CPE_ID_VALID = YES
>   TARGETCLI_FB_SETUP_TYPE = setuptools
> -TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb python-six
> +TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb python-six python-gobject
>   
>   define TARGETCLI_FB_INSTALL_INIT_SYSV
>   	$(INSTALL) -m 0755 -D package/targetcli-fb/S50target \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
