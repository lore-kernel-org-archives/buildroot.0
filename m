Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792D5C4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 06:05:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AF9760FC1
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 06:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AF9760FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF14380DC0;
	Sat, 14 Aug 2021 06:05:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WnzZqpH_rOnE; Sat, 14 Aug 2021 06:05:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3213680DAD;
	Sat, 14 Aug 2021 06:04:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 754981BF3DA
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 06:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 612D480D9F
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 06:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Emw4VYGJqJI9 for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 06:04:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73BAB80D80
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 06:04:52 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id bt14so6451721ejb.3
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 23:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2qZIQeWcQOHaH/oqJymPPdEDmGV5p3r/gWUFzfrfhAA=;
 b=lPlk6R50iwrHDIvSe1w1ALeU01xXAn841WIVu11D2/U1LQQeEOnfAO252GB3vWl6RG
 Ye3DOglPpCS8EJAAqiDyVdmBDP3WBRc3YIzXHgyLQsK4CPM75z/FBlS+PU6oCQb67Oqu
 8EPK62e173fTqQhI+XO3JuXLWFr6FCpXLIxhHL9omXSkuBql86FUy5wMF3SEdhgpH2Eo
 2NQ96Os103beTITJvAHW5SBtBZnPeBb+zmiK6fIT9FIfQvfCztvq1PPau6uDzABZKWyB
 XtQjXieefoGusgFNnuF+RputmqvdZYaM+6TtPylYBp1rY3JeBh3zc0/5WWM/cEQQPkga
 G/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2qZIQeWcQOHaH/oqJymPPdEDmGV5p3r/gWUFzfrfhAA=;
 b=Bto2ixjWh9q7faM5/Zo8RWwdOy56W4lWNGssug+zEl8nlhnqE7iy4lcJudlfZYIe9S
 2xaTSmZhjahMffz3klvUTrY3wVVLAj/RHoAX0C03E8Rz8Z3NXCSmN0ZRHqK5S7EXzBO4
 GidqV23nTux9I6Zhw0q/5OfVy3pmQ7rFK8O/5GqUknrZWhlJ5C6kTxNryPH5iYRr/7VE
 +iheQX2pAqsFuLJN/zlOby0AGiIZgeZoah1vnFOh3s0yC+xpEzKXpfCC8cqXRSbettMu
 R+GjPO3zOY67DqEqKN+R3hJ8wGP1ZjzP/gbIkxQfs2OwIiz8OVBB+4wC5731kh5zmSlV
 4Kug==
X-Gm-Message-State: AOAM531DT3t1ea1zq3fS4f4x0b0kg1xrpH90Q+GPP5pv4CqKoMm8L3KI
 Q22MowQAvtJLCNJBATX3FewOyt85ynQqudGzvor00VKcHkAEZw==
X-Google-Smtp-Source: ABdhPJziLrf44wedKHRkXM+lrPRu7UpToNALOLjFaidJOin2oLOHPEGBiPAee5Z7u4Y11o9gP0bRTykgO+eWqA88H4g=
X-Received: by 2002:a17:907:3345:: with SMTP id
 yr5mr6054175ejb.542.1628921090544; 
 Fri, 13 Aug 2021 23:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210813073634.389426-1-asafka7@gmail.com>
 <20210813150416.021d688a@windsurf>
In-Reply-To: <20210813150416.021d688a@windsurf>
From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 14 Aug 2021 09:04:39 +0300
Message-ID: <CALFsTFUWc=g0X1wJUpc9-DyhwcdoT3DzH1DMiho-hfekmeROug@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pymupdf: depend on
 python3
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
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

On Fri, Aug 13, 2021 at 4:04 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Fri, 13 Aug 2021 10:36:34 +0300
> Asaf Kahlon <asafka7@gmail.com> wrote:
>
> > According to the package documentation, python 3.6 or newer
> > is needed.
> >
> > Fixes:
> >  - http://autobuild.buildroot.net/results/f857986b8c9b6d4a843f3694cae8527760540ed0/
> >
> > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> > ---
> >  package/python-pymupdf/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/python-pymupdf/Config.in b/package/python-pymupdf/Config.in
> > index 54714eb3bf..64a81895ea 100644
> > --- a/package/python-pymupdf/Config.in
> > +++ b/package/python-pymupdf/Config.in
> > @@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_PYMUPDF
> >       depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mupdf -> harfbuzz
> >       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # mupdf -> harfbuzz
> >       depends on BR2_PACKAGE_XORG7
> > +     depends on BR2_PACKAGE_PYTHON3
>
> This dependency should have been propagated to the two Config.in
> comments in that file, so that they don't appear if Python3 is not
> used. I fixed that up and applied to master. Thanks!

Hmm that's interesting...
I agree it's needed but from a quick look I think we have packages
which don't do that (for example - txtorcon. If the toolchain doesn't
support C++, we will see the "comment" part under the python2 external
modules menu although python3 is needed).
Do I miss something or is it a real mistake?

>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Thanks,
Asaf.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
