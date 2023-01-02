Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0351BC3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 18:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7741C60B91;
	Mon,  2 Jan 2023 18:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7741C60B91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CiG8hOc1ESaq; Mon,  2 Jan 2023 18:41:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE2E660B98;
	Mon,  2 Jan 2023 18:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE2E660B98
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E20151BF2C6
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 18:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD0DE60B98
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 18:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD0DE60B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZRgK5ucdg7ST for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 18:41:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0E9D60B91
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0E9D60B91
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 18:41:08 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id l29so33835988edj.7
 for <buildroot@buildroot.org>; Mon, 02 Jan 2023 10:41:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S5BTSLHSSiU+n0IUeyhSH0g6oJjfw96tDvg1iQcsyRU=;
 b=g2DlWjhYzaTGcksRdXSp2yTVjaJfqqxJfaRwOkCKbNwJey6WD5O5fzzQ5zc1aoE8ZH
 cueZzx+xsHE6eTYpCKRCwRZ7QI/gkCtncLMBTjhBAKC5wIF4tUG3kNz7XhgKac3jyZ21
 gPbB4FdJGnnSwh1CgXWq0vf4eSUIX0hhTMuZgDO4tCAAj255O7pvgO748uzDsHS1dZV+
 8FEDRWFxhQkurJi2eOraB0P5RVq+aGhCdZQWIpmh0PHqw6GzB9i0+Vs/hIwPXFRfEn8i
 KKW+RDkP1Nmc0mQDipWLDKxHMz9yaj2o+BUrFVTT1GIpb4i5l8ud1GSlcApg/TJ8Qq/k
 Z9Ew==
X-Gm-Message-State: AFqh2kpIWAsyiTSXniPYb7AXkTdVXgf+pqWJrtP0mYZdeHHLRCP0vAn0
 nyUba62RA3pf7H1f64urqafp4qPLLCdpRqHXvE4VFZhccDo=
X-Google-Smtp-Source: AMrXdXtL1Bz0U/ZNa/GzjmqgoOqsSQhMeYMmfiSDG59U7ZUo1lKmERx4k4kRQ3joBwDWbDyPmcIP578y+Scvruu2zvo=
X-Received: by 2002:a05:6402:492:b0:47f:bc9b:46fa with SMTP id
 k18-20020a056402049200b0047fbc9b46famr2508279edv.112.1672684866980; Mon, 02
 Jan 2023 10:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
 <20230101233653.487175-8-ricardo.martincoski@gmail.com>
In-Reply-To: <20230101233653.487175-8-ricardo.martincoski@gmail.com>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 2 Jan 2023 19:40:55 +0100
Message-ID: <CAB1t1CxjZe+4Z0_pbNAn30GYK0UUy+7PPzsXfkvTRingfO_zWg@mail.gmail.com>
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S5BTSLHSSiU+n0IUeyhSH0g6oJjfw96tDvg1iQcsyRU=;
 b=GlBTcPcG+RQiF8wpAT0d0wJWmeCdPS5gH+/Ru9Sme23iZVtb9tQn/bOKSEcoL7Y6Iy
 57mGeEMXg+vYgVRyYDaEIeh21GEP6P2NOIzYbmxKkS441e55WN2zhS9kwp9vFZ8+0j+m
 xe/V34U4yunhtxAsgfQpMGipxezzpOdKmV4V7Z9IBOVJ/g+TFOIjo3Uwdh9fC5WWR8mI
 QSgMw787CCuIK1+/iluWoL3+Q2li+KZge0hw4LZ7y4JPbWIMTbzbOS07vm7fGT75jgoY
 E/U8lmiIq07utxxv3RKlPRDsbDJJKF18WGcOjDQF4h4Gd/xrx/rCUOOET0yPbGB9zu30
 cp/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GlBTcPcG
Subject: Re: [Buildroot] [PATCH 07/29] package/ima-evm-utils: really install
 to staging
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Ricardo,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Fixes: 8229196d41 ("package/ima-evm-utils: new package")

Thanks for correcting my work!

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
