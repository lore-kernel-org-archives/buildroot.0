Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF76C3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 17:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A0D960886;
	Mon, 29 Jul 2024 17:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rj9z2ZNFsBw4; Mon, 29 Jul 2024 17:57:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75FF560887
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75FF560887;
	Mon, 29 Jul 2024 17:57:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF4951BF424
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BD02810A4
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 17:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s25RoTYL5sY5 for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 17:57:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 87CB081065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87CB081065
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87CB081065
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 17:57:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6D7C20004;
 Mon, 29 Jul 2024 17:57:13 +0000 (UTC)
Date: Mon, 29 Jul 2024 19:57:07 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240729195707.56a8b6a5@windsurf>
In-Reply-To: <20240728075124.4676-1-bernd@kuhls.net>
References: <20240728075124.4676-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722275834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tyw1WDwzZbQ7Ieal+bbqSoreh/qp44wNVnWJtTd5cao=;
 b=g/sZvgPpppOgNZO/yaDTMRAFCPaT+NS2EdpoJaumoNPFjYSL/KI50WbIHHG8mKjyUsTBQv
 E9aoXo1H01Q51VNag8HgPF5PDMUAdWgxLbh30u2AsQlpsqpWVwNu0kOM2IFNjmD1m1X/j8
 23mIvxtHdOZKH8KgsVLL8m/Xvd6pdje6o3mANW8hOArOx7K7ZAH2QKhjRQCmSpoSND+zjA
 xRkKnKZ5rwuyVpjS+sR+sOmAEusEqDn/O/dCjiwwhsDEQ43SDaS3BR8YDiFWtXKUunH3V1
 ss3Vjqpa5fslaWZm0NoxbG3w4SwTto0PNj9qSGRu4Q1ESjVXq4x/OPLPbiGLxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g/sZvgPp
Subject: Re: [Buildroot] [PATCH 1/1] package/ethtool: bump to version 6.9
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

On Sun, 28 Jul 2024 09:51:24 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/ethtool/ethtool.hash | 2 +-
>  package/ethtool/ethtool.mk   | 2 +-
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
