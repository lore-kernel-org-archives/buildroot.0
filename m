Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9A0D10BFF
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 16:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFC1981FD9;
	Sat, 26 Oct 2024 16:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kTedB2YBAG7l; Sat, 26 Oct 2024 16:10:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16C2381FDC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16C2381FDC;
	Sat, 26 Oct 2024 16:10:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A868E5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BE9A405F3
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8VJL4xJK_Kwo for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 16:10:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B9BE405E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B9BE405E8
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B9BE405E8
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:10:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D4C160002;
 Sat, 26 Oct 2024 16:10:15 +0000 (UTC)
Date: Sat, 26 Oct 2024 18:09:46 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Marek Belisko
 <marek.belisko@open-nandra.com>, "Fiona Klute \(WIWA\)"
 <fiona.klute@gmx.de>
Message-ID: <20241026180946.551f5760@windsurf>
In-Reply-To: <20240916151206.947484-13-adam.duskett@amarulasolutions.com>
References: <20240916151206.947484-1-adam.duskett@amarulasolutions.com>
 <20240916151206.947484-13-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729959015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0eC95kNQc/Bg65xlkRtaGnaRf3YWGAFO6QqdSGjmTXo=;
 b=gNnUxYHLdXfgDM9XW+56T7p/X7ly5Eox8ezdF9KuFYPk3YVxq0OOiqiiT7W1Rp0Ee+Y6xE
 5ptUcgCezCVrKwU+rQFUOonSflSsQHjuQwSB5J4G1gdLWOOFhzi5k5dI9PhqlvvxrdFI2S
 ljVVJ5DvN22qO3eO6mfQ/BMd3tkCOQk8cfv9fWj0U65Y7r6S3jET2UTIseMc39lVb5O2WX
 /nILetACngNkReUPvoG0fuaBjH2O8XwAxwBQi1YYI2nFihFJF7zRnv1yFEWIxtEfDoUQIv
 jb87c6xPGLqmBg+emHEf/VELqHFi2D7E1CsPmVYUVg+Btkkk21+mA6FpyyOp4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gNnUxYHL
Subject: Re: [Buildroot] [PATCH 12/13] package/audit/S02auditd: fix
 shellcheck and check-package warnings
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Mon, 16 Sep 2024 17:12:05 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Tested with qemu_x86_64_defconfig. start, stop, restart, reload, and rotate
> all work with busybox ash shell.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/audit/S02auditd | 44 ++++++++++++++++++++++-------------------
>  1 file changed, 24 insertions(+), 20 deletions(-)

Thanks for this rework. As part of this, could you rework S02auditd to
follow the canonical example of package/busybox/S01syslogd ? There's
been an effort from Fiona to start aligning our init scripts, and this
effort is really good, so I'd rather see rework of other init scripts
go in the direction that Fiona has initiated.

I've added Fiona in the loop so that hopefully she can help if your
specific init script raises some specific questions.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
