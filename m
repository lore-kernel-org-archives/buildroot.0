Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16A7CD3440
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 399B8401E7;
	Tue,  3 Sep 2024 21:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZ1zyoyUS0t5; Tue,  3 Sep 2024 21:04:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A082402A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A082402A8;
	Tue,  3 Sep 2024 21:04:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D76F1BF48B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B92680539
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8rMqFvZrrpiT for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:04:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2DBD28051E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DBD28051E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DBD28051E
 for <buildroot@busybox.net>; Tue,  3 Sep 2024 21:04:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13BA420003;
 Tue,  3 Sep 2024 21:04:34 +0000 (UTC)
Date: Tue, 3 Sep 2024 23:04:33 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240903230433.2eda17b1@windsurf>
In-Reply-To: <20240902203405.2649359-1-francois.perrad@gadz.org>
References: <20240902203405.2649359-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725397474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TJdesIpx4ARyGt+ZBd41+Fbq/KCcCl+1tn5jdI2YGLg=;
 b=E+5QXa6NLEBO+iiFWsQfeoO2HzcK9hjsZU8PtQ3M8ntrdxbCVeqBOV5ehGO0mkRxAMiB2H
 pGzGgfi1MARVJu8ibhJjzbZ1NX4frYRiM1wzfxo/4WKClXFcvuKPMNDV9p1Mo0aF3Y8Qwn
 xKVXX0ruqzLq22YZn35KcTdZ+U1muYqEXZbqSrrFSr893HNQXmUSQpEKY7LJSbEluG4Xqy
 cO4q3NRIRbAO+bqwFYNcC61zP73m2Arn3P1B5FjS2fJ2R24WreiwXQzWk5K3iG8fGptAMK
 NlQXVq1tEJEhFbJGBaf1Srkh+MZleYpXQlKLkOh8i0prl28rv7m2PekO/qXsZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E+5QXa6N
Subject: Re: [Buildroot] [PATCH] package/libgpiod: bump to version 1.6.5
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  2 Sep 2024 22:33:58 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/libgpiod/libgpiod.hash | 2 +-
>  package/libgpiod/libgpiod.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
