Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF0DD3ABF4
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 20:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 789AF60706;
	Mon, 11 Nov 2024 20:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4UZNUbDZ2fh; Mon, 11 Nov 2024 20:28:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A85360708
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A85360708;
	Mon, 11 Nov 2024 20:28:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 037DDDB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E67696070D
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bhUA5tpsfolw for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 20:28:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B30B360708
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B30B360708
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B30B360708
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 20:28:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8BBFFF803;
 Mon, 11 Nov 2024 20:28:08 +0000 (UTC)
Date: Mon, 11 Nov 2024 21:28:08 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241111212808.4e5507ac@windsurf>
In-Reply-To: <20241111131352.257334-1-ju.o@free.fr>
References: <20241111131352.257334-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1731356888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qz8+lGBR6noGyNXRTj59Vnok4QQio8yu91p/9fvUc4I=;
 b=j86vYrKgyRyUKWFF4Xj1ej6nXqCPIKJDNPKGbgsUNHIu/r2NEVFB6UBF1vGF5ZdWh3suOi
 1ThNTJ59K7DCwmjXpAEcsiPUrqP66AviIcUeGHXwfojba6Z1gZ43r73du1uzf62A0gi5EA
 6+blaGqqbQJgaAtaYkgUqK5MqEBUXd/sJiKDT3hZKnSq2x7625E5vQ4NruGppQuvVBEWwJ
 GQvcr72zDA+X8wNhi8krv8EGzJxoP2fs5uAzFsUqgo0ZhT2PXNuAna6YAwTdZ2CRG+V940
 IdxuxBub5/Rs5zpzncomH0MOL4lgxS84qAZVT0NvXc2TpcRaihUinXoHuI0SEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j86vYrKg
Subject: Re: [Buildroot] [PATCH 1/1] package/findutils: bump version to
 4.10.0
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

On Mon, 11 Nov 2024 14:13:52 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For release announce, see:
> https://lists.gnu.org/archive/html/info-gnu/2024-07/msg00002.html
> 
> This commit also updates the hash file comment, to use the sha256 hash
> published in the release announce, to provide the signature URL and the
> pgp key id used for the signature verification.
> 
> See the gnulib documentation for details [1]. Contrary to what the
> option name might suggest, it doesn't really disable Y2038 support,
> but only the check that the system is Y2038 compliant. So even with
> --disable-year2038, if the system is Y2038 compliant (uses a 64-bit
> arch, uses the musl C library, or uses the glibc C library with
> BR2_TIME_BITS_64=y), findutils will be Y2038 compliant.
> 
> [1] https://www.gnu.org/software/gnulib/manual/html_node/Avoiding-the-year-2038-problem.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1536449589
> ---
>  package/findutils/findutils.hash | 7 +++++--
>  package/findutils/findutils.mk   | 3 ++-
>  2 files changed, 7 insertions(+), 3 deletions(-)

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
