Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CD2D2444F
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86C8840227;
	Thu, 10 Oct 2024 21:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_Fzqdji1deY; Thu, 10 Oct 2024 21:40:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D269411A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D269411A1;
	Thu, 10 Oct 2024 21:40:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D54AF1BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0D03412D4
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPy9m6kme640 for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:40:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8B3B5412D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B3B5412D0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B3B5412D0
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:40:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B17120002;
 Thu, 10 Oct 2024 21:40:43 +0000 (UTC)
Date: Thu, 10 Oct 2024 23:40:41 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20241010234041.0aade127@windsurf>
In-Reply-To: <20241010132912.3061663-1-fiona.klute@gmx.de>
References: <20241010132912.3061663-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728596443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Aj2cgQW9E/2eOYg9HnSTBr2Lf7K/3bCDaDWB7x7UQI=;
 b=XglTnd5U8FsENVMpJY5Ax0JooLLxEygkmtxQ7HfOEdUVrcZMaKu7SBZZSUHeL8l4YNCxHO
 q5uE0GZESkP76/Eao+TtkuguRtQFEAjhDlKOaVvC8CeZbcCxf66WNbNaq5T1fEyn79S81O
 FT0do0Nlq4QpvFK55TgYrcVnDGEji1v8i9DqXa+DNmqHRPyT3pfQwyr2AJDxxhkRCaCGom
 A1wEyiIK268iQKzIMvguflypPO7ztyJvUrRdNI6R7zni+eSNh+uCINGJu2B8tIOQYPAbul
 tlbvxqeQk+W9fVwJv4vUOLjuFGdwrgbw7+Y8ohxVRnG6GeRpxOtFQ9BU+ev2tw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XglTnd5U
Subject: Re: [Buildroot] [PATCH 1/2] package/tini: restore use as docker-init
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
Cc: Fiona Klute <fiona.klute@gmx.de>, Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 10 Oct 2024 15:29:11 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Commit 24cac9c4e6a36fd14b263a8eecf7ae7d58ab5a59 "system: add tini as
> init system" made BR2_PACKAGE_TINI depend on BR2_INIT_TINI. This is
> incorrect: tini is not only needed when building a container image
> using Buildroot, but also to run Docker containers on Buildroot
> systems using another another init system, if Docker is configured to
> provide an init process for the container (e.g. with "docker run
> --init"). The tini package already provides the "docker-init" symlink
> required for that.
> 
> Example error without tini installed:
> 
> $ docker run --rm -ti --init alpine
> docker: Error response from daemon: exec: "docker-init": executable file not found in $PATH.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>  package/tini/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Thanks, both applied. On PATCH 2/2, I wasn't 100% sure, but it's simple
enough, clarifies this dependency that isn't entirely obvious, and can
always be reworked/reverted if other people think it wasn't the right
solution.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
