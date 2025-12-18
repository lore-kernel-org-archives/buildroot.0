Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D678D6E2B0
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18C8F61241;
	Thu, 18 Dec 2025 16:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59JlK4AHI4Ps; Thu, 18 Dec 2025 16:37:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09E5E611B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766075877;
	bh=tqM1debJKEVz6eKcIqpY+Nru6WDNMyTf7Y3pyJWSOEQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jopxf1vwojdrmofxMyMhcy+YDvSmEo/asys8EphBmxA9giqnXLIu4qARY+gGcOwDa
	 1kO4Z3nYVw3ARHD2LuAk2g0uVag1Hu6B/pZw2InL9Mk7JO4GJai9fscwEH/SgWdM3Z
	 Os1OOg4SEshuTtL3lzdIvcE7zm8ell0KTF6dIaLt2BvkQgnScsqrcX0zNkTMDZMfnm
	 nP/1O+377h6LPb5t9yg5zFn2PV+/YfViPaXNXEn+O89mBXOT8pX1+HX7ajF2jDEeRn
	 /xnEdpXIrEp4dBPtbmMbvH91abMqAyfyKebPdVHuvHOKuqCW+6RO1lOJNK3UnP1w31
	 NAt7cPdoTUDAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09E5E611B6;
	Thu, 18 Dec 2025 16:37:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 94F7B361
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A3B383DC8
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vm7jMO3ER_Sg for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:37:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 76E0480BA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76E0480BA7
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76E0480BA7
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:37:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 38A10B97A323; Thu, 18 Dec 2025 17:37:50 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Thu, 18 Dec 2025 17:37:49 +0100
Message-ID: <20251218163749.379769-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208203456.3656837-1-bernd@kuhls.net>
References: <20251208203456.3656837-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075870; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=VXVOUx9hWN8CUrHjFRWuRoG/wkdgjxWAS4Rt8tNE4do=;
 b=MOsuFS9pnzKkYIxMP44/eQNpfjJkS6wUn+oXXhaMVv5vcBvX/Q+q57s6YPOtd8IWbXAKzj
 mz75wd9phUKgRLsj8grm0ktlBbc3riNRmzUQdCv6AsygYC3waxQVLc6sMTao4Nx33ABspl
 b5J95SoV54EymQwtcvtKGLkkgazpL7Q4wHi736ewCSt0PQ9ST5mbL5W8q8lHPdoZIBxLyJ
 m+ZXgb3fJUzAEAgiuIgbx990gPcOAEAR40tzeQPBYZBZEYO0ALJQh2bt7L3Gyy9+xaJwjT
 yLuG1x8W6qcOVoZ1lGZCJBDJXBkn6YThR+ykDhdQ8b0qGyxzNeoL6czKgd5Yfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=MOsuFS9p
Subject: Re: [Buildroot] [PATCH 1/1] package/libxslt: security bump version
 to 1.1.45
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
> Release notes:
> https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.45.news
> 
> Fixes
> CVE-2025-7424, CVE-2025-9714 & CVE-2025-11731.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/libxslt/libxslt.hash | 4 ++--
>  package/libxslt/libxslt.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libxslt/libxslt.hash b/package/libxslt/libxslt.hash
> index 98c68eded1..0523c51362 100644
> --- a/package/libxslt/libxslt.hash
> +++ b/package/libxslt/libxslt.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.43.sha256sum
> -sha256  5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea3303065231a6d403f0183a  libxslt-1.1.43.tar.xz
> +# From https://download.gnome.org/sources/libxslt/1.1/libxslt-1.1.45.sha256sum
> +sha256  9acfe68419c4d06a45c550321b3212762d92f41465062ca4ea19e632ee5d216e  libxslt-1.1.45.tar.xz
>  
>  # Hash for license file:
>  sha256  7e48e290b6bfccc2ec1b297023a1d77f2fd87417f71fbb9f50aabef40a851819  Copyright
> diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
> index e92b383b89..229f3de2f6 100644
> --- a/package/libxslt/libxslt.mk
> +++ b/package/libxslt/libxslt.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBXSLT_VERSION = 1.1.43
> +LIBXSLT_VERSION = 1.1.45
>  LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.xz
>  LIBXSLT_SITE = https://download.gnome.org/sources/libxslt/1.1
>  LIBXSLT_INSTALL_STAGING = YES
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
