Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F455C433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 15:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B4CD40B8D;
	Wed, 11 May 2022 15:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cjmun8KI7MIg; Wed, 11 May 2022 15:29:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 111DB40B7D;
	Wed, 11 May 2022 15:29:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA1331BF593
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 15:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C838C83E28
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 15:29:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gateworks-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id udOcYX-zFkYu for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 15:29:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FEC283E23
 for <buildroot@buildroot.org>; Wed, 11 May 2022 15:29:07 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id n10so4811784ejk.5
 for <buildroot@buildroot.org>; Wed, 11 May 2022 08:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1h6bRezquVsavgc17W4gZ8zC4n82ULhH80KtIM4zevA=;
 b=SiE42I3Vdhv0gssuzmuvGSVNg1YuF9+uaT15k9s1PJwAD2dT9lqAO2Rjg0MF7wCSrP
 DA7j7q4BFzGQYIdlvxImtq3nWuFg7sSzVbI291BNoH/25LBePZL7Y0HQ5Nx1QSGk4Gnp
 vXNda1xstTJExVpDcqRsipjn5Zodnjzhwd2Q55xl1Qh8aRZ6PXWVZhPpLzTH5ZrGNi0A
 rsm7lw/jpRwB16GKbHr0t4lj3tPBM+Bt+07hY/BvWhXUt2ExXA/T7UdL8DiseYbEYNRW
 k39UshTUSkq4R7OBzFdIMYAeDRXK6PzBgXRVV0v1s71QQYDILnDx9/xlh1VLJ+XoZdtv
 wAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1h6bRezquVsavgc17W4gZ8zC4n82ULhH80KtIM4zevA=;
 b=Q+fVK8+FA9dbfLgIgCrYbSQXPQpRmzgnFdImXgzaREWwtJtBULl5Hhzr4exquMbgR+
 ajSUeTonRAtBieFALMySqjTC/b2thE2JtmF1nYbqqvRbtk9V0qnlBQrp3SsCol33y26c
 BmtbhBX4fmdGr+mANep2tuBzT/+NdpLaOq57xcceEx1v1njAQp0EuKHD1YuYXb/W+G4o
 vUpaPX0h540BlwWjb06tH4oV4k7ZNBFgVGOl8hG9kHILwFYwyVRCWUFj3q1xNXQ1ieD8
 NEtuATOVV4UTixp+8KN930kgaruN1UZSdIYQAzsiXy6947kSw9n3LQhi0aMF4TDTzOoB
 7rRw==
X-Gm-Message-State: AOAM532QoBePvrwryDI8h7mz9OQAdhdye1+oYf3oQgqUFMnzsWtgFPP9
 YlHSdSdcLC1GuvqV9LHesp8u5Fq0RhBM3hBEN+r34tOwp05TWw==
X-Google-Smtp-Source: ABdhPJyM0k5LaScyT4VZAum0Yc7Wc9tjyobBXHpyOz1ZmscApi8UWDEH6F2ZK0U2LqwY6LaqVz2CBhn2ort+CCJ+3p8=
X-Received: by 2002:a17:907:7b9d:b0:6f4:df04:affb with SMTP id
 ne29-20020a1709077b9d00b006f4df04affbmr25251369ejc.473.1652282945599; Wed, 11
 May 2022 08:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU2OM0n2gFGy4K04NjXSQWDeAd434zyVD2vSLXvk4Y6d-Q@mail.gmail.com>
 <878rrfibvx.fsf@tarshish>
 <CAJ+vNU3KHR+J0y9o3CVOC+1zA6G3=kQG2G_bQ2PSegFho8c9BA@mail.gmail.com>
 <8735hl9kdt.fsf@tarshish>
In-Reply-To: <8735hl9kdt.fsf@tarshish>
From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 11 May 2022 08:28:53 -0700
Message-ID: <CAJ+vNU3an938LM3HPnsAuNjNVnC9VfDcy4s-rvVxsTGRpqe=qQ@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [Buildroot] how to get buildroot to update a git repo that has
 changes? (ie building HEAD vs a specific SHA)
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, May 7, 2022 at 1:07 PM Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Tim,
>
> On Fri, May 06 2022, Tim Harvey wrote:
> > On Thu, May 5, 2022 at 8:21 PM Baruch Siach <baruch@tkos.co.il> wrote:
> >> On Thu, May 05 2022, Tim Harvey wrote:
> >> > Greetings,
> >> >
> >> > I use buildroot to build a Linux kernel+ramdisk using:
> >> > BR2_LINUX_KERNEL_CUSTOM_GIT=y
> >> > BR2_LINUX_KERNEL_CUSTOM_REPO_URL=<gitrepo>
> >> > BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION=<gitbranch>
> >> >
> >> > When the upstream branch changes I would like to build that kernel but
> >> > I find that buildroot caches the repo in dl/linux/.git and doesn't
> >> > seem to know how to check to see if there are new commits.
> >> >
> >> > I realize that this is atypical as typically you want to configure
> >> > buildroot for a specific package gitsha/tag.
> >> >
> >> > How would I go about getting buildroot to update the repo? I don't
> >> > particularly want to rm dl/linux I want to instead somehow check to
> >> > see if the repo needs a refresh then refresh it without a massive
> >> > network download.
> >>
> >> Using a branch name for _VERSION is not supported. See the rationale in
> >> the manual section 18.6.2, note on LIBFOO_VERSION description.
> >>
> >>   https://buildroot.org/downloads/manual/manual.html
> >>
> >> You might want to consider using OVERRIDE_SRCDIR to make Buildroot build
> >> your local kernel source tree. See section 8.14.6 in the manual.
> >
> > Thanks for the references. I do understand that it is not supported. I
> > guess I was looking for a few simple lines of shell that would tell me
> > if the cached repo was out of date so that I could remove it.
> > # get branch from BR2 config
> > KERNEL_BRANCH=$(grep BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION .config |
> > cut -d= -f2 | tr -d \")
> > # get the HEAD commit from the BR2 cache
> > KERNEL_HEAD=$(git -C dl/linux/git/ rev-parse $KERNEL_BRANCH)
> > ^^^ but I'm not sure how to check to see what the latest revision is
> > on the remote branch?
>
> Check 'git ls-remote'.

Thanks - thats what I needed.

I was able to add this to my auto-builder:
KERNEL_BRANCH=$(grep BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION .config |
cut -d= -f2 | tr -d \")
KERNEL_HEAD=$(git -C dl/linux/git/ rev-parse $KERNEL_BRANCH)
REMOTE_HEAD=$(git -C dl/linux/git/ ls-remote --heads | grep
$KERNEL_BRANCH | cut -f1)
[ "$KERNEL_HEAD" == "$REMOTE_HEAD" ] || {
   echo removing kernel cache
   rm -rf dl/linux # otherwise won't get kernel bumps
}

Best Regards,

Tim
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
