Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E4ED43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F215140515;
	Thu, 11 Dec 2025 19:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EcUUpMbRQN-v; Thu, 11 Dec 2025 19:31:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 219E840941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481484;
	bh=oFRNoRRoCA/YWzJ2GEkhP4BkhWUWm8XzYm1Y9b3ny0g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ag6JZnb0VU0mqM3qDc6V9PM9bXb+zw+N0GO5gqYNP1RuZ0Zu8/AriHjwsGekqD3fx
	 RlEqITbXnLbJadjeBeoMCgpeX9BxiIbq6/hskLr/6Y6RWzGxSABSonReiN2t9DZC79
	 UYtsUUM7CvswWBPshFMK0EsbG1d6pBmBkddt1YPeWkI1QCZbUYJ/71jj1y2UfRi7e0
	 lnV5oypqFlp1Rsx37/6YQsaLQ14fvSf4pKBwbo4C87BJ+/vltEhX+WaRhDFlF/3r/J
	 GglI2OYYMGlMfyoXh6zcd5tu+K60XeGRaZuD7+NQSfn8ghoZpZSbnaYRUD7afdP0AM
	 w0AsPBXvDdr3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 219E840941;
	Thu, 11 Dec 2025 19:31:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7580F2C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C7EE83C67
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ehV-Z97aIK5d for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:31:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56F5982B9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56F5982B9F
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56F5982B9F
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 693F1B97A082; Thu, 11 Dec 2025 20:31:20 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:31:18 +0100
Message-ID: <20251211193118.1099753-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206085817.442480-1-bernd@kuhls.net>
References: <20251206085817.442480-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481480; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=wvi9dMAjrQslZrclry4WUbSGOcfsPg5Z5zhzrAbgTMk=;
 b=jQcpu1A3aGdQ1+/9mG90qu7okO2h6rRzbrId1AHmEpjqK02x6cI2QUSrlPcOQPRcP9djFu
 KeYI65ovi8Z6tVNG6ANkfaqtoKhAZ5zU0cLD0RjjF82RfCOVj35kl1n2X+XE7Mvf+vMRj1
 D/y0lvKM2MpglahcADpNN2xiIn0gtndi5XQf2D8pv8FG4T0wjW++HfxcKqXZnNiKKJ8Fei
 Fb84R7OW8sN7m30QR7GXAowAIav7PHVEkPuxies9n2ch6GG2szfyzxLeFbOpifbHEXYDa/
 uRTa6dJMtXUhTVpQQimE5unC7S7/4S4LD+qECu7DCrYQKvPYM2/s5KmXVeOTog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=jQcpu1A3
Subject: Re: [Buildroot] [PATCH 1/1] package/rdesktop: fix build error
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
> Fixes:
> https://autobuild.buildroot.net/results/8ad/8ad5d33f726fe57910a70df7c8f40a9568c2dfa7/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  ...002-use-correct-modulus-and-exponent.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/rdesktop/0002-use-correct-modulus-and-exponent.patch
> 
> diff --git a/package/rdesktop/0002-use-correct-modulus-and-exponent.patch b/package/rdesktop/0002-use-correct-modulus-and-exponent.patch
> new file mode 100644
> index 0000000000..f6989d5777
> --- /dev/null
> +++ b/package/rdesktop/0002-use-correct-modulus-and-exponent.patch
> @@ -0,0 +1,29 @@
> +From 53ba87dc174175e98332e22355ad8662c02880d6 Mon Sep 17 00:00:00 2001
> +From: Markus Beth <markus.beth@zkrd.de>
> +Date: Mon, 2 Dec 2019 11:22:13 +0100
> +Subject: [PATCH] use correct modulus and exponent in rdssl_rkey_get_exp_mod
> +
> +Upstream: https://github.com/rdesktop/rdesktop/commit/53ba87dc174175e98332e22355ad8662c02880d6
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + ssl.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/ssl.c b/ssl.c
> +index 930c7f94..0681a890 100644
> +--- a/ssl.c
> ++++ b/ssl.c
> +@@ -307,10 +307,10 @@ rdssl_rkey_get_exp_mod(RDSSL_RKEY * rkey, uint8 * exponent, uint32 max_exp_len,
> + {
> + 	size_t outlen;
> + 
> +-	outlen = (mpz_sizeinbase(modulus, 2) + 7) / 8;
> ++	outlen = (mpz_sizeinbase(rkey->n, 2) + 7) / 8;
> + 	if (outlen > max_mod_len)
> + 		return 1;
> +-	outlen = (mpz_sizeinbase(exponent, 2) + 7) / 8;
> ++	outlen = (mpz_sizeinbase(rkey->e, 2) + 7) / 8;
> + 	if (outlen > max_exp_len)
> + 		return 1;
> + 
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
