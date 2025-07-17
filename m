Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09C0C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0E1E41548;
	Thu, 17 Jul 2025 20:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASohItBNYfNz; Thu, 17 Jul 2025 20:12:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1DFC413D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1DFC413D8;
	Thu, 17 Jul 2025 20:12:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B6E3226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F09AC819B4
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:12:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yz796ALUmvr6 for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:12:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0AD07816F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AD07816F1
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0AD07816F1
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:12:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A69AFB977AA4; Thu, 17 Jul 2025 22:12:28 +0200 (CEST)
Message-ID: <b647ea9c-1d9c-4025-a7a9-c2781e2afd7d@rnout.be>
Date: Thu, 17 Jul 2025 22:12:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250708181546.3524574-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250708181546.3524574-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752783148; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=GYHzT7/15ysNgIAOMkPzbOjIYn8eqXQJ3fhlh79FmMQ=;
 b=MrbDtbidnapd+K8Voyvz9S11VH2v4rRJW9cMd9w5sVnwJoofVIfKMyiWRCnD/NFl2p9ikV
 xH5A3Hv40c1nDChndcLaGmRD/QYRqSt85p9rP/vPDZFL6aZRVAe1u7WLCF0qNnT13LxGAF
 dI3PVlMcgLBrhlpAYJPTA/d+OBBc/8TId1tRfFxCxcu+SmC1DLLJJNURetmcmvL8+F12HU
 Y3dFwLf6MobbpwEsLYwKZ7vPbv5IdAjO85PabrB2DIXFh6SmZpJ9xUilbeOyrkk/aseX7U
 ITWTbljVDEMKX8JctycnxaWjWyFo2T8AtilCnUlbMYB8p1T2OmjD2n7k2Z08ew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=MrbDtbid
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1, 6, 12,
 15}.x series
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



On 08/07/2025 20:15, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.05.x, without the 6.15.x part, thanks.

  It would be convenient for the LTS maintainers if you could split the 6.15.x 
part in a separate patch.

  Regards,
  Arnout

> ---
>   linux/Config.in                      | 2 +-
>   linux/linux.hash                     | 8 ++++----
>   package/linux-headers/Config.in.host | 8 ++++----
>   3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index ada39c10a8..be22d807ff 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>   
>   config BR2_LINUX_KERNEL_VERSION
>   	string
> -	default "6.15.4" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "6.15.5" if BR2_LINUX_KERNEL_LATEST_VERSION
>   	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
>   	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
>   	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 254682d009..a6cc67ac4e 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,8 +1,8 @@
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  0eafd627b602f58d73917d00e4fc3196ba18cba67df6995a42aa74744d8efa16  linux-6.15.4.tar.xz
> -sha256  05f4e0b01dde578c3328eb539d305cccec7b84e939f6dd5f21fdaf5f313da748  linux-6.12.35.tar.xz
> -sha256  18640ae9a2c952f8f8868324378df1a9e138ad29e6b93a9c38155764ea67ea85  linux-6.6.95.tar.xz
> -sha256  dcd26ea135c96bddbb17131f96176bca1a9268ea0e1cb96dfb7d6970780fa3aa  linux-6.1.142.tar.xz
> +sha256  2ca707939c14431232649874d438aa58f11b4b127290fa68d164f8bd79c688b5  linux-6.15.5.tar.xz
> +sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
> +sha256  9ee45843d43adb2e2ac5f6a8cb10a334e39e3e3384af8a0ce383a37f78221bdd  linux-6.6.96.tar.xz
> +sha256  e25bdac4d77e6b1079f899e2ecb24c7e850f295e735ea7b5654b900d85c03b0a  linux-6.1.143.tar.xz
>   # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
>   sha256  9c4efdd7ee550d524c017b5dae27725374526311e983661850cd880af671cb2a  linux-5.15.186.tar.xz
>   sha256  2dfa422b6bbe65a6b352a38129d27de918c3f0f05c72ecdd39d46d657ca0f0db  linux-5.10.239.tar.xz
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 2a8b2a863b..db6fb95f8a 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -447,10 +447,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
>   	default "5.4.295"	if BR2_KERNEL_HEADERS_5_4
>   	default "5.10.239"	if BR2_KERNEL_HEADERS_5_10
>   	default "5.15.186"	if BR2_KERNEL_HEADERS_5_15
> -	default "6.1.142"	if BR2_KERNEL_HEADERS_6_1
> -	default "6.6.95"	if BR2_KERNEL_HEADERS_6_6
> -	default "6.12.35"	if BR2_KERNEL_HEADERS_6_12
> -	default "6.15.4"	if BR2_KERNEL_HEADERS_6_15
> +	default "6.1.143"	if BR2_KERNEL_HEADERS_6_1
> +	default "6.6.96"	if BR2_KERNEL_HEADERS_6_6
> +	default "6.12.36"	if BR2_KERNEL_HEADERS_6_12
> +	default "6.15.5"	if BR2_KERNEL_HEADERS_6_15
>   	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>   	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>   	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
