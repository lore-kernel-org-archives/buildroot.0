Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE237C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:18:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A68CE60EB4
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A68CE60EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A0B2833C9;
	Sun, 25 Jul 2021 21:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h7CPJ-dOl_8N; Sun, 25 Jul 2021 21:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABEE483388;
	Sun, 25 Jul 2021 21:18:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D6BA1BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99B1C6065D
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jtwe6YJmP4N8 for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:18:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DDCA60609
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:18:52 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id nd39so13359178ejc.5
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=m96nObaqNs/XXB8Uk17P+eweqzY7QhTjNUa1V+C9Ut4=;
 b=AAph6GCfYEYg9SheuLVk5ZFJiKJUHfPcUnZzWiAAqe78K9qKaWi1VIqvIpklVBSbe0
 MANjVlOgNQZ3oPce0V1kpGe2ARnW5qmZ42sPL/r0XCMTEF2zLSjlmYoK7Fd/e8JUWu7f
 l0nCP/d2stozm41im7Ek/YXXa6HILPAw3z8lZzmza3mfOAgB7/QVd25NN2fH8NDo69Ls
 yzsAA955EAtrnvbo0IWFhM+U3NYeemBdfhtSX7CArxC38xms0EkRH2ICZcfp1Y8r5Hak
 cN800BMNTpY9g7iwADHdDrF+9JiN/IHKadZ9WvWglxayW3TQk7EZ0D050JN+jO2Yswx2
 d10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=m96nObaqNs/XXB8Uk17P+eweqzY7QhTjNUa1V+C9Ut4=;
 b=jmCNEXM0KkidjUs/M75JJ/8//cLANCQj4qXpbeNhSoOMx4G4lmeSUv12iZRsvuMjbQ
 1GWs2paOnlBw2/50NNL3Z/fK1iWHBbv+BenCJvGFgbAiG9WINQmetbFJIHR/BNxTO2xv
 be7q4rRhayj75bzGhNVNV+eyeeco/8vzVClRzvdsShdEmwiqNdGl61R55ziPuuIX5QC7
 AroyU/gesAdLLYxTzUiu4kjt6HyY73qSPbKAUAyK7IqN5FNLCsmZ9s8gi1uYe8jlW/uS
 T1iGRuO7zn//iZGi7YCHlwSDCxL6G981q+Xf2BgITh8cEN/GT+3jr9gpxiSpB5VC4b6j
 ZIfg==
X-Gm-Message-State: AOAM531jngk9as2TFFDP6iXposXWzYpdWcVK7O5aqS/98NF/mM5YzOlq
 GKIgoYboz6HMCdJ1aVPSrHc=
X-Google-Smtp-Source: ABdhPJywZBXor2q/BiTDJYHx0YOJiXg2wnNBz32JAxktGMhRGG9t1QDH+dYM/JksgtY54U8c9YFPwg==
X-Received: by 2002:a17:906:4889:: with SMTP id
 v9mr14104160ejq.269.1627247930709; 
 Sun, 25 Jul 2021 14:18:50 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
 by smtp.gmail.com with ESMTPSA id p23sm18049584edt.71.2021.07.25.14.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 14:18:50 -0700 (PDT)
Date: Sun, 25 Jul 2021 23:18:48 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YP3VOL6D4qfc8CUo@pevik>
References: <20210725204624.1620567-1-james.hilliard1@gmail.com>
 <20210725231524.512d0549@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210725231524.512d0549@windsurf>
Subject: Re: [Buildroot] [PATCH 1/1] package/libtirpc: add missing
 !BR2_STATIC_LIBS dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi James, Thomas,
> On Sun, 25 Jul 2021 14:46:24 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:

> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/libtirpc/Config.in | 1 +
> >  1 file changed, 1 insertion(+)

> > diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
> > index 1899edefbf..6a900c68c3 100644
> > --- a/package/libtirpc/Config.in
> > +++ b/package/libtirpc/Config.in
> > @@ -10,6 +10,7 @@ config BR2_PACKAGE_LIBTIRPC
> >  config BR2_PACKAGE_LIBTIRPC_GSS
> >  	bool "gss"
> >  	depends on BR2_USE_MMU # libkrb5
> > +	depends on !BR2_STATIC_LIBS # libkrb5
> >  	depends on BR2_PACKAGE_LIBTIRPC
> >  	select BR2_PACKAGE_LIBKRB5
> >  	help

> Thanks, but a bit more than that is needed:

>  (1) A Config.in "comment" in package/libtirpc/Config.in

>  (2) The propagation of this "depends on" in places where
>      BR2_PACKAGE_LIBTIRPC_GSS is selected, i.e in
>      BR2_PACKAGE_NFS_UTILS_GSS. A Config.in comment will be needed as
>      well.
I'm sorry to not catching these.

Kind regards,
Petr

> Thanks!

> Thomas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
