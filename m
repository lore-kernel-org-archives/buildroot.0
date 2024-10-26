Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9489D10BFF
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 16:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B7A441157;
	Sat, 26 Oct 2024 16:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ytx3zYUzjTG; Sat, 26 Oct 2024 16:25:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B6A7411D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B6A7411D4;
	Sat, 26 Oct 2024 16:25:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 586E15C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 473C160EF5
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dVLiFR3_Xl8S for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 16:24:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 38EDE60F18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38EDE60F18
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38EDE60F18
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:24:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C248FF802;
 Sat, 26 Oct 2024 16:24:57 +0000 (UTC)
Date: Sat, 26 Oct 2024 18:24:56 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241026182456.2ae2b671@windsurf>
In-Reply-To: <20241013082702.19600-1-bernd@kuhls.net>
References: <20241013082702.19600-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729959897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oot6QZYlSmJt5nVDKcdAJnRWPwPAkgB3y373g/ED1ps=;
 b=mkam4cnkTbXh7kY8GO/le+5m1lqGcENhCcAmDrdcSSbxxGRIapfb7cGR09Dq7VZiJuxBOQ
 Ds9jSFVQzWDkMsqE7HwaSoF22NjiX+Wna45OHvPJ6NTZgri3lxev1LjMxSEzFQBhzI58Qb
 L+X0Ou6e+qC9O0eDUeg+uIwSDnDqwaAmqnGoWPYfasLU/KbMp3aZfXgHDtsXuOmvNdb08r
 A5cN9unO97DPkLHsW/ls9bHdPTFw3OIrZwriC7VhO7T9Eya2QRk4lf3cG8d2hxOIr8zizw
 g6C0cfygbQ9OkwbfP5fXiBqqh8WwdRkIuLzOgLsUKzbK8XAzUIzMI94efa/rDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mkam4cnk
Subject: Re: [Buildroot] [PATCH 1/2] package/kodi-pvr-iptvsimple: bump
 version to 21.9.3-Omega
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 13 Oct 2024 10:27:01 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
>  package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
