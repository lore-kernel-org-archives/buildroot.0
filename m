Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD4BD41D7E
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B191583C71;
	Thu, 11 Dec 2025 19:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVNfsWvyhcF1; Thu, 11 Dec 2025 19:31:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7912A82B9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481488;
	bh=QZmuLYkrlUfppg+Pm80qVE4RwNCubVfom+lUxuJmyHs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AEfCRmuk2z+M8xl0ukvuzSQ7WyAL+HZFemR0IO5nxUifxhgDStsI+CRBQ9IprxqgI
	 zDpDx9Rl/UfsGU/HUvzYA+CWx4mq2wgpQaip623DUL8P9AR7+0+sMGcrABXto/7mF1
	 0txps4bFNpKw8NMJwKKgOkiKfs/DNYAzgIidz3m8c+5y39OmMRKE7iZSfnDwXM9Zmm
	 iLg4S5kefLz573UjLG5F6/RPRRkdrTIB6t70IUHh1dSCuxFbYpozP3cDipsr4e5FL/
	 l5rR5t8gk7hlSvXmpCGR2RylyVHNwLY0Kf0j4UQ7wQgmNM3PzmN92se08PdUMTESaW
	 WUegBYyevngUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7912A82B9F;
	Thu, 11 Dec 2025 19:31:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B29B22C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4E8840027
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_n2Zw6zzdj5 for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:31:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9CE5E40012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CE5E40012
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CE5E40012
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 536A0B979EEF; Thu, 11 Dec 2025 20:31:23 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:31:21 +0100
Message-ID: <20251211193121.1099812-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206131044.689379-1-bernd@kuhls.net>
References: <20251206131044.689379-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481483; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=JhxBoHDTVJC9VR0ZLHd860uKHNEczJpq2/zY8Fz6OCI=;
 b=dnCyrHgzISU2cGs4qtVX6Xwh32ZO8C/6+IPi4R5nYus5yRaveZ5CQipByVab+VLmDFejm+
 T9N3MDQPTUZlQSNsBFr8dL1kvtUDl/K2wiX65vq8UcYtSm4WNX3hgDozcc0mrL6y+p2qA+
 EvD1lBXC3SuWb8E7MA3Ok3m9ohAhKqSAUxrSgmXNUYj2qTbVTSiwysTs7TI56NXyQnGYQU
 Au9z98NnUghGJRo1tXhyBlph6ukiYTPIMWUbhtn1zlC/7RWnGm9bca5Y3SGXuosJWvt1XX
 doKq6huABrw8p/sLY0tt/1X4iCh5zbky/YSZB8Fk9P/Ld/WyckKfbqn9/SBzBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dnCyrHgz
Subject: Re: [Buildroot] [PATCH 1/1] package/unbound: security bump version
 to 1.24.2
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
> Changelog: https://nlnetlabs.nl/projects/unbound/download/
> 
> Fixes CVE-2025-11411:
> https://nlnetlabs.nl/downloads/unbound/CVE-2025-11411.txt
> 
> Removed UNBOUND_IGNORE_CVES, the fix is included in this release.
> 
> Fixes:
> https://autobuild.buildroot.net/results/d3d/d3d6b84ba667e3e2586b7cfdaddcd160232eddfd/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/unbound/unbound.hash | 6 +++---
>  package/unbound/unbound.mk   | 5 +----
>  2 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
> index d9397f698a..19966d889e 100644
> --- a/package/unbound/unbound.hash
> +++ b/package/unbound/unbound.hash
> @@ -1,8 +1,8 @@
> -# From https://nlnetlabs.nl/downloads/unbound/unbound-1.21.1.tar.gz.sha256
> +# From https://nlnetlabs.nl/downloads/unbound/unbound-1.24.2.tar.gz.sha256
>  # After checking pgp signature from:
> -# https://nlnetlabs.nl/downloads/unbound/unbound-1.21.1.tar.gz.asc
> +# https://nlnetlabs.nl/downloads/unbound/unbound-1.24.2.tar.gz.asc
>  # with key: 948EB42322C5D00B79340F5DCFF3344D9087A490
> -sha256  3036d23c23622b36d3c87e943117bdec1ac8f819636eb978d806416b0fa9ea46  unbound-1.21.1.tar.gz
> +sha256  44e7b53e008a6dcaec03032769a212b46ab5c23c105284aa05a4f3af78e59cdb  unbound-1.24.2.tar.gz
>  
>  # Locally calculated
>  sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
> diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
> index e9a32e6129..b435839020 100644
> --- a/package/unbound/unbound.mk
> +++ b/package/unbound/unbound.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -UNBOUND_VERSION = 1.21.1
> +UNBOUND_VERSION = 1.24.2
>  UNBOUND_SITE = https://nlnetlabs.nl/downloads/unbound
>  UNBOUND_INSTALL_STAGING = YES
>  UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
> @@ -23,9 +23,6 @@ UNBOUND_CONF_OPTS = \
>  	--with-libexpat=$(STAGING_DIR)/usr \
>  	--with-ssl=$(STAGING_DIR)/usr
>  
> -# Only vulnerable if built with --enable-subnet
> -UNBOUND_IGNORE_CVES += CVE-2025-5994
> -
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
>  UNBOUND_CONF_OPTS += --with-pthreads
>  else
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
