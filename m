Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B815EC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 870CB411FD;
	Fri, 12 Jul 2024 07:07:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vfbHkQvUCDCl; Fri, 12 Jul 2024 07:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DA6D412E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DA6D412E8;
	Fri, 12 Jul 2024 07:07:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 689781BF48C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61D7D83155
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_osw9HWUY0K for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:06:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 598868210D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 598868210D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 598868210D
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:06:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6896FC0009;
 Fri, 12 Jul 2024 07:06:55 +0000 (UTC)
Date: Fri, 12 Jul 2024 09:06:54 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240712090654.7bf4530c@windsurf>
In-Reply-To: <20240711205237.979583-1-ju.o@free.fr>
References: <20240711205237.979583-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720768015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4kMdIv7Tb4VnRplGlRZx/H6DzecpLghH9SGWnmVvDSI=;
 b=TL6x1zcCqztGJwzP6/EfKIrdo7/+FfPd5UjBPCDrKtdJv5Ot8VXyu5zHAGXUb9XSLPAX0v
 v1RVjG6FjHP+wLwhzq905DTg7AabH+FlfX/wmoD65+sNTA+oJhCbdDyF6n/4a2icH/b2Ra
 V7f8t/cPZ5Zyt7a6tYKcDVtkMsTPGZ8p5MhHO76H4UAygAGUj8/0zehza1CsF7y3G3V0p4
 jCFzVBrqUF3Gfjnae8NN1vo6gPSt8Apo9ijLVWYgg121O+dfAi4vwouCGzvhhsC8s8TuOy
 Ls/NEuuIPquVd5JWlYVUBSY8kxFllGMkJhpZwFd66qVvItRPNCF1cDyT3z4EXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TL6x1zcC
Subject: Re: [Buildroot] [PATCH 1/1] package/ed: bump to version 1.20.2
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

On Thu, 11 Jul 2024 22:52:37 +0200
Julien Olivain <ju.o@free.fr> wrote:

> See release announce:
> https://lists.gnu.org/archive/html/bug-ed/2024-04/msg00003.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/ed/ed.hash | 4 ++--
>  package/ed/ed.mk   | 2 +-
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
