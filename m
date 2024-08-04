Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD9BC3DA7F
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 21:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 549868102A;
	Sun,  4 Aug 2024 21:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GiES6YOle_6a; Sun,  4 Aug 2024 21:06:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D744681086
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D744681086;
	Sun,  4 Aug 2024 21:06:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89BE41BF35E
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 21:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83C0240185
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 21:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6MDedi15CDUa for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 21:06:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 33A484014F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33A484014F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33A484014F
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 21:06:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37E7840002;
 Sun,  4 Aug 2024 21:06:44 +0000 (UTC)
Date: Sun, 4 Aug 2024 23:06:43 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240804230643.47e96e9c@windsurf>
In-Reply-To: <20240804162057.1321387-1-ju.o@free.fr>
References: <20240804162057.1321387-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722805604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/N2o/YrQtAurY2JdvGmML+YoBPOTGdOqU+50a7TtmQ=;
 b=IcvJ2Ce1SNT8ldj3V4N+4Gm+kHla7y7y6s4NVxxPpuXP/Fw6YekkLyYL+np1tEFghX1PFJ
 Gyx/oy6pUIae10o/J9TC76Xp6Raq4w9VDzFqM2KqV9TXeEidcMoyz86uLt7G7ctdcmZUqA
 uxOe4QBxvLTTpz+hOh8IDcJulH59XpXCeH4R+mb598JyLjaDdIWMskn6UdgSGHMkzVwIe+
 cYzdnTzmBNnMAKKmZ7SDXAppPsLNbXYiiZPc2pZFSQIQ+k3aCmK2oRvvA1nTYSSr0SzM+4
 sYCXeN34olqosliK5IdSDVyDs2hMgz+wsAKjsvENcaSnTMDY9iv9izvqk1pLuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IcvJ2Ce1
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx8m[mq]evk*: uboot
 needs openssl and gnutls
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
Cc: Gilles Talis <gilles.talis@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  4 Aug 2024 18:20:57 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Those defconfigs were recently bumped to NXP BSP lf-6.6.23-2.0.0.
> 
> NXP BSP U-Boot version lf-6.6.23-2.0.0 is based on upstream
> version 2024.04. This version now requires OpenSSL and GnuTLS for
> that configuration.
> 
> Those defconfigs are failing in uboot build, with output:
> 
>     In file included from tools/imagetool.h:24,
>                      from tools/imagetool.c:8:
>     include/image.h:1471:12: fatal error: openssl/evp.h: No such file or directory
>      1471 | #  include <openssl/evp.h>
>           |            ^~~~~~~~~~~~~~~
> 
> and:
> 
>     tools/mkeficapsule.c:20:10: fatal error: gnutls/gnutls.h: No such file or directory
>        20 | #include <gnutls/gnutls.h>
>           |          ^~~~~~~~~~~~~~~~~
> 
> This commit fixes the issue by adding BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
> and BR2_TARGET_UBOOT_NEEDS_OPENSSL=y in those defconfigs.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Note: Patch tested in Gitlab CI pipeline:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1400170073
> ---
>  configs/freescale_imx8mmevk_defconfig | 2 ++
>  configs/freescale_imx8mqevk_defconfig | 2 ++
>  2 files changed, 4 insertions(+)

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
