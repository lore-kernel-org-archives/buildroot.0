Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F64C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 14:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8835C408A3;
	Sat, 22 Jan 2022 14:32:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kAJJ8HfQCXQy; Sat, 22 Jan 2022 14:32:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EF60400DB;
	Sat, 22 Jan 2022 14:32:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05DC11BF390
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 14:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0220183478
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 14:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VAuTNPtg4Rzk for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 14:32:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA3FB83443
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 14:32:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D003B240003;
 Sat, 22 Jan 2022 14:32:44 +0000 (UTC)
Date: Sat, 22 Jan 2022 15:32:43 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220122153243.009b24ba@windsurf>
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
 Sergey Matyukevich <geomatsi@gmail.com>,
 Mike Harmony <mike.harmony@snapav.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Davide Viti <zinosat@gmail.com>,
 Jan Kraval <jan.kraval@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, Fabio Estevam <festevam@gmail.com>,
 "Yann E .
 MORIN" <yann.morin.1998@free.fr>, Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, 18 Jan 2022 11:43:10 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> this patchset aims to enable the best FPU strategy for every board with
> 32-bits Arm Cortex actually present in Buildroot. I don't own these boards
> so I can't test these changes. What is about Allwinner doesn't worry me
> because I've tested a lot of cases with Olimex boards, but the other
> changes are still to be tested.
> 
> So I ask to the board maintainers to test the patches that involve their
> boards if possible. Anyway I've checked well all the SoCs Datasheet and I
> think I've made it correctly, even if in some of them it's not specified
> if VFPv4 means -D32. I assume it like that because otherwise -D16 is
> usually specified.

Do we have a good understand of what -mfpu=neon-vfpv4 does? Your patch
series basically converts many defconfigs to use this -mfpu value, but
it's not clear to me how it works. What does it mean to combine NEON
and VFPv4 instructions?

Regarding VFPv4 D16 vs. D32,
https://developer.arm.com/documentation/den0018/a/Compiling-NEON-Instructions/GCC-command-line-options/Option-to-specify-the-FPU
tells us:

  VFPv3 and VFPv4 implementations provide 32 double-precision
  registers. However, when NEON unit is not present, the top sixteen
  registers (D16-D31) become optional. This is shown by the -d16 in the
  option name, which means that the top sixteen D registers are not
  available.

So, my understanding is that when NEON is available, the VFPv4 is
guaranteed to have the 32 double-precision registers (D32).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
