Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE72C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 20:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E78B80C8C;
	Wed, 10 Jul 2024 20:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WdhOZs3OZBrC; Wed, 10 Jul 2024 20:12:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A35481C81
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A35481C81;
	Wed, 10 Jul 2024 20:12:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 350561BF599
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B34D40248
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmqATJ3VpvA0 for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 20:12:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 02B4F40160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02B4F40160
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02B4F40160
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 20:12:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CE4620002;
 Wed, 10 Jul 2024 20:12:32 +0000 (UTC)
Date: Wed, 10 Jul 2024 22:12:32 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240710221232.669df7c5@windsurf>
In-Reply-To: <20240710200353.146248-1-ju.o@free.fr>
References: <20240710200353.146248-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720642353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=73vPY7980sZKACiUGN2vQWyG6ZfWva8kErwUxgE6yHw=;
 b=HoG2gxGxlzWCVkZ2N4EoMo57Nq34fsO9dYJuIsKBY+YVZYHjJhqYJQ7kRssfXeKK/ie7fu
 NgbYVIM+Nkg8hm44UzdtnxlgWDuOyuE4NE4MoXihsdzXe6q6r+GABFK5ItltmBRaLEMCLH
 ZChFuXVTIocqeD2ymSeBSIMu6wh8QMsdIXBZJC36dcCI3Ex+0cAz5LvL9jYeBIFtaNu9an
 HJngQQwWuNJMlfo9/K4fTFAgksKnnH4fZuOQsZpO6sNXw9O8z5rgLvUuz3xUaLWsJg/4lu
 wWgyjopef6UXj5mtUno/iWFluuPDXLo89cV1SRWtF4bCuOiAd/3inHFNRAd8yw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HoG2gxGx
Subject: Re: [Buildroot] [PATCH 1/1] package/libjxl: bump to version 0.10.3
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

On Wed, 10 Jul 2024 22:03:53 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For release notes since v0.10.2, see:
> - https://github.com/libjxl/libjxl/releases/tag/v0.10.3
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/libjxl/libjxl.hash | 2 +-
>  package/libjxl/libjxl.mk   | 2 +-
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
