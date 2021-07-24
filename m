Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1685C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:50:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F08B60725
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F08B60725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paral.in
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B553400BE;
	Sat, 24 Jul 2021 20:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZA8s3CO9PS6; Sat, 24 Jul 2021 20:50:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B40E6400EA;
	Sat, 24 Jul 2021 20:50:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 63D6F1BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5494540284
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral-in.20150623.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uhwtoKGks82J for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:50:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EB114025D
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:50:41 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 f20-20020a9d6c140000b02904bb9756274cso5828405otq.6
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 13:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral-in.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xR1dLKS4p7oXR6GJUvsbRqat6JzlkodmP27Gt+GHdGo=;
 b=WYW6mhxIkeSgvgR2kqlTWoDz5QBPV6er46yYP+C9nJRbbdyp+eRnSQKo99QbUVTHmy
 xf4muI0UCNoUvi03wnbWrOdKhupmHPmjuDcYicAGgSiKHymdDsoDQnXtVK1Ypwf2igJf
 YZzZaykfwFUOwaOeY7l9KpBVWNysE3UST1eMDlM1/zCCMBaTmpDoc18Bgeq0YFA0myeM
 RyH4qnmWIGn29cYtxG99Y6H9eQx1EQwUCVkg4lBpTT1etZqH2mbK11W4xlNwgRl9/HOX
 Dk3GZJJfuyQRCh1nQe0sxnb5hxiyfG3iotULp3sq3mVIIDcphMzgpdTPa/+pXGyj53Wx
 CzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xR1dLKS4p7oXR6GJUvsbRqat6JzlkodmP27Gt+GHdGo=;
 b=c0VjkbABCWPCLWTp9/+7UMXko4uXaiVYuWhAqIYPrOIQxMLMAuwYt6y1FciqK29gb8
 dOwz2dKZBbQUKA7gUn55WnHSZ7TA14htGpcH7zK6JE+JkftJLnA3iRe52mGJOau//FuL
 xE0o3F/MQ7n5ji+IoALLG3rWrFkqZAbHL5fTEb5aCjPwnYFJ25NQMkm4A3e9qmqQf+vY
 yBO8S0oTDQfwkGAS6e54h8y3xSG5fv8DG34CaB9gMxbaGbpoM0LGtcHFPihWv/QA9D0E
 ei6AO86XXxJ9qx9Jkq8FGH6sHG8X4yarf6ka26DFHq+81GO7WRyhpN1YlDJqAupczfQV
 JXcA==
X-Gm-Message-State: AOAM531SzhfxLPUB1KsUCqWSBRCtNpI44DrvY85YMlSzZaVy5VT2J7K3
 0kH33ER6qt4LYDC3XId6uhV99WsiZMN8hw==
X-Google-Smtp-Source: ABdhPJwOT7LuIAg7vjOD7stMRFZNbxpnhTvtDQX5oWBpw3mLVCfpMK4XKZTZ9CZJb+g4sbkathBKiw==
X-Received: by 2002:a9d:4911:: with SMTP id e17mr7292156otf.38.1627159839823; 
 Sat, 24 Jul 2021 13:50:39 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com.
 [209.85.167.178])
 by smtp.gmail.com with ESMTPSA id w190sm6841538oif.17.2021.07.24.13.50.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jul 2021 13:50:39 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id a19so6152698oiw.6
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 13:50:39 -0700 (PDT)
X-Received: by 2002:aca:413:: with SMTP id 19mr12582358oie.153.1627159839053; 
 Sat, 24 Jul 2021 13:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210622024337.3009417-1-christian@paral.in>
 <20210721224913.3d600ccc@windsurf>
In-Reply-To: <20210721224913.3d600ccc@windsurf>
From: Christian Stewart <christian@paral.in>
Date: Sat, 24 Jul 2021 13:50:28 -0700
X-Gmail-Original-Message-ID: <CA+h8R2riTv5a4cttbDZX_Bwbm=sa+dqHEmLUTnsnFUYg9gtAUQ@mail.gmail.com>
Message-ID: <CA+h8R2riTv5a4cttbDZX_Bwbm=sa+dqHEmLUTnsnFUYg9gtAUQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: use host compiler when
 go-bootstrap unsupported
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
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Thomas, all,

On Wed, Jul 21, 2021 at 1:49 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Christian Stewart <christian@paral.in> wrote:
> > The problem is that step 2 - build go-bootstrap - does not work on 64-bit arm.
> > The Go compiler from 1.4.x is compatible with x86, x86_64, and arm (32 bit).
>
> So perhaps my brain is not smart enough here, but how is the Go
> compiler then build on 64-bit ARM ?

It has to be bootstrapped using an existing arm64 go compiler binary,
or cross compiled.

Presumably a bootstrap process which produces first an armv7 Go
compiler, and then uses it to build a arm64 Go compiler, is also
possible.

With gccgo, it should be possible to bootstrap using the Gcc version
of the Go compiler (which is included with the Buildroot toolchain
today, but not enabled.)

> The one thing that bothers me however is the hardcoding of /usr/lib/go
> in your proposal as the location of the Go compiler. I guess we could
> have some logic in the top-level Makefile that looks for the path of
> the host Go compiler perhaps ?

Yes, it could be done like this:

PATH_TO_GOROOT=$(go env GOROOT)

> Does this make sense ?

Yes, this should work fine.

Eventually the gccgo based bootstrap approach could also be added as
another alternative.

Best regards,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
