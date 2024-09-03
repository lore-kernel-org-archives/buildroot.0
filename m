Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D22CD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1BE1402DE;
	Tue,  3 Sep 2024 20:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SF8SrfLHUaEJ; Tue,  3 Sep 2024 20:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAB6A4026A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAB6A4026A;
	Tue,  3 Sep 2024 20:41:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 138321BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2845580EB9
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0PKSNLsCqXCJ for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:41:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1908C80EC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1908C80EC1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1908C80EC1
 for <buildroot@busybox.net>; Tue,  3 Sep 2024 20:41:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DF3A1BF205;
 Tue,  3 Sep 2024 20:41:20 +0000 (UTC)
Date: Tue, 3 Sep 2024 22:41:19 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <20240903224119.0a2fd68a@windsurf>
In-Reply-To: <20240902203957.2650291-1-francois.perrad@gadz.org>
References: <20240902203957.2650291-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725396080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wAAi9Vpe5J3ZLB9BzQ2C06OPIrCzlvQqFC800vN/v0Q=;
 b=EmO345WzAXowohvgRgg/W7ncyCVOAVP5qVdOM89A4jgXggjeDZs+h84qVYNXzTiJNVVHUn
 zYNitvwGl8wF2NkmDYquEExQoVk6OwXUNcIKraHOHONuNXZMe1RkcKijdNgSqPr7QWX50p
 pcGLotRETBOQeduar75yhPt2mL/O/eec1tUT7U6GvkdD0+1TV0JG6FZcm9yncqqChPXzq0
 ibgTYhmWTQOpc9CNbazLJEBXHIVCUS5N9g8EKVn6daMNrKwVxAIPFPJpHqdZJ0uHYIZnGb
 w553GDmGNiWEOIQLO1B5h/1xIT8y0cd58BCKEnERJKX5G5ZRbqEfdTdxdZQdaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EmO345Wz
Subject: Re: [Buildroot] [PATCH] package/slirp: bump to version 4.8.0
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

On Mon,  2 Sep 2024 22:39:57 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/slirp/slirp.hash | 2 +-
>  package/slirp/slirp.mk   | 2 +-
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
