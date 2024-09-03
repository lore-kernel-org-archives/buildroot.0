Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2C2CD37B1
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5526740145;
	Tue,  3 Sep 2024 20:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AHBmF-qyjUiU; Tue,  3 Sep 2024 20:52:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DD0440184
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DD0440184;
	Tue,  3 Sep 2024 20:52:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F4281BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48C9240184
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRCRdoid5X-o for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:51:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF87440145
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF87440145
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF87440145
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:51:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 443B213F89C;
 Tue,  3 Sep 2024 22:51:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Sep 2024 22:51:53 +0200
Date: Tue, 3 Sep 2024 22:51:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <Ztd26aIl5GWiW1Vo@landeda>
References: <20240903155622.922284-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240903155622.922284-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725396716;
 bh=5bk8k2H4i1nlXsxJW81hzJUwj9Kx5PYMrAqPb/S6rOQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UYoIkcPext1C1BdRGdogrLZ53RIhVwexfEArdBmG4U3GVjKC+l1dX229uWDprzIeo
 pKRE8IQKR9Lvib7GvPy9vskBHWBmT2Ge80/ro8ImoFyidsMPaijbZxYlcDUy/Bu/M5
 M3+T+YomdlhOH8gxfe/xZDENeOaQqPE62CzdGg2rUjSlIiFTUd2ViZ1gpcpYCFzBM7
 SWOakzaI4TyS/niAq1e+B24iFG/jS5VZ2XWI+BMMxr/79X/gSgQPlDfJ/cq1Cp9s+d
 xAvho3xcnzReI8G34gt1Rj8v5Xrj0XDSn/W0DjvlBvaXsKYXtlq2+LbsFn0u0JjwzK
 JBuYqsZPbU3zQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UYoIkcPe
Subject: Re: [Buildroot] [PATCH 1/1] package/cache-calibrator: fix build
 failure for implicit declaration
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
Cc: Stephan Hoffmann <sho@relinux.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-09-03 17:56 +0200, Dario Binacchi spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/db996c894c810ff5c7f4263975d1def0edef6d55
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...e-due-to-getpagesize-implicit-declar.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/cache-calibrator/0002-Fix-build-failure-due-to-getpagesize-implicit-declar.patch
> 
> diff --git a/package/cache-calibrator/0002-Fix-build-failure-due-to-getpagesize-implicit-declar.patch b/package/cache-calibrator/0002-Fix-build-failure-due-to-getpagesize-implicit-declar.patch
> new file mode 100644
> index 000000000000..fcad6694816e
> --- /dev/null
> +++ b/package/cache-calibrator/0002-Fix-build-failure-due-to-getpagesize-implicit-declar.patch
> @@ -0,0 +1,33 @@
> +From 29c4e0038b212e953cc59ac8b31d4541db758a3d Mon Sep 17 00:00:00 2001
> +From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Date: Tue, 3 Sep 2024 17:43:44 +0200
> +Subject: [PATCH] Fix build failure due to getpagesize implicit declaration
> +
> +The patch fixes the following build error:
> +
> +calibrator.c: In function 'runCache':
> +calibrator.c:267:24: error: implicit declaration of function 'getpagesize' [-Wimplicit-function-declaration]
> +
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Upstream: sent to Stefan Manegold Stefan.Manegold@cwi.nl
> +---
> + calibrator.c | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/calibrator.c b/calibrator.c
> +index e045dfdcb96b..fd2fadb26020 100644
> +--- a/calibrator.c
> ++++ b/calibrator.c
> +@@ -37,9 +37,7 @@
> +  * THE POSSIBILITY OF SUCH DAMAGE.
> +  */
> + 
> +-/*
> + #include        <unistd.h>
> +-*/
> + #include        <stdlib.h>
> + #include	<stdio.h>
> + #include	<math.h>
> +-- 
> +2.43.0
> +
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
