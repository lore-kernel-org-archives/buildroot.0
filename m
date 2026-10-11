Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CF4CA9ECF
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 22:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FFE680C70;
	Sun, 11 Oct 2026 22:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SlNKM_6MZ4N8; Sun, 11 Oct 2026 22:03:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 24D2480C1E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791756227;
	b=qlcKL7lkKFvpcDiaMckXIChIIOwGtdNyUw1/st1DjGPqoAvmbAMe5SanaGyhe5k4qW/X
	 883K4boiAo3Ya96bTx3S8ISf1SsCWs5oIERv//Sn8Zy6dvJoW7mRpMLz96DuMm6CBLB+R
	 aujwNbGnvJuZOwA4M9R2JtscjYus01u0Drvdh4Gu+irFbvB44MDU4Hr+Ko2jff97pkILe
	 TI7+zpnuJb/Aeq8VD9wnL/zztTFBWgSUKx63LPHK3W9gsPmXBDy0m2QcT4XBUzGqyAI67
	 3U2HJkSJv34vnxMzZUAk3jphVunMHgx4xI2JsJoWueO7ysc8GmAA7Yg5i3zs0mH+kjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791756227;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=8DHnDjQwAitDHjdto060XTIxKU+x/Y2rYgyDTZxnbIQ=;
	b=ZhTJoRP5jezSPMwTMEV1EtFaWLnQxS8qe3ftJFOE3xL0l1wNFT4KlRh0TfKZNt7P/G10
	 HrdXbfoapnwB6Hxs+4WQeb3Onj4ZwExBHS9JqxuPT/oyPK77SsEYHevjYNCkX6+7Vh7n/
	 ZJeB0YGbk6cMIN7J/U60R83cC2ji2istcO+Y9uTBtKzu8i4aetkCbE4MXFgub2cQD5fvm
	 KSTSyqg81tuVyWz0vlL0NiTs6R4/KW3LgLNMrNZLm9WpLYaUmj2wOR3yMje3sskrLweBp
	 l2/WasIIZIN6ikMvhfBUXO3caPm4khGO44STKVv26usU2Z141HHNBO7W3HFJT62ZsSw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791756227;
	bh=8DHnDjQwAitDHjdto060XTIxKU+x/Y2rYgyDTZxnbIQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=JSql3qz6lgnne2LhxgUWZDkAQFVCjxdKQb2IWRlEjQQ3w37Q9/gwIoEg65F+m79c2
	 j0WYMbcNcg1+d13stLzkKvXC/zks2DiXkVYh0jDeEA3g/ok9r0V5B7Xjr0jQiQKZVV
	 kR0+FSyVF44y+fCXlH153+infF3PP15e7Hmj6Fmf5u7LxWP6qdyZ6mIlAyBEjIfDW1
	 6qP3/zS6hjtA9B3VRKB/iaQVW/1C4qeg330X1wZGLR/OYlKu5p4AJce+XTPoB3CIei
	 mAaAtSW0XnCvjnV9HTTmCT4MJ2AynLdADK7QnqQXjKANl3MSg9291R7C+iZK4UJooh
	 WcCOOyn6q+GaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24D2480C1E;
	Sun, 11 Oct 2026 22:03:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE13A1DE
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 22:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4F9A4005F
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 22:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OefMG6bl_mox for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 22:03:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0E51840004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791756224;
 b=CcrdfE30DmEfYHS4rBz4Ts/pWKkJPan6jEw6WqyFtQqGZJz84xzVe3y3LU2tUgE3v7aL
 MKSy8ILMl/Fy4BRJ5s3FnFKHZ4mCRDrx+NPOZsSoxLdKE0P6d+ZPgvYf1XT5hR93pPhZM
 zu16nfkiZ3/AGujbtqirHXKYM1O4J4fKDt+76xNF2Dp9k14RrfCMAoLU55KuorkHYjrqs
 eQwKuOHU+ZvWYksUx4l4GBVN5cUkaDLnY6N1ngscVw1u2LIVLv5GHxfvFEVnFg6Jdkm2o
 glgAdZbww8o9Ae+Dl2ObWQYgxOqeGUEzgdUdoMB+rwfunaKvfobXy/H9k+deu+ddZ5g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791756224;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=rtHfZhzH1pwFIhC4XvilSZmleCzJzEZ6ELMl4vGrOoc=;
 b=sRbTkJ3W75mXzgbiUqa7cNjJSfCoBpQMbKWnMxqTTGptofWItxVfTdjkcuchy/VuZO8k
 JyGFw4T5GCfVPhFVKle8CEb5oAK/Gah9l4QcRnZ6d82OZtYpjRy5gHSpNfYKs/6KocQHT
 cXRmVGizf37H4/y7q2aMB6QVPhoGlZGwKZRg4bf31b1KrpWTFBApyeqkijB/TTxvyWwRw
 BerLz790lEGuhHffWgR5CRN3hxTs/aZOJ1c1Ar9jrnwtuUPo4F9NrQuzD+pZn1SmUZ93D
 DmFTsUO5ae56IEm9YD9WkzKYfX/RXjRsexgYghHBNWgd8BEk3Lhd8BVUsF7VJ2nhqmQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=NrCLuY4p; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E51840004
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 22:03:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnakX-1woy531fvx-00o9u8; Mon, 12
 Oct 2026 00:03:40 +0200
Message-ID: <4d431f07-0d11-4a63-8fb1-55f257133724@gmx.de>
Date: Mon, 12 Oct 2026 00:03:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20261011211030.2702714-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261011211030.2702714-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:J5yvfuW2bxVng3VhvzsQMiZaeVSCv76DJ8bYGXtU48e1DV0LGzT
 AKimEgdKrcKp8w4Sbfug45vx2LnxCLkLdy0tf1hSckeYsF1ftcgDE7KLBeGdBW5vcTxdPsX
 AyQp0avd6h/EDu9Mu88FIPgYtKFTGUloIN1WY+HY8lc8xQTLUzTQEYKrsCl32a6KrgE5Ka9
 7snVthW7zLM0RuUFajKbA==
UI-OutboundReport: notjunk:1;M01:P0:nYJmaBmfPR0=;ZL8+eXgG2MKkDVP+CGoLywR7X51
 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
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.2.x,
 6.18.x series
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

Am 11.10.26 um 23:10 schrieb Bernd Kuhls:
> Update the latest kernel releases to:
>   - 7.2.9 -> 7.2.10
>   - 6.18.55 -> 6.18.56
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
>   linux/{6.18.55 => 6.18.56}                 | 0
>   linux/{7.2.9 => 7.2.10}                    | 0
>   linux/Config.in                            | 4 ++--
>   linux/from-6.17/linux.hash                 | 4 ++--
>   package/linux-headers/{6.18.55 => 6.18.56} | 0
>   package/linux-headers/{7.2.9 => 7.2.10}    | 0
>   package/linux-headers/Config.in.host       | 4 ++--
>   7 files changed, 6 insertions(+), 6 deletions(-)
>   rename linux/{6.18.55 => 6.18.56} (100%)
>   rename linux/{7.2.9 => 7.2.10} (100%)
>   rename package/linux-headers/{6.18.55 => 6.18.56} (100%)
>   rename package/linux-headers/{7.2.9 => 7.2.10} (100%)
> 
> diff --git a/linux/6.18.55 b/linux/6.18.56
> similarity index 100%
> rename from linux/6.18.55
> rename to linux/6.18.56
> diff --git a/linux/7.2.9 b/linux/7.2.10
> similarity index 100%
> rename from linux/7.2.9
> rename to linux/7.2.10
> diff --git a/linux/Config.in b/linux/Config.in
> index 21c93f89a9..95c9c83e07 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -182,8 +182,8 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
>   
>   config BR2_LINUX_KERNEL_VERSION
>   	string
> -	default "7.2.9" if BR2_LINUX_KERNEL_LATEST_VERSION
> -	default "6.18.55" if BR2_LINUX_KERNEL_LATEST_6_18
> +	default "7.2.10" if BR2_LINUX_KERNEL_LATEST_VERSION
> +	default "6.18.56" if BR2_LINUX_KERNEL_LATEST_6_18
>   	default "6.12.112" if BR2_LINUX_KERNEL_LATEST_6_12
>   	default "6.6.158" if BR2_LINUX_KERNEL_LATEST_6_6
>   	default "6.1.189" if BR2_LINUX_KERNEL_LATEST_6_1
> diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
> index d2556506e2..3554a93713 100644
> --- a/linux/from-6.17/linux.hash
> +++ b/linux/from-6.17/linux.hash
> @@ -1,8 +1,8 @@
>   # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
> -sha256  b4c5dfbe51a364a6c7f03869200f88c8e1f77403539005f14b7fc6bc91b8d8ba  linux-7.2.9.tar.xz
> +sha256  2feaa70453e91f541be6a5c9078d8168e081af45a3d9718054850538cff2ebf3  linux-7.2.10.tar.xz
>   
>   # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
> -sha256  f410638061a165c12f42ab871d2f3fcd525515359b5faeee80969cff84524df9  linux-6.18.55.tar.xz
> +sha256  4633bbda2ab95eaf2a7af4041236451d6759c72e6946265531af4b3aacefbf89  linux-6.18.56.tar.xz
>   
>   # Licenses hashes
>   sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
> diff --git a/package/linux-headers/6.18.55 b/package/linux-headers/6.18.56
> similarity index 100%
> rename from package/linux-headers/6.18.55
> rename to package/linux-headers/6.18.56
> diff --git a/package/linux-headers/7.2.9 b/package/linux-headers/7.2.10
> similarity index 100%
> rename from package/linux-headers/7.2.9
> rename to package/linux-headers/7.2.10
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 3cf2cdd4f4..f21f543f7f 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
> @@ -479,8 +479,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
>   	default "6.1.189"	if BR2_KERNEL_HEADERS_6_1
>   	default "6.6.158"	if BR2_KERNEL_HEADERS_6_6
>   	default "6.12.112"	if BR2_KERNEL_HEADERS_6_12
> -	default "6.18.55"	if BR2_KERNEL_HEADERS_6_18
> -	default "7.2.9"		if BR2_KERNEL_HEADERS_7_2
> +	default "6.18.56"	if BR2_KERNEL_HEADERS_6_18
> +	default "7.2.10"		if BR2_KERNEL_HEADERS_7_2
>   	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>   	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
>   	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
