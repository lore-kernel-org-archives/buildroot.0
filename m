Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A85EE4988
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 16:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB8A881277;
	Tue, 30 Dec 2025 16:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fiTTh6mvm9v5; Tue, 30 Dec 2025 16:33:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF91E8126D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767112384;
	bh=ZMfXyO23vIOxG89i+vzCmZkr6IogNxU3jRkp7/B9bRY=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aTGwcNLjLYC9ai+i5sTRMzus0rhyfwkFP02Y12IEXe47FkUnDGd8cl5s+NV2FN8mZ
	 D66+bJOFfPWQFsvT/Un/WPIQPVFewTS9fFRjU//OXJHuZGJhSENOXTC02wtW13KB3J
	 KtjdauBLYAOES7qO2/t+18lYyroY+l4ivF/mGBAnQMqQA8Bz5BhZ/Ggn3Mn3i9NF0p
	 CP9xfmy/8D3TpVO6BadP4FBJVTC3pd4LZNmnhX0VXKIoIFXyEK732q8oRkWso8NR9o
	 APukTEO5cbo/vLPXeq4FiXEnFvXTdnWdAbIFxaeSxerhjrC2i4ufF9EKY8/Db8Qp7P
	 D3AU178jSXyqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF91E8126D;
	Tue, 30 Dec 2025 16:33:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5616A177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CCBE40820
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zEM5_8Jvw4iq for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 16:33:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 81B1240813
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81B1240813
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81B1240813
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:33:00 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id aceYvTkZjP2aDaceYvOLBa; Tue, 30 Dec 2025 17:32:58 +0100
Message-ID: <be6887eb-2268-4af6-bbcc-7e2c33258e50@benettiengineering.com>
Date: Tue, 30 Dec 2025 17:32:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251220170623.155785-1-bernd@kuhls.net>
 <20251220170623.155785-4-bernd@kuhls.net>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20251220170623.155785-4-bernd@kuhls.net>
X-CMAE-Envelope: MS4xfAWaTP59SNq22ztr+kANmRVavroqdFkqAWCYfTKZzSX7JEpuXrHbtDkHc0YgSutgUvxIgl9nb8gu2Nibyzj/nbOl/x3ABkHJuNgPPw8rQwVHr/hC+b6f
 NCCw/vTZHHUntkBwEFHlW0qpelD307D4a6LthwjNNIbkGLGqiyPwZao52Sq8ZjeXsvuCPkzx/yuKz1NHwociC/QiZUQyr3BGL8lbeIIlxDefeeDi6lzIN2M8
 HiBUfa3W3DtIEpZ0HTi0Xw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767112378; bh=1o1pV8xxBRSTQ7M4UIA36pVBdSd6FcdILh4D598LN/E=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=TXjk0YpPnj6Fp5LRG96BR4427uVAQPtXxxoR7rKPhhPo27i8d0E/4RiFV5EsHFYu1
 iBCp6y4ClC72oufz9TPiFDqv60byxMBib8E9reuNNrnG5DgaWnEUqmvj/pvu1LzsJp
 WWMFsXweVezwY88jR+mtZ/svt0fxL8SW2xjR26qkJFA7+z9RkoPDlAbkZRNQ13VFsn
 kzD3qDvf4iM1O/LguO/JASRxrF323YkfD4JCHkBHPLx7VPq5Ilo9Y1fqiQalAAA+bf
 sVNwxjsQLdDNLSREQLwvDLFVtCUTNRxdFB+sKbX4BQdykwHdnywTaVbSHpRjG4cjMp
 HGO+cJjtdh6WQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=TXjk0YpP
Subject: Re: [Buildroot] [PATCH 4/4] package/util-linux: bump version to
 2.41.3
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

Hi Bernd,

On 20/12/2025 18:06, Bernd Kuhls wrote:
> Release notes:
> https://www.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.3-ReleaseNotes
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I've build-tested successfully:
./utils/test-pkg -p util-linux -d ../test-util-linux
                     bootlin-armv5-uclibc [1/6]: OK
                      bootlin-armv7-glibc [2/6]: OK
                    bootlin-armv7m-uclibc [3/6]: OK
                      bootlin-x86-64-musl [4/6]: OK
                       br-arm-full-static [5/6]: OK
                              arm-aarch64 [6/6]: OK
6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

So:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
Giulio

> ---
>   package/util-linux/util-linux.hash | 2 +-
>   package/util-linux/util-linux.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
> index af850c03d6..eab8a0c3b5 100644
> --- a/package/util-linux/util-linux.hash
> +++ b/package/util-linux/util-linux.hash
> @@ -1,5 +1,5 @@
>   # From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/sha256sums.asc
> -sha256  6062a1d89b571a61932e6fc0211f36060c4183568b81ee866cf363bce9f6583e  util-linux-2.41.2.tar.xz
> +sha256  3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed9b50ec2b5799e58b  util-linux-2.41.3.tar.xz
>   # License files, locally calculated
>   sha256  4c2db318192bda62f3f8fcf71488bb5e602ae4385eba281d711b46cc13a40bb3  README.licensing
>   sha256  527f738966ca396cd5a68c1509390de2a780c6b614d9ee57f7544a6161938ed1  Documentation/licenses/COPYING.BSD-2-Clause
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 40d948ec97..14389254cb 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -8,7 +8,7 @@
>   # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
>   
>   UTIL_LINUX_VERSION_MAJOR = 2.41
> -UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
> +UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).3
>   UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
>   UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
