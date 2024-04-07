Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9517CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 08:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 948FF403E9;
	Sun,  7 Apr 2024 08:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSMgzunw_QcJ; Sun,  7 Apr 2024 08:51:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F34D404A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F34D404A3;
	Sun,  7 Apr 2024 08:51:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61C3C1BF57C
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B33A6605EB
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYFgJgpZpChO for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 08:51:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B3B09605E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3B09605E8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3B09605E8
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 08:51:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 027DB13F8AE;
 Sun,  7 Apr 2024 10:51:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 10:51:02 +0200
Date: Sun, 7 Apr 2024 10:51:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZhJedrcE8P6DpRjg@landeda>
References: <20240404210640.1926462-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240404210640.1926462-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712479865;
 bh=peRSYD9bRPMiGbcGdmX0jgE3sS/3rt2qjkDXRyOU8dQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uRgoMYlC3Htg+xKQFEb5md0StKgmfJn/DV4aynsFmEoJiQ4ao0/DiSvgt/rlKCqiG
 GIQaAbrsHFKfthtJaiJvuOMKjvOZYCIsc5tjmP+khDXN+Nf2D1tH9z6/b7Jd0xLFpU
 /7X7a9ty5JQApAt/AbWwnv4cS4iCHcQGr73EhuDhXFJKj0dA1QCCbwZKBvnyEzORdO
 7wcXZ363PXnUX8lptjmoWN9DbsvhX4XjNT4/MLBNJ4zPuA7hS7dQMPi6vcjALnTW+m
 APWlDxS+0HL8icq8zUyv7yRJe6mNYSI8oLto3i3j7k1kcC5gci+WEWLyqqQQll5swz
 piIFbdbHAzAeA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uRgoMYlC
Subject: Re: [Buildroot] [PATCH 1/1] package/util-linux: add libxcrypt
 optional dependency
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

On 2024-04-04 23:06 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failures raised since bump of glibc to version
> 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:
> 
> configure: error: newgrp selected, but required crypt function not available
> 
> [...]
> 
> configure: error: sulogin selected, but required crypt function not available
> 
> Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
>  - http://autobuild.buildroot.org/results/961cd1221adf9ef8bfaff25b212351d10769c369
>  - http://autobuild.buildroot.org/results/875a8d9ad76e844149d9a1c0c1983696e7313eff
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/util-linux/Config.in                          | 2 ++
>  package/util-linux/util-linux-libs/util-linux-libs.mk | 1 +
>  package/util-linux/util-linux.mk                      | 1 +
>  3 files changed, 4 insertions(+)
> 
> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index 73fa11380e..1f5dacec2f 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -280,6 +280,7 @@ config BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT
>  
>  config BR2_PACKAGE_UTIL_LINUX_NEWGRP
>  	bool "newgrp"
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  Log in to a new group
>  
> @@ -402,6 +403,7 @@ comment "su needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library,
>  config BR2_PACKAGE_UTIL_LINUX_SULOGIN
>  	bool "sulogin"
>  	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  Single-user login
>  
> diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
> index e1fe1ec191..0337e7e13a 100644
> --- a/package/util-linux/util-linux-libs/util-linux-libs.mk
> +++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
> @@ -24,6 +24,7 @@ UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
>  UTIL_LINUX_LIBS_INSTALL_STAGING = YES
>  UTIL_LINUX_LIBS_DEPENDENCIES = \
>  	host-pkgconf \
> +	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
>  	$(TARGET_NLS_DEPENDENCIES)
>  UTIL_LINUX_LIBS_CONF_OPTS += \
>  	--disable-rpath \
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index a9e5b0bf68..f2821978c5 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -37,6 +37,7 @@ UTIL_LINUX_AUTORECONF = YES
>  UTIL_LINUX_INSTALL_STAGING = YES
>  UTIL_LINUX_DEPENDENCIES = \
>  	host-pkgconf \
> +	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
>  	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs) \
>  	$(TARGET_NLS_DEPENDENCIES)
>  UTIL_LINUX_CONF_OPTS += \
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
