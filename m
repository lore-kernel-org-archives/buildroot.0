Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5F2C021A0
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 22:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88E9B6086A;
	Thu, 13 Feb 2025 22:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wjha6dMxWwVi; Thu, 13 Feb 2025 22:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8291F61AC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8291F61AC9;
	Thu, 13 Feb 2025 22:37:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88A8E1C6
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 22:37:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69A014041D
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 22:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SzEJBmBJQZB for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 22:37:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DCD894025E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCD894025E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCD894025E
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 22:37:07 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:a40d:f720:8157:c874])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 35844B0053D;
 Thu, 13 Feb 2025 23:36:58 +0100 (CET)
Date: Thu, 13 Feb 2025 23:36:57 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Brandon Maier <Brandon.Maier@collins.com>, 
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>, 
 Ioana Ciornei <ciorneiioana@gmail.com>, romain.naour@smile.fr, ju.o@free.fr
Message-ID: <yqcc7uljornncabx65uvjkcm6yeb6fjuxooqpnrwztna7l65ln@4ojzvzt2zv6k>
References: <20241208143802.1048266-1-olteanv@gmail.com>
 <20241208143802.1048266-3-olteanv@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241208143802.1048266-3-olteanv@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739486225;
 bh=MBlL7DEafKJ5sFzAuonn0mC3br5uf7G3T3rkF0RJ1vA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sr/vY6tw62DlJJy+KWRwc0uAoxUYDJ0R0gm+jVm2weJ9jDYyCYLGk/jBUgazRQ2si
 3ClsorrhJnWxM29LY4EopiuR5Jiv+6SnCDrzM1x5sDlKHLzTazzO+zDx/d+D++Hbk3
 oDPwq/y+JczV0zBptDBoiPm5URltcMJSwhmLAnVErOUA+pO6Q1028QIJmcm5m15J/x
 ONs/HoMDxZRACBX50b9rkQh3CVuSlsgHqstfDxbShzH0NddhQYK7k0IR3hyp7DQfvx
 2QjiiCGP7KVTamUXggEeThWcO34VND3vv1NMFV3bFS/agp34CrbdIHBa+KlL13bcX2
 Pi7jDtulhjhaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Sr/vY6tw
Subject: Re: [Buildroot] [PATCH v2 02/11] package/qoriq-ddr-phy-binary: new
 package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, Romain,

I believe that this package, without the serie can be applied. It has
values for any NXP LX2 SoC.

On Sun, Dec 08, 2024 at 04:37:53PM +0100, Vladimir Oltean wrote:
> The DDR PHY on the NXP LX2160A SoC needs firmware. This is distributed
> as prebuilt binaries by NXP through GitHub.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Romain Naour <romain.naour@smile.fr>

Reviewed-by: Vincent Jardin <vjardin@free.fr>

Best regards,
  Vincent

> ---
> v1->v2: none
> 
>  DEVELOPERS                                     |  3 +++
>  package/Config.in                              |  1 +
>  package/qoriq-ddr-phy-binary/Config.in         |  6 ++++++
>  .../qoriq-ddr-phy-binary.hash                  |  3 +++
>  .../qoriq-ddr-phy-binary.mk                    | 18 ++++++++++++++++++
>  5 files changed, 31 insertions(+)
>  create mode 100644 package/qoriq-ddr-phy-binary/Config.in
>  create mode 100644 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
>  create mode 100644 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index aedd73677257..0260fc52e4e3 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3301,6 +3301,9 @@ N:	Vivien Didelot <vivien.didelot@gmail.com>
>  F:	board/technologic/ts5500/
>  F:	configs/ts5500_defconfig
>  
> +N:	Vladimir Oltean <olteanv@gmail.com>
> +F:	package/qoriq-ddr-phy-binary/
> +
>  N:	Volkov Viacheslav <sv99@inbox.ru>
>  F:	package/v4l2grab/
>  F:	package/zbar/
> diff --git a/package/Config.in b/package/Config.in
> index 1eb5e1e0208f..53e3170ea0f6 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -454,6 +454,7 @@ menu "Firmware"
>  	source "package/murata-cyw-fw/Config.in"
>  	source "package/odroidc2-firmware/Config.in"
>  	source "package/qcom-db410c-firmware/Config.in"
> +	source "package/qoriq-ddr-phy-binary/Config.in"
>  	source "package/qoriq-fm-ucode/Config.in"
>  	source "package/rcw-smarc-sal28/Config.in"
>  	source "package/rpi-firmware/Config.in"
> diff --git a/package/qoriq-ddr-phy-binary/Config.in b/package/qoriq-ddr-phy-binary/Config.in
> new file mode 100644
> index 000000000000..301a2c197421
> --- /dev/null
> +++ b/package/qoriq-ddr-phy-binary/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_QORIQ_DDR_PHY_BINARY
> +	bool "qoriq-ddr-phy-binary"
> +	help
> +	  Firmware binary for DDR PHY of NXP LX2160A family of SoCs.
> +
> +	  https://github.com/nxp-qoriq/ddr-phy-binary
> diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
> new file mode 100644
> index 000000000000..7357e741fcfa
> --- /dev/null
> +++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  b49cb34f941f7e534ec31d3d14d18d4e565e4875b690ecb0d7e2992b72c64dc7  qoriq-ddr-phy-binary-lf-6.6.36-2.1.0.tar.gz
> +sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  NXP-Binary-EULA.txt
> diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
> new file mode 100644
> index 000000000000..ab25ff541d9c
> --- /dev/null
> +++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# qoriq-ddr-phy-binary
> +#
> +################################################################################
> +
> +QORIQ_DDR_PHY_BINARY_VERSION = lf-6.6.36-2.1.0
> +QORIQ_DDR_PHY_BINARY_SITE = $(call github,nxp-qoriq,ddr-phy-binary,$(QORIQ_DDR_PHY_BINARY_VERSION))
> +QORIQ_DDR_PHY_BINARY_LICENSE = NXP Binary EULA
> +QORIQ_DDR_PHY_BINARY_LICENSE_FILES = NXP-Binary-EULA.txt
> +QORIQ_DDR_PHY_BINARY_INSTALL_IMAGES = YES
> +QORIQ_DDR_PHY_BINARY_INSTALL_TARGET = NO
> +
> +define QORIQ_DDR_PHY_BINARY_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -D $(@D)/lx2160a/fip_ddr.bin $(BINARIES_DIR)/fip_ddr.bin
> +endef
> +
> +$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
