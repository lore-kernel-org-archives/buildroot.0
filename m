Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDC0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:17:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 924F2611F0
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 924F2611F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F01E606DF;
	Sun, 19 Sep 2021 07:17:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 911X5IpMZpm0; Sun, 19 Sep 2021 07:17:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A34DD60684;
	Sun, 19 Sep 2021 07:17:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 598CF1BF314
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48C2860684
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:17:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9t7F2QVyMhaw for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 07:17:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADF8C6067F
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:17:32 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 t2-20020a4ae9a2000000b0028c7144f106so4725765ood.6
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 00:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LgmQo3ApFf+29MqPhcIDCdT39mEjW02z3AvsOLJjDuM=;
 b=ODNss/kn3/9ea+j7SBtW15K6ji9nuZSod9hL0JulzhxfnSkb5uYUc0vQWeV9GPNfqL
 k6RW5KOl2f15n/Ov2mh7b++0e+5im1Yca20kVXPMt3quR1QeJrND3Wtd4fL7DPSyRbdW
 3Er4FypfG/Aqf1wWtVMKsz8pKlv7HSfHusPI+BE6ZDgF+uLf1GbumfAlYDd+qHgfUcfP
 u8W/Lt4Wk0tYl/YLunI1fBqEO7nmkFT4JhznyEZREz1t/iXQR2BMfcinhiIL1uu4YAB5
 gFuomiYPTSPth9qQEucOHF3nzxlcWK36xUvb+w+DMb4Pi248roOWL8eoN/kGzghe0ser
 6dYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LgmQo3ApFf+29MqPhcIDCdT39mEjW02z3AvsOLJjDuM=;
 b=RYDmr/UlB24/Ers85q7vZRd/gdOuFDhFjGje5IEIIYTg2ZcnSim/cGmlXVAYG1xhtQ
 Vl95xvmEBYPl+aBjnmqb0DDsevXWPlDLjM0z0nDnRWgUSJOkdPo0NdhRZPyjcWKryjyY
 LZJjLtn8FmipCbZu9/W/k4kc+qB3GmW21vgz2x3ULzs7RiEZMaCn4EleaQwCQhbpItM2
 ECmuRsCDPNWIc1/cnh+/uMKP5L470zZMX32OplVNM8SLS87CSRugij+IjQmTIxNsf3w9
 xNP+6IxHfTdtQDYVsEA+JM5Iuu7I7xTNJgEE+7+RNyu2PPQJMtEhttG4lEAEFdT5mosv
 0vKg==
X-Gm-Message-State: AOAM530nHvgriGWHGTy1bgpcx0+jCFke6m/DUbYy4hIuD0K2mEz6l2XF
 0uE989X6Vam4OAt8YjF5Po55W74NRHBPOg==
X-Google-Smtp-Source: ABdhPJwxTDgtjtfQMhaxYTZ4cbSxu3kXcmtmsuihV6HYFwZbJ6c2kbzlkQ8y5mcqkk1UOAweBq8KEQ==
X-Received: by 2002:a4a:db68:: with SMTP id o8mr15294195ood.98.1632035851539; 
 Sun, 19 Sep 2021 00:17:31 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com.
 [209.85.210.54])
 by smtp.gmail.com with ESMTPSA id be5sm2652808oib.10.2021.09.19.00.17.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 00:17:31 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id
 k12-20020a056830150c00b0051abe7f680bso19116958otp.1
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 00:17:31 -0700 (PDT)
X-Received: by 2002:a9d:60d5:: with SMTP id b21mr9132546otk.306.1632035850987; 
 Sun, 19 Sep 2021 00:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210919071016.3339939-1-christian@paral.in>
 <20210919071016.3339939-5-christian@paral.in>
In-Reply-To: <20210919071016.3339939-5-christian@paral.in>
Date: Sun, 19 Sep 2021 00:17:20 -0700
X-Gmail-Original-Message-ID: <CA+h8R2o9RnKMyF9r=wi3Hync8ZgXMHdCHp+VEz690WePMVj_iw@mail.gmail.com>
Message-ID: <CA+h8R2o9RnKMyF9r=wi3Hync8ZgXMHdCHp+VEz690WePMVj_iw@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
Subject: Re: [Buildroot] [PATCH-NEXT v2 5/5] package/embiggen-disk: new
 package
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@lists.buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anisse Astier <anisse@astier.eu>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

All,

On Sun, Sep 19, 2021 at 12:10 AM Christian Stewart <christian@paral.in> wrote:
>
> embiggen-disk is a tool to automatically resize disks to fill available space.
>

> diff --git a/package/embiggen-disk/Config.in b/package/embiggen-disk/Config.in
> new file mode 100644
> index 0000000000..d409d36af6
> --- /dev/null
> +++ b/package/embiggen-disk/Config.in
> @@ -0,0 +1,18 @@
> +# TODO requires sfdisk
> +config BR2_PACKAGE_EMBIGGEN_DISK
> +       bool "embiggen-disk"
> +       depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> +       depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
> +       select BR2_PACKAGE_UTIL_LINUX # sfdisk
> +       select BR2_PACKAGE_UTIL_LINUX_BINARIES # sfdisk

BR2_PACKAGE_UTIL_LINUX_BINARIES provides sfdisk. The TODO here can be
deleted and safely ignored: embiggen-disk has been tested with this
package extensively.

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
