Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C18BC5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53ECF608D4;
	Fri,  7 Aug 2026 11:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpS-EYvr2ymf; Fri,  7 Aug 2026 11:28:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55A0A60905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786102088;
	bh=Q1vShoa0Pv59nVFwTq5I9ZSP20NNeqtFEVjzgTjHzpE=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=DMCo32ibhuyiPIL8RDqsNKQFPFb9bRC3VQxpsi0ZZ67LjkExnu6aXOYlk16D8VT8W
	 SyBoXZ2481yA4UtsmqCrpDU16rpWL4QMgPOmcewGTO7rJntxky7dUS0KpCEDMmg+Ap
	 s/i8nZTGymlVlY34ETgWyX+m0zAIXaPF//pPFa51BzQGBrOErFUJ4o2crbfXWUMPxY
	 //Cg0IVP5j3ULl51FmDtOsHhRGAz8PvXBZ5muWcRC1LDD2Zd5+iD2dVOKUKwjPyNEO
	 KV3C6ZliVIQ0UjZtnwTRDM9np02/t0WzLOsXJ3dpNAzmOf2SGViIfRGUYZ6hflf31w
	 3qvUw7tKzL4Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55A0A60905;
	Fri,  7 Aug 2026 11:28:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC3CD10E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDD53403EE
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:28:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HXyXW9MF3Ynn for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:28:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4A44140092
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A44140092
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A44140092
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:28:04 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlf4c-1xJ9Jj32yg-00hvLl; Fri, 07
 Aug 2026 13:28:01 +0200
Message-ID: <9beeb486-46ea-41e7-b2cb-02093fbc0f20@gmx.de>
Date: Fri, 7 Aug 2026 13:28:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260807065431.3466830-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260807065431.3466830-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:VBg77OatbYkFp3aI49Ul+0uIiZ0rBF2Zn2kT601DdrITtOxtUzz
 bm++wZ4OqLdYja/Bk127BeqQVXrinWJjWEIsgJ+DavwQqu3eyyrLW7gKJLg2PC/w73wyhTJ
 0atPweXjr4CR/1moSrnrGw5E23KyTZrNlQkBX35tGIRpwDtdGuzBT7OqrZLz3pECEdX+ErT
 6qwp5OAsaq4cHTvZqkgHg==
UI-OutboundReport: notjunk:1;M01:P0:gPvVT5QpDFU=;/xV21LIU91alSeHtTsgOz7cFZAN
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1786102082; x=1786706882; i=fiona.klute@gmx.de;
 bh=Oz54TRo4X3WL+hRdQapHclq6vhN9jAcqlZheXejNBx0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=dRXex3eu/S/Krh6F4DYhwWyqj05zpAgZGuzF1FRdjP4n0EWQhEiWQvBINcT2ZHU2
 ETBQgB5AWgaFiH6ZH1vqrM9GpQCZobifZiqZR1d1Xh0T3wiO2wg0L7jzb5lDK1iZN
 ZN5KMVUygqvubDIEG6pSwDoiH1youZV7n79D9q4YeCi0xUbPwRnQoRB8aatZ3AY4U
 yRm0WauoROLi/O1PgEdNkKTc4YGmRTOtCvyRIN0t16gRBnBM0vbSv6sMvvOZVR1Qg
 oRMaWwOtu451OhuQbRYui36ccG9W7gXcBnf6ZsbDOKma9U1Od0uUa3KbGW6k+28WD
 g7pC0iBZ10n5wuRhpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=dRXex3eu
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.1.x,
 6.18.x, 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
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

Am 07.08.26 um 08:54 schrieb Bernd Kuhls:
> Update the latest kernel releases to:
>   - 7.1.6 -> 7.1.7
>   - 6.18.42 -> 6.18.43
>   - 6.12.101 -> 6.12.102
>   - 6.6.148 -> 6.6.149
>   - 6.1.180 -> 6.1.181
>   - 5.15.213 -> 5.15.214
>   - 5.10.262 -> 5.10.263
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
>   linux/{7.1.6 => 7.1.7}                       |  0
>   linux/Config.in                              |  2 +-
>   linux/before-6.17/linux.hash                 | 10 +++++-----
>   linux/from-6.17/linux.hash                   |  4 ++--
>   package/linux-headers/{5.10.262 => 5.10.263} |  0
>   package/linux-headers/{5.15.213 => 5.15.214} |  0
>   package/linux-headers/{6.1.180 => 6.1.181}   |  0
>   package/linux-headers/{6.12.101 => 6.12.102} |  0
>   package/linux-headers/{6.18.42 => 6.18.43}   |  0
>   package/linux-headers/{6.6.148 => 6.6.149}   |  0
>   package/linux-headers/{7.1.6 => 7.1.7}       |  0
>   package/linux-headers/Config.in.host         | 14 +++++++-------
>   12 files changed, 15 insertions(+), 15 deletions(-)
>   rename linux/{7.1.6 => 7.1.7} (100%)
>   rename package/linux-headers/{5.10.262 => 5.10.263} (100%)
>   rename package/linux-headers/{5.15.213 => 5.15.214} (100%)
>   rename package/linux-headers/{6.1.180 => 6.1.181} (100%)
>   rename package/linux-headers/{6.12.101 => 6.12.102} (100%)
>   rename package/linux-headers/{6.18.42 => 6.18.43} (100%)
>   rename package/linux-headers/{6.6.148 => 6.6.149} (100%)
>   rename package/linux-headers/{7.1.6 => 7.1.7} (100%)
> 
> diff --git a/linux/7.1.6 b/linux/7.1.7
> similarity index 100%
> rename from linux/7.1.6
> rename to linux/7.1.7
> diff --git a/linux/Config.in b/linux/Config.in
> index c2b52bcced..5dd0e9393e 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>   
>   config BR2_LINUX_KERNEL_VERSION
>   	string
> -	default "7.1.6" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "7.1.7" if BR2_LINUX_KERNEL_LATEST_VERSION
>   	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>   	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
> index 779def28d0..34d3be41d6 100644
> --- a/linux/before-6.17/linux.hash
> +++ b/linux/before-6.17/linux.hash
> @@ -1,10 +1,10 @@
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  0d21cd11933f49f7151b7c9dbb8cc3fddc8c8abe506434b850feecf41fc28a76  linux-6.12.101.tar.xz
> -sha256  b674994b5760eb1c493711cfdc3aefb97583dfe04bb7977b4c8e7aae0710f75e  linux-6.6.148.tar.xz
> -sha256  4f0e601759b55cfc4d0bf4990859b93bc74fb915cde532284f0765b77ca0f86a  linux-6.1.180.tar.xz
> +sha256  694bb5f49371323ab9c2b7040bd358ed81bffbe80b372d76507045828f655803  linux-6.12.102.tar.xz
> +sha256  a7ef7a894d6c5111eb5281167819a76bf08914edacd953e7704de045b73ac3d0  linux-6.6.149.tar.xz
> +sha256  d9b94ba489852aceb676c6f9e54502766a4e8363d9da114e6213bc0b6fb18908  linux-6.1.181.tar.xz
>   # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> -sha256  c4721b4b8535f3e418ee579c70645fbfd5ddfba4943c31b919e8c9522371e1d8  linux-5.15.213.tar.xz
> -sha256  fae7da8a9b97e5386f0a3dc3c5c8a88be17fcf2d0792a58a5a0c5b4f5775b483  linux-5.10.262.tar.xz
> +sha256  61d2c47f4b7148ce101cb257b8dfde301c2df5c64b4b53eb2e038a2fa709e541  linux-5.15.214.tar.xz
> +sha256  c93338f367aab6c746bff8a05bca82665702065493127e204be4a96d4e4c7da6  linux-5.10.263.tar.xz
>   # Locally computed
>   sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
>   sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
> diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
> index 8072305f0b..f527761764 100644
> --- a/linux/from-6.17/linux.hash
> +++ b/linux/from-6.17/linux.hash
> @@ -1,8 +1,8 @@
>   # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
> -sha256  995dd7188d924662b94b48fd6fb783587267590e5b8bb33dade2c771e7d855c1  linux-7.1.6.tar.xz
> +sha256  ca8f2a6884a4d62043e9ab93ac1ab15efc2b6630fe8f768b2ef2ffdf4b5e26df  linux-7.1.7.tar.xz
>   
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  35a8ef5e8fb44467e56a42b40c23c4c10a61d1e95ff8d738f285230e8bed63e7  linux-6.18.42.tar.xz
> +sha256  a1aeb926c7c4a1564368200b1082e45bb958007682d804aff88abbc3a7a47b5d  linux-6.18.43.tar.xz
>   
>   # Licenses hashes
>   sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
> diff --git a/package/linux-headers/5.10.262 b/package/linux-headers/5.10.263
> similarity index 100%
> rename from package/linux-headers/5.10.262
> rename to package/linux-headers/5.10.263
> diff --git a/package/linux-headers/5.15.213 b/package/linux-headers/5.15.214
> similarity index 100%
> rename from package/linux-headers/5.15.213
> rename to package/linux-headers/5.15.214
> diff --git a/package/linux-headers/6.1.180 b/package/linux-headers/6.1.181
> similarity index 100%
> rename from package/linux-headers/6.1.180
> rename to package/linux-headers/6.1.181
> diff --git a/package/linux-headers/6.12.101 b/package/linux-headers/6.12.102
> similarity index 100%
> rename from package/linux-headers/6.12.101
> rename to package/linux-headers/6.12.102
> diff --git a/package/linux-headers/6.18.42 b/package/linux-headers/6.18.43
> similarity index 100%
> rename from package/linux-headers/6.18.42
> rename to package/linux-headers/6.18.43
> diff --git a/package/linux-headers/6.6.148 b/package/linux-headers/6.6.149
> similarity index 100%
> rename from package/linux-headers/6.6.148
> rename to package/linux-headers/6.6.149
> diff --git a/package/linux-headers/7.1.6 b/package/linux-headers/7.1.7
> similarity index 100%
> rename from package/linux-headers/7.1.6
> rename to package/linux-headers/7.1.7
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 563138a7f5..8f4cd3b283 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -472,13 +472,13 @@ endchoice
>   
>   config BR2_DEFAULT_KERNEL_HEADERS
>   	string
> -	default "5.10.262"	if BR2_KERNEL_HEADERS_5_10
> -	default "5.15.213"	if BR2_KERNEL_HEADERS_5_15
> -	default "6.1.180"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.6.148"	if BR2_KERNEL_HEADERS_6_6
> -	default "6.12.101"	if BR2_KERNEL_HEADERS_6_12
> -	default "6.18.42"	if BR2_KERNEL_HEADERS_6_18
> -	default "7.1.6"		if BR2_KERNEL_HEADERS_7_1
> +	default "5.10.263"	if BR2_KERNEL_HEADERS_5_10
> +	default "5.15.214"	if BR2_KERNEL_HEADERS_5_15
> +	default "6.1.181"	if BR2_KERNEL_HEADERS_6_1
> +	default "6.6.149"	if BR2_KERNEL_HEADERS_6_6
> +	default "6.12.102"	if BR2_KERNEL_HEADERS_6_12
> +	default "6.18.43"	if BR2_KERNEL_HEADERS_6_18
> +	default "7.1.7"		if BR2_KERNEL_HEADERS_7_1
>   	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>   	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>   	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
