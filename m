Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E318CECAAA2
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 03:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F1416108E;
	Fri, 26 Aug 2022 03:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F1416108E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fA1TLPppbk6B; Fri, 26 Aug 2022 03:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 354786108C;
	Fri, 26 Aug 2022 03:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 354786108C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 094211BF9A4
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 03:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E07DD4195C
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 03:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E07DD4195C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s3VqMDONiOE3 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 03:22:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2DF041959
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2DF041959
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 03:22:57 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id g21so277613qka.5
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 20:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=CsCEg8guNbqHEa9Tev4pkxX3vI6Gd9J/1lgy7hhgP38=;
 b=Fzi8a+R2A1piK63lh9VnPZY9720EThtn4A/qKx/AkQEL5wWFdIZxYrdXyVqjpaRE09
 6YsNlmbROcS0GSaDLnTuJoR1TLX9cqyZ6JvKmWQkCpjtZDtdXAKvd8nkcKmIgjVkGnKB
 etxYd6655XjS/GfXN04s3cRG05udO7u9ScGJzXEVaFFF9Zf2MDu2FQGPrDmV4pyfKYhP
 egDmtGXhWZDFHQuGqkfaOfxTP3jp9mtGgh0c25NSl5teT54pVE6+zoLv5ud2Su/j6MrU
 YT+XEgAQ29w4HK5qK0J+scFDnDmEBZtH/Y78HfZ5+YEA6UK4vxHbBCBdrbST8bT2hs0K
 sNsg==
X-Gm-Message-State: ACgBeo1BS4bSAdZKfeoMOQ0c/MAhjX1a02KqEcnCX1KRkXE18xM/JwCF
 ahsWvj3YTdrRJr0EsyMIOmgGB+xwliU=
X-Google-Smtp-Source: AA6agR6sxOTuXtKsDL2hkvChbBjjGlOVoc7aAniMZg/cUUZJiuJRjsdSWGRt/kF/4DdcAB/nDwF1ow==
X-Received: by 2002:ae9:ea13:0:b0:6bc:2056:100c with SMTP id
 f19-20020ae9ea13000000b006bc2056100cmr5287652qkg.100.1661484176419; 
 Thu, 25 Aug 2022 20:22:56 -0700 (PDT)
Received: from Dell-Inspiron-15 ([2601:18c:8380:74b0:e8e5:f40c:d741:8f07])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a05620a288f00b006a793bde241sm910485qkp.63.2022.08.25.20.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 20:22:55 -0700 (PDT)
Date: Thu, 25 Aug 2022 23:22:53 -0400
From: Ben Wolsieffer <benwolsieffer@gmail.com>
To: buildroot@buildroot.org
Message-ID: <Ywg8jYoxicKqa5e2@Dell-Inspiron-15>
References: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
 <YwNR5ySvpk0/Q0Lr@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YwNR5ySvpk0/Q0Lr@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=CsCEg8guNbqHEa9Tev4pkxX3vI6Gd9J/1lgy7hhgP38=;
 b=Od9Arkk7HZUsleLO2zke3Vli9qZW+u+Dj9XO3Tf/nxbzGW6UbDCiKXOIlU07rYRFDo
 eOqouQoRqFMJ7pgU7bmRg/7mqXGElyIEDD7Hgb4a8HN+uDe5X0S35Wsz/EnrOhbLXt/I
 NUESFRQSQlejLirIshPyH3jdjkjTbphOy+bh73GVKtXj88eOasisT+zfCa5j1mOieejL
 lwY00Qf8PaZu7HCnIkoBW6fDCWbIkzMtCdkbZAJWrO40HV9jAgtUWIwfUHF/RFvMykxB
 bLqh4DeSxrxQDOnIMD8RXUMVgKyffBqWeJ5K0mQsSEZqjHTXpjxdt6uyKbbxvEZJX4Vw
 nCiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Od9Arkk7
Subject: Re: [Buildroot] [PATCH v3 0/8] Add support for FDPIC binaries on ARM
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Waldemar,

On Mon, Aug 22, 2022 at 11:52:39AM +0200, Waldemar Brodkorb wrote:
> Hi Ben,
> 
> on what hardware or simulator you are testing?
> I like to try stm32 hardware, but the toolchain conflicts with
> afboot-stm32. 

I'm using the Emcraft STM32F746 SOM [1], with mainline Linux 5.19,
U-Boot 2022.07 and a custom device tree (and a few patches, although I
don't think any of them are necessary to get the kernel to boot).       

By the way, I was working on these patches as part of an internship,
which has now ended, so I don't have access to my work email anymore.
I'm still interested in getting these patches merged, but please reply
to my personal email (benwolsieffer at gmail.com), although I will keep
checking the list archives for replies.                                                                                                                                                                                                       
                                                                                                                                                                                                                                              
[1] https://emcraft.com/som/stm32f7

> best regards
>  Waldemar
> 
> Ben Wolsieffer wrote,
> 
> > Introduce support for the FDPIC binary format on ARM. FDPIC binaries
> > enable memory sharing between processes on no-MMU systems.
> > 
> > Changes in v3:
> >   * Don't change default binary format
> >   * Disable FDPIC support with external toolchains
> >   * Enable NPTL if FDPIC is used
> >   * Patch libtool to support ARM FDPIC shared libraries
> > 
> > Changes in v2:
> >   * Simplify special casing of FDPIC toolchain target
> >   * Add additional patches to fix building Linux and U-Boot with an
> >     FDPIC toolchain by passing -mno-fdpic. I have submitted fixes
> >     upstream to do this automatically, but they have not yet been
> >     accepted and will take a while to end up in Buildroot.
> > 
> > Cc: Vladimir Murzin <vladimir.murzin at arm.com>
> > Cc: "Yann E. MORIN" <yann.morin.1998 at free.fr>
> > 
> > Ben Wolsieffer (8):
> >   Revert "arch: drop now useless support for FDPIC"
> >   arch: don't enable FDPIC binaries by default
> >   arch: make FDPIC dependent on toolchain support
> >   arch/arm: add support for FDPIC
> >   boot/uboot: pass -mno-fdpic if FDPIC is enabled
> >   linux: pass -mno-fdpic if FDPIC is enabled
> >   package/uclibc: enable NPTL on no-MMU ARM w/ FDPIC
> >   package/pkg-autotools: patch libtool to support ARM FDPIC
> > 
> >  arch/Config.in           | 15 +++++++++++++++
> >  boot/uboot/uboot.mk      |  5 +++++
> >  linux/linux.mk           |  8 +++++++-
> >  package/Makefile.in      |  6 ++++++
> >  package/pkg-autotools.mk | 17 +++++++++++++++++
> >  package/uclibc/Config.in |  2 +-
> >  package/uclibc/uclibc.mk |  8 ++++++++
> >  toolchain/Config.in      |  4 ++++
> >  8 files changed, 63 insertions(+), 2 deletions(-)
> > 
> > -- 
> > 2.37.0
> > 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
