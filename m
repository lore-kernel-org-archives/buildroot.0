Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C39C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 16:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27315416DB;
	Wed,  1 May 2024 16:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jTTk9xGCHkU; Wed,  1 May 2024 16:27:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 044F6416DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 044F6416DF;
	Wed,  1 May 2024 16:27:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 793CD1BF28C
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 16:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6485981FC2
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 16:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wFPWmSD2Gx0f for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 16:27:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D0D781FB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D0D781FB6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D0D781FB6
 for <buildroot@buildroot.org>; Wed,  1 May 2024 16:27:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B34BB13F899;
 Wed,  1 May 2024 18:27:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 May 2024 18:27:22 +0200
Date: Wed, 1 May 2024 18:27:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZjJtakh3yfIwXOhG@landeda>
References: <20240501150042.281549-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501150042.281549-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714580844;
 bh=5Tn46w4DgzRd6fRLUxYnb22R8r2T5RaHNQohAKR4XiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gkWdJ3zw6eaTeluhX7KlDQxmhtgqcvcuPHLR2blAAEyys1jEbjHGW6IeAMqPSGcei
 Of9O0GWm3BtaTYEQXpliBTLgF8p+fekqnGbtB9dbSbw/sPZD77ULRMLbptyF1WyDFZ
 x7QTWYG4U4vNe+TTpj1o8BoUmJa5QxBYczUcExhkEBO2Lc4grHChS8MWrd1/9SsI6P
 Gqw2Qbr/rEeAcVTtbwQfYuO+8nMWse/kHSyEaHBgw1TRb4TbY2QttBlBVfndYu0Wmc
 vhkjrMjB9fKsnxFwL6SUMWdScdFi7RHH+NS0IHSTz3Vzs0VCfbYEldIhoEFel7PXoU
 3hxytnfoevlrw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gkWdJ3zw
Subject: Re: [Buildroot] [PATCH 1/1] package/asterisk: fix uclibc-ng build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-05-01 17:00 +0200, Fabrice Fontaine spake thusly:
> Fix the following uclibc-ng build failure raised since bump to version
> 20.7.0 in commit 0e6d4d2171ce70d3aa6693f860a36ff08fc4d2b3 and
> https://github.com/asterisk/asterisk/commit/2694792e13c7f3ab1911c4a69fba0df32c544177:
> 
> stasis/control.c: In function 'exec_command_on_condition':
> stasis/control.c:313:3: warning: implicit declaration of function 'pthread_kill'; did you mean 'pthread_yield'? [-Wimplicit-function-declaration]
>   313 |   pthread_kill(control->control_thread, SIGURG);
>       |   ^~~~~~~~~~~~
>       |   pthread_yield
> stasis/control.c:313:41: error: 'SIGURG' undeclared (first use in this function)
>   313 |   pthread_kill(control->control_thread, SIGURG);
>       |                                         ^~~~~~
> 
> Fixes: 0e6d4d2171ce70d3aa6693f860a36ff08fc4d2b3
>  - http://autobuild.buildroot.org/results/d16e4ca4bd26234f84d17da24c04a8c19faba6c5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...es-stasis-control.c-include-signal.h.patch | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/asterisk/0005-res-stasis-control.c-include-signal.h.patch
> 
> diff --git a/package/asterisk/0005-res-stasis-control.c-include-signal.h.patch b/package/asterisk/0005-res-stasis-control.c-include-signal.h.patch
> new file mode 100644
> index 0000000000..fc615c4a19
> --- /dev/null
> +++ b/package/asterisk/0005-res-stasis-control.c-include-signal.h.patch
> @@ -0,0 +1,43 @@
> +From 8391dc3891337ecff8becefe1927a30d3922b848 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Wed, 1 May 2024 16:50:50 +0200
> +Subject: [PATCH] res/stasis/control.c: include signal.h
> +
> +Include signal.h to avoid the following build failure with uclibc-ng
> +raised since
> +https://github.com/asterisk/asterisk/commit/2694792e13c7f3ab1911c4a69fba0df32c544177:
> +
> +stasis/control.c: In function 'exec_command_on_condition':
> +stasis/control.c:313:3: warning: implicit declaration of function 'pthread_kill'; did you mean 'pthread_yield'? [-Wimplicit-function-declaration]
> +  313 |   pthread_kill(control->control_thread, SIGURG);
> +      |   ^~~~~~~~~~~~
> +      |   pthread_yield
> +stasis/control.c:313:41: error: 'SIGURG' undeclared (first use in this function)
> +  313 |   pthread_kill(control->control_thread, SIGURG);
> +      |                                         ^~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/d16e4ca4bd26234f84d17da24c04a8c19faba6c5
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/asterisk/asterisk/pull/728
> +---
> + res/stasis/control.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/res/stasis/control.c b/res/stasis/control.c
> +index 360f20790..4ed0e2af1 100644
> +--- a/res/stasis/control.c
> ++++ b/res/stasis/control.c
> +@@ -41,6 +41,8 @@
> + #include "asterisk/musiconhold.h"
> + #include "asterisk/app.h"
> + 
> ++#include <signal.h>
> ++
> + AST_LIST_HEAD(app_control_rules, stasis_app_control_rule);
> + 
> + /*!
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
