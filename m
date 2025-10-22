Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82748CCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52A8A61526;
	Wed, 22 Oct 2025 16:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HkIdCNhGpEI; Wed, 22 Oct 2025 16:43:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57D5461511
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57D5461511;
	Wed, 22 Oct 2025 16:43:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6721343F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E2D340D35
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZ5iDzNfwvKu for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:43:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A9F940D13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A9F940D13
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A9F940D13
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6048AB97918D; Wed, 22 Oct 2025 18:43:30 +0200 (CEST)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:43:29 +0200
Message-ID: <20251022164329.286676-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011201803.2005973-1-yann.morin.1998@free.fr>
References: <20251011201803.2005973-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151410; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=gFynWXWGX2sOjNcpavEdHaqYEcDkeXAxqsChknWlqMc=;
 b=IWPGIplN1o36vPIflRYgJ9zqkd4syOGvp7U0wxbku5K+Zm0EhN4AiQ6ad3y3KWfiqXMs4A
 JGrnKVulnRZEpscawglRqNDmRqN1hhlVJdfCT0l6U+2xsSIzZrDBPJRlCEwKxDSrsrFau9
 1DH6npSK73+zoOZb53vtuzjvn46r7wCVW9MQCy4Peh/D9ZF2sD0zZhSIycT36kacKSDBil
 eSwL85k4uk6+n9Zcwe66fUKsLEBU31yn7Yt3onxffLR23P0bSSOdKT7Bh7HI1yx3wFd/S2
 Ldx1kwD2g8PheNKLIYNCDZ16wCZu+Kbox1QC+ex8C2Cl+sUmVyMigIhOEI5uKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=IWPGIplN
Subject: Re: [Buildroot] [PATCH] package/micropython: use append-assignment
 in conditional code
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
> Since its inception in 9646e80fca28 (micropython: new package), the
> ppc-specific CFLAGS are simply assigned, and since 9fd9f4e6752f
> (package/micropython: define MICROPY_NLR_SETJMP for xtensa), the same
> goes for the xtensa CFLAGS.
> 
> Although they are mutually exclusive (different archs) and that there is
> no prior assignment, the customs are to use append assignment in
> conditional blocks, to avoid accidentally overwriting a valure set
> previously.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Chris Packham <judge.packham@gmail.com>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/micropython/micropython.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> index e1e1f88d51..826247069e 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -21,12 +21,12 @@ MICROPYTHON_IGNORE_CVES += CVE-2024-8947
>  # Use fallback implementation for exception handling on architectures that don't
>  # have explicit support.
>  ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
> -MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
> +MICROPYTHON_CFLAGS += -DMICROPY_GCREGS_SETJMP=1
>  endif
>  
>  # xtensa has problems with nlr_push, use setjmp based implementation instead
>  ifeq ($(BR2_xtensa),y)
> -MICROPYTHON_CFLAGS = -DMICROPY_NLR_SETJMP=1
> +MICROPYTHON_CFLAGS += -DMICROPY_NLR_SETJMP=1
>  endif
>  
>  # https://github.com/micropython/micropython/issues/14115
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
