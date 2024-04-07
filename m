Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DF1CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 08:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B391400D6;
	Sun,  7 Apr 2024 08:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z5RWFcUG451P; Sun,  7 Apr 2024 08:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FFF9403E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FFF9403E9;
	Sun,  7 Apr 2024 08:50:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDE9C1BF57C
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9C2D40520
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJ56KMWsPphc for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 08:50:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4FDFC40511
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FDFC40511
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FDFC40511
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 08:50:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1CA1013F8AE;
 Sun,  7 Apr 2024 10:50:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 10:50:09 +0200
Date: Sun, 7 Apr 2024 10:50:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZhJeQaqeEF7lYiBs@landeda>
References: <20240405153622.3348696-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240405153622.3348696-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712479812;
 bh=nP406Gp81eivN+p/caTVnPGu4NqikikQmnDQghmNLDo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FLSS5nWH7SmH7C5ii539YrCghVaWI3e2ENnwJrJ5FhTelLDnSRTBThqkKJUuQqAgW
 Qxoy/2IogAHO1o0hBJI7HP9phCUFAf+NKqwFgrZBjkKzsIY8AIvxEAB7ceojRbCUHu
 1PeUPBfN91NJ+ZDmwKezB3aiFL+pyXaQDsrvX1Y8Dh7n4s49L1zeHq32M1aoi67Iv1
 m3EwAayahuT+FQ3dEw1fahRuPNNBF6kE7VztYQkFO8g3ZJDWcHcoBZ1zxR7Gb/BNgT
 o/KT8osvUa1MLesMxiK0T7MvTH1sv20/uI8EyM1RLkAdcdV6abcG+boNSIgbdSZ5zU
 1p5WDnNBWC7fg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FLSS5nWH
Subject: Re: [Buildroot] [PATCH 1/1] package/dropbear: add optional
 dependency to libxcrypt
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

On 2024-04-05 17:36 +0200, Bernd Kuhls spake thusly:
> When glibc was bumped to version 2.39 in commit
> b5680f53d60acf8ff6010082f873438a39bd5d97 it removed the deprecated
> libcrypt support.
> 
> Due to this removal dropbear was unable to accept connections using
> password authentication.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> My knowledge about the internals of dropbear is non-existent but adding
> libxcrypt fixed the connection problem which occured right after the
> glibc bump.
> 
>  package/dropbear/Config.in   | 1 +
>  package/dropbear/dropbear.mk | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
> index e14a670c19..6a9161d659 100644
> --- a/package/dropbear/Config.in
> +++ b/package/dropbear/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_DROPBEAR
>  	bool "dropbear"
>  	select BR2_PACKAGE_ZLIB if !BR2_PACKAGE_DROPBEAR_SMALL
>  	select BR2_PACKAGE_LIBTOMCRYPT if !BR2_PACKAGE_DROPBEAR_SMALL
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  A small SSH 2 server designed for small memory environments.
>  
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index 7ac8a38559..56f565e016 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -39,6 +39,10 @@ ifeq ($(BR2_SHARED_STATIC_LIBS),y)
>  DROPBEAR_CONF_OPTS += --disable-static
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> +DROPBEAR_DEPENDENCIES += libxcrypt
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
>  define DROPBEAR_SVR_PAM_AUTH
>  	echo '#define DROPBEAR_SVR_PASSWORD_AUTH 0'     >> $(@D)/localoptions.h
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
