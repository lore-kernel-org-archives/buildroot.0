Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECEAD41D7E
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 964A24113E;
	Thu, 11 Dec 2025 19:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uQW1iEfnBh3; Thu, 11 Dec 2025 19:30:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C069241146
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481449;
	bh=59oPKTo0w1Vgm6WxOU75wqYdQTZJcgDIpHenTVk1NzY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YIdta8D+y377Wk+yF6CBAPNSZO/Lys3fNQ5CzaClrE/rKNoFIdSLz3FNYSR1o7nf3
	 ism9Pqpr6rjL13zioCSZARuId1ukSq1v/G83kknE3dwKc5OEk9NMlh6bGleCQqasQn
	 UIdBKt8lYBkvAoOXRUN579xyn3hRDR0z8KD55noaF3r+2QDCcUROAKTLbOWBDNjRqM
	 OUUdaVI+GAphwu3N1gkNUIkXqMX1fVicvWnzyeAeCVld1FI37lTEHSVoivCTYnX0p5
	 MVsA2qh9Ab+x0X5c2l+3Q1gXzjicMfXVRDvUzQA6XjRAbmgw4qXcdlhqso65HZssP3
	 nWBCQthAb8o6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C069241146;
	Thu, 11 Dec 2025 19:30:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FFF92C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06B144005C
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 84G_88UeWOLB for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:30:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB64E40027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB64E40027
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB64E40027
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C8F1CB97A082; Thu, 11 Dec 2025 20:30:44 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:30:43 +0100
Message-ID: <20251211193043.1099141-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205212959.2082018-1-thomas.petazzoni@bootlin.com>
References: <20251205212959.2082018-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481444; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=+I6XoeNNp+RnpE4fEMqh3RuCVhg0m1CeSk/WBuebDRU=;
 b=eb8IQAYylTBQTtou+BeQQATjDZOBBXaV5I/F0Dsqf1FLtvJW2pWCAJ+0voSLPzs9D8eM+v
 d4W77NKfVfbH+zphkq+8yNXLAwvTtMss6JCElfIQ+E88oXXJMG+twS6Ti6p1WMV0Jv8lir
 NMXVORugx5I4GPV1G4iN/iXKjWhUKEEJYfu5RUpV5A+GLJwjN2nYagO/FmoGZ9+diy/nA+
 EBEEyxJS+/oII4SYD7qWhwfqsQH+aAeR19ZsapR2mOleaczqaL84OGYSPoGWFmErcyA6dV
 OK4i6lb/+j4NLyefOIsMsw0U0Pv5aRrbHFwAqMl5M8qEQFNLp1zwqD+EwYxy6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=eb8IQAYy
Subject: Re: [Buildroot] [PATCH] package/glibc: only supports ARC
 little-endian since glibc 2.41
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
> Since upstream commit
> https://sourceware.org/git/?p=glibc.git;a=commit;h=4ff55d08df0e6f11cbd217f4dca4532bd7d9330d,
> glibc no longer supports ARC big-endian, and the configure step fails
> with:
> 
> checking for egrep -e... (cached) /bin/grep -E
> checking for big endian... yes
> configure: error: big-endian not supported
> make: *** [package/pkg-generic.mk:263: /home/buildroot/instance-0/output-1/build/glibc-2.41-70-g1502c248d58cb99a203731707987a4342926e830/.stamp_configured] Error 1
> 
> This commit was first merged in glibc 2.41, so this issue is
> applicable to both master (glibc 2.42) and 2025.02.x (glibc 2.41).
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/87e4b84f3aee64d041c3b845cb003e6b90649ffb/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/glibc/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> index 9a4fe6f3db..b066616a01 100644
> --- a/package/glibc/Config.in
> +++ b/package/glibc/Config.in
> @@ -21,7 +21,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
>  	default y if BR2_sparc64
>  	default y if BR2_x86_64
>  	default y if BR2_microblaze
> -	default y if BR2_arc && BR2_ARC_ATOMIC_EXT && !BR2_arc750d && !BR2_arc770d
> +	default y if BR2_arcle && BR2_ARC_ATOMIC_EXT && !BR2_arc750d && !BR2_arc770d
>  	depends on !BR2_POWERPC_CPU_HAS_SPE
>  	# glibc needs atomic instructions, and does not support
>  	# single-precision floating point ABIs (ilp32f and lp64f)
> -- 
> 2.51.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
