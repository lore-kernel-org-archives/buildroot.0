Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F55C43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 20:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6C3084375;
	Sun,  5 Jun 2022 20:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HdEh5Ydv-VpJ; Sun,  5 Jun 2022 20:28:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E761C84310;
	Sun,  5 Jun 2022 20:28:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 392521BF3A8
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2860260B8E
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:28:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Bgp3blZohlk for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 20:28:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FFCF60AE6
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 20:28:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:3d1d:2cca:75e8:9e80])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7D7F378033D;
 Sun,  5 Jun 2022 22:28:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654460886;
 bh=PE77wEIR5NiijQHY77++kwW05vmi8K+wFYvrm2mP0os=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PdKyMHD1sMc2w2P3HzxsVk9odj/1wPQFBrfunbhlxDZhe4y6JOYIjzNDNRpcYJ1nW
 5ib1lw8W+XTPkbiDQWwhC7lNnyZaUqj+tFF67DP1uRd2AdI3MvVHj1HwRCfZhGv1wq
 D7RrD5FoCRfYXIab6RyrsF4ai4D/B7TOt8J/PVx0X0+QwtgYKzPPMM79Qc1bG/D5Yo
 ZZpYhb5eVzaOGTC9jfmr02O88g9ucXFHU4TMtB8EbzIWsl6lG3VUGat5vsBls4+wBR
 epZ3lAL91XeU9+YZY6Jmj3ZQ/sDW5mv/d31DJu2UaB8H89dZWi+/dGRlzZF0EgAb1t
 yZJVJ5seD5vxQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Jun 2022 22:28:03 +0200
Date: Sun, 5 Jun 2022 22:28:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220605202803.GV427639@scaer>
References: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
 <20220605194259.2928568-7-thomas.petazzoni@bootlin.com>
 <20220605202411.GU427639@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220605202411.GU427639@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 6/7] support/scripts/gen-bootlin-toolchains:
 properly take into account !BR2_STATIC_LIBS for glibc toolchains
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-06-05 22:24 +0200, Yann E. MORIN spake thusly:
> On 2022-06-05 21:42 +0200, Thomas Petazzoni spake thusly:
> > The Config.in options created for each toolchain were properly taking
> > into account the !BR2_STATIC_LIBS dependency of glibc
> > toolchains. However, this dependency was not taken into account into
> > the main BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
> > option. Consequently, if an architecture is only supported by glibc,
> > but BR2_STATIC_LIBS is enabled, the main "Bootlin toolchain" option
> > was visible... but with no selectable toolchain.
> > 
> > We fix this by making sure that
> > BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS is only true for all
> > architectures supported, taking into account the fact that some
> > architectures can only be supported if !BR2_STATIC_LIBS, when the only
> > available C library is glibc.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > ---
> >  support/scripts/gen-bootlin-toolchains | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
> > index f9dd9da9a8..97a744340a 100755
> > --- a/support/scripts/gen-bootlin-toolchains
> > +++ b/support/scripts/gen-bootlin-toolchains
> > @@ -482,7 +482,10 @@ def gen_config_in_options(toolchains, fpath):
> >          f.write("config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS\n")
> >          f.write("\tbool\n")
> >          for arch, details in arches.items():
> > -            f.write("\tdefault y if %s\n" % " && ".join(details['conditions']))
> > +            conditions = details['conditions'].copy()
> > +            if set([t.libc for t in toolchains if t.arch == arch]) == set(['glibc']):
> 
> What about:
>     if 'glibc' in [t.libc for t in toolchains if t.arch == arch]

Nah, that does not test that there is *only* glibc; forget it...

Regards,
Yann E. MORIN.

> 
> > +                conditions.append("!BR2_STATIC_LIBS")
> > +            f.write("\tdefault y if %s\n" % " && ".join(conditions))
> >          f.write("\n")
> >  
> >          f.write("if BR2_TOOLCHAIN_EXTERNAL_BOOTLIN\n\n")
> > -- 
> > 2.35.3
> > 
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
