Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D29DC433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 20:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CF9F4012B;
	Tue, 25 Jan 2022 20:55:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PAP_an-wi-iY; Tue, 25 Jan 2022 20:55:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5152401C8;
	Tue, 25 Jan 2022 20:55:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 093E41BF5A1
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 20:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9CB8401C8
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 20:55:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ajS1WheXRKsP for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 20:55:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56B654012B
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 20:55:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:40e2:478e:9a26:9cef])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 05F6C5FF23;
 Tue, 25 Jan 2022 21:55:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643144142;
 bh=U9wFg5hbRdtn8rr35bpkH75o8TTeByXcDKbn/sazUJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n/Jk7ir30GbkpakeNwxCOBRLjgq1y6EOaiBZewsdJmY5MaA6V6PU/kyf6oEEcEXxm
 vslQ29FKw7K8QT7ES+nKc4Hs/8tYzxSFNdmf7bZBQpdTwo+sltiYCr/5/Beznw9sBz
 cCAkbBX+7saAc7MPRQSBUpkOS7NAUWMchwdGC3+l+mB4wPHlOcSUFVz1rZIGbGNU6e
 5FMKf455vdnh4SaBR+gj6TMdJ905ciwHN29kJbMiBfcc6YK13voftFAiwedl3hcoyX
 ll8CoVrm2l96fRrCpxAyPk98Js7BuCxUSkoYiFsruHM/Wdasp/ou+xEKj6RUIldHLN
 ZP7pvYbMaZg/A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jan 2022 21:55:23 +0100
Date: Tue, 25 Jan 2022 21:55:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220125205523.GH457876@scaer>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
 <20220122153243.009b24ba@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220122153243.009b24ba@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 00/28] Use the best FPU strategies on
 32-bits Arm Cortex
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>, Simon Doppler <dopsi@dopsi.ch>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, Mike Harmony <mike.harmony@snapav.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Davide Viti <zinosat@gmail.com>,
 Jan Kraval <jan.kraval@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>, Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Giulio, All,

On 2022-01-22 15:32 +0100, Thomas Petazzoni spake thusly:
> On Tue, 18 Jan 2022 11:43:10 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
> > this patchset aims to enable the best FPU strategy for every board with
> > 32-bits Arm Cortex actually present in Buildroot. I don't own these boards
> > so I can't test these changes. What is about Allwinner doesn't worry me
> > because I've tested a lot of cases with Olimex boards, but the other
> > changes are still to be tested.
> > 
> > So I ask to the board maintainers to test the patches that involve their
> > boards if possible. Anyway I've checked well all the SoCs Datasheet and I
> > think I've made it correctly, even if in some of them it's not specified
> > if VFPv4 means -D32. I assume it like that because otherwise -D16 is
> > usually specified.
> 
> Do we have a good understand of what -mfpu=neon-vfpv4 does? Your patch
> series basically converts many defconfigs to use this -mfpu value, but
> it's not clear to me how it works. What does it mean to combine NEON
> and VFPv4 instructions?

The gcc man page states that specifying Neon as part of the fpu setting
has no effect, unless the -funsafe-math-optimizations is also specified,
because Neon is not compliant zith IEEE 754:

    If the selected floating-point hardware includes the NEON extension
    (e.g. -mfpu=neon), note that floating-point operations are not
    generated by GCC's auto-vectorization pass unless
    -funsafe-math-optimizations is also specified. This is because NEON
    hardware does not fully implement the IEEE 754 standard for
    floating-point arithmetic (in particular denormal values are treated
    as zero), so the use of NEON instructions may lead to a loss of
    precision.

So it is my understanding that using Neon is not a good idea overall. It
should only be requested on-demand by people who know what they are
doing, and most probably, be setting appropriate CFLAGS on a per-package
basis.

Additionally, changing the default FPU setting on those defconfigs is
not really interesting. Indeed, the base system that (most of) those
defconfig build are probably not exercising the FPU setting much (the
busybox login and shell are probably not using much FPU insns).

So, for me, this series is a no-go, first because it has not been tsted
on actual hardware, second because some of the changes introduce a
dubious feature which is actually a no-op at best, or worse will
generate incorrect code.

Regards,
Yann E. MORIN.

> Regarding VFPv4 D16 vs. D32,
> https://developer.arm.com/documentation/den0018/a/Compiling-NEON-Instructions/GCC-command-line-options/Option-to-specify-the-FPU
> tells us:
> 
>   VFPv3 and VFPv4 implementations provide 32 double-precision
>   registers. However, when NEON unit is not present, the top sixteen
>   registers (D16-D31) become optional. This is shown by the -d16 in the
>   option name, which means that the top sixteen D registers are not
>   available.
> 
> So, my understanding is that when NEON is available, the VFPv4 is
> guaranteed to have the 32 double-precision registers (D32).
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

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
