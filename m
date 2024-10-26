Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B7BD10BF5
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38BF5406B0;
	Sat, 26 Oct 2024 11:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0jjtY-3H9CI; Sat, 26 Oct 2024 11:06:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35E61406D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35E61406D2;
	Sat, 26 Oct 2024 11:06:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4CD15C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C45E54019A
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnvCkekM4UQP for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:05:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C16C4018E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C16C4018E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C16C4018E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:05:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id DECEFB0054E;
 Sat, 26 Oct 2024 13:05:53 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50972])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 26 Oct 2024 13:05:53 +0200
MIME-Version: 1.0
Date: Sat, 26 Oct 2024 13:05:53 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20240822115152.2120669-1-thomas.petazzoni@bootlin.com>
References: <20240822115152.2120669-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <2239cfb1c9c3260b2ad453e2018978e2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729940755;
 bh=63JunAasFdv5+Zr8yCOUn25e/BL7v8x3X8ezV3tMwiI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=URM0wWzNREH8jZT2aiDI95G+BtJonCUq6c+MdHrCeiZSoWIQHcmXnvGQ6wilaBY95
 Yr6gqJH6hsKbjZIwL9k/wxS5MGO3I95YmKZPcXjwJYNfBj/r4IL0vm5Jrz1ZFEruk0
 ACFkfYrqpFsfm8oGZ73em9oZhoX6cwwlqv8XRViT+TVd7+Qp3zhy1c3nyT1V7Al22X
 JJkQuDZOoeZC03v3NOhvZK7OdUA4XApaTN5yYkP/fCqchDe/HszOb5ld/kI4YLjJxL
 ikvU2ntOGhHAYGK+zHsHtGNyt6byZenRBI48uKSfVHOCCvH5ldGCGh3T1B38vlfzKs
 s8vEddAicJUVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=URM0wWzN
Subject: Re: [Buildroot] [PATCH] package/double-conversion: bump to 3.3.0
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

On 22/08/2024 13:51, Thomas Petazzoni via buildroot wrote:
> Changes between 3.2.1 and 3.3.0:
> 
> - Fix some compile warnings in Visual Studio by @Ono-Sendai in #188
> 
> - Set permissions for github workflows by @joycebrum in #191
> 
> - Add flags to control trailing decimal and zero in exponent form when
>   input has one significant digit by @ianmcook in #195
> 
> See https://github.com/google/double-conversion/releases/tag/v3.3.0
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Julien.

> ---
>  package/double-conversion/double-conversion.hash | 2 +-
>  package/double-conversion/double-conversion.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/double-conversion/double-conversion.hash 
> b/package/double-conversion/double-conversion.hash
> index a2ecd4422c..e3a5754933 100644
> --- a/package/double-conversion/double-conversion.hash
> +++ b/package/double-conversion/double-conversion.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  
> e40d236343cad807e83d192265f139481c51fc83a1c49e406ac6ce0a0ba7cd35  
> double-conversion-3.2.1.tar.gz
> +sha256  
> 04ec44461850abbf33824da84978043b22554896b552c5fd11a9c5ae4b4d296e  
> double-conversion-3.3.0.tar.gz
>  sha256  
> 4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  
> COPYING
> diff --git a/package/double-conversion/double-conversion.mk 
> b/package/double-conversion/double-conversion.mk
> index af1fbab078..74e90d30d7 100644
> --- a/package/double-conversion/double-conversion.mk
> +++ b/package/double-conversion/double-conversion.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -DOUBLE_CONVERSION_VERSION = 3.2.1
> +DOUBLE_CONVERSION_VERSION = 3.3.0
>  DOUBLE_CONVERSION_SITE = $(call 
> github,google,double-conversion,v$(DOUBLE_CONVERSION_VERSION))
>  DOUBLE_CONVERSION_LICENSE = BSD-3-Clause
>  DOUBLE_CONVERSION_LICENSE_FILES = COPYING
> --
> 2.46.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
