Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B391D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E74AA82419;
	Wed,  7 Jan 2026 17:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9h14G2znHamS; Wed,  7 Jan 2026 17:51:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20D148221D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808295;
	bh=Ucq1y5eRc9cnJ8a2niC/sEQ3fj3OWIC+HI72+LpG1EY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HSqoWg73NxC3pprAXGY0uEovcRKNcUcdvYI14Mo5QOeZxFZkYThogeaOR1iuR9fFZ
	 CnJiJL4HsZkFDP5ak+yjMLzPNekVP93B3wsuuQh+vq4wMtLZBZ+rMnWUWrYgSnj9l2
	 q6k7GVSiTowXYUWkm4vhqw1IrBNznWewAW+XS9R6A5al8UrpAe1T8Xa8IgzmgNqVV2
	 mPlisebEl2wbl86LGFPzkc/WqkS3eMMg90CEOMBtWOQEZvpj0icPmuB/rfn/oeuSqK
	 pgY4cPvUuerrAmpCcEY/GmiOQ2YCe0sHuBTObznHv00O5rM+k1gDGIGwF05aLbOLoO
	 Oyxr0kfWdEo4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20D148221D;
	Wed,  7 Jan 2026 17:51:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 43CC225B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3603D40F1A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id djPlkFuDyDMT for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2327240F0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2327240F0F
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2327240F0F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5FC8CB97A704; Wed,  7 Jan 2026 18:51:30 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:28 +0100
Message-ID: <20260107175128.227905-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228185637.58072-9-thomas.perale@mind.be>
References: <20251228185637.58072-9-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808290; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=D4rQYV6RGMppBZOOiRh99G3fALrDbmo5/uRJM03+rY0=;
 b=mUD7kEtnTZ+Yjqe90REXSRXWP8pMGZ9+jTP31lwTKWf7pl4sQq+9asRAf+H4+UmZt6ONiD
 kHgjyAdH2DUTxkWULo1nlxqg1w7+VbydSCX09yPK7mkgv8UprRAzJRQea49Nc3o9DmIOiC
 3Vv2uBYkuS+dcTNDEwIAZRkT0y5LAgd3/JDymyyWk8ggi9MgeLnLvTIlE+CgLuIFSk8JKT
 /COzAudn14aQ4kI4RB1Cof4QS0B2ho6mcXmMR5sJx5/UHJgxzYYp5+29mVxpUvJB+dK28U
 RDJ+ciePTPkZ5g3tEsHMzqK4vZhlZhUcJ0+FvFMOgek3ZNHQRFyqDyuCk+wegQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=mUD7kEtn
Subject: Re: [Buildroot] [PATCH 09/10] package/musl: add CVE trailer in patch
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
> Since Buildroot commit [1] the patches that fixes a security
> vulnerability needs to reference the fixed vulnerability.
> 
> This patch adds the relevant information to the patch header.
> 
> [1] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  ...04-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch | 1 +
>  ...05-iconv-harden-UTF-8-output-code-path-against-input-de.patch | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch b/package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch
> index dbfd87db76..a0418e1df8 100644
> --- a/package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch
> +++ b/package/musl/0004-iconv-fix-erroneous-input-validation-in-EUC-KR-decod.patch
> @@ -17,6 +17,7 @@ buffer.
>  bug report was submitted in private by Nick Wellnhofer on account of
>  potential security implications.
>  
> +CVE: CVE-2025-26519
>  Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=e5adcd97b5196e29991b524237381a0202a60659
>  Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>  ---
> diff --git a/package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch b/package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch
> index a14041364a..8250790d4f 100644
> --- a/package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch
> +++ b/package/musl/0005-iconv-harden-UTF-8-output-code-path-against-input-de.patch
> @@ -14,6 +14,7 @@ output byte count overflow, moving the output position backwards,
>  potentially past the beginning of the buffer, without storing any
>  bytes.
>  
> +CVE: CVE-2025-26519
>  Upstream: https://git.musl-libc.org/cgit/musl/commit/?id=c47ad25ea3b484e10326f933e927c0bc8cded3da
>  Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>  ---
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
