Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFFDC5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 10:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20411409E9;
	Sat, 15 Aug 2026 10:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5-EbRsOUiWK; Sat, 15 Aug 2026 10:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0527D40C2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786790082;
	bh=mzlCZI2a01ojELrLldBcfuwyu6/KgGaq8Jix91Um1qU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HTZgMFVESGXzMiQ3JqvdENIe6kpVvyDvsz3SMsqCF6oxENNoz9V08ahi0wVapPsxA
	 Oal3nsYqWn8QE4kSlNXUkY6Mcs82QYvwUU78j5hY/GXKsqYuyQnikW3MS9bEFJOaz3
	 l4cBlJLUSNvThJkGeXShCe4gtkUnjjJ8rMgBBFo3xS7S3ilXREFrgKCihNkRnrdP9V
	 CGIv5pErMN+i6ZN1ZwAronBfc+GZPm9MIO0clstrb2Eb2dcQBz1wygG5ugDzJL+/z4
	 7j8/t1K5Ea20Ol17eenS7/zx7x4qKPK3Ayp8rDjdXQxLfGEGZyb1ETl34IZU+hGzqY
	 ryn/OI2GFKkPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0527D40C2E;
	Sat, 15 Aug 2026 10:34:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13352392
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 10:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED88540084
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 10:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_6jXyVMkNsY for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 10:34:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3DF6C4004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DF6C4004E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DF6C4004E
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 10:34:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D2E052003B4;
 Sat, 15 Aug 2026 12:34:32 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Aug 2026 12:34:32 +0200
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 12:34:32 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>, Giulio
 Benetti <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20260813131053.899334-1-thomas.petazzoni@bootlin.com>
References: <20260813131053.899334-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <fc1a502f370e23dc0734c88ce0b32af8@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/gcc: fortran support now requires
 MMU
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

On 13/08/2026 15:10, Thomas Petazzoni via buildroot wrote:
> Since upstream commit
> c66d1ba685b0d03b28967d2f7a48f6c64687efa2 ("Fortran: Add a shared
> memory multi process coarray implementation [PR88076]"), libgfortran
> now unconditionally uses fork(), which makes it impossible to build
> Fortran support on noMMU architectures.
> 
> In follow-up commit efb497c23a6f4109bf8794342617cbc161c08301, it was
> made even more clear: if you don't have fork() and you're not on
> WIN32:
> 
> +#else
> +#error "no way known to start child processes."
> +#endif
> 
> There are apparently no autobuilder failures for this issue, but the
> simple defconfig below allows to trigger the build failure:
> 
> BR2_arm=y
> BR2_cortex_m7=y
> BR2_GCC_VERSION_16_X=y
> BR2_TOOLCHAIN_BUILDROOT_FORTRAN=y
> 
> Even though this issue is only starting from GCC 16.x, we make Fortran
> unavailable on noMMU configurations regardless of the GCC version,
> with the reasoning that:
> 
> 1. Fortran on noMMU is unlikely to be in use
> 
> 2. Moving forward, all future versions of GCC will have this
>    restriction
> 
> Cc: Romain Naour <romain.naour@smile.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
