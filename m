Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABA4D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B205940B89;
	Tue, 13 Jan 2026 19:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RC6hFmgrhuJc; Tue, 13 Jan 2026 19:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C53E040D94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333602;
	bh=OETYo/Yb6w2KVR5IGCtPaaSV1GdTykVV/Q7frJarRh8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HIBQgY5vUNirAfDqnliuY43ELWC3QAEjUwFOEdXw91acBMCvPXZS9/r2SQ41zvw0D
	 axaveWP1eSWcy1knUScp8H9gM2D2VJSHLxWpFHzLWlbgFMWuYWIcQpIGlKbUXNLq4c
	 1iNDEdX2KZF7S5WwtW6w+7YgoF594Yyd//xfr2x95Psu7amvZKra6VNxGfDmVN3VMw
	 KhQ5OXwe9ldqDOOttl6NgbNITmABGfBvEJ1ksDRBM9rY+mGCIPtQci1a8UdBNY7h1y
	 g/0yR7qgCELjePMaDs25Xeb4CU8uo16ba2yrqe8qgA60JSsWNHYR1murd7Q0X00Dmq
	 ZAAmwj2oh/3qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C53E040D94;
	Tue, 13 Jan 2026 19:46:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53ECF1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AF1840B76
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guceJmy00DrL for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B4E940359
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B4E940359
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B4E940359
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 47BB5B97A863; Tue, 13 Jan 2026 20:46:39 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:37 +0100
Message-ID: <20260113194637.98857-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-11-thomas.perale@mind.be>
References: <20251230081917.18676-11-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333599; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=WCB0WjmpIpFT6UsieMjo2MByJCuasFZ+yvrhc6dDH6Y=;
 b=KNuwiXynpjkXhko1eDXo1WV6BIuregZRgux/ZHc7sr2elLsZCkDyPnWZAQcOmu9t9dr1n+
 m/uP/+xRnE2sHZYW5HF5io2tF+HOd6NSalzHosQjv/gGaE3E36Gv/AOrVuKkBGhOUs4Shp
 0EKknUYLNcY2FZSt/Sbv0fk+LJTw5Srvy8UknBIC1CrK1janr07qrIatjY5Y/AGzEqjs4s
 5+ijc4tnd87MhUA4N7TIbNsLBuqyMbQzGq+nP81/aHSy3xDkWyC5fH6L/kDPaBftAtsQzF
 LLypxVLUjp+lMD/XxxIF0Vig531JpWx1Rl7ttlLH5yvIqWkq8LVN9sGpiVF2sA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=KNuwiXyn
Subject: Re: [Buildroot] [PATCH v2 10/15] boot/grub2: remove stale
 IGNORE_CVES
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
> Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
> versions using '-'.
> 
> The IGNORE_CVES entries introduced in [2][3][4] are then no longer
> matched to the grub2 package.
> 
> For more information, see the explanation in commit [1].
> 
> [1] 35f376d88e support/scripts/cve.py: fix CPE matching
> [2] 2495630383 boot/grub2: ignore CVE-2024-1048
> [3] e2f46ed03d boot/grub2: ignore CVE-2023-4001
> [4] a490687571 boot/grub2: ignore the last 3 remaining CVEs
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  boot/grub2/grub2.mk | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> index f543c53cd8..fdf274d9aa 100644
> --- a/boot/grub2/grub2.mk
> +++ b/boot/grub2/grub2.mk
> @@ -15,17 +15,6 @@ HOST_GRUB2_DEPENDENCIES = host-bison host-flex host-gawk \
>  	$(BR2_PYTHON3_HOST_DEPENDENCY)
>  GRUB2_INSTALL_IMAGES = YES
>  
> -# CVE-2019-14865 is about a flaw in the grub2-set-bootflag tool, which
> -# doesn't exist upstream, but is added by the Redhat/Fedora
> -# packaging. Not applicable to Buildroot.
> -GRUB2_IGNORE_CVES += CVE-2019-14865
> -# vulnerability is specific to the Redhat distribution, affects a
> -# downstream change from Redhat related to password authentication
> -GRUB2_IGNORE_CVES += CVE-2023-4001
> -# vulnerability is specific to the Redhat distribution, affects the
> -# grub2-set-bootflag tool, which doesn't exist upstream
> -GRUB2_IGNORE_CVES += CVE-2024-1048
> -
>  # 0004-fs-hfs-Fix-stack-OOB-write-with-grub_strcpy.patch (yes, two
>  # CVEs are fixed by this patch)
>  GRUB2_IGNORE_CVES += CVE-2024-45782
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
