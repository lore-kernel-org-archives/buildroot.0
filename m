Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B666D6E2B0
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1279C40402;
	Thu, 18 Dec 2025 16:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9BjF4U9zIt3; Thu, 18 Dec 2025 16:37:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27BD240A57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075820;
	bh=civLt3eMEuggHCrY6Z0VqrxX2KlzAdtHlzFbB4panPg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KMJnlM0yvShyByiMlL+uhgrxU6F778fMYVkueTJFL4rmTtHSAkePV7bH3lG+eOtbx
	 vFvIOsI2JBZIr3f5PIFn1GY+B/ybjLS5S9WU+2I4cPXFgEt12QaU1pZcTSEyVA0CfY
	 PmJTIEyLf+GuO+3MIycTnbWzwXYjIuQrRVxGr6yuf8EPVeFzgpiyzli+ICRLvlrUzU
	 nEc4XtUTKaOmrxe2ddg6gUrjq+yfCY6HHQc7yiHLes53st+V2GwSUecD6RxuF807lB
	 BAbwePzBF8WzDARYKznu3hSRyEHu0qopCLZnhCx39+GPJXQRjSGPQWjKwqaKgkvN72
	 ksl/cRJIFtarw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27BD240A57;
	Thu, 18 Dec 2025 16:37:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA0A6361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC3EB40A57
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0pBG5I5TNCnR for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:36:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6BCDF40402
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BCDF40402
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BCDF40402
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:36:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 44D85B97A297; Thu, 18 Dec 2025 17:36:54 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:36:33 +0100
Message-ID: <20251218163633.378949-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20250824092952.289402-1-thomas.petazzoni@bootlin.com>
References: <20250824092952.289402-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075814; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=hB+oM7dUojlWSj+BCGQvVubUb0NFTwrW3HdMFOUpIcA=;
 b=YMOHIVim+qBytsf+cyzBQ7GrCkF5ch35Leyqwqy3C7ufQRGYny13djnUsN7hrO5os27I0M
 jta23CqMbXVPfHzgtczLSb/ExaQYnYymglg+o8SA1vWT5mUouX4o2G1/63uyA5elsQjZVR
 yM11AyMT8Ei3PZ2V0l+5Pb8zaXwKct7YKMLOnyy6a4ead5CEVRhhO73w7zLqo+fkJSWtQo
 M/f+BQRiWrgFfWJlUaYz6mfeHH7q9KGmL8xDkC8lvLdGtWF9jD+/RKjPeX1LknqeYXszjX
 aOZlus42bvyK4BunaTlxX4Z+PsJZjf/q0u9c3MJtVP4cZehk+hcfdURRtAoTLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=YMOHIVim
Subject: Re: [Buildroot] [PATCH] linux: select host-openssl for all
 architectures when building latest version
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
> Since at least Linux 6.16, but possibly earlier, host-openssl is now
> needed on the vast majority (if not all?) CPU architectures.
> 
> Indeed, in order to fix build issues, we would have to add: armeb,
> microblaze, loongarch, m68k, mips, mipsel, mips64, mips64el, powerpc,
> powerpc64, powerpc64el, riscv, s390, and possibly others.
> 
> So intead, when "latest kernel" is used with the default architecture
> configuration, always select host-openssl independently of the
> selected architectures.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/9a314e759f7640d760003e46f86153300478ec60/ (mipsel)
>   https://autobuild.buildroot.net/results/3bcc674ea5a7cdf031200b0cd2f9f71400ba391c/ (mips64el)
>   https://autobuild.buildroot.net/results/b24983fd91f408de56479b7d7d57fc9fd3333d7d/ (s390)
>   https://autobuild.buildroot.net/results/b262fc6f67a9fed55faffcdd580d89f4664e1e16/ (powerpc64)
>   https://autobuild.buildroot.net/results/45da1538457b18671fa18efe3e1aa57a15561370/ (m68k)
>   https://autobuild.buildroot.net/results/0a457375d2509f1b29a449dfa50f29fc7e56e568/ (armeb)
>   https://autobuild.buildroot.net/results/814ca5f048827a635dea0199878fa82d5012b649/ (loongarch64)
>   https://autobuild.buildroot.net/results/b684d0b37e5187aa9b31693356f8515857d19f7a/ (microblaze)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  linux/Config.in | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index b4b0295dfe..56473d1b03 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -175,12 +175,11 @@ config BR2_LINUX_KERNEL_USE_DEFCONFIG
>  
>  config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
>  	bool "Use the architecture default configuration"
> -	# We know that the default configuration on some architectures
> +	# We know that the default configuration on many architectures
>  	# requires host-openssl, so select it for the latest kernel
>  	# version. This is mainly needed to fix autobuilder testing.
>  	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
> -	       BR2_LINUX_KERNEL_LATEST_VERSION && \
> -	       (BR2_aarch64 || BR2_aarch64_be || BR2_arcle || BR2_arceb || BR2_sparc || BR2_x86_64)
> +	       BR2_LINUX_KERNEL_LATEST_VERSION
>  	help
>  	  This option will use the default configuration for the
>  	  selected architecture. I.e, it is equivalent to running
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
