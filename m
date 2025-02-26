Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E944C021A4
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 05:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2F3880CB5;
	Wed, 26 Feb 2025 05:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4KRW2hHM5fp; Wed, 26 Feb 2025 05:26:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A47ED80CAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A47ED80CAA;
	Wed, 26 Feb 2025 05:26:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C9881ED4
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 05:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2976F4023C
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 05:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GyTlhyUfRjnx for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 05:26:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 64ABD4022F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64ABD4022F
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64ABD4022F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 05:26:38 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id 9A40B440B08;
 Wed, 26 Feb 2025 07:20:56 +0200 (IST)
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250225174304.1810-1-kuzminov.sergey81@gmail.com> (Sergey
 Kuzminov's message of "Tue, 25 Feb 2025 20:43:04 +0300")
References: <20250225174304.1810-1-kuzminov.sergey81@gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 26 Feb 2025 07:26:32 +0200
Message-ID: <87zfi9e0on.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1740547256;
 bh=349yO2N2txuA3tw2gn6gFKOXGgxDppKxi9NgS8gDV/Q=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FA+T437Htw6UUYIaQMkIcoKtZaMfS2o6+4BSACRFsNWxSFMsIIarIIqE0RWZWH1fw
 xQgwc7Lysf6I8AD0SUIbHXkGRtXEPRoXvK98UBUyp/LogwOR7VWUEOABC7xSlSpoCo
 NXH/NkqH596BKBVIJ8jAUXIc0I+huqLGNRBrKBmQFAo4ER33Cr4TDr/Z76+Qx2DJKf
 TluHgQtihSNpaSnq8dc7XGRh6iADlzXhcPLemmxHlB45pWTMTSd7UpTVHmKxXli68Q
 J9Fysh6QXr0bZEeewc/H+OQ1SKVmZPfIhGmwYPnT8KuBNs7scLGorZ8UqXOnisaDl3
 FPWVvXWDfZbUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=FA+T437H
Subject: Re: [Buildroot] [PATCH] board/friendlyarm/nanopi-r3s:
 rk3566-nanopi-r3s.dts: enable hw random
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey,

On Tue, Feb 25 2025, Sergey Kuzminov wrote:
> This patch enables the hardware random number generator in the device tree.
> Without it, the entropy level in the Linux kernel increases very slowly.
> To check the entropy level: cat /proc/sys/kernel/random/entropy_avail
>
> Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
> ---
>  ...001-rk3566-nanopi-r3s.dts-enable-rng.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 board/friendlyarm/nanopi-r3s/patches/linux/0001-rk3566-nanopi-r3s.dts-enable-rng.patch
>
> diff --git
> a/board/friendlyarm/nanopi-r3s/patches/linux/0001-rk3566-nanopi-r3s.dts-enable-rng.patch
> b/board/friendlyarm/nanopi-r3s/patches/linux/0001-rk3566-nanopi-r3s.dts-enable-rng.patch
> new file mode 100644
> index 0000000000..b376004377
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-r3s/patches/linux/0001-rk3566-nanopi-r3s.dts-enable-rng.patch
> @@ -0,0 +1,30 @@
> +From 284e6683b4a0ee6b1fd22ccd34785e1f2d58c115 Mon Sep 17 00:00:00 2001
> +From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
> +Date: Tue, 25 Feb 2025 19:49:00 +0300
> +Subject: [PATCH] rk3566-nanopi-r3s.dts: enable rng
> +
> +This patch enables the hardware random number generator in the device tree.
> +Without it, the entropy level in the Linux kernel increases very slowly.
> +To check the entropy level: cat /proc/sys/kernel/random/entropy_avail
> +
> +Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
> +Upstream: Not applicable, Buildroot specific.

What makes this patch Buildroot specific?

baruch

> +---
> + arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts b/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts
> +index fb1f65c86883..a89bdbf71e12 100644
> +--- a/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts
> ++++ b/arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dts
> +@@ -552,3 +552,7 @@ &vop {
> + &vop_mmu {
> + 	status = "okay";
> + };
> ++
> ++&rng {
> ++	status = "okay";
> ++};
> +-- 
> +2.45.3
> +

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
