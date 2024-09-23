Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F9ECF9C6F
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 19:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A7B6401D5;
	Mon, 23 Sep 2024 19:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mMV84F2BI_na; Mon, 23 Sep 2024 19:13:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AE3640209
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AE3640209;
	Mon, 23 Sep 2024 19:13:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EA431BF3C3
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 19:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B2CC81292
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 19:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IbzlfD-Y72TK for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 19:13:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 09CC4811A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09CC4811A9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09CC4811A9
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 19:13:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0D9945FFBA;
 Mon, 23 Sep 2024 21:13:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 21:13:11 +0200
Date: Mon, 23 Sep 2024 21:13:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZvG9x-0tfj5eik1o@landeda>
References: <20240923170636.3757575-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240923170636.3757575-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727118795;
 bh=zd6DMl3H6+14pmjO7F1H4Nhv5/cHnehZhQtufJ4LsiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d0aBIPUwGE/cMcIODr0kxLMWZHase75BU4kGAoJo/3PEX6pde537avT/tV9KCr1Gu
 6in+SQTWKlyW1KUJIMhM+6y6YCn0ECaCxrZua691yUWNwHbg2n9l/JlGKUpxfr4DEa
 Y1UNQrcTOQFA0CczOjUeiFBSHO2y1LH7jwTkiL2BNDw/8E8BqTjUTdOrojiMnE8Plk
 OqfBE2AqizbwKnUzSR468zGtcyW737j470ts6ZDsHv5xjxTXlaboWCd4bkyu748qKj
 JYv+AzMtGFx29zlA+3mDxiajwGX1z/KiMISjqK6cJpw9mq1gOEjCUU95XlRvCGnkzN
 pvMlezPhPpB/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=d0aBIPUw
Subject: Re: [Buildroot] [PATCH 1/1] package/busybox: patch to fix tc build
 on 6.8+ kernels
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
Cc: Un1q32 <joey.t.reinhart@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2024-09-23 19:06 +0200, Bernd Kuhls spake thusly:
> Fixes a build error introduced by bumping the linux kernel headers to
> 6.8 with buildroot commit 807a44925697b9567d5bd9872a334a073b3dcf55.
> 
> No autobuilder failures were recorded with this problem.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Follow-up of
> https://patchwork.ozlabs.org/project/buildroot/patch/20240823090939.79455-1-joey.t.reinhart@gmail.com/
> 
>  ...emoved-the-definitions-related-to-CB.patch | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 package/busybox/0010-Linux-v6.8-rc1-removed-the-definitions-related-to-CB.patch
> 
> diff --git a/package/busybox/0010-Linux-v6.8-rc1-removed-the-definitions-related-to-CB.patch b/package/busybox/0010-Linux-v6.8-rc1-removed-the-definitions-related-to-CB.patch
> new file mode 100644
> index 0000000000..d997f00e82
> --- /dev/null
> +++ b/package/busybox/0010-Linux-v6.8-rc1-removed-the-definitions-related-to-CB.patch
> @@ -0,0 +1,70 @@
> +From c4f93565acf3718111cdbaea15e1a8aacf2f44cf Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
> +Date: Mon, 23 Sep 2024 18:56:00 +0200
> +Subject: [PATCH] tc: Fix compilation with Linux v6.8-rc1
> +
> +Linux v6.8-rc1 removed the definitions related to CBQ:
> +https://github.com/torvalds/linux/commit/33241dca486264193ed68167c8eeae1fb197f3df
> +making tc fail to build.
> +Add some #ifdefs to handle this missing support.
> +
> +Upstream: http://lists.busybox.net/pipermail/busybox/2024-March/090678.html
> +Bug report: https://bugs.busybox.net/show_bug.cgi?id=15931
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + networking/tc.c | 12 ++++++++++++
> + 1 file changed, 12 insertions(+)
> +
> +diff --git a/networking/tc.c b/networking/tc.c
> +index 3a79fd2d9..d08fd1359 100644
> +--- a/networking/tc.c
> ++++ b/networking/tc.c
> +@@ -231,6 +231,13 @@ static int cbq_parse_opt(int argc, char **argv, struct nlmsghdr *n)
> + 	return 0;
> + }
> + #endif
> ++
> ++#ifndef TCA_CBQ_MAX
> ++/*
> ++ * Linux v6.8-rc1~131^2~60^2^2 removed the uapi definitions for CBQ.
> ++ * See https://git.kernel.org/linus/33241dca48626
> ++ */
> ++#else
> + static int cbq_print_opt(struct rtattr *opt)
> + {
> + 	struct rtattr *tb[TCA_CBQ_MAX+1];
> +@@ -322,6 +329,7 @@ static int cbq_print_opt(struct rtattr *opt)
> +  done:
> + 	return 0;
> + }
> ++#endif
> + 
> + static FAST_FUNC int print_qdisc(
> + 		const struct sockaddr_nl *who UNUSED_PARAM,
> +@@ -372,8 +380,10 @@ static FAST_FUNC int print_qdisc(
> + 		int qqq = index_in_strings(_q_, name);
> + 		if (qqq == 0) { /* pfifo_fast aka prio */
> + 			prio_print_opt(tb[TCA_OPTIONS]);
> ++#ifdef TCA_CBQ_MAX
> + 		} else if (qqq == 1) { /* class based queuing */
> + 			cbq_print_opt(tb[TCA_OPTIONS]);
> ++#endif
> + 		} else {
> + 			/* don't know how to print options for this qdisc */
> + 			printf("(options for %s)", name);
> +@@ -442,9 +452,11 @@ static FAST_FUNC int print_class(
> + 		int qqq = index_in_strings(_q_, name);
> + 		if (qqq == 0) { /* pfifo_fast aka prio */
> + 			/* nothing. */ /*prio_print_opt(tb[TCA_OPTIONS]);*/
> ++#ifdef TCA_CBQ_MAX
> + 		} else if (qqq == 1) { /* class based queuing */
> + 			/* cbq_print_copt() is identical to cbq_print_opt(). */
> + 			cbq_print_opt(tb[TCA_OPTIONS]);
> ++#endif
> + 		} else {
> + 			/* don't know how to print options for this class */
> + 			printf("(options for %s)", name);
> +-- 
> +2.39.5
> +
> -- 
> 2.39.5
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
