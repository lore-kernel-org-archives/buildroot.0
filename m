Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4472C5AD49
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 17:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58792409B0;
	Sun,  8 Jun 2025 17:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxcBX2-o86kb; Sun,  8 Jun 2025 17:21:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80C34409AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80C34409AD;
	Sun,  8 Jun 2025 17:21:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F49E1F2
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 17:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8680660E9D
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 17:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mYkotcSB26zo for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 17:21:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A6644605CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6644605CB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6644605CB
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 17:21:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 908DE19F54D;
 Sun,  8 Jun 2025 19:21:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 08 Jun 2025 19:21:31 +0200
Date: Sun, 8 Jun 2025 19:21:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <aEXGm8MHcqJ9MTPV@landeda>
References: <20250608105628.13576-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250608105628.13576-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749403304;
 bh=9w09Bo/cvmpeFnY53dd9bbj3dCjUCBUWamfpxphfq0M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kQEtLoF5M3VhQk7VMO54vACw8j5PwMWrji0LPaQP+Fxbu8DWyYijd3iYBBGsCFBJP
 ShgJSgbTNMB/hLFFbLFzuc5MxhS7/y3jbqn4Ak2msVrFc6gPxWNoSSwchb4zYl1mHz
 P/fMTE3X3u4/rO0Twq5g1obyQ8TkmQnah/QPPdeHaQVt5l87Z+wGxgAKhm0/kCsBVr
 tLDMKpyZSwQ4mvsEtduJYDaqjwvfLHfCE4RP5ZA9GOVu+SBzOpJB1z535UcYIol4vX
 6iu8X52PStbIMi3OA2kEDcAjdiecvDzp0/pX0iWd8hZWjYJuCcz7p3xJPpqe2uODj9
 lY7d2vZconCaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kQEtLoF5
Subject: Re: [Buildroot] [PATCH 1/1] system/Config.in: add missing MMU
 dependency for catatonit
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2025-06-08 12:56 +0200, Julien Olivain spake thusly:
> BR2_INIT_CATATONIT config, introduced in Buildroot commit [1] selects
> BR2_PACKAGE_CATATONIT but forgot to propagate the MMU dependency.
> 
> This commit fixes that.
> 
> Fixes:
> 
>     WARNING: unmet direct dependencies detected for BR2_PACKAGE_CATATONIT
>       Depends on [n]: BR2_USE_MMU [=n]
>       Selected by [y]:
>       - BR2_INIT_CATATONIT [=y] && <choice>
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/6dc177bee8b7fe1ae1607bd7c0819b0dc63397d7
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Thanks!

Regards,
Yann E. MORIN.

> ---
>  system/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 8ff6c7213e..da9e20a35c 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -151,6 +151,7 @@ comment "Special purpose (read help)"
>  
>  config BR2_INIT_CATATONIT
>  	bool "catatonit"
> +	depends on BR2_USE_MMU # catatonit
>  	select BR2_PACKAGE_CATATONIT
>  	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
>  	help
> -- 
> 2.49.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
