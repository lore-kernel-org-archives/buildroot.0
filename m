Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F543C001DF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 12:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B23CC817FD;
	Mon, 31 Jul 2023 12:21:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B23CC817FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EospjEse8yWp; Mon, 31 Jul 2023 12:21:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D21F781374;
	Mon, 31 Jul 2023 12:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D21F781374
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BF591BF3CA
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 12:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35AD040489
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 12:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35AD040489
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xkuee-XyW5sA for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 12:21:18 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B67BB40207
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 12:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B67BB40207
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F80A60008;
 Mon, 31 Jul 2023 12:21:13 +0000 (UTC)
Date: Mon, 31 Jul 2023 14:21:13 +0200
To: Neal Frager via buildroot <buildroot@buildroot.org>
Message-ID: <20230731142113.3945104c@windsurf>
In-Reply-To: <20230731061113.193556-1-neal.frager@amd.com>
References: <20230731061113.193556-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690806074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5wLbqo2vm4kSrl3UEhhMk/xv8j/gqsMez+ocTSntZgY=;
 b=MLT3dqDy++9rexQ7faRl+YbNuJRrmpCoYBbQq1VzjXjkm8aL8OZrqe3roJSjQU1AqO994Y
 pnwN7g+tzErEVK4xu5N7JbTC46P1WtxJeVQjqbRaSXqltA6VuXcC9ucibH9MiDMVNPsVy1
 gjN7c8zUS4BTBmgFV0lBz0n0gkz2WYI42v5hUYr0Yx/ia7YV0LmhXd5JWlN+IuiTizq5kx
 XJ0MG/IQVehScPnmo8N5IZunu3xrDbgZIYb0AFgbmCMXFwNHm2u2nhnYqS0/BEEnfDO512
 YhP/pXFKocdhPvzE1HcfxctRFwGbYsDQTB2eFg7ZMleujEeaz1+YayxrllH92w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MLT3dqDy
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynqmp: fix atf build failure
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
Cc: michal.simek@amd.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Neal,

On Mon, 31 Jul 2023 07:11:13 +0100
Neal Frager via buildroot <buildroot@buildroot.org> wrote:

> Binutils 2.39 now warns when a segment has RXW permissions[1]:
> 
> aarch64-buildroot-linux-gnu-ld: bl31.elf has a LOAD segment with RWX
> permissions
> 
> There is a ticket filed upstream[2], so until that is resolved just
> disable the warning
> 
> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
> [2] https://developer.trustedfirmware.org/T996
> 
> Fixes: https://developer.trustedfirmware.org/T996
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Thanks for this patch. However, could you use upstream's fix instead,
which is
https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c.
We have already integrated it in Buildroot for upstream TF-A versions
2.2 to 2.8 in commit
https://gitlab.com/buildroot.org/buildroot/-/commit/7b774048be6292bb61f90759ad3b7b58a33a1650,
but your defconfigs are using custom versions of TF-A, so our patch is
not applied.

Of course, same suggestion for "[PATCH v1 1/1] board/versal: fix atf
build failure".

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
