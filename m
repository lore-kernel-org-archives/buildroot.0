Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD1EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 17:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FBF382F84;
	Wed, 27 Apr 2022 17:16:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HbssyMkx3sf8; Wed, 27 Apr 2022 17:16:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 945F582E5F;
	Wed, 27 Apr 2022 17:16:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C096F1BF420
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE41141A51
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:16:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SAt-Q9Pl9_Jb for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 17:16:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F99341A4E
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 17:16:30 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id r13so4738649ejd.5
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 10:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DqOjLDyVWEwwwov4d7zs3VuDdo5j00je6Ng155eCIGc=;
 b=GwK3Uzyet3WQWi9bKUJfJbMyatCQeqLDL5IvQZr3JUoCe1yW/Fb7bNIv8DW9F9MX35
 7HBPHdXuJCeth4Rk02shECHqmzdypCeEakEPgTfZR2hz4E2qzxcEzpMz4lKlbsVqLCuV
 diSurL4tzrineHKVF/C3j90LxksblvWgCtUX1X68bqu++v7yRw+bC3z1jjcU2SFP4zah
 nbGJhk2Qt0lnQrvvHA0fAZON/ZaDCwOyC41tmXO3AG0JBExMALeO+q6u0BxHFp91t2U0
 go+DUlQYtZOnrgnEj3L7s9OKc4qWBHXfQF01yRVShR7zQK2VC43K2rPxJ0fxUeciwux6
 R2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DqOjLDyVWEwwwov4d7zs3VuDdo5j00je6Ng155eCIGc=;
 b=mVQZUaCxnATI78YUZfMdWKIA2TqYJiTpviYUKzzOtQ2FMrzZk8cLsYqHLQlcE5rSFe
 IbvD6F8i4cb9xaWDDhLEGsV8ULnM+8Zyky++ac57mdur0PSz8IkxfMH7lOuq03+QkelN
 SlqaGtgz7COrNjG4wkZcIbwxJt4mEr+Ey5CnflPD9E6yhMd26Dra28JhUr1AKMOwuiKh
 nDu3+mAMtqQAZrOpDMusmmckyU5vzb1/wsZze1yBwF9pKbVvvktDgkx4zwMmnyfBZ5Sv
 7qOQA488I7tWT/ybOeB5dBqz15226TDDBxIVJuvE1I8cSVdFL6Ogp+bhvS7ta0CqQqOo
 HchA==
X-Gm-Message-State: AOAM53188x6mbxRUAJKQtWs/Fa5fJXDSycR4JMg8w18/y2fG0J5HSZVW
 j3obOFiuTlYX9PM4KvDdBvybPQ==
X-Google-Smtp-Source: ABdhPJyDIkswHZAHqOYHMa5KvKjcHQ/C3BIqy6a5doRglx8i+jnGEcyIAyb/OtzkXzKTSrKdIGN/ww==
X-Received: by 2002:a17:906:99d0:b0:6f3:ce58:67be with SMTP id
 s16-20020a17090699d000b006f3ce5867bemr3267144ejn.237.1651079788260; 
 Wed, 27 Apr 2022 10:16:28 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 22-20020a508e16000000b00425c9d1704bsm7655375edw.4.2022.04.27.10.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 10:16:27 -0700 (PDT)
Message-ID: <ccb2ce77-09eb-62a3-d150-47d2a9b378b1@mind.be>
Date: Wed, 27 Apr 2022 19:16:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20220425080544.770047-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220425080544.770047-1-buildroot@heine.tech>
Subject: Re: [Buildroot] [PATCH 1/1] package/grpc: bump to version 1.45.2
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
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/04/2022 10:05, Michael Nosthoff via buildroot wrote:
> grpc now requires gcc >= 5.1
> see https://groups.google.com/g/grpc-io/c/Plvp29818BE
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.


> ---
>   package/grpc/Config.in |  6 +++---
>   package/grpc/grpc.hash |  2 +-
>   package/grpc/grpc.mk   | 10 +---------
>   3 files changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/package/grpc/Config.in b/package/grpc/Config.in
> index ad3ddbcf19..adba1cea52 100644
> --- a/package/grpc/Config.in
> +++ b/package/grpc/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_GRPC
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, re2
>   	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # protobuf, re2, libabseil-cpp
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5_1

  This doesn't exist, it's just BR2_TOOLCHAIN_GCC_AT_LEAST_5. GCC 5.1 is the 
first release in the GCC 5 series, so that's fine.

  Regards,
  Arnout

>   	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
>   	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
> @@ -19,9 +19,9 @@ config BR2_PACKAGE_GRPC
>   
>   	  http://github.com/grpc/grpc
>   
> -comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.9"
> +comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 5.1"
>   	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
>   	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
>   	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_5_1
>   	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
> index 6db2acd759..9e3a225a51 100644
> --- a/package/grpc/grpc.hash
> +++ b/package/grpc/grpc.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  8c05641b9f91cbc92f51cc4a5b3a226788d7a63f20af4ca7aaca50d92cc94a0d  grpc-1.44.0.tar.gz
> +sha256  e18b16f7976aab9a36c14c38180f042bb0fd196b75c9fd6a20a2b5f934876ad6  grpc-1.45.2.tar.gz
>   sha256  277adcc1dcef8359b1efb48e628635f88b40be8fbd64e82fd0169930d135d7a5  LICENSE
> diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
> index 9138b4ea59..2f037b5d59 100644
> --- a/package/grpc/grpc.mk
> +++ b/package/grpc/grpc.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GRPC_VERSION = 1.44.0
> +GRPC_VERSION = 1.45.2
>   GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
>   GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
>   GRPC_LICENSE_FILES = LICENSE
> @@ -63,14 +63,6 @@ GRPC_CFLAGS += -O0
>   GRPC_CXXFLAGS += -O0
>   endif
>   
> -# Toolchains older than gcc5 will fail to compile with -0s due to:
> -# error: failure memory model cannot be stronger than success memory model for
> -# '__atomic_compare_exchange', so we use -O2 in these cases
> -ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5):$(BR2_OPTIMIZE_S),:y)
> -GRPC_CFLAGS += -O2
> -GRPC_CXXFLAGS += -O2
> -endif
> -
>   GRPC_CONF_OPTS += \
>   	-DCMAKE_C_FLAGS="$(GRPC_CFLAGS)" \
>   	-DCMAKE_CXX_FLAGS="$(GRPC_CXXFLAGS)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
