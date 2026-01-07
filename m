Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C8BD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82E5340CB2;
	Wed,  7 Jan 2026 17:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFOBnjK90i2Z; Wed,  7 Jan 2026 17:49:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 036DD40A94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808133;
	bh=qPstbjSIjdNn73tioKE5+wc7Up8vqR5/NTtCxEP0PQA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D6iY8xOdSoWy0y7gb3U9oFttOrecDOSuLgP1nJigNPiVoVXRnLKT5Kt8mP88GAfqr
	 aWzPNCy1CtTVnx/D66c/70DTYsuISsVFKLJXlM6or2lymNYNY1OmrUaV/2vtYen/QH
	 JborqlfSgujuPvWVvUpH285CLrmXrb9Pai7phl949BOgZZ/A7eIoVnqfSOdbPM7vEN
	 I60QilZB1GSbzHMNByuZSaj+o2dJtp9z0gQjQSZGcdhMQHaaiUjxUNBg3rdm/vX/rX
	 MWSg8GoBTQxIhGVeyZ0vqtRCWwbQ3txbQhSjGk/iOr2LiLU0mzkqWP9lKBfI7OFk7p
	 V42FDaJ3tPoaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 036DD40A94;
	Wed,  7 Jan 2026 17:48:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D14F325B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B60CA8221E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bkqt2GrSVlbb for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:48:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B51F82234
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B51F82234
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B51F82234
 for <buildroot@busybox.net>; Wed,  7 Jan 2026 17:48:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AAB3BB97A70F; Wed,  7 Jan 2026 18:48:14 +0100 (CET)
To: Francois Perrad <francois.perrad@gadz.org>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@busybox.net
Date: Wed,  7 Jan 2026 18:48:04 +0100
Message-ID: <20260107174804.224179-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250915082335.757689-1-francois.perrad@gadz.org>
References: <20250915082335.757689-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808095; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=UB3mmHsrROXwu9C6agXWAF1LLmcyMnp9+g7Q18Mjrn8=;
 b=JEP9DPYIiSvyUbawCPn0U5ggoY3GHrhpJL0E4V4zxlDQ/mo4KL7UO3sm4eaWOSmvyXwjAZ
 4sHT0494n6OH4mRBHgMvUPUY0pQKUxL9xESCaJQCiC6CAiZXKvDSZJCdhvifz7jC5Drr7i
 qw6RdM8q8bPFQtTeGp3so0oagm/3mf9ypzLCJUeDLZ0uELhB1u3ABe+Xy8x2W3Ke9kTyxM
 ppkKpQF7bJGqYsljNEbIHOZePevoz2PtL6vztaFCn6Wl6+sDE3FczdUpzIolavJOboxnKe
 u4e4qBMve96MaBScJLA5L2QikabKqmUO7dGenyV4JYc7WBAZKA2iU0QhpMadEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=JEP9DPYI
Subject: Re: [Buildroot] [PATCH 1/2] package/collectl: switch to GitHub
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> development no longer on https://sourceforge.net/projects/collectl/
> but documentation still on https://collectl.sourceforge.net/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/collectl/Config.in     | 2 +-
>  package/collectl/collectl.hash | 2 +-
>  package/collectl/collectl.mk   | 3 +--
>  3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/collectl/Config.in b/package/collectl/Config.in
> index 28379abe2..7a62c935e 100644
> --- a/package/collectl/Config.in
> +++ b/package/collectl/Config.in
> @@ -9,4 +9,4 @@ config BR2_PACKAGE_COLLECTL
>  	  disk, inodes, infiniband, lustre, memory, network, nfs,
>  	  processes, quadrics, slabs, sockets and tcp.
>  
> -	  http://collectl.sourceforge.net/
> +	  https://collectl.sourceforge.net/
> diff --git a/package/collectl/collectl.hash b/package/collectl/collectl.hash
> index 1785d25d8..6714e2afc 100644
> --- a/package/collectl/collectl.hash
> +++ b/package/collectl/collectl.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  9fab4769441c07201748e52c7f8c7b21526ab45a05142dd2b2b1fa5c16c38750  collectl-4.3.2.src.tar.gz
> +sha256  552bdbe9e97071767bf0871789e19ede7d2827b68824e75da9cd7664218ea440  collectl-4.3.2.tar.gz
>  sha256  b92800d37afa2aa03c02817ff3b68efc7236436fe76af06ad9b1fc4682f59bcb  ARTISTIC
>  sha256  264fe27852db5624e6a9a9845b4e14e91ee5007305b33e5556dfade394d578a8  COPYING
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  GPL
> diff --git a/package/collectl/collectl.mk b/package/collectl/collectl.mk
> index c6cb2e149..358f8e3cb 100644
> --- a/package/collectl/collectl.mk
> +++ b/package/collectl/collectl.mk
> @@ -5,8 +5,7 @@
>  ################################################################################
>  
>  COLLECTL_VERSION = 4.3.2
> -COLLECTL_SOURCE = collectl-$(COLLECTL_VERSION).src.tar.gz
> -COLLECTL_SITE = http://downloads.sourceforge.net/collectl/collectl
> +COLLECTL_SITE = $(call github,sharkcz,collectl,$(COLLECTL_VERSION))
>  COLLECTL_LICENSE = Artistic or GPL-2.0
>  COLLECTL_LICENSE_FILES = COPYING ARTISTIC GPL
>  
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
