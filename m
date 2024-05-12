Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61655C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 10:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E8DC4046B;
	Sun, 12 May 2024 10:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_RKLTiD61me; Sun, 12 May 2024 10:20:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48B6B40516
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48B6B40516;
	Sun, 12 May 2024 10:20:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A6AE41BF290
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93AEC40516
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 10:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1iCMMjJqqAD for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 10:20:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79B714046B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79B714046B
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79B714046B
 for <buildroot@buildroot.org>; Sun, 12 May 2024 10:20:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6037E0004;
 Sun, 12 May 2024 10:20:49 +0000 (UTC)
Date: Sun, 12 May 2024 12:20:48 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240512122048.36a3f93b@windsurf>
In-Reply-To: <ZkCU03+ru07pxr5d@waldemar-brodkorb.de>
References: <ZkCU03+ru07pxr5d@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715509249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iuSp6i4chVqlUsM+5e/0ez7a+o4T48jcOEKI8Z7E6wo=;
 b=WSxp2eEXWUM7Lqjby7SD8Sg+S8EEvMrhR3wU3kDvYVjc1RkINiR82SPu9OQMgNvwyH8Qat
 Lr18Sww7FhIT5HnIRxIWh+bG2cnkLqQd0Z6FHotpIf9JtxFk/JDn+E5asy/3Tsdw2M6Ptl
 vXj3cQjeVpDasX96Xktwp8RghJctdsWw/nauz1TjM5Xz1+yFZA5A+bYYy7rPS2qkMWBaEm
 /bNWjXBxfYNQvhbqhPCd5QmHJXHjZRUEFv23LrAGlAXzgdxM4z5883iVbCnX4On4c9YP/J
 Y6lzk5xpmYeQooyB0bnQQdx2/onoUMZOJ7NQxjyLZVoU1tFNY1cX5VwBgfLlJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WSxp2eEX
Subject: Re: [Buildroot] [PATCH 2/2] configs/qemu_riscv32_nommu_virt: new
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 12 May 2024 12:07:15 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Add new defconfig for Qemu RISCV32 w/o MMU.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  DEVELOPERS                                    |  2 ++
>  board/qemu/riscv32-virt/linux-nommu.config    | 21 ++++++++++++
>  .../patches/linux-headers/linux-headers.hash  |  2 ++
>  .../riscv32-virt/patches/linux/linux.hash     |  2 ++
>  board/qemu/riscv32-virt/readme.txt            |  2 ++
>  configs/qemu_riscv32_nommu_virt_defconfig     | 34 +++++++++++++++++++
>  6 files changed, 63 insertions(+)
>  create mode 100644 board/qemu/riscv32-virt/linux-nommu.config
>  create mode 100644 board/qemu/riscv32-virt/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/qemu/riscv32-virt/patches/linux/linux.hash
>  create mode 100644 configs/qemu_riscv32_nommu_virt_defconfig

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
