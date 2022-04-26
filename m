Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C59C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 20:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F7B740B82;
	Tue, 26 Apr 2022 20:22:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2GHeJDDlxx5P; Tue, 26 Apr 2022 20:22:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0954B40ABA;
	Tue, 26 Apr 2022 20:22:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D0031BF3DE
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 20:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19CDF83E1B
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 20:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hxIH7VGDk5XB for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 20:22:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50BA083E17
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 20:22:22 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id y21so16842652edo.2
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 13:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=RfIIGTEA7gnNRexI4ooEaM4SmSn6zHXSwvQLlgyEFBM=;
 b=l45w4UCPjVga+LDc1q7c5vmBlPkSCZ2oR0VE7KaepZMNwv4iYFdPWInEEfXb/q2f0X
 rVOwhd7BRvAO90Ifk9lO3D/fL1pl4HQJZkJffhzKPfZoVNtyfuqD0DaRwxB4RvQW6SuR
 RbbxVUqa8edDZqQxbeojIUYCW0Trr5IlER2iUk8O2BAA3hlWRh7X58s30rg9x6w5RhNo
 jyNEv3H1pBEkl1nq26rbpXG7vF76fQKSk7WpxWc2RzMySTo/1LAD1aMiBUiKCu9WB7Ag
 X38XbEnrFh0RHsK1DutNns0ZPgjT5+45r4zpRgYO0EhJ12m3CJy7pxIbxOJSYgEZga39
 +RrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=RfIIGTEA7gnNRexI4ooEaM4SmSn6zHXSwvQLlgyEFBM=;
 b=cBFTMUrgiygb5KMzkmX6osxaG21JFahwcZSu8EnqBVoIrE2WZbOyPR5Zgu/ZYn9tt4
 uW1sY3T69jcZtwUBIZXrbIQgS/1h7Ui9Ft4VpzcCfhmIrTxJKyxtq+ZmomWg/HLFzb3A
 oocw3GG5skI+YcO6u0Ruyp2omOEgGOjb/BVONDGDzTsdMWKp7KCqpldKmtnhefenQT9J
 Vs2B6mR51YPYnvBZgrNDUuGPUZyhdjgB5sMm9jFpXzVi2VOuyIfjYERhbj7awz5lXQX3
 C6J8dNT6FqPfOg7RCItye0YPe7hSaG2i9vB9i5GJcFGenfbgi+0lfvaFhjZOMZAH+jw9
 73fQ==
X-Gm-Message-State: AOAM533YDQsRmlm/IYeiaQYsZJ2RYNQUm2vizQvkYCouz87E9pOww4q9
 SSR/Cbk7X3YHRZBOiWr5e9Y=
X-Google-Smtp-Source: ABdhPJxILjcv/lkntOT1fWwpT6XcX2GRmFiGqbynFrMHu0R4aYS7gQiUbu1QVnccSS3WGLHk2BslsA==
X-Received: by 2002:a05:6402:909:b0:415:cdbf:4748 with SMTP id
 g9-20020a056402090900b00415cdbf4748mr26502937edz.395.1651004540581; 
 Tue, 26 Apr 2022 13:22:20 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a509b17000000b00425edfe72a3sm3385218edi.43.2022.04.26.13.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 13:22:20 -0700 (PDT)
Date: Tue, 26 Apr 2022 22:22:16 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <YmhUeP8XcuH7x5Pc@pevik>
References: <20220416211323.3200669-1-fontaine.fabrice@gmail.com>
 <8e85d9ce-f8d9-6f76-37f2-664b9c0db08a@mind.be>
 <CAPi7W83CD7gBa+ZY5vTBOfeq7MMhZPqkrYLY6=dpqcP9_ikMmA@mail.gmail.com>
 <dc26f0ab-bf60-2c3b-6f79-f6c816cc3bec@mind.be>
 <20220424163350.GX2730@scaer>
 <56cf3cb2-d00b-b957-8b0b-2a095e5797a0@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56cf3cb2-d00b-b957-8b0b-2a095e5797a0@mind.be>
Subject: Re: [Buildroot] Removing BR2_SHARED_STATIC_LIBS [was: [PATCH 1/1]
 package/pkgconf: fix BR2_SHARED_STATIC_LIBS build]
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 =?iso-8859-2?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



> On 24/04/2022 18:33, Yann E. MORIN wrote:
> [snip]
> > I have always been a bit confused on how BR2_SHARED_STATIC_LIBS was
> > supposed to work, to be honest... Sure, it meant we wanted to _build_
> > both the static and shared libs.

>  The problem is that it only actually works for autotools packages. They are
> still dominant (more than 1/3 of all packages), but diminishing fast and
> many "headline" packages are no longer autotools. I don't really like to
> have an option that doesn't even work for most packages.

That IMHO justifies removing this option.

Kind regards,
Petr

>  Regards,
>  Arnout


> > But how were we going to tell packages
> > whether they were supposed to link staticially or not?

> > Surely we do not want a per-package option... Then we're left with
> > deciding at the package's .mk level, by hard-coding some heuristic to
> > decide.

> > In upstream, we have no such case where we'd want a package to be
> > statically linked even in the presence of shared libraries (maybe the
> > the exception being busybox, for those who want to cheaply build an
> > initrd before pivoting in the final rootfs, but that can be done with
> > a config fragment or a custom config file in any case).

> > This leaves out-of-tree packages.

> > In that case, there can be tons of reasons to prefer a static link even
> > in the presence of shared libraries.

> > So, the real quesiton is whether we want to support that use-case or
> > not.

> > If we do, then we need to keep BR2_SHARED_STATIC_LIBS and fix those
> > packages that misbehave in its presence, like done for dropbear.

> > Regards,
> > Yann E. MORIN.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
