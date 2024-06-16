Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7645C27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 20:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B9D8404B6;
	Sun, 16 Jun 2024 20:42:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Srn0ljdRcVka; Sun, 16 Jun 2024 20:42:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1B4E40153
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1B4E40153;
	Sun, 16 Jun 2024 20:42:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA95E1BF2BB
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 20:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4F1C607F8
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 20:42:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIpPbNMCpWSo for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 20:42:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B84FD606BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B84FD606BE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B84FD606BE
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 20:42:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0023913F81D;
 Sun, 16 Jun 2024 22:42:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Jun 2024 22:42:09 +0200
Date: Sun, 16 Jun 2024 22:42:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zm9OIWTBGxmOJnp1@landeda>
References: <20240616124322.692320-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240616124322.692320-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718570533;
 bh=DEedbkR2qP+mh21yZqUKPp4f2VFDs83AkNBwxsz4yt4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l72vtz0bmBUP+QfOo+RojzGiySbfNrRjedwLrNllcRgtEi6rFu+2sz9PdkBfujEDR
 4gOKaUXsnRRsf0gaSC//gmGIf7lU5KbUu56Gl5n52sslzqC4HkRFRxO8RqMrM/axZH
 qnOQzuYfVjqEb70qxsIEzWAhCqjrvuS0wkL0Z6famlCQBqU1YujsdA/l8GAAEd9G12
 9HoQWiXdqX2SvUjwM9k/5e+oFXUghi7REd6e1XwqB21VrHYD45UwVl/4zafJC1X2e1
 XzyEfcV7htQWtKWS+wLbMTgmWqmXP6WWEtp1QzAD8YCCm55cTZeOdKScHUiBRtxrpl
 1tn0/gKoBj+Lg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l72vtz0b
Subject: Re: [Buildroot] [PATCH 1/2] package/glibc: drop ignores for 2.38
 specific CVEs
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-06-16 14:43 +0200, Peter Korsgaard spake thusly:
> Commit b5680f53d60 (package/glibc: bump to 2.39) forgot to drop the ignores
> for the 2.38 specific CVEs.  Do that now.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/glibc/glibc.mk | 28 ----------------------------
>  1 file changed, 28 deletions(-)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 96a850516f..8bc4cd4666 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -24,34 +24,6 @@ GLIBC_CPE_ID_VENDOR = gnu
>  # allow proper matching with the CPE database.
>  GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
>  
> -# Fixed by b25508dd774b617f99419bdc3cf2ace4560cd2d6, which is between
> -# 2.38 and the version we're really using
> -GLIBC_IGNORE_CVES += CVE-2023-4527
> -
> -# Fixed by 5ee59ca371b99984232d7584fe2b1a758b4421d3, which is between
> -# 2.38 and the version we're really using
> -GLIBC_IGNORE_CVES += CVE-2023-4806
> -
> -# Fixed by 750a45a783906a19591fb8ff6b7841470f1f5710, which is between
> -# 2.38 and the version we're really using.
> -GLIBC_IGNORE_CVES += CVE-2023-4911
> -
> -# Fixed by 5ee59ca371b99984232d7584fe2b1a758b4421d3, which is between
> -# 2.38 and the version we're really using.
> -GLIBC_IGNORE_CVES += CVE-2023-5156
> -
> -# Fixed by 23514c72b780f3da097ecf33a793b7ba9c2070d2, which is between
> -# 2.38 and the version we're really using.
> -GLIBC_IGNORE_CVES += CVE-2023-6246
> -
> -# Fixed by d0338312aace5bbfef85e03055e1212dd0e49578, which is between
> -# 2.38 and the version we're really using.
> -GLIBC_IGNORE_CVES += CVE-2023-6779
> -
> -# Fixed by d37c2b20a4787463d192b32041c3406c2bd91de0, which is between
> -# 2.38 and the version we're really using.
> -GLIBC_IGNORE_CVES += CVE-2023-6780
> -
>  # All these CVEs are considered as not being security issues by
>  # upstream glibc:
>  #  https://security-tracker.debian.org/tracker/CVE-2010-4756
> -- 
> 2.39.2
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
