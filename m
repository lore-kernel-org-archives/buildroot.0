Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B365EE4996
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 21:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 381D9415A6;
	Sun, 20 Aug 2023 21:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 381D9415A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HFxKEyFtOjJq; Sun, 20 Aug 2023 21:40:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3896E41548;
	Sun, 20 Aug 2023 21:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3896E41548
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECE9C1BF38D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4D2741548
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 21:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4D2741548
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wdTG06obJXoJ for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 21:40:13 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73C074152D
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 21:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73C074152D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E3A4FF802;
 Sun, 20 Aug 2023 21:40:11 +0000 (UTC)
Date: Sun, 20 Aug 2023 23:40:10 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230820234010.3e5037ae@windsurf>
In-Reply-To: <20230817230844.450092-1-romain.naour@gmail.com>
References: <20230817230844.450092-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692567611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SjwCLfy/PTJ7FLodIgJxf21EurX08sOZXRbHU3zRQWM=;
 b=Oihs/JPm23/rJD/1QgmLebJfajLce9zw9TKH9SSIUutOCLzt3YNhhBql8tFhJ0n6wsZ6eL
 XU/UE90zQ9WZQu4AVYR2ZlAyJF3aG3rSYBIE+dHjFwE51zl/gmKRvMEUnpkfJeuCXR1rLO
 5Gvq3UuaBtmjHztmsYsDCFCKRN7wzGpN+lUA8j2QJMHBMHllTQ6fsdDNQfLhTigkQI92mi
 MgT9smb8u9uAqtJ8r1Zf36iKUxE5nhe6Z2v4MyGlFxv+pETKqgKzSi1G+u6b8CNoaEAHTR
 djjmbUD4t5UtXB/jXuCXxIB+XNR1wT5YpxTkS5v0D1mzpjpEK97aMo5SIz1EYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Oihs/JPm
Subject: Re: [Buildroot] [PATCH 1/4] configs/sipeed_maix_{bit,
 dock}_sdcard_defconfig: fix build with binutils >= 2.38
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

On Fri, 18 Aug 2023 01:08:41 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Backport an upstream patch fixing the build with binutils >= 2.38
> for riscv's for Zicsr and Zifencei.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060608
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4839060605
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...iscv-Fix-build-against-binutils-2.38.patch | 58 +++++++++++++++++++
>  configs/sipeed_maix_bit_sdcard_defconfig      |  1 +
>  configs/sipeed_maix_dock_sdcard_defconfig     |  1 +
>  3 files changed, 60 insertions(+)
>  create mode 100644 board/canaan/k210-soc/patches/uboot/0001-riscv-Fix-build-against-binutils-2.38.patch

Thanks, series applied to master. However I believe it would be good to
get some updates of those defconfigs by the people who originally
submitted them, and who therefore have the hardware (or alternatively
drop some of those defconfigs).

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
