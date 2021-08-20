Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956C0C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 08:12:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 455FF61051
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 08:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 455FF61051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09716613D4;
	Fri, 20 Aug 2021 08:12:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ar0D9s9x5Mpe; Fri, 20 Aug 2021 08:12:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0610613D7;
	Fri, 20 Aug 2021 08:12:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EAABD1BF2C0
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 08:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D76C280E63
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 08:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zuN6JF71933q for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 08:12:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD471817D3
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 08:12:22 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 y14-20020a0568302a0e00b0051acbdb2869so5286822otu.2
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 01:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nkmsrqYwj1gj88dF596NhZ/KP53M52XspGSch+AxcJ0=;
 b=Q8r9QvI92Ei9+swHDlHejE9EQBnRYXm1Vv4yIOtZ9zwtG81KHQxjZeZBTmpvmvunCI
 wMm4jYqmbxnPBd0S0u7GxW0u599jCtVMkmdHwAYu/5/fb8LEqkC9Uu3B4iwkjRuDaYcb
 uAvvzln+wDWm5wzNbiBbmur46/zJT41mGvr371Ti2YS+LcKqIO4cbBcoW2Ao6N+WTLZv
 SlOhuQ/1sGFGzSf4hoErt1OwRZkOVr5ZflnExZMtV8PkZjd/ZbH07tuhP2JzV/pKlcRr
 6De1yq5PW+ov/lCljnEkGeZehoFQwIyX/xCqUnPChzWglX0k46ss/XwInZX/yCISMWs3
 1G5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nkmsrqYwj1gj88dF596NhZ/KP53M52XspGSch+AxcJ0=;
 b=jZpqIU1TU5aCEQxfRduF4GtZaz0KTm3C187jTlmVqQ6R7cLgV3IT+4/irtixNouEqw
 UIfh0w5INdMgt0TFlE7jr+k6RkcqEEuOV40Jj5oZgbKcVJ+E3ZdE1u6dNPfTKztRUxp1
 QkO0rpWgp+UlH7ibjhsV3ECvSS7DKLUJGyBJfRtZNmUWjxebiILjgRd7A0eHVPEsLZ3n
 5JuG+jiyyePhJ97peYkAqPcPmiyCR/UTqTJBWnp5M3d3fBa10DJ/cPxaMVRBxy05asDn
 a8zIOl+X9pjh/BftcIiSnnvehB27gUvOOBcS5+7HnbsFlFakmkYHc/cKsBuNIUTedh1p
 OrJA==
X-Gm-Message-State: AOAM530mEZxN6Pfeo5cTt3fFaMzHtVaNhuUoay6iVGfx8tsFnfHZ5wJD
 mj/n2CM4GGkjZIF1pi1khG9TEtLAPDMergUBBqM=
X-Google-Smtp-Source: ABdhPJymbAPcalQqWHgKZWWK3WLdedxf0xGwErDqtPgRRPCjS2o9/Io1T65IVFLDucMBk3/qMBz5tlRpixV+tsfc+4g=
X-Received: by 2002:a05:6830:156:: with SMTP id
 j22mr7432776otp.75.1629447141750; 
 Fri, 20 Aug 2021 01:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210802123300.564709-1-arnout@mind.be>
 <CADYdroNf7PmpdHsfO_Hxz9ynWsLEcFVL9oX=+2nCMykuV3fNmw@mail.gmail.com>
 <20210819233145.1802a72f@windsurf>
In-Reply-To: <20210819233145.1802a72f@windsurf>
From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 20 Aug 2021 10:12:10 +0200
Message-ID: <CADYdroPApJp8pKFONJQLKpy09trqXP8TsSEBKKdAXbvZJtHDAQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH for-next] package/gtest: remove partial host
 package
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Am Do., 19. Aug. 2021 um 23:31 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> Hello Norbert,
>
> On Mon, 2 Aug 2021 15:09:06 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > >  $(eval $(cmake-package))
> >
> > add this here:
> > $(eval $(host-cmake-package))
> >
> > It works, and I see no particular reason not to allow the host package.
> >
> > > -# The host package does not build anything, just installs gmock_gen stuff, so
> > > -# it does not need to be a host-cmake-package.
> > > -$(eval $(host-generic-package))
> > > --
> > > 2.31.1
> > >
> >
> > With this change the patch is identical to my local version, and thus
> > Reviewed-by: Norbert Lange <nolange79@gmail.com>
>
> Are you saying that you are using the gmock_gen script in your
> workflow? If so, how does that fit with the commit description from
> Arnout, which says:

I am saying that I agree with the patch, not that I use the script.

>
>   This script, however, is no longer maintained and is not needed for most
>   practical uses of gmock. Even if it is used, its output is meant to be
>   hand-edited, so it shouldn't be used as part of the build flow.

My original patch [2] did only install the script if python2/3
was built with buildroot. I had a similar commit message then,
suggesting the removal.

The script is only used to create some boilerplate code automatically,
but any reference of it is already removed from the docs [1].
To be clear, this was used manually and only one time when writing a test.

Given that the script is old and unmaintained, C++ is evolving,
its only a matter of time when parsing using this script turns into a
hit-and-miss.

Norbert

[1] - https://github.com/google/googletest/blob/master/docs/gmock_for_dummies.md#writing-the-mock-class
[2] - http://lists.busybox.net/pipermail/buildroot/2021-July/616335.html
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
