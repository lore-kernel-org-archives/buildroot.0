Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16257C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 10:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E76860B2C;
	Sun, 23 Feb 2025 10:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4FaZ75ifl2z3; Sun, 23 Feb 2025 10:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96FA660B30
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96FA660B30;
	Sun, 23 Feb 2025 10:55:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB889B88
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 10:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD074811B5
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 10:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvbIRIwRiirz for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 10:55:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8FF308110F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FF308110F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8FF308110F
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 10:55:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D263D5FFAF;
 Sun, 23 Feb 2025 11:55:28 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Feb 2025 11:55:28 +0100
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 11:55:28 +0100
From: Julien Olivain <ju.o@free.fr>
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250222205242.19583-1-kuzminov.sergey81@gmail.com>
References: <20250222205242.19583-1-kuzminov.sergey81@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <7167fe843d687849b6a1f2d0c59ad356@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740308130;
 bh=4m90pmE7sim2Vmmzr7jUuF6F+LsiQ7XsQF5b62cuR78=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EENMyGEs8Z/2p/sLavPl80by4b2N+Oo08YyEl+FL7dJpJY23CWb3ll8ZRj3fyjtIB
 RPuW0DpksfWijkBV9XWFznxGABrwWYrptFGjqNQXmy6bWyY0nwt1t5F2h4wP6sBScJ
 jAlIlhd15bWHb38BpcP10EidHSwLpqEWvDUhAJdZZKeKjQcaRxoT7zq9oUGv+AnsJN
 sXQltpZPwijy9EI58eQQ4VOhE+XKO5Uh+i58MfiEWzUqpY+8Om3C3GNBQEnPLA9SYI
 NxpQQ9nJtr/7vApatWtwUJVWgXd/5A3G6e+CJoGC0h2BFv804T/3iO/yIAeiNp7OTA
 ZBbH65V80Ai4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EENMyGEs
Subject: Re: [Buildroot] [PATCH v3 1/1]
 configs/friendlyarm_nanopi_r3s_defconfig: new defconfig
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey,

Thanks for the updated patch!

While I tested this patch in the Buildroot reference Docker image
used by our CI, I observed few u-boot build failures. I tested with
the following commands:

     utils/docker-run
     make friendlyarm_nanopi_r3s_defconfig
     make

The failures are due to missing u-boot host dependencies.
See my comments below in friendlyarm_nanopi_r3s_defconfig.

On 22/02/2025 21:52, Sergey Kuzminov wrote:
> This patch adds basic support for the new FriendlyARM NanoPi R3S board:
>  - 
> https://www.friendlyelec.com/index.php?route=product/product&product_id=303
>  - https://wiki.friendlyelec.com/wiki/index.php/NanoPi_R3S
> 
> Hardware Spec:
>  - CPU: Rockchip RK3566, Quad-core Cortex-A55
>  - RAM: 2GB LPDDR4X
>  - Ethernet: one Native Gigabit Ethernet, and one PCIe Gigabit Ethernet
>  - USB3.0 Host: Type-A x1
>  - Storage: MicroSD Slot x 1, and on-board 32GB eMMC
>  - Debug Serial Port: 3.3V TTL, 3-pin 2.54mm pitch connector, 1500000 
> bauds
>  - LED: LED x 3
>  - RTC: One low-power RTC, support backup battery input
>  - Buttons: 1x User button, 1x MASK button for eMMC flashing via USB-C
>  - Display: 1x MIPI-DSI 30-Pin FPC connector
> 
> BSP includes the following components:
>  - mainline ATF v2.12
>  - mainline U-Boot v2025.04-rc2
>  - mainline Linux kernel v6.13.4

Also, could you add a note in the commit log, justifying why you
chose a RC version of u-boot please?  Something like:

"""
Note: this defconfig is using U-Boot v2025.04-rc2 because the
NanoPi R3S support was added in upstream commit [1] first included
in v2025.04-rc1.

[1] 
https://source.denx.de/u-boot/u-boot/-/commit/bf4a33e725ae02cae064a03ea90c45779780f323
"""

> Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>

[...]

> diff --git a/configs/friendlyarm_nanopi_r3s_defconfig 
> b/configs/friendlyarm_nanopi_r3s_defconfig
> new file mode 100644
> index 0000000000..f5db08c631
> --- /dev/null
> +++ b/configs/friendlyarm_nanopi_r3s_defconfig
> @@ -0,0 +1,43 @@

[...]

> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04-rc2"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-r3s-rk3566"

We need to add here:
BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y

> +BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y

and here:
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
BR2_TARGET_UBOOT_NEEDS_GNUTLS=y

> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
> +BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
> +BR2_PACKAGE_HOST_GENIMAGE=y

Could you send an updated patch please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
