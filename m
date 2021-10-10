Return-Path: <SRS0=K+5a=O6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8271AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:38:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C87A9604AC
	for <buildroot@archiver.kernel.org>; Sun, 10 Oct 2021 17:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C87A9604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68333400FD;
	Sun, 10 Oct 2021 17:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3Y8yN3z_8ts; Sun, 10 Oct 2021 17:38:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78169400EE;
	Sun, 10 Oct 2021 17:38:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC60F1BF3C2
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A24AA400FD
 for <buildroot@lists.busybox.net>; Sun, 10 Oct 2021 17:38:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 52jEYt-u5oly for <buildroot@lists.busybox.net>;
 Sun, 10 Oct 2021 17:38:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83C83400EE
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 17:38:12 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id o83so13968870oif.4
 for <buildroot@buildroot.org>; Sun, 10 Oct 2021 10:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gAmAAInpAw7R68mcXP95K3e8uATxE5FkoO5jjmCV5/I=;
 b=X1ECUVQECRfT4z7DE/m8CS0tuAwxu2cQLHRl0TQaVJioSe3A//eEnVM8KapDT/iiiJ
 x3fg18K6+buiOe1DRGUEz5u9NlZ0XAbowGmYMePYtO33Tsrk5HCJW8OPgAeCJVcKUPYw
 HzWwC0z29iG+/emq8VvdUCvzU0SqF79/xVaQfjkNNUzlX5lKYzV38uI6arrBfqlRaxpp
 tLRxHrb7iQcYRuEH1I4CUrnmRIqlmunwlCKERf0p3r3mAREw2hNSpwLQOURJJPfFLDm/
 ig3kKG5jhvreqCHFUJvcaFwWO1ZbjHRQ7btTFutfMleg34SmnUULkjTsnnQw6XnyRBHC
 ARqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gAmAAInpAw7R68mcXP95K3e8uATxE5FkoO5jjmCV5/I=;
 b=MAtadqC6GWpDMOgZSqDMDteZSLEfjd8qq99ELojYwOZOPTBRyikSMRukG9ZPSPMbmz
 Sz0NKZ2bKQiYCmvsT+d9QEkLwMV+wr2n76nM7kZmwHSneRUa51vsXNF+SCkJWTpdh04z
 EM+7c52ZKZpKbPGlPopfCiFgsgqxpDQq/4aqtH/futYui/3QYyzpnopFnWC1Zx92FOeQ
 hEke9knN2uKvnX7LO1pj7lYFdBzSuePysCmE4T1mfPHr31mCN5WylxCVRrPFbjFLdS6F
 JvgKgq7OKTzTrxruyaazPZbPDhqSowQ2ntwG4KtNlyAjYKSOW3CHls0n9rG1iEo6cdHC
 9C7A==
X-Gm-Message-State: AOAM532EoxLpDLJzqDM9BCKHZiZrSUdybFVnDOB7tglKinfbqA/ygEbZ
 9XAYzQWVlYw6xNT4q40ERITLI2xSuIIeBhLbKJU=
X-Google-Smtp-Source: ABdhPJy/0JlIjBxwt9aEaCZW0L2yIpnr+iAwg/EXpwpuiPHqMVe0DT1MLoay30F5a0N6AnvCxFXlK0oUTIaiS6kejDs=
X-Received: by 2002:a05:6808:118c:: with SMTP id
 j12mr15635261oil.65.1633887491507; 
 Sun, 10 Oct 2021 10:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211009205523.3137859-1-aduskett@gmail.com>
 <20211010155556.7a2760b2@windsurf>
In-Reply-To: <20211010155556.7a2760b2@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 10 Oct 2021 11:38:00 -0600
Message-ID: <CADvTj4p4es6Aw372sS8NUN5hi3Eh9T2ZyDzpMXJnq+C-h8X8gA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 00/20] package/python3: bump to version 3.10
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Julien Olivain <ju.o@free.fr>,
 buildroot <buildroot@buildroot.org>, Mauro Condarelli <mc5686@mclink.it>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 10, 2021 at 7:56 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Adam,
>
> On Sat,  9 Oct 2021 13:55:03 -0700
> Adam Duskett <aduskett@gmail.com> wrote:
>
> > In the following patch series python3 (eventually) gets bumped to version 3.10
> >
> > - The first parts involve updating packages that are not compatible with 3.10.
> >   Either by updating versions or adding patches.
> >
> > - Then I fix a typo in python-pathvalidate
> > - Then I complain about python-setuptools and split add support for both
> >   setuptools 48 (compatible with python2) and 58 (compatible with python3.10)
> > - Finally I update python3 to 3.10
> >
> > This patch series has been tested against every python2 and python3 unit-test
> > available in buildroot, including against https://patchwork.ozlabs.org/project/buildroot/patch/20211006203823.2740442-1-yann.morin.1998@free.fr/
> >
> > In addition, I also selected *EVERY* python module to ensure all of them at
> > least build against python3.10, and everything passes.
>
> Thanks a lot for this effort! Should we have a configuration, or a test
> case that builds all Python modules, to facilitate this kind of testing
> in the future ?
>
> Also, should we drop Python 2.x entirely before merging this, to avoid
> the complexity on the setuptools package? Or do we consider the
> complexity to be reasonable, and therefore we handle the Python 2.x
> removal later?

I think it's fine splitting setuptools for now, I had written a patch
doing something
similar a while back and I think it worked without major issues.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
