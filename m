Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5BDC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 20:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 895AE830FB;
	Thu, 11 Aug 2022 20:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 895AE830FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WwwErRv80NNA; Thu, 11 Aug 2022 20:30:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE94D81D67;
	Thu, 11 Aug 2022 20:30:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE94D81D67
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA0701BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9500E81D67
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 20:30:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9500E81D67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZujKK2ZnDObE for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 20:30:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81771813D3
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81771813D3
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 20:30:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DC10B240007;
 Thu, 11 Aug 2022 20:30:10 +0000 (UTC)
Date: Thu, 11 Aug 2022 22:30:09 +0200
To: Max Filippov <jcmvbkbc@gmail.com>
Message-ID: <20220811223009.6243f04a@windsurf>
In-Reply-To: <20220811094049.798010-3-niklas.cassel@wdc.com>
References: <20220811094049.798010-1-niklas.cassel@wdc.com>
 <20220811094049.798010-3-niklas.cassel@wdc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660249812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4UiicXxA4qa/D1v9tNqd4azbZGfpiQGduhhVUigZM50=;
 b=C98XXbABJA9hQ096ZPEbSX2Kc5/YhtzuQjbTBfVqiyWGlFj6V6LbzkG6jP0ziUPVJAFxd5
 wDJIlbtj6CTI64CtrTjJHPyKBktOVDvk+eHwyKOM9SOQfFjBTeTVIbgTCPYgqf3blAt/Rh
 BtXCk8nrAzUKY0RPo44qeyhbPE0PabkJh3uvr3fOY2ew8iQCsDLTDJ/bJx/YSLwBmVR4Qa
 MLI+r6P7nms0lB0lPHEfwQ+coLwh+gtmTbKBL1tnl34Z3LWEG/bWU6+v5BbpQ0lKC9GwV7
 vnleUlpwhiT2Msl3e7dsnebM0lEW5MwX9eKn0eQshQ9MFsuaX4PXoRlzB1G08w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C98XXbAB
Subject: Re: [Buildroot] [PATCH v2 2/2] package/elf2flt: fix fatal error
 regression on m68k, xtensa, riscv64
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, damien.lemoal@opensource.wdc.com,
 alistair@alistair23.me, geert@linux-m68k.org,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, romain.naour@smile.fr,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Max,

On Thu, 11 Aug 2022 11:40:49 +0200
Niklas Cassel via buildroot <buildroot@buildroot.org> wrote:

> This series fixes a fatal error at link time on m68k, xtensa,
> and riscv64, caused by a bad upstream elf2flt commit.
> 
> Without this patch, m68k, xtensa, and riscv64 would result in
> a fatal error:
> ERROR: text=0x3bab8 overlaps data=0x33f60 ?
> 
> With this patch, qemu_m68k_mcf5208_defconfig,
> qemu_riscv64_nommu_virt_defconfig, and
> qemu_xtensa_lx60_nommu_defconfig builds properly.
> 
> riscv64 and m68k boots to login prompt.
> xtensa crashes when loading init, the same behavior as when
> reverting the bad upstream elf2flt commit completely.

As you can see here, apparently the xtensa noMMU defconfig in Buildroot
no longer boots. We had a regression in elf2flt, but even with this
regression fixed the problem persists, and we're apparently back to
what it was before the elf2flt regression was introduced.

Do you think you could have a look?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
