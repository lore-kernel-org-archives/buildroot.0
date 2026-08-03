Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF66C55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 22:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C20780BD4;
	Mon,  3 Aug 2026 22:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4SloYGzkoTf; Mon,  3 Aug 2026 22:11:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F85A80BD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785795115;
	bh=nXbL0ckO7Yhrr/kma9i80ooO+1aasFNTZzg6cGoD0/A=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=s8GcWUYrP+YXGkz+dHDKUsHLnjp0CE+2cmQQt/C6+NKea2MsIr3mUHXwlcqoyA3Xl
	 OONah2nebSFm55DDI1Zs5xeKY6/x+2YiLHu4UkSDwBSvWCizf+VCRtVRbte9LBjuCH
	 XPmZJY9dolPRJ9g51yQms3mnXgPOHGsGOdk2nAFOYVNAQ7MQyMVwL0JZeBIOj7jyga
	 dJ60uaeGCzO+QMkVvrR9dcX+9sGdGy2bCFroPCQXBUFT/qiaFQuhxvQrmUf4pofpac
	 WhWIG0EA1gAsYItHcuMjHEjUAcpS/kqUZjvyW8KpflU1huXYfIK8TNMe+2GZnaZqsp
	 xvEmU+9d7rvVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F85A80BD7;
	Mon,  3 Aug 2026 22:11:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF90928F
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 22:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D15FA405DF
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 22:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3k3RdfjdolV for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 22:11:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BF1924058C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF1924058C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF1924058C
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 22:11:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFKGZ-1wflXe2Y7F-004w0q; Tue, 04
 Aug 2026 00:11:47 +0200
Message-ID: <0a702a10-572e-473c-bdcb-44e602b4ffdb@gmx.de>
Date: Tue, 4 Aug 2026 00:11:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260803210753.11940-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260803210753.11940-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:5NkY+m7yle/KhrZjSx6cfKSTT8lOpgZTHk3azUdGGh4AXkRyvwh
 e8Y6QPnTxkaG2oyPQ+z8jANFMhroaJn0CfpTY6cQiIdceLUmWJWtPlMWZamUwqT+f/P8KXI
 HeAxnOI0+HV4YPXj/LHKAY0XiuwQoOZ+TuKYr9iAOdA6d/eUMkZZt8JRvkKFzzWJPPreJUP
 PJm1lkZiYaMBoIwhsqv8Q==
UI-OutboundReport: notjunk:1;M01:P0:D0LVIoJBc5o=;0fKrnLXb2uQ+vpEs425cLV6Obzy
 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
 7T9S+Dd0qcaS58ANJHFoFERpEdCI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1785795107; x=1786399907; i=fiona.klute@gmx.de;
 bh=1fDLf2bmJf6kBZKb3j84Kyvbrj+d+BJgEbh6O0cdX7k=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=IPpYPG/6y3vWm4ulaudPlJt/G1efwZ42ol7L+m0jfaWFuz1/lFOJ+/SBk3/lI8g2
 oHPaskAG9xHj95Dub/Z3w/zNI0CR6xlLc51YVbcB6GXSe4ONZVysLyaUHL8Whhn3m
 47YlzThtSgTgulKqtVUWzmycKjkusX2pTV5AsJJSWiDgLgpP9mhYVd8iWZLB6bRUt
 0z0rXUMOfXLcP7fhvPfyj/UdV7L4BTKlxj1Zryh5zr0+14U8B/3P2Y9ix+cUI/gNQ
 92Fj3kbNh5vV7VsqlYiSE8xxxAc0Y7gD15O4VKmeNq+4mrCrQ7K8CBs11FcI4nOsi
 QWN2gZHxK/FyzCJmIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=IPpYPG/6
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.6.x,
 6.12.x, 6.18.x, 7.1.x series
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 03.08.26 um 23:07 schrieb Bernd Kuhls:
> Update the latest kernel releases to:
>   - 6.6.147 -> 6.6.148
>   - 6.12.100 -> 6.12.101
>   - 6.18.41 -> 6.18.42
>   - 7.1.5 -> 7.1.6
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
>   linux/{7.1.5 => 7.1.6}                       | 0
>   linux/Config.in                              | 2 +-
>   linux/before-6.17/linux.hash                 | 4 ++--
>   linux/from-6.17/linux.hash                   | 4 ++--
>   package/linux-headers/{6.12.100 => 6.12.101} | 0
>   package/linux-headers/{6.18.41 => 6.18.42}   | 0
>   package/linux-headers/{6.6.147 => 6.6.148}   | 0
>   package/linux-headers/{7.1.5 => 7.1.6}       | 0
>   package/linux-headers/Config.in.host         | 8 ++++----
>   9 files changed, 9 insertions(+), 9 deletions(-)
>   rename linux/{7.1.5 => 7.1.6} (100%)
>   rename package/linux-headers/{6.12.100 => 6.12.101} (100%)
>   rename package/linux-headers/{6.18.41 => 6.18.42} (100%)
>   rename package/linux-headers/{6.6.147 => 6.6.148} (100%)
>   rename package/linux-headers/{7.1.5 => 7.1.6} (100%)
> 
> diff --git a/linux/7.1.5 b/linux/7.1.6
> similarity index 100%
> rename from linux/7.1.5
> rename to linux/7.1.6
> diff --git a/linux/Config.in b/linux/Config.in
> index 18b789d79a..c2b52bcced 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>   
>   config BR2_LINUX_KERNEL_VERSION
>   	string
> -	default "7.1.5" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "7.1.6" if BR2_LINUX_KERNEL_LATEST_VERSION
>   	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>   	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
> index f86991284b..779def28d0 100644
> --- a/linux/before-6.17/linux.hash
> +++ b/linux/before-6.17/linux.hash
> @@ -1,6 +1,6 @@
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  67f973533406492e86774bacbcefae50d50d5c34cbf703c47ec526a5efdcee90  linux-6.12.100.tar.xz
> -sha256  e76329b7ee046883d55a1868253cffe67c526a6da6140ebecd3cd6ac44db4abb  linux-6.6.147.tar.xz
> +sha256  0d21cd11933f49f7151b7c9dbb8cc3fddc8c8abe506434b850feecf41fc28a76  linux-6.12.101.tar.xz
> +sha256  b674994b5760eb1c493711cfdc3aefb97583dfe04bb7977b4c8e7aae0710f75e  linux-6.6.148.tar.xz
>   sha256  4f0e601759b55cfc4d0bf4990859b93bc74fb915cde532284f0765b77ca0f86a  linux-6.1.180.tar.xz
>   # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
>   sha256  c4721b4b8535f3e418ee579c70645fbfd5ddfba4943c31b919e8c9522371e1d8  linux-5.15.213.tar.xz
> diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
> index c8be87c361..8072305f0b 100644
> --- a/linux/from-6.17/linux.hash
> +++ b/linux/from-6.17/linux.hash
> @@ -1,8 +1,8 @@
>   # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
> -sha256  22a0196b3cbcdf34dc27b77561f4d040585fd3447edc9ab3531a1ac79e3041e7  linux-7.1.5.tar.xz
> +sha256  995dd7188d924662b94b48fd6fb783587267590e5b8bb33dade2c771e7d855c1  linux-7.1.6.tar.xz
>   
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  17fc72f0f8d4a8a8633a5d20085f5d9c5a5ec51ee896a0b7ae1ec25da31273ea  linux-6.18.41.tar.xz
> +sha256  35a8ef5e8fb44467e56a42b40c23c4c10a61d1e95ff8d738f285230e8bed63e7  linux-6.18.42.tar.xz
>   
>   # Licenses hashes
>   sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
> diff --git a/package/linux-headers/6.12.100 b/package/linux-headers/6.12.101
> similarity index 100%
> rename from package/linux-headers/6.12.100
> rename to package/linux-headers/6.12.101
> diff --git a/package/linux-headers/6.18.41 b/package/linux-headers/6.18.42
> similarity index 100%
> rename from package/linux-headers/6.18.41
> rename to package/linux-headers/6.18.42
> diff --git a/package/linux-headers/6.6.147 b/package/linux-headers/6.6.148
> similarity index 100%
> rename from package/linux-headers/6.6.147
> rename to package/linux-headers/6.6.148
> diff --git a/package/linux-headers/7.1.5 b/package/linux-headers/7.1.6
> similarity index 100%
> rename from package/linux-headers/7.1.5
> rename to package/linux-headers/7.1.6
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index faa31b5733..563138a7f5 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -475,10 +475,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
>   	default "5.10.262"	if BR2_KERNEL_HEADERS_5_10
>   	default "5.15.213"	if BR2_KERNEL_HEADERS_5_15
>   	default "6.1.180"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.6.147"	if BR2_KERNEL_HEADERS_6_6
> -	default "6.12.100"	if BR2_KERNEL_HEADERS_6_12
> -	default "6.18.41"	if BR2_KERNEL_HEADERS_6_18
> -	default "7.1.5"		if BR2_KERNEL_HEADERS_7_1
> +	default "6.6.148"	if BR2_KERNEL_HEADERS_6_6
> +	default "6.12.101"	if BR2_KERNEL_HEADERS_6_12
> +	default "6.18.42"	if BR2_KERNEL_HEADERS_6_18
> +	default "7.1.6"		if BR2_KERNEL_HEADERS_7_1
>   	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>   	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>   	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
