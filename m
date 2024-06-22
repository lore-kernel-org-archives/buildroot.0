Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15E8C27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 16:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD303405BC;
	Sat, 22 Jun 2024 16:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXqQ2u47uWYE; Sat, 22 Jun 2024 16:51:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5036F4057B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5036F4057B;
	Sat, 22 Jun 2024 16:51:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75B091BF5DC
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 16:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EB1682040
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 16:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sABGIErXfS8U for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 16:51:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 689128204C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 689128204C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 689128204C
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 16:51:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 737E81C0002;
 Sat, 22 Jun 2024 16:51:12 +0000 (UTC)
Date: Sat, 22 Jun 2024 18:51:11 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240622185111.2abf5054@windsurf>
In-Reply-To: <20240612192222.52284-1-bernd@kuhls.net>
References: <20240612192222.52284-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1719075072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BXw7kZ5S9duVLUXQxhe4A5ul8qW296cn4TWETKcGz9o=;
 b=JtzhVf9dbTmmqhVxTGfmviIM+ZF+Dp1PDV9ePyFYNcVS4hgADbU9WLE2zLiXq/55rnxFIZ
 equ++EyAUDFClLdSHv6jHwPOhRLUp0+3FYDcse2Ov9cXBDNG688QHSYfMyGpW9t6dRbHek
 oEnx2MHmEQDbxyn9uzuZKgQ+DlqwQObOpk2FNVA5fVQbTIqBAg+oxSShadZ3SQu7reCYqg
 W6zE7nhh+DO2cqwkLl5XbmY5U6OVkaSjM83aycNmgISA3I1IllxSJYFcB/tJzF7RXJxz7f
 4srvG4EyZbg1b1M2HBW+tOzzYUgnVBDJOpUDv1k8YWpmG8sfqq9A5dmVfNJqYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JtzhVf9d
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 24.0.9
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
Cc: Romain Naour <romain.naour@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 12 Jun 2024 21:22:22 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2024-May/000761.html
> https://lists.freedesktop.org/archives/mesa-announce/2024-June/000764.html
> 
> Removed two patches which are included in this version 24.0.8.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
>  .../0006-drisw-fix-build-without-dri3.patch   | 58 -------------------
>  ...on-t-try-zink-if-not-enabled-in-mesa.patch | 42 --------------
>  package/mesa3d/mesa3d.hash                    |  6 +-
>  package/mesa3d/mesa3d.mk                      |  2 +-
>  5 files changed, 5 insertions(+), 105 deletions(-)
>  delete mode 100644 package/mesa3d/0006-drisw-fix-build-without-dri3.patch
>  delete mode 100644 package/mesa3d/0007-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch

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
