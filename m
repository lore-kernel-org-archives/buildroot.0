Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CDBC5472F
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DF57401F0;
	Tue, 27 Aug 2024 16:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g5RZakExvASf; Tue, 27 Aug 2024 16:50:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5858640586
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5858640586;
	Tue, 27 Aug 2024 16:50:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EAC01BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B00280F1F
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qdg7q-A8TOCg for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:50:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2AB5880F1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AB5880F1D
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2AB5880F1D
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:50:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62081FF808;
 Tue, 27 Aug 2024 16:50:30 +0000 (UTC)
Date: Tue, 27 Aug 2024 18:50:29 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240827185029.09308129@windsurf>
In-Reply-To: <20240823210637.117412-1-giulio.benetti@benettiengineering.com>
References: <20240823210637.117412-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724777430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QI0ElUcuElI4XVWaq9zZq+sPGfBWkiJyucYlmPotsZE=;
 b=gnv2iWqMKlfKzAPCp0Uspjpjsw4NlRSP0ylFeF5zJ9pZGXvhc0OOI6n/4tqU1FUsuKSmoO
 PGLbRhhZZSbEsLtRKKxUKTDqPkr3acTXOffieEI/EGJ9wv21h1hJRBOT7HAq//0qbP+IHl
 Bf9B0ldJrmjwc5k4WBP3vx3X6ixR3dSsuASqmVGpK/Kf/wkC8Hyj+7/+j+3ExgedMhNnxH
 HlwAeCa+bUmsTY9NKi0tdIwQ/K0HOmKG+ZOV/IxvFLn/8rlMtF7poqM40Pgep7BAuSQlJA
 FadpoK/uLVmY7JfZys6dpo+UwK9cLYv66MjwTJLq573+KdJtTMB5TS3NITBbIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gnv2iWqM
Subject: Re: [Buildroot] [PATCH] package/mongoose: bump to version 7.15
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 23 Aug 2024 23:06:37 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> https://github.com/cesanta/mongoose/releases/tag/7.15
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/mongoose/mongoose.hash | 2 +-
>  package/mongoose/mongoose.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
