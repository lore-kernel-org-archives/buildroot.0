Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2D6C5475B
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 02:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA751400BF;
	Thu, 29 Feb 2024 02:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tbj0H1vECFk8; Thu, 29 Feb 2024 02:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40BC640489
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40BC640489;
	Thu, 29 Feb 2024 02:22:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A06431BF426
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 02:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B53141734
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 02:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pFzI3fk_86Oo for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 02:22:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8FEBB41722
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FEBB41722
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FEBB41722
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 02:22:27 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41T2MNdM107935;
 Wed, 28 Feb 2024 20:22:23 -0600
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41T2MNxg100576
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 28 Feb 2024 20:22:23 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 Feb 2024 20:22:23 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 Feb 2024 20:22:22 -0600
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41T2MNqk047902;
 Wed, 28 Feb 2024 20:22:23 -0600
Date: Wed, 28 Feb 2024 20:22:22 -0600
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240229022222.exmx2cgijdjrtnwp@dasso>
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
 <20240227163019.2876942-16-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240227163019.2876942-16-dario.binacchi@amarulasolutions.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1709173343;
 bh=b6S3DsU7rzwzJcrhUSgdcx/L5zyUnRhhJlhr0bcyzLA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ozd+FaUnzUqJ3/SRrbDV0HyzJAr2ddp7snb7HhfMpijNRUr93iu4UnDMkUb3Dx/p5
 sUcimrrhsjXNKRaeHvB7Z0RK057YoRVs6WMHFCTVas6QDShEZl+TJ7fqnk/ktluUSt
 eZ6Uok2SNi4zwvRMwjW5FFF0anpOQTzQ2RXhQXUk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ozd+FaUn
Subject: Re: [Buildroot] [PATCH v7 15/17] boot/ti-k3/ti-k3-r5-loader:
 install tiboot3.bin
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: linux-amarula@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, michael@amarulasolutions.com,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

On Tue, Feb 27, 2024 at 05:30:17PM +0100, Dario Binacchi wrote:
> Recent versions of U-Boot are capable of building tiboot3.bin using
> Binman. In this case, let's copy it to the binaries directory.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v6:
> - Replace `find' command with `cp' one.
> 
> Changes in v5:
> - Replace tiboot3-*-$(TI_K3_R5_LOADER_SECTYPE)-*.bin with
>   tiboot3-$(TI_K3_R5_LOADER_SOC)-$(TI_K3_R5_LOADER_SECTYPE)-*.bin
> 
> Added in v4
> 
>  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> index fdb058f3b72a..cbdb653278f8 100644
> --- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> @@ -70,8 +70,12 @@ define TI_K3_R5_LOADER_BUILD_CMDS
>  	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
>  endef
>  
> +TI_K3_R5_LOADER_SECTYPE = $(call qstrip,$(BR2_PACKAGE_TI_K3_SECTYPE))
> +TI_K3_R5_LOADER_SOC = $(call qstrip,$(BR2_PACKAGE_TI_K3_SOC))
> +
>  define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
>  	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
> +	cp $(@D)/tiboot3-$(TI_K3_R5_LOADER_SOC)-$(TI_K3_R5_LOADER_SECTYPE)-*.bin $(BINARIES_DIR)/tiboot3.bin

Have you tried doing a clean build of ti_am64x_sk_defconfig? When I do
that the change above breaks the build...

<snip>
>>> ti-k3-r5-loader 2022.10 Installing to images directory
cp /home/a0797059/git/buildroot/output/build/ti-k3-r5-loader-2022.10/spl/u-boot-spl.bin /home/a0797059/git/buildroot/output/images/r5-u-boot-spl
.bin
cp /home/a0797059/git/buildroot/output/build/ti-k3-r5-loader-2022.10/tiboot3-am64x-gp-*.bin /home/a0797059/git/buildroot/output/images/tiboot3.b
in
cp: cannot stat '/home/a0797059/git/buildroot/output/build/ti-k3-r5-loader-2022.10/tiboot3-am64x-gp-*.bin': No such file or directory
make[1]: *** [package/pkg-generic.mk:364: /home/a0797059/git/buildroot/output/build/ti-k3-r5-loader-2022.10/.stamp_images_installed] Error 1
make: *** [Makefile:82: _all] Error 2
<snip>

Looks like the tiboot3.bin file is already there, and nothing needs to
be copied or renamed. Not sure what is best way to manage this
dependency as this is the behavior of the older U-Boot. I'd probably
just migrate the am64x_sk support to binman too also using the
same/newer U-Boot you are already using for AM62x, making everything
equivalent of the am62x_sk support you are focused on with this series.

--
Andreas Dannenberg
Texas Instruments Inc





>  endef
>  
>  $(eval $(kconfig-package))
> -- 
> 2.43.0
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
