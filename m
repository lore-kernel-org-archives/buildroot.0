Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8661DC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C0094198B;
	Fri, 16 May 2025 10:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y807bElUXFg2; Fri, 16 May 2025 10:54:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EABF419A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EABF419A5;
	Fri, 16 May 2025 10:54:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D80513D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E7034187E
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZKxdpBz4JLl for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:54:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 899E04198D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 899E04198D
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 899E04198D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:54:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7D4731C0FC0; Fri, 16 May 2025 12:54:22 +0200 (CEST)
Message-ID: <c92a38fd-48d3-4328-a415-fb3a6e9defde@rnout.be>
Date: Fri, 16 May 2025 12:54:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>
References: <20250507045223.4747-1-kadambini.nema@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250507045223.4747-1-kadambini.nema@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392862; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=CHbZVjE9XTyMU+hTUylLYww1MnklWbWP0SpEKltu2q8=;
 b=ir/5GXkZ/RuyhfbOTnqw/hp3dYN3qFVKi9oIOXlU0HEuxtWo7rDU+7kaGhcpEn03Dga1od
 nkgGxDOG73C6a30bYLzewQ5Uhs2YoWDIdYMPIV/zXan5JlnHvGrjcvmq7h9K7kHaKpM3Jz
 JecxptdCXL5bUXfuvnfHLJUSvtbMYFMwqFsnR5qbXwXKRZZgB8M8qtychQ6kt4wx83PsmY
 zJKg/kZZvNjrg/eUvat53kXrk2GDFOjpKYjvd5zMaq5tEhbuwwKdcP6E8i1pafogXi6eKd
 usKF4qdnbGPcpDlxIjQF4TdgJ1dAEpbqYAlkCRTI0xTOBli+D56+20ahIUlW5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ir/5GXkZ
Subject: Re: [Buildroot] [PATCH 1/1] package/zic: bump version to 2025b
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/05/2025 06:52, Kadambini Nema wrote:
> Release notes:
> https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/6JVHNHLB6I2WAYTQ75L6KEPEQHFXAJK3/
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/zic/zic.hash | 4 ++--
>   package/zic/zic.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/zic/zic.hash b/package/zic/zic.hash
> index 9e89aad23a..b9daccb381 100644
> --- a/package/zic/zic.hash
> +++ b/package/zic/zic.hash
> @@ -1,4 +1,4 @@
> -# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/MWII7R3HMCEDNUCIYQKSSTYYR7UWK4OQ/
> -sha512  308f6a3d6ebfa18446f8296e5c799e18dccecd79ace3ba004d3f233892c7428faae152b217b22d229c59dd4e0faafee797d8b3583b58fa982b81f7cc7347f502  tzcode2025a.tar.gz
> +# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/6JVHNHLB6I2WAYTQ75L6KEPEQHFXAJK3/
> +sha512  19826b12968c10fc4db7e4b07ba782bfb8590eeebaec6f719d74b92a2e642ab817bd72bceff0015ce52a838edfdb00753b3cd87dd84b35abf2606e5bee445f76  tzcode2025b.tar.gz
>   # Locally computed:
>   sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
> diff --git a/package/zic/zic.mk b/package/zic/zic.mk
> index 71454d4fe0..1abeb2d70e 100644
> --- a/package/zic/zic.mk
> +++ b/package/zic/zic.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ZIC_VERSION = 2025a
> +ZIC_VERSION = 2025b
>   ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
>   ZIC_SITE = https://www.iana.org/time-zones/repository/releases
>   ZIC_STRIP_COMPONENTS = 0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
