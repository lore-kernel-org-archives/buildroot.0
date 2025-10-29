Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAE6CCF9EE
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 20:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B382F8329A;
	Wed, 29 Oct 2025 20:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5yGyUTxcmyJ; Wed, 29 Oct 2025 20:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4328832BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4328832BF;
	Wed, 29 Oct 2025 20:41:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EA282A3
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 20:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7000C610DC
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 20:41:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqT6Rwf2nQPF for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 20:41:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8AD31610DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AD31610DB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AD31610DB
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 20:41:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7284FB0051B;
 Wed, 29 Oct 2025 21:41:24 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Oct 2025 21:41:24 +0100
MIME-Version: 1.0
Date: Wed, 29 Oct 2025 21:41:24 +0100
To: Leo Yu-Chi Liang <ycliang@andestech.com>
Cc: buildroot@buildroot.org, tim609@andestech.com
In-Reply-To: <20251027033242.1797230-3-ycliang@andestech.com>
References: <20251027033242.1797230-1-ycliang@andestech.com>
 <20251027033242.1797230-3-ycliang@andestech.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <832fec4cb78947eff7aeea7b9682ee0b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761770486;
 bh=ASJxjH5OGX39DWCwDk/thKuk+1KfmGwhZQf68D1azmU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OOWwixgwVfos6pzsDlqC9UATqgmwITVC/hIfEf1gS9AFUEXGwZAYMrBj/ZfXMFd68
 DboD+N0is4DbFuXNOeMyBY2nxcsfxgfQU5wu5pPmJ0iTXO/OmZFhNC1o1Tc//i5owN
 W5mPxB5ANl+tSlpjlaUojB3vKQBsXUBkJWlOfZY109Jj7hPnmYWnS7ym1gE2HN/Nd7
 F42e/SHlB6Hv9sXYaL7X9l216dWWdpuZamPPa5kH8kEyP1WwJtR15Qw2Ow/v4DDy4v
 1s3v0xY+XuDGkMZfk+DOoFKrgdtwHviC/aE/aDcyu1I1jL07mOW2iig5hW16KCk6lW
 3XEAXobwSxYQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OOWwixgw
Subject: Re: [Buildroot] [PATCH 2/4] configs/andes_ae350_45_defconfig: Fix
 linux tarball source
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

Hi Leo,

Thanks for the patch.

On 27/10/2025 04:32, Leo Yu-Chi Liang via buildroot wrote:
> Use tag instead of branch to download the linux source,
> and add proper hash files.
> 
> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> ---
>  board/andes/ae350/patches/linux-headers/linux-headers.hash | 2 ++
>  board/andes/ae350/patches/linux/linux.hash                 | 2 ++
>  configs/andes_ae350_45_defconfig                           | 2 +-
>  3 files changed, 5 insertions(+), 1 deletion(-)
>  create mode 100644 
> board/andes/ae350/patches/linux-headers/linux-headers.hash
>  create mode 100644 board/andes/ae350/patches/linux/linux.hash
> 
> diff --git a/board/andes/ae350/patches/linux-headers/linux-headers.hash 
> b/board/andes/ae350/patches/linux-headers/linux-headers.hash
> new file mode 100644
> index 0000000000..1a6a136b71
> --- /dev/null
> +++ b/board/andes/ae350/patches/linux-headers/linux-headers.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  
> c71af3d2c86c0a0deca4f54b51d1c35217082b030052cc3513dc42e852652733  
> linux-v6.0.y-andes.tar.gz
> diff --git a/board/andes/ae350/patches/linux/linux.hash 
> b/board/andes/ae350/patches/linux/linux.hash
> new file mode 100644
> index 0000000000..1a6a136b71
> --- /dev/null
> +++ b/board/andes/ae350/patches/linux/linux.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  
> c71af3d2c86c0a0deca4f54b51d1c35217082b030052cc3513dc42e852652733  
> linux-v6.0.y-andes.tar.gz

If you add the hash files here, the defconfig should also select:
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
Without it, the hash files will be ignored.

Could you send an updated version adding it?

Also, could you consider, in a separate patch, updating this defconfig
to switch to external Bootlin stable toolchain, please?

See for example:
https://gitlab.com/buildroot.org/buildroot/-/commit/dd3ef914867dca5e429bb25ee14445fb0c87baa5

> diff --git a/configs/andes_ae350_45_defconfig 
> b/configs/andes_ae350_45_defconfig
> index 7b5a6f73c6..c02c4d7c61 100644
> --- a/configs/andes_ae350_45_defconfig
> +++ b/configs/andes_ae350_45_defconfig
> @@ -9,7 +9,7 @@ 
> BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/andes/ae350/genimage_sdcard.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call 
> github,andestech,linux,v6.0.y_ae350-ax45mp)/linux-v6.0.y_ae350-ax45mp.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call 
> github,andestech,linux,v6.0.y-andes)/linux-v6.0.y-andes.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="ae350_ax45mp"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="andes/ae350_ax45mp"
> --
> 2.34.1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
