Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A5BE77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 22:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14BD04029A;
	Mon,  6 Jan 2025 22:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C9-_kkppbxF3; Mon,  6 Jan 2025 22:22:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E370D404A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E370D404A9;
	Mon,  6 Jan 2025 22:22:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10C74F1E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F340E80431
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:22:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEdT1LmegSZV for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 22:22:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E428C804B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E428C804B7
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E428C804B7
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 22:22:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B5D3FF802;
 Mon,  6 Jan 2025 22:22:16 +0000 (UTC)
Date: Mon, 6 Jan 2025 23:22:16 +0100
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>, Julien Olivain <ju.o@free.fr>
Message-ID: <20250106232216.120aea41@windsurf>
In-Reply-To: <20250103214754.856971-1-romain.naour@smile.fr>
References: <20250103214754.856971-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736202137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zh5gNo8ZW0KaYUKu75Wq6+obU80cQ+3AjU70zTq98F8=;
 b=RYXoynemAMgaKPR7/2PlyBhtZ70JWL1jGCOqSmOsa1yId9OLwgvX9yiB9p1vxgz1ISgaJR
 +RXHW3245CeGKNfn7PPlEvXKh3a1smWGhnugtS6Xl2VdgjPrlm3JxBI/51UijAod3UFLaI
 jby58u87b9bjWr95mJG2yErJI0Q0d7wLacyMOqmAFenC2UwwfeIBCMq2NMSPyhOMpxmAVg
 zRnOqGqssIjx3CJj4+xz5EDB109LmytCchsY/GHZjlr3s0izR7YPU7djOH+xd7qjoL4RPh
 QbJPUARDtZFT/ICVo6g75l0qvsIFYjUGW0juagzYZ12qBtnTOPdCokKsYU4uhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RYXoynem
Subject: Re: [Buildroot] [PATCH] package/qemu: bump to version 9.2.0
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

Hello Romain,

On Fri,  3 Jan 2025 22:47:54 +0100
Romain Naour via buildroot <buildroot@buildroot.org> wrote:

> Changes log:
> https://wiki.qemu.org/ChangeLog/9.2

This update is breaking quite badly on the autobuilders:

  http://autobuild.buildroot.net/?reason=host-qemu-9.2.0

Could you have a look?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
