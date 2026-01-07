Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F67DD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3752140F00;
	Wed,  7 Jan 2026 17:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5uQSp873wTWv; Wed,  7 Jan 2026 17:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 053E040F0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808292;
	bh=92dH79YGSwtVkEDD2GHDNEZn/xk/A7G4FJ/efdlmPZc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Nq49bQCdRASpma8Oeo7mGa5LxPmLLIek/0izrHtWLqsEmj/D6ce9xZpBBYGlyXdGU
	 1iGVkaUuKZQ4ogZzSAQl112FBO+RC8TXrFPcaOFxP3dSSDnCjEZPy3rw6x0ubQP/9q
	 5H/Pz58HsIpfYq+fZhm8J4DBUzWNhLFw6iS3FeMO0jpHGjRPcgI1blnp1Bh4HAENpe
	 tMHrkzak7GpgEWHozelM+4B2Ls9sCdwo38kZis0NJ6KIlJwJT1Y5sIGUHHUg3VSoMH
	 TeqwheGPxWazjD2znuoDXaKGAeHVfJvq5SaCtuumX9YyGPd2M3lF7jBxf073wU0/zb
	 fEC49OGRZvpvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 053E040F0E;
	Wed,  7 Jan 2026 17:51:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 146EC9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE94C60667
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5zXg2b036-7 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E404860653
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E404860653
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E404860653
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 197F2B97A704; Wed,  7 Jan 2026 18:51:28 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:26 +0100
Message-ID: <20260107175126.227858-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228185637.58072-8-thomas.perale@mind.be>
References: <20251228185637.58072-8-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808288; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=vloBCxRDT1/84T0uKUSx6b9ZqePXAs5onWtIWPImrpg=;
 b=eia/5lx9kNtKT9O501Sa40AHA7lx0tWahFku31WZSg2m8v1A4vBh7mhvuQxpzvBkOrrfdK
 Z/vzO/88rWn9uBDJlRpaEF55a4l7oRQqfigZdvcVDhWv9XbnyKY6I52TQCGLNWK9gO4l8m
 VBnJ65mGvvqkx87+b6snsu7z3xOWU8k1eg5FhmgjUXNmh+uhdTrvrxxsHzRwrdWGjEbpfO
 T2EtiQvpszy+2ti1P5aMoFZqzefzomSSCwrx/w7aUevTIULIYM0Ds+tlqGWozbDK2iMorr
 Djh+rf5vwfNBWp0mLaCvqLLQ2YanEeblxMG0lL5PxO3IM85AIGpufEedYMbtEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=eia/5lx9
Subject: Re: [Buildroot] [PATCH 08/10] package/libsndfile: add CVE trailer
 in patch
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
>  ...14-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch b/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch
> index dd9f157811..cb73d370bf 100644
> --- a/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch
> +++ b/package/libsndfile/0014-src-ogg-better-error-checking-for-vorbis.-Fixes-1035.patch
> @@ -3,6 +3,7 @@ From: Arthur Taylor <art@ified.ca>
>  Date: Fri, 15 Nov 2024 19:46:53 -0800
>  Subject: [PATCH] src/ogg: better error checking for vorbis. Fixes #1035
>  
> +CVE: CVE-2024-50612
>  Upstream: https://github.com/libsndfile/libsndfile/commit/4755f5bd7854611d92ad0f1295587b439f9950ba
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
