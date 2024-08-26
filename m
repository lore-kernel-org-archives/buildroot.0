Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17A6C5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 16:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 669E460586;
	Mon, 26 Aug 2024 16:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Af3hvInjmiaD; Mon, 26 Aug 2024 16:57:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FF47605E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FF47605E6;
	Mon, 26 Aug 2024 16:57:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCA291BF33F
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA74A605E6
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aS_hfNelU9YD for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 16:57:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 91EDD60586
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91EDD60586
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91EDD60586
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 16:57:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4E7AC0008;
 Mon, 26 Aug 2024 16:57:42 +0000 (UTC)
Date: Mon, 26 Aug 2024 18:57:41 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240826185741.7c68d235@windsurf>
In-Reply-To: <20240824151511.3178807-1-dario.binacchi@amarulasolutions.com>
References: <20240824151511.3178807-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724691463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dtk4G7xn6NYGojua+vW+GCGX2shDaws7Xuy6CnKenZ8=;
 b=MvYnk2Kv8sZdzQG3QuDZx5GSYZ20zKTey7jLIHVLYnVeP+Ci9cR3qYN1hLWXcT0R+AoOU7
 vf81mtxOQf8GUpmo5as6YuGOwZ8jT0jH853Rs+3f0T0hVhM5OTxxhTOq4W2fp6vWNx/f+Z
 2Ah2rflFWiCS6EM+ZY9m8tAO/S6Igb2FFk4OiSfq6Dmx4W8WBzld6A8zGx/Nw3OH1PcQ7D
 4mxlaagvQN3EY7lw+HJ2CBhnEqZJhpoqZ91oJXLzhV2pRiKcJ6GhuqtWmiSrj5H3jNWQzc
 BtZo/Lq0eON1Epho1k2tvSR5T/Jfy2yEcZY/lF3q9cZo7ju1O0I98OaT8O/QwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MvYnk2Kv
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 10.1.0
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
Cc: Samuel Martin <s.martin49@gmail.com>, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

On Sat, 24 Aug 2024 17:15:11 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> - C++11 is now the minimum required C++ standard
> - faster handling of compound expressions by trimatu() and trimatl()
> - faster sparse matrix addition, subtraction and element-wise multiplication
> - expanded sparse submatrix views to handle the non-contiguous form of X.cols(vector_of_column_indices)
> - expanded eigs_sym() and eigs_gen() with optional fine-grained parameters
> 
> Fixes:
> - http://autobuild.buildroot.org/results/d4e9e7b453960a4f62a199344b30b729a4f235bc
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/armadillo/armadillo.hash | 2 +-
>  package/armadillo/armadillo.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Same comment as for babeld: bumping to solve a download issue is not a
good solution. Indeed, if we have to bump because upstream dropped the
tarball, what tells us that they won't drop the new tarball again in
the future? This can only be resolved either by finding an alternate
upstream location or by talking with upstream so that they restore the
previous tarball and understand the issues caused by moving/removing
previous tarballs.

Also, if they made C++11 required, then I'm pretty sure we will need a
BR2_TOOLCHAIN_GCC_AT_LEAST_xyz dependency added, no?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
