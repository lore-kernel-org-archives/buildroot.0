Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8765BC432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 13:25:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 229D4600AA
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 13:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 229D4600AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6F0D600B5;
	Sat, 28 Aug 2021 13:25:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jKy83ie-D_TZ; Sat, 28 Aug 2021 13:25:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADE0E60653;
	Sat, 28 Aug 2021 13:25:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B0FC1BF30D
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 13:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08E5D426A6
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 13:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YQjQ9UiVnFAC for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 13:25:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 915244070E
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 13:25:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c0ce:7c4d:7a73:f3f6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 16CA6780333;
 Sat, 28 Aug 2021 15:25:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630157142;
 bh=jJhNg+dGNDOxRf9q7l0+HmzfvoF6n980xLQ9PpCY4Ac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LWKNtnwytIx7vmMDjn7zl6AuMM/GZrpwi9AzOCxWt6xSd/qx21ryRCfYU5jHNWZsN
 RERv4ygl5FnGNX0M/3sG9zBg9i3IUVGAITPfhzksKutImphCwwEULAQmuTeQSdX7uj
 ppCBaRRRlkAjfKqkLeBM5HhBXTptCovMe+7wOmYKEV8gVOjotclHA0/QcN6yg1KB9L
 Dcgi3kSxGnhsotUJrS2/jcLb45l4DZc9BDi1ogdGR84x6YKcMjQUEmy1PywBfXlBYm
 ItpUlGPFjXIrzZbd79sdtTMeV3Sw0Z9EH+pfYZRA3eXCmgGPqp+fDExPq2sWD5du5h
 yJwcifxrtjs0g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Aug 2021 15:25:37 +0200
Date: Sat, 28 Aug 2021 15:25:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210828132537.GJ2661@scaer>
References: <20210828105807.781836-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210828105807.781836-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH/next 1/1] package/boost: fix sparc build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-28 12:58 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure on sparc raised since bump to version
> 1.77.0 in commit d39d8f7cee9b4634e6f490020204f63fae419e8e:
> 
> ./boost/predef/architecture/sparc.h:37:38: error: missing ')' in expression
>    37 | #   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv9) || defined(__sparc_v9__)
>       |                                      ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c1f15e3a0cefb7e65e5288fb4564d59a3b06a0bd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../boost/0001-added-missing-brackets.patch   | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/boost/0001-added-missing-brackets.patch
> 
> diff --git a/package/boost/0001-added-missing-brackets.patch b/package/boost/0001-added-missing-brackets.patch
> new file mode 100644
> index 0000000000..1a2d5e67ec
> --- /dev/null
> +++ b/package/boost/0001-added-missing-brackets.patch
> @@ -0,0 +1,29 @@
> +From 1be0e4a2d8db15a405f64a6f65507b87c1be7e1a Mon Sep 17 00:00:00 2001
> +From: tkoecker <tkoecker@gmx.net>
> +Date: Fri, 21 May 2021 16:31:11 +0200
> +Subject: [PATCH] added missing brackets (#118)
> +
> +[Retrieved from:
> +https://github.com/boostorg/predef/commit/1be0e4a2d8db15a405f64a6f65507b87c1be7e1a]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + include/boost/predef/architecture/sparc.h | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/boost/predef/architecture/sparc.h b/boost/predef/architecture/sparc.h
> +index d7b94f0..d01605e 100644
> +--- a/boost/predef/architecture/sparc.h
> ++++ b//boost/predef/architecture/sparc.h
> +@@ -34,10 +34,10 @@ Distributed under the Boost Software License, Version 1.0.
> + 
> + #if defined(__sparc__) || defined(__sparc)
> + #   undef BOOST_ARCH_SPARC
> +-#   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv9) || defined(__sparc_v9__)
> ++#   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv9) || defined(__sparc_v9__))
> + #       define BOOST_ARCH_SPARC BOOST_VERSION_NUMBER(9,0,0)
> + #   endif
> +-#   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv8) || defined(__sparc_v8__)
> ++#   if !defined(BOOST_ARCH_SPARC) && (defined(__sparcv8) || defined(__sparc_v8__))
> + #       define BOOST_ARCH_SPARC BOOST_VERSION_NUMBER(8,0,0)
> + #   endif
> + #   if !defined(BOOST_ARCH_SPARC)
> -- 
> 2.32.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
