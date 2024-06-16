Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A480C27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 13:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F3D24066F;
	Sun, 16 Jun 2024 13:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZ7gu9WiYMSt; Sun, 16 Jun 2024 13:21:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3E3940672
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3E3940672;
	Sun, 16 Jun 2024 13:21:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD78E1BF2C4
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 13:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA36140672
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 13:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cHRtWvZ4ZbML for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 13:21:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CBA14066F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CBA14066F
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CBA14066F
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 13:21:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0D761CE0CF3;
 Sun, 16 Jun 2024 13:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58EA7C2BBFC;
 Sun, 16 Jun 2024 13:21:39 +0000 (UTC)
Mime-Version: 1.0
Date: Sun, 16 Jun 2024 16:21:37 +0300
Message-Id: <D21H1FD0XV4Z.1JTVGYFS925VN@kernel.org>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Bernd Kuhls" <bernd@kuhls.net>, <buildroot@buildroot.org>
X-Mailer: aerc 0.17.0
References: <20240615113049.456274-1-bernd@kuhls.net>
 <20240615113049.456274-3-bernd@kuhls.net>
In-Reply-To: <20240615113049.456274-3-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1718544100;
 bh=QClp6+jlezsrkaL/TArEssuqMOWJv99sRkXAFhaNu0c=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=okwM2bMw359fSM9guw4JtmAyRRLbvhwudgf6W9qEgn0/CYCyAh6nMR8VUxTuAvoyG
 yfaL4v0F0j6G/0TvANStzu184u6DbYubCnRtC3ppW3hYwrq5ENhVKsZoLqV4YFwsbC
 vMYOBCZjRSuszH+TRsWdrUhidoc+/mJeyKr67ie255tj2e4SwTJfGpvhpaQmJ/Ebas
 FotYJ0SDWyBmBvHkwS0uC7zCdV58YaIzXsHj5q2DhFkMQbw2uLH7HQndPLkExk1RUI
 BtvMiB0gnJu47eMoRo6G7Dir+P95Spnr4X8m5LrMcl2uWyHoHpxUxc4GBVP/DKTbN/
 C1Ehuv0Ap/eTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=okwM2bMw
Subject: Re: [Buildroot] [PATCH 3/4] linux: bump latest version to 6.9
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat Jun 15, 2024 at 2:30 PM EEST, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  linux/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/linux/Config.in b/linux/Config.in
> index 194a24f391..865b7fd240 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -28,8 +28,8 @@ choice
>  	prompt "Kernel version"
>  
>  config BR2_LINUX_KERNEL_LATEST_VERSION
> -	bool "Latest version (6.8)"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_8 if BR2_KERNEL_HEADERS_AS_KERNEL
> +	bool "Latest version (6.9)"
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_9 if BR2_KERNEL_HEADERS_AS_KERNEL
>  
>  config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	bool "Latest CIP SLTS version (5.10.162-cip24)"
> @@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>  
>  config BR2_LINUX_KERNEL_VERSION
>  	string
> -	default "6.8.12" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "6.9.4" if BR2_LINUX_KERNEL_LATEST_VERSION
>  	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>  	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>  	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \

I don't that will result successful compilation when using systemd,
so I guess this has been only tested with busybox, right?

I had to do this fix in order to make systemd work with v6.9:

https://lists.buildroot.org/pipermail/buildroot/2024-June/755222.html

So I see two issues in total in this patch:

1. It maintains the same build issue as with 6.8.12.
2. Bugs should be a priority over features, right?

Maybe this should combined to a patch set with my patch as first
so that the version update could be landed cleanly?

BR, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
