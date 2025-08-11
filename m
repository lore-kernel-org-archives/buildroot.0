Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C42C87FD2
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 14:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA04241213;
	Mon, 11 Aug 2025 14:51:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJmIPxU9_h13; Mon, 11 Aug 2025 14:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA0CB41268
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA0CB41268;
	Mon, 11 Aug 2025 14:51:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0DE0138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C26DE40CFB
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXwdadpn3UGY for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 14:51:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 86AFE40A33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86AFE40A33
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86AFE40A33
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:51:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1115513FA36;
 Mon, 11 Aug 2025 16:51:38 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 11 Aug 2025 16:51:33 +0200
MIME-Version: 1.0
Date: Mon, 11 Aug 2025 16:51:33 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>
In-Reply-To: <20250811090700.20714-1-titouan.christophe@mind.be>
References: <20250811090700.20714-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <6ae17cd572cb689f27a1c1d959969c18@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754923901;
 bh=H7Y/5nGaqnbGG51mlN7My8B9U28Avgr6gACyE5JohZY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dGRASmj7EsJhEEk91KDCqrrq0sfu0dIN8hLdNk4rsTfDWQD7g+1Cbv/03cXwUasYT
 x9GC0u5h7IhYYcA1UWr1ZYghrtMIwFLKm6Ckgf6qWcnZEp2O2UK43qlrhvMKPLhjru
 /LLMcTE1l18NqUu1svzbGs3Z2EsMzG9b1hmEVTGvu/GeQAiyqA+LqxaYAerS/qKb8/
 FseG3C3iASM9e9doJaqfeMlIds1T0sDAyAPPuwbHhU3cCAc8lB86n5EtE4ano6eMms
 oROY40FsGfLPfCdmSTRQHmlC5axl71lbCbcKSI0YT2fCdUVGVwUOHxaqXXMIs8CidF
 ZdMgOkXZvdhCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dGRASmj7
Subject: Re: [Buildroot] [PATCH] package/redis: bump to v8.2.0
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

Hi Titouan,

Thank you for the patch.

On 11/08/2025 11:07, Titouan Christophe via buildroot wrote:
> From the release notes:
> (https://github.com/redis/redis/blob/8.2.0/00-RELEASENOTES)
> 
> ===========================================================
> 8.2 GA (v8.2.0)    Released Mon 4 Aug 2025 15:00:00 IST
> ===========================================================
> 
> This is the General Availability release of Redis Open Source 8.2.
> 
> - Streams - new commands: `XDELEX` and `XACKDEL`; extension to `XADD` 
> and `XTRIM`
> - Bitmap - `BITOP`: new operators: `DIFF`, `DIFF1`, `ANDOR`, and `ONE`
> - Query Engine - new SVS-VAMANA vector index type which supports vector 
> compression
> - More than 15 performance and resource utilization improvements
> - New metrics: per-slot usage metrics, key size distributions for basic 
> data types, and more

This is a short summary for the 8.2.0 release. Looking at the full
release note:
https://github.com/redis/redis/blob/8.2.0/00-RELEASENOTES

We see the changes from 8.0.3 to 8.2.0 includes three security fixes:
- (CVE-2025-32023) Fix out-of-bounds write in `HyperLogLog` commands
- (CVE-2025-48367) Retry accepting other connections even if the 
accepted connection reports an error
- (CVE-2025-27151) redis-check-aof may lead to stack overflow and 
potential RCE

So I believe this patch should be marked as "security bump" (with the
corresponding info in the commit log).

Could you send an updated patch, please?

> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/redis/redis.hash b/package/redis/redis.hash
> index c66223f2da..41d2797cd0 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>  # From https://github.com/redis/redis-hashes/blob/master/README
> -sha256  
> 33f37290b00b14e9a884dd4dcba335febd63ea16c51609d34fa41e031ad587df  
> redis-8.0.3.tar.gz
> +sha256  
> ff95b83b7cf2f7a33af3be1e52fdf2e791c259f8272465c3b09f9e6bc901b604  
> redis-8.2.0.tar.gz
> 
>  # Locally calculated
>  sha256  
> 4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  
> LICENSE.txt
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index 5ffb2a929f..8b5005ccda 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -REDIS_VERSION = 8.0.3
> +REDIS_VERSION = 8.2.0
>  REDIS_SITE = http://download.redis.io/releases
>  REDIS_LICENSE = \
>  	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
> --
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regaeds,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
