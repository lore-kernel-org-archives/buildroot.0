Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFABC636D7
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 19:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E59E40932;
	Thu, 23 Feb 2023 19:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E59E40932
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U9z9ytISBaTg; Thu, 23 Feb 2023 19:24:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A5AF40933;
	Thu, 23 Feb 2023 19:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A5AF40933
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC8581BF343
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92D5081852
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92D5081852
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tiqCPkt34ynl for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 19:24:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E5EB81842
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E5EB81842
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 19:24:21 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id da10so47368013edb.3
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 11:24:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gor+eyj/klCjiUMdGlriJ/de6KpOs/J3QrosdV+rXvE=;
 b=B1+ket7BJxJCWbkp3MdykrDiIinDoXknS3F92L1weNEVM26y6KHQ8e1CbWlfqhRQ5q
 P3Czz+vBKR++ZWISteCXuRzPngsZOOvkJMHymOAQXlrNpQmTWnFvFTdKYvJRfS45DXke
 rBa3jO21gmkE7d8lCyO+izvhozLy9TRvCjWLoBILR9TDtX5b76ZuafBpv6vUdL0Al4Vn
 sFq/sLGUud1Mavr53S2z9zEuXqvyfuISubjrrwaIYVoSNtLQA3RWpIy2SwM7Um4gIZfE
 OIPeN+lnZQFTYzZs3Ldnf4qGp+ETvGcWe4BbX3lfSqqMUviofg4tPrSvDyoPDHC1qj6k
 NNvQ==
X-Gm-Message-State: AO0yUKVPxvGMfhSmk+FFbObdSFtI1ZYN0Augx+y38XH+TXGyHedjS4xS
 ZstX5IWJvgfmWmFNGMQ014JWGQ==
X-Google-Smtp-Source: AK7set+1GAmAW730fYWv4DICFn9Aa9cMLq7TjoGdUNoAOwu+b/3YYGod2wA076xHdDcuMhn3vYhWmA==
X-Received: by 2002:a17:906:da0d:b0:8af:1a8c:eaa0 with SMTP id
 fi13-20020a170906da0d00b008af1a8ceaa0mr20405456ejb.75.1677180260007; 
 Thu, 23 Feb 2023 11:24:20 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a1709065fc700b008dceec0fd4csm4086679ejv.73.2023.02.23.11.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 11:24:19 -0800 (PST)
Message-ID: <7a565459-473d-a5c4-cf25-13f688e2a295@mind.be>
Date: Thu, 23 Feb 2023 20:24:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230222150449.2005824-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230222150449.2005824-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gor+eyj/klCjiUMdGlriJ/de6KpOs/J3QrosdV+rXvE=;
 b=hiT0pzaNV2FnknKrPJCuzdfejrAuOPSoO5qkUZ/3+iIk9KtrXW78NsQ/COhBa5b9dU
 6Blkz9zi//aqPpTY2uk2dUNBZoPhMEwQDPMUnYqfkfDATqYCpE4wbd5KIJc6gHD/5LtM
 xT+gAHtrIRO4wcqyAF5LErMYCgnuKzWXvq+lOR6UcW4BcSXBxUk3hdAfsgJg+ecmplaU
 NPNaNxbX9a0+dTrq9/Ncru1l8so5UBFjVQUdeFwmiz6iR4TIKG18cNdXG673L266Gc7f
 xmZBYHMZi/4s2G0ynZPmfZDA6zsXU0iaM9WKVi0RQzq/zlkRu+DbIqOvACjA7zAm1yos
 ynZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hiT0pzaN
Subject: Re: [Buildroot] [PATCH RFC,1/1] package/gcc: fix GCC_DL_DIR
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/02/2023 16:04, Fabrice Fontaine wrote:
> GCC_DL_DIR is empty as gcc is not a "real" package, as a result, the
> following (silent) error is raised when BR2_CCACHE is set:
> 
> /home/thomas/autobuild/instance-0/output-1/per-package/host-gcc-initial/host/bin/ccache /usr/bin/gcc -O2 -I/home/thomas/autobuild/instance-0/output-1/per-package/host-gcc-initial/host/include -DBR_CROSS_PATH_SUFFIX='".br_real"' -DBR_CCACHE_HASH=\"` printf '%s\n'  --target=aarch64_be-buildroot-linux-gnu --with-sysroot=@HOST_DIR@/aarch64_be-buildroot-linux-gnu/sysroot --enable-__cxa_atexit --with-gnu-ld --disable-libssp --disable-multilib --disable-decimal-float --enable-plugins --enable-lto --with-gmp=@HOST_DIR@ --with-mpc=@HOST_DIR@ --with-mpfr=@HOST_DIR@  --with-bugurl="http://bugs.buildroot.net/" --without-zstd --disable-libquadmath --disable-libquadmath-support --enable-tls --enable-threads --without-isl --without-cloog --with-abi="lp64" --with-cpu=cortex-a53 --enable-languages=c --disable-shared --without-headers --disable-threads --with-newlib --disable-largefile  | sha256sum - /gcc-11.3.0.tar.xz package/gcc/11.3.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch packag
 e/
>   gcc/11.3.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch package/gcc/11.3.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch package/gcc/11.3.0/0007-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch | cut -c -64 | tr -d '\n'`\" -DBR_SYSROOT='"aarch64_be-buildroot-linux-gnu/sysroot"' -DBR_ADDITIONAL_CFLAGS='"-Wl,-z,max-page-size=65536", "-Wl,-z,common-page-size=65536", "-fstack-protector-strong",' -DBR_CCACHE -DBR2_RELRO_PARTIAL -s -Wl,--hash-style=both toolchain/toolchain-wrapper.c -o /home/thomas/autobuild/instance-0/output-1/build/host-gcc-initial-11.3.0/toolchain-wrapper
> sha256sum: /gcc-11.3.0.tar.xz: No such file or directory
> 
> This patch replaces GCC_DL_DIR by HOST_GCC_INITIAL_DL_DIR. As, this can
> be considered as a "hack", any comment to improve this patch is
> appreciated
> 
> Fixes:
>   - Found when investigating: http://autobuild.buildroot.org/results/ae75f5cdd4a1fe97359b99b2bcade258097c86dd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/gcc/gcc.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index 6dfd93f2a4..0755b59e96 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -284,7 +284,7 @@ HOST_GCC_COMMON_MAKE_OPTS = \
>   	gcc_cv_libc_provides_ssp=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
>   
>   ifeq ($(BR2_CCACHE),y)
> -HOST_GCC_COMMON_CCACHE_HASH_FILES += $(GCC_DL_DIR)/$(GCC_SOURCE)
> +HOST_GCC_COMMON_CCACHE_HASH_FILES += $(HOST_GCC_INITIAL_DL_DIR)/$(GCC_SOURCE)

  How about

HOST_GCC_COMMON_CCACHE_HASH_FILES += $($(PKG)_DL_DIR)/$(GCC_SOURCE)

?

  Regards,
  Arnout

>   
>   # Cfr. PATCH_BASE_DIRS in .stamp_patched, but we catch both versioned
>   # and unversioned patches unconditionally. Moreover, to facilitate the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
