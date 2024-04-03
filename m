Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E3BCD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0CCD4183E;
	Wed,  3 Apr 2024 19:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a2CfQT_MWUDo; Wed,  3 Apr 2024 19:56:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A78141841
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A78141841;
	Wed,  3 Apr 2024 19:56:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C66D1BF4D5
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96CCA40437
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RTPiML-8wuoE for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:56:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 60ABF402E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60ABF402E6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 60ABF402E6
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:56:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 23A3C13F880;
 Wed,  3 Apr 2024 21:56:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 03 Apr 2024 21:56:46 +0200
Date: Wed, 3 Apr 2024 21:56:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <Zg20fvghRGrbPp5q@landeda>
References: <20240403153641.4122789-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403153641.4122789-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712174209;
 bh=aj+0tv/LbWebnOYcuqr4ON3gPd3ager0u4+BJKMRuKM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ogrc4ZPiryNiBIEFS6cJRlJvoqpwrCARZvZ7YCxNstWDN9VQudTCtsEGXDUBukGkx
 5CRlQjwYcqH/7SwLzz+PlRow5xL560ZTZPwumRI5Z1xku2adqZ4yFKZw5Fv+1MnXN3
 WS05roRJGIT0dpHKLjffw41fW3lCI4j/KjuZzkYDzakVtXwnvxYFTjdS6eZ6aF5DdR
 OG3gx1quIGIAxoS//WnK62ckkjKrSoikwbG9KJUnvftlcD1cg1WD5pWm8Y8GCgLL1o
 EDfE9uVOp6tjYmALxqQLXdsubqV1Zs70S1g5FFsswWKxT/rYfEE3EI0QYtY+NG39WH
 KC87V7SSjD0wg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ogrc4ZPi
Subject: Re: [Buildroot] [PATCH 1/9] package/apg: add optional dependency to
 libxcrypt
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

Bernd, All,

On 2024-04-03 17:36 +0200, Bernd Kuhls spake thusly:
> When glibc was bumped to version 2.39 in commit
> b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
> libcrypt support.
> 
> As glibc's libcrypt was providing apg's libcrypt dependency this broke
> the apg build using glibc version 2.39.
> 
> To fix this select the libxcrypt dependency to apg when using a glibc
> toolchain and add the dependency if selected.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3df84ae300bb648492cffc21e4481fc5abf02aeb/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks a lot for those patches! Whole series applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/apg/Config.in | 1 +
>  package/apg/apg.mk    | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/apg/Config.in b/package/apg/Config.in
> index 94c286a178..f54ffdba39 100644
> --- a/package/apg/Config.in
> +++ b/package/apg/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_APG
>  	bool "apg"
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  Automated Password Generator (APG).
>  
> diff --git a/package/apg/apg.mk b/package/apg/apg.mk
> index 16661f4b8d..1929e21f58 100644
> --- a/package/apg/apg.mk
> +++ b/package/apg/apg.mk
> @@ -9,6 +9,10 @@ APG_SITE = $(call github,wilx,apg,v$(APG_VERSION))
>  APG_LICENSE = BSD-3-Clause
>  APG_LICENSE_FILES = COPYING
>  
> +ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> +APG_DEPENDENCIES += libxcrypt
> +endif
> +
>  define APG_BUILD_CMDS
>  	$(MAKE) $(TARGET_CONFIGURE_OPTS) FLAGS="$(TARGET_CFLAGS)" -C $(@D)
>  endef
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
