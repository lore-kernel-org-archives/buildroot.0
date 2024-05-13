Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564D7C25B74
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 19:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20B3D82246;
	Mon, 13 May 2024 19:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NPa3g2ooQZ6t; Mon, 13 May 2024 19:35:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF34F82251
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF34F82251;
	Mon, 13 May 2024 19:35:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE87B1BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBBFE607D9
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZfkPxl8KmPVG for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 19:35:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B88E9607A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B88E9607A8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B88E9607A8
 for <buildroot@buildroot.org>; Mon, 13 May 2024 19:35:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D82E1C0005;
 Mon, 13 May 2024 19:35:13 +0000 (UTC)
Date: Mon, 13 May 2024 21:35:12 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20240513213512.55e93cb6@windsurf>
In-Reply-To: <20240513112205.985165-1-troglobit@gmail.com>
References: <20240513112205.985165-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715628913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h02O+vrGQ7u5IoZIVuVYOP9OOMXvzhoYDvV98dSMMXg=;
 b=j9ozrxotb1tQ36fTaTxP7zi7blqCP37bc8BHU5OSvmXEqjyyfgv5TRaJRK49Ebm+3Wua0I
 ohIQX656EMRSo6BMf6sNxGMfklrFgMgvQ394lIWHuum2q5KMQh+uQQP5HZoaKlSOjHae4E
 mBob2xVqBWNOvfa9dnF9RBQEL2IhDk5ZM/IBZfhYYQ1kWJn4/MUVTsc5sqkHs4+pZmx6Ge
 Qyfa7+WopPYLOfVrsXXEiRGrr2+1h9WaY1/q47sfjqT+WaKYnwpnJ5zrs0n7NSsnVLBCpG
 UWDMJJMea5wYirhnQetAP2doYQtD+DHFlvQPlz1L4/XYKDTS+hiZMe80NaopjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j9ozrxot
Subject: Re: [Buildroot] [PATCH 1/1] pacakge/smcroute: bump to version v2.5.7
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

On Mon, 13 May 2024 13:22:05 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> Fixes segfault on kernel without IPv6 support.  For details, see
> https://github.com/troglobit/smcroute/releases/tag/2.5.7
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/smcroute/smcroute.hash | 5 ++---
>  package/smcroute/smcroute.mk   | 2 +-
>  2 files changed, 3 insertions(+), 4 deletions(-)

Applied to master after fixing the typo in the commit title, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
