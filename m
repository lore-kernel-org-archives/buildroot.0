Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9891EC5AC82
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 08:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BC5C606AA;
	Mon, 10 Aug 2026 08:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iY5k7igYrw4p; Mon, 10 Aug 2026 08:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C401605DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786351546;
	bh=Wz8fDVngyS57UFoEXo6wyvvkUWdtEfYBWH8VfnA6nKQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=B0IUWylGlKRRVsBE68Rj/rrCQWri5lG1yNHEnWHba2mWguMJOP3Lffvidjtt3jeyx
	 yXXp86MuUnUFFiyVi6UmFr2QcQpvqRrimor1DHY/jPfcPqDBl1ELRf9QfxHUciiJpF
	 5Cg2e9VWixUC0HNsBpXW6Kwcg8GpyrYmW2/C78oDKHrUk7wV0eIP982vQWHHVyJnge
	 Ob9+WbW/PJu/YkmRY+twAV3P3+fhuYhut0Vy/OfyboNBuV8jWnRtK8LiT9nFnTwXT4
	 wahPZwY3Y9JWg+0jyuzcKR5mnYmTIKN7Y/GnZYjWT6exJd/07lLTc06K2jE1LdwlKr
	 ILDgTZhirUxDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C401605DF;
	Mon, 10 Aug 2026 08:45:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ECD90282
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2C8F400EF
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5ZjYr9BlokU for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 08:45:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B5C7400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B5C7400F1
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B5C7400F1
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:45:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mwfai-1x4poG25WM-00rKCo; Mon, 10
 Aug 2026 10:45:38 +0200
Message-ID: <7475b69d-110d-42b8-80c4-b29cd326e0c7@gmx.de>
Date: Mon, 10 Aug 2026 10:45:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260810070214.3484125-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260810070214.3484125-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:Dh7T4eicR3e4fqr1GPLp5rwxIBRZihus2kEw0HJkD+S6uyG38MH
 Yzt8k4lUc6ecn0fK/hFg06T8QmmV8P+RH61vrXjytmJum/uL6mzvtggJgas/5QTh1ze9m6+
 DOKlb5XwonQ7wzAncwtZ12Ifgy18Nzbej9jJ7IivUwCURNqhBsiJ1jWA/hTVh4NiAQfuCTW
 KADjge12KraXdCK+SSZIQ==
UI-OutboundReport: notjunk:1;M01:P0:2WiHgWBtZXQ=;DYR5wm3fsRx/qi7bI1263b8fjHD
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1786351538; x=1786956338; i=fiona.klute@gmx.de;
 bh=oIHfJrURwHf+k3TUPMjtzPLPu+Y+kGQ0ai2aILV3AVE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=uLwQhdgSRF8ZM5qpMnz0vfQ/HDKsETeWKB4PTKIqapR/Y55Hcj/aCrqGSqkbOeyO
 qUqExq+y6/seLUHPdn0vjhZXP+gDxVOl4vD8w5+Zh4OicHy70apiuOjm/c+6H6yq5
 wVppghH6mHnmzAKTn9c9qqcYRpZb/FRT65yNGV7+4M0ZVgh6+pOMT3Iiq3ko3BT0r
 TRX7NS0QG8vjGBccGdzus90uSkbBWGGVMHIzFiRL0hpyI0Q243fDNTxnYpCPK1lmZ
 CzHO+oOQBRdkNQ4pR9WuYwJ4kUSqyoUMl/EJFVj3XrajdE7rD1x9HKAyDIQ5oxf+j
 OqY4Q3YyuhtF3KJNpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=uLwQhdgS
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x,
 6.6.x, 7.1.x, 6.18.x series
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

Am 10.08.26 um 09:02 schrieb Bernd Kuhls:
> Update the latest kernel releases to:
>   - 6.12.102 -> 6.12.103
>   - 6.6.150 -> 6.6.151
>   - 7.1.7 -> 7.1.8
>   - 6.18.43 -> 6.18.44
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
>   linux/{7.1.7 => 7.1.8}                       | 0
>   linux/Config.in                              | 2 +-
>   linux/before-6.17/linux.hash                 | 4 ++--
>   linux/from-6.17/linux.hash                   | 4 ++--
>   package/linux-headers/{6.12.102 => 6.12.103} | 0
>   package/linux-headers/{6.18.43 => 6.18.44}   | 0
>   package/linux-headers/{6.6.150 => 6.6.151}   | 0
>   package/linux-headers/{7.1.7 => 7.1.8}       | 0
>   package/linux-headers/Config.in.host         | 8 ++++----
>   9 files changed, 9 insertions(+), 9 deletions(-)
>   rename linux/{7.1.7 => 7.1.8} (100%)
>   rename package/linux-headers/{6.12.102 => 6.12.103} (100%)
>   rename package/linux-headers/{6.18.43 => 6.18.44} (100%)
>   rename package/linux-headers/{6.6.150 => 6.6.151} (100%)
>   rename package/linux-headers/{7.1.7 => 7.1.8} (100%)
> 
> diff --git a/linux/7.1.7 b/linux/7.1.8
> similarity index 100%
> rename from linux/7.1.7
> rename to linux/7.1.8
> diff --git a/linux/Config.in b/linux/Config.in
> index 5dd0e9393e..2c6b94aed2 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>   
>   config BR2_LINUX_KERNEL_VERSION
>   	string
> -	default "7.1.7" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "7.1.8" if BR2_LINUX_KERNEL_LATEST_VERSION
>   	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>   	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
> index 7102a69377..c1e447e255 100644
> --- a/linux/before-6.17/linux.hash
> +++ b/linux/before-6.17/linux.hash
> @@ -1,6 +1,6 @@
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  694bb5f49371323ab9c2b7040bd358ed81bffbe80b372d76507045828f655803  linux-6.12.102.tar.xz
> -sha256  6eb823269151936c0af9e050678ed5c70ca515d6b20a09af741852b02d228979  linux-6.6.150.tar.xz
> +sha256  f143aaade8877ba5616e788b4482576db28481bcf557ef537f4fcc3938fc3176  linux-6.12.103.tar.xz
> +sha256  de01e5ae73412b70bceb41a6f97da6d0f29b6536f1f00f8b6a6fd40c729969f7  linux-6.6.151.tar.xz
>   sha256  f38416bb6e8024a21ae868c7f29cd15293a73755e3484c7f2f4adea5b03c1f85  linux-6.1.182.tar.xz
>   # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
>   sha256  d57f279da0813fa6d69fb2e59cf9a364be4faa1cd18cb76b0b64c074fd23b7a7  linux-5.15.215.tar.xz
> diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
> index f527761764..bb9750191d 100644
> --- a/linux/from-6.17/linux.hash
> +++ b/linux/from-6.17/linux.hash
> @@ -1,8 +1,8 @@
>   # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
> -sha256  ca8f2a6884a4d62043e9ab93ac1ab15efc2b6630fe8f768b2ef2ffdf4b5e26df  linux-7.1.7.tar.xz
> +sha256  ff01dcb449279d5b4cfccdb01fee639cf5ff1803f1749a77844dd33915422c49  linux-7.1.8.tar.xz
>   
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  a1aeb926c7c4a1564368200b1082e45bb958007682d804aff88abbc3a7a47b5d  linux-6.18.43.tar.xz
> +sha256  0f72d938f06828e82c90405174fe572287db7bfe089e2fc46572a99a7f240d43  linux-6.18.44.tar.xz
>   
>   # Licenses hashes
>   sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
> diff --git a/package/linux-headers/6.12.102 b/package/linux-headers/6.12.103
> similarity index 100%
> rename from package/linux-headers/6.12.102
> rename to package/linux-headers/6.12.103
> diff --git a/package/linux-headers/6.18.43 b/package/linux-headers/6.18.44
> similarity index 100%
> rename from package/linux-headers/6.18.43
> rename to package/linux-headers/6.18.44
> diff --git a/package/linux-headers/6.6.150 b/package/linux-headers/6.6.151
> similarity index 100%
> rename from package/linux-headers/6.6.150
> rename to package/linux-headers/6.6.151
> diff --git a/package/linux-headers/7.1.7 b/package/linux-headers/7.1.8
> similarity index 100%
> rename from package/linux-headers/7.1.7
> rename to package/linux-headers/7.1.8
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 4fa0bc80f9..ad1a5bd70c 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -475,10 +475,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
>   	default "5.10.264"	if BR2_KERNEL_HEADERS_5_10
>   	default "5.15.215"	if BR2_KERNEL_HEADERS_5_15
>   	default "6.1.182"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.6.150"	if BR2_KERNEL_HEADERS_6_6
> -	default "6.12.102"	if BR2_KERNEL_HEADERS_6_12
> -	default "6.18.43"	if BR2_KERNEL_HEADERS_6_18
> -	default "7.1.7"		if BR2_KERNEL_HEADERS_7_1
> +	default "6.6.151"	if BR2_KERNEL_HEADERS_6_6
> +	default "6.12.103"	if BR2_KERNEL_HEADERS_6_12
> +	default "6.18.44"	if BR2_KERNEL_HEADERS_6_18
> +	default "7.1.8"		if BR2_KERNEL_HEADERS_7_1
>   	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>   	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>   	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
