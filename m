Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A905C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62458403C8;
	Mon, 15 Jul 2024 10:50:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7hEOBHhCx8L7; Mon, 15 Jul 2024 10:50:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 244E1403F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 244E1403F8;
	Mon, 15 Jul 2024 10:50:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0221B1BF3FF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2554405C5
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9UiucE8bEcwe for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:50:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F45040533
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F45040533
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F45040533
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:50:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79E84E0005;
 Mon, 15 Jul 2024 10:50:52 +0000 (UTC)
Date: Mon, 15 Jul 2024 12:50:50 +0200
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Message-ID: <20240715125050.0a6328a5@windsurf>
In-Reply-To: <20240213114933.2444440-1-buildroot@bubu1.eu>
References: <20240213114933.2444440-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721040652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J2I6KmtbyG+gaRU27UK84bUM6PQtqz4aNHTLY2Y0ZBg=;
 b=PsIXhkuIsQz0O0OcrsFyQdiywxJAPlfqmdBzJhwEH4hHU4jXOrZ6p0plGIAoleQljaQmTD
 KZhXv78edg+7bUpGs7k1LwdvuX65QuC0kEJbyAgazGwhPIn1aBHiV7DixT5UZ1mfKiGBgm
 dBmBfWFyP5F6+52D4NTINO9xBuBQWF7+mYDuixZV/YGh0vPg3bK4PPH3VHcN3iFhPiJGtz
 DKs0ecdez+KnwJVbukzdohPbMuiM8j4Lho5UMwKsRuoCkm62Vxq50Tm65g0uJpFnn2B++W
 8yJyLXBtrXI4WvfPHEX8vgq81rCzfmBgFajLJiftPdW4vXvpFH6wgYWmIwmhJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PsIXhkuI
Subject: Re: [Buildroot] [PATCH 1/2] package/tio: install bash-completions
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Marcus,

On Tue, 13 Feb 2024 12:49:31 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> See meson_options.txt file [1].
> 
> [1] https://github.com/tio/tio/blob/master/meson_options.txt
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/tio/tio.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/tio/tio.mk b/package/tio/tio.mk
> index d7b554ee84..a7d3537850 100644
> --- a/package/tio/tio.mk
> +++ b/package/tio/tio.mk
> @@ -10,5 +10,10 @@ TIO_SITE = https://github.com/tio/tio/releases/download/v$(TIO_VERSION)
>  TIO_LICENSE = GPL-2.0+
>  TIO_LICENSE_FILES = LICENSE
>  TIO_DEPENDENCIES = inih
> +ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)

Added an empty line between the TIO_DEPENDENCIES line and the condition.

> +TIO_CONF_OPTS +=-Dbashcompletiondir=/usr/share/bash-completion/completions/

Dropped the final / to match with other usage of
/usr/share/bash-completion/completions in the tree.

Applied with those minor nits fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
