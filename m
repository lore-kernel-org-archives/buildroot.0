Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93841CD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 20:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 625664054B;
	Wed, 10 Apr 2024 20:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jiHLUYysTYp8; Wed, 10 Apr 2024 20:23:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 765754176A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 765754176A;
	Wed, 10 Apr 2024 20:23:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8EF741BF4DD
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87B678211F
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 20:23:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sieHcY3ja7l9 for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 20:22:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 807CC8211E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 807CC8211E
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 807CC8211E
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 20:22:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4457B1C0002;
 Wed, 10 Apr 2024 20:22:56 +0000 (UTC)
Date: Wed, 10 Apr 2024 22:22:55 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240410222255.4560e05e@windsurf>
In-Reply-To: <20240408172928.150727-1-ju.o@free.fr>
References: <20240408172928.150727-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712780576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mwCzxHOVYZoORK0kLv+dd+SbN4odGR53XJFTZl7es2w=;
 b=CFd3jgLg07zT6qOF4ZtjRrVh+HajCppu9BzOVPYAtcLG+vE5PdlMlIFwHsqatX4RMMz+QY
 2PTMw9P8kW6Xe/F7q0cWJ8pS4XiuiAk7UN2VD/PfUAvPKFNjMlVq8Snap0fY5AVF7V6X4y
 FwgSQ8bP4ih7CewzJeAYcHu+F0UTc2eIO5vI31+Hn3EX3URxv//L6AN5bhRj+aD9p1UA1B
 18hj7bovIb+75i/1ZWTr1ZO1A+i/6rwLiVHJzHONSNBG4WrJIHvVUC/2UqmhtYpFfvvj7Z
 9uF1ZY7+gW0JLsNIe08YBHPfGTpWfJiZAQU6WEToBjRPrSe6h9omuk6AHkJZQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CFd3jgLg
Subject: Re: [Buildroot] [PATCH 1/1] package/libjxl: bump to version 0.10.2
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

On Mon,  8 Apr 2024 19:29:28 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For release notes since v0.10.1, see:
> - https://github.com/libjxl/libjxl/releases/tag/v0.10.2
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
