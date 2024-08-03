Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287DAC3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 20:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1C998113A;
	Sat,  3 Aug 2024 20:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 044-gxr6S7Ff; Sat,  3 Aug 2024 20:45:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B20868111D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B20868111D;
	Sat,  3 Aug 2024 20:45:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6FA001BF35D
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CE9F401ED
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 20:45:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGlO743xy7iK for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 20:45:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D34DC400DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D34DC400DD
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D34DC400DD
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 20:45:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15011E0003;
 Sat,  3 Aug 2024 20:45:28 +0000 (UTC)
Date: Sat, 3 Aug 2024 22:45:27 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240803224527.1a93f941@windsurf>
In-Reply-To: <20240803155517.3499273-1-dario.binacchi@amarulasolutions.com>
References: <20240803155517.3499273-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722717929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HPK75WNQc0M6xrtpHrqBuPBCqShxPbHaerqx1Bi0I3c=;
 b=QPloy+hGR/cAw0kE5A8jwrBTqi3UKSqJbiqFc6KXyuWZo+Uwp0AiuPhe/74ZI1b0sCZP3j
 sDQdq08aegbbLp9Ru27vxH4x6Pc/8BdBBVAtf7x51jXuMMCuuCqxrQyYoUynnycNUwtA6t
 LPvmtkBQ0NokGZRHhtomuEu/AiXPsA3yGP2wYej7b2fiSiZCKo0x55gRL+9ggAJbva3rin
 ldTqJFMo/PU8VBWvKtuuWDZXrHpfJHPOuoAXWeEeohd5A5q2u+fxoyNwJd+HQ8Axnfyy/s
 v+5PWBY1ZwmMicf1G3FE/fJUPYPUkKTS6QDeku+QbQwLIcX/BnolgGJj6882kg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QPloy+hG
Subject: Re: [Buildroot] [PATCH 0/3] tinit and stm32f746_disco_sd_defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

On Sat,  3 Aug 2024 17:55:14 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> This series is inspired by reading the following topic:
> 
> https://lore.kernel.org/buildroot/20230206230203.70e2dbd8@windsurf/T
> 
> Starting from that patch, and following Thomas Petazzoni's suggestions
> regarding the possibility of using a single minimal script without
> duplicating it within Buildroot, I developed these three patches.
> Meanwhile, the configuration for the stm32f746_disco board was useful
> for developing the display support for the board, which was later
> merged into Linux.
> 
> Dario Binacchi (3):
>   package/tinit: new package
>   configs/stm32f746_disco_sd_defconfig: new defconfig
>   board/canaan/k210-soc: use tinit as Linux init process

From a high-level point of view, I think it looks fine, though I'd
really like to have some opinion from some of the other maintainers on
this.

Maybe some comments:

- I don't really think it's super useful to have a Github project for
  tinit. The script could just as well be inside package/tinit

- Should it be named tinyinit instead of tinit, just to make things
  clear?

- I believe you should drop entirely the logo thing in tinit, we don't
  have such "logos" in any other Buildroot defconfig, so I don't see
  why we would have one for those super small noMMU defconfigs. This
  would allow to get rid of tiny-setup.sh stuff.

>  .../stm32f746-disco/busybox-tiny.config       | 230 ++++++++++++++++++

Why do we need a busybox-tiny.config? We already have
package/busybox/busybox-minimal.config. How different are they?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
