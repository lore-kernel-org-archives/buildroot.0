Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762D7CAC5BB
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 10:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AF5640562;
	Sun, 28 Sep 2025 10:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8TPDJIN5z-Kr; Sun, 28 Sep 2025 10:17:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 358F84055B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 358F84055B;
	Sun, 28 Sep 2025 10:17:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 211B4111
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F97B4055B
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2iCa79MJO-W for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 10:17:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82F3E40555
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82F3E40555
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82F3E40555
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 10:16:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 41CF819F522;
 Sun, 28 Sep 2025 12:16:53 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 28 Sep 2025 12:16:53 +0200
MIME-Version: 1.0
Date: Sun, 28 Sep 2025 12:16:53 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250514134314.2405052-2-adam.duskett@amarulasolutions.com>
References: <20250514134314.2405052-1-adam.duskett@amarulasolutions.com>
 <20250514134314.2405052-2-adam.duskett@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <8bcfac00efab22844a19a7d77860f3a4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759054617;
 bh=2D08v/M97EEdMApRGWq8IQkHGQcW9qaLy5FIpLizmCw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DVBci9urUHJ5xVSdQARtKZs5MbDhqM37oXx6MXmWi+jjZCKDqBgvMNG18R3Kvvcqb
 Kb16+2J3W2KZRr27CM9VZE8nZHwkip5OqbdJloK4/pZmVK0O4L/993KAbVdB2ELNmN
 sNCWQhzF0fGdKuDkD+N/SYaxyfMI9Z6L1nsM55RjfNlJzloKZ9yd1NEhRCyZfRw2HJ
 if5UPjVRrwxeq1LSDAJioqZmia8o4KqB8vDfaZa0JrChf0o06+Pl8AqEagRoG0OaQ+
 ambvsMYRVyntaSTqIkB4p3M+Lh4kOueU9g7I68tHrirZYh3XF1BElSvOy/LXGrjtGv
 lSUcK5P5fbylw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DVBci9ur
Subject: Re: [Buildroot] [PATCH 1/6] package/wmenu: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/05/2025 15:43, Adam Duskett wrote:
> wmenu is an efficient dynamic menu for Sway and wlroots based Wayland
> compositors. It provides a Wayland-native dmenu replacement which
> maintains the look and feel of dmenu.
> 
> Furthermore, as of commit b4401557, sway uses wmenu instead of 
> dmenu-wayland
> with the following commit message:
> 
> """
> Switch default config to wmenu-run
> This removes the last dependency bit on dmenu. No need for
> "swaymsg exec" anymore: wmenu-run handles the xdg-activation
> shenanigans.
> """
> 
> As such, change sway/Config.in to select wmenu instead of dmenu-wayland 
> when
> a user selects swaybar.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Series applied to master, thanks.

Since you recently unregistered yourself for sway packages
https://gitlab.com/buildroot.org/buildroot/-/commit/20f99312c9ae6b20da8a5c801d972d76c8c0784f
I did not included whis wmenu entry in DEVELOPERS.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
