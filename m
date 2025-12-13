Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A00D5B15F
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 19:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3467240980;
	Sat, 13 Dec 2025 19:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aXzOSIRteH3X; Sat, 13 Dec 2025 19:57:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF0C34095E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765655822;
	bh=fL0qpVVtImDRGyRIuFgqVdVcp5crmI4EgJSLNh9sC/A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I50j3RZaB4dECn7xX6qdf6M/xKvGKGwtrH8cDiQ3pyr29/H7/OGRR2lymw4dC0Bsn
	 TvUrcRd0XMvWSx50m7xDugSXzjrRgmH1NpOxTPyPdDCjUTlBMAzh6vwPb308vRicWR
	 IknZJy8z4nVUqulEMUfsgeVDXdxPB/YKFj3G8jmXn6hLIkiewpecTrMU+hZkJhS7a6
	 FYtwAl2P+mbnJMpCQ1xKZ7UCm8uEYSTTOesrPCHEzy1SGeepTFfqBthPp/dngDPriT
	 8pkGLO99zWK+mvdMrWuDD/Sl+meL5wyFjt8xUmeNXK7NambHTcrdrG9yDRSFwN+qLc
	 TwBf2CM/rdZTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF0C34095E;
	Sat, 13 Dec 2025 19:57:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49F4B13D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 19:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FF4281501
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 19:57:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wn6WUmlaeIYl for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 19:57:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0705C814EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0705C814EA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0705C814EA
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 19:56:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 73BBE5FFB7;
 Sat, 13 Dec 2025 20:56:56 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 20:56:56 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 20:56:56 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251213115543.1277009-1-bernd@kuhls.net>
References: <20251213115543.1277009-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <d91ea67b9ca6336668ce33158757136f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765655817;
 bh=unBnh/XIB8jKdg88uUGz1KVa2axvYt0L4Z1zILpof8o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EfAVL3IZMD41OHbIv/4u0gUBjQYzmN7+293YZYUtJy5J0Ng5qq7hCJZtZRk+3qWq6
 P3TLpoudv5gn3yq1syUo6St+27iwIK+zk35UVNkd3SKcx9+xlun4dspcEvo7BlKiKz
 qkfM7KNTkMD+N83rKj7tH+tt5CckGign8TPAprhKgZ8/vtx/YGemjEEM+s+/75MbC7
 dfzlLVckp445E8ksN8Z8fPi2zRFab+GgUuqYfTODzjVITQuOfZ+D4HlAA1ICaUu3I6
 g5u+WSM3eDZW7tZcBCUz8gSFEWa6AH28RWE5GjgWJpsCzsL9ldNBvr6lbfrf7Kltdv
 7FHfn07D9yrqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EfAVL3IZ
Subject: Re: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.131
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On 13/12/2025 12:55, Bernd Kuhls wrote:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2025-December/003647.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
[...]
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index f64c9ad44c..240c09b8b1 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBDRM_VERSION = 2.4.130
> +LIBDRM_VERSION = 2.4.131

This patch does not apply.  It bumps from 2.4.130 to 2.4.131, but 
Buildroot
is currently at 2.4.129.

Could you send a patch bumping from 2.4.129 to 2.4.131 please?

>  LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
>  LIBDRM_SITE = https://dri.freedesktop.org/libdrm
>  LIBDRM_LICENSE = MIT
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
