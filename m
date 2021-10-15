Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4752BC433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:10:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4C9861053
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 20:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4C9861053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A79DE60EEA;
	Fri, 15 Oct 2021 20:10:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X3_OugStQX2H; Fri, 15 Oct 2021 20:10:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F286660692;
	Fri, 15 Oct 2021 20:10:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C47BF1BF2CC
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B30D94049E
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 20:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y79JkUIhj_UB for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 20:10:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B42354049C
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 20:10:23 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 n40-20020a05600c3ba800b0030da2439b21so3906006wms.0
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 13:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=uqcc0ysowmWAmL1pT69sDGprxbpxYHK4FGQV5mdfK+4=;
 b=QFAA6fCMYfD8LvjaL6PnLVEdc2k5naQ5FAGEvyiWldYj1uH3xtQuaY19HK/kr7o8wW
 jXOqQ0FHWcHESwfXN4sgNnKVhiTLqgKBu84DkXC0I2fPyGYf/vRuzOzRm3prg72STQrv
 f/c5PTc9cBUDIpiszJWnCv/jI1ofQRr0nenjZG8LkNwXdS3Wtij+oZHyXH4efYRAloyg
 rmmLqQmNWMG9szrsj/Y3ZviDfLoHJ2q+BU6r5QrfQk9Ttu7yk82+gjl2p4c3eO54Q3nP
 sZHSHScrB1vhioqcgUWoXxMKLutFZx9nPelsEC+mbuIjo/SZ4TwNVDD8k1pfp4zfNUZ3
 Ageg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=uqcc0ysowmWAmL1pT69sDGprxbpxYHK4FGQV5mdfK+4=;
 b=sjpk6dZifwdWxw4GA9uMT8rWla3fGF8i62gcW+SyEgygv/XxZXC+bK/Yo+8mO3x1+R
 dJczkkg6OHxqzDSVIoQAHNG41mcAqpHESj4+EQJw/6L6zL+gasPgTQk1F3ziRAS2utnS
 A1C5QvkCqzFD71Rs2yPmfQ5dAcscaIEfoyn1qjBM4+QAbtEm+RpZQaRmLQscBfXsSp4g
 gjFXDlGn4ghfLyOtxz2bVHp+IT5lpCHqIMBeoEh7Y6NX8W5NVBzq6TQqcoAgdKhWGY3r
 AtuwM8VlTF4fJSg1GZvCTY367jungf8PFKWNeFw3zJ8ulImDShfd5KEh8yIavAjOvlHb
 n+5Q==
X-Gm-Message-State: AOAM530xEb3a9zbDUXZYzkxYww93Yfhw/1Ycu26fImXyURKlGcubQnSU
 3qWRrROowWjern3wvL8Hzyc=
X-Google-Smtp-Source: ABdhPJz+49BWQclfydFCeAHoXFL9OgIfZ2ewzKguZqiuI5EKCIshZhgtIfEa1bbNwNV4bviBOTbgcg==
X-Received: by 2002:a7b:c359:: with SMTP id l25mr28196598wmj.84.1634328621648; 
 Fri, 15 Oct 2021 13:10:21 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id j206sm8656181wmj.23.2021.10.15.13.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 13:10:21 -0700 (PDT)
Date: Fri, 15 Oct 2021 22:10:18 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YWngKpIr2Rr3Qz6l@pevik>
References: <20211015110135.15960-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015110135.15960-1-rpalethorpe@suse.com>
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: io@richiejp.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Richie,


[ Cc Arnout, Peter and Thomas in case they push your patch through pending line ]

> During LTP and/or kernel development it's very rare that I want the
> Open POSIX and the realtime tests. Open POSIX in particular takes
> considerable time to build. So this adds the option of disabling them.

> They default to on so as not to break existing test automation.

Thanks a lot, I always wanted to do this.

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

I don't see you patch in patchwork [1], nor in lore [2].
Have you registered to buildroot ML?

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/buildroot/list/?series=&submitter=&state=*&q=ltp&archive=&delegate=
[2] https://lore.kernel.org/buildroot/?q=rpalethorpe%40suse.com

> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> Cc: io@richiejp.com
> ---
>  package/ltp-testsuite/Config.in        | 16 ++++++++++++++++
>  package/ltp-testsuite/ltp-testsuite.mk | 10 +++++++---
>  2 files changed, 23 insertions(+), 3 deletions(-)

> diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
> index 32e1b6ad76..272c2ede37 100644
> --- a/package/ltp-testsuite/Config.in
> +++ b/package/ltp-testsuite/Config.in
> @@ -20,6 +20,22 @@ config BR2_PACKAGE_LTP_TESTSUITE

>  	  http://linux-test-project.github.io

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
>  comment "ltp-testsuite needs a toolchain w/ NPTL"
>  	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> index 3d8fe3b78c..93d951fe1a 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -11,9 +11,13 @@ LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download
>  LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
>  LTP_TESTSUITE_LICENSE_FILES = COPYING

> -LTP_TESTSUITE_CONF_OPTS += \
> -	--with-realtime-testsuite --with-open-posix-testsuite \
> -	--disable-metadata
nit: Maybe add blank line here for readability.
> +LTP_TESTSUITE_CONF_OPTS += --disable-metadata
> +ifeq ($(BR2_PACKAGE_LTP_TESTSUITE_OPEN_POSIX),y)
> +LTP_TESTSUITE_CONF_OPTS += --with-open-posix-testsuite
> +endif
And also here.
> +ifeq ($(BR2_PACKAGE_LTP_TESTSUITE_REALTIME),y)
> +LTP_TESTSUITE_CONF_OPTS += --with-realtime-testsuite
> +endif

>  ifeq ($(BR2_LINUX_KERNEL),y)
>  LTP_TESTSUITE_DEPENDENCIES += linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
