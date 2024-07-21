Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8FAC3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF3EF605CF;
	Sun, 21 Jul 2024 16:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emK9Pbo-AFbp; Sun, 21 Jul 2024 16:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA7B7605D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA7B7605D4;
	Sun, 21 Jul 2024 16:34:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2526D1BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01ED840120
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8raRNIoNgit for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:34:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BAB9D400F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAB9D400F3
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BAB9D400F3
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:34:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B937FF802;
 Sun, 21 Jul 2024 16:34:37 +0000 (UTC)
Date: Sun, 21 Jul 2024 18:34:36 +0200
To: Saeed Kazemi <kazemi.ms@gmail.com>
Message-ID: <20240721183436.39697007@windsurf>
In-Reply-To: <20240721121107.2125187-1-kazemi.ms@gmail.com>
References: <20240721121107.2125187-1-kazemi.ms@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721579677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ylYOYUFLei1q49cfmitZyCSkU3k83L34jlGGEPYiTI=;
 b=B5zIyRAiQqjMzZ7bVNaCIdJYZ/v0VaTnqGNuFplLUvGTEry4SN2PB3SlE8NttFkzZm+kpk
 +rHmj8SWI3XVtOJEatjTuAQ4VwbHJFi2PDWJ6NORJhwLuYUwXv7xZAAyAzmmHTcT6fulxp
 CtuxCW/XylVhX0MfzdPSk1fp1Sw9KBhmCSU1XV4FyMWa4fbMVtJpGLRaHWJ05N/16SOPco
 VkF+U4e6acUXuOUoW2aKztcy2Fe8BjC1vPOCRNUUtzYI4iqTgZIpi/2a4p3Y05KCxI5Dkm
 h4EW7R1HUdClOnDfJz67Wa7QyTGLJN0qGcTnPURJnX42CVAi/gABn0u05ZNfRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B5zIyRAi
Subject: Re: [Buildroot] [PATCH 1/1] package/eza: bump to version 0.18.22
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

On Sun, 21 Jul 2024 14:11:07 +0200
Saeed Kazemi <kazemi.ms@gmail.com> wrote:

> Release notes:
> https://github.com/eza-community/eza/releases/tag/v0.18.22
> 
> Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
> ---
>  package/eza/eza.hash | 2 +-
>  package/eza/eza.mk   | 2 +-
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
