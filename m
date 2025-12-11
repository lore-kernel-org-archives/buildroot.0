Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8C2D41D7E
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02431406C1;
	Thu, 11 Dec 2025 19:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2HPq6MUP550X; Thu, 11 Dec 2025 19:31:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21E2840500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481482;
	bh=tLTrQrtHmp2BwpV+FgExq8Y3FSrpM3RuO/fl5d5Alyg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AvmbIR0yGqc6RkXKOkKIjjb2URQY1xQ9QJmaBkYopbgsvzRE5FRd5NEjBYVfjhe6E
	 BjQzU3+nZhPcwkqqBsSuQGB7AhE9Y7Oq8lEqLNx80Tf1OUvuG7LH5kJ5PJ0uhnFQ9s
	 7kIa/LqPmjAELSK30MxNZOYAqxkd0B5VZ8NJlhZlLRSJUGVpSzWhu1EGdb9EyYga85
	 +EbLUVJoA5JLyegvDXKpZwEPduMptBW+rw8HivmvPyNGO9B4uC8w8NByu+7k5qs/eP
	 6XxLxlG0E7QxKsRFhNT4g5Kc7rPCN4hs5ChuGq3KrSUOdWKErA+DOf0n+HtujAghql
	 apmHQUprQE2+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21E2840500;
	Thu, 11 Dec 2025 19:31:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A755AE7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DE8E40029
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_nTXCmdL65y for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:31:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8B2B340027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B2B340027
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B2B340027
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BA47FB97A082; Thu, 11 Dec 2025 20:31:17 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:31:15 +0100
Message-ID: <20251211193115.1099694-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206085122.437825-1-bernd@kuhls.net>
References: <20251206085122.437825-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481477; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=iL4dOe3W1v77sOw1AMbioyCrPjeYqjcsVfRyacxp1zY=;
 b=nOryN+eyanmQmBSxSsswljCEJV+AWiV2DRRTodj5Yyu1PQuya81gK0Q3qxBrEfzu1ZdAwS
 EZ1vbIVnRyeTrtjQb0Oek08HCGOkzT7ixhr64DSXQqtYYqfrqm5IP4IvvmjQm2pAatAcga
 kMz+6om7ZgaxChxDM7z4l4L0AEwyNRC/X89XYG16usb/ckrstTLcTUjjl0j8dSvvIYXUiU
 t6ymEbiYgVWfS7/OSQl9ON7kM3Ln3aoTRs4vAe2cuHZqyVnjTZN8rHzp+++MmSNKgG+6KS
 1N+cf9ehQXcTdamCDz5DZsaUuDQ/QSL0LZMsjStRraEOX67ShQO5t3jOxPB9dQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=nOryN+ey
Subject: Re: [Buildroot] [PATCH 1/1] package/racehound: switch project site
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
> Previous repo is unavailable, switch to fork.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/racehound/Config.in    | 2 +-
>  package/racehound/racehound.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/racehound/Config.in b/package/racehound/Config.in
> index 5b8bdc77bc..757743f79b 100644
> --- a/package/racehound/Config.in
> +++ b/package/racehound/Config.in
> @@ -23,7 +23,7 @@ config BR2_PACKAGE_RACEHOUND
>  	  - CONFIG_KALLSYMS_ALL
>  	  - CONFIG_KPROBES
>  
> -	  https://github.com/winnukem/racehound
> +	  https://github.com/kmrov/racehound
>  
>  comment "racehound needs an Linux kernel >= 3.14 to be built"
>  	depends on !BR2_LINUX_KERNEL
> diff --git a/package/racehound/racehound.mk b/package/racehound/racehound.mk
> index 6499e166d8..93ce5c8e57 100644
> --- a/package/racehound/racehound.mk
> +++ b/package/racehound/racehound.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  RACEHOUND_VERSION = f09f06fcc3c77c8c5541be3ba5be80aa8148ce0c
> -RACEHOUND_SITE = $(call github,winnukem,racehound,$(RACEHOUND_VERSION))
> +RACEHOUND_SITE = $(call github,kmrov,racehound,$(RACEHOUND_VERSION))
>  RACEHOUND_LICENSE = GPL-2.0
>  RACEHOUND_LICENSE_FILES = LICENSE
>  RACEHOUND_SUPPORTS_IN_SOURCE_BUILD = NO
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
