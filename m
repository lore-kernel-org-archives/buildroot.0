Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2267ACCA464
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 20:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C87D340766;
	Thu, 15 Oct 2026 20:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ha_XPWb8Ju2O; Thu, 15 Oct 2026 20:33:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9A29A4068C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792096436;
	b=RwXH3BJ59ycxi3w0omXkc+1lpbN5Rx+s+Vl6v84TA/gOADTRYA3XA8bC5/fl7i0u/RNe
	 iLtBdRb2NCW6C0X3x8xwnQANjKrSx5Y3hhjiU4qJ7RDaQo1WHPSeRQr9ew3OyQY6v3A7b
	 FQmTKQrhP1PlLdWz82cXY+c7rQj6PUOVBgtXkMMSCX/xB2mXriCgXu+yNBxJ/W6dDG0D2
	 yyaG3tynX6CUET5ykQntdYTH4F0DL/cz6gTnxABwDV0lageBrHcqav3MYqhgfBZTbMA6f
	 Gus+EkTUOzWNU08DDuj5vuqICWfKqs63OTLDLROAvuw9Gj03dE459MJUaUc+6xl4jqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792096436;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=8inHVcPleARkY6VlOgzQ0smzogtQHni6jZYJJAyJQto=;
	b=YjbBg7d7dxd+C1H5JHl/LQ/yLOn14iK/jrgcDiHzqXhyYPETdfKtHuaK75PlmXBhO7cS
	 HngngnzdPzLZG60afkuf/m/5TaD3FUTLFnb6fUvGqKSmPik94J0ZHN7TVcomXFZul+GUv
	 HkMyBdxRKyVCQuIzlzEQUNUdkN0QxmmT16+yB/nGakU/b+S7ivw+ZK1XP1CfVZ+kCyGBs
	 4hNzhXvwmK7L6CtPCOeD+SgEJ5gmiAAkaGAjngd+6UHXzds9Vss58mqOBV8tJ+oo5AmkA
	 cK27UpxkB2SQHpIMJyF+sElSULwm5IcmPlU/FhPBTC3Zj+ibRUySB6NXR/jLrhPFrDA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792096436;
	bh=8inHVcPleARkY6VlOgzQ0smzogtQHni6jZYJJAyJQto=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=D3HK9AdC1z54BeIV7xniyBKGGfdrpu8QAlpZVkgvCz78Qt84pwKBzaCXqIxCC28ii
	 xwAD0PKN0ar6429UQ8QiyFrbgTCfvZ9C78XcNvrIdii2UpncKH1TxHFNir9hes61Qk
	 xK4e70axjWGAQEAjgqV+bZuSEGvfJAC7WwVOrDWrcVcDW2r8DYy3/ekNfOJLF9PY4f
	 D/V6sbmeUewibGHQK5NUo0+SlS2O3fN7bG7HJiQ5i+Q/JlUGqh/qc/ZcxvoUlBHbUn
	 9H5uYsfNbpyMNTjBK3tDVhAK+5vnyrx+5tMskJIj4oTukcKt7qsrsuvOZJ+d4piJVg
	 sj6EYxece7tQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A29A4068C;
	Thu, 15 Oct 2026 20:33:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4054D920
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26BC660829
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qlpO5wpoEwvy for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 20:33:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D109060821
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792096433;
 b=pzpGngioyuevCZxFaQa6gwrY1QXzQOGQAgPGgEmon5Re/a8xMegbEQcLxr7QkNlt+hoR
 UKO8QKlFwc4JrvrBe9REDfuAQUSNZVYHhVxf0b22bpkGgxfbjvzvzZ22T9LiHzu3y1X8L
 oA5O+YeMf9zMW563yDJZXxEYk4ppLdVCTR1Xvhz4J4jfIAEzUUuB8E/rGpI3xP44sA3dE
 +4CRmVncvc1O7xEGL4j87xkOOOvfjBFZ2pDYxfl44LeqqQL89N5HDzaQnwYSWfMkMOymO
 esqj7j9ZLcp2vLlmKgZdyHN3RPbCxr6+R1otPbQAoymUuE47A93Ywo+OXeZ5NEGTfaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792096433;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=RPgCTtDl0bmzLCcsjLyeZsj9sFeyN/lgA9J8mD4Sh98=;
 b=OIhj+dWbAwRlqQVo0ZdN6IKtiGof9p/7ksh1y041iCfklrd6m/e4wHyh9jr/2MP3R6Os
 apB4AhWUUBI1+GHZXGpAft+ctIGPg32UzoxLLH8ZV4O4KG0nkgFgDJDNzJd9tMqh9r7a9
 9hYc8urEwZLxeviv4HE8FShZbK1TN4Ko91qEY58nEjnd/TnCWQntFaknitTBqr1fANl0v
 5rV4K8f+Vpl8zJiHFP7Ul3fWsel7Hi7K5SHknb5KO3Fabi5xG8f2vwGtR581RjAWpvU4I
 jFMw4nTyAjLzymF9qjooXi8uLGsOyu0bE0AfUGkrnk0h+n0kXV5W8yQXtpY5uHj71DA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=dL3zbcuK; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D109060821
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:33:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5QF5-1xIHcm23fR-0095X3; Thu, 15
 Oct 2026 22:33:49 +0200
Message-ID: <f49503f9-4ae6-44a3-9f07-653963825734@gmx.de>
Date: Thu, 15 Oct 2026 22:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20261015193031.4104937-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261015193031.4104937-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:Gp71XuKUm05aBb2SJiEvJ7JQrA+8aLt6z5xClw4ZKesoKw63HNA
 q9YFX4TM8438/30A0NwrHvmic03vHk7Q/FgM1HEStcTKzZCjo29y4rfm65vlHcnUBoe1CAt
 Tsgf5fuBNZr24hIt2fblH5ozkkQ6zMlJsNaPDGPUDdZjO5FFLAjOoFMvlKfn9DWjqu0qXLE
 XHK9KHT4GH3RV7VM8T4Ng==
UI-OutboundReport: notjunk:1;M01:P0:WfsdOg9cKqU=;sF7vBbOdbqj6OK0DH1LVcBspZbW
 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
 zBuO237m4b+kERZdeDcv4frgsSL6EoYE
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.2.x,
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

Am 15.10.26 um 21:30 schrieb Bernd Kuhls:
> Update the latest kernel releases to:
>   - 7.2.10 -> 7.2.11
>   - 6.18.56 -> 6.18.57
>   - 6.12.112 -> 6.12.113
>   - 6.6.158 -> 6.6.159
>   - 6.1.189 -> 6.1.190
>   - 5.15.222 -> 5.15.223
>   - 5.10.271 -> 5.10.272
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
>   linux/{5.10.271 => 5.10.272}                 |  0
>   linux/{5.15.222 => 5.15.223}                 |  0
>   linux/{6.1.189 => 6.1.190}                   |  0
>   linux/{6.12.112 => 6.12.113}                 |  0
>   linux/{6.18.56 => 6.18.57}                   |  0
>   linux/{6.6.158 => 6.6.159}                   |  0
>   linux/{7.2.10 => 7.2.11}                     |  0
>   linux/Config.in                              | 14 +++++++-------
>   linux/before-6.17/linux.hash                 | 10 +++++-----
>   linux/from-6.17/linux.hash                   |  4 ++--
>   package/linux-headers/{5.10.271 => 5.10.272} |  0
>   package/linux-headers/{5.15.222 => 5.15.223} |  0
>   package/linux-headers/{6.1.189 => 6.1.190}   |  0
>   package/linux-headers/{6.12.112 => 6.12.113} |  0
>   package/linux-headers/{6.18.56 => 6.18.57}   |  0
>   package/linux-headers/{6.6.158 => 6.6.159}   |  0
>   package/linux-headers/{7.2.10 => 7.2.11}     |  0
>   package/linux-headers/Config.in.host         | 14 +++++++-------
>   18 files changed, 21 insertions(+), 21 deletions(-)
>   rename linux/{5.10.271 => 5.10.272} (100%)
>   rename linux/{5.15.222 => 5.15.223} (100%)
>   rename linux/{6.1.189 => 6.1.190} (100%)
>   rename linux/{6.12.112 => 6.12.113} (100%)
>   rename linux/{6.18.56 => 6.18.57} (100%)
>   rename linux/{6.6.158 => 6.6.159} (100%)
>   rename linux/{7.2.10 => 7.2.11} (100%)
>   rename package/linux-headers/{5.10.271 => 5.10.272} (100%)
>   rename package/linux-headers/{5.15.222 => 5.15.223} (100%)
>   rename package/linux-headers/{6.1.189 => 6.1.190} (100%)
>   rename package/linux-headers/{6.12.112 => 6.12.113} (100%)
>   rename package/linux-headers/{6.18.56 => 6.18.57} (100%)
>   rename package/linux-headers/{6.6.158 => 6.6.159} (100%)
>   rename package/linux-headers/{7.2.10 => 7.2.11} (100%)
> 
> diff --git a/linux/5.10.271 b/linux/5.10.272
> similarity index 100%
> rename from linux/5.10.271
> rename to linux/5.10.272
> diff --git a/linux/5.15.222 b/linux/5.15.223
> similarity index 100%
> rename from linux/5.15.222
> rename to linux/5.15.223
> diff --git a/linux/6.1.189 b/linux/6.1.190
> similarity index 100%
> rename from linux/6.1.189
> rename to linux/6.1.190
> diff --git a/linux/6.12.112 b/linux/6.12.113
> similarity index 100%
> rename from linux/6.12.112
> rename to linux/6.12.113
> diff --git a/linux/6.18.56 b/linux/6.18.57
> similarity index 100%
> rename from linux/6.18.56
> rename to linux/6.18.57
> diff --git a/linux/6.6.158 b/linux/6.6.159
> similarity index 100%
> rename from linux/6.6.158
> rename to linux/6.6.159
> diff --git a/linux/7.2.10 b/linux/7.2.11
> similarity index 100%
> rename from linux/7.2.10
> rename to linux/7.2.11
> diff --git a/linux/Config.in b/linux/Config.in
> index 95c9c83e07..4384968a97 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -182,13 +182,13 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>   
>   config BR2_LINUX_KERNEL_VERSION
>   	string
> -	default "7.2.10" if BR2_LINUX_KERNEL_LATEST_VERSION
> -	default "6.18.56" if BR2_LINUX_KERNEL_LATEST_6_18
> -	default "6.12.112" if BR2_LINUX_KERNEL_LATEST_6_12
> -	default "6.6.158" if BR2_LINUX_KERNEL_LATEST_6_6
> -	default "6.1.189" if BR2_LINUX_KERNEL_LATEST_6_1
> -	default "5.15.222" if BR2_LINUX_KERNEL_LATEST_5_15
> -	default "5.10.271" if BR2_LINUX_KERNEL_LATEST_5_10
> +	default "7.2.11" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "6.18.57" if BR2_LINUX_KERNEL_LATEST_6_18
> +	default "6.12.113" if BR2_LINUX_KERNEL_LATEST_6_12
> +	default "6.6.159" if BR2_LINUX_KERNEL_LATEST_6_6
> +	default "6.1.190" if BR2_LINUX_KERNEL_LATEST_6_1
> +	default "5.15.223" if BR2_LINUX_KERNEL_LATEST_5_15
> +	default "5.10.272" if BR2_LINUX_KERNEL_LATEST_5_10
>   	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>   	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
> index bd821b0800..d288e880e7 100644
> --- a/linux/before-6.17/linux.hash
> +++ b/linux/before-6.17/linux.hash
> @@ -1,10 +1,10 @@
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  164dc9d1f6c93c61a15e1f071c48379b467f2b17c469cce7223471968208ed03  linux-6.12.112.tar.xz
> -sha256  9eb33173b0e04e898d431587c78c47ee6e19e3fdf2ea007323de82af14bb2a4f  linux-6.6.158.tar.xz
> -sha256  3ec834a2fefc9a08aac62f993525d7acd10163db6f01d63b4549cbff3f5c9439  linux-6.1.189.tar.xz
> +sha256  e09b6727e5c521253f0d41694900b9c38fb7604db7d35238a8197aa9f7de2428  linux-6.12.113.tar.xz
> +sha256  7206727244da5d85f4a03758d29e1c0673f2f01877793f494c0f3638c46b8fa5  linux-6.6.159.tar.xz
> +sha256  8aa50daca0412a3d0a61a87af3744f39773d40b3132635fb7bc9be652cdb7b0c  linux-6.1.190.tar.xz
>   # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> -sha256  4d6ec07679bd008524391cb67597106018646c6378b3953c23ec69b9259cdf84  linux-5.15.222.tar.xz
> -sha256  a1b8dfbc0c533694d474caeb156cee47992781e6832ab108bd4266b48ccc252f  linux-5.10.271.tar.xz
> +sha256  c1faba89652ec4af585fb96131fdb70d99e891c2b368cbf6d9c1e5fb7f156c23  linux-5.15.223.tar.xz
> +sha256  e7e6e7db0fc009fa223ed10bb37be059042c463593f35f50b5c5cc4a70351614  linux-5.10.272.tar.xz
>   # Locally computed
>   sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
>   sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
> diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
> index 3554a93713..96b0dcce55 100644
> --- a/linux/from-6.17/linux.hash
> +++ b/linux/from-6.17/linux.hash
> @@ -1,8 +1,8 @@
>   # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
> -sha256  2feaa70453e91f541be6a5c9078d8168e081af45a3d9718054850538cff2ebf3  linux-7.2.10.tar.xz
> +sha256  fd0fc479f983a8c05313f13e9c36330fe6651cf725396748c40d5cd93fa1e6a4  linux-7.2.11.tar.xz
>   
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  4633bbda2ab95eaf2a7af4041236451d6759c72e6946265531af4b3aacefbf89  linux-6.18.56.tar.xz
> +sha256  5bd9acdc82ec5efc3790ae840e5aaa40dfde7efff261cf6dde902dc570acf98c  linux-6.18.57.tar.xz
>   
>   # Licenses hashes
>   sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
> diff --git a/package/linux-headers/5.10.271 b/package/linux-headers/5.10.272
> similarity index 100%
> rename from package/linux-headers/5.10.271
> rename to package/linux-headers/5.10.272
> diff --git a/package/linux-headers/5.15.222 b/package/linux-headers/5.15.223
> similarity index 100%
> rename from package/linux-headers/5.15.222
> rename to package/linux-headers/5.15.223
> diff --git a/package/linux-headers/6.1.189 b/package/linux-headers/6.1.190
> similarity index 100%
> rename from package/linux-headers/6.1.189
> rename to package/linux-headers/6.1.190
> diff --git a/package/linux-headers/6.12.112 b/package/linux-headers/6.12.113
> similarity index 100%
> rename from package/linux-headers/6.12.112
> rename to package/linux-headers/6.12.113
> diff --git a/package/linux-headers/6.18.56 b/package/linux-headers/6.18.57
> similarity index 100%
> rename from package/linux-headers/6.18.56
> rename to package/linux-headers/6.18.57
> diff --git a/package/linux-headers/6.6.158 b/package/linux-headers/6.6.159
> similarity index 100%
> rename from package/linux-headers/6.6.158
> rename to package/linux-headers/6.6.159
> diff --git a/package/linux-headers/7.2.10 b/package/linux-headers/7.2.11
> similarity index 100%
> rename from package/linux-headers/7.2.10
> rename to package/linux-headers/7.2.11
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index f21f543f7f..bdf0bb58b8 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -474,13 +474,13 @@ endchoice
>   
>   config BR2_DEFAULT_KERNEL_HEADERS
>   	string
> -	default "5.10.271"	if BR2_KERNEL_HEADERS_5_10
> -	default "5.15.222"	if BR2_KERNEL_HEADERS_5_15
> -	default "6.1.189"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.6.158"	if BR2_KERNEL_HEADERS_6_6
> -	default "6.12.112"	if BR2_KERNEL_HEADERS_6_12
> -	default "6.18.56"	if BR2_KERNEL_HEADERS_6_18
> -	default "7.2.10"		if BR2_KERNEL_HEADERS_7_2
> +	default "5.10.272"	if BR2_KERNEL_HEADERS_5_10
> +	default "5.15.223"	if BR2_KERNEL_HEADERS_5_15
> +	default "6.1.190"	if BR2_KERNEL_HEADERS_6_1
> +	default "6.6.159"	if BR2_KERNEL_HEADERS_6_6
> +	default "6.12.113"	if BR2_KERNEL_HEADERS_6_12
> +	default "6.18.57"	if BR2_KERNEL_HEADERS_6_18
> +	default "7.2.11"		if BR2_KERNEL_HEADERS_7_2
>   	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>   	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>   	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
