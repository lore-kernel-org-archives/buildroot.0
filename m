Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC27FC77B7C
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 06:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2855041E1D;
	Tue,  9 May 2023 06:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2855041E1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y-fBr6giE8vS; Tue,  9 May 2023 06:24:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C3D441E1A;
	Tue,  9 May 2023 06:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C3D441E1A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1E151BF304
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 06:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 883016114E
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 06:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 883016114E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3dZZSx89EZc for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 06:24:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76B5E61135
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76B5E61135
 for <buildroot@buildroot.org>; Tue,  9 May 2023 06:24:55 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ad714536cfso30230061fa.0
 for <buildroot@buildroot.org>; Mon, 08 May 2023 23:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683613493; x=1686205493;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ypJndKjsM7R2+3zrEQQ1py84lBH/Gnhtn+Sv6BJocBc=;
 b=EpQnIlK4dGk/oalOnXEI6qAUwuIj61mwO9RwX7w/RXS/oUJRTB5yx7RB4WaWgATeoN
 SrLjJRa8oW7LsQCxHNbJZJPcxxyPnBxb0Y0Eg5Ilkn9pqrePZTTjf6z28dmbYSeulr2F
 jN5QDS1QF9UKw6QGWXWvmq2H6r/Im2D9hmRAaAo9nDQuBIl/+7G4chR//EHjuI/AxpHf
 ubf2f/l5CnfCt8cvy+RRtOTBQqbIeXD8oqPrphRkH0iOwnxfts0kLk+NSysa47v2Irce
 Gho4BT6vPQltQ/zilrahEAQ55ch+9SC9WQJwd2e15Evrs+ihae4NOb38Wmeo7JrhBpJu
 zqHQ==
X-Gm-Message-State: AC+VfDz1gOwr55y686hJo+L8/wGN6yxdibWuLQjjj9OxtZgPiev1AYMz
 vPdMCg+VVcL4DD2P38eKvMGPchMSK7Pa7bLy
X-Google-Smtp-Source: ACHHUZ616EerAdjNyBsDWrBM9UZhlEvY9d/OiJXJz5ogWoSGVJOM4HO+sgoZi9KSqtLuRsiErZNyCA==
X-Received: by 2002:a05:6512:4c9:b0:4ec:a8c1:a23f with SMTP id
 w9-20020a05651204c900b004eca8c1a23fmr514848lfq.51.1683613493084; 
 Mon, 08 May 2023 23:24:53 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54]) by smtp.gmail.com with ESMTPSA id
 f1-20020ac25321000000b004eff3050e24sm229223lfh.125.2023.05.08.23.24.52
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 23:24:52 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-4f2510b2b98so1942033e87.3
 for <buildroot@buildroot.org>; Mon, 08 May 2023 23:24:52 -0700 (PDT)
X-Received: by 2002:ac2:5110:0:b0:4f0:e03:75d9 with SMTP id
 q16-20020ac25110000000b004f00e0375d9mr462781lfb.48.1683613492394; Mon, 08 May
 2023 23:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230428033137.620562-1-xiangyu.chen@eng.windriver.com>
 <CACXRmJio=RfDY7E+ekja9AyjioQQydcVfCRT1TrheV_OvPZmJw@mail.gmail.com>
 <20230508202808.GP252090@scaer>
In-Reply-To: <20230508202808.GP252090@scaer>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 9 May 2023 08:24:41 +0200
X-Gmail-Original-Message-ID: <CACXRmJjkvFP2chFc+fe_mpmZV7Bz5dqm6cNELnSEkNrp0gsMfw@mail.gmail.com>
Message-ID: <CACXRmJjkvFP2chFc+fe_mpmZV7Bz5dqm6cNELnSEkNrp0gsMfw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcpcd: bump to version 10.0.1
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, johns@msli.com,
 xiangyu.chen@eng.windriver.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Thanks for pointing that out, you are right, I also see the file is
hosted under another URL,
so the helper can't be used to pick the release version.

Kind regards,

Thomas

Op ma 8 mei 2023 om 22:28 schreef Yann E. MORIN <yann.morin.1998@free.fr>:
>
> Thomas, All,
>
> On 2023-05-01 18:19 +0200, Thomas Devoogdt spake thusly:
> > Buildroot has a custom site handling for GitHub [1] nowadays.
> > So it should be something like this:
> >
> > DHCPCD_VERSION = 10.0.1
> > DHCPCD_SITE = $(call github,NetworkConfiguration,dhcpcd,v$(DHCPCD_VERSION))
>
> The $(gihub) helper should only be used for autogenetaed archives, i.e.
> archives that are generated on-the-fly by Github.
>
> For archives that were uploaded by the maintainers of a repository, the
> $(github) helper must not be used, and the actual URL be used.
>
> See the manual:
>     https://buildroot.org/downloads/manual/manual.html#github-download-url
>
> For dhcpcd, we are not using an autogenerated archive, but one uploaded
> by the maintainer, so we can't use the github helper.
>
> Regards,
> Yann E. MORIN.
>
> > And the DHCPCD_SOURCE line can be dropped.
> >
> > kr,
> >
> > Thomas
> >
> > [1]: https://buildroot.org/downloads/manual/manual.html#github-download-url
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
