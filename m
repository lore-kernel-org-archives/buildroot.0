Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2464FC04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 08:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD39E40207;
	Tue, 14 May 2024 08:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kaYd6pVMXsMU; Tue, 14 May 2024 08:23:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85CE54015D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85CE54015D;
	Tue, 14 May 2024 08:23:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D98CA1BF2FD
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 08:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D43F860AE9
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 08:23:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BidzLCQ2vYLl for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 08:23:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ECE4560AE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECE4560AE3
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECE4560AE3
 for <buildroot@buildroot.org>; Tue, 14 May 2024 08:23:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22674FF805;
 Tue, 14 May 2024 08:23:18 +0000 (UTC)
Date: Tue, 14 May 2024 10:23:18 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20240514102318.1cdeba18@windsurf>
In-Reply-To: <20240307015107.2908128-1-christian@aperture.us>
References: <20240307015107.2908128-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715674999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pDmzKKFuTpmwdHa7YJdBNB4O4T6W5RF8svbZ1ialj7s=;
 b=jWV6aAp5Gcz53wWyETJRfzNdnEUzSXWzbJVBcQy1XsyFvAjT5dxGgLhNxAl6gOpoqdcLuW
 f0u0dWT3VJiZ5mi0UR4HvAPA/aO7xC3Xk/Nmg55gvqJvVeZsqFglLPFxKVzTdgRwL/LLFd
 capsaagpkSKCjk/XF5vDRBpQcDwrnns7/V+YAeJQVkTDscOUEqLQmhiC5j9GZuCpMVmMdJ
 YnGxC1teh8LzVaThupSENmtEgu85PU9Hel8kMYFa4t6Vx2UoDP6U/+Jr3TgE6NrIxo0psM
 JA0CwaIyX5/4Hb+WZ9hTg8GWizwX/5ISc34paZZMFLyNmxWIx77+EAeGH3rLiA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jWV6aAp5
Subject: Re: [Buildroot] [PATCH v1 1/3] package/go-bootstrap-stage2: bump
 version to go1.19.13
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
Cc: Anisse Astier <anisse@astier.eu>, Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Wed,  6 Mar 2024 17:51:05 -0800
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Update to the latest 1.19.x version available.
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/go-bootstrap-stage2/go-bootstrap-stage2.hash | 2 +-
>  package/go-bootstrap-stage2/go-bootstrap-stage2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I don't think it's this patch causing the issue, but we have a Go build
failure in our Gitlab CI:

https://gitlab.com/buildroot.org/buildroot/-/jobs/6833307823

Could you have a look?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
