Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5870CC4320A
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:11:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0B8260F22
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 21:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0B8260F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EE7D40370;
	Tue, 17 Aug 2021 21:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FGiXbyE-2xnl; Tue, 17 Aug 2021 21:11:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ACD0403A3;
	Tue, 17 Aug 2021 21:11:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D9761BF2EB
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C7C780D36
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 21:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VaA-jl31UGRM for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 21:11:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2F1080D2D
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 21:11:31 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id bq25so273561ejb.11
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 14:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9ymYUymWShyCm9zeeJl2YcrkCxWL5WGj/AwsyzgclyI=;
 b=aMHIkopPCOgrxB90kQ+ISmmu4bpw5VCjgh1yWj3bwxhvDJlg6vKQNUDtE5SKveyb+F
 ljcQRqFmCmyFEN0LLSxgNXgfN+ENXWiydROzDunqdBC97htFM/lqB1V4o4VKeb0O7Vf/
 iSenB213YiHcY6CZkYTJolk0W1PBai4Ngm0KkJaXk1FKzpjlm++WNxxz5hl5sffXYGva
 7q1n3U18cm2EWByrcbCuvbGtEoNGK0pRa8rYNscux0i+ao63wvXToB+0yQKH/jWCO8R/
 tkog44jWGJy+fSeoSWGJCgJQvEq+3uyTz0FdEV8stW+PteHqaHS0v5l7GgC5FbAI9sif
 nOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=9ymYUymWShyCm9zeeJl2YcrkCxWL5WGj/AwsyzgclyI=;
 b=ZMXGb0p4eE6EfboY+hMWyhfknvo235qGXehO6bUa8GgW1bKYYSvcUGdcyod8pY8+ca
 pUTSalNhjLMjllce2knivU9/ZfLNyULS5jQYzUeqkKyBaq3bJJjNQv5fLyrnLGHBrT6J
 J+y8SpIjFoNA/y3NPAVyOl690YiHvDcTaTAWy17M1Li+p6LhAFVbCSzR+d2UPEx/anT5
 C4iR7aAkQVk+Yb53TH+MIcjC7F3OHvjOnyPwfpGjzaF29kW0yjdCQFvizBlLjTYCak9n
 DsfdIQuRKSqBlxfhS86J/ZJI1H2tQzEIZDJ2SL7UMEmY/I/JW8LpZQH+BBbqPmvbmgRs
 r/dw==
X-Gm-Message-State: AOAM533F+p/meV0hL+TXAjNX+4ZbniCJFAjU+4mvn1qaA7FZXJRms7jI
 /+VTex+BmwJqWdvhhtHSiq8gmA==
X-Google-Smtp-Source: ABdhPJyaRv7+KVlEy8i5uG5ZBP3HJfmh4E+tzq+nZ8npD6zGtUlDZDuH2XgcmMm1/Py81aIo5HTxGg==
X-Received: by 2002:a17:906:cb99:: with SMTP id
 mf25mr5961406ejb.441.1629234689982; 
 Tue, 17 Aug 2021 14:11:29 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id k19sm1221134ejq.42.2021.08.17.14.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 14:11:29 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20210726235656.1df4ddeb@windsurf>
 <20210726223435.2906458-1-giulio.benetti@benettiengineering.com>
 <20210726223435.2906458-4-giulio.benetti@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <105b5335-044a-b800-2451-7c9edf6cf987@mind.be>
Date: Tue, 17 Aug 2021 23:11:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726223435.2906458-4-giulio.benetti@benettiengineering.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2 3/3] toolchain: remove binutils bug 21464
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 27/07/2021 00:34, Giulio Benetti wrote:
> This bug has been fixed upstream and backported to buildroot binutils
> package. So let's remove it from toolchain/Config.in and from packages
> that are affected by it:
> - libgeos
> - postgis
> - protobuf

 It's not clear to me if all the external toolchains that we use also have this
patch already. Basically that boils down to the stable and bleeding edge bootlin
toolchains.

 Well, I'm pretty sure they're not yet updated, since they're still  2020.08-1...


 Regards,
 Arnout

> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  package/libgeos/Config.in  | 4 +---
>  package/postgis/Config.in  | 4 +---
>  package/protobuf/Config.in | 1 -
>  toolchain/Config.in        | 6 ------
>  4 files changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/package/libgeos/Config.in b/package/libgeos/Config.in
> index 86a1cddcf3..124e2da661 100644
> --- a/package/libgeos/Config.in
> +++ b/package/libgeos/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBGEOS
>  	bool "libgeos"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_USE_WCHAR
> -	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
>  	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
>  	help
>  	  GEOS (Geometry Engine - Open Source) is a C++ port of the
> @@ -13,7 +12,6 @@ config BR2_PACKAGE_LIBGEOS
>  
>  	  https://trac.osgeo.org/geos
>  
> -comment "libgeos needs a toolchain w/ C++, wchar, not binutils bug 21464, 27597"
> +comment "libgeos needs a toolchain w/ C++, wchar, not binutils bug 27597"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> -		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
>  		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
> diff --git a/package/postgis/Config.in b/package/postgis/Config.in
> index 04705f7e16..78c52ea7b2 100644
> --- a/package/postgis/Config.in
> +++ b/package/postgis/Config.in
> @@ -6,7 +6,6 @@ config BR2_PACKAGE_POSTGIS
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, proj
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # proj
>  	depends on BR2_USE_WCHAR # libgeos, proj
> -	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 # libgeos
>  	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597 # libgeos
>  	select BR2_PACKAGE_LIBGEOS
>  	select BR2_PACKAGE_PROJ
> @@ -20,9 +19,8 @@ config BR2_PACKAGE_POSTGIS
>  
>  	  https://postgis.net/
>  
> -comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7, not binutils bug 21464, 27597"
> +comment "postgis needs a toolchain w/ C++, threads, wchar, gcc >= 4.7, not binutils bug 27597"
>  	depends on !BR2_microblazeel && !BR2_microblazebe # ICE
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
>  		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
> -		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464 || \
>  		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
> diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
> index 30050950aa..46c820b9cf 100644
> --- a/package/protobuf/Config.in
> +++ b/package/protobuf/Config.in
> @@ -24,7 +24,6 @@ config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  	default y if BR2_TOOLCHAIN_HAS_ATOMIC
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	depends on BR2_USE_MMU # fork()
> -	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
>  
>  config BR2_PACKAGE_PROTOBUF
>  	bool "protobuf"
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 8603e2aaff..3598307b20 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -71,12 +71,6 @@ source "package/gdb/Config.in.host"
>  
>  comment "Toolchain Generic Options"
>  
> -# https://sourceware.org/bugzilla/show_bug.cgi?id=21464
> -# Affect toolchains built with binutils 2.31.1, still not fixed.
> -config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
> -	bool
> -	default y if BR2_or1k
> -
>  # https://sourceware.org/bugzilla/show_bug.cgi?id=27597
>  # Affect toolchains built with binutils 2.36.1, still not fixed.
>  config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
