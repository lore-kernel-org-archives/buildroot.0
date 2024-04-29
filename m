Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158FEC4345F
	for <buildroot@archiver.kernel.org>; Mon, 29 Apr 2024 12:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D344B605E7;
	Mon, 29 Apr 2024 12:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kmfnPJ6kv75g; Mon, 29 Apr 2024 12:07:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E15D9607A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E15D9607A4;
	Mon, 29 Apr 2024 12:07:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79FCC1BF312
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 12:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6635281EA3
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 12:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id npwmbYuyjp-T for <buildroot@lists.busybox.net>;
 Mon, 29 Apr 2024 12:07:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DDE0980BCE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDE0980BCE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDE0980BCE
 for <buildroot@busybox.net>; Mon, 29 Apr 2024 12:07:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D4B5613F8B3;
 Mon, 29 Apr 2024 14:07:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 29 Apr 2024 14:07:07 +0200
Date: Mon, 29 Apr 2024 14:07:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <Zi-Na0VQt8tjgW-6@landeda>
References: <20240422073839.12672-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240422073839.12672-1-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714392430;
 bh=hisFJ0mWFk/+kepaC9hFtChfjoY5ggxICVFZTr4pKU8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=suHeaUnmAYLdtKdd+YftpAnO+TJqQ3HROjDQhoJsEX8pwOB6DSDuVqVYCx76u4Sro
 z+tz9vQLhnt2mSdP4QGfljGQYvCjhzwKFnTxIPZEC4Y1r7qlyd4dVfhptJgAWbDa+f
 DD1IdtvH7sQxOHU7EUfFy9Yp7XsgRBjeokTdxlOdF3fuVGJUkAAdJkc4ONTeLyZzJ+
 Jj87hj5TfwpXAVNoEESef1LPW9CfeQ5KMBy41xvF4GktBmCzcvV1vue8IaWjDaOUCg
 WLumGe8JdtNMXLQFXiUXGbHjN06OfT2rlmVLVC0lUfJ/8ti5ch16+Njv7n6nhAU/dv
 jxO8tq6bQKcVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=suHeaUnm
Subject: Re: [Buildroot] [PATCH v1] package/speechd: set CPE_ID_VENDOR (to
 silence mismatched CVE warning)
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-04-22 09:38 +0200, Peter Seiderer via buildroot spake thusly:
> - set CPE_ID_VENDOR to silence mismatched CVE-2001-0956 ([1], [2]) warning
>   clearly aiming some other product/version ("speechd 0.54 with Festival or
>   rsynth speech synthesis package")
> 
> [1] https://security-tracker.debian.org/tracker/CVE-2001-0956
> [2] https://github.com/advisories/GHSA-67cw-4jhh-3jm7
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/speechd/speechd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
> index 7d50f88c1d..669bec0634 100644
> --- a/package/speechd/speechd.mk
> +++ b/package/speechd/speechd.mk
> @@ -8,6 +8,7 @@ SPEECHD_VERSION = 0.11.5
>  SPEECHD_SITE = $(call github,brailcom,speechd,$(SPEECHD_VERSION))
>  SPEECHD_LICENSE = GPL-2.0+, GPL-3.0+ (buildsystem), LGPL-2.1+
>  SPEECHD_LICENSE_FILES = COPYING.GPL-2 COPYING.GPL-3 COPYING.LGPL
> +SPEECHD_CPE_ID_VENDOR = brailcom
>  SPEECHD_INSTALL_STAGING = YES
>  # speechd source code is released without configure script
>  SPEECHD_AUTORECONF = YES
> -- 
> 2.44.0
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
