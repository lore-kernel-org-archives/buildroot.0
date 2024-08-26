Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588D1C5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 16:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EE5360748;
	Mon, 26 Aug 2024 16:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSCS1wG-AijK; Mon, 26 Aug 2024 16:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3100C6077C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3100C6077C;
	Mon, 26 Aug 2024 16:40:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD1F11BF33F
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9D4E80DDB
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DPINVOjlksbJ for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 16:40:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AB3F380BA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB3F380BA6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB3F380BA6
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 16:40:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17B5320002;
 Mon, 26 Aug 2024 16:40:27 +0000 (UTC)
Date: Mon, 26 Aug 2024 18:40:27 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20240826184027.6e649e4a@windsurf>
In-Reply-To: <20240824180307.829708-1-festevam@gmail.com>
References: <20240824180307.829708-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724690428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8FPUMQq4syXVL0q00w38PPSKkae+nMBHXeXvXlqFjEE=;
 b=GAw3z2BE0QD6DX+a3YrY3DztdYRb8Xyl5cJfOMfBjY0B3zzp0CaRx+BcXiofdffQpIPXga
 6uzoeYgXx5dX+mlzXDFIXX2bYWBYeZJbmSCNKU1qsjx/O9GAP+dNB89m8iF2DXF2c9d8Bz
 jFAQi0aTN82kA6psOLhHyOQLG957uKNUXiFRVI3GENZ7hXdqXDAPAz3Nry10a6EYiaUT0g
 Ec0L7nwufX+/j79bvQVvUcH5i+HJVlyZyfWd8trXtw3JcZQ6MX5/8lGgRtbt1G0A/PF2Gt
 GUe5f7DCC3YPI5oRoW5riMZtlcG6eeTNGuEWjGMnktDO/8ntjJ3Z3hgXxdKRHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GAw3z2BE
Subject: Re: [Buildroot] [PATCH] configs/mx25pdk: remove defconfig
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

Hello Fabio,

On Sat, 24 Aug 2024 15:03:07 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> The imx25pdk board has been removed from U-Boot and I no
> longer have access to the board.
> 
> Remove its support.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  .checkpackageignore                          |  1 -
>  DEVELOPERS                                   |  1 -
>  board/freescale/imx25pdk/readme.txt          | 54 --------------------
>  configs/mx25pdk_defconfig                    | 35 -------------
>  package/freescale-imx/Config.in              |  3 --
>  package/freescale-imx/firmware-imx/Config.in |  1 -
>  6 files changed, 95 deletions(-)
>  delete mode 100644 board/freescale/imx25pdk/readme.txt
>  delete mode 100644 configs/mx25pdk_defconfig

I've applied to master, but not the changes to package/freescale-imx/
because:

 (1) They are not directly related to the defconfig

 (2) They may be used by other people having other i.MX25 platforms
     (yeah, ok, unlikely)

 (3) They were causing a warning:

     package/freescale-imx/Config.in:113: BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STACK referenced but not defined

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
