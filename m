Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7072EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 20:32:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA8766113E
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 20:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA8766113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A63B26074F;
	Wed, 15 Sep 2021 20:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V6lspyXnN02L; Wed, 15 Sep 2021 20:32:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA58260712;
	Wed, 15 Sep 2021 20:32:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B85C81BF2AA
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 20:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7E3140665
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 20:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cAqpkH7fmWgq for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 20:32:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EEC7040649
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 20:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1631737928;
 bh=mtiL5dM7RkhZUYOOl4PvomE4ZGrroFd7WJI+bURR4Ag=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Ir++6Q8Dsx0mkxgopItL4Wyu2vxnjh7nju/mSDBZRAnKAY5dyhfCgatwWF27vXZZx
 +4NqFbuDZjSx/RC90RbYX7YloTIXsN1bdS4DLh72UwE/ECxfTeqXTZUd1r1CaeDIy4
 MgUNg7q9J/KGEOvYyJya0TrSNetP1dmItmDmugr8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.112]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFKKh-1mgHyY3uxd-00Finb; Wed, 15
 Sep 2021 22:32:08 +0200
Date: Wed, 15 Sep 2021 22:32:06 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Rafal Gorczynski <rafal.gorczynski@ecosystems-group.co.uk>
Message-ID: <20210915223206.43a7bda0@gmx.net>
In-Reply-To: <20210915190617.5d64460f@gmx.net>
References: <00597E818BDD634EB31FF8A2ECBC4934AB0ADE22@ECO-SRV.ecosystems.local>
 <20210915190617.5d64460f@gmx.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:P5ohYfTXePs3T/rLUTFSVdq8JMgEoNfzglNyKb3kzIlsbm1lIBw
 TEFUmPHTLM4zDMQs81iei8JAzVWjHoldZl+RhSSXzMI1k5zT1FFY37BQBuXJzyC7f++TucI
 BImGPO4OFmV9VsMWP3CVrEtT2KWUnpFZ0HVwvEB1Vr9VoDZ57XMGdhzygZSY94+yIDScQJx
 r+zg5HsaDdvHXE0k3/53w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vjLoc44olCs=:11Rb71mhlFsm+CMs/j3e2G
 eR8ox/YtUWTKc7pX2q4gyxOU0vnPDNG+/TBb52aIOD/Oa+AD7PKZbGdTG0MZXaURvucjAa0mh
 TMuadnnHrMy8mhnHI+Xbfw6BoMcWd3KuJu9xzWJEOXsC/oJVd8HQY8MkWLY3d5rXoKG49FzEr
 e1/2GoMEM4voeNI/SosEy/ijOpLvYgj9mbgBkp9ygaBI7wlUbRJH38x6134pz+YFFqDCQlWQ7
 aKaR6M5Ox5vMd1nqQkmrXySPs2n4M3gETzOqRq/5vQK3+IIAawuybjf5ct8y4IBmC4O937ob5
 b8Dib1BrBoDUhv9ywuSDif8sBu3eIhJmaODC9utrQcs8uQYX1aJ48wYBR04MiuUSRUOB3S6PV
 weSS0jGRQfpW5lpgV0zygCs6pLOC+ybA9L9MOD1hD4K78gZ+TUwLjjFfORf4viHcAAmhaxYgT
 mMBtZ+3gKcLjb0WllNA571bMfVESuwNOuTUVg8KR2ALgmITaLLhqxT6n5s2bDCLFlAmsY9viZ
 oFzq+P6HaMDuZupKzMY6xEQLONUIw9jj2jCm1dJDmdnkx+L4jcNwG8FoV1bBK9dyal4bor/tl
 J1B8mSRAvzpd14ojo9yL8ImUEUuWyldyyDp269WCnaC2WxfohFAjKQNiW3X6n7ozcQNXJj1UN
 3K/rpqRryno+w9u2fowwwfcp22E+6x6gtCQFXexKwVSMiFmAYgxcUQQtFYae5W5a4LpcgMRNs
 27luqi2B0s0B57p1ipjdeaboWcLrUzbbscYRJTwLGehkGSfMoKocD2xEt52rSGy4SPoIGnTI/
 RyRyH3b93X7JrSqc2Gx9hHiVcP7ijCp+DQL6CUAaWDVExog+RzBzWiKRNzJre5yDWrqPGZoQj
 +0MQLWOnL8uCvQmGF6v5TEThEK4YQLaUucIyIUwKlyFdKIP/BDBLsmov3zWYV7z3vBiBxkpL5
 CPT52Mcp90hSIpxERwYFEgdmMOMNW2B0vRDG1LGKFfnVaKj7sqLnAryBKDw3zFQa52ePjxTuR
 eTrjbL6Af1TZ/DUH4dArn/DiqkX69PNCap84zxvrGqyO4uEpdiqmq8hz9u0WNE4A1DC96AHJL
 7TGtlCV0FXG5gk=
Subject: Re: [Buildroot] A problem with running Xorg 2021.08.x
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On Wed, 15 Sep 2021 19:06:17 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Rafal,
>
> On Wed, 15 Sep 2021 12:47:56 +0000, Rafal Gorczynski <rafal.gorczynski@ecosystems-group.co.uk> wrote:
>
> > Hi,
> > I'm looking for help with running Xorg in my image, tried multiple branches such as 2021.08, 2021.05, 2021.02 with no luck.
> >
> > This is what I've received from Xorg
> >
> > [   353.565] (II) LoadModule: "intel"
> > [   353.565] (II) Loading /usr/lib/xorg/modules/drivers/intel_drv.so
> > [   353.565] (EE) Failed to load /usr/lib/xorg/modules/drivers/intel_drv.so: /usr/lib/xorg/modules/drivers/intel_drv.so: undefined symbol: vgaHWFreeHWRec
> > [   353.565] (EE) Failed to load module "intel" (loader failed, 0)
> > [   353.565] (II) LoadModule: "modesetting"
> > [   353.565] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
> > [   353.565] (EE) Failed to load /usr/lib/xorg/modules/drivers/modesetting_drv.so: /usr/lib/xorg/modules/drivers/modesetting_drv.so: undefined symbol: shadowRemove
> > [   353.565] (EE) Failed to load module "modesetting" (loader failed, 0)
> > [   353.565] (II) LoadModule: "fbdev"
> > [   353.565] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
> > [   353.565] (EE) Failed to load /usr/lib/xorg/modules/drivers/fbdev_drv.so: /usr/lib/xorg/modules/drivers/fbdev_drv.so: undefined symbol: fbdevHWSave
> > [   353.565] (EE) Failed to load module "fbdev" (loader failed, 0)
> > [   353.565] (II) LoadModule: "vesa"
> > [   353.565] (II) Loading /usr/lib/xorg/modules/drivers/vesa_drv.so
> > [   353.565] (EE) Failed to load /usr/lib/xorg/modules/drivers/vesa_drv.so: /usr/lib/xorg/modules/drivers/vesa_drv.so: undefined symbol: VBESetModeParameters
> >
> > Full Xorg.log https://pastebin.com/nu5wpHex
> > Full defconfig https://pastebin.com/RLJRwMES
> >
> >
> > I don't have problems with branch 2020.08.x with the same defconfig.
> >
> > Any idea?
>
> Seems similar to the problem fixed by commit [1] (for the fbdev use case), but take a look

	s/fbdev/fbturbo/

Regards,
Peter

> at the linked bug report/mailing list report for hints about the module loading order in
> xorg.conf file and/or needed patches...
>
> Regards,
> Peter
>
> [1] https://git.buildroot.net/buildroot/commit/?id=9dc2b4a4eee557d3d9e7df31e9d2e96f364a2f03
>
> >
> > Rafal
> >
>
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
