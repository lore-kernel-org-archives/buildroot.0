Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951D5CF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65EB2409FA;
	Sun, 13 Oct 2024 10:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5M0-OZrl6l6; Sun, 13 Oct 2024 10:48:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDB0340BF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDB0340BF3;
	Sun, 13 Oct 2024 10:48:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 455211BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3426A409C4
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8vOAHprdI2Qh for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:47:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 41A0E4097F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41A0E4097F
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41A0E4097F
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:47:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CA01C0002;
 Sun, 13 Oct 2024 10:47:52 +0000 (UTC)
Date: Sun, 13 Oct 2024 12:47:30 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241013124731.74305924@windsurf>
In-Reply-To: <20241011184716.2773638-1-james.hilliard1@gmail.com>
References: <20241011184716.2773638-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728816473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zhed3QQNxKeWlNqQo2wooEHb6hbTN9GNYvngi8EWcBM=;
 b=aOkI6CzVbasmmHZzgDUB17LkdNVly+MAJuC5R7O3VWZyZVEY2TuuF/wUKCn03s0laCNKhH
 J5fnAf1AzT5yfXe80Xa6/d/c52wzsohWN+xOJxSgd/lTuO+iYxCs63zfKugSRSb3YYGrRC
 //FT86ZiaWazyJx9vAyvdavAzPJzMB0y4kt0e6RcImG+GPnjtjTdBUG/7qCGPAYicBGMqE
 80PcILBaSuItpi8cE7iwgBoXTcEaiBvr64m722ME2Lrk4phcqTqVyKRGVcuTixKbPvPYdH
 MQmHu7mCr0lK9XOYYvFsduIvndG3RZlCDRmiq3MgXH0B60mLsC7TwNdhrRMzbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aOkI6CzV
Subject: Re: [Buildroot] [PATCH 1/1] package/python-google-api-core: bump to
 version 2.21.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 11 Oct 2024 12:47:16 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-google-api-core/python-google-api-core.hash | 4 ++--
>  package/python-google-api-core/python-google-api-core.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
