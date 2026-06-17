Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379C3CD98F0
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 12:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D24D9438B8;
	Wed, 17 Jun 2026 12:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U4IHHf9Dp6P0; Wed, 17 Jun 2026 12:46:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E274E42F3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781700375;
	bh=t3KnIXVZqVPfCkJsqgV/xSg6BIW+0l8CJkKel0ckOzo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qnxJLeqJGnrXHltD/7vxlK1Gx8KD4IWgkTCP54psQ7JOfXLKXYBTJh74Krdg03TjZ
	 6qzFLb941H6D93ocpdzYIdIGoMYvYRwCwCqPGNjTRO3DoXeVYAt+GrnNKmcbjFBYTd
	 NxmiYIfFGLjS0Sds7cIqX9dpUQuRARAa098fgCyHzF/MTjiAdBgPPYMAMl+yc1Ju0B
	 rWzJF3IRsx+nt5m3kFtYnWGi9ICObP6eLhGBJGpL5BLkNYfH8/MtIDbHOsiq0tVe/G
	 AmCk3ftx1CNqN6Wrqplb8Ze7Au2NSmxMPk3B2v13cwKDB8ERLOxr3DQqUc/wuFbDK+
	 l1eshd9dsd3aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E274E42F3F;
	Wed, 17 Jun 2026 12:46:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 43031D8
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30C0E42F3F
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:46:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqn0K_Ze0_1V for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 12:46:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 443F442F3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 443F442F3D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 443F442F3D
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:46:13 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A24222C80C5F;
 Wed, 17 Jun 2026 14:46:10 +0200 (CEST)
Message-ID: <d782d17c-3e56-4ddf-8c10-92ae7dd01334@bubu1.eu>
Date: Wed, 17 Jun 2026 14:46:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: David Timber <dxdt@dev.snart.me>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20260616154947.315883-1-dxdt@dev.snart.me>
Content-Language: en-US
In-Reply-To: <20260616154947.315883-1-dxdt@dev.snart.me>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1781700370; bh=LF9qV1DnD9Z+E7CdFxmdl/m+M+VSNCgQO0iv5dtfBOE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Ukjk179NRyu89m1Q+AfVHYh5+twxbR7jkgPTFkvsQR02hSQ09pvsERxuZj9m2ofMl
 GVFDinzNWRzQ53ht779lsqmz3u3x6e6et3vDtuHfKzZYK/KXDRWkqd5LdNVGZx9thX
 ZqOVQh6Qle9jQseQSFrJGMYzi38wzmL/1GqD7njrQCqODxlEurzFE8EUhQ3MzkFGPo
 +o5sH2vd/0nT6tXHeO07zOJLSsfUB3bzEWKxVFXpuGBb5uKgxY+C3qNvLxU1eR9Y3G
 NqmkAVsHZTOasdm8NJMNjoMDKiWpY4rPCFlipRhBWLyqQf4qYeWKPeA3pwuyHCbE2k
 m1bztXTeQJvdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=Ukjk179N
Subject: Re: [Buildroot] [PATCH] package/exfatprogs: bump to version 1.4.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi David,
thanks for your submission, I have a few comments, see below.

On 6/16/26 17:49, David Timber via buildroot wrote:
> Signed-off-by: David Timber <dxdt@dev.snart.me>

It would be nice to have a bit more details in your commit log. I.e. 
adding links to the changelog, what changed with the version bump you 
are submitting. And then also an explanation for the non strictly 
mechanical version bump changes you are adding.> ---
>   package/exfatprogs/Config.in       | 4 ++++
>   package/exfatprogs/exfatprogs.hash | 4 ++--
>   package/exfatprogs/exfatprogs.mk   | 2 +-
>   3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/package/exfatprogs/Config.in b/package/exfatprogs/Config.in
> index 4f50427a68..07b5f7ed26 100644
> --- a/package/exfatprogs/Config.in
> +++ b/package/exfatprogs/Config.in
> @@ -1,6 +1,10 @@
>   config BR2_PACKAGE_EXFATPROGS
>   	bool "exfatprogs"
>   	depends on BR2_USE_WCHAR
> +	depends on BR2_USE_MMU # util-linux/libblkid
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> +	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC

We need an explanation for why you are selecting these now, what changed 
in exfatprogs that this is required now? I couldn't find anything when 
chekcing the changelog.

Note also that just selecting util-linux in Config.in is strange in 
itself as that ensures it is available at runtime, but something like 
libblkid is usually a compile time dependency? Compile time dependencies 
need to be added into the .mk file into the _DEPENDENCIES variable.

So I don't really understand what's going on here yet.

Same question for musl-fts. Why is it necessary? Is it required at 
compile time?

>   	help
>   	  exFAT filesystem userspace utilities.
>   
> diff --git a/package/exfatprogs/exfatprogs.hash b/package/exfatprogs/exfatprogs.hash
> index e73d9d884b..56515cd8f7 100644
> --- a/package/exfatprogs/exfatprogs.hash
> +++ b/package/exfatprogs/exfatprogs.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/exfatprogs/exfatprogs/releases/download/1.2.9/exfatprogs-1.2.9.tar.xz.sha256
> -sha256  d9a42197c6ff9e6a8e923789413008e317415cf7a4ab85c486c5ffcaf49ca175  exfatprogs-1.2.9.tar.xz
> +# From https://github.com/exfatprogs/exfatprogs/releases/download/1.4.2/exfatprogs-1.4.2.tar.xz

Please keep the .sh256 suffix. This line indicates that you got the 
sha256sum hash from 
https://github.com/exfatprogs/exfatprogs/releases/download/1.4.2/exfatprogs-1.4.2.tar.xz.sha256 
(which matches the one you added below.

> +sha256  47c7c8ddeccbf50d39b903353f2cb3df79134367a4fd764fe2ce3755ff5877bf  exfatprogs-1.4.2.tar.xz
>   
>   # Hash for license file
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
> index 638cb9caa4..8bb6bfac00 100644
> --- a/package/exfatprogs/exfatprogs.mk
> +++ b/package/exfatprogs/exfatprogs.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -EXFATPROGS_VERSION = 1.2.9
> +EXFATPROGS_VERSION = 1.4.2
>   EXFATPROGS_SOURCE = exfatprogs-$(EXFATPROGS_VERSION).tar.xz
>   EXFATPROGS_SITE = https://github.com/exfatprogs/exfatprogs/releases/download/$(EXFATPROGS_VERSION)
>   EXFATPROGS_LICENSE = GPL-2.0+

I've marked this as changes requested in patchwork.
Could you submit a new iteration which addresses these comments?

Thanks!
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
