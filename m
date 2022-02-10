Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CCAC433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 21:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CBD440863;
	Thu, 10 Feb 2022 21:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zaxWCEZ3_iyq; Thu, 10 Feb 2022 21:59:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D80F404A6;
	Thu, 10 Feb 2022 21:59:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 380B81BF20B
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25DB84013D
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 21:59:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-V0du8vEeGt for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 21:59:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F8AB40122
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 21:59:21 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 u25-20020a4ad0d9000000b002e8d4370689so8061127oor.12
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 13:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q2406/03PUdiGOJrAZYXJclSdXmv657o1KtkF5x8tLc=;
 b=Rzwbhd8Vbec7gVk1FFNrVb/k2k4gsriXdN+nJUNEOWMBFlD3mTAOhcKae6jcVw/jGT
 13AQE+il0mgm6q9yS74VRcRFUNbMzGGF55hOoMgiTOtoQoiMNG/KftZFPXtAmoQkpZcL
 fyXY+SRQKZLTQVqu5xMLFvJD8AppbHsZyUCfwPRX7iTiphDv5Sz332m/ASOTdXje1lvs
 ywhMh6NztuX/hNym3LMvXSG8Rp+YJ8bj0RL22GEdmOmRSqloVqZgwBqs2rCAfvmXzkaN
 Dgj+0PG2CCHl9Lq3wI8pL2UEpFa5+FnH5kQSx37yJs32DTvN9IXeqnhlVXBXJL3RSenc
 oLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q2406/03PUdiGOJrAZYXJclSdXmv657o1KtkF5x8tLc=;
 b=GeN6vpV2KdFjlBoS3qE9UrE90n2mpUECMBZBjE6j8gUFwAxxYf6MSYIQURtPKa54fm
 ice9ZXkLfED/+l7bdUjJfpRStg7e2/+Cfmm1mZoMP/cYF9qocSUex+JlZQt1N2EZltKw
 pCxB4gGACBKjCGF84mQg1GTlb3wQ80EpHeUnvth2NQ73Pura1AboqkYPWWX82kakWF15
 8UR9nyAfsaN0jx5ixpjR8KOZDorwfKorMX1ROFRCmVoUuqb6e5gZQPoQEhpB6VmPMU+S
 7ELJj0pVcojJEiP0Mr4W7H1UCDuzvPbF/wYVKoCoZa6EUTvDyKUQqEr/+N9e2iFCxbDK
 CcYA==
X-Gm-Message-State: AOAM533UI2+vLmrA337jUO3249rS5trhJUbuufILO91h9+LzUlAwD61w
 5k/FUs9T2HrsStuY64TezZDCJxxAMzmMZnC0ku0=
X-Google-Smtp-Source: ABdhPJwSmC2W9T5eOubRXS1DKh6VGoHL1zGXHwkh1f0HGtBILryRdxKoqhsws+73z+2asvoxO1jp3RHdZ7qQiPjyCWs=
X-Received: by 2002:a05:6870:9483:: with SMTP id
 w3mr1493849oal.124.1644530360843; 
 Thu, 10 Feb 2022 13:59:20 -0800 (PST)
MIME-Version: 1.0
References: <20220209165213.4498-1-peter@korsgaard.com>
 <20220209213312.GE2249818@scaer>
 <2cba2cd6-ca70-6336-f2fe-60649a0f1a0d@mind.be>
 <20220210203719.GA3752867@scaer> <87czjuwhcb.fsf@dell.be.48ers.dk>
In-Reply-To: <87czjuwhcb.fsf@dell.be.48ers.dk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 10 Feb 2022 14:59:09 -0700
Message-ID: <CADvTj4rDQEMeYFjKZnucs3q22x-2+P7oBsrsPvhbU_WZWAhArQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 000/107] Drop python 2.7
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Feb 10, 2022 at 2:19 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
> Hi,
>
>  > Arnout, All,
>  > On 2022-02-10 18:15 +0100, Arnout Vandecappelle spake thusly:
>  >> On 09/02/2022 22:33, Yann E. MORIN wrote:
>  >> >On 2022-02-09 17:50 +0100, Peter Korsgaard spake thusly:
>  >> >>Python 2.7 is EOL since April 2020 and almost all packages support
>  >> >>python 3, so drop it before the 2022.02 release.
>  > [--SNIP--]
>  >> I did a bit of grepping for leftovers and found these:
>  > [--SNIP--]
>
>  > Yeah, I knew we had missed a few things, and Peter had already noticed a
>  > few in the cover-letter, but we needed to move forward quick, at the
>  > risk of breaking things.
>
>  > After all, the post-rc1 period is actually to fix things we broke! ;-)
>
> Indeed ;)
>
>  >> The ones in gst1-devtools.mk and omniorb.mk look important, the rest is just
>  >> cleanup. qt5webengine is also a bit worrisome...
>
>  > For qt5webengine, IIRC James and Adam were working on it, and may have a
>  > pending change ready?
>
>  > I was thinking maybe about this:
>  >     https://patchwork.ozlabs.org/project/buildroot/list/?series=284619
>
> Yes, I guess we'll need something like that. I did a quick test to see
> if the current qt5webengine version works with python3 - But it doesn't

Yeah, that should get qt5webengine working on python3, there's a bunch of other
issues it should fix as well relating to handling the host/target
pkg-config split.

> :/
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
