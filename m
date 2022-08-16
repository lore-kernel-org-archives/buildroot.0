Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC17C3F6B0
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 08:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A334F40491;
	Tue, 16 Aug 2022 08:49:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A334F40491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wntfdoRwZ6qq; Tue, 16 Aug 2022 08:49:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9424403F5;
	Tue, 16 Aug 2022 08:49:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9424403F5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BDD181BF2A4
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92D6E4136C
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92D6E4136C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jfwAz9HJckw1 for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 08:49:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3925B408F0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3925B408F0
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 08:49:05 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 ch17-20020a17090af41100b001fa74771f61so1105987pjb.0
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 01:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=sXdQksMW9H/q1toOVcckJCI75vofbe/u6gkm0TbjoaY=;
 b=nCRy6eeEeaBuJk+oaRinV980L4fRXeQfrDW6DYDquZCZn5B1icEENlcGzOtOV1UeEG
 jECLEUU1r3xORnNTP+NtlA1RFu7aetJb4IOews7wXtiRvRWjnhBOVeWbGsGuJMSttlhH
 BjXanF84V/x+2FOYn6YmmozAybZQo9wOzxMZI26ODMV4nndmb3QAO78CdUyUiEw7xR8Y
 bGgDyHcHFRBYckvYfkQiRHScYF2QmyUqMnhZwGbi472wEn6NvZHi3OMzM4I/C4rg/wEL
 /ofoenToWxkP6vZiXZ39NRmpL2pGXTYk/TtHrrtWG09VUneBsU4t+5Mx9mKQKFdZXkI4
 rGqA==
X-Gm-Message-State: ACgBeo3d7zYB9tLX+6YTyfXM7yilcbITowLNkmcFprDagF27YWUvX5sI
 hV7x5/FFNDaOpqoCWa87HkFOpRB4hpmJ7WPtszo=
X-Google-Smtp-Source: AA6agR59xcty4Dh01JXLLPdDp8MznazNBDZ0Rw6Rj50UOA8u84kEgzGKsTH2r2TYc5GLOgDdC4EwycOTGV08w1iPc50=
X-Received: by 2002:a17:90b:4acc:b0:1f5:7f05:12e8 with SMTP id
 mh12-20020a17090b4acc00b001f57f0512e8mr22062032pjb.92.1660639744529; Tue, 16
 Aug 2022 01:49:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220517215933.1553086-1-james.hilliard1@gmail.com>
 <20220723211053.69edd126@windsurf>
 <CADvTj4pD0cQLv4LgWoJ1HkhhTj5MZ10TdGG1hfNANPy0EkeLrw@mail.gmail.com>
 <8735dwfv3c.fsf@dell.be.48ers.dk>
In-Reply-To: <8735dwfv3c.fsf@dell.be.48ers.dk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 16 Aug 2022 02:48:51 -0600
Message-ID: <CADvTj4pnStjbQPmQ8ktJwpiUucTJOG5p9gm2SA2fMCucgT9mwQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=sXdQksMW9H/q1toOVcckJCI75vofbe/u6gkm0TbjoaY=;
 b=l/FkjyJNaRnuqxPbIYzNTNm0nw4iVuu+A+VKJCLKWwTm+T1Fd87K/v8F4t26OumI0W
 2KEJns0IP6Pf2rNoElIWlh6rzitQrixLluBlrUtwGWfF7ouusiXQ0PArOJ+Fcf4T4C8z
 rbQNHXskTrIC1L7R7NnONuyj1PjoMWm9LGpOyfdUAUTbU8ODjHUldc7U/NEw7/aOWgQ1
 GJGNcv4/kdGW9+8pGgieoEyIFiEVUlxJfajaXYInglP1qoTkbjarj7WC5R7tYqVoCNIA
 m+P880bdLInGgOI3aZs4DKW/Wnpy8Y8VOs48qEItLoChqO57Ci4ijwSfo0RWDiBmr1C0
 MT4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l/FkjyJN
Subject: Re: [Buildroot] [PATCH 1/4] package/python-typeguard: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Aug 16, 2022 at 2:31 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
>
>  > On Sat, Jul 23, 2022 at 1:10 PM Thomas Petazzoni
>  > <thomas.petazzoni@bootlin.com> wrote:
>  >>
>  >> On Tue, 17 May 2022 15:59:30 -0600
>  >> James Hilliard <james.hilliard1@gmail.com> wrote:
>  >>
>  >> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>  >> > ---
>  >> >  package/Config.in                              |  1 +
>  >> >  package/python-typeguard/Config.in             |  6 ++++++
>  >> >  package/python-typeguard/python-typeguard.hash |  5 +++++
>  >> >  package/python-typeguard/python-typeguard.mk   | 15 +++++++++++++++
>  >> >  4 files changed, 27 insertions(+)
>  >> >  create mode 100644 package/python-typeguard/Config.in
>  >> >  create mode 100644 package/python-typeguard/python-typeguard.hash
>  >> >  create mode 100644 package/python-typeguard/python-typeguard.mk
>  >>
>  >> Series applied, thanks. However, you had forgotten to add yourself in
>  >> the DEVELOPERS for the 3 new packages, so I have done so. Could you try
>  >> to remember for your next new packages to do that?
>
>  > Oh, I don't actually use these packages, they are just need to fix
>  > python-flask-jsonrpc
>  > that got broken by an update for a package I do use(pyyaml) so I was
>  > just fixing the
>  > pyyaml update breakage essentially by adding them and updating
>  > python-flask-jsonrpc:
>  > https://lore.kernel.org/buildroot/CADvTj4rxnoRp-ZZPhfB2ANhw3+294F97A2smcmhULR4WfDsqrg@mail.gmail.com/
>  > https://patchwork.ozlabs.org/project/buildroot/list/?series=300745&submitter=&state=*&q=&archive=both&delegate=
>
> What is the version dependency between pyyaml and python-flask-jsonrpc
> exactly? Do we need to backport any of this to 2022.02.x / 2022.05.x?

Hmm, looks like I mixed up pyyaml with jinja2:
https://lore.kernel.org/buildroot/7585dcea-4e32-a582-e138-e7e225609398@gmail.com/

What's weird is that it apparently only broke when bumping to 3.1.2:
https://github.com/buildroot/buildroot/commit/4b931400a27cab4aeebbadc0caca55d41300c739

However based on the flask 1.1.4 jinja requirement:
https://github.com/pallets/flask/blob/1.1.4/setup.py#L57

I would have expected it to break when we bumped to 3.0.2:
https://github.com/buildroot/buildroot/commit/873dc46faf204439da1adc9deed5102cdc522f41

So it looks to me like all the flask bumps should be applied to 2022.02.x and
2022.05.x as flask 1.1.4 AFAIU is supposed to be incompatible with any jinja
versions above 3.0.

>
> --
> Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
