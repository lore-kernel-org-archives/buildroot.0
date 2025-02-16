Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075E5C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 18:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AACC280BC5;
	Sun, 16 Feb 2025 18:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NvJcvmQu-Lmz; Sun, 16 Feb 2025 18:14:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A995180BC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A995180BC9;
	Sun, 16 Feb 2025 18:14:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DCC1C8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 18:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87C1980BC9
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 18:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oe9s3uqHL1DP for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 18:14:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4F40280BC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F40280BC5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4F40280BC5
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 18:14:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1941C13F8E1;
 Sun, 16 Feb 2025 19:14:05 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 19:14:05 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 19:14:05 +0100
From: Julien Olivain <ju.o@free.fr>
To: Gilles Talis <gilles.talis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250216153853.2706304-1-gilles.talis@gmail.com>
References: <20250216153853.2706304-1-gilles.talis@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <127ace9e1e61db91550aae3a36283b59@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739729646;
 bh=+qi7lqNJu0V3q7C1cOszyhwvPUFdnqlMPEku/K3zzl4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H4OTm3Pu5V0iV5ugngRjANgtofPgezt/k9GBE2i5sTRf8TV0PYIdeaPM475oU9gZi
 IzdbUOjx/6pSO/JMhgSJKa0SGtq7BXwbCwGpqO7SkrYCc1nlR9WAEXkOC9RpZe8vpe
 qN/24c5LL7WZ68/seEPvtRAh8lYGV07oIMHaZ+SRUSzP58EurAymmf39b5/qbYa9RU
 7aFV/Qawd2icjWEP2zTlC5OGJSmMPaWdeXwzOGWkEwk1FLQb4FgfsDqp6GI1XFMGFs
 dSLC77RsYlL7tnRiZcv+wF3/KR6w324RHga6j4ASRl6u02dNc8mUh5hzjcA0n66Xvg
 Y5/Cjw8ZqcESA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H4OTm3Pu
Subject: Re: [Buildroot] [PATCH] configs/polyhex_debix_model_a_defconfig:
 new defconfig
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

Hi Gilles,

Thanks for the patch!

On 16/02/2025 16:38, Gilles Talis wrote:
> This configuration builds an image for the Polyhex Debix Model A SBC
> 
> DEBIX Model A is an industrial grade single board computer
> powered by NXP i.MX 8M Plus applications processor
> 
> https://www.debix.io/hardware/model-a.html
> 
> - Linux Kernel: Upstream version 6.12.13
> - U-boot: Upstream version 2024.10
> - ATF: Upstream version 2.12
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

It generates few errors when running the command:
"utils/docker-run make check-package":

     board/polyhex/debix-model-a/post-build.sh:0: run 'shellcheck' and 
fix the warnings
     configs/polyhex_debix_model_a_defconfig:0: missing 
BR2_DOWNLOAD_FORCE_CHECK_HASHES

Could you fix post-build.sh shellcheck warnings please?

Also, in Buildroot, we are now introducing new defconfigs with
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y to check all hashes.

See:
https://buildroot.org/downloads/manual/manual.html#_adding_project_specific_patches_and_hashes

See also an example commit just enabling hashes:
https://gitlab.com/buildroot.org/buildroot/-/commit/4ca8f0ea762061ad04016d065f37e0c351d578f1

Could you add those custom hashes please?

[...]

> diff --git a/board/polyhex/debix-model-a/extlinux.conf 
> b/board/polyhex/debix-model-a/extlinux.conf
> new file mode 100644
> index 0000000000..ed6b881772
> --- /dev/null
> +++ b/board/polyhex/debix-model-a/extlinux.conf
> @@ -0,0 +1,4 @@
> +label buildroot
> +  kernel /boot/Image
> +  devicetree /boot/freescale/imx8mp-debix-model-a.dtb
> +  append root=PARTUUID=%PARTUUID% rootwait rw

Since the files
board/polyhex/debix-model-a/genimage.cfg
and
board/polyhex/debix-model-a/extlinux.conf
are in fact templates that you modify with sed in
board/polyhex/debix-model-a/post-build.sh, could rename those to
board/polyhex/debix-model-a/genimage.cfg.in
and
board/polyhex/debix-model-a/extlinux.conf.in
please?
This will reduce chances of mistakes (e.g. using the files
without processing them).

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
