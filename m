Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0EDD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7940D80D62;
	Wed,  7 Jan 2026 17:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iuI3wCkzUgyH; Wed,  7 Jan 2026 17:55:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 911DB80E5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808530;
	bh=VHuzR+XA1xuu/kUcOHLCD8wf2RExLlmpjxW85+4BdhE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i/8fMIBJazYAoRoR/VnVc4tX1Dn6QQxsHEnwrmptGDxVh3hj5P0i48rASgbuUXrZX
	 qyLtjazHP3PkHFlmHkuq1Vub2vyoR0IMqfZPRKELAf3Enrx392ymePxhkzyXxd55Sa
	 LGM9VcS3zST3ZVaR0Vzn+apSqS6mKvvdPTAsvG8V1rfW1LCeBvpS9NT7xkKWA2Q/on
	 W7pBHp5qPd7LVBRYRfCx7b1YMRTerXbw+U1y3c2IiceYtjziBMygvQXqQgMc5I0KUD
	 tc4sTBAVQ7ibWYxxhDz+gRMBIOdcY5XAfLzT7F7NLyNikgmYNxXD+beuOsqWowvUc+
	 99mJCsrJGiunQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 911DB80E5D;
	Wed,  7 Jan 2026 17:55:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84DFE9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76CC74105A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y2__GEeG-Zt9 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:55:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A9F54104C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A9F54104C
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A9F54104C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:55:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 65768B97A704; Wed,  7 Jan 2026 18:55:25 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:55:22 +0100
Message-ID: <20260107175522.229938-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206131730.697201-1-bernd@kuhls.net>
References: <20251206131730.697201-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808525; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=GS5tt92RKuOs0JlmATdjyG0MlqS8HUl44s1orutTI0I=;
 b=pDpsfsGPXdEWTWWSQd6Fzp0jNOVH3OjuIHxUAqfW6V/vR7vFs07XTIEtBV0Zfa5j5/G89r
 N9hxkJzupjIYRKFvMdzRPO+fGZxi3OK8XDu+/Sbe7Qt/De/SJ1LVMnUALTtKXBMC/eWkFn
 LC414bRUjKuHT25vsHdnptFQUMkHZ9739NxzoDLEMXrnpiOdGcRNpwWo55/s94XgDsDmIX
 Z3BmRPzmwG56zkCWUQcnPsbX52grRLZ7fbF6Vq83K8xN6grfv8Ab4hvwjqOKiYe+WTH0M8
 COU6s6Rj8OUKBlIkdK3zdnOA1h6Nsmq6/OUjlUuEE5Pcb+R+4+FaV2gXdNU3FQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=pDpsfsGP
Subject: Re: [Buildroot] [PATCH 1/1] package/v4l2loopback: bump version to
 0.15.3
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
> Changelog:
> https://github.com/v4l2loopback/v4l2loopback/blob/v0.15.3/ChangeLog
> 
> Fixes:
> https://autobuild.buildroot.net/results/910/910e27b189c62f977bc42f7c53471334eb765168/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  package/v4l2loopback/v4l2loopback.hash | 2 +-
>  package/v4l2loopback/v4l2loopback.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/v4l2loopback/v4l2loopback.hash b/package/v4l2loopback/v4l2loopback.hash
> index c7fb226add..12ca4ec6cd 100644
> --- a/package/v4l2loopback/v4l2loopback.hash
> +++ b/package/v4l2loopback/v4l2loopback.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  1e57e1e382d7451aa2a88d63cc9f146eab1f425b90e76104d4c3d73127e34771  v4l2loopback-0.13.2.tar.gz
> +sha256  2758ea287da8dd34a0421c0dd50094a0342d22414e1bbccbbe92f41bbaa26b2d  v4l2loopback-0.15.3.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
> index a4ddf5e2d9..5c3562160f 100644
> --- a/package/v4l2loopback/v4l2loopback.mk
> +++ b/package/v4l2loopback/v4l2loopback.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -V4L2LOOPBACK_VERSION = 0.13.2
> +V4L2LOOPBACK_VERSION = 0.15.3
>  V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,v$(V4L2LOOPBACK_VERSION))
>  V4L2LOOPBACK_LICENSE = GPL-2.0+
>  V4L2LOOPBACK_LICENSE_FILES = COPYING
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
