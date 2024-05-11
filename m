Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0437FC04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 20:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA08E42048;
	Sat, 11 May 2024 20:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2EeoXu7GedC; Sat, 11 May 2024 20:14:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7158E42084
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7158E42084;
	Sat, 11 May 2024 20:14:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A98681BF57C
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 953C384034
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btsLsD5RkasI for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 20:14:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9958C83F44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9958C83F44
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9958C83F44
 for <buildroot@buildroot.org>; Sat, 11 May 2024 20:14:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF8C31C0003;
 Sat, 11 May 2024 20:14:45 +0000 (UTC)
Date: Sat, 11 May 2024 22:14:44 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240511221444.2b964158@windsurf>
In-Reply-To: <Zj8iP0Dx8Q/TWeNM@waldemar-brodkorb.de>
References: <Zj8iP0Dx8Q/TWeNM@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715458486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Sj4YXXW9/VL3BHB9fF6ZJAsp6JTUO3zw9GZ3OXFY40=;
 b=MiOXAmAI2itv02OWHt5NtFfxKtEFED/sF2gyWqKxbAu4hJGE3IIrapeLL2ol+AnseW7CMZ
 U5qd/MYzjdSAgN/OwF0TRo0U9fGmL5TlXAdgdo3nmNAaCATAH+OVirLz/FnvkIt2kXiqqW
 T5TswzvM1g173rJLJENtDtGYWB4e630e20MLdIQoMOQe4MMNQeefnXF5ph8aRK1OYLRoNN
 bxuzu5DnA+tUpa3v5fSQ08O04VxHns+cpzg50Xys+AnF78N/ymIuS5BZztrlbWqkx3DWg8
 JRJoIpoI3ehmcgUMulKJpmKuNtE8wWU0+g73q2rjOwRmyrt4pdzCaoRTy6F7JA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MiOXAmAI
Subject: Re: [Buildroot] [PATCH] configs/qemu_riscv32_nommu_virt_defconfig:
 New defconfig
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

Hello Waldemar,

On Sat, 11 May 2024 09:46:07 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Add new defconfig for Qemu RISCV32 w/o MMU.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Nice stuff!

Could you split this commit into two, one enabling RISC-V 32-bit noMMU,
and another adding the defconfig?

Also, in the patch adding the defconfig, fix the following
check-package warning:

WARNING: configs/qemu_riscv32_nommu_virt_defconfig:0: missing BR2_DOWNLOAD_FORCE_CHECK_HASHES

(we require this for new defconfigs)

Minor detail, the commit title should be:

	configs/qemu_riscv32_nommu_virt: new defconfig

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
