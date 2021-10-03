Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D8BC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 14:22:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23CFF61B40
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 14:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23CFF61B40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD9B040820;
	Sun,  3 Oct 2021 14:22:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dLuzsJHInP2a; Sun,  3 Oct 2021 14:22:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 044A1407D7;
	Sun,  3 Oct 2021 14:22:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1650F1BF57F
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 14:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0635884842
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 14:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SdDOp2tJ00sX for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 14:22:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 960278483F
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 14:22:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0705340003;
 Sun,  3 Oct 2021 14:22:37 +0000 (UTC)
Date: Sun, 3 Oct 2021 16:22:37 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211003162237.7949d437@windsurf>
In-Reply-To: <20211003124027.343390-1-romain.naour@gmail.com>
References: <20211003124027.343390-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/5] configs: remove qemu_csky defconfigs
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
Cc: Guo Ren <ren_guo@c-sky.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Romain,

On Sun,  3 Oct 2021 14:40:23 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> We are going to remove the gcc fork for csky since it doesn't build
> with the latest compilers (gcc 8, 10, 11 tested) [1].
> 
> Removing theses defconfigs and the csky gcc fork has become unavoidable
> since the Buildroot Docker image used by the gitlab CI will switch soon
> to Debian bullseye soon [2].
> 
> The cksy gcc fork based on gcc 6 has not been updated since it has been
> added to Buildroot [3]. Since then, csky has been added to binutils and
> gcc but using the latest upstream version (binutils 2.37 and gcc 11) is
> not yet possible due to build issue with glibc 2.34 [4].
> 
> Moreover, qemu_csky defconfigs was to be used with the csky qemu fork
> (based on Qemu 3.x) added by commit [5] and removed by commit [6].
> Since then it's not possible to do a runtime test with theses
> defconfigs.
> 
> Theses defconfigs can be added back later if the csky toolchain support
> is fixed and csky supported by upstream Qemu.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2021-August/621504.html
> [2] 71b83227128be62c169313e85bb8f339f977ad67
> [3] 7873a5bd5ebbeb1674293dae6b06b50f0a1f2184
> [4] http://lists.busybox.net/pipermail/buildroot/2021-October/624596.html
> [5] f816e5b276f1ef15840bec6667f1e8219717ab7d
> [6] 58af9a70cc0f195116dedb3fd0e2ca5b4fec9e70
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Guo Ren <ren_guo@c-sky.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I agree with the patch series. What I propose is to wait maybe 4-5 days
to see if there is a reaction or some feedback from Guo Ren. And if
there's no feedback, we apply in 4-5 days.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
