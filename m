Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F41CD1D494
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 20:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DCF380C0B;
	Thu,  8 Jan 2026 20:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwNXS9kUn6IH; Thu,  8 Jan 2026 20:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2516480C13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767904290;
	bh=ipCOw4U+faJRiO/X65jmzjlsHflLA0/Ss6ZamGiJza0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=V1zWivJcWZX5Ozd3FXoGsh3dzaBvd6ayLCdUxY/yqLv4NANmWOvwTiHboYUPfnfmL
	 5E+Jv0fnvs6bISvRLgG04d5i9jpjf4H7XSEhopvgE97r/NWicEGGE+RygP+HSUt7Xf
	 u6CbRzpO5h6AlLOm3R2c/zRobajZvPPH2BQd8UUsIGXORSHqxRLeGnMXuzZ4Zze/W5
	 MLc+Q3OP7ZGuaCBj8gPnH4f5yLTNUaKbtCN1WrzZ4Mk+uKoceAz5NlKRxOr17jf7Gu
	 JS19ICbLGi0L+erai/r78vIfSNvQS+gtB0kEXKUkjFWg7ziZ20spSDDMfZ8h8Vc/bY
	 VfScf1sqLpVHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2516480C13;
	Thu,  8 Jan 2026 20:31:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07167308
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E16CA400BA
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uI2UtkCZrxL2 for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 20:31:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DD14240098
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD14240098
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD14240098
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:31:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id A675719F59C;
 Thu,  8 Jan 2026 21:31:23 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 08 Jan 2026 21:31:23 +0100
MIME-Version: 1.0
Date: Thu, 08 Jan 2026 21:31:23 +0100
To: Titouan Christophe <titouan.christophe@mind.be>, Thomas Perale
 <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260103200229.246015-1-ju.o@free.fr>
References: <20260103200229.246015-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <d80dd170972ccef05fbb2a9dbd371581@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767904285;
 bh=o81rCdg33AmoYbEReLtUbN5LABgC63Qy+Iw3MlSO4qg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YianxAQWbpmmex68pZgH3EG4pQZVMx7GjJrMBxfjJ5+ASFUGTHWmfhBnIAhMHbRim
 85S+zPyFr3R49ac4kvQJEOFEJqQPqQWzM433Nf7rLbh6ZDqLyvjlb/kAxN4HyEbDEY
 ATT/N6c4KAAlv907w7uYv6AIlE19BeF8McXhhZUPn7ZE5bdLJNtRiehmRV3m+/+OWZ
 1UHWYTmOwGahYraZi41dAnGHKUS34I6vDdGY4GTKxTM/XDTLJpqYGAMfGiZ/Io9OQe
 HvHREdWYeXUx49c1zdWUDRZwKNnsGkpVZ65hmEdW4L3iIf/CmxkmK2Y7KXKmdCwqtJ
 QtmBFi0GSA+wQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YianxAQW
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg2: bump to version 2.4.9
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

Hi Titouan, Thomas,

On 03/01/2026 21:02, Julien Olivain via buildroot wrote:
> For release note, see:
> https://dev.gnupg.org/T8001
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/12595598071
> ---
>  package/gnupg2/gnupg2.hash | 4 ++--
>  package/gnupg2/gnupg2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
> index 01060f897b..ee37e6a3af 100644
> --- a/package/gnupg2/gnupg2.hash
> +++ b/package/gnupg2/gnupg2.hash
> @@ -1,5 +1,5 @@
>  # From https://www.gnupg.org/download/integrity_check.html
> -sha1  c704085aa7cc131a67edd0b7c0c90e5c35ee4adb  gnupg-2.4.8.tar.bz2
> -sha256  
> b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bcdd060595318616  
> gnupg-2.4.8.tar.bz2
> +sha1  d4b76a8de78631b64b8c6f3725ed28dede40bdb4  gnupg-2.4.9.tar.bz2
> +sha256  
> dd17ab2e9a04fd79d39d853f599cbc852062ddb9ab52a4ddeb4176fd8b302964  
> gnupg-2.4.9.tar.bz2
>  # Locally calculated
>  sha256  
> bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  
> COPYING
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index debf15ef63..d083ea850a 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -GNUPG2_VERSION = 2.4.8
> +GNUPG2_VERSION = 2.4.9

For your info, this patch is in fact a security bump.

It fixes:
https://www.cve.org/CVERecord?id=CVE-2025-68972
https://www.cve.org/CVERecord?id=CVE-2025-68973

You should consider it for your LTS maintenance.

It was not marked at the time the patch was authored:
https://dev.gnupg.org/T7906

>  GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
>  GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
>  GNUPG2_LICENSE = GPL-3.0+
> --
> 2.52.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
