Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E93C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 20:03:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81C08611F0
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 20:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81C08611F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D16083F73;
	Fri, 10 Sep 2021 20:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aq2RTZ-tdk1Y; Fri, 10 Sep 2021 20:03:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9796083E99;
	Fri, 10 Sep 2021 20:03:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 080D81BF352
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0476761B93
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 20:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t1SH7T0b_D1v for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 20:03:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A875B61B91
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 20:03:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d014:579:30ce:61f5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1897B2003A4;
 Fri, 10 Sep 2021 22:03:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631304193;
 bh=x8Zf4PCVv0dJEnTF15ICBewRYp9wlnuABSe993Vh1yE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L5NDC1xe7yMnwbZcO8moV2uoWtIv19chEQFfBksXgdwX7LQXeRyIs+ElGmakIc56K
 G2JukYel/knvtqQwCzkTcYWnasA3C5XnThEKEz7rjg4FBOEh/iWv7ATUj8Voen0m2T
 IkYHZMP3Ymo0bgmKQO7u8o7Gh4W5ZaWtpvEdMS05jMTVG92Q+eCPdwxr0eKcGlaBd4
 jtKRDN4b8ENQ50wH004x0Fm1PaJjjVUxKCHSm87/+JEkrQnAlpwM6elunYTp3ZOg1U
 Onm5GGuuye/HzL0xocz+WB3kmqPhzcERPVJpz3JGCUeWTGYb8B2DehIqccIJdbp+0S
 fZ0HJYYU9Jgqg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 10 Sep 2021 22:03:06 +0200
Date: Fri, 10 Sep 2021 22:03:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20210910200306.GA1053080@scaer>
References: <20210910140241.26771-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210910140241.26771-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/haproxy: security bump to version
 2.4.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Peter, All,

On 2021-09-10 16:02 +0200, Peter Korsgaard spake thusly:
> Fixes the following security issues:
> 
> - CVE-2021-40346: An integer overflow exists in HAProxy 2.0 through 2.5 in
>   the htx_add_header() can be exploited to perform an HTTP request smuggling
>   attack, allowing an attacker to bypass all configured http-request HAProxy
>   ACLs and possibly other ACLs.
> 
> For more details, see the advisory:
> https://www.mail-archive.com/haproxy@formilux.org/msg41114.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/haproxy/haproxy.hash | 4 ++--
>  package/haproxy/haproxy.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
> index 9edf5def08..3ad5e4ebe8 100644
> --- a/package/haproxy/haproxy.hash
> +++ b/package/haproxy/haproxy.hash
> @@ -1,5 +1,5 @@
> -# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.3.tar.gz.sha256
> -sha256  ce479380be5464faa881dcd829618931b60130ffeb01c88bc2bf95e230046405  haproxy-2.4.3.tar.gz
> +# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.4.tar.gz.sha256
> +sha256  116b7329cebee5dab8ba47ad70feeabd0c91680d9ef68c28e41c34869920d1fe  haproxy-2.4.4.tar.gz
>  # Locally computed:
>  sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
>  sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
> diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
> index 85d4fa7e8d..91cb71eb7c 100644
> --- a/package/haproxy/haproxy.mk
> +++ b/package/haproxy/haproxy.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  HAPROXY_VERSION_MAJOR = 2.4
> -HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).3
> +HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).4
>  HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
>  HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
>  HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
> -- 
> 2.20.1
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
