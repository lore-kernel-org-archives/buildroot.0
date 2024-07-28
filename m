Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2672C3DA64
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 19:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77BE440464;
	Sun, 28 Jul 2024 19:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AjKLPDYI4a-m; Sun, 28 Jul 2024 19:56:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33CE540568
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33CE540568;
	Sun, 28 Jul 2024 19:56:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D37F1BF577
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 19:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0049606D3
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 19:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcMIuz8ijqiK for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 19:56:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E62EC60628
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E62EC60628
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E62EC60628
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 19:56:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E96F1BF203;
 Sun, 28 Jul 2024 19:56:40 +0000 (UTC)
Date: Sun, 28 Jul 2024 21:56:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240728215639.5584bc72@windsurf>
In-Reply-To: <20240727175805.1739987-1-bernd@kuhls.net>
References: <20240727175805.1739987-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722196601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SBjpyViodHB9gIq7m4VjIKX7We8HDBzsdLcQ+fQiuiY=;
 b=lh4qQajtHWnVerhkgvUVTteD4ETsAAPPLSyMPmTe5E9e0HTtJmmIRRv4e2lojLT2U/19fa
 M4mC7WR6OH/EwUl1/u6EJ3B5aRX4MlBbcMPp6N32MOgTxoSUIlljLSaSCNGpEx7m6oD/05
 gjSXPZZ8iP1qfkTiEKqfkXKGDSThnyxzp41tJ/8O3au5NgDTFiePs/nAzzglsMWa8GUsg4
 1ZMEZslMZSNwYBBnFOIVS2pG+3lpqfUZtdIqYz52rjCNcOv694p+mhMgbe6LBMjUGA0gze
 hgyC0bnxVSkz94FO3bewrHomeb7VtXt1B1gItM46UVCEHsQWm9TnrvTSVPkf+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lh4qQajt
Subject: Re: [Buildroot] [PATCH 1/2] package/libks: bump version to 2.0.5
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

On Sat, 27 Jul 2024 19:58:04 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libks/libks.hash | 2 +-
>  package/libks/libks.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
