Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78222CA0EDC
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 17:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3726C4013C;
	Fri, 30 Aug 2024 17:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1jh_0AhVXBBI; Fri, 30 Aug 2024 17:02:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA2AF411BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA2AF411BB;
	Fri, 30 Aug 2024 17:02:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A7B9E1BF35F
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 17:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9498B4013C
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 17:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5FHFWO94EoI for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 17:02:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B466400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B466400D6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B466400D6
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 17:02:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD0D91C0009;
 Fri, 30 Aug 2024 17:02:23 +0000 (UTC)
Date: Fri, 30 Aug 2024 19:02:22 +0200
To: Bin Meng <bmeng.cn@gmail.com>
Message-ID: <20240830190222.6e2285cc@windsurf>
In-Reply-To: <20240829154150.174934-1-bmeng.cn@gmail.com>
References: <20240829154150.174934-1-bmeng.cn@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725037344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXgKKT40HaRlTAAXr23ne0AaUg3nrT1+DwBDLe6dtHg=;
 b=FwoALXxhl91W64tfq0cFLb0c6sYqwx/jWTJexoqSdnLfuutTjzwrnubcjYB9Caw5NIulpR
 PD8wZ+/7MRHdU8kiCuyZtG0b0vbxuOjXMn9S/NE2aR3CfEUp0S11YjeD/xIJxzojV5CM5h
 TLo+EuIbDqy67WyGt0LJ46RdtdCcyHB9HSCTevNZ5ewh/17AKWRfgB011KnF3Wlr7enu1q
 9mdmAm0ny7x8gjtZYhMd1xdkVnGgHqQ/h6JyWDTCdHFJN1JQgXiuxRKdb15jM1jLGO1dwp
 ptGPb3MuvK4wyELDyHYKBY9qqH6ZMfwMAPBWBmyFM8D6nL+2wynBjZRtF9tjrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FwoALXxh
Subject: Re: [Buildroot] [PATCH v2] configs: riscv: qemu: Drop
 BR2_TARGET_OPENSBI_CUSTOM_VERSION
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
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bin,

On Thu, 29 Aug 2024 23:41:50 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> From: Bin Meng <bmeng@tinylab.org>
> 
> Update qemu_riscv32_virt_defconfig and qemu_riscv64_virt_defconfig
> to use the latest OpenSBI due to the reason that:
> 
> 1. they are the main platforms to develop and test OpenSBI
> 2. latest OpenSBI binaries are always integrated into QEMU as
>    the default bios
> 
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
> See v1 @ https://patchwork.ozlabs.org/project/buildroot/patch/20230626160030.93063-7-bmeng.cn@gmail.com/

Sorry but no. We _do_ want our defconfigs to specify a custom and fixed
version of Linux, U-Boot, OpenSBI, TF-A, etc.
See https://buildroot.org/downloads/manual/manual.html#adding-board-support:

"""
Always use fixed versions or commit hashes for the different
components, not the "latest" version. For example, set
BR2_LINUX_KERNEL_CUSTOM_VERSION=y and
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE to the kernel version you tested
with.
"""

Do not hesitate to send patches to update the OpenSBI version used in
those defconfigs, after testing that this update works fine for those
particular platforms.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
