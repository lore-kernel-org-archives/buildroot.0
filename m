Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0C4CA0EFD
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 17:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0456C400D6;
	Fri, 30 Aug 2024 17:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kF91QS-sG6_k; Fri, 30 Aug 2024 17:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9CA54013C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9CA54013C;
	Fri, 30 Aug 2024 17:00:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 249A81BF35F
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 17:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12D28813C3
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 17:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_uPOR5kD6h9 for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 17:00:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 033A681362
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 033A681362
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 033A681362
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 17:00:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBC4240005;
 Fri, 30 Aug 2024 17:00:13 +0000 (UTC)
Date: Fri, 30 Aug 2024 19:00:12 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240830190012.4ba5a5dc@windsurf>
In-Reply-To: <20240830135546.906135-1-roykollensvendsen@gmail.com>
References: <20240830135546.906135-1-roykollensvendsen@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725037214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vddITwwbUuJuOkJT2Rce3sQPyLAxI8tWfntIgWVmXck=;
 b=KbWSO/TMJ9QNIEXJElY4VYc01AjDVFnXK+wl//8f8/Yq/gqjNTCOXTH6v7zLCW5kg74GcU
 bRKFYPB6zbauYYuopoPUUtvnd7xavoB2tv5XE+oUops7aiEMip0AKnndn8etsuoKQnAEeR
 tMUVUyprF6mEAqp8Q3CmwmhofjBoxzyJtcFST1I6z9SpE+mlWzPf2UssKICBwMJfHubJ9S
 frgBZfIr7GhmXG/yRuHxfNk8pbNJl7WGCnHIQMo71S6EgGR8cE0aHqkBcXGNhhYGEVVx9w
 7C+Ly1RAkXY7WPVAvl9I6S/dRxgg4iKE+lF57FxFA6UvepMWAzb0mze39O8eGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KbWSO/TM
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: fix description of how to
 reply to <message-id>
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

+BR maintainers in Cc.

On Fri, 30 Aug 2024 15:55:45 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Patch v1 not set to 'superseded' when replying to <message-id> with v2.
> 
> I'm using git version 2.46.0. The manual says the following is the
> correct way to use the '--in-reply-to' option:
> 
> git send-email --in-reply-to=<message-id>
> 
> Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
> ---
>  docs/manual/contribute.adoc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I have applied to master, because it fixes a bug in the doc. But on my
side, I am not a big fan of subsequent iterations being sent as a reply
to the previous iteration. I know it has the advantage that patchwork
marks the previous iteration as Superseded, but I find it a bit
annoying on the mailing list.

What do other BR maintainers think?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
