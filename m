Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F49FC43217
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 16:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B94894027B;
	Fri, 25 Nov 2022 16:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B94894027B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zP0JExT60oEE; Fri, 25 Nov 2022 16:21:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA1784029B;
	Fri, 25 Nov 2022 16:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA1784029B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 853DC1BF5DA
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 16:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F3034029B
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 16:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F3034029B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hZ5VLAaSWhJo for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 16:21:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 445834027B
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 445834027B
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 16:21:36 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 x13-20020a17090a46cd00b00218f611b6e9so4572440pjg.1
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 08:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FI4CUEzxVTGWHuP/YvWmAl72LAv7jVpGrsdV22CmL2k=;
 b=EE/qzp5Mas1AgeJ5SzFW9ENE4RuuppbJZpN5+7Z1pmWUzpW84hgKcYNTHooIXbkf5o
 9brQkU2xfmrj0ymd5QT9jPVCyyfIKqQlK+Z9HgEDcIm/g7iWJq/FIq1FS1276CcL1Mg0
 cQhRWOaA0/kqEi/2hu0bA9GmBFQjDRPG1b78lU9BxW/q4DoRWb7BASBlGZiWcR0Q/C9u
 GJHNqosf1jmeGNQ/+aITrEduVtq7Z8vpcURRDUqLwbK3/C/NNQPkEFK28YEPh3GbbW7x
 YOJEW368vTumxqSOwKmwybqQUaWVbdjrpnlggSqGoM/3ffVcwnZTAPizaBInQ4asTlSe
 eB6w==
X-Gm-Message-State: ANoB5pnHXZ3Xgx6FoS9T/+UDxfCY4qeNVHnu+6hCOKG4ryUzZOo8MXkC
 X9UMSNlZUkU38ypZQ5CSiRFQC49dEST0ut5eAjc=
X-Google-Smtp-Source: AA0mqf7+SFrmzZ3LG/aq0KXRu7EtQlqekbGCCHmbOJ0lLJuiEoMje3HraxO/LBp6AeBm1o6I9FHrtAb3R6HsMD4igkg=
X-Received: by 2002:a17:903:22c4:b0:184:cb7e:ba36 with SMTP id
 y4-20020a17090322c400b00184cb7eba36mr19043496plg.57.1669393295625; Fri, 25
 Nov 2022 08:21:35 -0800 (PST)
MIME-Version: 1.0
References: <20221124140627.3269192-1-stefan.hager@ginzinger.com>
 <20221124140627.3269192-3-stefan.hager@ginzinger.com>
 <20221124154818.6ada922f@windsurf>
In-Reply-To: <20221124154818.6ada922f@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 25 Nov 2022 12:21:23 -0400
Message-ID: <CADvTj4pXjn2eW0ryM8jUnBW7pFgxP8P8O8SujNFxBUiGMx9Ewg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FI4CUEzxVTGWHuP/YvWmAl72LAv7jVpGrsdV22CmL2k=;
 b=B/6wiNzwHxB3A3lUBSapuF/raMAtO0qxnHNx5ANG7dGLsnzUleR97sxOmiv9IoMA+Q
 +iMxwJZ5PzHEi+8Vf1lWdFVuBX86hgCW+Apx+L7hKUh27XKN/tQoaws6b6YJvL43AIoJ
 NTtfsiUv/smvnMwUgkHPxi+hTojF6gHbiPf5zjoF3xXEcFf8ITDJVaHRbnJQwZCeVhe2
 bUpLUAcLaYXPeQCIXsIakhgYVzhq7L02C+tCBe0nsBI8SmRQlsni/MyyBIxQa6i2z4pf
 VA19rxPR/7bM6EI6DpYZjVFn4pwg1WYKzXJxUBwkmIEqOEcUpJ3RFqRDyVYcEqKi6Kru
 Cu3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=B/6wiNzw
Subject: Re: [Buildroot] [RFC PATCH 02/10] tensorflow-lite-clog: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Nov 24, 2022 at 10:48 AM Thomas Petazzoni via buildroot
<buildroot@buildroot.org> wrote:
>
> Hello,
>
> On Thu, 24 Nov 2022 15:06:19 +0100
> Stefan Hager <stefan.hager@ginzinger.com> wrote:
>
> > This package adds external sources required by tensorflow-lite.
> > Nothing is built or installed within this package, but legal info and
> > source archive is created. The tensorflow-lite makefile copies the
> > files from this package and uses them for building or to provide
> > headers for the staging folder.
>
> Please wrap the commit logs to ~80 characters.
>
> Isn't there a better way? It's really horrible to duplicate all those
> packages that we already have in Buildroot :-/

Best I can tell it's entirely unnecessary, I got it to build without duplicating
packages like that and without most of the hacks:
https://patchwork.ozlabs.org/project/buildroot/list/?series=330091&submitter=&state=*&q=&archive=both&delegate=

>
> > +TENSORFLOW_LITE_CLOG_SITE_METHOD = git
> > +TENSORFLOW_LITE_CLOG_SITE = https://github.com/pytorch/cpuinfo
>
> Are you sure? This looks like the URL for the cpuinfo package, not the
> clog package.
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
