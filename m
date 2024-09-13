Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EF4FC6182
	for <buildroot@archiver.kernel.org>; Fri, 13 Sep 2024 22:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0972240209;
	Fri, 13 Sep 2024 22:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OvfpEeOSDjIQ; Fri, 13 Sep 2024 22:16:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6888419B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6888419B6;
	Fri, 13 Sep 2024 22:16:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEE4D1BF2BE
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 22:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DDA684726
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 22:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMSCX9v1c0md for <buildroot@lists.busybox.net>;
 Fri, 13 Sep 2024 22:16:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D41784723
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D41784723
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D41784723
 for <buildroot@busybox.net>; Fri, 13 Sep 2024 22:16:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 01BE6E0003;
 Fri, 13 Sep 2024 22:16:07 +0000 (UTC)
Date: Sat, 14 Sep 2024 00:16:06 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240914001606.7e3272d6@windsurf>
In-Reply-To: <20240909162703.3439481-1-francois.perrad@gadz.org>
References: <20240909162703.3439481-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726265768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ji/AXfj3C4xblMPJtIKqT/Z9jTZ47C2x/BopNzTkQcs=;
 b=W9tuvNl4JIbtclegYgbdt6utrMd9MP21OchjIrJ6/AjD6zk1vX8xvgShxi4IX4+aLCCF68
 1NB0veBeiS/F3WuYA52bVMpJOvtdMfdC074IkqdSp3+IMAmjdx6Vd4EaVLO7Trs5pGSYZF
 a6mqm3WG2aKihiM6A5iNFxPzJIzwICzJ4ZmPUfNqn2eILuJcgeWHffSuMSkgyB7zc6WE3R
 2g9Wf63mFFJwXHo71xV7ziGNzN2YRb2p6L62/ezN6aNHznkM/7YgN9Pu+l7Tfh+ejkdUDZ
 9T3gO2/0KVHnfY0aA4yz0QO/LX9whg4a1zJkdFuW0ZMon7lBEv+yLrJiud77+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W9tuvNl4
Subject: Re: [Buildroot] [PATCH 01/20] package/perl-clone: bump to version
 0.47
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  9 Sep 2024 18:26:43 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl-clone/perl-clone.hash | 4 ++--
>  package/perl-clone/perl-clone.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Whole series applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
