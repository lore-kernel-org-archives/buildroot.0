Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E563ECCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD71E40D4D;
	Wed, 22 Oct 2025 16:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5MYihQ7PsS6Z; Wed, 22 Oct 2025 16:43:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5490C40D3A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5490C40D3A;
	Wed, 22 Oct 2025 16:43:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF2C843F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1B3340888
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0E3xkwCim1Ht for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:43:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A32A7400FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A32A7400FC
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A32A7400FC
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C2650B979192; Wed, 22 Oct 2025 18:43:28 +0200 (CEST)
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:43:27 +0200
Message-ID: <20251022164327.286628-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011201747.2005570-1-yann.morin.1998@free.fr>
References: <20251011201747.2005570-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151408; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=dWkyhMIeOzOrbF8NUtifKnsnMcjhrk6n1ZIQR9h8kHw=;
 b=QBdJJ//B5hmXqLAP2tnpIfyr5d5nKTr3IflCwIf15XnvrEfBbgfKQyNJL1BsRQAZBPfirL
 pwLvKA6FkuTw5SnfhTFGxA3YAaTemlcTI1ySrM7kf8Wvi2EMZku2UQC3BWbtt6BaMSPVzE
 AOqpiJhT+p66nKiterp2GN1vK4s7b70DJ9COZqnVhIag/j9ibL7bMOuvq1dnDhpPkwQ8xn
 /xuGKSdF3hGCX2QNz7+Kdo/cUZTTBLok5KPV4y7BAiQYcBCqtLdHrvH1UtmazggmvnT0+t
 DWvb4/WiMjb9lCMO+z8j8DxiPv66ar2IBQU8idiYth8Finw8t4Ih4A/iA+Nn9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=QBdJJ//B
Subject: Re: [Buildroot] [PATCH] package/micropython: fix passing multiple
 CFLAGS
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
> Before commit 50bc5aa17b32 (package/micropython: fix segfault at exit()
> with gcc >= 14), only architecture-specific CFLAGS were passed, and only
> one per arch. But 50bc5aa17b32 introduced a non-arch CFLAGS, for gcc
> versions, so when the build happens for an architecture for which there
> is a CFLAGS, and when gcc is 14 or newer, there are two CFLAGS added,
> causing build failures:
> 
>     [...] /usr/bin/make [...] CFLAGS_EXTRA=-DMICROPY_GCREGS_SETJMP=1 -DMICROPY_NLR_SETJMP=1 [...]
>     /usr/bin/make: invalid option -- 'D'
>     /usr/bin/make: invalid option -- 'M'
>     Usage: make [options] [target] ...
> 
> The fix is simple enough: just quote the CFLAGS.
> 
> Fixes: https://autobuild.buildroot.org/results/b18/b18d6fa9938c1267a771fdbcd8b4c3df812cd6b9/
> Fixes: 50bc5aa17b320d91809048d5ef6a110f8c0b9157
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Chris Packham <judge.packham@gmail.com>
> Cc: Romain Naour <romain.naour@gmail.com>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/micropython/micropython.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
> index 32b361db16..e1e1f88d51 100644
> --- a/package/micropython/micropython.mk
> +++ b/package/micropython/micropython.mk
> @@ -42,7 +42,7 @@ MICROPYTHON_MAKE_OPTS += \
>  	MICROPY_PY_BTREE=0 \
>  	MICROPY_PY_USSL=0 \
>  	CROSS_COMPILE=$(TARGET_CROSS) \
> -	CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS) \
> +	CFLAGS_EXTRA="$(MICROPYTHON_CFLAGS)" \
>  	LDFLAGS_EXTRA="$(TARGET_LDFLAGS)" \
>  	CWARN=
>  
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
