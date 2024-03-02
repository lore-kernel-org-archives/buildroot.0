Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0D6C54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 18:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0AA783443;
	Sat,  2 Mar 2024 18:33:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r-vXZGsfPXIr; Sat,  2 Mar 2024 18:33:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E22783065
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E22783065;
	Sat,  2 Mar 2024 18:33:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9CD61BF38D
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 18:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C68D8606C9
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 18:33:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6uDg903FZ4BT for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 18:33:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 78E9B60669
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78E9B60669
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78E9B60669
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 18:33:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2C0A413F8AD;
 Sat,  2 Mar 2024 19:33:30 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 02 Mar 2024 19:33:29 +0100
Date: Sat, 2 Mar 2024 19:33:29 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZeNw-Zp8v5u47574@landeda>
References: <20240302092733.24288-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240302092733.24288-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1709404415;
 bh=s+fMXzAA0+ahZLQbwS7uChlKFrXH90l1BPkQbCrxUYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=knRtq7nEP9yCgFoh6DpUPpwKx6djfeetI9EaBnBtjQoYc6IehruAmHA97g69MTNtF
 UJWKG59mx7fpw8FBqPLbJogs3IoGAaQcdEOPCYEcuq2G3FhW5D0VjoqpaRQo9Mu28N
 GQ17M8MCqBBxo/FsrAEGv/aePJtmJ2jnxQnBmSej6VTJMp1CpSb28V61HkhNCQiD3I
 M4sOmzbMSXy/g5Mr2RY5lD3I75GFtX8X1mxP1pdbm/YVjLGwW+D+/Br4oTAlNRCHHD
 VFq3sMZtsAhYcmPPIdUuYHFXSlZRjlZ8WTG5Te68zWZ70Nx37bjbeI8cuQu8cb9wBQ
 TnTfLXAgqxvSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=knRtq7nE
Subject: Re: [Buildroot] [PATCH v2,1/1] package/parted: needs gcc >= 5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-03-02 10:27 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump to version 3.5 in
> commit 57817fe05a4250a260a08201812c6652b306a0e5 and
> https://git.savannah.gnu.org/cgit/parted.git/commit/?id=15c49ec04f7eaff014d2e1eddd0aecf4150db63d:
> 
> gpt.c:181:5: error: initializer element is not constant
>      { PED_PARTITION_APPLE_TV_RECOVERY,  PARTITION_APPLE_TV_RECOVERY_GUID },
>      ^
> gpt.c:181:5: error: (near initialization for 'flag_uuid_mapping[0].type_uuid')
> 
> Fixes: 57817fe05a4250a260a08201812c6652b306a0e5
>  - http://autobuild.buildroot.org/results/1f0af75ec55da9052fbfb195a0699f84619eac81
>  - http://autobuild.buildroot.org/results/438b5f40e8b393801f36c691d239e298998cb9d2

I also added a little note explainiung why the dependency is not
propagated to udisks.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  - Fix typo "| |" -> "||"
> 
>  package/libblockdev/Config.in     | 15 +++++++++------
>  package/parted/Config.in          |  6 ++++--
>  package/python-pyparted/Config.in |  6 ++++--
>  3 files changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
> index b1d088bf35..81b4819280 100644
> --- a/package/libblockdev/Config.in
> +++ b/package/libblockdev/Config.in
> @@ -32,12 +32,13 @@ config BR2_PACKAGE_LIBBLOCKDEV_CRYPTO
>  config BR2_PACKAGE_LIBBLOCKDEV_FS
>  	bool "filesystem"
>  	depends on BR2_ENABLE_LOCALE # parted
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # parted
>  	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
>  	select BR2_PACKAGE_PARTED
>  	select BR2_PACKAGE_E2FSPROGS
>  
> -comment "filesystem plugin needs a toolchain w/ locale"
> -	depends on !BR2_ENABLE_LOCALE
> +comment "filesystem plugin needs a toolchain w/ locale, gcc >= 5"
> +	depends on !BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
>  
>  config BR2_PACKAGE_LIBBLOCKDEV_LOOP
>  	bool "loop"
> @@ -45,11 +46,12 @@ config BR2_PACKAGE_LIBBLOCKDEV_LOOP
>  config BR2_PACKAGE_LIBBLOCKDEV_LVM2
>  	bool "lvm2"
>  	depends on BR2_ENABLE_LOCALE # parted
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # parted
>  	select BR2_PACKAGE_PARTED
>  	select BR2_PACKAGE_LVM2
>  
> -comment "lvm2 support needs a toolchain w/ locale"
> -	depends on !BR2_ENABLE_LOCALE
> +comment "lvm2 support needs a toolchain w/ locale, gcc >= 5"
> +	depends on !BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
>  
>  config BR2_PACKAGE_LIBBLOCKDEV_MDRAID
>  	bool "mdraid"
> @@ -64,11 +66,12 @@ config BR2_PACKAGE_LIBBLOCKDEV_NVME
>  config BR2_PACKAGE_LIBBLOCKDEV_PART
>  	bool "part"
>  	depends on BR2_ENABLE_LOCALE # parted
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # parted
>  	select BR2_PACKAGE_PARTED
>  	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
>  
> -comment "part plugin needs a toolchain w/ locale"
> -	depends on !BR2_ENABLE_LOCALE
> +comment "part plugin needs a toolchain w/ locale, gcc >= 5"
> +	depends on !BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
>  
>  config BR2_PACKAGE_LIBBLOCKDEV_SWAP
>  	bool "swap"
> diff --git a/package/parted/Config.in b/package/parted/Config.in
> index f48b365a2d..ea6c3db2bf 100644
> --- a/package/parted/Config.in
> +++ b/package/parted/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_PARTED
>  	bool "parted"
>  	depends on BR2_ENABLE_LOCALE
>  	depends on BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>  	select BR2_PACKAGE_UTIL_LINUX
>  	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>  	help
> @@ -9,5 +10,6 @@ config BR2_PACKAGE_PARTED
>  
>  	  http://www.gnu.org/software/parted/
>  
> -comment "parted needs a toolchain w/ locale, wchar"
> -	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR
> +comment "parted needs a toolchain w/ locale, wchar, gcc >=5"
> +	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
> diff --git a/package/python-pyparted/Config.in b/package/python-pyparted/Config.in
> index 60f54a5484..430bf204a1 100644
> --- a/package/python-pyparted/Config.in
> +++ b/package/python-pyparted/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_PYTHON_PYPARTED
>  	bool "python-pyparted"
>  	depends on BR2_ENABLE_LOCALE # parted
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # parted
>  	depends on BR2_USE_WCHAR
>  	select BR2_PACKAGE_PARTED
>  	help
> @@ -8,5 +9,6 @@ config BR2_PACKAGE_PYTHON_PYPARTED
>  
>  	  https://github.com/rhinstaller/pyparted
>  
> -comment "pyparted needs a toolchain w/ locale, wchar"
> -	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR
> +comment "pyparted needs a toolchain w/ locale, wchar, gcc >= 5"
> +	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
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
