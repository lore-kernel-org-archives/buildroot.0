Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4569C83F01
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61F6E418DF;
	Sat, 26 Aug 2023 18:06:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61F6E418DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VScY41Egmj-b; Sat, 26 Aug 2023 18:06:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA5641B42;
	Sat, 26 Aug 2023 18:06:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FA5641B42
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 657171BF37C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30496418EB
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30496418EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kk1H6wWcukdD for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:06:18 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3462418D2
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3462418D2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E8591BF204;
 Sat, 26 Aug 2023 18:06:15 +0000 (UTC)
Date: Sat, 26 Aug 2023 20:06:14 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230826200614.41cda518@windsurf>
In-Reply-To: <20230826165628.31792-2-romain.naour@gmail.com>
References: <20230826165628.31792-1-romain.naour@gmail.com>
 <20230826165628.31792-2-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693073175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lRUZFDpldKcCLbHkofy1JRBKesaZj5Yh4w9bGk+h4Q8=;
 b=No1RqF2WwoCBSoIPx2x/p8Mp0yAimRmMdBE5hzzL4KJmE2HOoLXbHC9+5XQzAbTWjvX9N/
 b7CIPCpcoTQ1h0AcrqkJT8G5yQBZi2/gpN6foa3W5FQVmDc63gD/5z3NAB3AqL6LZtc9zW
 QMEOJ+I2H6DfF4MQUaCZO8lcCyjm4+fqpHtNEzd6wdBKMyuENIbqWLXLv8Ag9t3cXLLJba
 K5In1Nd4/tSXOydUgSMTh3uNrsfPY2HEs9II782pRCswlOd1A2cUJcWYBZEq31WfvsFO5I
 BvyRRMoZUkirrOtkC7S3pqItx5HJPf8oy+2Hv1+ag3HMIZVusDSxro8W8uHOuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=No1RqF2W
Subject: Re: [Buildroot] [PATCH] configs/sipeed_{maixduino,
 maix_go}_sdcard_defconfig: fix build with binutils >= 2.38
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 26 Aug 2023 18:56:28 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Backport an upstream patch fixing the build with binutils >= 2.38
> for riscv's for Zicsr and Zifencei.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949340
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4936949329
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> All four sipeed_maix* defconfigs sipeed_maix_bit_sdcard_defconfig,
> sipeed_maix_dock_sdcard_defconfig, sipeed_maixduino_sdcard_defconfig
> and sipeed_maix_go_sdcard_defconfig are using the same uboot version.
> Only two were fixed by the previous commit ef4eea32261ed3f21af119936a080cb2fc8897fa
> "configs/sipeed_maix_{bit, dock}_sdcard_defconfig: fix build with binutils >= 2.38"
> ---
>  configs/sipeed_maix_go_sdcard_defconfig   | 1 +
>  configs/sipeed_maixduino_sdcard_defconfig | 1 +
>  2 files changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
