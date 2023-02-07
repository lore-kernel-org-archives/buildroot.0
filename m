Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCEEC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 15:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4AB981E2D;
	Tue,  7 Feb 2023 15:24:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4AB981E2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CEF8GD1YhfhX; Tue,  7 Feb 2023 15:24:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4D6A81E90;
	Tue,  7 Feb 2023 15:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4D6A81E90
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66C2F1BF275
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 15:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4095C417E1
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 15:24:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4095C417E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NeZ8GAhdOF7t for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 15:24:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E6BA40F4E
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E6BA40F4E
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 15:24:34 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a2so13641866wrd.6
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 07:24:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+cE3OYOYNAK4MI2uA9Ba9VyyxLhrdjXCm0Ln0GXP+yM=;
 b=OGf4O7GG3wRhYcD2FCvyVF3SpkShjCuNRfI5psVJgFAepgVakq/GKm2q9FqYNpi19R
 ow5cYJnhwwhealilYCQptJYg080gCA+WJUS1hQx/oJHdMSBwwRTr5VSvaKvmUjXYyvOY
 cb2nPEjSgYbP8Mz3bSQpV/mlkg8wTpMzhaGsvAH1sUlDsZ0On8zvFUhqfn8smeRkJ4dp
 gm/24sXbXr93pvw3YwB0So4MDha9n/CJ+VNkby2YYLLrRKaM6JA3et2fAhT+vuozF0OB
 +El9rpqcHxWt9QzvPKRjid+2hQBsAGp/UwxA7epLZcnCdxm/wVRc1KyrLaI11e6f5Q9v
 Kigw==
X-Gm-Message-State: AO0yUKUzRde53H5fB22VFYa05mPeps5hy41FTprJv91hmwmqFwZkcmt9
 EHCpHj8MOHbiaKOG5Sil97NK/+MCn8mOMVQy
X-Google-Smtp-Source: AK7set9o285H7s8Fq1fURgI2IQG05ht9sCctJ6mXfmiobO4sWiwZc16oUK/6hiF13QTrH4//vX2HZw==
X-Received: by 2002:a05:6000:1d2:b0:2bf:b661:87d9 with SMTP id
 t18-20020a05600001d200b002bfb66187d9mr3159465wrx.50.1675783473130; 
 Tue, 07 Feb 2023 07:24:33 -0800 (PST)
Received: from [192.168.16.188] (cpe1150018.bra.be.verixi.net. [85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 a18-20020adffad2000000b002c3f280bdc7sm2053523wrs.96.2023.02.07.07.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 07:24:32 -0800 (PST)
Message-ID: <9a3a9627-d917-1e31-9ad0-f56487187865@mind.be>
Date: Tue, 7 Feb 2023 16:24:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220621225209.2899559-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220621225209.2899559-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+cE3OYOYNAK4MI2uA9Ba9VyyxLhrdjXCm0Ln0GXP+yM=;
 b=fgUHwsB7Ydj1lE1759pxZeKYwy5b5Qhnq/vKTogcsmGA/Q9AB26NN1WyFZ0i9Fx+Ht
 v9wpwNyvwvUesL3Vhj6PUnak9fkK2BDS2Q5EE9vVhGTcCVYkdgy2mBB9oL5KY024AfiH
 VTaiT85dKM5s7JYvLoDO9ybaFqReQGnl/q28eP8RpQ51Qs0Sj84KMK6T0zz86ZCUT368
 sEkSdXyKuA01DhRwscSIomUFCWD/n5xtvl4fja8L2JEXeyEYDNLWDzyrevbM1lLTux4n
 p3qpBGLuuEunDjKu66sPZKaMInsoBU1z6zxhsd7WGaRlpRT0j1vsR+7WkvGy0oFfL+LQ
 /aJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fgUHwsB7
Subject: Re: [Buildroot] [PATCH 1/1] package/spirv-llvm-translator: set
 CMP0077 policy
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/06/2022 00:52, James Hilliard wrote:
> Set this to the new behavior for consistency.
> 
> Fixes:
> CMake Warning (dev) at /home/buildroot/buildroot/output/per-package/host-spirv-llvm-translator/host/lib/cmake/llvm/HandleLLVMOptions.cmake:852 (option):
>    Policy CMP0077 is not set: option() honors normal variables.  Run "cmake
>    --help-policy CMP0077" for policy details.  Use the cmake_policy command to
>    set the policy and suppress this warning.
> 
>    For compatibility with older versions of CMake, option is clearing the
>    normal variable 'LLVM_ENABLE_EH'.
> Call Stack (most recent call first):
>    CMakeLists.txt:53 (include)
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  AFAIU, this change has become irrelevant with one of the two updates to 
spirv-llvm-translator that have been committed since this patch was sent. 
Therefore, I marked it as Superseded.

  Regards,
  Arnout

> ---
>   package/spirv-llvm-translator/spirv-llvm-translator.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
> index 22f8765582..46704b3f8d 100644
> --- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
> +++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
> @@ -10,6 +10,7 @@ SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
>   SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
>   HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm
>   HOST_SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
> +	-DCMAKE_POLICY_DEFAULT_CMP0077=NEW \
>   	-DLLVM_BUILD_TOOLS=ON \
>   	-DLLVM_DIR=$(HOST_DIR)/lib/cmake/llvm \
>   	-DLLVM_SPIRV_BUILD_EXTERNAL=YES \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
