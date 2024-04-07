Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D412CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 16:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA7CF80B31;
	Sun,  7 Apr 2024 16:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJSvcwxq3YSn; Sun,  7 Apr 2024 16:18:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB26182113
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB26182113;
	Sun,  7 Apr 2024 16:18:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DFDF1BF326
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7618782113
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLXgpyCs4R73 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 16:18:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 470918210D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 470918210D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 470918210D
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 16:18:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 043EF13F8AD;
 Sun,  7 Apr 2024 18:18:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 18:18:30 +0200
Date: Sun, 7 Apr 2024 18:18:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZhLHVqz7nQBRkR66@landeda>
References: <20240407154958.4107385-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240407154958.4107385-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712506713;
 bh=ImKDq625o6PhxNsmv2IMbljxVx257RtQcF/kpcCZ21o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QuR2wTZ9cyEROH41qW3TGwzUvenBnWQ4W900Dh8FsgTIhxe+AtJ6vmFgOm7RieNL7
 6GlOQDDXO1lP4d5s0VQ2C0xS7lgQMZjlpxffRsc3sqF1CopUvbdgNWZkeNNQMDPy/q
 BnMMFS526Pv9edsEQkQRR0UAAsFbd0HjNrFy2/Xe2AvnWkpWLVs5ZEqQFRKWgo/x7S
 WRfaCEf6llc++PBCmteJfhh6+TByI/93CjbLTIgn/jfIAdufoKDlkfjVZVN5YfMP8u
 2qRTJAxYjE0KvPC9bYpboZNoFezdwORtaLXORgQNWdqbxTaX73LzDWo0ghlaPNfg4A
 d1ivjkg488DiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QuR2wTZ9
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/apache: add libxcrypt
 optional dependency"
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

Bernd, all,

On 2024-04-07 17:49 +0200, Bernd Kuhls spake thusly:
> This reverts commit 02905fe54cb2136c15cc71d2840d60537f1513a8.
> 
> The build error
> http://autobuild.buildroot.org/results/f0f55d9d66b07cb3408086d2632f8cd1bebb670e/
> 
> resulted from the apr package and was fixed with commit
> https://git.buildroot.net/buildroot/commit/?id=2402e0f1d31327806422692db6523120227bc5b0

Indeed, I did a test build with this patch applied, and threre is indeed
no failure.

Thanks for noticing!

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/apache/Config.in | 1 -
>  package/apache/apache.mk | 4 ----
>  2 files changed, 5 deletions(-)
> 
> diff --git a/package/apache/Config.in b/package/apache/Config.in
> index bc3133ea00..270296bce4 100644
> --- a/package/apache/Config.in
> +++ b/package/apache/Config.in
> @@ -5,7 +5,6 @@ config BR2_PACKAGE_APACHE
>  	depends on BR2_USE_MMU # apr
>  	select BR2_PACKAGE_APR_UTIL
>  	select BR2_PACKAGE_PCRE2
> -	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  The Apache HTTP Server Project is an effort to develop and
>  	  maintain an open-source HTTP server for modern operating
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index 619d13726e..1b095c5eb1 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -52,10 +52,6 @@ else
>  APACHE_CONF_OPTS += --disable-brotli
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> -APACHE_DEPENDENCIES += libxcrypt
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIBXML2),y)
>  APACHE_DEPENDENCIES += libxml2
>  # Apache wants the path to the header file, where it can find
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
