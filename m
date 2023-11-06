Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4908C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 02:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78A8B6108D;
	Mon,  6 Nov 2023 02:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78A8B6108D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NkgPZE9iail; Mon,  6 Nov 2023 02:17:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B784461089;
	Mon,  6 Nov 2023 02:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B784461089
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6861F1BF5DF
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 02:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BF13605A5
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 02:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BF13605A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8G3TCoCypdj0 for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 02:17:46 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E975061089
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 02:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E975061089
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 521F5B80B54;
 Mon,  6 Nov 2023 02:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31B8C433C8;
 Mon,  6 Nov 2023 02:17:41 +0000 (UTC)
Message-ID: <5761b87d-4843-4669-bc65-f6e1351e12b7@kernel.org>
Date: Mon, 6 Nov 2023 11:17:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231030002748.280144-1-dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20231030002748.280144-1-dlemoal@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1699237062;
 bh=DKPLzozt66uCDy75pBljHpTx2HtoK15ouK1Cow9Gnbs=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=K12fIF1qDYOEPiTWdMf5Nsg0VvITY9PnYr8goadG64iICsOJESZ3yRQyOb+1Y6q+H
 iBghtHv6ii1WxkcrK/FqoTEORiTjooZJm8n4D9f4yWAljE0DLvAmzhWoKUMgrUPl/w
 Oy0klV5n9uK2khvRHs5dAu+l3pDIvXuQd7AZovxD9zLbx+St3xOnI/af1g/r5gtVtb
 YeO0NUqjcHgMFGhgZujI51AWGj0ywFm0tMgEvVnKl2IGMrEUecfUoKAizMzYJRWw27
 wLjbU13ec8ZUfeKXQCq6bOjXeLCYERwlvEq17J3lEN+WwAJtjlN8NITrXKV6rC6jbA
 fV8LHC2ReMSJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=K12fIF1q
Subject: Re: [Buildroot] [PATCH] package/gcc: Fix gcc finale library
 installation
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/30/23 09:27, Damien Le Moal wrote:
> When BR2_TOOLCHAIN_HAS_LIBATOMIC is "n", there is no gcc libatomic.so
> library to install. For configurations with such settings, compilation
> fails as gcc-final.mk unconditionally adds libatomic as an installation
> target. This error, for instance, shows for all Canaan K210 riscv
> configs, as they all use uclibc flat binary format which disabled
> libatomic:
> 
> Fix this by modifying package/gcc/gcc-final/gcc-final.mk to add
> libatomic to GCC_FINAL_LIBS only for configurations that have
> BR2_TOOLCHAIN_HAS_LIBATOMIC set to "y".
> 
> Signed-off-by: Damien Le Moal <dlemoal@kernel.org>

Ping ?

I received a build failure report (again) for the RISC-V Canaan & Sipeed boards
configs. This patch fixes these build failures.

> ---
>  package/gcc/gcc-final/gcc-final.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index edb9b2f73a..99d7047b5f 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -144,7 +144,11 @@ HOST_GCC_FINAL_POST_INSTALL_HOOKS += TOOLCHAIN_WRAPPER_INSTALL
>  # -cc symlink to the wrapper is not created.
>  HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
>  
> -GCC_FINAL_LIBS = libatomic
> +GCC_FINAL_LIBS =
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +GCC_FINAL_LIBS += libatomic
> +endif
>  
>  ifeq ($(BR2_STATIC_LIBS),)
>  GCC_FINAL_LIBS += libgcc_s

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
