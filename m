Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84E6CAC5B0
	for <buildroot@archiver.kernel.org>; Mon, 29 Sep 2025 16:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 945B18125F;
	Mon, 29 Sep 2025 16:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mOg1QHCcQrEX; Mon, 29 Sep 2025 16:14:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7D678121A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7D678121A;
	Mon, 29 Sep 2025 16:14:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D73D12D
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 16:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27D7A406E1
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 16:14:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0iWI1t-IKyR for <buildroot@buildroot.org>;
 Mon, 29 Sep 2025 16:14:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 45530401FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45530401FE
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45530401FE
 for <buildroot@buildroot.org>; Mon, 29 Sep 2025 16:14:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 384C41A101E;
 Mon, 29 Sep 2025 16:14:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0C204606AE;
 Mon, 29 Sep 2025 16:14:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7CF63102F19CE; 
 Mon, 29 Sep 2025 18:13:57 +0200 (CEST)
Date: Mon, 29 Sep 2025 18:13:55 +0200
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250929181355.09996a03@booty>
In-Reply-To: <20250929071622.136094-1-neal.frager@amd.com>
References: <20250929071622.136094-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1759162444; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=YvlAyA2W3sDwvRFLaJkxJLWBxcicsbQ08XWofGP2BVc=;
 b=RDPPq8fK3hPMuCYgRBk8zXVOkXe9ZtJ0z4W3hQHxbJ/3efPXtOkQm2fpjPb/1ZjD/GIbiN
 6RQctp4S1aWP1OgTfwrmUuajFUEYouJgOyB+9BXEtYzxpoV729IpkyK/FatAhwyYYC7/o2
 hqe/k8f0gM1pYIkET0ly7acsK2JBUSXh8BxNBoDC+S9F6sjo63BkyOqYBON+OgSGnEXU6L
 er3FA1k7m7zsvYjYYCdiRdXWHVOyORY/pa8RGWtxYryQtSPuSnvCnpuxZJnSGKWYLAyAzi
 2UDkLaPDN6ZT76iW3jvuIQ+cJ2MHX6U7kz6xnNnYqNTih+LkJ3hBN+HkoQJeog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=RDPPq8fK
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynq: correct zed board links
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com, buildroot@buildroot.org,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 29 Sep 2025 08:16:22 +0100
Neal Frager <neal.frager@amd.com> wrote:

> The web link www.zedboard.org is no longer valid as it routes to a generic
> avnet.com boards link. Fix this issue by providing direct links to the Avnet
> ZedBoard and Tria MicroZed boards.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
