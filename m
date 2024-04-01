Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938C7CD1288
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 12:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 267C081ECA;
	Mon,  1 Apr 2024 12:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q729PN5lREPN; Mon,  1 Apr 2024 12:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 309F481ECB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 309F481ECB;
	Mon,  1 Apr 2024 12:51:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72A8C1BF2CD
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E80C81ECB
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 12:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fv4xrhLYfH9L for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 12:51:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 62CC881ECA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62CC881ECA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 62CC881ECA
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 12:51:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 08A2313F88D;
 Mon,  1 Apr 2024 14:51:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Apr 2024 14:51:24 +0200
Date: Mon, 1 Apr 2024 14:51:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZgqtzGhVotriobuH@landeda>
References: <20240331100955.793371-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240331100955.793371-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711975888;
 bh=YNJGRSGUcXy2Qp72FFbWtBE8mwWffTzIrtjGuYpUbhg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c+VXrDganyutc0J2ZnahZAe23D1JEAEeLZ+e1pqNpl6BuMlFv1QXwE+DdCjSeYRdP
 ybFA9inYukWo2IZghA5xXXrV0DYDp7qZau4hMyqtwCVjVWvOFFDGmwPiMjuXYnX2A/
 OMdQuYvjzQnZPIiNUPfjwXAmiTShoZPNVuMbDMm0aoL/vx1HR7ypcFEGIuLYpiM6c/
 Wqz9Vy6jfl4S6VLit3PZeI9uRdLhLBa7kqx/BZM0YrvLTq4Iv7ENvh5eADB7sITJul
 pPv1wYtCoE9jtY4Qs7wC5oIG7Eomio+fYSr2NpdPCJfX9mFX6Dndrw+6anNlXg/h39
 v5e+ZTQDUO68g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c+VXrDga
Subject: Re: [Buildroot] [PATCH 1/1] package/igt-gpu-tools: disable tests
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-03-31 12:09 +0200, Fabrice Fontaine spake thusly:
> Disable tests to avoid the following build failure raised since the
> addition of the package in commit
> d8a729d1731339da141612be33c5e59bc9928748:
> 
> ../tests/intel/kms_pm_backlight.c: In function '__igt_unique____real_main257':
> ../tests/intel/kms_pm_backlight.c:320:32: error: implicit declaration of function 'basename'; did you mean 'rename'? [-Werror=implicit-function-declaration]
>   320 |                         name = basename(full_name);
>       |                                ^~~~~~~~
>       |                                rename
> 
> Fixes: d8a729d1731339da141612be33c5e59bc9928748
>  - http://autobuild.buildroot.org/results/ff5de58ca9408f3a4fc6b6d5bd8c62093c1021ad
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/igt-gpu-tools/igt-gpu-tools.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
> index 927a1225a5..5250950ee4 100644
> --- a/package/igt-gpu-tools/igt-gpu-tools.mk
> +++ b/package/igt-gpu-tools/igt-gpu-tools.mk
> @@ -10,6 +10,7 @@ IGT_GPU_TOOLS_SITE = https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/archive/
>  IGT_GPU_TOOLS_LICENSE = MIT
>  IGT_GPU_TOOLS_LICENSE_FILES = COPYING
>  IGT_GPU_TOOLS_INSTALL_STAGING = YES
> +IGT_GPU_TOOLS_CONF_OPTS = -Dtests=disabled
>  IGT_GPU_TOOLS_DEPENDENCIES = \
>  	host-pkgconf \
>  	cairo \
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
