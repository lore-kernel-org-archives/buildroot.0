Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6EFD12D50
	for <buildroot@archiver.kernel.org>; Sun, 10 Nov 2024 20:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A72CE401FE;
	Sun, 10 Nov 2024 20:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWCvMom5TVRF; Sun, 10 Nov 2024 20:47:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 447E240174
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 447E240174;
	Sun, 10 Nov 2024 20:47:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E86D5DAC
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 20:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5EA540155
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 20:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ButTLeg7GnVT for <buildroot@buildroot.org>;
 Sun, 10 Nov 2024 20:47:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6FA0F4015E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FA0F4015E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FA0F4015E
 for <buildroot@buildroot.org>; Sun, 10 Nov 2024 20:47:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 579A2B00539;
 Sun, 10 Nov 2024 21:47:30 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58020])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 10 Nov 2024 21:47:30 +0100
MIME-Version: 1.0
Date: Sun, 10 Nov 2024 21:47:30 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20241110182451.49722-2-vjardin@free.fr>
References: <20241110182451.49722-1-vjardin@free.fr>
 <20241110182451.49722-2-vjardin@free.fr>
User-Agent: Webmail Free/1.6.9
Message-ID: <327efbe09f993c827276a3e68923b604@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731271651;
 bh=ma8yw6fV0BqxNY/JxaJEQsRtRFAELzYQ33sfSGCSKhg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Lano2ga6Bo6U+TKrPLbGICuN3Z+drWvhtJcB5CCV6NlpmVJlRLmBEs4C6TRpQjlzd
 WiKGGAmsls0ETBQZtbWurP4kB7K6PowuXQwoOY99ofJH9/KcdLkNmqfgrI9uLxoiKX
 1FxZQDlcKzNv47K4DbxrhDjn+H7xFtgEcda1HvbusjsGkqaikIOHW8damEMv0nMoWL
 b5NMMmPBuXFAjfh0QTpj9dDll4F76MKXANaRtnKWF711HAt5kzeG+5tCQawlystym/
 +AE/fpZAU2uZs99PLcZHwA7NxSlS8yAqc525o1Cc/RaZ8K2djAVoli/R4ANN2lrPMf
 QheWlYR/djI7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Lano2ga6
Subject: Re: [Buildroot] [PATCH v1 1/1] package/mlx5ctl: new package
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

Hi Vincent,

Thanks for this patch!

On 10/11/2024 19:24, Vincent Jardin wrote:
> Add a new package that can be used to manage the Mellanox/NVIDIA
> Connect-X boards.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/mlx5ctl/Config.in    |  9 +++++++++
>  package/mlx5ctl/mlx5ctl.hash |  3 +++
>  package/mlx5ctl/mlx5ctl.mk   | 12 ++++++++++++
>  5 files changed, 26 insertions(+)
>  create mode 100644 package/mlx5ctl/Config.in
>  create mode 100644 package/mlx5ctl/mlx5ctl.hash
>  create mode 100644 package/mlx5ctl/mlx5ctl.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index edf823b34b..384e185944 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -3274,6 +3274,7 @@ N:	Vincent Jardin <vjardin@free.fr>
>  F:	board/nvidia/bf3/
>  F:	configs/nvidia_bf3_defconfig
>  F:	package/dpdk/
> +F:	package/mlx5ctl/
> 
>  N:	Vincent Prince <vincent.prince.fr@gmail.com>
>  F:	package/nss-myhostname/
> diff --git a/package/Config.in b/package/Config.in
> index 876b340a8a..d60835a2be 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -567,6 +567,7 @@ endmenu
>  	source "package/memtool/Config.in"
>  	source "package/mhz/Config.in"
>  	source "package/minicom/Config.in"
> +	source "package/mlx5ctl/Config.in"
>  	source "package/msr-tools/Config.in"
>  	source "package/mxt-app/Config.in"
>  	source "package/nanocom/Config.in"
> diff --git a/package/mlx5ctl/Config.in b/package/mlx5ctl/Config.in
> new file mode 100644
> index 0000000000..0eaaf29653
> --- /dev/null
> +++ b/package/mlx5ctl/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_MLX5CTL
> +	bool "mlx5ctl"
> +	help
> +	  Provides a unified toolset for accessing, debugging, and
> +	  monitoring ConnectX MLX5 devices, utilizing secure interface
> +	  to simplify diagnostics in production systems with a secure
> +	  kernel lockdown enabled.
> +
> +	  https://github.com/saeedtx/mlx5ctl

Looking at the mlx5ctl README.md file:
https://github.com/saeedtx/mlx5ctl/blob/main/README.md#drivers-needed

mlx5ctl (user space) needs Kernel the drivers:
mlx5_core.ko (ConnectX device core driver)
mlx5ctl.ko (ConnectX debug uAPI driver)

I can find mlx5_core in the upstream Kernel (the one you
included in your nvidia_bf3_defconfig) in here:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/net/ethernet/mellanox/mlx5/core/Kconfig?h=v6.11.6#n6

I am not able to find the "mlx5ctl". Is there an out of source tree
driver somewhere? Quickly searching, I'm only able to find this 
proposal:
https://lore.kernel.org/all/ZcRgp76yWcDfEbMy@x130/T/
And a LWN article:
https://lwn.net/Articles/969383/

When proposing this user-space package, from which source are you
planning to use this Kernel mlx5ctl?

Before adding such a package, we should make sure there will
be an easy way in Buildroot to have all its dependencies.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
