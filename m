Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE29CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 12:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A380608A5;
	Sun,  7 Apr 2024 12:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kcr6x0XTQpcg; Sun,  7 Apr 2024 12:19:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D839608BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D839608BD;
	Sun,  7 Apr 2024 12:19:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF4F91BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9693D403B3
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fxjkOgOP0CL for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 12:19:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 519BA4018B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 519BA4018B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 519BA4018B
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 12:19:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 879AC13F899;
 Sun,  7 Apr 2024 14:19:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Apr 2024 14:19:34 +0200
Date: Sun, 7 Apr 2024 14:19:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZhKPVsy7qlUMlftE@landeda>
References: <20240407121342.892419-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240407121342.892419-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712492376;
 bh=8mhY8Okxf1chH25EPduWlACKYR6RqkZTqQ6fKYDuFDI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gCxUXGRx0+CDwATU9n6H/+JrTI734q+0NTvhDVFhcTv9C5eaq74UtSOEVyr9z9AJ3
 W6zFlF26AoCqjHi3oA3/hMXTPZwVQMYdx0j+MJ4/5MFZ1LH7ep+wmcoru1ngcnzEe8
 CvnzfqgeU6fuj9f15nhYONJXdXqoOP7B1Ci+DtMnWCD4Ofa4zcAQogacOZK3hfmOt8
 HjxrnMatpWvEL/3Pnz+g7lUjeZoGOR1iNb2vsxbs+YIPFSP2dcvPfnHTFPixGZkF0m
 gX/HId25Od/sjUw7oxH+UrsF9wjnqaj87XEqvHJta+LudSexBreMa2drBcr79goUk+
 YNEUmb7ZAdp2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gCxUXGRx
Subject: Re: [Buildroot] [PATCH 1/1] package/whois: add libxcrypt optional
 dependency
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

On 2024-04-07 14:13 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump of glibc to version
> 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:
> 
> /home/autobuild/autobuild/instance-12/output-1/host/lib/gcc/riscv32-buildroot-linux-gnu/12.3.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: cannot find -lcrypt: No such file or directory
> 
> Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
>  - http://autobuild.buildroot.org/results/b0aaffaf951725186ae078ce101edb24c963c6a3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/whois/Config.in | 1 +
>  package/whois/whois.mk  | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/whois/Config.in b/package/whois/Config.in
> index d2a030282b..19c22b5583 100644
> --- a/package/whois/Config.in
> +++ b/package/whois/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_WHOIS
>  	bool "whois"
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  Improved whois client.
>  
> diff --git a/package/whois/whois.mk b/package/whois/whois.mk
> index 5a85bea358..e98add4e6a 100644
> --- a/package/whois/whois.mk
> +++ b/package/whois/whois.mk
> @@ -10,6 +10,7 @@ WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
>  WHOIS_DEPENDENCIES = \
>  	host-pkgconf \
>  	$(if $(BR2_PACKAGE_LIBIDN2),libidn2) \
> +	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
>  	$(TARGET_NLS_DEPENDENCIES)
>  WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
>  WHOIS_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
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
