Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7825CD6E55
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A0516066F;
	Mon,  1 Jun 2026 19:00:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WybNfDuyZo5D; Mon,  1 Jun 2026 19:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D4E560675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780340416;
	bh=2HCRrbsUkxnTma3MpvgVq8pGP+NjGDAQ7DtiVBjP91k=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=O1vhnGYbr46JCyJZBqB25oMyfJG1P4Pu5dE8kldmHk7e2b6NM3Kx7p/cbaI6Gpayh
	 DCOrgcH1vB7GL4weQy5ADaN7QyS6tnmj92WOnipgo5hoQxQ1iE2OD5K6qjfrWi64vG
	 OoieknrOiO740CMlUaXquYurX9pKZx7nBXm4vjJH87/EbCwpYTJ+YUhMEzt7jZWH16
	 LfS73hrtOBq/Q/nDLolMUwPFcHJxghyDFDjRoqdxf0HhUHUPLreBYWzKRqURzDawtP
	 5Bfz1fmdliNcwRScfBA/JID9RoM13tc1xSd/N/vPpX5UBNE5eJFhTBfarXc3OZjeEC
	 v+PKeT6Jf7vKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D4E560675;
	Mon,  1 Jun 2026 19:00:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F9BCF4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E90BD4074F
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:00:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IAvJYXrYeC_6 for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:00:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 91BA840776
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91BA840776
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91BA840776
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:00:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0B8B3B97C776; Mon,  1 Jun 2026 21:00:10 +0200 (CEST)
Message-ID: <c19c502d-5dc4-458a-8824-d11eb4f1003e@rnout.be>
Date: Mon, 1 Jun 2026 21:00:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260601180728.1601204-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260601180728.1601204-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780340411; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Dvo4hLtITtIsyfy2bga6Sge7tOWbjEzMiyfqBfoFeAI=;
 b=niCjN7s2Y/JP7zaDIYIRxoPsxig3R+q507lDLHyljGKw8Ei1W2npz+SNB2LLd3PpFqdgzg
 Yld4oXnyrGESxamX+RsxToTe4qs2728MZo2z14n3QoJq8qhenYIkAl3DBqhdSQjN5/WTou
 RN1cmXBeKDVJinMIeO4W7NORGCdr8xJgMOpHRQrBUxs21pWhSU11CGZQQRU1AYcBOgbyhT
 swSkjLfhybNJZ8KCgTcpM3duNyT4KLTLY8wIOgSt+YptT9vaLMHuBqyVk7NoyAh0ghndDk
 hErhrPB4eIz6ozlvu2oEKRP6SVd0K9dt+4opp9YsutYyQtNvSBPnYYk5W/Laww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=niCjN7s2
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18}.x / 7.0.x series
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/06/2026 20:07, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Gitlab pipeline passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/69547a223a0111255981f7ce96100adad3c2bde1
> 
>   linux/{7.0.10 => 7.0.11}                     |  0
>   linux/Config.in                              |  2 +-
>   linux/before-6.17/linux.hash                 | 10 +++++-----
>   linux/from-6.17/linux.hash                   |  4 ++--
>   package/linux-headers/{5.10.257 => 5.10.258} |  0
>   package/linux-headers/{5.15.208 => 5.15.209} |  0
>   package/linux-headers/{6.1.174 => 6.1.175}   |  0
>   package/linux-headers/{6.12.91 => 6.12.92}   |  0
>   package/linux-headers/{6.18.33 => 6.18.34}   |  0
>   package/linux-headers/{6.6.141 => 6.6.142}   |  0
>   package/linux-headers/{7.0.10 => 7.0.11}     |  0
>   package/linux-headers/Config.in.host         | 14 +++++++-------
>   12 files changed, 15 insertions(+), 15 deletions(-)
>   rename linux/{7.0.10 => 7.0.11} (100%)
>   rename package/linux-headers/{5.10.257 => 5.10.258} (100%)
>   rename package/linux-headers/{5.15.208 => 5.15.209} (100%)
>   rename package/linux-headers/{6.1.174 => 6.1.175} (100%)
>   rename package/linux-headers/{6.12.91 => 6.12.92} (100%)
>   rename package/linux-headers/{6.18.33 => 6.18.34} (100%)
>   rename package/linux-headers/{6.6.141 => 6.6.142} (100%)
>   rename package/linux-headers/{7.0.10 => 7.0.11} (100%)
> 
> diff --git a/linux/7.0.10 b/linux/7.0.11
> similarity index 100%
> rename from linux/7.0.10
> rename to linux/7.0.11
> diff --git a/linux/Config.in b/linux/Config.in
> index 96c2d5b1f4..8b17fece44 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>   
>   config BR2_LINUX_KERNEL_VERSION
>   	string
> -	default "7.0.10" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "7.0.11" if BR2_LINUX_KERNEL_LATEST_VERSION
>   	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>   	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
> index cd460fc958..93c36c9156 100644
> --- a/linux/before-6.17/linux.hash
> +++ b/linux/before-6.17/linux.hash
> @@ -1,10 +1,10 @@
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  0ff2ab9e169f9f1948557471fbb450d3018f8c5b77caf288e1a3982582597969  linux-6.12.91.tar.xz
> -sha256  3bc2652eb62ab90a90a8b0aa156b91d276f92eb84702971df62fe1a3f1eb7fe1  linux-6.6.141.tar.xz
> -sha256  ed88346df623ae9150d11b5feb16ddb52c25aef563bb7803ab160bb4493fe06e  linux-6.1.174.tar.xz
> +sha256  0fe376b7db3cac4456b38291bee4faa7091cb8befaa6f9870314f5d1282f9e3e  linux-6.12.92.tar.xz
> +sha256  b2f6607a75cd27b2e368cf2d25e1637e1e0da9dfed4cda536658879eee6f2b70  linux-6.6.142.tar.xz
> +sha256  37e984a9e449eb15023b3063c3fd6f64fdd1d83af5bb6a944cd7244f40beca85  linux-6.1.175.tar.xz
>   # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
> -sha256  b53d7036e327a627595f42349cb5c9d55b4db8262ab473e08274bd8d3028b172  linux-5.15.208.tar.xz
> -sha256  08b1fde1b563d7f5b0f429b283105b8a0e255463590e50fdce0abbc07a66f0d1  linux-5.10.257.tar.xz
> +sha256  346d77c7eac2cd8d719a2530b4f858bf99bc956b25f80995fd214f8aef821eb4  linux-5.15.209.tar.xz
> +sha256  9e7ccb1efc5796e6f8398b778a8b25f7e227e7c54ef5caf6377b8c37d66fb4e5  linux-5.10.258.tar.xz
>   # Locally computed
>   sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
>   sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
> diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
> index a5caa90370..03ed2d7876 100644
> --- a/linux/from-6.17/linux.hash
> +++ b/linux/from-6.17/linux.hash
> @@ -1,8 +1,8 @@
>   # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
> -sha256  094977eb62c20e3d1939fe81a92958a1f987f339446e532fa86963b2804e32dc  linux-7.0.10.tar.xz
> +sha256  e56c8356dda01136a6041c6ef832bd0ec99bd2d35dff97832aa5ec10ed014304  linux-7.0.11.tar.xz
>   
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  6f16ff302599f6fe34742890322cf0775703105fbd8767449682fca6af0fb782  linux-6.18.33.tar.xz
> +sha256  640c4732fb42842166db97e032c1fe7e5ff72c85a8982c75b40f74be3555d760  linux-6.18.34.tar.xz
>   
>   # Licenses hashes
>   sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
> diff --git a/package/linux-headers/5.10.257 b/package/linux-headers/5.10.258
> similarity index 100%
> rename from package/linux-headers/5.10.257
> rename to package/linux-headers/5.10.258
> diff --git a/package/linux-headers/5.15.208 b/package/linux-headers/5.15.209
> similarity index 100%
> rename from package/linux-headers/5.15.208
> rename to package/linux-headers/5.15.209
> diff --git a/package/linux-headers/6.1.174 b/package/linux-headers/6.1.175
> similarity index 100%
> rename from package/linux-headers/6.1.174
> rename to package/linux-headers/6.1.175
> diff --git a/package/linux-headers/6.12.91 b/package/linux-headers/6.12.92
> similarity index 100%
> rename from package/linux-headers/6.12.91
> rename to package/linux-headers/6.12.92
> diff --git a/package/linux-headers/6.18.33 b/package/linux-headers/6.18.34
> similarity index 100%
> rename from package/linux-headers/6.18.33
> rename to package/linux-headers/6.18.34
> diff --git a/package/linux-headers/6.6.141 b/package/linux-headers/6.6.142
> similarity index 100%
> rename from package/linux-headers/6.6.141
> rename to package/linux-headers/6.6.142
> diff --git a/package/linux-headers/7.0.10 b/package/linux-headers/7.0.11
> similarity index 100%
> rename from package/linux-headers/7.0.10
> rename to package/linux-headers/7.0.11
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 3d9d578f8e..1c00e2508b 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -468,13 +468,13 @@ endchoice
>   
>   config BR2_DEFAULT_KERNEL_HEADERS
>   	string
> -	default "5.10.257"	if BR2_KERNEL_HEADERS_5_10
> -	default "5.15.208"	if BR2_KERNEL_HEADERS_5_15
> -	default "6.1.174"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.6.141"	if BR2_KERNEL_HEADERS_6_6
> -	default "6.12.91"	if BR2_KERNEL_HEADERS_6_12
> -	default "6.18.33"	if BR2_KERNEL_HEADERS_6_18
> -	default "7.0.10"	if BR2_KERNEL_HEADERS_7_0
> +	default "5.10.258"	if BR2_KERNEL_HEADERS_5_10
> +	default "5.15.209"	if BR2_KERNEL_HEADERS_5_15
> +	default "6.1.175"	if BR2_KERNEL_HEADERS_6_1
> +	default "6.6.142"	if BR2_KERNEL_HEADERS_6_6
> +	default "6.12.92"	if BR2_KERNEL_HEADERS_6_12
> +	default "6.18.34"	if BR2_KERNEL_HEADERS_6_18
> +	default "7.0.11"	if BR2_KERNEL_HEADERS_7_0
>   	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>   	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>   	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
