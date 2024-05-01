Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885B3C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B52174031F;
	Wed,  1 May 2024 21:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjt-r4nGvik9; Wed,  1 May 2024 21:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 500304178A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 500304178A;
	Wed,  1 May 2024 21:09:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF1841BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC5214031F
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3vfWb9v6NQu for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:09:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B02DB41772
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B02DB41772
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B02DB41772
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:09:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E74F2240002;
 Wed,  1 May 2024 21:09:35 +0000 (UTC)
Date: Wed, 1 May 2024 23:09:35 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240501230935.360d87e6@windsurf>
In-Reply-To: <20240425195816.2758964-1-brandon.maier@collins.com>
References: <20240412210850.17265-1-brandon.maier@collins.com>
 <20240425195816.2758964-1-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714597776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gO2pR9DsVwR38wRl7oK2hDeT6bbqrZOAAl9s2x3v1s4=;
 b=Lr/7+XjCGty3WdZcB5GR9lw76WLltg4RXmEltn8nCQ732xbrO5G8yjPk5AtM3RuJDt6v5Z
 EAxGgVA7DBuDYCfeIiTk85S7B98+vAZudrca5UqL6Ld9oOnyzbmPUljqwTNOZJDCf9PqEA
 7SWIh74MtaN10x2AlfgH6zkBEjLyzm1DKl7XUM4FI7o0q2w3XiLN0Tfwq1ZziYI9jM9r75
 J7Q2K1VIAd8ZKSm10nhPxhw2mdSB1tprh25VYxOXhrS6UO7/WIC8SFunkG53ywu39buVDD
 muftQ8NtDBNvfVnt3RrMyXBLr7GbgPkuNzntYlxC9vStIrXOHOXUTYHrFcYtjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Lr/7+XjC
Subject: Re: [Buildroot] [PATCH v2 1/4] package/bats-core: bump to version
 1.11.0
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 25 Apr 2024 19:58:13 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> https://github.com/bats-core/bats-core/releases/tag/v1.11.0
> https://github.com/bats-core/bats-core/releases/tag/v1.10.0
> https://github.com/bats-core/bats-core/releases/tag/v1.9.0
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  package/bats-core/bats-core.hash | 2 +-
>  package/bats-core/bats-core.mk   | 2 +-
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
