Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDF5C3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 20:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D20C8115E;
	Mon,  5 Aug 2024 20:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHWH0T4NgO8a; Mon,  5 Aug 2024 20:43:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8050D811FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8050D811FE;
	Mon,  5 Aug 2024 20:43:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF1EF1BF335
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA60860621
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 20:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bDXuuXEhWiFH for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 20:43:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 00DC360769
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00DC360769
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00DC360769
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 20:43:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A53BC0002;
 Mon,  5 Aug 2024 20:43:02 +0000 (UTC)
Date: Mon, 5 Aug 2024 22:43:01 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240805224301.6f2ebe24@windsurf>
In-Reply-To: <20240805193844.659266-1-ju.o@free.fr>
References: <20240805193844.659266-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722890582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nE/RBj4ecHgRtScvyhq4j6hcoIREIK+hRGyq3eDeFyw=;
 b=MMqESTh+xCB5rulK0SHWpT8tA5Z1V+j/DWtOEr0T2C1TllWawROP7bpnFVUuwdCHII0hO0
 CgS62q980dpz0wJKsE274gpwuPzPNg8TcA4yPkHhL8EGBVmnwK5WgE66gysMyG2N49wSD2
 XGBXKMs9V1krd4TINSf71di5Gy1o2yf74CNnZLsvOy56dqtRRKEdcpZu0+3WVIMrpdYvKd
 9jvhYVal/Ksy9AAPROHO855/b7FSJDnw2ZN6EVCjp0ujhr/sT2A25EyjoX5YsgYbHoYe3y
 LrPbsYZi5BZSeJcxheuM1GuCjkWW3IjI4VypswFyP4kP9bOCjVjGPnjzpp+6Ng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MMqESTh+
Subject: Re: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version
 2.3.6
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

On Mon,  5 Aug 2024 21:38:44 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since v2.3.5, see:
> - https://github.com/FluidSynth/fluidsynth/releases/tag/v2.3.6
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/7509976587
> ---
>  package/fluidsynth/fluidsynth.hash | 2 +-
>  package/fluidsynth/fluidsynth.mk   | 2 +-
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
