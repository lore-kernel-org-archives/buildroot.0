Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29197C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 11:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF45740A02;
	Fri, 10 May 2024 11:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S5yk8uoMlgGj; Fri, 10 May 2024 11:22:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF96B423F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF96B423F9;
	Fri, 10 May 2024 11:22:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAA301BF2A1
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6FC742A00
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ju4jl5T6_89E for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 11:21:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7534940B76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7534940B76
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7534940B76
 for <buildroot@buildroot.org>; Fri, 10 May 2024 11:21:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4801960003;
 Fri, 10 May 2024 11:21:53 +0000 (UTC)
Date: Fri, 10 May 2024 13:21:53 +0200
To: Zenichi Amano <zenichi.amano@gahojin.co.jp>
Message-ID: <20240510132153.2aa426e2@windsurf>
In-Reply-To: <20240510024350.566581-2-zenichi.amano@gahojin.co.jp>
References: <20240509180732.23542b3f@windsurf>
 <20240510024350.566581-2-zenichi.amano@gahojin.co.jp>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715340114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J4M3E3DJEz+z14XGhuf0LLKYa1oUaDLilmkfqjONgTg=;
 b=FUczzj222CbeVY4yjZUBWSNFRFNV68B1KLsmcyKowYC6B8kCkcGSXGO2rat7LI73xEjmPs
 iXoFSeVBlRus6jsHpumpt/ZwiDNpzTEJ8pojCN7LQCVqdTY0qyiczwFVjMkt11NRZlVUZm
 i47X751TxQ9Teo3Dxs9aVwr3emhw38XnEX2lcM69M8J9w7DVaLvuRI79jrmlwL4uajwmPR
 4hjzSF0gaB3TPmBYgSRtGwG70wyRiJpqRO5Ic+feYpOU0ZLCFHnrNvveKQwX5H59YAakxi
 BxfG81V/+L5msjjDVePcJEkYamkomvfQh876/WSU2YGSi6Xr0TAawanTUQETdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FUczzj22
Subject: Re: [Buildroot] [PATCH v2 1/1] package/pcsc-lite: bump version to
 2.1.0
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

On Fri, 10 May 2024 11:43:51 +0900
Zenichi Amano <zenichi.amano@gahojin.co.jp> wrote:

> add configuration to disable polkit if it is not available since polkit is enabled by default in 2.0.1.
> 
> https://github.com/LudovicRousseau/PCSC/releases/tag/2.1.0
> https://github.com/LudovicRousseau/PCSC/releases/tag/2.0.3
> https://github.com/LudovicRousseau/PCSC/releases/tag/2.0.2
> https://github.com/LudovicRousseau/PCSC/releases/tag/2.0.1
> 
> Signed-off-by: Zenichi Amano <zenichi.amano@gahojin.co.jp>
> ---
>  package/pcsc-lite/pcsc-lite.hash | 2 +-
>  package/pcsc-lite/pcsc-lite.mk   | 9 ++++++++-
>  2 files changed, 9 insertions(+), 2 deletions(-)

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
