Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA474C54E67
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 20:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A319560F41;
	Fri, 15 Mar 2024 20:23:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ILLmJJQnBcat; Fri, 15 Mar 2024 20:22:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F4E1607BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F4E1607BA;
	Fri, 15 Mar 2024 20:22:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DA3D1BF30A
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 20:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95F3040291
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 20:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hsJ4TSg-lFji for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 20:22:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 43E2C40267
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43E2C40267
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43E2C40267
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 20:22:51 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-413ffe7ee4eso9105175e9.2
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 13:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710534170; x=1711138970;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sCEZBGGNyqcHiZMsakEF+ZW9UKGBtT+A6RS25v73en0=;
 b=QSKR/xpZo95syySBf9DDHxukQ+y58OaFilzl+s21gmjBhGV8RCkMvktETlEC8NJupN
 HGX3lP39cMXr1gHENcT9YJzN3+sr9bNV36t+Yg3SmerjkcT7OWCZxz8kH5Dd8fwtwFqQ
 aQbk93m3IMlmW7UxI4rEgx9MrXH0jQmBoKG5nlWOO70EFxQ4EHAMIo3TPKvIcHdr2kvB
 8ejWe7dh/UxsRpkDOvMXXStbkWmSipt+Saw/qHBOYQkFL4PHu4fu4LS8Vh8qIAmRHSHU
 0EU6DLUiBsmoy50Rh8xYkCSTNGkYjH/kvO2F4f14VZ4fPbBB/mea5lPeOwn/a2Dd6Nfu
 8kZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT/xyGDBdZ6AnTDAQrxaaivTPZrBcvgiGYpQLxMhAGyPIVuAXIBxoiudFuGLr5cU1Ifk0yzU1fj/ACCzLTNeK9xnUuqBnQcA==
X-Gm-Message-State: AOJu0YwxJ4I0+m6F7SAFJLA9gbleaPEwMCwNopYmDYHmFau9/k//Ibxj
 Vr7vEDpXkgAInECTYSmM4txiGvNsRg4tnLr+1azo9s1bZNO6q7rTniSWMtjHaS4=
X-Google-Smtp-Source: AGHT+IH+LqC6ADvJxiNu5yglkcY1IkNinDDFXRlOKY369sK85OMcT40QTdA/88rImImNuSZ8bktdjA==
X-Received: by 2002:a05:600c:1c14:b0:413:f7cb:75c1 with SMTP id
 j20-20020a05600c1c1400b00413f7cb75c1mr3592723wms.16.1710534169574; 
 Fri, 15 Mar 2024 13:22:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 fj14-20020a05600c0c8e00b00413385ec7e6sm9995058wmb.47.2024.03.15.13.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 13:22:49 -0700 (PDT)
Message-ID: <5ce797d5-f308-45a8-b962-76e5359fd466@mind.be>
Date: Fri, 15 Mar 2024 21:22:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: "Jeremy J. Peper" <jeremy@jeremypeper.com>, buildroot@buildroot.org
References: <20240312201413.781109-1-jeremy@jeremypeper.com>
In-Reply-To: <20240312201413.781109-1-jeremy@jeremypeper.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710534170; x=1711138970; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sCEZBGGNyqcHiZMsakEF+ZW9UKGBtT+A6RS25v73en0=;
 b=CXyEjb58TjncLsBx8Nm4hYM3Sdt89GPZwRUqlPVCIIPLtz3CE1PBAQirMS6TTfxTMW
 IkRv70bqIy/ybP97c9VEho0SdX26y4uhwAS1Jm59wp1igy+HT+O9g0wLB7db47nzVC7S
 kEeBGSyRJ+mYmrdr0M0t0tLO872Hbn3bZvUn7xA2anG9Y0xGlYbLRBNn7v3UwOx5FzX/
 M+N++SkwtJJeaCFpumcer5u4BieaqGVyjEU8QJVt3wYiFDvmGRblr+Jzr4U+G00ZQzj3
 cNMa3iCISuMJglEIMxUhhEVqqYWeMjsq8ojelDW2AUHgtpsxazEAhWyj+ID5PLSbt6QZ
 04Mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CXyEjb58
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Jeremy,

  Thank you for your contribution! I've made a few minor changes (see below) and 
applied to master, thanks! You can look at [1] to see what it ended up as.

  And thank you Adam for your effective review!


On 12/03/2024 21:14, Jeremy J. Peper wrote:
> add python-gobject to resolve "ModuleNotFoundError: No module named 'gi'" error encountered if built without it.

  The commit message should be wrapped at 72 columns. I ended up rewriting the 
commit message completely to fit more with how we usually write them.

> add python-gobject's dependencies as well
> and comments to that effect
> 
> Signed-off-by: Jeremy J. Peper <jeremy@jeremypeper.com>
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

  I see you copied that exactly from python-gobject/Config.in - it's fine to do 
that, but I took this opportunity to reorder everything alphabetically.

>   
>   config BR2_PACKAGE_TARGETCLI_FB
>   	bool "targetcli-fb"
>   	depends on BR2_PACKAGE_PYTHON3 # python-configshell-fb
> +	depends on BR2_USE_MMU # python-gobject
> +	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # python-gobject
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject
> +	depends on BR2_HOST_GCC_AT_LEAST_8 # python-gobject
> +	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject

  Same here, I ordered them alphabetically. I also added
"-> gobject-introspection" at the end of the comment, to show where the 
dependencies really come from.

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

  I've taken the opportunity to split this over multiple lines (one per 
dependency) and also sorted alphabetically.

>   
>   define TARGETCLI_FB_INSTALL_INIT_SYSV
>   	$(INSTALL) -m 0755 -D package/targetcli-fb/S50target \

  Thanks,
  Regards,
  Arnout

[1] 
https://gitlab.com/buildroot.org/buildroot/-/commit/945b9f8d8e9704fd3d2dbd2579ebf9178ed49d89

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
