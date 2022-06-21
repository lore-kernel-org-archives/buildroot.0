Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464FAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 19:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9D7C81772;
	Tue, 21 Jun 2022 19:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9D7C81772
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4JWMxuyRmrfi; Tue, 21 Jun 2022 19:32:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1CF181461;
	Tue, 21 Jun 2022 19:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1CF181461
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8841BF364
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 19:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D96CC81461
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 19:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D96CC81461
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M6BCzwy8JFGa for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 19:32:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BBF48143E
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BBF48143E
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 19:32:36 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id z11so14596764edp.9
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 12:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xA3drG4dn1x/5lvGsW1/QUICLMQeN2x5wmZI8ut/6+E=;
 b=Rg/vVha7dgere55qEyxXUMqt+RfFemgtvrmVOWRRFeyqFNDywZsnBWqj2w6UPC49qh
 sWVZJV7qns4Z5MR3rggANvdb/GxucIE4ZdpyDlJZeG4CAOz0bEqrx/gb/INJqwvgnEpW
 38po7gOPPY9rXZ6zhIORIS9uESbgemocjETssC+hZi2+EG93LZkvZvFSGb7pHE/Ej/Du
 a8NUSOzQd7FIC8YUQtXB4wXyHl43Y1FV4s22DNw5s7vvelCL+866k0z+wby82DZKUF4/
 79X/eNTlHWkLISTgvM/aj2ugj7g348Lhaf39Wkzr0woMZJKCS3CGJhG3kGnXI5FNPkK7
 rBgg==
X-Gm-Message-State: AJIora8ENKWjkxkPVMqZV5NpNl+US+XP6RtvVQ2OKn5KnDeYxaMoIR8/
 srUD/47S0F4RLIcAS81Eeqg=
X-Google-Smtp-Source: AGRyM1v/5Vxb3mfySDePReJtIQmL3wysjoGDlozf6lfMs8NTn3pZsJLJI2xihPxPee5XgiD41zD0MQ==
X-Received: by 2002:a05:6402:2752:b0:433:3a08:27b1 with SMTP id
 z18-20020a056402275200b004333a0827b1mr37193939edd.235.1655839954736; 
 Tue, 21 Jun 2022 12:32:34 -0700 (PDT)
Received: from localhost (tmo-098-39.customers.d1-online.com. [80.187.98.39])
 by smtp.gmail.com with ESMTPSA id
 lb25-20020a170907785900b006febc1e9fc8sm8143104ejc.47.2022.06.21.12.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 12:32:33 -0700 (PDT)
Date: Tue, 21 Jun 2022 21:32:16 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Raphael Pavlidis <raphael.pavlidis@googlemail.com>, buildroot@buildroot.org
Message-ID: <20220621213216.5947a929@tuxfamily.org>
In-Reply-To: <20220620191403.22187-1-raphael.pavlidis@gmail.com>
References: <20220620191403.22187-1-raphael.pavlidis@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/slirp: bump to version 4.7.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mon, 20 Jun 2022 21:14:03 +0200
schrieb Raphael Pavlidis <raphael.pavlidis@googlemail.com>:

> https://gitlab.freedesktop.org/slirp/libslirp/-/blob/v4.7.0/CHANGELOG.md
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> ---
>  package/slirp/slirp.hash | 2 +-
>  package/slirp/slirp.mk   | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/slirp/slirp.hash b/package/slirp/slirp.hash
> index 326b2ad246..3f7abdee5a 100644
> --- a/package/slirp/slirp.hash
> +++ b/package/slirp/slirp.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  b8a22ac4d601ba16122a67827c0f4361785d4d283f21ff8ed48d4aa1e7693477  libslirp-4.6.1.tar.xz
> +sha256  358ce8b6ea59ec9deac937cc754f0115b992839e7b0cddf30ffb8f77dc21da82  libslirp-v4.7.0.tar.bz2
>  sha256  b28aecf4796a6a22054167f0a976de13d9db335669d37afd2dc7ea4c335e1e13  COPYRIGHT
> diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
> index 43d2c520e9..10d367587d 100644
> --- a/package/slirp/slirp.mk
> +++ b/package/slirp/slirp.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -SLIRP_VERSION = 4.6.1
> -SLIRP_SOURCE = libslirp-$(SLIRP_VERSION).tar.xz
> -SLIRP_SITE = https://gitlab.freedesktop.org/slirp/libslirp/uploads/83b199ea6fcdfc0c243dfde8546ee4c9
> +SLIRP_VERSION = 4.7.0
> +SLIRP_SOURCE = libslirp-v$(SLIRP_VERSION).tar.bz2
> +SLIRP_SITE = https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v$(SLIRP_VERSION)
>  SLIRP_LICENSE = BSD-3-Clause
>  SLIRP_LICENSE_FILES = COPYRIGHT
>  SLIRP_CPE_ID_VENDOR = libslirp_project

Reviewed-by: Thomas Huth <huth@tuxfamily.org>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
