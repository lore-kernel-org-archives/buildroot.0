Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C76CE77187
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 20:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D756685176;
	Wed, 18 Dec 2024 20:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcfHbbvSuq9l; Wed, 18 Dec 2024 20:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D162785173
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D162785173;
	Wed, 18 Dec 2024 20:36:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C286BE3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 20:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF189426CF
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 20:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDXXayAoXalW for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 20:36:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 90E3F426C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90E3F426C4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90E3F426C4
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 20:36:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 94D6713F8CF;
 Wed, 18 Dec 2024 21:36:24 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41434])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Dec 2024 21:36:24 +0100
MIME-Version: 1.0
Date: Wed, 18 Dec 2024 21:36:24 +0100
From: Julien Olivain <ju.o@free.fr>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241114112601.530656-1-raphael.pavlidis@gmail.com>
References: <20241114112601.530656-1-raphael.pavlidis@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <12af6dec432389cd0450754830d76fa4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734554185;
 bh=cnYOhsEvb5xS8JA6aejo32wnPvlXcnAJ0YcqKX9Cyy0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T93rZXib+Ql90846GagdOltk1HiDh/8pnhJt2XZt9b8NclmEr0IRPSq4kjIwKVSgi
 xL5n6w5WmGZ2mHrrL1ixRocMIdNJ0d/BZXFX7wN31GWJCddh+zghRs4eRUw1lGLTID
 7YAoRwNlYu3GoSBlRBysHauUxs1PLMAP3cj85VztAZFH7/aPnLHHPbpuCkW3cAmnUC
 g7bW0wV4n12RvtuNKn6h5oZUbGCbdpaoZHs21gZz5izjAmu/rQFewtpQdGKPL5fyd9
 TmxC9FoaUA6L6z9uqVY8CFg2A8S2rHASyNvTlfF98VwxhnyIv2pgxHVfcUhQpxWmjS
 ti0rrtT1Q1BdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=T93rZXib
Subject: Re: [Buildroot] [PATCH 1/1] package/nvidia-persistenced: bump to
 version 560.35.03
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

On 14/11/2024 12:26, Raphael Pavlidis wrote:
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Applied to master, thanks.

> ---
>  package/nvidia-persistenced/nvidia-persistenced.hash | 2 +-
>  package/nvidia-persistenced/nvidia-persistenced.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nvidia-persistenced/nvidia-persistenced.hash 
> b/package/nvidia-persistenced/nvidia-persistenced.hash
> index 06c71b35f5..dc918f1a95 100644
> --- a/package/nvidia-persistenced/nvidia-persistenced.hash
> +++ b/package/nvidia-persistenced/nvidia-persistenced.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  
> b84fb8eb86127a725d0134a2c64a64e7844e125dece137e7fe8adf8a33cbe817  
> nvidia-persistenced-515.48.07.tar.gz
> +sha256  
> e4b85c7ada85010212c45b84582f0af4aaed795335dcc7c0ceea9f274a8b7eb0  
> nvidia-persistenced-560.35.03.tar.gz
>  sha256  
> 279d814320adc07ca5a4ee101a0b428ddf22a6f3513b8c051f9eb7be47b2e797  
> COPYING
> diff --git a/package/nvidia-persistenced/nvidia-persistenced.mk 
> b/package/nvidia-persistenced/nvidia-persistenced.mk
> index 662d4d4349..225c26fd3b 100644
> --- a/package/nvidia-persistenced/nvidia-persistenced.mk
> +++ b/package/nvidia-persistenced/nvidia-persistenced.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -NVIDIA_PERSISTENCED_VERSION = 515.48.07
> +NVIDIA_PERSISTENCED_VERSION = 560.35.03
>  NVIDIA_PERSISTENCED_SITE = $(call 
> github,NVIDIA,nvidia-persistenced,$(NVIDIA_PERSISTENCED_VERSION))
>  NVIDIA_PERSISTENCED_LICENSE = MIT
>  NVIDIA_PERSISTENCED_LICENSE_FILES = COPYING
> --
> 2.47.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
