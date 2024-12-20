Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23ADDE7718B
	for <buildroot@archiver.kernel.org>; Fri, 20 Dec 2024 20:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB58B419BF;
	Fri, 20 Dec 2024 20:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0dmgZXCMosW; Fri, 20 Dec 2024 20:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2623419B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2623419B9;
	Fri, 20 Dec 2024 20:15:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F907730
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 20:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E378983C2E
 for <buildroot@buildroot.org>; Fri, 20 Dec 2024 20:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EvTEsccoLA4z for <buildroot@buildroot.org>;
 Fri, 20 Dec 2024 20:15:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC0CB83C2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC0CB83C2F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC0CB83C2F
 for <buildroot@busybox.net>; Fri, 20 Dec 2024 20:15:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 62D0819F732;
 Fri, 20 Dec 2024 21:15:09 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43130])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 20 Dec 2024 21:15:09 +0100
MIME-Version: 1.0
Date: Fri, 20 Dec 2024 21:15:09 +0100
From: Julien Olivain <ju.o@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20241220185820.1252854-1-francois.perrad@gadz.org>
References: <20241220185820.1252854-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.9
Message-ID: <b3494cb17474333e6572b21cee342726@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734725710;
 bh=vnvjWI17LRG1CWOZemB0to+e9xYRHAq6bykJykovGxM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rG5s9thI7qQbzSFpv56aM43tNpQnlOK4n9NPvJuaFGUNE0G2JB91BCHjB+KWOAWfS
 qhy1Oojyqq6jzsmXC2AXwbKIv1jbv125A4iEeied4OCdodwMgCtp8FkZpC4XKWTbVV
 zrGbtUYouGZ+W9LrQgEsxeBgvgBgCAX6z86R3K6j/BzvmQBMjgfC/qzMGmixPHRpM2
 nxITE4vAytBRz8/JTnBalNXYd6W+Uk5zRpu4SO0ij2mrpkbUnNRgF/R9NN9Fb8PsgM
 /dsFm1VbpxMoY+P/1N/UUlpuTUDCyJ0lFzGY5yGMlQCVTFoxoaF4fN4wpadQHKEbXy
 9vOaFLGfC9zNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rG5s9thI
Subject: Re: [Buildroot] [PATCH] package/libgpg-error: bump to version 1.51
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

On 20/12/2024 19:58, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.

> ---
>  package/libgpg-error/libgpg-error.hash | 4 ++--
>  package/libgpg-error/libgpg-error.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libgpg-error/libgpg-error.hash 
> b/package/libgpg-error/libgpg-error.hash
> index be5202584..957f96edc 100644
> --- a/package/libgpg-error/libgpg-error.hash
> +++ b/package/libgpg-error/libgpg-error.hash
> @@ -1,6 +1,6 @@
>  # From https://www.gnupg.org/download/integrity_check.html
> -sha1  6790fc3d6e7bbd7576654b43971bbe15e953ccc4  
> libgpg-error-1.50.tar.bz2
> -sha256  
> 69405349e0a633e444a28c5b35ce8f14484684518a508dc48a089992fe93e20a  
> libgpg-error-1.50.tar.bz2
> +sha1  0a9386ff70a5d1f771771bf0b8db2b956e292f13  
> libgpg-error-1.51.tar.bz2
> +sha256  
> be0f1b2db6b93eed55369cdf79f19f72750c8c7c39fc20b577e724545427e6b2  
> libgpg-error-1.51.tar.bz2
> 
>  # Locally calculated
>  sha256  
> 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  
> COPYING
> diff --git a/package/libgpg-error/libgpg-error.mk 
> b/package/libgpg-error/libgpg-error.mk
> index 8dff6a612..3f327e305 100644
> --- a/package/libgpg-error/libgpg-error.mk
> +++ b/package/libgpg-error/libgpg-error.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBGPG_ERROR_VERSION = 1.50
> +LIBGPG_ERROR_VERSION = 1.51
>  LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
>  LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
>  LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
> --
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
