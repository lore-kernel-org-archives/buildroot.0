Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262F9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 11:29:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0906611F0
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 11:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0906611F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9912402BA;
	Sun, 19 Sep 2021 11:29:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DRAAgf3KX0w9; Sun, 19 Sep 2021 11:29:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00F434024A;
	Sun, 19 Sep 2021 11:29:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22DE01BF2BF
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 11:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1233983B10
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 11:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id twHFDXMmHhDV for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 11:29:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E97483AF0
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 11:29:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:35ad:6fdd:a5c5:c816])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 8E51B20039C;
 Sun, 19 Sep 2021 13:29:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632050969;
 bh=3VfqIPqWCvw4U7+W1nUbfUKCRn+n0YjwcZ3gBt1thVU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ceFNbf3iH3VADl5l7b5/icq0989C5W7RtDtoe1aymuItLDSGseDYdnwqkN32JSSFO
 ON7Vs/oKc00cq0GZTeAeEhDwF9bTEALqapj/z1DJQlAcz7MyD0QOK9Hhy1hzYCLzKK
 ycKGONK+niTFWef2Yjgd63s3QvXOXJKgsd71xgS5R/ktH3bfc9XtHn+P9KCJaGnZO8
 zFm1UAJZ0ct7LZJSMwXWHMTZjnIvhcBHy2CYRYWUoznIE96Koyaw09m69oEy5NQSBr
 K8oH/vZ6oUTGWFzcL9OT9pEW0PmuVpmwgq7vEz6iWE9814GFh9m04yQ33WAtbW1zQM
 8nrf1HiwIZAXw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Sep 2021 13:29:23 +0200
Date: Sun, 19 Sep 2021 13:29:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210919112923.GQ1053080@scaer>
References: <20210919095343.2057376-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210919095343.2057376-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/cppzmq: bump to version 4.8.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-19 11:53 +0200, Fabrice Fontaine spake thusly:
> https://github.com/zeromq/cppzmq/releases/tag/v4.8.1
> https://github.com/zeromq/cppzmq/releases/tag/v4.8.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cppzmq/cppzmq.hash | 2 +-
>  package/cppzmq/cppzmq.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cppzmq/cppzmq.hash b/package/cppzmq/cppzmq.hash
> index 4fd07b4052..31b93275df 100644
> --- a/package/cppzmq/cppzmq.hash
> +++ b/package/cppzmq/cppzmq.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  9853e0437d834cbed5d3c223bf1d755cadee70e7c964c6e42c4c6783dee5d02c  cppzmq-4.7.1.tar.gz
> +sha256  7a23639a45f3a0049e11a188e29aaedd10b2f4845f0000cf3e22d6774ebde0af  cppzmq-4.8.1.tar.gz
>  sha256  7e6db90e2e805c72b3daa77849d1cb5f1f92da0e69750c8a4aa1d86d70704748  LICENSE
> diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
> index ccab92e2ef..570ad4e3a3 100644
> --- a/package/cppzmq/cppzmq.mk
> +++ b/package/cppzmq/cppzmq.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CPPZMQ_VERSION = 4.7.1
> +CPPZMQ_VERSION = 4.8.1
>  CPPZMQ_SITE = $(call github,zeromq,cppzmq,v$(CPPZMQ_VERSION))
>  CPPZMQ_INSTALL_STAGING = YES
>  CPPZMQ_DEPENDENCIES = host-pkgconf zeromq
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
