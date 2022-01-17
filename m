Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA9AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 23:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9872860598;
	Mon, 17 Jan 2022 23:04:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IxG_lFPW-4xT; Mon, 17 Jan 2022 23:04:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD475600C6;
	Mon, 17 Jan 2022 23:04:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E53D01BF286
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 23:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFEE04038B
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 23:04:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GLENu1HBTye7 for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 23:04:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9517D40012
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 23:04:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1AA6D60004;
 Mon, 17 Jan 2022 23:04:48 +0000 (UTC)
Date: Tue, 18 Jan 2022 00:04:48 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220118000448.32ea764d@windsurf>
In-Reply-To: <752cc85f-d3d6-950b-cb5c-fb39e5020bc3@benettiengineering.com>
References: <20220114211525.2697606-1-heiko.thiery@gmail.com>
 <752cc85f-d3d6-950b-cb5c-fb39e5020bc3@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] configs/kontron_bl_imx8mm_defconfig: new
 defconfig
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 17 Jan 2022 20:58:52 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> > diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_imx8mm_defconfig
> > new file mode 100644
> > index 0000000000..5b5648cc14
> > --- /dev/null
> > +++ b/configs/kontron_bl_imx8mm_defconfig
> > @@ -0,0 +1,59 @@
> > +# Architecture
> > +BR2_aarch64=y
> > +BR2_ARM_FPU_VFPV3=y  
> 
> i.MX8MM supports VFPv4-D16, so I would substitute this ^^^ with:
> BR2_ARM_FPU_VFPV4D16
> 
> This is to achieve the maximum performance.

Nope, that's not really how it works. VFPv3 is better than VFPv3-D16.
Indeed VFPv3 means that the the FPU has 32 double precision registers,
while VFPv3-D16 means that it has "only" 16 double precision registers.

So, if the i.MX8MM has only the VFPv3-D16, then indeed it should be
chosen, because code compiled with VFPv3 may not work, as it might use
too many double precision registers.

On the other hand, if the i.MX8MM has the full VFPv3, then
BR2_ARM_FPU_VFPV3=y should be used.

That being said, the gcc man page only documents vfpv3, vfpv3-d16-fp16,
vfpv3-fp16 as extension for armv7-a. Interesting, would need to look
into this.

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
