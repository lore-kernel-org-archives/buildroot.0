Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0782BC38145
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 20:13:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B209061182;
	Tue,  6 Sep 2022 20:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B209061182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dB36oMrlTgCr; Tue,  6 Sep 2022 20:12:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C47EC61148;
	Tue,  6 Sep 2022 20:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C47EC61148
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6AC51BF2A6
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 20:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF03F40C1D
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 20:12:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF03F40C1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WTGc19Soc1P9 for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 20:12:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 848CA40169
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 848CA40169
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 20:12:54 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id i26so3331862lfp.11
 for <buildroot@buildroot.org>; Tue, 06 Sep 2022 13:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=O0cP7JsTaZY4wK48kG6I2nAPxsXPXyoG7cM2KNWZA74=;
 b=ChOzY2+jmN5eApbkbO4Bf3I0WYPcKdRCMBSw1Zvm6/9FJ111Lrzo4SdLuBZ5O7IR1P
 d+GsBPmw5Jsy3NfO9hCvaPseXN1m/p22JJ0bELdU6MHzoc2s9SVjD+k7OZXviw2XEnPK
 aIFFDc1LUvIj+BEsxQjAoHoXsPayF1G1kn05EZMO/5QFz+TBKjPMVxz9hqMgQcL4UV0e
 cvjbG8Qv9hLJpU2AzFXbi1bu988aBgylC4I1lfZtKEBF52QByVeql/iO6JfzV8mJOGeX
 g+TRQAlDy2QkJ8oIrH6JwShELu9Op9tdnW2yy8T2SUrZ7+QlsxL/YRNLm4Z0ALKCDpHM
 etAA==
X-Gm-Message-State: ACgBeo0BTmRcphznViTFSubTk3qLbxbNsciqrAn7XomHO74Gmplgu3dP
 8HBcXnJvffb/a+qsdIS5eDY=
X-Google-Smtp-Source: AA6agR4vpAEtjqM5vdgjYcXlKinnFQ9Vkh6hu11TyLbl37+heIcf6BZ/snbXSKjIzULSNLBrRuQQpg==
X-Received: by 2002:a05:6512:3684:b0:494:7663:6c5f with SMTP id
 d4-20020a056512368400b0049476636c5fmr15526lfs.613.1662495172303; 
 Tue, 06 Sep 2022 13:12:52 -0700 (PDT)
Received: from curiosity ([5.188.167.245]) by smtp.gmail.com with ESMTPSA id
 a9-20020a196609000000b004946274b7d6sm1940498lfc.166.2022.09.06.13.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 13:12:51 -0700 (PDT)
Date: Tue, 6 Sep 2022 23:12:50 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <YxepwuzGvwsBYqGc@curiosity>
References: <20220904205702.1488199-1-geomatsi@gmail.com>
 <20220905201727.GJ1490660@scaer>
 <23566bac-ad05-3bd6-1b0b-ad4f3b3f5c20@mind.be>
 <20220906200718.GA1490660@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906200718.GA1490660@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=O0cP7JsTaZY4wK48kG6I2nAPxsXPXyoG7cM2KNWZA74=;
 b=BU5awEXX4eM0wp3g1Wst7McdMnj/yQV1ZRJKp3EteRAQgI3zt4RRNiej7h2C/i5Yke
 A5MuYU3rHaMxIlHkPFTdX3UEekB1hN/Ro2QbblI/lf31cCI7YgApkzpdf7Z8SYQS8FsF
 BPx6rtE7rCiYORQS+TnwynsDfvjhlCiaBbcZc2C1dugmgYS4WzRiYI+Sy0YVlGlJI/5M
 06KGviiBx7FwO6d0JpRfk5aHdbQ1Y5IwCzCqrZQeJI5if3zdEjC8PuOMUADMNZpySA3b
 fRz+Cy+/Kkbl8cz1cZNeCb3xSjYso1pW4g495jPCkMehrx2/8WU6bN9sWEt1QkAoOpBc
 59GQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BU5awEXX
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-tools: perf: add
 host-python3 dependency
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout, Yann, and all

> On 2022-09-06 21:46 +0200, Arnout Vandecappelle spake thusly:
> > On 05/09/2022 22:17, Yann E. MORIN wrote:
> > >On 2022-09-04 23:57 +0300, Sergey Matyukevich spake thusly:
> > >>Linux kernel commit 00facc760903 ("perf jevents: Switch build to use
> > >>jevents.py")
> > >00facc760903 is only parts of 6.0-rc kernels so far, so unless one uses
> > >bleeding edge technology, there is no issue. So, paying the price of a
> > >host-pytohn3 build just for release-candidate kernels is a bit too much
> > >in my opinion.
> > >So, I added a config knob to drive this, like we have for host-openssl
> > >and a few other host programs for building the kernel.
> >  If only python is needed, no modules, then $(BR2_PYTHON3_HOST_DEPENDENCY)
> 
> Dang, that's right, I totally forgot about that one...
> 
> > should be used instead. That checks for python 3.4 but I think that that is
> > fine for the kernel as well. If not, we should probably bump the minimum
> > system python3 version.
> 
> The imports are:
> 
>     import argparse
>     import csv
>     import json
>     import os
>     import sys
>     from typing import (Callable, Dict, Optional, Sequence, Set, Tuple)
>     import collections
> 
> I think hey all are from the stdlib, so no external module needed
> 
> So, indeed, BR2_PYTHON3_HOST_DEPENDENCY seems a much better fit...

It looks like Python 3.4 is not enough in this specific case. Looking
into the kernel commit that introduced jevents.py, it checks for Python
3.6 with the following comment: "jevents.py uses f-strings present in
Python 3.6 released in Dec. 2016."

Regards,
Sergey

Regards,
Sergey
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
