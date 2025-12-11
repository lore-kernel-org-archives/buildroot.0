Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BD4D43342
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D24140B28;
	Thu, 11 Dec 2025 19:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPSnrz1ZPBkO; Thu, 11 Dec 2025 19:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84CD540B30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481493;
	bh=FFYIL5kew2xruz6LR+gX7rPNXYYMeLoXkAt+Mg1ntPI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Mrrr1uCVP7h0y+l0d0uT2gjL7xiYsGlqCeEoaepGj8hsXgZmK82pXzove10Sw1Xsl
	 9spu+TumAVDs8dVSN6PXHCfLo/20A46mlIssRaP5sePcRc+oM8WgT5s3lWNXXBWa87
	 mLQ3BK6togpLlP4s930VuIv7hcih7WcrtAeiZo300jeWB6bqtyKhLsfCC7oQEk3OT6
	 yT2PDhFGf6b5gN8oQBee8tBCPFpQOIFTITrXKVvFclBMqZZRZ5C1X4PtTetY4nxOJd
	 BTAhDMq4yRps2Ya4Assn5EJkNFaJngRegGc/VmuonJGA2FN+fSiFbZHcIRocz1H2/0
	 cRICDgwvxjt9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84CD540B30;
	Thu, 11 Dec 2025 19:31:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BC24E7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7963140027
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id salSUSe8-zoa for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:31:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A33E40012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A33E40012
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A33E40012
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:31:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A36BDB979EEF; Thu, 11 Dec 2025 20:31:29 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:31:27 +0100
Message-ID: <20251211193127.1099927-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251207150611.2882304-1-thomas.petazzoni@bootlin.com>
References: <20251207150611.2882304-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1765481489; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=xrdUykbsc17bZpy6RiUibbcEG8z6MxWiq51reqMQ3Vk=;
 b=UZwfjSui2Cx46SCp/pJBI3rxmUq3GQGe2myqn/VCmkLO4OaRPWFJW2OTqZji5HZK4PzphC
 6mi4399X4y+o2CSESHkrhzseTn+UTLkTgu69eaT0JMyDRY0pK/F4Azdwx/BKEDHaWmCFJH
 PJPhQHNA1xPrVR10f94WFYG/tgkKTqc3fDqNJrxdeuGA9gS1WIhiiHrfBYoQIVqreB5Jxp
 3JVxKL9nEVTkKrQOVL5K5dQWPvyYZeKNi9v9a9hmh5ZuRcfPmwo4Gmc9FlR6EwVK2YQ28x
 6f2AlNBEVzoKbYlGaUxg/h+Wwd7fGIAUt9Qc1bs8gfutWZM/hvmS9fpT8WSPAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=UZwfjSui
Subject: Re: [Buildroot] [PATCH] package/glibc: use DESTDIR instead of
 install_root to fix build issue
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
> Building a simple configuration such as:
> 
> BR2_aarch64=y
> BR2_FORCE_HOST_BUILD=y
> 
> Under our reference Docker container, as an out-of-tree build:
> 
> ./utils/docker-run make O=output-test
> 
> will fail during the glibc staging installation step with:
> 
> /usr/bin/install -c -m 644 /home/thomas/buildroot/br/output-glibc/build/glibc-2.42-3-gbc13db73937730401d592b33092db6df806d193e/build/libc.a /usr/lib64/libc.a
> /usr/bin/install: cannot create regular file '/usr/lib64/libc.a': Permission denied
> 
> The problem being that the install_root variable is for some reason
> lost along the way. We definitely pass it during the staging
> installation step, but then glibc calls a sub-make and in that
> submake, install_root is empty.
> 
> Observations:
> 
> - Building the same configuration inside the Docker container, but
>   in-tree, doesn't exhibit the problem.
> 
> - Building outside of the Docker container, but with the same make
>   version as the one we build due to BR2_FORCE_HOST_BUILD=y doesn't
>   exhibit the problem.
> 
> However, it turns out that glibc sets install_root to $(DESTDIR). And
> passing DESTDIR just works. So we drop our custom
> GLIBC_INSTALL_STAGING_OPTS to rely on the default one, and this fixes
> the problem. It's not extremely satisfying to not fully understand
> what's going on, but after spending quite some time on this, and
> having a trivial and actually pretty nice workaround, we simply
> propose to use this solution.
> 
> There is no autobuilder issue as we're not using our Docker container
> to do autobuild builds.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/glibc/glibc.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index b0fa66218a..a7727cbad8 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -60,8 +60,6 @@ GLIBC_SUBDIR = build
>  
>  GLIBC_INSTALL_STAGING = YES
>  
> -GLIBC_INSTALL_STAGING_OPTS = install_root=$(STAGING_DIR) install
> -
>  # Thumb build is broken, build in ARM mode
>  ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
>  GLIBC_EXTRA_CFLAGS += -marm
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
