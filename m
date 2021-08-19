Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49B2C4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 16:09:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A70C3610A1
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 16:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A70C3610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72E6D81067;
	Thu, 19 Aug 2021 16:09:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uFgCSZxalc9r; Thu, 19 Aug 2021 16:09:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49D4C818C4;
	Thu, 19 Aug 2021 16:09:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C9991BF82D
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 16:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8452F404C1
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 16:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FLadXMi5kX5z for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 16:09:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D1E540151
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 16:09:01 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 g66-20020a9d12c8000000b0051aeba607f1so865249otg.11
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 09:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=29MIj/cpxvbvSmyuRJLOPyTk9bdrZDKWLm/pEzdjJ+c=;
 b=P+HzVdbfxNgPBlRxNrXSQIlXmvyNvFAOM4O7VLTvVpPT7Nm7fY71lTSY9qzbXgLcZm
 6pKCdrtCbP7fgBt00ufUZgpjy2iKujJG9KOwTxn3K8A0uOg3gB80jxbotLTLXLXqW5iR
 85wplX4wH79UL40MWx1sY72kIJCKfTiKYXe2JAvz5Un7xtOTR6xfSx9MBh34JgwDr63u
 yjZIteIMFk7fcuw+qb2kigjY3oJ2hUo4Gq7lYrT7/20jlcGDy6HUf17HQ0hDI6czploS
 HIahOhnqdkK0R8jBdlK0V18HWG3BghbI3otd7DLaFkt+ZdnAXWpRcVUoFwm/JsbmPSGL
 0+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=29MIj/cpxvbvSmyuRJLOPyTk9bdrZDKWLm/pEzdjJ+c=;
 b=ueueAY23EVZMzeyBH5Xs9jqt+wRnrkRR6RWL0+3E9iay82NivGqjMm6/crhcX8VxTN
 2CCedoDrf1dZhmpVyKz6sLlGtBh1yTUysHqd4qXzYxZgJOF4Z9Q/em5+MNtOmGx/wkRi
 QHUOXBMDwWChJBO6b12X0NDhXhWBSAROw37lbys3xomrIEHzF+9VYFvyzFFLmGvwgyBE
 FhZfTs7XfcBWax0jdYnqkgwXrdhu/13TqHUVGJgBf15v9Wo19npz7OPitnpC0QNTCXAK
 iJVrU+z1PRlYDSNbr9mRok1Ssb24WHtLPbxdd5O8LgcxL7gQDt1lPIFZM29ozDL87FiD
 IOSw==
X-Gm-Message-State: AOAM532C5ibLryjDOrdOjYQmFT3gIFU/VjorMKBU3SJk8dr981aV0ZLe
 fNxvWIhumtc5KH4f+4gPMRUeDzBJuGUFZP+dVW8=
X-Google-Smtp-Source: ABdhPJzXf/LdGkM1YkYRX/0GFWFvST9HDHdv3oASeJQYSwLmPTvTZSByhutaZ5kSdzprYTrBfDS6fxR1/gVGkbiHzD8=
X-Received: by 2002:a05:6830:2151:: with SMTP id
 r17mr12635777otd.141.1629389340219; 
 Thu, 19 Aug 2021 09:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210818202212.684857-1-thomas.petazzoni@bootlin.com>
 <CAFSsvmrYDiStTEn=fEBrUX2+ZZoro6KxMx1zS2FLxsaLzuTtfw@mail.gmail.com>
 <20210818235437.78a7826a@windsurf>
In-Reply-To: <20210818235437.78a7826a@windsurf>
From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 19 Aug 2021 09:08:49 -0700
Message-ID: <CAFSsvmqmKHD0k4fOWAV+Zdj+m=jSvafFYtw1vMsOj1Jf5rRMSA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/sentry-cli: remove package
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hey Thomas;

On Wed, Aug 18, 2021 at 2:54 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Adam,
>
> On Wed, 18 Aug 2021 13:36:58 -0700
> Adam Duskett <aduskett@gmail.com> wrote:
>
> > It seems like version 1.68.0 fixes the build failures. I have tested
> > two different
> > defconfigs that are on the failure list:
> >   - bf7361dc482d8f3f97d523b7d56eabe5bc515ae8
> >   - 97aa03f497536462abc85011ba1c94874d18f237
> >
> > And the new version doesn't produce the failures that are plaguing the
> > autobuilders.
> >
> > Instead of removing the package, I would suggest updating it to 1.68.0 instead.
>
> Thanks for looking into this. Did you confirm that you were able to
> reproduce the failures *before* the version bump ?
>
Interestingly enough, my testing method was flawed. While I did spin
up a debian 9
docker container and the exact git hash that failed, I made the
mistake of running
`make host-sentry-cli` and not `make`

When calling host-sentry-cli directly, there isn't a failure, but when
running just `make`
the failure does appear. I am not sure how to pass include paths to
cargo, but it seems
like the only failure now is the missing zlib.h library if the package
is bumped to 1.68, as
the git repository error is indeed resolved.

Thanks!
Adam

> One of the issue seems to because by the host-sentry-cli calling into
> Git, which would probably work with in-tree builds, but not out-of-tree
> builds for example. Another issue seems to be related to zlib being
> available on the host system or not.
>
> So to know if the 1.68.0 update fixes the issue, we need to make sure
> that you were able to reproduce the failures with the current version,
> in the same setup as the one you tested the version bump with.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
