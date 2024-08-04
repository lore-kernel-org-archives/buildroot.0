Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429A7C3DA64
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 21:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E9B881026;
	Sun,  4 Aug 2024 21:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yY6U1qOJtRA; Sun,  4 Aug 2024 21:06:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FD178102A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FD178102A;
	Sun,  4 Aug 2024 21:06:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D033C1BF35E
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 21:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C823340390
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 21:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JaxK7odpqaan for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 21:06:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4BA2140280
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BA2140280
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4BA2140280
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 21:06:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2012C1BF203;
 Sun,  4 Aug 2024 21:06:36 +0000 (UTC)
Date: Sun, 4 Aug 2024 23:06:35 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240804230635.7531f13a@windsurf>
In-Reply-To: <20240804161557.1319569-1-ju.o@free.fr>
References: <20240804161557.1319569-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722805596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z5dS1YdJoBeVCPsnaKycfFkIEZIPNoSHKjZl6bhkimg=;
 b=Wj5YOS1XQzpuM8xjpw/1vaS1e78cyqp2KAGLJa7coPfgSa1/6vveWjCyrGUt2ozu4NTU3d
 JvzCOF7QSD2duX2aXFCONH1KwCtRkywivdPtZDzf/GsD4MayoFn0iC9qCIiGBYmnUyFOfF
 gqHtofdPZ81Kgxu3g2RB6ANw1mawJVLW1jYD9l26yezt6ykGg8wNnA++fexehXzbotG9fJ
 o+GXt+570clA4LeKaUy4d5iGtpNpciTFUOdyWP2aJp/QsH57vxip0298e9zpp/NRsDKs0u
 dUt5zVnTpXOfnVRQ9Jq8sR35GXpMHyP867N4d2TNgBQTDN9xEnC8lr6ua5yQSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Wj5YOS1X
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx8q*: uboot needs
 openssl
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
Cc: Fabio Estevam <festevam@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  4 Aug 2024 18:15:57 +0200
Julien Olivain <ju.o@free.fr> wrote:

> Those defconfigs were recently bumped to NXP BSP lf-6.6.23-2.0.0.
> 
> NXP BSP U-Boot version lf-6.6.23-2.0.0 is based on upstream
> version 2024.04. This version now requires OpenSSL.
> 
> Those defconfigs are failing in uboot build, with output:
> 
>     In file included from tools/imagetool.h:24,
>                      from tools/imagetool.c:8:
>     include/image.h:1471:12: fatal error: openssl/evp.h: No such file or directory
>      1471 | #  include <openssl/evp.h>
>           |            ^~~~~~~~~~~~~~~
> 
> This commit fixes the issue by adding
> BR2_TARGET_UBOOT_NEEDS_OPENSSL=y in all the impacted defconfigs.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Note: Patch tested in Gitlab CI pipeline:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1400170073
> ---
>  configs/freescale_imx8qmmek_defconfig  | 1 +
>  configs/freescale_imx8qxpmek_defconfig | 1 +
>  2 files changed, 2 insertions(+)

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
