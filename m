Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191EEC10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 07:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC2DC4010C;
	Sun, 12 May 2024 07:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKip4wNXuwcW; Sun, 12 May 2024 07:08:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC511401CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC511401CC;
	Sun, 12 May 2024 07:08:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C99A1BF473
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46C22840BE
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5YbKycz6V7IU for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 07:08:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 387868409D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 387868409D
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 387868409D
 for <buildroot@buildroot.org>; Sun, 12 May 2024 07:08:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A0AB60002;
 Sun, 12 May 2024 07:08:30 +0000 (UTC)
Date: Sun, 12 May 2024 09:08:29 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240512090829.2bf594fd@windsurf>
In-Reply-To: <Zj91p/Bv/ZtCtvO6@waldemar-brodkorb.de>
References: <Zj91p/Bv/ZtCtvO6@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715497710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q2PI6Ao2tgVoxfXOSb+ElJ1LzMJZwxnnoMI5xFbjlLQ=;
 b=W9yjJ8YtK+e1jMR29zNEH5ebVQjiFLilc/qKd38Hn7SZxxJg6b5VObGds4GmEwwKCWX+z4
 wWaRVkKuMAIoUwXqa6J+1yYfUfBDrFhH/tpJvhgbXoQYiWMmCJ2bABErY07y3C6Jju1dAK
 dhpZMF+jal2ejQzc8OCFmNb/8u+t2HCPv8U50MCHydVnbE+Kf3rPk/65rpPbX7K3CWjnvq
 OmDKAsjGwVEXxyQV6zyiX/OrrYe4/NWCMzZIKwBMkWM9YJdjmt+I4HEqkJg4w+Eo+Iz0jE
 WZpgRqsw3QBsIp78gGvVTFSK785HnkplNOfY/OdaCprp2vA52C2rBP1jJTnebw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W9yjJ8Yt
Subject: Re: [Buildroot] [PATCH] configs/qemu_riscv64_nomu_virt_defconfig:
 enable networking
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 11 May 2024 15:41:59 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Enable networking for better user experience.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  board/qemu/riscv64-virt/linux-nommu.config | 22 ++++++++++++++++++++++
>  board/qemu/riscv64-virt/readme.txt         |  2 +-
>  configs/qemu_riscv64_nommu_virt_defconfig  |  7 +++----
>  3 files changed, 26 insertions(+), 5 deletions(-)
>  create mode 100644 board/qemu/riscv64-virt/linux-nommu.config

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
