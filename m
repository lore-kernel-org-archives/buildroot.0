Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E8AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 20:00:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFF1160F9B
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 20:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFF1160F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8603A80F07;
	Tue, 26 Oct 2021 20:00:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rdv6k2LVvWmn; Tue, 26 Oct 2021 20:00:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2EFE80ED1;
	Tue, 26 Oct 2021 20:00:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6396C1BF20D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 20:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 531AA403AF
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 20:00:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 83rlnUhoy0XA for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 20:00:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 390B34025A
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 20:00:01 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id s1so1165428edd.3
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 13:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Rt+waepgcpxOP2Y606k+wU61b8uQKPYiQgD6mAwuMVI=;
 b=RhT1aJExl2EnRXrfjyFw99yQ7lxX1vs2FwHsFf2EhDbdRuoaHa+z0jiJKzpwtkbtfM
 GlYIUdKldKQNVW15DpaF+6j/tuIMIFZaNelsLIgcTgUpjVSZKCAnp2Z37H+ETzTIFXN+
 yXUKL7wG+ISUHQ2z+LzvA1mIVYJ9UplnSpGlWC+D5hzKqxAu3lodxA54uMLpbwTLW+jl
 GUyMC+rC6RTJ87lx2+YZXhFQQrl2hnZUdIu1r1TJpn3W6PMQwdcqmnd6zutj1pAocpSg
 NTdj8RRW9WK/6K+cj89b3bgOuEj3uVld7YJdImr2Hl7XjZeuEhrcIvNSx61sXQKA7l8w
 pUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Rt+waepgcpxOP2Y606k+wU61b8uQKPYiQgD6mAwuMVI=;
 b=ftLgREi0Fu777di/ZyuD+Gv1AF3Qv4nEBW3O29zAGq/36lLdbhqrHB3709i0TCTH17
 W5DB0VQC3btTyugc8+HR8jMiN6lpUAuO+I21+DIvizG+m6DM+vw7WJa355Fs/w/DgrwG
 YfDuxJ0xOHuIfFiEesnOM9UkWCdIcADMTwDAV4v3HvwS1ayvjYfmGal6hMngzRc/DSgK
 njQXbB5Ar1f21qXtAgrZCmdEZ6oidMOnNIKZgFcRbL67md69s699VNIr/Nc6zkbX/dXq
 KfVCdtlguClPLdxqr70h8lRxMEyBH9JbN9pRW1hKtezBjIutlJLJbir3YxJ/SIe6PcNS
 K3bg==
X-Gm-Message-State: AOAM530EYyQmEO8LLgoUHW85lXtQKHGA7d54g8YtBfLy6NACfAModBnX
 +YLN8tslWB9astVmsfwVe9UWodsCZnV/XQ==
X-Google-Smtp-Source: ABdhPJzrT98E/cmeIzaWTBNTn+p0ilqMXYeqMl1vE4mh4R4MyJFUBHyy5+Dc+erZND8Wz/xTxGxaiw==
X-Received: by 2002:a05:6402:1499:: with SMTP id
 e25mr18723988edv.263.1635278400378; 
 Tue, 26 Oct 2021 13:00:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g26sm4960262edt.13.2021.10.26.12.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:00:00 -0700 (PDT)
Message-ID: <f85a9e69-ce9d-904a-77ee-87b55855959c@mind.be>
Date: Tue, 26 Oct 2021 21:59:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Richard Palethorpe <rpalethorpe@suse.com>, buildroot@buildroot.org
References: <20211021112358.8769-1-rpalethorpe@suse.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211021112358.8769-1-rpalethorpe@suse.com>
Subject: Re: [Buildroot] [PATCH] package/ltp-testsuite: Add Open POSIX and
 realtime test suite opts
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
Cc: io@richiejp.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/10/2021 13:23, Richard Palethorpe via buildroot wrote:
> During LTP and/or kernel development it's very rare that I want the
> Open POSIX and the realtime tests. Open POSIX in particular takes
> considerable time to build. So this adds the option of disabling them.
> 
> They default to on so as not to break existing test automation.
> 
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> Cc: io@richiejp.com

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ltp-testsuite/Config.in        | 16 ++++++++++++++++
>   package/ltp-testsuite/ltp-testsuite.mk | 12 +++++++++---
>   2 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
> index 32e1b6ad76..272c2ede37 100644
> --- a/package/ltp-testsuite/Config.in
> +++ b/package/ltp-testsuite/Config.in
> @@ -20,6 +20,22 @@ config BR2_PACKAGE_LTP_TESTSUITE
>   
>   	  http://linux-test-project.github.io
>   
> +if BR2_PACKAGE_LTP_TESTSUITE
> +
> +config BR2_PACKAGE_LTP_TESTSUITE_OPEN_POSIX
> +	bool "Open POSIX testsuite"
> +	default y
> +	help
> +	  Test suite for POSIX compliance. Included with the LTP.
> +
> +config BR2_PACKAGE_LTP_TESTSUITE_REALTIME
> +	bool "Realtime testsuite"
> +	default y
> +	help
> +	  Test suite for realtime kernels. Included with the LTP.
> +
> +endif
> +
>   comment "ltp-testsuite needs a toolchain w/ NPTL"
>   	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
>   	depends on BR2_USE_MMU
> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> index 3d8fe3b78c..cc6d3c63b6 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -11,9 +11,15 @@ LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download
>   LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
>   LTP_TESTSUITE_LICENSE_FILES = COPYING
>   
> -LTP_TESTSUITE_CONF_OPTS += \
> -	--with-realtime-testsuite --with-open-posix-testsuite \
> -	--disable-metadata
> +LTP_TESTSUITE_CONF_OPTS += --disable-metadata
> +
> +ifeq ($(BR2_PACKAGE_LTP_TESTSUITE_OPEN_POSIX),y)
> +LTP_TESTSUITE_CONF_OPTS += --with-open-posix-testsuite
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LTP_TESTSUITE_REALTIME),y)
> +LTP_TESTSUITE_CONF_OPTS += --with-realtime-testsuite
> +endif
>   
>   ifeq ($(BR2_LINUX_KERNEL),y)
>   LTP_TESTSUITE_DEPENDENCIES += linux
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
