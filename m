Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70643C27C6E
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 08:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39D1981315;
	Sun, 16 Jun 2024 08:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ds7Yg0frvEKI; Sun, 16 Jun 2024 08:59:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 406FF81763
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 406FF81763;
	Sun, 16 Jun 2024 08:59:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 358D21BF2C3
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 08:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E8D36067C
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 08:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 41QwzeR71RXu for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 08:59:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA2036066D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA2036066D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA2036066D
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 08:59:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DD59C13F899;
 Sun, 16 Jun 2024 10:59:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Jun 2024 10:59:48 +0200
Date: Sun, 16 Jun 2024 10:59:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zm6phM57fgAhcqs1@landeda>
References: <20240615182023.2963494-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240615182023.2963494-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718528393;
 bh=fYbMJjo/tif5DcAQGn4NKFs/Q3ey6j4k/HxZNflAhz8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nwz5+ZwkrRnbOSuPMroeZ+tBnZQZ9GwyTLqsVTotWxBU23uMmzZAvRpKZiC09xoHe
 EEeqR1vJ/JbvDUkYpCg6mdSUvkg27w1UzA6ipyJy5uEXN3JGnI2nsRCwgNY6a1qrYb
 SlCwJuwj5rXCeljmtdsaV80E2R1by63EEJ7+lRbZa+66W8SKRNi1Z34cvQ/040oCIR
 7Le6oRDC1manWV0tdgDu2KrR9b4HDhViYy2ClQDcIk7VAHOpHXG98L5TYQgSi2BuuJ
 vqdtX+YnbvAh4x7N4TpuA7/m4R+v90aXV+CfIlIq4riH2Fw41iXEMOAvJb3zQFhukU
 VPSo5JW1lO0kw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nwz5+Zwk
Subject: Re: [Buildroot] [PATCH 1/1] package/nut: needs threads
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-06-15 20:20 +0200, Fabrice Fontaine spake thusly:
> threads are mandantory since bump to version 2.8.2 in commit
> 4edd837ac0193db83202030ee2997ac811e6bc45 and
> https://github.com/networkupstools/nut/commit/ff401e538bcbead62a3532887135518ef9e779df:
> 
> In file included from nutipc.cpp:38:
> ../include/nutipc.hpp:455:3: error: 'pthread_t' does not name a type
>   455 |   pthread_t m_impl;
>       |   ^~~~~~~~~
> 
> Fixes: 4edd837ac0193db83202030ee2997ac811e6bc45
>  - http://autobuild.buildroot.org/results/d16a24d60b298d7616a516ec0c6c30696ed93a58
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/collectd/Config.in | 5 +++--
>  package/nut/Config.in      | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/package/collectd/Config.in b/package/collectd/Config.in
> index 80759e9566..35f544b626 100644
> --- a/package/collectd/Config.in
> +++ b/package/collectd/Config.in
> @@ -430,13 +430,14 @@ config BR2_PACKAGE_COLLECTD_NTPD
>  config BR2_PACKAGE_COLLECTD_NUT
>  	bool "nut"
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_NUT
>  	help
>  	  The NUT plugin collects uninterruptible power supply (UPS)
>  	  statistics using the Network UPS Tools (NUT).
>  
> -comment "nut needs a toolchain w/ C++"
> -	depends on !BR2_INSTALL_LIBSTDCPP
> +comment "nut needs a toolchain w/ C++, threads"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
>  
>  config BR2_PACKAGE_COLLECTD_OLSRD
>  	bool "olsrd"
> diff --git a/package/nut/Config.in b/package/nut/Config.in
> index df647b9b48..0ecd33d583 100644
> --- a/package/nut/Config.in
> +++ b/package/nut/Config.in
> @@ -1,11 +1,12 @@
> -comment "nut needs a toolchain w/ C++"
> +comment "nut needs a toolchain w/ C++, threads"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
>  
>  config BR2_PACKAGE_NUT
>  	bool "nut"
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
>  	  Network UPS tools
>  
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
