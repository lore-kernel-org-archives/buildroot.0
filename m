Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8992EC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 07:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53067409F1;
	Thu,  2 May 2024 07:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Csvz-8hdhZ42; Thu,  2 May 2024 07:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF0DC409E7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF0DC409E7;
	Thu,  2 May 2024 07:45:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EC831BF83C
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 962C1409E7
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 07:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u319Ott0pMDh for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 07:45:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 28F2D409E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28F2D409E5
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28F2D409E5
 for <buildroot@buildroot.org>; Thu,  2 May 2024 07:45:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E76A5240004;
 Thu,  2 May 2024 07:45:05 +0000 (UTC)
Date: Thu, 2 May 2024 09:45:05 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240502094505.116b8a3c@windsurf>
In-Reply-To: <20240415083612.3754176-1-dario.binacchi@amarulasolutions.com>
References: <20240415083612.3754176-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714635906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UW8BAGeYBR/0o6jYNyGXTWlP9hTZoRkgFx7FtI65IxM=;
 b=D/Ac3UHCHe2ROd+DKbzUY2Jh5ssRz0XbiFnGykr0ms7dW53du6v1TrSKD8aoO6piUsWARc
 iHJtSU5fZmwdveyE7QBVQyN5SaeSqhOESSOkA1sirDd9i5U+mD6W+sU8Fyd2/vk9L9r0LT
 ySVPMzhxPNQSeLLbQSyln4cq+h3MU63e2coKplHyA4omxRqyQh9rgHNqJ3dvChcVbVs8I+
 RYhvQbZ6qN2YN6/KX6agiawx8Bj2HZ6tk1WVQ7Glbadxf91gTgLhbwKWI/DCPPTPl0KTV+
 xpun7Lys83C0/QQzyR+QR9EYOOVwCCQmomlrCykA/ZB7JEwlFtfk+dRo5/9pUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D/Ac3UHC
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.179
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 15 Apr 2024 10:36:12 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> - Provide macos arm prebuild version.
> 
> Release notes:
> https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.179
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/uuu/uuu.hash | 2 +-
>  package/uuu/uuu.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
