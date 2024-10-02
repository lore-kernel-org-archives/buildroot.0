Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114D4CF8541
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 835D141C5D;
	Wed,  2 Oct 2024 21:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZSG2r1R72iPs; Wed,  2 Oct 2024 21:03:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA48341C83
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA48341C83;
	Wed,  2 Oct 2024 21:03:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3DF91BF97E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A36A341C03
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zA-UKQ0P2s0d for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:02:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1857C41BFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1857C41BFF
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1857C41BFF
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:02:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 039DE1BF203;
 Wed,  2 Oct 2024 21:02:34 +0000 (UTC)
Date: Wed, 2 Oct 2024 23:02:34 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20241002230234.6d375b72@windsurf>
In-Reply-To: <20240926153046.17235-1-james.hilliard1@gmail.com>
References: <20240926153046.17235-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1727902955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B/mlSxu/DaochlntX4hY41H2UjsuW4FOXdzYIo2cpUs=;
 b=YMrWtNvZ++db+uajmCSUwbJV/RdTK4LUokLZ6FKnKRuAS5YzW29nCpfU9D/BNesqQ2HLhZ
 t0Ikjcd8vxOwr+rwV2KE58k+I6ebAGfBmEZA5bm+vh/8f/xHKi1yjEFz1D0sbex7/E7qcG
 h9DP4R08TfmtIeBmgAcXdTioDry1+Uww5XS6dIt3i/V3Miuc5cwLz1MULDDe8C5lzjE341
 ng5zkOq5z46B4/iUdHCrbKj+PCbUYLrqOvAYU6jJtbOEstSmSjs7el3NMvxPi5bRVA5dNx
 6tuPtvm3EhFgtgA+1dEfgnH4MI17YnonvHGeq0T9a4U/MBWbtFwD0DVRNOaIgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YMrWtNvZ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-alembic: bump to version
 1.13.3
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

On Thu, 26 Sep 2024 09:30:46 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop no longer required --skip-dependency-check build option as
> upper setuptools version is no longer pinned:
> https://github.com/sqlalchemy/alembic/commit/9d6e212b77c8ce5ea1164b6d67f2ba491beba413
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-alembic/python-alembic.hash | 4 ++--
>  package/python-alembic/python-alembic.mk   | 5 ++---
>  2 files changed, 4 insertions(+), 5 deletions(-)

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
