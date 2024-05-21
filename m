Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5463FC25B75
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 04:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1382B40481;
	Tue, 21 May 2024 04:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qygNw66yXe-9; Tue, 21 May 2024 04:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0089B4064A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0089B4064A;
	Tue, 21 May 2024 04:58:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 63A061C4F75
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 04:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50CDF6071B
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 04:58:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id prIkHIohXFcB for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 04:58:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 49891607AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49891607AF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49891607AF
 for <buildroot@buildroot.org>; Tue, 21 May 2024 04:58:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3B98113F86A;
 Tue, 21 May 2024 06:58:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 21 May 2024 06:58:16 +0200
Date: Tue, 21 May 2024 06:58:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zkwp6I9sjgZKMffw@landeda>
References: <20240519105436.354168-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240519105436.354168-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716267499;
 bh=b7Webeetg23qx6ecGxdzvkUwlt3TywEq08ze2KWL4t0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UOVF7xu5B/YDK4j27+vbqaDe4U5mlVfwKTQiUMQyw3XPxflQnpxeFW40zVklgf5ZC
 HK5duhNPrgy4lY0RNLDdo+rm54FDaWA7kwtIZzuSgQ/akxLPbbk5nNAU4qvJaCo9k2
 0rmmdyc5+nVgJnv0aYIyfXXp1HIaixDCwweNffbIjFgYIzO4ApLYcETAc20ipklYj+
 f4ueffzPT8xrdf8tolLN420HFNxreUyZbBn5HRv+kj5TMDtdjIMGNToHDFdgzHKQKK
 9bcz721OUL5amXD6FfUxE1LJfdH0a8qthxXXC6tbY17BnYoGlcvnv9ne0bJ32HOY/m
 1G+QQoImgsQnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UOVF7xu5
Subject: Re: [Buildroot] [PATCH 1/1] package/ivi-homescreen: needs gcc >= 8
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-05-19 12:54 +0200, Fabrice Fontaine spake thusly:
> ivi-homescreen needs C++17 filesystem resulting in the following build
> failure with gcc < 8 since its addition in commit
> 9d8497e79de3ced144877ba6ee38cc5b7181aaeb:
> 
> In file included from /home/buildroot/instance-0/output-1/build/ivi-homescreen-5ab78a19e95c88cc5d6b173ab1260a211e78cf0a/third_party/flutter/shell/platform/common/path_utils.cc:5:0:
> /home/buildroot/instance-0/output-1/build/ivi-homescreen-5ab78a19e95c88cc5d6b173ab1260a211e78cf0a/third_party/./flutter/shell/platform/common/path_utils.h:8:10: fatal error: filesystem: No such file or directory
>  #include <filesystem>
>           ^~~~~~~~~~~~
> 
> Fixes: 9d8497e79de3ced144877ba6ee38cc5b7181aaeb
>  - http://autobuild.buildroot.org/results/a5e88d5a4264a6165be31a99f1c123af53fa382e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ivi-homescreen/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
> index dc2ccb0c97..a4f5f6835f 100644
> --- a/package/ivi-homescreen/Config.in
> +++ b/package/ivi-homescreen/Config.in
> @@ -3,7 +3,7 @@ menuconfig BR2_PACKAGE_IVI_HOMESCREEN
>  	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
>  	depends on BR2_HOST_GCC_AT_LEAST_5 # flutter-engine
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # flutter-engine
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
>  	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # flutter-engine
>  	depends on BR2_TOOLCHAIN_USES_GLIBC # flutter-engine
>  	depends on BR2_INSTALL_LIBSTDCPP # flutter-engine
> @@ -250,11 +250,11 @@ comment "OpenGL texture plugin needs an EGL backend"
>  
>  endif # BR2_PACKAGE_IVI_HOMESCREEN
>  
> -comment "ivi-homescreen needs a glibc toolchain w/ wchar, C++, gcc >= 5, dynamic library, host gcc >= 5"
> +comment "ivi-homescreen needs a glibc toolchain w/ wchar, C++, gcc >= 8, dynamic library, host gcc >= 5"
>  	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_USES_GLIBC \
> -		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
> +		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 \
>  		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
>  		|| !BR2_HOST_GCC_AT_LEAST_5
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
