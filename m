Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A423CF31B9
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 20:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2252D80455;
	Wed,  2 Oct 2024 20:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_DOjkJ4soD5; Wed,  2 Oct 2024 20:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AAE78045D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AAE78045D;
	Wed,  2 Oct 2024 20:51:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 726781BF47D
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61C7461122
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 20:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1cqBK92pvBXP for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 20:51:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 404AA6111B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 404AA6111B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 404AA6111B
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 20:51:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12D86FF802;
 Wed,  2 Oct 2024 20:51:19 +0000 (UTC)
Date: Wed, 2 Oct 2024 22:51:19 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20241002225119.5887cd5a@windsurf>
In-Reply-To: <20240928133648.523674-1-ju.o@free.fr>
References: <20240928133648.523674-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727902280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=78VJgV4+2pCf+Zw1wTdp0MZdNb98Jz0tDE1UVreLGC4=;
 b=VWp6BNuPM6h36I2dgTf/lVdYT/cPwI57WiX/O+RUifGwC1uM2VlXmgx5HWnn6B3z+65C6E
 AJr0+jc1S95BH26ObwVDuXALbXgePkzk/zwItbITLzQxTnti5sBl3bS75zFiRHpbkQ9NBT
 abc+2L1NvTZ3HmAACc8fiBujGECA3S9ztBh/hIAkwahSnRma4vaVIx2t+kSeeQWbaJLrSX
 5CdHwju2eroKVNxf722HvMWkXAG8L8NHmwmY3NpCzDw8bz/Rx3j8pbkzE/37Qbhu9EZ+e2
 kFNYoQEUoQbNMmeE6VoQA6h/6ceoEQsCoZCHH0ymu8pSGBII//MX03l7MYmjoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VWp6BNuP
Subject: Re: [Buildroot] [PATCH 1/1] package/fwts: bump to version 24.09.00
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

On Sat, 28 Sep 2024 15:36:48 +0200
Julien Olivain <ju.o@free.fr> wrote:

> See release announce:
> https://lists.ubuntu.com/archives/fwts-devel/2024-September/013906.html
> 
> This commit also update the commented hash source URL from http to
> https, since it is now redirected.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch runtime tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/7944511137
> ---
>  package/fwts/fwts.hash | 4 ++--
>  package/fwts/fwts.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
