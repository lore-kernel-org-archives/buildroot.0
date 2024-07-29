Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC87C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 17:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 401BC6085A;
	Mon, 29 Jul 2024 17:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8C6hg8fAZnnb; Mon, 29 Jul 2024 17:54:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A70C6086B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A70C6086B;
	Mon, 29 Jul 2024 17:54:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 64BD01BF424
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 522A640236
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBKjPs10-k0r for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 17:54:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 155524012A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 155524012A
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 155524012A
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 17:54:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76251240005;
 Mon, 29 Jul 2024 17:54:33 +0000 (UTC)
Date: Mon, 29 Jul 2024 19:54:32 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20240729195432.36c83404@windsurf>
In-Reply-To: <20240729135812.993362-1-giulio.benetti@benettiengineering.com>
References: <20240729135812.993362-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722275673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iZidaGTurnXElZGuxxHtdc6E28PKxeSxZqfvJuj7RCQ=;
 b=dS5m2RKBGysb5a43s+AlyXs4aRQQPCAAsaNUQam8f3Sp9OGvQRSAOJaiOg6rZMebYykNnq
 PD40t5h2/KCTxDQxhcdg1ZSvmCaON/u1Fg3F075lzoAoaI0VEP1aLtd0YeERNL/zOXXLgG
 Jk++HeGgVrEeOtD2ojzGg33QmA+gAGjAhcKF6ahIIS2Z2Kypdd145t6UvnAZQArbPxBdMC
 lNJ7AQ8GgqC78jcBnH1Kr535KcmB+1IlAL9n5S9wb9+EBU71/Y/TBsfa8KxuN1Ru9hR5Tu
 niNaxLjCybNonVIFhIJjjehCs/rurNQilkL5e0h78PhyPGkEg28kyRQu/5OPNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dS5m2RKB
Subject: Re: [Buildroot] [PATCH] package/trace-cmd: bump to version 3.3
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
Cc: Pierre Floury <pierre.floury@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 29 Jul 2024 15:58:12 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/trace-cmd/trace-cmd.hash | 2 +-
>  package/trace-cmd/trace-cmd.mk   | 2 +-
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
