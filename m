Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B868C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 19:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7DA240BDA;
	Wed, 14 Dec 2022 19:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7DA240BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eqv1K0TvXi9i; Wed, 14 Dec 2022 19:06:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DC0140BB7;
	Wed, 14 Dec 2022 19:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DC0140BB7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 96DFC1BF42C
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71CDD60C13
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 19:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71CDD60C13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I1zFXSblPpdr for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 19:06:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95DE960A65
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95DE960A65
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 19:06:43 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-40b40ff39f1so10383777b3.10
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 11:06:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OUfcA68DaxII8WCMdWZ0kKVUh+mmaIeYLVI+D650PQ0=;
 b=HNSdNhzBfVsGKn4A/4ikkqexm7lvM6/Xp6fQiSXXI/ls/ZNWXX0oAc/Sg3dGwjYs7Q
 LnwOKDUNtIpBtl4vzf+JqZo8XNjgq9rgx/zIFvorCNtKM2p1p8VCV+mP4NWLniQzCNR3
 QUUMhQfRz1sTklqn5WTFc7kJoRPL7nKk7bzZyf8IHpa7qnwkcLl0P48NzgTutV4du2sp
 FmbuLS6be2XMVzMDT1U6VUvdxyKEIXjrn1hu7lnNms9GiNsFaf8dChGajz20LqDTqW2p
 ARxn9DQa9InLBAfAq5yuhUBMU+7oDuuL3N2Ku4+WXwJH3//0CHveBbjrs0ueKPhfApxI
 GZSA==
X-Gm-Message-State: ANoB5pm2CS+WbDOrbz/QV0l84qVnHNRKLm4CUv1wwIBQ5O/K0xPrzSFJ
 OMyAFxDKAebCSyxe6p8iipqYntlEKAgCIdgk3Cvh2Zm4Hyc=
X-Google-Smtp-Source: AA0mqf6pw/kHH8aBE3hkQd3c2igV2Ap2SdpRyiTSanp2ziFUN3eYqdVcVWmUspN86nlFrjfXzm4o/Qc3vZ9WUNG0VbM=
X-Received: by 2002:a81:6708:0:b0:3fe:4753:33af with SMTP id
 b8-20020a816708000000b003fe475333afmr8566905ywc.366.1671044802363; Wed, 14
 Dec 2022 11:06:42 -0800 (PST)
MIME-Version: 1.0
References: <CAOiXNkA3_5sO2ajKtvco8G6O_Qufz0N=i1javZjFbDMj+zDf5g@mail.gmail.com>
 <877cytvmo3.fsf@dell.be.48ers.dk>
In-Reply-To: <877cytvmo3.fsf@dell.be.48ers.dk>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Wed, 14 Dec 2022 20:06:31 +0100
Message-ID: <CAOiXNkA74=14gXbkNwBFLrzonWtkGyQ2GnHuXG76C0z-LbrUBg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OUfcA68DaxII8WCMdWZ0kKVUh+mmaIeYLVI+D650PQ0=;
 b=gk9w6oFpee1AzAChF8q9osA2Z8XmTiU7/df0iyjw628M2QH0iMDgrvjrtaQZXvAZNv
 f06UsSQYwbfMx67D3asTOOqhjUsNBaQwUZElDxEnp6P5zegVlGwFfyKboA2fho00sa3a
 NooB45LSxjuC7i+sOJ+9XpBgaWN9B4coR8BGZSiPMjLr5PHkSwtvA/N2wW0iTLjr3R5X
 H1Bh21dkQttzQtxCNeokg7j8/BBDGjRFE8NUfcfij3nV+oZoJXtV0ZWMCD8eKnYhuv2u
 +167gTLntFWKYPC1H7gETHFPn13mhLzjdB3a/FoLL8/q1PdgvlbLApjCVXbHQ871+urI
 HG4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gk9w6oFp
Subject: Re: [Buildroot] Confusion about 2022.11 release branch
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

Thank you Peter for the quick response and explanation!

On Wed, 14 Dec 2022 at 19:57, Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Andrey" == Andrey Nechypurenko <andreynech@gmail.com> writes:
>
>  > Hello Buildroot Folks,
>  > I am currently trying to update to the latest stable 2022.11 release.  What
>  > surprises me is that there is no 2022.11.x branch as I would expect.
>  > Instead, it seems to me that the release is somehow related to the branch
>  > 2012.11.x. It could be confirmed looking at this location:
>  > https://git.buildroot.net/buildroot/tag/?h=2022.11
>  > It says Release 2022.11 but the branch mentioned in the combo-box in the top
>  > right corner says it is the 2012.11.x branch.
>
>  > So my question is whether it is intended like this or am I missing
>  > something?
>
> It is simply that I haven't made one yet. 2022.11 was released on the
> 5th, and since then I have backported the (security) fixes from 2022.11
> to the older releases (2022.02.x and 2022.08.x). Those branches have now
> also been released so I will start reviewing the post-2022.11 changes to
> master and backport them to 2022.11.x (and 2022.02.x where applicable).
>
> The reason why you see 2012.11.x in the branch drop down is that was
> simple the first time I did such a bugfix release (and it sorts
> alphabetically before the other branch names).
>
> Anything specific you are missing from the 2022.11 release?

Not really. I am including Buildroot as a submodule in my git repository. So
I was wondering what tag or branch I have to check out to get the 2022.11
release.

Thank you,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
