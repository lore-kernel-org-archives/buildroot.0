Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A518C19F2D
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 20:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1E5D40297;
	Wed,  3 Aug 2022 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1E5D40297
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cbPzEvObBnYS; Wed,  3 Aug 2022 20:52:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4E494026F;
	Wed,  3 Aug 2022 20:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4E494026F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 121E31BF3CA
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E109260812
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E109260812
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cu7UTSA8Xlh7 for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 20:52:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF5956080A
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF5956080A
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 20:52:10 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id f14so13759390qkm.0
 for <buildroot@buildroot.org>; Wed, 03 Aug 2022 13:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ft4P6cF9ijDSDFwjAkSXDk4lzvdgYUATqf9uP1pyJys=;
 b=LiXxEHV4TzdiQRhsVHaBni74tJgtWO83S4PQlk+xjcWq98K8cThQigy8GMQUb52y+W
 VAyp4ATH5lNI2bEsE1XAhskke+FDZsaJX7SwoNCaMpuaJbZ9DkeZYmmDmUFuupmnyfyp
 JxDRqbUMzzgB6mh22yo83f/FodSV/D6L11gCrom4SBukk6S2kSuGThZ6JzAgggzcpjuV
 N7I32xbl509pPbDhX53jtwkv9MGq9Rk5ulM2CJpNLjJ6WZSk868TmlPQ9xWMbRDPjLag
 M3eDOqUXW0y0csS2vF2zShZ1hvZBhILwI0V8D+5gub64pf6FqwV+iCeJDpW0aHshwcxF
 zeLg==
X-Gm-Message-State: AJIora/2c+AmwcdHvOlUMpktyNQ3T4T1fcqtKlxp2pxxztUUMEk87v6g
 IGTESpAbe9hL/HoxdMW788Uz2btgvMeQYg==
X-Google-Smtp-Source: AGRyM1u8eQiCzDkseZjiJ/DNqtLCLWsMwEFTz0/c+6kd7637HN4vNNz9u5B5ty+7facMuMaLJXbZwQ==
X-Received: by 2002:a05:620a:461f:b0:6b6:63a3:72dd with SMTP id
 br31-20020a05620a461f00b006b663a372ddmr18496344qkb.681.1659559929781; 
 Wed, 03 Aug 2022 13:52:09 -0700 (PDT)
Received: from hefring ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 m26-20020ac866da000000b00339163a06fcsm4032444qtp.6.2022.08.03.13.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 13:52:09 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Date: Wed, 3 Aug 2022 16:52:07 -0400
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Yurf9xxwwP+UWWpl@hefring>
References: <20220802202142.1770838-1-Ben.Wolsieffer@hefring.com>
 <20220803000843.7adbecf5@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220803000843.7adbecf5@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ft4P6cF9ijDSDFwjAkSXDk4lzvdgYUATqf9uP1pyJys=;
 b=6AEzmdUR9WJxwFQVzgNUC9l/87aPhwCPk4fDTigYHxMLJlDf+/CUfX5bIlRDFTgq3Y
 6FyVVY1v8VTd/D6pLGUXcAKbczalenc6TP2WckSM8ojAJk6Mhx5Jnj+kHgj3cD6Qh7HX
 yErYLAENMp0cBpuWX1dVD2NNWG//DvOm3GtWb6eaqCgS/2UPK8yMpVTuN01LnNy+fNDZ
 h2DtgtxtvRurzbKXmKMIT09MU8gCapUcKMdXssty45PmEhUTGJubERWjnHrPKhzjnJ0G
 GBHQjT5Egdcs84lQPchgsLhePsH6WMCF0GkgwidU8c++TojAUSAtgHUcI4l39bg3enAK
 GIgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=6AEzmdUR
Subject: Re: [Buildroot] [PATCH v2 0/4] Add support for FDPIC binaries on ARM
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thanks for the review!

On Wed, Aug 03, 2022 at 12:08:43AM +0200, Thomas Petazzoni wrote:
> Hello Ben,
> 
> On Tue,  2 Aug 2022 16:21:38 -0400
> Ben Wolsieffer <ben.wolsieffer@hefring.com> wrote:
> 
> > Introduces support for the FDPIC binary format on ARM. FDPIC binaries
> > enable more efficient use of memory on no-MMU systems.
> > 
> > The first patch reverts the removal of general FDPIC support, while the
> > second adds support for FDPIC specifically on ARM. The last two patches
> > disable FDPIC when building Linux and U-Boot.
> 
> Thanks a lot for this support! Could you comment on which
> gcc/binutils/gdb versions have support for FDPIC on ARM?
 
Support was added in GCC 10 and binutils 2.31. It appears that the
patches to GDB [1] were never upstreamed, although mainline GDB seems to
work more or less fine without them. gdbserver and the kernel need
patches to support debugging on Cortex-M processors, but this is
unrelated to FDPIC.

[1] https://github.com/mickael-guene/gdb/commits/gdb-7.5.1-fdpic

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
