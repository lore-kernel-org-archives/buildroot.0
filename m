Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D498ED6E2B2
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEE604111E;
	Thu, 18 Dec 2025 16:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jCYXY0zpiv6Q; Thu, 18 Dec 2025 16:37:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 014E94110B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075878;
	bh=piT444nqy+RlqS5blRTSk9RnBTyEJMhgp0dw24895xw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VGMETh38h/RLyFi7MFp1blu1DSRovKen3Ok+yL9UtW2J/rQ1gd0CQbyWaH0aB1P9X
	 vWclOYmW89jrUT7exJgM8mfFCDZvB9HFR/1Nn3475zl5YXBmTzcghdPfZW4avRhSBK
	 WaO01tFVi/6lc69Auy5Nivif6SsxPmBZiKODQbhhbitWAw3rq13ZdRDCV3bfCFJNrS
	 RBZ2WzwWDNt12HFk/J13Ph1oua+XEoW1o/45/BmCi6HESgdD9KTCg8ThXfH+2rg/4w
	 NYhWCmK++EMJL12H3c2tyYOdLmmlkyWYckZs5ealW0IaVjL4NKjEdlow/e74meY7Dn
	 X1jNUNfeo1Hfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 014E94110B;
	Thu, 18 Dec 2025 16:37:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 097A3361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFC2780BA7
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PE9YDN_c0iDX for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:37:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECBD480BA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECBD480BA4
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECBD480BA4
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 993C8B97A297; Thu, 18 Dec 2025 17:37:52 +0100 (CET)
To: Preyas <preyas17@zohomail.in>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:37:51 +0100
Message-ID: <20251218163751.379816-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209154834.5946-2-preyas17@zohomail.in>
References: <20251209154834.5946-2-preyas17@zohomail.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075872; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=RJZxbs8Nn0m2ico038ssOmXt2uBEi2587NJm0NgRQ6w=;
 b=SftY+4TDalEUslJLzsUs/UakpASoUYYVPz+yKLQtGg7B4Cv2L33OtotYjY/ZWowtGySWHs
 +JvlfQPdrKPGvINg0ehGeiZiK2WYEW4UxZ914u45KZ7JESd9JG73r7wrJMaCcWAfF4Y5mY
 XRbuJcR6SG1hq+va2/QE8TKyt1e2GRlDijsYZl9GkF9xK14y0kqhmhsnjKCdk4fR1ujk0f
 gpR4h1/ZMqBUU6n7DCnGUR7i9gUjLpqh8Uo6lKTxNHEZ9Q/6185U7DHNKrDTzBd9GuAolh
 L70OWaO3Sle5QXjaPlpawyKvxwvnEw1KGi8KIjg1OIYU1tCepIqOklx4K7CQtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=SftY+4TD
Subject: Re: [Buildroot] [PATCH 2/2] pigz: switch site to HTTPS
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
> Prefer HTTPS for source downloads. No functional change; hashes unchanged. Align comment in .hash.
> 
> Signed-off-by: Preyas <preyas17@zohomail.in>

Applied to 2025.02.x. Thanks

> ---
>  package/pigz/pigz.hash | 2 +-
>  package/pigz/pigz.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pigz/pigz.hash b/package/pigz/pigz.hash
> index d09930b62b..d63c5a5717 100644
> --- a/package/pigz/pigz.hash
> +++ b/package/pigz/pigz.hash
> @@ -1,4 +1,4 @@
> -# From http://zlib.net/pigz
> +# From https://zlib.net/pigz
>  sha256  eb872b4f0e1f0ebe59c9f7bd8c506c4204893ba6a8492de31df416f0d5170fd0  pigz-2.8.tar.gz
>  
>  # Locally calculated
> diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
> index e3273c71c1..0708882a15 100644
> --- a/package/pigz/pigz.mk
> +++ b/package/pigz/pigz.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PIGZ_VERSION = 2.8
> -PIGZ_SITE = http://zlib.net/pigz
> +PIGZ_SITE = https://zlib.net/pigz
>  PIGZ_DEPENDENCIES = zlib
>  HOST_PIGZ_DEPENDENCIES = host-zlib
>  PIGZ_LICENSE = Zlib
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
