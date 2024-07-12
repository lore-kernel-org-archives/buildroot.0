Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A593C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11A1B8408D;
	Fri, 12 Jul 2024 19:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5xlKxcCe6B4; Fri, 12 Jul 2024 19:52:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 041FD84198
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 041FD84198;
	Fri, 12 Jul 2024 19:52:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43BDD1BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3137660655
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oO64ZilgBgiM for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:52:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CC30560648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC30560648
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CC30560648
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:52:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4266ea6a412so16294495e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720813965; x=1721418765;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k57q8wXF6j0y/qiDgx3+zHF40Z0AMJ8Vmptxrf3JLls=;
 b=Fx9b0tHXalEHIJYXnEzDUwH3AkOqbI91Jyz7kPSgGHatyXhYaQhtofAJyapgj4tVn9
 GMPegI8+YmmIqkVz0X+spFjrQfhvL3webbfHkIUQqO0TIfzs7TB6R7s8A6fFExUNY9C3
 0vvuLD4zEwU6o3WYvQKQaV7/pU0KyC4aJpPROmEoOiYNhXhXb9yGSkH1q7kqTtsMgWyC
 1Eql09O84J6YuyKrlBJu/QVYAqw+DsNh/stVGDtYdhjxz0pAVIJ9+rpMtfUnZlYU/isa
 QYiWj3tI9pEhsxmY1DgzBgtSEA7kX1SWJcsfVlx5Bk4A0h+AjzvwVqRuUSjPmopusI8Z
 0xUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy8wkKF25+6wmofFCRgTjQn7KfXXKHBm0ol/y+lmSvNK1ylwcAp0hp3Tio+4QtElIAbfeiHPHnFlHXDwCDmY911/tzqkwU6g==
X-Gm-Message-State: AOJu0YxM8FaMTSe7FPVMJSZ8/KzmLi11oTbqCMJ2PxMi4FNjp5prg4nQ
 0PbpASy67JG7eCryIUq8oVXOMHId6dVyJH4L/7Y2qD3NLxBkGjb4+KqHF+4gHfYza25XrvpY0+T
 lVlY=
X-Google-Smtp-Source: AGHT+IHo2TW5vSPW+4y78YOjNH+Iwr1iAv2lmJNAQS0gKe8sIBhOaA24cPIbV4zD5R7ZRH10wqUOjA==
X-Received: by 2002:a05:600c:2247:b0:426:5dc8:6a6a with SMTP id
 5b1f17b1804b1-426707d7fd6mr85835105e9.21.1720813964797; 
 Fri, 12 Jul 2024 12:52:44 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfb228csm10819786f8f.114.2024.07.12.12.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 12:52:44 -0700 (PDT)
Message-ID: <554e5ab9-95a0-4258-b4d4-80aebd0fab3b@mind.be>
Date: Fri, 12 Jul 2024 21:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <ZN4z+n37WMFvHgsF@waldemar-brodkorb.de>
Content-Language: en-GB
In-Reply-To: <ZN4z+n37WMFvHgsF@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720813965; x=1721418765; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k57q8wXF6j0y/qiDgx3+zHF40Z0AMJ8Vmptxrf3JLls=;
 b=KBSbhyiCT4zcoH4VR/8iKBSUUD8G/KW/GqPI3NrxkEtii124EuaGI07q7Jq2xdVeHG
 q6GlBmnd4gDsNB9EOTB0NxB/cfuyz+M0bKYP6m9SOdUbuRw6FmDz2kMj2AMEckW49fQe
 /Ef/X7GD8A+VBUdjToCTcy5v6JoaoNcx7cpnnkMcYht1bjYD6x4zgRCkYEVW27AyIF6S
 fdggsNSS2MYXBOC3CZ9AI6J42AZ6ctaQhu4JC/KA0jTevbtUytGq99be6HYlC3ms52Rn
 MdWJAXifni8SHoudCkwAhFO0RNNvfFGH+nb8dRIj0xAcsPmjewKTmTjrPiw7u1VVRb5x
 XNxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KBSbhyiC
Subject: Re: [Buildroot] [PATCHv2 2/2] package/tcf-agent: fix uClibc-ng
 compile on ARM
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
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/08/2023 16:51, Waldemar Brodkorb wrote:
> When a shared build is used, we can use getauxval and no ARM only
> instuctions are in use.
> 
> When a static build is used, we need to override CFLAGS to use
> arm instructions, as uClibc-ng only supports getauxval for shared case.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/3b5/3b5c5519a3e5ee490308bc1a1b9579ce13417235
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> v1 -> v2:
>    - musl is not affected, change requested by Thomas Petazzoni
> 
> ---
>   .../0001-fix-uClibc-ng-compile.patch          | 27 +++++++++++++++++++
>   package/tcf-agent/tcf-agent.mk                |  7 +++++
>   2 files changed, 34 insertions(+)
>   create mode 100644 package/tcf-agent/0001-fix-uClibc-ng-compile.patch
> 
> diff --git a/package/tcf-agent/0001-fix-uClibc-ng-compile.patch b/package/tcf-agent/0001-fix-uClibc-ng-compile.patch
> new file mode 100644
> index 0000000000..b8f46f3c48
> --- /dev/null
> +++ b/package/tcf-agent/0001-fix-uClibc-ng-compile.patch
> @@ -0,0 +1,27 @@
> +From a78007cd139e1dea3d893f5fe1d1c3a47503e6a2 Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Sat, 12 Aug 2023 18:27:02 +0200
> +Subject: [PATCH] fix uClibc-ng compile
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +Upstream: N/A only mail available
> +---
> + agent/machine/arm/tcf/cpudefs-mdep.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/agent/machine/arm/tcf/cpudefs-mdep.c b/agent/machine/arm/tcf/cpudefs-mdep.c
> +index 051631a0..7c4fbf3e 100644
> +--- a/agent/machine/arm/tcf/cpudefs-mdep.c
> ++++ b/agent/machine/arm/tcf/cpudefs-mdep.c
> +@@ -21,7 +21,7 @@
> +
> + #ifndef USE_getauxval
> + #  include <features.h>
> +-#  define USE_getauxval (defined(__GLIBC__) && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 16)))
> ++#  define USE_getauxval (defined(__GLIBC__) && (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 16)) || (defined(__UCLIBC__) && defined(__HAVE_SHARED__)))
> + #endif
> +
> + #include <stddef.h>
> +--
> +2.39.2
> +
> diff --git a/package/tcf-agent/tcf-agent.mk b/package/tcf-agent/tcf-agent.mk
> index 2b8a61b66f..7c25df864a 100644
> --- a/package/tcf-agent/tcf-agent.mk
> +++ b/package/tcf-agent/tcf-agent.mk
> @@ -21,6 +21,13 @@ TCF_AGENT_CONF_OPTS = \
>   	-DBUILD_SHARED_LIBS=OFF \
>   	-DTCF_MACHINE=$(call qstrip,$(BR2_PACKAGE_TCF_AGENT_ARCH))
>   
> +# tcf-agent uses some arm instructions in case getauxval is not available.
> +# unfortunately the uClibc-ng implementation of getauxval uses some features
> +# of ld.so to work
> +ifeq ($(BR2_STATIC_LIBS)$(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_ARM_INSTRUCTIONS_THUMB),yyy)
> +TCF_AGENT_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -marm"
> +endif
> +
>   define TCF_AGENT_INSTALL_INIT_SYSTEMD
>   	$(INSTALL) -D -m 644 package/tcf-agent/tcf-agent.service \
>   		$(TARGET_DIR)/usr/lib/systemd/system/tcf-agent.service
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
