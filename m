Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2392BE7717F
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 20:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A08C641706;
	Fri, 13 Dec 2024 20:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKyHlvboANyR; Fri, 13 Dec 2024 20:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AB15416F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AB15416F8;
	Fri, 13 Dec 2024 20:52:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3129ECE
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 20:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0B0A400AC
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 20:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cxgd-rEnUgpI for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 20:52:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 801F54013B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 801F54013B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 801F54013B
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 20:51:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id DB68A5FF95;
 Fri, 13 Dec 2024 21:51:54 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40042])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 13 Dec 2024 21:51:54 +0100
MIME-Version: 1.0
Date: Fri, 13 Dec 2024 21:51:54 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20241211192758.1653472-1-bernd@kuhls.net>
References: <20241211192758.1653472-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <bd3e4a1707000a98704ed5d6441582a5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734123117;
 bh=ksTOllJqD7UfgKq4xfsT9rwJhddpqBn09pmXFkr0w8Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=miZEwrswKSZcLYgkyyeDf8SQWmo2LtJmRBkEnZgTSibH3UeI67ccpcIOF6N8rTfqe
 yiZg/YQUzjrnUCifLOPF0tl9iKbzHWpns7Y4sEaRCq4Q03xH8G9viN+iAx21aUccXZ
 nlAWZSv1qvyd+YEBHk0n97OL2+9SQmBBftQQxWyM5/KDQkpCvehMVlZyYdz/Hv+QmA
 Da0xiIuk4KRShplROYczkc40QFU6+hZIVa+bjGWEfHoByGasfldGzT7WP+mRDbblCA
 NtA6Ct8Pnaz+ezHU24KjHyYApLFkTcrVQbbviK5a/Barc02kCsklVhBkXc6XdhOZQG
 f16Y1OiDqrI5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=miZEwrsw
Subject: Re: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.31.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/12/2024 20:27, Bernd Kuhls wrote:
> Release notes:
> https://cmake.org/cmake/help/v3.31/release/3.31.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

> ---
>  package/cmake/Config.in.host | 5 +++++
>  package/cmake/cmake.hash     | 4 ++--
>  package/cmake/cmake.mk       | 4 ++--
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/package/cmake/Config.in.host 
> b/package/cmake/Config.in.host
> index 389300f31f..b30ce03a1c 100644
> --- a/package/cmake/Config.in.host
> +++ b/package/cmake/Config.in.host
> @@ -59,10 +59,15 @@ config BR2_HOST_CMAKE_AT_LEAST_3_30
>  	bool
>  	select BR2_HOST_CMAKE_AT_LEAST_3_29
> 
> +config BR2_HOST_CMAKE_AT_LEAST_3_31
> +	bool
> +	select BR2_HOST_CMAKE_AT_LEAST_3_30
> +
>  # This order guarantees that the highest version is set, as kconfig
>  # stops affecting a value on the first matching default.
>  config BR2_HOST_CMAKE_AT_LEAST
>  	string
> +	default "3.31"	if BR2_HOST_CMAKE_AT_LEAST_3_31
>  	default "3.30"	if BR2_HOST_CMAKE_AT_LEAST_3_30
>  	default "3.29"	if BR2_HOST_CMAKE_AT_LEAST_3_29
>  	default "3.28"	if BR2_HOST_CMAKE_AT_LEAST_3_28
> diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
> index f80b942103..f214c21925 100644
> --- a/package/cmake/cmake.hash
> +++ b/package/cmake/cmake.hash
> @@ -1,5 +1,5 @@
> -# From https://cmake.org/files/v3.30/cmake-3.30.5-SHA-256.txt
> -sha256  
> 9f55e1a40508f2f29b7e065fa08c29f82c402fa0402da839fffe64a25755a86d  
> cmake-3.30.5.tar.gz
> +# From https://cmake.org/files/v3.31/cmake-3.31.1-SHA-256.txt
> +sha256  
> c4fc2a9bd0cd5f899ccb2fb81ec422e175090bc0de5d90e906dd453b53065719  
> cmake-3.31.1.tar.gz
> 
>  # Locally calculated
>  sha256  
> 0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  
> Copyright.txt
> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index 0c5d46c23d..7fc1f0181d 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -5,8 +5,8 @@
>  
> ################################################################################
> 
>  # When updating the version, please also update 
> BR2_HOST_CMAKE_AT_LEAST_X_Y
> -CMAKE_VERSION_MAJOR = 3.30
> -CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).5
> +CMAKE_VERSION_MAJOR = 3.31
> +CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
>  CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>  CMAKE_LICENSE = BSD-3-Clause
>  CMAKE_LICENSE_FILES = Copyright.txt
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
