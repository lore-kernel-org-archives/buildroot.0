Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D08CCF9E0
	for <buildroot@archiver.kernel.org>; Fri, 24 Oct 2025 18:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EEFD40A66;
	Fri, 24 Oct 2025 18:03:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqZ3_oMpCHA6; Fri, 24 Oct 2025 18:03:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92709409E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92709409E6;
	Fri, 24 Oct 2025 18:03:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 907BF129
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 18:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 820CD60B9F
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 18:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ML4nHJpDSfjP for <buildroot@buildroot.org>;
 Fri, 24 Oct 2025 18:03:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 946EF60628
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 946EF60628
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 946EF60628
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 18:03:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id F08E413F88F;
 Fri, 24 Oct 2025 20:03:11 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Oct 2025 20:03:11 +0200
MIME-Version: 1.0
Date: Fri, 24 Oct 2025 20:03:11 +0200
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
In-Reply-To: <20251020162121.1356-1-kory.maincent@bootlin.com>
References: <20251020162121.1356-1-kory.maincent@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <48b2bb8a5fe39ecfead88455e635e0cf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761328994;
 bh=HvmNLpC0k+WMiYshZSU/tKWtvh/Ok5rpzBBpPMoJ6Bc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PIwkIJMTiNvkOVwq2rAdzon3NXrs4pcvzq7xfRbODlkQSjkFF5AG/unIrg7cgbj+p
 ARQcZqJu+pmy57SjoKXfvBepIvtpxMt+T9AIA4u8OHz81iE4bqn8GEEnulTM1OLtqx
 opHtLu4yn6kjXi+annZ3wO1MhIQiTOl6CaL6AFkGIKP4H1iewvSvwzCnVXOO5fDWxP
 pCGuKom3E1zagOk48QXPwxYk3iOHHDibi9mMBfGiqr8nektCOPkyf9AyaNM+L9uHjB
 SstxR3gv/JUdKb7zaDnQo3PB9bTbHsdKy7q7+rO0Z+ddcDVwR7sVrf/b3jL7pXmIDb
 ph2TZVn1n7rVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PIwkIJMT
Subject: Re: [Buildroot] [PATCH] package/uboot-tools: Bump to version 2025.10
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kory,

Thanks for the patch.

On 20/10/2025 18:21, Kory Maincent via buildroot wrote:
> - The mkeficapsule tools need gnutls to build, and the config 
> dependency
>   to build the tool has changed
> - CONFIG_FIT_SIGNATURE need to be defined to build fit_check_sign
> - CONFIG_FIT_PRINT does not need to be defined anymore
> - Remove patch 2 and reorder patch files
> - Include linux/kconfig.h to include/config.h to allow IS_ENABLED macro
>   to be used in c files
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
[...]
> diff --git a/package/uboot-tools/uboot-tools.mk 
> b/package/uboot-tools/uboot-tools.mk
> index 1925047ccd..fc8059111d 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -UBOOT_TOOLS_VERSION = 2021.07
> +UBOOT_TOOLS_VERSION = 2025.10

For testing this patch, I built few defconfigs selecting
this host-uboot-tools. You can get the list with the command:

     git grep -Fl BR2_PACKAGE_HOST_UBOOT_TOOLS configs | \
         sed 's#^configs/##'

While testing, I found this patch was breaking at least the following
defconfigs:
aspeed_ast2500evb_defconfig
aspeed_ast2600evb_defconfig
beaglev_fire_defconfig

You need to look the build logs, because some post scripts are failing
silently and the Buildroot Makefile returns a success. We should fix
that in separate commits later.

Could you have a look what is the source of those build failures please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
