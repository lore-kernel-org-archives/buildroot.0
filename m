Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C58AC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 03:46:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC78260EEA
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 03:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC78260EEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67A816063A;
	Thu,  5 Aug 2021 03:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5faPgwurvMzL; Thu,  5 Aug 2021 03:46:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4EB56061B;
	Thu,  5 Aug 2021 03:46:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA7E11BF2F9
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 03:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99DCB8350A
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 03:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rmc5RPESuhEV for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 03:46:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0674C83437
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 03:46:33 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id c16so4570310wrp.13
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 20:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=2wGjSV8cGDVpBSimfwjLAN3bzx1+AcKvLZ76y659aNA=;
 b=pMz/TGWYFdprqMzP5MhzkBM+mT/ngCpZ4N0h0n1XL8LxilCTrZd15F2oDd/Zh4eqFS
 4wWJBSdR7Kel6FyHkIb3EIsOxDZaTsUBfjbxwcqibIX8A6222rhLBZt62viN7HuAAkyd
 g1/gMAimUPMVYOtCuu15Dt6EBxVWPestgZl2/F+GgYYahTwACfmK+J8mpGeCRmso4UdY
 93qWd1xeA6MfV3CjJyvx0JsVIX/y2ouGoLnf4TofUgiuywRpmb87iS3x6eF21HGigjTZ
 dI6lVWRwdRO4lO1kGdTnqXl3HrehZDVWZDKAPHZDfy0rTdX+zgeTtmNCYYdGShLuhgIN
 6fVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=2wGjSV8cGDVpBSimfwjLAN3bzx1+AcKvLZ76y659aNA=;
 b=iEpj1Jjgfu12ESszSGSyPK22DwEoeT9O8s7QXQOFjWamjabFkTFLVPzP8OyDGcxbTh
 M8IOglnEBf5vtbpxNM4IbHcwZAfNFebJBMUmIzoyMgUKuQyLgclGWSXBnER6ekqscLlf
 oZbFTYNo25UUx2Ujrc7tiEntAL03XgAaAreW81eFfXfYKEZ4ils/TOtRldRxH/88x3NI
 rz8sUuGJW3rosEEhCXjn/mpk+9AhXdBV8PveZ7pzPLqgS/zCvaYPX3HTWq1puKFJWfOU
 4uuy3f3StUq1tQ7XGy776lXFVDdUUajwypFQuUMOZRVDQDRgTdaMIsn7Cs5tpNr1wQkQ
 7Pqg==
X-Gm-Message-State: AOAM533fUimLqzMQUflp3rbaFcMn2ENXfL1SmyADnoo0EpxuEBMlwi0l
 284VQmSaD8V9FSdjd9W/Ggg=
X-Google-Smtp-Source: ABdhPJy0+7OgBMIc2jZydZ573wABEH9oEH4FRJ2pGn59t5VMb9qCRI0A8OtaEI2cplgrltibMUqgJg==
X-Received: by 2002:a5d:58c1:: with SMTP id o1mr2624087wrf.6.1628135192086;
 Wed, 04 Aug 2021 20:46:32 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id x16sm4614749wru.40.2021.08.04.20.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 20:46:31 -0700 (PDT)
Date: Thu, 5 Aug 2021 05:46:29 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <YQtfFVbauf2h6naz@pevik>
References: <20210804204442.1466003-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210804204442.1466003-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libqrtr-glib: add
 gobject-introspection optional dependency
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Fabrice,

> gobject-introspection is an optional dependency (enabled by default)
> since the addition of the package in commit
> ea64e05a1bfbe3b258a69013462f94d7db7a9c0b

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libqrtr-glib/libqrtr-glib.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

> diff --git a/package/libqrtr-glib/libqrtr-glib.mk b/package/libqrtr-glib/libqrtr-glib.mk
> index b9fc5cf3ba..6ab8335417 100644
> --- a/package/libqrtr-glib/libqrtr-glib.mk
> +++ b/package/libqrtr-glib/libqrtr-glib.mk
> @@ -12,4 +12,11 @@ LIBQRTR_GLIB_LICENSE_FILES = COPYING.LIB
>  LIBQRTR_GLIB_INSTALL_STAGING = YES
>  LIBQRTR_GLIB_DEPENDENCIES = libglib2

> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +LIBQRTR_GLIB_CONF_OPTS += --enable-introspection
> +LIBQRTR_GLIB_DEPENDENCIES += gobject-introspection
> +else
> +LIBQRTR_GLIB_CONF_OPTS += --disable-introspection
> +endif
> +
>  $(eval $(autotools-package))

Thanks a lot for fixing it!
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
