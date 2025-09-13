Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D3ECAC587
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 13:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A153761567;
	Sat, 13 Sep 2025 13:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GRmhk4uTR8W0; Sat, 13 Sep 2025 13:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA0A861733
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA0A861733;
	Sat, 13 Sep 2025 13:19:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4792C25B
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 13:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3956F61567
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 13:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kUR84bNCPzDw for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 13:19:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 288A56174A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 288A56174A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 288A56174A
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 13:19:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id F0793B00563;
 Sat, 13 Sep 2025 15:19:48 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Sep 2025 15:19:48 +0200
MIME-Version: 1.0
Date: Sat, 13 Sep 2025 15:19:48 +0200
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20250912054034.35961-1-fido_max@inbox.ru>
References: <20250912054034.35961-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.11
Message-ID: <52e6c71dd7819ad16d5e192251407a44@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757769590;
 bh=4eUtYHililyzq2fe6ckTLSCivQqPmNFl0HXHRBYTX6o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lVID8qN/7iHDXScT1aqoChJns0dWxu+EQ9SGujwft0HRVC3kzIoHXSv/WfKF46Fx+
 ojMP0iSgCJwPRVgBASyCH8aLZBsrpsSezc0kQBk4qEJ3/3gbLq/Fbxv3fAKwpwFx6w
 QF3LtEa2c9o3m7FXFc5GygBK897Fj9hkOt6W+tZT1ufI/COjqwznvfOBW79ju1SDvk
 ZGsbNFkYOL6qC9eaBUKA4FJFVAQXt085Gj12urL99RwFJhmoV+cgjBtdyH6+aOw3XM
 hsNV41/zyQQz1uVFFecp76MkQZ7e56AYZdV0ZuKVjbYoFtKIMEH7BK5lLTW4N7NY6+
 V7Nu/3CjRUwfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lVID8qN/
Subject: Re: [Buildroot] [PATCH 1/1] package/libgeos: bump version to 3.14.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maxim,

Thanks for the patch.

On 12/09/2025 07:40, Maxim Kochetkov via buildroot wrote:
> Changelog: https://github.com/libgeos/geos/releases/tag/3.14.0
> 
> Bump minimal GCC version to 7. (Switched to C++17 as minimum 
> requirement)
> https://github.com/libgeos/geos/commit/e142764b77f4b8d0c36ec88406300c5f876743fb

This bump is introducing few build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2037932018

As a reference, the previous version 3.13.1 is building correctly. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2037941861

Those failures are probably due to this c++17 switch. Could you have
a look, please?

> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/libgeos/Config.in    | 6 +++---
>  package/libgeos/libgeos.hash | 2 +-
>  package/libgeos/libgeos.mk   | 2 +-
>  package/postgis/Config.in    | 6 +++---
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
> index 76cbb9bdcd..ff88f7254d 100644
> --- a/package/libgeos/Config.in
> +++ b/package/libgeos/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBGEOS
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
>  	help
>  	  GEOS (Geometry Engine - Open Source) is a C++ port of the
>  	  JTS Topology Suite (JTS). It aims to contain the complete
> @@ -13,7 +13,7 @@ config BR2_PACKAGE_LIBGEOS
> 
>  	  https://trac.osgeo.org/geos
> 
> -comment "libgeos needs a toolchain w/ C++, wchar, gcc >= 4.9, threads"
> +comment "libgeos needs a toolchain w/ C++, wchar, gcc >= 7, threads"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>  		   !BR2_TOOLCHAIN_HAS_THREADS || \
> -		   !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +		   !BR2_TOOLCHAIN_GCC_AT_LEAST_7
> diff --git a/package/libgeos/libgeos.hash 
> b/package/libgeos/libgeos.hash
> index f404b267e2..538933873b 100644
> --- a/package/libgeos/libgeos.hash
> +++ b/package/libgeos/libgeos.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  
> df2c50503295f325e7c8d7b783aca8ba4773919cde984193850cf9e361dfd28c  
> geos-3.13.1.tar.bz2
> +sha256  
> fe85286b1977121894794b36a7464d05049361bedabf972e70d8f9bf1e3ce928  
> geos-3.14.0.tar.bz2
>  sha256  
> dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  
> COPYING
> diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
> index 475a54f79f..0de73e2688 100644
> --- a/package/libgeos/libgeos.mk
> +++ b/package/libgeos/libgeos.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -LIBGEOS_VERSION = 3.13.1
> +LIBGEOS_VERSION = 3.14.0
>  LIBGEOS_SITE = http://download.osgeo.org/geos
>  LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
>  LIBGEOS_LICENSE = LGPL-2.1
> diff --git a/package/postgis/Config.in b/package/postgis/Config.in
> index 593c0dc1f3..a0f64bd76a 100644
> --- a/package/postgis/Config.in
> +++ b/package/postgis/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_POSTGIS
>  	bool "postgis"
>  	depends on BR2_PACKAGE_POSTGRESQL_FULL
>  	depends on BR2_INSTALL_LIBSTDCPP # libgeos, proj
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgeos
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libgeos
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # proj
>  	depends on BR2_USE_WCHAR # libgeos, proj
>  	select BR2_PACKAGE_LIBGEOS
> @@ -17,6 +17,6 @@ config BR2_PACKAGE_POSTGIS
> 
>  	  https://postgis.net/
> 
> -comment "postgis needs a toolchain w/ C++, NPTL, wchar, gcc >= 4.9"
> -	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 
> || \
> +comment "postgis needs a toolchain w/ C++, NPTL, wchar, gcc >= 7"
> +	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || 
> \
>  		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
> --
> 2.51.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
