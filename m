Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77652C636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27EA281F97;
	Wed, 15 Feb 2023 21:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27EA281F97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0m7_nA9vRhJV; Wed, 15 Feb 2023 21:00:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 314AD81F68;
	Wed, 15 Feb 2023 21:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 314AD81F68
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 91B0C1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A24A81F6C
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A24A81F6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ypCfcN8qjUqH for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 20:59:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 699B2813EA
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 699B2813EA
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 20:59:59 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id dr8so64666ejc.12
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 12:59:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K+LRooJBcKofTuZ4IyQdvpXkTgfFb8pkmuo7XI3fSOE=;
 b=7B14bBNbsSb0Qy5mVQcNq6/PuPKALHgIYfurh55RsGotP/oLYpoIlo2JYimSBAyYVp
 kYPpi/uBJgxKJeNj+l4b9ykAHhckV/FUJGMq3ZVfQGzg6wkRbtNinj1Ec3Hl8EizWfpB
 lgzLnb9yl89lIrHXtCK/cM+9/nBF7EuUMeeF6M3eUCTMmL2e316nzcmr61i+X4AZG7RB
 o8cgWEB44iOLNHb1eFeO55KqPWrvB37CCDN9Df+YIOJN2e6UjayYV2W6XOTiGqfm8lao
 OvC+a0fjJMN2sNWmuOT/hW33aU2dDwz0MmMR2t88qx31bDA7M5syq3uXjIh9Be77hHmx
 Brgw==
X-Gm-Message-State: AO0yUKWy9yScBF4kXwAXILJ/aeyfGQvN1RDK67dvgtsvaMyaNOB2Xvw8
 goF4N/LC3xd4zXRHp0CQXgbicg==
X-Google-Smtp-Source: AK7set916Eujv0PXciKN5GDV+eRDj9qTQu66zRjXktTcWbbMS90tNVX6VGfWiJxFVex9edrPg/Lw+w==
X-Received: by 2002:a17:906:aad8:b0:884:d15e:10f0 with SMTP id
 kt24-20020a170906aad800b00884d15e10f0mr3866279ejb.23.1676494797501; 
 Wed, 15 Feb 2023 12:59:57 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a170906580a00b0086f4b8f9e42sm10028086ejq.65.2023.02.15.12.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 12:59:56 -0800 (PST)
Message-ID: <0ccfb474-6609-3674-00ab-10aabda9748d@mind.be>
Date: Wed, 15 Feb 2023 21:59:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20230211182839.3841661-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230211182839.3841661-1-romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K+LRooJBcKofTuZ4IyQdvpXkTgfFb8pkmuo7XI3fSOE=;
 b=DBRVQ0zDJwQcRfvkfPYzcqdTcUK8c5WDxkJv3g//mpqp2HzQWTBCNFAemI4lFT1Iex
 oG+b849E4zxx0kbLyepSB2rn6hwsgdHz+HXEfNbgZIuJGOe6eDZtAweK+ANiQxazgQFj
 NtSM6YtVgNV/6Wnbvs+TwR+aLNT8L4GCJB4Ldj7j3eee+8NQhTh1fb7AiPvv35q05c6H
 BgvTkSxW3XkJ5//XHm52XTa1HgG+DQ6q819AY2vIDzp2LJpCZohmdh/0tl6JZeZLTt98
 LBCE67MREKLkc3PpINo2lsJxqklMfn4qDiXICOeRPGh+cLRbCxAerfDJs9GiOKZvwSsP
 VBtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DBRVQ0zD
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/helper: check the arch sysroot
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
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/02/2023 19:28, Romain Naour wrote:
> Since the commit [1], the utils/genrandconfig script improved the
> configuration randomization used by autobuilders. Since then it can
> generate a configuration that is not suitable for an external toolchain
> such the "Codescape IMG GNU Linux Toolchain".
> 
> Indeed this toolchain can be selected for mips32r5 or mips64r5 while only
> mips32r2 or mips64r2 are really supported. The toolchain issue will be
> fixed in a followup change.
> 
> We want to catch such issue in check_unusable_toolchain function otherwise
> it is detected late during the sysroot import into staging and trigger
> a weird error message:
> 
> ln: failed to create symbolic link 'output/host/mips64el-buildroot-linux-gnu/sysroot//nvmedata/autobuild/instance-25/buildroot/libc.a': No such file or directory
> ln: failed to create symbolic link 'output/host/mips64el-buildroot-linux-gnu/sysroot/usr//nvmedata/autobuild/instance-25/buildroot/libc.a': No such file or directory
> 
> This is similar test than for the main sysroot check but this time we have
> to use the toolchain cflags to check the architecture sysroot.
> 
> If the architecture sysroot doesn't exist, the toolchain will reply with
> "libc.a".
> 
> Either the toolchain is really broken or we used a wrong target
> architecture variant. In the later case, the toolchain infrastructure will
> print a meaningful error message.
> 
> Note: We also may get a similar issue using the toolchain-external-custom package
> if a toolchain is used with a wrong target architecture	variant.
> 
> Fixes:
> http://autobuild.buildroot.org/results/701/701e8a5f713f7bdd1f32a4c549cdaac580e2522a/
> 
> [1] aeee90ec109b83c42779e6a2617f7d57e25a2b65
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Both applied to master, thanks.

  Regards,
  Arnout

> ---
> Note: We should improve the Buildroot testsuite to test the toolchain wrapper
>        corner cases.
> ---
>   toolchain/helpers.mk                                  | 11 +++++++++++
>   .../toolchain-external/pkg-toolchain-external.mk      |  2 +-
>   2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 1cd7494fdb..24c482923a 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -422,12 +422,16 @@ check_cross_compiler_exists = \
>   #   the host tuple.
>   # - Exclude distro-class toolchains which are not relocatable.
>   # - Exclude broken toolchains which return "libc.a" with -print-file-name.
> +# - Exclude toolchains used with wrong toolchain cflags or broken toolchains
> +#   which return "libc.a" with -print-file-name and toolchain cflags.
>   # - Exclude toolchains which doesn't support --sysroot option.
>   #
>   # $1: cross-gcc path
> +# $1: toolchain cflags
>   #
>   check_unusable_toolchain = \
>   	__CROSS_CC=$(strip $1) ; \
> +	__TOOLCHAIN_CFLAGS=$(strip $2) ; \
>   	vendor=`$${__CROSS_CC} -dumpmachine | cut -f2 -d'-'` ; \
>   	if test "$${vendor}" = "angstrom" ; then \
>   		echo "Angstrom toolchains are not pure toolchains: they contain" ; \
> @@ -449,6 +453,13 @@ check_unusable_toolchain = \
>   		echo "Unable to detect the toolchain sysroot, Buildroot cannot use this toolchain." ; \
>   		exit 1 ; \
>   	fi ; \
> +	libc_a_archsysroot_path=`$${__CROSS_CC} $${__TOOLCHAIN_CFLAGS} -print-file-name=libc.a` ; \
> +	if test "$${libc_a_archsysroot_path}" = "libc.a" ; then \
> +		echo "Unable to detect the toolchain architecture sysroot." ; \
> +		echo "Please check the Target Architecture Variant selected, the toolchains may not support it." ; \
> +		echo "Buildroot cannot use this toolchain." ; \
> +		exit 1 ; \
> +	fi; \
>   	sysroot_dir="$(call toolchain_find_sysroot,$${__CROSS_CC})" ; \
>   	if test -z "$${sysroot_dir}" ; then \
>   		echo "External toolchain doesn't support --sysroot. Cannot use." ; \
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 299b6008aa..c37f3500d9 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -563,7 +563,7 @@ endif
>   # kernel headers version, type of C library and all C library features.
>   define $(2)_CONFIGURE_CMDS
>   	$$(Q)$$(call check_cross_compiler_exists,$$(TOOLCHAIN_EXTERNAL_CC))
> -	$$(Q)$$(call check_unusable_toolchain,$$(TOOLCHAIN_EXTERNAL_CC))
> +	$$(Q)$$(call check_unusable_toolchain,$$(TOOLCHAIN_EXTERNAL_CC),"$$(TOOLCHAIN_EXTERNAL_CFLAGS)")
>   	$$(Q)SYSROOT_DIR="$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC))" ; \
>   	$$(call check_kernel_headers_version,\
>   		$$(BUILD_DIR),\
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
