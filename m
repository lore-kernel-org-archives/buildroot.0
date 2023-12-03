Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A55C10DC3
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 21:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 054FB4047D;
	Sun,  3 Dec 2023 21:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 054FB4047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t2FzBD7TP615; Sun,  3 Dec 2023 21:56:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05017405B1;
	Sun,  3 Dec 2023 21:56:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05017405B1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75EF31BF3EE
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 21:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C48B60A67
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 21:56:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C48B60A67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ARiK1wJmd0gc for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 21:56:18 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4117B60A62
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 21:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4117B60A62
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c0a03eb87so6075915e9.3
 for <buildroot@buildroot.org>; Sun, 03 Dec 2023 13:56:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701640576; x=1702245376;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TiEjAYGT9eWpNRyD94Y7Q3OsEcGUi0u99OoR7N+WEjg=;
 b=ViCMKCimeZqYaGueBam3cGYu7ubRtqAdA757ZK8sATB68zIEuKMZ9fVfED3RlSMAIl
 3qs5vAQ9Ktnby7wHLSJdyLu+Q6WcdgJAwTqELwVZ72aK3X4JZJMNQn2/R9JIx4S/eipr
 Qj9vy63358do1SxAvNEcvlSmD9y5W3l2BiWFTcTbbZRjbP6j/S4zu4ba2+Yv990NcLY+
 4GwZkRpCuV3cdOTtyKEgKxkgXnmIbMiSAsS6go1/oKcaf74vjjSBNsJ9UtvgPqXFJ6Et
 9lvRzn7H9v4y2rOSQYNm0YJk2onto+78pT1J4Mt2Xpu4tA/RvXSl+ecUzeWaS0khUML6
 GZPg==
X-Gm-Message-State: AOJu0YyW0c8sXwB/6ixfBdwH9Fty4yr9uMstNUqTUmYCosQd0D/Lry4q
 X5ta2vK5bh4jdla5OosEdWA=
X-Google-Smtp-Source: AGHT+IHhhWnkrMCFO2RHxV3TtVD6OuUW7x4BYyuKPeZl76Ymyi3bAI5wDCXqgdd354voWoN9xFT2DA==
X-Received: by 2002:a05:600c:4ecd:b0:40b:5e22:2f9 with SMTP id
 g13-20020a05600c4ecd00b0040b5e2202f9mr1050978wmq.101.1701640576037; 
 Sun, 03 Dec 2023 13:56:16 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c311200b0040b42df75fcsm12791232wmo.39.2023.12.03.13.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 13:56:15 -0800 (PST)
Date: Sun, 3 Dec 2023 22:56:13 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20231203215613.GA6418@pevik>
References: <20231116201629.2623827-1-pevik@seznam.cz>
 <20231127170918.GS3177259@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127170918.GS3177259@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701640576; x=1702245376; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TiEjAYGT9eWpNRyD94Y7Q3OsEcGUi0u99OoR7N+WEjg=;
 b=d1lx1ZytkUN0Mj7T7deVznRQDZnY2AToCPh8xtlZ4MgyKzhAACsg+ecOrO2nQEJQyp
 8n8lw/WvWSAAUJ2HSo9d7S6d3KwaDqCjh3OS/qglW/a+rxAnW9hV7kmOuXb76obZz0Vt
 kXihV3yg+iZHnJ2G9zAf575cT9ixPIbwxOiSG21+/cWd/1yTnJS2iulVh3IIKrSRsJ4s
 T6QcEeAFteEPLGH5X1rX69JFrU2nEBTrukQ5tykEr/F4cIdQZoU2jZ7Gc1oCJ1vy3/9Q
 ZHTbHO//o9rKCEgd6dmDZhwvG0eXbYOzrPEfux2P8O1+PDDdmCoQpnVfEdufrwGVUftB
 pTIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d1lx1Zyt
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: fix build failure
 due to glibc <= 2.24
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <pevik@seznam.cz>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> Petr, All,

> On 2023-11-16 21:16 +0100, Petr Vorel spake thusly:
> > From: Petr Vorel <petr.vorel@gmail.com>

> > Backport upstream patches that check if <sys/random.h> exists or not. If
> > it doesn't exist it uses uses the corresponding syscall.

> > NOTE: This would not be enough on Linux kernel < 3.17, but that's old
> > enough.

> I guess that's about kernel headers, i.e. that would cause a build
> filure, not a runtime one?

> If so, that would need a dependency on kern el headers;

>     depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17

Thank you, sure, I'll add it in v2.

> > Fixes: http://autobuild.buildroot.net/results/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/
> > Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> > Hi,

> > I'm sorry for the noise (I sent unsubscribed).

> > NOTE: I was not able to test the build, therefore it *should* fix it.

> Giulio reported build failures with this patch applied, and also:

Yes, Giulio reported it to me as well. I plan to fix this issue in upstream
first. Unfortunately I'm very busy now, I hope I'll get to this soon.

> [--SNIP--]
> > diff --git a/package/nfs-utils/0003-reexport-fsidd.c-Remove-unused-headers.patch b/package/nfs-utils/0003-reexport-fsidd.c-Remove-unused-headers.patch
> > new file mode 100644
> > index 0000000000..0331a8c9f8
> > --- /dev/null
> > +++ b/package/nfs-utils/0003-reexport-fsidd.c-Remove-unused-headers.patch
> > @@ -0,0 +1,42 @@
> > +From 1a4edb2aa6b9b88fcdcb8d82b262467d06527623 Mon Sep 17 00:00:00 2001
> > +From: Petr Vorel <pvorel@suse.cz>
> > +Date: Fri, 10 Nov 2023 10:35:33 -0500
> > +Subject: [PATCH 1/3] reexport/fsidd.c: Remove unused headers

>     $ make check-package
>     package/nfs-utils/0003-reexport-fsidd.c-Remove-unused-headers.patch:4: generate your patches with 'git format-patch -N'
>     package/nfs-utils/0004-support-reexport.c-Remove-unused-headers.patch:4: generate your patches with 'git format-patch -N'
>     package/nfs-utils/0005-support-backend_sqlite.c-Add-getrandom-fallback.patch:4: generate your patches with 'git format-patch -N'

And I will fix this as well.

Kind regards,
Petr

> Regards,
> Yann E. MORIN.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
