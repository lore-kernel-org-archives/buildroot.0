Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AEE9C54E68
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 21:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9365240034;
	Sun, 17 Mar 2024 21:34:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PvTy7jnzdsGu; Sun, 17 Mar 2024 21:34:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E542340538
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E542340538;
	Sun, 17 Mar 2024 21:34:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCD1C1BF3FB
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 21:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B78C560654
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 21:34:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TUzHDvtYtIKJ for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 21:34:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 244A660635
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 244A660635
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 244A660635
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 21:34:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4140efa16caso3039705e9.0
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 14:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710711257; x=1711316057;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rnRnvWvurspyhDYwBXlEMh5wXrrORZj56e+fjtGNifY=;
 b=QzbJX+xqrygHdfyoHzKKFV7iKpp0GENEi88qZCYwm4Zc46F2mpFxS0tSTozkBPdSSs
 pTGxoQv/z8FJwztYec6EtB6NVcpk56gaCcK2Qp6qZ/ytYbPGOa5/LgSdSLodYihx1LW7
 shmJXxAB1sQQqsW3fWBtHhke7FQyrxx5BL066WA5ez/X5/pKJzsAoIIgW7tt8t1aespT
 S/jrzjCe/P8n7sBeqk29gA2dDafnjolUa8hQEaBg6Z1wgRKxyQ62LCKa8Ai4m5BFmdFg
 YbjwalNh/qNYj+7A1b7oanom4WgtN2UWZbf3KHp+bLGBnox4lGbLp5oPYa9KmDDWoaxA
 8/zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjbKYnUYaU1LaKebP6B3BkDmXbJp3w3ltxkr6itN0KkLNdj8V9h0oftzfr4OsFNwuo3Mf7wzjNFrSmWtQ80b9i+LAVF6cNww==
X-Gm-Message-State: AOJu0Yw/aGoI3bAbw+nWWZ3lvX5aJwgfu1k8f5AoRRdO1ti9FQS5jK0/
 6fC3+tpRCaJ6xs9PL7FxGMJHUkKBE7T50g0bo6CF2iGtARMrkAApRNR6tkwxW9Q=
X-Google-Smtp-Source: AGHT+IH05hb0SAOuBgtScDS2VaOhIf5QXJcDMTknS/4+11HpwX3wV7c4uxmI33LQNyeG5yeYsJXFUQ==
X-Received: by 2002:a05:600c:1388:b0:414:262:df45 with SMTP id
 u8-20020a05600c138800b004140262df45mr4963239wmf.32.1710711256391; 
 Sun, 17 Mar 2024 14:34:16 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b004133825e6cfsm15907954wms.24.2024.03.17.14.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Mar 2024 14:34:15 -0700 (PDT)
Message-ID: <bcd177b6-61d9-481d-9312-503958edf976@mind.be>
Date: Sun, 17 Mar 2024 22:34:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240317125133.362751-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240317125133.362751-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710711257; x=1711316057; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rnRnvWvurspyhDYwBXlEMh5wXrrORZj56e+fjtGNifY=;
 b=D0b4QB7Yh4m4reMJ0FQ5IJ+CKz7s8mjUTl2hK5FcsYdXEaUxE0kUufGzmwaiZN89W5
 FGVJ5HALVc/tEX9ncEHw4VqS8LXe+sGVS1FMvrX0nJn9kAJpCFCHNBFsEKq+Gevzj9V8
 rIRMaf8JQRmtlouTgbE3i1VrGZ+r8cHG4W4a7pM6ztfrAslu/wGS9l77cNUpjp26VEXD
 cnMg/uCzzxNe7j2Pt5rNxtQnqe4OdAw4gffP2UOChYQyZD2qhUmhSjs2ql1og7GPwyR+
 Dkb3qfMLwP5fHqNeyfS4dGp8u4Vhcoja6+aSq86evMdfBVOgL5Va1f8Xp2t0OJTFiApQ
 7tZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=D0b4QB7Y
Subject: Re: [Buildroot] [PATCH 1/1] toolchain: drop codescape mips
 toolchains
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/03/2024 13:51, Fabrice Fontaine wrote:
> Codescape mips toolchains are old (2018) and use glibc 2.20 which is not
> compatible with 64-bit time_t raising the following build failure with
> libselinux since commit 1c2dbcdcf0bb589d325c379246acaa39bb07b7be:
> 
> In file included from selinux_restorecon.c:17:0:
> /home/buildroot/autobuild/instance-1/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/fts.h:41:3: error: #error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
>   # error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
>     ^~~~~
> 
> Fixes: 1c2dbcdcf0bb589d325c379246acaa39bb07b7be
>   - http://autobuild.buildroot.org/results/a4d38af627a42a2c55d60129787c51353d5883bf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   Config.in.legacy                              | 16 +++-
>   package/openblas/Config.in                    |  4 -
>   toolchain/toolchain-external/Config.in        |  6 +-
>   .../Config.in                                 | 66 ----------------
>   .../Config.in.options                         |  9 ---
>   ...toolchain-external-codescape-img-mips.hash |  4 -
>   .../toolchain-external-codescape-img-mips.mk  | 51 -------------
>   .../Config.in                                 | 76 -------------------
>   .../Config.in.options                         |  9 ---
>   ...toolchain-external-codescape-mti-mips.hash |  4 -
>   .../toolchain-external-codescape-mti-mips.mk  | 51 -------------
>   11 files changed, 16 insertions(+), 280 deletions(-)
>   delete mode 100644 toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
>   delete mode 100644 toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options
>   delete mode 100644 toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
>   delete mode 100644 toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
>   delete mode 100644 toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
>   delete mode 100644 toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options
>   delete mode 100644 toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
>   delete mode 100644 toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 5aaaae0eec..32bbd2ee0d 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,8 +146,22 @@ endif
>   
>   comment "Legacy options removed in 2024.05"
>   
> +config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
> +	bool "Codescape IMG GNU Linux Toolchain 2018.09 has been removed"
> +	select BR2_LEGACY
> +	help
> +	  The Codescape IMG GNU Linux toolchain has been removed, use a
> +	  Bootlin/CodeSourcery toolchain instead.

  The CodeSourcery toolchains are themselves from 2016, though they do have 
glibc 2.23. I expect them to be removed eventually as well. So I kept only the 
Bootlin toolchain as a suggestion here.

  Regards,
  Arnout

> +
> +config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
> +	bool "Codescape MTI GNU Linux Toolchain 2018.09 has been removed"
> +	select BR2_LEGACY
> +	help
> +	  The Codescape MTI GNU Linux toolchain has been removed, use a
> +	  Bootlin/CodeSourcery toolchain instead.
> +
>   config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
> -	bool "CodeSourcery AArch64 2014.11"
> +	bool "CodeSourcery AArch64 2014.11 has been removed"
>   	select BR2_LEGACY
>   	help
>   	  The Sourcery CodeBench AArch64 toolchain has been removed,
> diff --git a/package/openblas/Config.in b/package/openblas/Config.in
> index 74c4a3aa5c..7d4727003b 100644
> --- a/package/openblas/Config.in
> +++ b/package/openblas/Config.in
> @@ -26,11 +26,7 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
>   	default "PPC970"          if BR2_powerpc_970
>   	default "PPC440"          if BR2_powerpc_440
>   	default "PPC440FP2"       if BR2_powerpc_440fp
> -	# P5600 is built with MSA support which is only available in Codescape toolchains
> -	default "P5600"           if BR2_mips_p5600 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
>   	default "MIPS64_GENERIC"  if BR2_MIPS_CPU_MIPS64
> -	# I6400 is built with MSA support which is only available in Codescape toolchains
> -	default "I6400"           if BR2_mips_i6400 && BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
>   	# OpenBLAS assumes SPARC=Sparc v9
>   	default "SPARC"           if BR2_sparc_v9
>   	# Cortex-A15 always have a VFPv4
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index b5432b71d7..af9082cf6e 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -26,10 +26,8 @@ source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in"
>   # ARM big-endian
>   source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in"
>   
> -# MIPS (use codesourcery toolchain by default)
> +# MIPS
>   source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in"
> -source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in"
> -source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in"
>   
>   # NIOSII
>   source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in"
> @@ -130,8 +128,6 @@ source "toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in.o
>   
>   # MIPS
>   source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in.options"
> -source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options"
> -source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options"
>   
>   # NIOSII
>   source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options"
> diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
> deleted file mode 100644
> index d49c610237..0000000000
> --- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
> -	bool "Codescape IMG GNU Linux Toolchain 2018.09"
> -	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> -	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> -	depends on BR2_MIPS_CPU_MIPS32R6 || (BR2_MIPS_CPU_MIPS64R6 && !BR2_MIPS_SOFT_FLOAT)
> -	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_INSTALL_LIBSTDCPP
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
> -	select BR2_TOOLCHAIN_HAS_FORTRAN
> -	select BR2_TOOLCHAIN_HAS_OPENMP
> -	help
> -	  Codescape IMG GNU Linux Toolchain 2018.09 for the MIPS
> -	  architecture, from MIPS Tech LLC. It uses gcc 6.3.0,
> -	  binutils 2.28.51, glibc 2.20, gdb 7.9.1 and kernel headers
> -	  4.7. It has support for the following variants:
> -	    - MIPS32r6 - Big-Endian, Hard-Float, 2008 NaN, o32 ABI
> -	      Select 'MIPS (big endian)' Target Architecture
> -	      Select 'mips 32r6' Target Architecture Variant
> -	      Disable 'Use soft-float'
> -	    - MIPS32r6 - Big-Endian, Soft-Float, 2008 NaN, o32 ABI
> -	      Select 'MIPS (big endian)' Target Architecture
> -	      Select 'mips 32r6' Target Architecture Variant
> -	      Enable 'Use soft-float'
> -	    - MIPS32r6 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI
> -	      Select 'MIPS (little endian)' Target Architecture
> -	      Select 'mips 32r6' Target Architecture Variant
> -	      Disable 'Use soft-float'
> -	    - MIPS32r6 - Little-Endian, Soft-Float, 2008 NaN, o32 ABI
> -	      Select 'MIPS (little endian)' Target Architecture
> -	      Select 'mips 32r6' Target Architecture Variant
> -	      Enable 'Use soft-float'
> -	    - MIPS32r6 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI,
> -	      microMIPS
> -	      Select 'MIPS (little endian)' Target Architecture
> -	      Select 'mips 32r6' Target Architecture Variant
> -	      Disable 'Use soft-float'
> -	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
> -	    - MIPS32r6 - Little-Endian, Soft-Float, 2008 NaN, o32 ABI,
> -	      microMIPS
> -	      Select 'MIPS (little endian)' Target Architecture
> -	      Select 'mips 32r6' Target Architecture Variant
> -	      Enable 'Use soft-float'
> -	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
> -	    - MIPS64r6 - Big-Endian, Hard-Float, 2008 NaN, n32 ABI
> -	      Select 'MIPS64 (big endian)' Target Architecture
> -	      Select 'mips 64r6' Target Architecture Variant
> -	      Select 'n32' Target ABI
> -	      Disable 'Use soft-float'
> -	    - MIPS64r6 - Little-Endian, Hard-Float, 2008 NaN, n32 ABI
> -	      Select 'MIPS64 (little endian)' Target Architecture
> -	      Select 'mips 64r6' Target Architecture Variant
> -	      Select 'n32' Target ABI
> -	      Disable 'Use soft-float'
> -	    - MIPS64r6 - Big-Endian, Hard-Float, 2008 NaN, n64 ABI
> -	      Select 'MIPS64 (big endian)' Target Architecture
> -	      Select 'mips 64r6' Target Architecture Variant
> -	      Select 'n64' Target ABI
> -	      Disable 'Use soft-float'
> -	    - MIPS64r6 - Little-Endian, Hard-Float, 2008 NaN, n64 ABI
> -	      Select 'MIPS64 (little endian)' Target Architecture
> -	      Select 'mips 64r6' Target Architecture Variant
> -	      Select 'n64' Target ABI
> -	      Disable 'Use soft-float'
> diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options
> deleted file mode 100644
> index 3eaa2a9522..0000000000
> --- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
> -
> -config BR2_TOOLCHAIN_EXTERNAL_PREFIX
> -	default "mips-img-linux-gnu"
> -
> -config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
> -	default "toolchain-external-codescape-img-mips"
> -
> -endif
> diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
> deleted file mode 100644
> index 65e1861f12..0000000000
> --- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# Codescape toolchains from MIPS Tech LLC
> -# From: https://codescape.mips.com/components/toolchain/nanomips/2018.09-02/downloads.html
> -sha256  ac035f3b6a8767522977963d8e1490520d58bccca7956f4503a1eefff6492b71  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.IMG.Linux.CentOS-6.x86.tar.gz
> -sha256  09280f4fcbb993607905bf9a43bf5f3db2beed85726f0675b8453e19a9ddc429  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.IMG.Linux.CentOS-6.x86_64.tar.gz
> diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
> deleted file mode 100644
> index 55424918c7..0000000000
> --- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -################################################################################
> -#
> -# toolchain-external-codescape-img-mips
> -#
> -################################################################################
> -
> -TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION = 2018.09-02
> -TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SITE = https://codescape.mips.com/components/toolchain/$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION)
> -TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_STRIP_COMPONENTS = 2
> -
> -ifeq ($(HOSTARCH),x86)
> -TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION).for.MIPS.IMG.Linux.CentOS-6.x86.tar.gz
> -else
> -TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION).for.MIPS.IMG.Linux.CentOS-6.x86_64.tar.gz
> -endif
> -
> -# Special fixup for Codescape MIPS toolchains, that have bin-<abi> and
> -# sbin-<abi> directories. We create symlinks bin -> bin-<abi> and sbin
> -# -> sbin-<abi> so that the rest of Buildroot can find the toolchain
> -# tools in the appropriate location.
> -ifeq ($(BR2_MIPS_OABI32),y)
> -TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_BIN_DIR_SUFFIX = o32
> -else ifeq ($(BR2_MIPS_NABI32),y)
> -TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_BIN_DIR_SUFFIX = n32
> -else ifeq ($(BR2_MIPS_NABI64),y)
> -TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_BIN_DIR_SUFFIX = n64
> -endif
> -
> -define TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_STAGING_FIXUPS
> -	rmdir $(STAGING_DIR)/usr/bin $(STAGING_DIR)/usr/sbin
> -	ln -sf bin-$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_BIN_DIR_SUFFIX) $(STAGING_DIR)/usr/bin
> -	ln -sf sbin-$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_BIN_DIR_SUFFIX) $(STAGING_DIR)/usr/sbin
> -endef
> -
> -# The Codescape toolchain uses a sysroot layout that places them
> -# side-by-side instead of nested like multilibs. A symlink is needed
> -# much like for the nested sysroots which are handled in
> -# copy_toolchain_sysroot but there is not enough information in there
> -# to determine whether the sysroot layout was nested or side-by-side.
> -# Add the symlink here for now.
> -define TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SYMLINK
> -	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))"; \
> -	ARCH_SUBDIR=`basename $${ARCH_SYSROOT_DIR}`; \
> -	ln -snf . $(STAGING_DIR)/$${ARCH_SUBDIR}
> -endef
> -
> -TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_POST_INSTALL_STAGING_HOOKS += \
> -	TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_STAGING_FIXUPS \
> -	TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SYMLINK
> -
> -$(eval $(toolchain-external-package))
> diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
> deleted file mode 100644
> index 720d705d14..0000000000
> --- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
> -	bool "Codescape MTI GNU Linux Toolchain 2018.09"
> -	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> -	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
> -	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> -	depends on BR2_MIPS_CPU_MIPS32R2 || (BR2_MIPS_CPU_MIPS64R2 && !BR2_MIPS_SOFT_FLOAT)
> -	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -	select BR2_TOOLCHAIN_EXTERNAL_HAS_NO_GDBSERVER
> -	select BR2_INSTALL_LIBSTDCPP
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
> -	select BR2_TOOLCHAIN_HAS_FORTRAN
> -	select BR2_TOOLCHAIN_HAS_OPENMP
> -	help
> -	  Codescape MTI GNU Linux Toolchain 2018.09 for the MIPS
> -	  architecture, from MIPS Tech LLC. It uses gcc 6.3.0,
> -	  binutils 2.28.51, glibc 2.20, gdb 7.9.1 and kernel headers
> -	  4.7. It has support for the following variants:
> -	    - MIPS32r2 - Big-Endian, Hard-Float, Legacy NaN, o32 ABI
> -	      Select 'MIPS (big endian)' Target Architecture
> -	      Select 'mips 32r2' Target Architecture Variant
> -	      Disable 'Use soft-float'
> -	    - MIPS32r2 - Big-Endian, Hard-Float, 2008 NaN, o32 ABI
> -	      Select 'MIPS (big endian)' Target Architecture
> -	      Select 'mips 32r2' Target Architecture Variant
> -	      Disable 'Use soft-float'
> -	      Set BR2_TARGET_OPTIMIZATION to '-mnan=2008'
> -	    - MIPS32r2 - Big-Endian, Soft-Float, Legacy NaN, o32 ABI
> -	      Select 'MIPS (big endian)' Target Architecture
> -	      Select 'mips 32r2' Target Architecture Variant
> -	      Enable 'Use soft-float'
> -	    - MIPS32r2 - Little-Endian, Hard-Float, Legacy NaN, o32 ABI
> -	      Select 'MIPS (little endian)' Target Architecture
> -	      Select 'mips 32r2' Target Architecture Variant
> -	      Disable 'Use soft-float'
> -	    - MIPS32r2 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI
> -	      Select 'MIPS (little endian)' Target Architecture
> -	      Select 'mips 32r2' Target Architecture Variant
> -	      Disable 'Use soft-float'
> -	      Set BR2_TARGET_OPTIMIZATION to '-mnan=2008'
> -	    - MIPS32r2 - Little-Endian, Soft-Float, Legacy NaN, o32 ABI
> -	      Select 'MIPS (little endian)' Target Architecture
> -	      Select 'mips 32r2' Target Architecture Variant
> -	      Enable 'Use soft-float'
> -	    - MIPS32r2 - Little-Endian, Hard-Float, 2008 NaN, o32 ABI,
> -	      microMIPS
> -	      Select 'MIPS (little endian)' Target Architecture
> -	      Select 'mips 32r2' Target Architecture Variant
> -	      Enable 'Use soft-float'
> -	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
> -	    - MIPS32r2 - Little-Endian, Soft-Float, Legacy NaN, o32 ABI,
> -	      microMIPS
> -	      Select 'MIPS (little endian)' Target Architecture
> -	      Select 'mips 32r2' Target Architecture Variant
> -	      Disable 'Use soft-float'
> -	      Set BR2_TARGET_OPTIMIZATION to '-mmicromips'
> -	    - MIPS64r2 - Big-Endian, Hard-Float, Legacy NaN, n32 ABI
> -	      Select 'MIPS64 (big endian)' Target Architecture
> -	      Select 'mips 64r2' Target Architecture Variant
> -	      Select 'n32' Target ABI
> -	      Disable 'Use soft-float'
> -	    - MIPS64r2 - Little-Endian, Hard-Float, Legacy NaN, n32 ABI
> -	      Select 'MIPS64 (little endian)' Target Architecture
> -	      Select 'mips 64r2' Target Architecture Variant
> -	      Select 'n32' Target ABI
> -	      Disable 'Use soft-float'
> -	    - MIPS64r2 - Big-Endian, Hard-Float, Legacy NaN, n64 ABI
> -	      Select 'MIPS64 (big endian)' Target Architecture
> -	      Select 'mips 64r2' Target Architecture Variant
> -	      Select 'n64' Target ABI
> -	      Disable 'Use soft-float'
> -	    - MIPS64r2 - Little-Endian, Hard-Float, Legacy NaN, n64 ABI
> -	      Select 'MIPS64 (little endian)' Target Architecture
> -	      Select 'mips 64r2' Target Architecture Variant
> -	      Select 'n64' Target ABI
> -	      Disable 'Use soft-float'
> diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options
> deleted file mode 100644
> index 464c9b8448..0000000000
> --- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -if BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
> -
> -config BR2_TOOLCHAIN_EXTERNAL_PREFIX
> -	default "mips-mti-linux-gnu"
> -
> -config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
> -	default "toolchain-external-codescape-mti-mips"
> -
> -endif
> diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
> deleted file mode 100644
> index b07281de48..0000000000
> --- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.hash
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# Codescape toolchains from MIPS Tech LLC
> -# From: https://codescape.mips.com/components/toolchain/nanomips/2018.09-02/downloads.html
> -sha256  c883a404fd7ea5718e2249a530802e223381f2be52265f88e9b1ce7035c232f3  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.MTI.Linux.CentOS-6.x86.tar.gz
> -sha256  d6310a970b0a8a19ad8e0a2b3ead8c38ee90d0e284a9b2511200ce447f460d2c  Codescape.GNU.Tools.Package.2018.09-02.for.MIPS.MTI.Linux.CentOS-6.x86_64.tar.gz
> diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk
> deleted file mode 100644
> index 9bee1ab87d..0000000000
> --- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/toolchain-external-codescape-mti-mips.mk
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -################################################################################
> -#
> -# toolchain-external-codescape-mti-mips
> -#
> -################################################################################
> -
> -TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION = 2018.09-02
> -TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SITE = https://codescape.mips.com/components/toolchain/$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION)
> -TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_STRIP_COMPONENTS = 2
> -
> -ifeq ($(HOSTARCH),x86)
> -TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION).for.MIPS.MTI.Linux.CentOS-6.x86.tar.gz
> -else
> -TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SOURCE = Codescape.GNU.Tools.Package.$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_VERSION).for.MIPS.MTI.Linux.CentOS-6.x86_64.tar.gz
> -endif
> -
> -# Special fixup for Codescape MIPS toolchains, that have bin-<abi> and
> -# sbin-<abi> directories. We create symlinks bin -> bin-<abi> and sbin
> -# -> sbin-<abi> so that the rest of Buildroot can find the toolchain
> -# tools in the appropriate location.
> -ifeq ($(BR2_MIPS_OABI32),y)
> -TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_BIN_DIR_SUFFIX = o32
> -else ifeq ($(BR2_MIPS_NABI32),y)
> -TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_BIN_DIR_SUFFIX = n32
> -else ifeq ($(BR2_MIPS_NABI64),y)
> -TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_BIN_DIR_SUFFIX = n64
> -endif
> -
> -define TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_STAGING_FIXUPS
> -	rmdir $(STAGING_DIR)/usr/bin $(STAGING_DIR)/usr/sbin
> -	ln -sf bin-$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_BIN_DIR_SUFFIX) $(STAGING_DIR)/usr/bin
> -	ln -sf sbin-$(TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_BIN_DIR_SUFFIX) $(STAGING_DIR)/usr/sbin
> -endef
> -
> -# The Codescape toolchain uses a sysroot layout that places them
> -# side-by-side instead of nested like multilibs. A symlink is needed
> -# much like for the nested sysroots which are handled in
> -# copy_toolchain_sysroot but there is not enough information in there
> -# to determine whether the sysroot layout was nested or side-by-side.
> -# Add the symlink here for now.
> -define TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SYMLINK
> -	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))"; \
> -	ARCH_SUBDIR=`basename $${ARCH_SYSROOT_DIR}`; \
> -	ln -snf . $(STAGING_DIR)/$${ARCH_SUBDIR}
> -endef
> -
> -TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_POST_INSTALL_STAGING_HOOKS += \
> -	TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_STAGING_FIXUPS \
> -	TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS_SYMLINK
> -
> -$(eval $(toolchain-external-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
