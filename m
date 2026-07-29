Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A79C54F51
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 10:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4977560AFD;
	Wed, 29 Jul 2026 10:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oa9zE2zwClyt; Wed, 29 Jul 2026 10:06:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DD6C6077F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785319603;
	bh=1Lf/Sk5LA8NU+YH9e9K5senb4gWQGMqkDWZTJbnuzVA=;
	h=Date:From:To:cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SjbHX+h1/F38SKPY8d/Eo6oo8ZIQLvJYD84CTRWtwjJo1tI5fl3vNPuRn0v4uNiAi
	 O2rQCmtzDOKb/VX/cRN/BrKw86IiE3v+TbKiUkIeM28Ge1yvCl/2D0QI5z02ZufD6X
	 AuiRFpCchR6frG96lDbUdtxNR/jga2QUo+5wuSmrNtWK0lLUDAW8+HuddWvf4F6C6V
	 awRKiHxn6zf7nWXbYWZ5R9ovKpzRZaZfGU5RGKyRtn3ueM61fcW2y0pxWJMT7JdX6c
	 mR+L98LYPDILk2KOxeb1kNq6+/KmSuUP6Vi67Lwk2niXliv5Mqt4RMV+CJnAgwxWNq
	 uv1OQb899oe3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DD6C6077F;
	Wed, 29 Jul 2026 10:06:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C19F350
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 10:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E30F60ADD
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 10:06:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSwZH7BZMk8L for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 10:06:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.212.143.9;
 helo=cpanel10.indieserve.net; envelope-from=rpjday@crashcourse.ca;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 16E9E606A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16E9E606A0
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net
 [199.212.143.9])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16E9E606A0
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 10:06:39 +0000 (UTC)
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com
 ([174.114.114.5]:33302 helo=sheena)
 by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.99.4) (envelope-from <rpjday@crashcourse.ca>)
 id 1wp1BK-0000000Fb59-011e; Wed, 29 Jul 2026 06:06:37 -0400
Date: Wed, 29 Jul 2026 06:05:27 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Julien Olivain <ju.o@free.fr>
cc: buildroot@buildroot.org, Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20260726204437.3148734-1-ju.o@free.fr>
Message-ID: <6a9c4d00-ef01-72a1-5e11-24341ffd8b1f@crashcourse.ca>
References: <20260726204437.3148734-1-ju.o@free.fr>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
 Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4M9I5ariYKPbPRrMfw0z7dWtjpX4BY+3YL1qmeOvOGA=; b=Zv77jPgVH6G/vatp1cFXFu7PIg
 nmhTjy2NbyogZGJg3Rt5bBk5XLAeKvGlH0dEIX/Bk7e7T3UaiKw+0t9hVQa3c8W00L1gLf0zXz+HW
 7G6WqFHsye/7XFDzl59/gvhxNAUg08WwUs+3jD1lkhwM7RPiRjPrZSMiUMT3uOf9SyxzuEszhsdwM
 I7wStBq5EKuCm89tbhQiJ1ZdykxEYjveMVH3GRB19V1QnuKMD8/65dRnTI2XIjWpSp411iWawcxOj
 pQGyDQHxepSP/oO+GiLfjaO7SpKSij20hR0/1ZEueek56jp+utemA5sjOopTI+TrkcehmhQWB4bt2
 pcxYOh9w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=crashcourse.ca
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=crashcourse.ca header.i=@crashcourse.ca
 header.a=rsa-sha256 header.s=default header.b=Zv77jPgV
Subject: Re: [Buildroot] [PATCH 1/1] configs/freescale_imx93frdm: bump
 U-Boot, TF-A and Linux
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

On Sun, 26 Jul 2026, Julien Olivain wrote:

> Since Buildroot commit [1] "package/gcc: switch to GCC 15.x as the
> default", compiling freescale_imx93frdm_defconfig fails in TF-A with
> error:
>
>     include/drivers/nxp/trdc/imx_trdc.h:7: error: header guard 'IMX_TRDC_H' followed by '#define' of a different macro [-Werror=header-guard]
>         7 | #ifndef IMX_TRDC_H
>     include/drivers/nxp/trdc/imx_trdc.h:8: note: 'IMX_XRDC_H' is defined here; did you mean 'IMX_TRDC_H'?
>         8 | #define IMX_XRDC_H
>
> The issue happen because this defconfig is using a Buildroot
> (internal) toolchain which uses gcc version 15 by default.
>
> This issue was fixed upstream in [2], first included in TF-A v2.13.
>
> This commit updates U-Boot, TF-A and Linux to use the NXP
> tag lf-6.18.20-2.0.0, which include this fixes.
>
> Note that, as described in the commit log of [3] which introduced
> this defconfig, U-Boot and Linux were forks. Now the necessary
> patches are included in the vendor BSP, this commit switches those
> repos to use the vendor ones.
>
> While at it, this commit also switches the defconfig to use an
> external glibc stable Bootlin toolchain, to follow recommendations
> from [4]. Since an external toolchain is used, the linux-headers.hash
> custom hash file is no longer needed and is also removed. At the
> time of this commit, the Bootlin stable toolchain is a gcc 14.
>
> Also, due to the upstream uboot commit [5], this commit adds a uboot
> config fragment to disable CONFIG_EFI_CAPSULE_AUTHENTICATE, to
> remove the dependency on the command "cert-to-efi-sig-list", provided
> the host efitools package, which is not yet in Buildroot.
>
> This commit was run tested on board 700-94611 Rev B1.
>
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/a75b8623f5515d99bec48f96586115953150558e
> [2] https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/2e9198d0e0cbe9546348dd0a71ff6c3d2061d4eb%5E%21/
> [3] https://gitlab.com/buildroot.org/buildroot/-/commit/2e05f22ff862192a7e512d0db0486351bba94ae8
> [4] https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
> [5] https://git.u-boot-project.org/u-boot/u-boot/-/commit/fd58c275f6ba524101ba0990e53f5a11ac390bd0
>
> Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---

  ... snip patch ...

Is there an ETA on when this will be applied to master? Or am I
supposed to fetch it from some other staging-type branch?

rday
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
