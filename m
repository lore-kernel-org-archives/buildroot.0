Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0334C02180
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B41984727;
	Sat, 14 Sep 2024 08:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlyS1ggFuIM1; Sat, 14 Sep 2024 08:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FA368472A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FA368472A;
	Sat, 14 Sep 2024 08:00:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09B3B1BF2EC
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECC5140243
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8aJVdGb_oQR for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:00:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9BE8F4023E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BE8F4023E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BE8F4023E
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:00:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B30E40004;
 Sat, 14 Sep 2024 08:00:24 +0000 (UTC)
Date: Sat, 14 Sep 2024 10:00:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240914100023.7fa663c0@windsurf>
In-Reply-To: <20240908213452.1634373-1-bernd@kuhls.net>
References: <20240908213452.1634373-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726300824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yLRyLD53bD/ecTW7KWbAetmLO750wiajWOX59FfvHv4=;
 b=UhkMRPDISrxrkdvGeef/Uc/FgZlf5SDIgZIm6v4l1PIFE7e7WQb4RQP0BFvesIbnj3nf5w
 lbqDah2bH6brasRou3QhSw4sCWH3reszas4WCCuQI7K7hi9E0h2jba2bYKenZGXJGG180+
 SbjpSeZ15RTRrI+AJ7Yuac4/LbLzWT8XSJJxKfUvNvikdOkz3pLBDjg31a6NeuqsqI2Qll
 AE6FYW+89ktTS1AYm6B43pzB5TnHbaxSrm92dqe9AXM3Z/djUK4J0EWxvalRUQmgb+bG+2
 wKauybXiYPS4P57l4rbwOyjAABAtwURmi9MF6EkWdn6kgTtMLck6rBCf+1iVDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UhkMRPDI
Subject: Re: [Buildroot] [PATCH 1/1] package/rp-pppoe: bump version to 4.0
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

On Sun,  8 Sep 2024 23:34:52 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://dianne.skoll.ca/pipermail/rp-pppoe/2023q2/000640.html
> 
> Updated license hash due to SPDX-License-Identifier addition:
> https://github.com/dfskoll/rp-pppoe/commit/e51f1cea3bb40b1a79b7256ef0ea81c318e97edb
> 
> Removed non-existing files from RP_PPPOE_INSTALL_TARGET_CMDS.
> 
> Removed patch which was applied upstream:
> https://github.com/dfskoll/rp-pppoe/commit/bbf5b2759cff0c65b47fd6dbe5fe7341f205ad03
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |  1 -
>  ...src-pppoe.h-fix-build-with-musl-libc.patch | 60 -------------------
>  package/rp-pppoe/rp-pppoe.hash                |  5 +-
>  package/rp-pppoe/rp-pppoe.mk                  | 11 +---
>  4 files changed, 4 insertions(+), 73 deletions(-)
>  delete mode 100644 package/rp-pppoe/0001-src-pppoe.h-fix-build-with-musl-libc.patch

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
