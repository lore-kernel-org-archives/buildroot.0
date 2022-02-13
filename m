Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E04AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7B7D60B64;
	Sun, 13 Feb 2022 15:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OVhO3zWba20y; Sun, 13 Feb 2022 15:30:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E857860AC0;
	Sun, 13 Feb 2022 15:30:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39CFA1BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 281A54040D
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j0UH4IBdoy9U for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:25:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D17AB403CF
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:25:44 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id h8so6100957ejy.4
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 07:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=dFx2L7O1cpcckrc15zpCKhRoHSXMQBhgqZGJNlYXnr8=;
 b=UM/Lk7rbWSJ5NLWFR8VSuSL8pNgpCZUV9TKAhvzH7jOoHufpXpOuFTUtbp28+jZ6OC
 UXFsGqtdjsCukCKE/9S8fU4fMH7noSHpWLMLHXgQGCYwPR4Z8nvugrhugeYr94fVOJjs
 WgEQC9g9XQQJVp9p97SX9p91SnhPyCRxv8XL79BA13CKEzveM0bFnWwZD6ICa5I6pPCg
 LUfPcv1gwkJkQ2HFJVb5trV/W7GeVvC0moJZCcS+39A9S9n4i6e9HjWB3c7eOIgFWRg5
 zVxQEsrMlPJaEC94w7BHdK/W4yyJiRAgAgJEPypxKdoMOlECkhZXaRAfBy064XUSh5m6
 Ia4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=dFx2L7O1cpcckrc15zpCKhRoHSXMQBhgqZGJNlYXnr8=;
 b=VxlgNiQcJDz6E8eMLxfDPI/+mSCLrJnb1kY+T40WxeAbB5pIS8BfqSVAf4dhCGGZEr
 5TboYpX8jzAU9IG2Y+8dzLtFoNwbrq/cio62K58+1sMAfZzTVYMNhZS5JGNYVBZzhm0w
 4x64oO4+9gKqnuvEab6WHPMPwjZael5N1QZKC88nDdtuanIgPShsws0w2sIhn64yZAbe
 EK1tPGYKylsZmE9xkJWp6TwI+DOLaGnTQ6XdGNfXFI5SBTzYhbBUIMxO4dPDJ4QjSzBv
 jEiav5EKtybzeVY7gn+otltv/Ff734tZasSPgfVll51+UcBy3E03XEAGW+Nd99Rfld5+
 np1Q==
X-Gm-Message-State: AOAM533DhUiPE2BszT/kdyGE/VbfCeWi7/FkD7i7rxJbO++ElLZD7Q6N
 G/BbG+RLkFCMXl/OrVor56ARxQ==
X-Google-Smtp-Source: ABdhPJxrnRMtJz+0D2ZPVuInRGBfApesddJOVGYz065Ld1LMSrvyKGFG7IsjQGscyWlvSZM0dNq9mg==
X-Received: by 2002:a17:906:748a:: with SMTP id
 e10mr5050517ejl.107.1644765943036; 
 Sun, 13 Feb 2022 07:25:43 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id b3sm2088174ejl.67.2022.02.13.07.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 07:25:42 -0800 (PST)
Message-ID: <86d76831-de88-4d8a-3f1a-16bde429fa61@mind.be>
Date: Sun, 13 Feb 2022 16:25:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220206142638.1751906-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220206142638.1751906-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mp4v2: needs gcc >= 5
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



On 06/02/2022 15:26, Fabrice Fontaine wrote:
> TechSmith fork of mp4v2 needs gcc >= 5:
> https://github.com/TechSmith/mp4v2/issues/47
> 
> As a result, the following build failure is raised since bump to version
> 5.0.1 in commit df22a9d6b77d9e245dceb7c8fd3f9d80c8917ca0:
> 
> In file included from ./include/mp4v2/mp4v2.h:58:0,
>                   from ./libplatform/platform_posix.h:37,
>                   from ./libplatform/platform.h:24,
>                   from libplatform/impl.h:6:
> ./include/mp4v2/file.h:336:5: warning: identifier 'nullptr' is a keyword in C++11 [-Wc++0x-compat]
>       ShouldParseAtomCallback cb = nullptr );
>       ^
> 
> While a it, drop first patch which is not needed now that mp4v2 depends
> on gcc >= 5
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/178f1266396d44c6659a67d8e68cb99e36d544ea
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...atic-cast-to-unsigned-int-for-cases.patch} |  0
>   ...mp4track.cpp-replace-nullptr-by-NULL.patch | 50 -------------------
>   package/mp4v2/Config.in                       |  6 ++-
>   3 files changed, 4 insertions(+), 52 deletions(-)
>   rename package/mp4v2/{0002-Static-cast-to-unsigned-int-for-cases.patch => 0001-Static-cast-to-unsigned-int-for-cases.patch} (100%)
>   delete mode 100644 package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch
> 
> diff --git a/package/mp4v2/0002-Static-cast-to-unsigned-int-for-cases.patch b/package/mp4v2/0001-Static-cast-to-unsigned-int-for-cases.patch
> similarity index 100%
> rename from package/mp4v2/0002-Static-cast-to-unsigned-int-for-cases.patch
> rename to package/mp4v2/0001-Static-cast-to-unsigned-int-for-cases.patch
> diff --git a/package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch b/package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch
> deleted file mode 100644
> index c279b9c56a..0000000000
> --- a/package/mp4v2/0001-src-mp4track.cpp-replace-nullptr-by-NULL.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 78cf76b5d661e37e958163c37c0ad95940c09591 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 30 May 2020 11:42:19 +0200
> -Subject: [PATCH] src/mp4track.cpp: replace nullptr by NULL
> -
> -Commit 15ec11166ba9ee7b77631d0d9234522f656cfd66 added code that uses
> -nullptr. nullptr is C++11, it will break the build with gcc < 5.
> -
> -Semantically, NULL and nullptr are different, so should not be mixed.
> -In this situaiton, m_File.FindAtom() indeed does not return nullptr,
> -but NULL (on error, that is).
> -
> -Switch back to comparing against NULL.
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/14937c96a82fb3d10e5d83bd7b2905b846fb09f9
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/TechSmith/mp4v2/pull/62]
> ----
> - src/mp4track.cpp | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/mp4track.cpp b/src/mp4track.cpp
> -index 4b8fc9d..42489eb 100644
> ---- a/src/mp4track.cpp
> -+++ b/src/mp4track.cpp
> -@@ -908,16 +908,16 @@ File* MP4Track::GetSampleFile( MP4SampleId sampleId )
> -        MP4FtypAtom *pFtypAtom = reinterpret_cast<MP4FtypAtom *>( m_File.FindAtom( "ftyp" ) );
> -
> -        // MOV spec does not require "ftyp" atom...
> --       if ( pFtypAtom == nullptr )
> -+       if ( pFtypAtom == NULL )
> -        {
> --          return nullptr;
> -+          return NULL;
> -        }
> -        else
> -        {
> -           // ... but most often it is present with a "qt  " value
> -           const char *majorBrand = pFtypAtom->majorBrand.GetValue();
> -           if ( ::strcmp( pFtypAtom->majorBrand.GetValue(), "qt  " ) == 0 )
> --             return nullptr;
> -+             return NULL;
> -        }
> -        throw new Exception( "invalid stsd entry", __FILE__, __LINE__, __FUNCTION__ );
> -     }
> ---
> -2.26.2
> -
> diff --git a/package/mp4v2/Config.in b/package/mp4v2/Config.in
> index 172d1baabe..00e80cd358 100644
> --- a/package/mp4v2/Config.in
> +++ b/package/mp4v2/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_MP4V2
>   	bool "mp4v2"
>   	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11
>   	help
>   	  The MP4v2 library provides functions to read, create, and
>   	  modify mp4 files.
> @@ -18,5 +19,6 @@ config BR2_PACKAGE_MP4V2_UTIL
>   
>   endif
>   
> -comment "mp4v2 needs a toolchain w/ C++"
> -	depends on !BR2_INSTALL_LIBSTDCPP
> +comment "mp4v2 needs a toolchain w/ C++, gcc >= 5"
> +	depends on !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
