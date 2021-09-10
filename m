Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A332CC433FE
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:42:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 480DB60F6C
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 17:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 480DB60F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD898606CA;
	Fri, 10 Sep 2021 17:42:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jBYzqDDAntXF; Fri, 10 Sep 2021 17:42:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2827F6065F;
	Fri, 10 Sep 2021 17:42:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E52D1BF83C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E9CC818D7
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 17:42:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xj5h9dTNVWUO for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 17:42:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3026C818CD
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 17:42:18 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 k18-20020a4abd92000000b002915ed21fb8so848093oop.11
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 10:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vsyRr/IcD5pyAqxnFVWrCoHAR0i48Sy+BC10lHUn4dM=;
 b=YTVun7c3VRoRyiQs8fzBF2SN7cukzTecXssyOZlOkPtgzNNPRiMFtP4ZiiEojDa2cg
 NVbI4Q/8GCq9wYiCIwhfjUbgf1EyRXc1VUzDeJsi/1rIifGcnClsrCS8WqeyMD1J6W19
 DiDDQhsS0DUIc8eNohdaoUoQw3jKSwxG8QHeKDrCHEnadYYMFvpWJAnuITmC8L684pGO
 VYr9EZBnGiyT7j/dwYgReLlHNHHQdgKMOwhkeoWXvJcTb9anveQDNXY+LZ/CffodWMXh
 k2sxHCEGASQJbFkPSEBQ28tfEN4OFUIdXPnInhxp9W0BP6JkH1h93FdnYgUGQGW6rnAc
 vTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vsyRr/IcD5pyAqxnFVWrCoHAR0i48Sy+BC10lHUn4dM=;
 b=e2SZHEhuWxIwJl4YcgjevGKu4k6OrqxKdzCLTZriCMcmtvno6KAcjGQKKCJF+aHwES
 ICsJjGtUQQT6rNVNuBiuElEATL9s4WdbkJ0Y8AX5dN0J6DSaYoi0gGW9TnzAx3V4waka
 LfR7YFuGgnQJnaTGcYGPoEAikIkOsMxguk+FCycNfYIgI7XCThUH4eNR06hxGX54gMMl
 Mkfb7cdncUcSy9SV+0cObkUpNyeRWk21qwUbAEKxjsARRfQ68QTt8aq6ujHUIl2BLBLu
 2qRLDJ5K+vcXgAQIeIsKB2Xu7qjwOZBKzQNWdFXoSuCeYxBKmZpZJ3O2ke7lAh/BHKZ8
 CakQ==
X-Gm-Message-State: AOAM532yOm8OyTkMe+Arv5RJBmYFb4d83nH40bo+sB5vyC4TrNsH0Vd4
 rG9lk/Gr4LdiJI931lShxVhId/4TIvc1xSDIulE=
X-Google-Smtp-Source: ABdhPJzWwotwCC3UgP9blr9lhJn2BUd5ixhY/MVcX7eje8g0Ez1q/ghLPANzaJjrfM10vKCdBnN1XPZYtIWnG9at77c=
X-Received: by 2002:a4a:c88e:: with SMTP id t14mr5442811ooq.77.1631295737171; 
 Fri, 10 Sep 2021 10:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210903162027.1935040-1-aduskett@gmail.com>
 <20210903162027.1935040-7-aduskett@gmail.com>
 <20210904003709.7254b102@windsurf>
In-Reply-To: <20210904003709.7254b102@windsurf>
From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 10 Sep 2021 10:42:06 -0700
Message-ID: <CAFSsvmq-GsfYVVpy=1FmXhb5NNwS3OT1dFY+ekPxRfo2K=Yx3Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH/master 6/7] package/qemu: add
 BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS string
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
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hey Thomas;

As briefly discussed on IRC, this is mostly due to x86 discrepancies,
however, as I do not have access to * every * CPU
that buildroot + GOI supports, it's better to commit these changes
now, and if others find issues with their CPU/GOI
builds, they can submit a patch far easier thanks to this patch series!

Adam

On Fri, Sep 3, 2021 at 3:37 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Adam,
>
> On Fri,  3 Sep 2021 09:20:26 -0700
> Adam Duskett <aduskett@gmail.com> wrote:
>
> > For specific architectures, running qemu in user mode without any additional
> > options may fail if the host processor does not have the necessary instructions
> > to properly run qemu in user mode, which results in the following error:
> > "qemu: uncaught target signal 4 (Illegal instruction) - core dumped"
> >
> > CoreI7 is one such architecture that has had consistent auto-build failures.
> >
> > Add a new string in qemu/Config.in.host: BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS.
> > The default for the Corei7 architecture is directly from the OpenEmbedded
> > project found in meta/conf/machine/include/x86/tune-corei7.inc:
> > "-cpu Nehalem,check=false." Other architectures may be added to this string at
> > a later date if other failures occure.
> >
> > Signed-off-by: Adam Duskett <aduskett@gmail.com>
>
> So on the principle, I'm obviously OK as this is something I have
> suggested. However, what bothers me here is that we are handling only
> the Core i7 case, because it caused some issue in the autobuilder.
>
> What is qemu doing when no -cpu is provided? Does it emulate the host
> CPU in this case? If so, then it is going to be wrong in a lot of other
> cases than Core i7, no?
>
> Or put differently, shouldn't we essentially have a value for
> BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS for pretty much all CPU
> architectures that we want to support for this use-case ?
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
