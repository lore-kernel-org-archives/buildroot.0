Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A33C3DA41
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 21:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53DBD40327;
	Mon,  8 Jul 2024 21:05:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orIpqBlMhkYj; Mon,  8 Jul 2024 21:05:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA22140333
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA22140333;
	Mon,  8 Jul 2024 21:05:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 614591BF3BD
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B14880DFE
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BXKWLx428ucv for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 21:05:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 20AEF80DA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20AEF80DA4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 20AEF80DA4
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 21:05:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EAA920003;
 Mon,  8 Jul 2024 21:05:10 +0000 (UTC)
Date: Mon, 8 Jul 2024 23:05:09 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240708230509.5e8a8538@windsurf>
In-Reply-To: <ZoezviRQPTNSgdCL@waldemar-brodkorb.de>
References: <ZoezviRQPTNSgdCL@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720472710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ySo78tzXABD1PS9odDu0ycv8cmnY+UZGbbISTwGyeKM=;
 b=I0YEeOnkeuhARlfXppN9z4B7q0OEPo9gE1k1O7la1/6OGzGKdh5/nayhY+cXg8xocfIeqS
 sjYMDxAYzl1378SGI5zceEFUZbr1MpRewXasiDEYjsDWA5dxd2Lczk99kJGQJyAQkUqggu
 njZXscva2ZEmFZJ3txU7uUSqAm6BFKUQsnppOVLAUoiyNkhm2E7lpLD6NLETOIPXLLv53x
 XBLiaro/OsqD8uKaHKSsdiFieTKF7WUvitrAmLgkrRWzsNoGK6Kvunu7oYHbTYo0ceOkpC
 3CY7G/MtC/t6n/LJO2sbb/5AwSbKkrxuKSoaktEAHRjGuySjSryunyE4zlrEzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I0YEeOnk
Subject: Re: [Buildroot] [PATCH v3 1/2] configs/qemu_sh4*: switch to
 initramfs
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

On Fri, 5 Jul 2024 10:50:06 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Qemu 9.0.0/9.0.1 has introduced a Bug in sh4/sh4eb emulation so
> that the system doesn't boot anymore.
> The issue is already reported by Guenter Roeck:
> https://lists.nongnu.org/archive/html/qemu-devel/2024-05/msg00606.html
> 
> Switch to initramfs for sh4/sh4eb emulation.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v2->v3:
>  - separate sh4 switch to initramfs from kernel update
> ---
>  board/qemu/sh4-r2d/readme.txt    | 2 +-
>  board/qemu/sh4eb-r2d/readme.txt  | 2 +-
>  configs/qemu_sh4_r2d_defconfig   | 2 +-
>  configs/qemu_sh4eb_r2d_defconfig | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

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
