Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8128BC48BF8
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 13:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B6BD401B4;
	Thu, 22 Feb 2024 13:20:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GpJHKcZkdPZy; Thu, 22 Feb 2024 13:20:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37E06401D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37E06401D9;
	Thu, 22 Feb 2024 13:20:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 742A61BF40B
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 13:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F44F400DC
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 13:20:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pQu9fcnr9e5d for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 13:20:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A40A400D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A40A400D4
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A40A400D4
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 13:20:06 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 9142A2C83940;
 Thu, 22 Feb 2024 14:20:03 +0100 (CET)
Message-ID: <552ccb1d-1be8-4ec0-8ea4-70d2de771cdb@bubu1.eu>
Date: Thu, 22 Feb 2024 14:20:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
References: <20240215224614.3028380-1-kadambini.nema@gmail.com>
In-Reply-To: <20240215224614.3028380-1-kadambini.nema@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1708608003; bh=5vP04+VRWAO0RdHomIePtLFwxzUMTug1en5rTzv44Co=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ra74B+mHsEk23jPP1YyBtCDDZWEIwBoRdhwZrcCOFQBOQZO5pFcwsAQy7wXkmUsoS
 0eiQ67zBaYaBET0IC7Y+UBH8Sm5QtfzHK32d26NGHMu83YFAs8NNgBg3DIzVfUE0jU
 EwnSQVQoSaj7fuoBzkd4ttlllqYZKgAo3c26LfHPzAxRIV8DV/MVdqaFBsVeNtn1q0
 xeMkiZc6VLDVN5g4vj//4Uz64cnFcVp2CegeACRz9ZLBLqWANLsBsT/Gm4x/A91vZE
 XmgIITAHfno0wtwZAmav7dqOfebhfCJSJoRucKeRnY5dPujPCcID+N2uAsx+gQETg/
 t6OtaukIYQCaA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=ra74B+mH
Subject: Re: [Buildroot] [PATCH 1/1] package/{libuv,
 uvw}: bump version to libuv 1.47.0 and uvw 3.3.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Bernd Kuhls <bernd@kuhls.net>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kadambini,

On 15.02.24 23:46, Kadambini Nema wrote:
> Change Log : https://github.com/libuv/libuv/blob/v1.x/ChangeLog#L92
>               https://github.com/skypjack/uvw/releases/tag/v3.3.0_libuv_v1.47

I think one patch per package update is preferred for buildroot. If one 
update depends on another one, these should be send in one series, but 
still as separate patches.

I've just send another libuv update to 1.48, which contains a security fix.

I didn't know what to do with the uvw as I don't know how it works with 
libuv compatibility, there was no explicit version for libuv 1.48.


> 
> Build test results:
>   libuv.config
>     BR2_PACKAGE_LIBUV=y
>     BR2_PACKAGE_UVW=y
> 
> $./utils/test-pkg -k -c libuv.uvw.config -p uvw -p libuv
>                      bootlin-armv5-uclibc [1/6]: OK
>                       bootlin-armv7-glibc [2/6]: OK
>                     bootlin-armv7m-uclibc [3/6]: SKIPPED
>                       bootlin-x86-64-musl [4/6]: OK
>                        br-arm-full-static [5/6]: SKIPPED
>                              sourcery-arm [6/6]: SKIPPED
> 6 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
> ---
>   package/libuv/libuv.hash | 2 +-
>   package/libuv/libuv.mk   | 2 +-
>   package/uvw/uvw.hash     | 4 ++--
>   package/uvw/uvw.mk       | 2 +-
>   4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
> index 1fd286d9e9..3a2904f247 100644
> --- a/package/libuv/libuv.hash
> +++ b/package/libuv/libuv.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  94f101111ef3209340d7f09c2aa150ddb4feabd2f9d87d47d9f5bded835b8094  libuv-v1.46.0-dist.tar.gz
> +sha256  72a187104662b47f2a2b204da39d2acb05cf22a4fcb13ceaebe3b0ed0c0e2e43  libuv-v1.47.0-dist.tar.gz
>   sha256  16de0c32b265cb7d46a6d3bd614f259dd4d693a5e26b3407b04aae8d73041f0c  LICENSE
>   sha256  262c44bd2cdba037e6d2a82fba15f5800d292bc993a6f5d6b6ea487744d02836  LICENSE-extra
> diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
> index 76316484e4..a794ac1c8a 100644
> --- a/package/libuv/libuv.mk
> +++ b/package/libuv/libuv.mk
> @@ -6,7 +6,7 @@
>   
>   # When bumping libuv, check if a new version of uvw is available
>   # and bump it too.
> -LIBUV_VERSION = 1.46.0
> +LIBUV_VERSION = 1.47.0
>   LIBUV_SOURCE = libuv-v$(LIBUV_VERSION)-dist.tar.gz
>   LIBUV_SITE = https://dist.libuv.org/dist/v$(LIBUV_VERSION)
>   LIBUV_DEPENDENCIES = host-pkgconf
> diff --git a/package/uvw/uvw.hash b/package/uvw/uvw.hash
> index 2dc6e879e1..3f237d00f2 100644
> --- a/package/uvw/uvw.hash
> +++ b/package/uvw/uvw.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  bd5aed741765950074b1ea2507291dce81e528abdf56c406991ad4a27d8d1714  uvw-3.2.0_libuv_v1.46.tar.gz
> -sha256  e2a4062818ab05e2a0908737ad49b7c01202247364e900167ac81105de8713f3  LICENSE
> +sha256  aabb17d3d8f0b3481b44e981c889dd4a2a6a3f1a96a4d01055e669f4b7d37d0e  uvw-3.3.0_libuv_v1.47.tar.gz
> +sha256  5e439d0ad6e1b16f2f14023872c49cb2cf1b62a172c30b864cb45a5aa6533454  LICENSE
> diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
> index 12149d43ca..23e5060c34 100644
> --- a/package/uvw/uvw.mk
> +++ b/package/uvw/uvw.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -UVW_VERSION = 3.2.0_libuv_v1.46
> +UVW_VERSION = 3.3.0_libuv_v1.47
>   UVW_SITE = $(call github,skypjack,uvw,v$(UVW_VERSION))
>   UVW_INSTALL_STAGING = YES
>   UVW_INSTALL_TARGET = NO


Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
