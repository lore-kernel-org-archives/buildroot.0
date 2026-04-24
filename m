Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF36FED3F0
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE67F84E6D;
	Fri, 24 Apr 2026 16:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0UcSuec6yxV4; Fri, 24 Apr 2026 16:27:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4C4784E96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048046;
	bh=+I1YwNrAtWEBl6EjR/holuSfHz25Gb3om04V4/HRWqc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xc/Oo3xmABTXoNWCtwAvwlg1Zfqv/Pq1XyESrruMKRExAg1E9uIUxmkLtikngXd/1
	 QKKIoWHgIggb8D04IOmgbAQXCT68adz/8KKValRlMS4lEBiGZFUq8LnQxHFVt5Nshn
	 HnHsKy+vRVV5wa9hi+ou6GvDGPOK19B6ozI3ixtfcgmwQM0lJUYtPCZvoDjjfXsCpI
	 /nG/OTHIABpOtVkOi1UV37NPc1AMeTpN2qy0Fu++dPPaNwJB+KgoEntn4tmzcQG6rR
	 Quwdd8F0zquCJJ7yArwm6lOizika1+TKhSqN7m6XuNVN0++BmL5tvEO6GyExRUXb3Y
	 i6SeKXuuo4cOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4C4784E96;
	Fri, 24 Apr 2026 16:27:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5009C194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8C2342963
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqQvSSSN98RZ for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:27:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DF5B4295F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DF5B4295F
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DF5B4295F
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:21 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso52099465e9.0
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048039; x=1777652839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hs3l8rr7RPsIjsdjFhmWpgDos2tBSLDtgwJglmiqhho=;
 b=Bprr8QucM3ubdxjgG+nrxdvsC9yYqVfb2qvhbgqHC0IMroTWIEv2rKAB+HMNv+CIeH
 2e1tHTqvmn91yr/AkSCR8jpe+kXiDXwukz/eL6sBB1Y7yfFY7VL4UurAnJnVXWm7dDp0
 A8R6g2K6J06HGodQwEaZEs4NbDJTk9zvuLzHLyfGOQVVGAgfafEkmDg0k+0ocZivu0mF
 eyaKWnI2NVHlhlQYt48xCIcSOUZT+jCjhvWJlBD7GGMudZf9OwkDAXbWn9TyprYmhgnQ
 PldCkp0Go8a3jHScrDTIoMM7ap1M5j+lpRynZQ+7DlBCJ5FXMkaOP5ZccP/oyEL5tAMC
 hohA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8N6jpl+QOjymzxg8GciZE1Xpxbg3H1VI8UPHYDiUJPJDdu05Ipp2UYiN5W3BqXzQu8+69RCdLyU2A=@buildroot.org
X-Gm-Message-State: AOJu0Yx1J9oPZ3wi1VzAfzsL7W14I6rytb6sKUnQ0ngMdtod5dbmmnbk
 8Y46+0HegTv2WxHyndGKzbiUrFx8lty4VHeqYf1DpXNwym7OA6rOSTw19EuVrJ7VLWVshe1ljVg
 3CVfr
X-Gm-Gg: AeBDieuVIpxv6EqN2DSUD42iTYYHkREy0WebD2CVj4MztwWZZVL4Rvil4UfPYZO+wzr
 YqNOTwfwBNyzL/4XHh2o++HIfsBjWDt5rvwi0BURktWJTfxMYSXJEPEUUD0TynJz5SusZ8C62Hr
 6a6XirsIrme6MOM1tZtWGM2F1EIgWTjilKgZ+95l3mF1Ng3vI5LNTuJutYX6MiT+yo7ylBn6QhA
 soGrPG8NftQB1LB77DBit8MqeowEknYIMftQAozpdjjMVSNTTTFnHPQcq0iNtM0HiilONNz/ejA
 JqwhxzIwW6ONU5bvrdyGEIvDfLvfbS47RjaKp+GPO53EiqFxiuah+8MFQnR7y1SdeelDl+VdkDH
 eUj+6a2Yp2hBmMvgZlpMRA6pQmy/PIl0USQVsN4y9OpCBaVG/e3cL+YkGxZSD9molJHcV0sfmVG
 lvUDxlIJmhr7ki9vP02XEqpHre7A==
X-Received: by 2002:a05:600c:4e8f:b0:489:1fa5:997f with SMTP id
 5b1f17b1804b1-4891fa59adfmr315165845e9.9.1777048039464; 
 Fri, 24 Apr 2026 09:27:19 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4d5b1sm64892978f8f.30.2026.04.24.09.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:27:19 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:27:18 +0200
Message-ID: <20260424162718.161835-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260414160708.2041081-5-bernd@kuhls.net>
References: <20260414160708.2041081-5-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048039; x=1777652839; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hs3l8rr7RPsIjsdjFhmWpgDos2tBSLDtgwJglmiqhho=;
 b=IdfdQM6WNzOuJZ/Zaz9K6akmA94cF1TvREDLu3dfab0vI9BcUz8Yw1hY2WMw8S/ewZ
 gHugk4Cir4IhcZLuFDvEzWiHmiEOfYJ23vKgEmN92y+pIpOHBiei/TQHAFMDXBcwcZkm
 nbBXwhC303U/tarkLBPLT/zKImvf4eca8jeG022kpKEcF1S5ePvsdT0aYYNraMJ9msMz
 nAt/Zu/U5YEqOcXNDfVZ5g/Dza5urJMbT/z5TuXXleRlu0unAe48Hct79dXC3U7S4zoR
 39rEff/3ARgVwJgb8qdDsqVlyBCFJ9/tCTJ8kMQRbp5qyY3WplXUwjz8T/ssvx6YS+Ss
 OrAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IdfdQM6W
Subject: Re: [Buildroot] [PATCH 5/5] package/wolfssl: security bump version
 to 5.9.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://github.com/wolfSSL/wolfssl/blob/v5.9.1-stable/ChangeLog.md
> 
> Restored patch 0001 to its original state.
> 
> Updated license hashes due to upstream commits:
> 
> "updating license from GPLv2 to GPLv3"
> https://github.com/wolfSSL/wolfssl/commit/629c5b4cf61ac717d40678b5cd65974b42077af6
> 
> "Add GPLv2 exception list to LICENSING"
> https://github.com/wolfSSL/wolfssl/commit/e02de78507778128d989febb54086f343307a47d
> 
> with various follow-up commits:
> https://github.com/wolfSSL/wolfssl/commit/0d49df7735316cdcf9ddb5a145ea6269b11364b6
> https://github.com/wolfSSL/wolfssl/commit/32d33f2a53d9a15b49694f12205dee8c0199db9d
> https://github.com/wolfSSL/wolfssl/commit/1e9d71af429218f1cd03ec9e21ca89470119462a
> https://github.com/wolfSSL/wolfssl/commit/18332faa054b58e4fe4673c041b2fbfd379247a7
> 
> Fixes the following CVEs:
> 
> * [High] CVE-2026-5264
> * [High] CVE-2026-5263
> * [High] CVE-2026-5295
> * [High] CVE-2026-5466
> * [High] CVE-2026-5477
> * [High] CVE-2026-5447
> * [High] CVE-2026-5500
> * [High] CVE-2026-5501
> * [High] CVE-2026-5503
> * [Low] CVE-2026-5187
> * [Low] CVE-2026-5188
> * [Low] CVE-2026-5448
> * [Low] CVE-2026-5772
> * [Low] CVE-2026-5778
> * [High] CVE-2026-3548
> * [High] CVE-2026-3549
> * [High] CVE-2026-3547
> * [Low] CVE-2026-0819
> * [Low] CVE-2026-1005
> * [Low] CVE-2026-2645
> * [Low] CVE-2026-3230
> * [Low] CVE-2025-12888
> * [Med.] CVE-2025-11936
> * [Low] CVE-2025-11935
> * [Low] CVE-2025-11934
> * [Low] CVE-2025-11933
> * [Low] CVE-2025-11931
> * [Low] CVE-2025-11932
> * [Low] CVE-2025-12889
> * [Low] CVE-2025-13912
> * [High] CVE-2025-7395
> * [Med.] CVE-2025-7394
> * [Low] CVE-2025-7396
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  ...E_LIMITS_H-in-options.h-rather-than-config.patch | 13 ++++++-------
>  package/wolfssl/wolfssl.hash                        |  6 +++---
>  package/wolfssl/wolfssl.mk                          |  4 ++--
>  3 files changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch b/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
> index 67f9672c2a..0599f9d615 100644
> --- a/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
> +++ b/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
> @@ -7,7 +7,6 @@ Subject: [PATCH] Define HAVE_LIMITS_H in options.h rather than config.h since
>  
>  Upstream: https://github.com/wolfSSL/wolfssl/pull/10097
>  
> -[Bernd: rebased for 5.7.2]
>  Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
>   cmake/config.in    | 3 ---
> @@ -33,7 +32,7 @@ diff --git a/cmake/options.h.in b/cmake/options.h.in
>  index 985b54241d6..c46ada8045d 100644
>  --- a/cmake/options.h.in
>  +++ b/cmake/options.h.in
> -@@ -31,6 +31,9 @@ extern "C" {
> +@@ -33,6 +33,9 @@ extern "C" {
>   #endif
>   
>   #ifndef WOLFSSL_OPTIONS_IGNORE_SYS
> @@ -47,12 +46,12 @@ diff --git a/configure.ac b/configure.ac
>  index bce600f2ecc..c5cf9f320c7 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -116,7 +116,9 @@
> -     AM_CCASFLAGS="$AM_CCASFLAGS -DWOLFSSL_EXPERIMENTAL_SETTINGS"
> - fi
> +@@ -185,7 +185,9 @@ AC_ARG_ENABLE([freebsdkm-crypto-register],
> +     [ENABLED_BSDKM_REGISTER=no]
> +     )
>   
> --AC_CHECK_HEADERS([arpa/inet.h fcntl.h limits.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h])
> -+AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h])
> +-AC_CHECK_HEADERS([arpa/inet.h fcntl.h limits.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h ctype.h sys/random.h])
> ++AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h ctype.h sys/random.h])
>  +# Special case: Since types.h depends on HAVE_LIMITS_H, we must define it in options.h.
>  +AC_CHECK_HEADER([limits.h], [AM_CPPFLAGS="$AM_CPPFLAGS -DHAVE_LIMITS_H=1"], [])
>   AC_CHECK_LIB([network],[socket])
> diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
> index 9a1e8bfd4a..e1ecd5f98a 100644
> --- a/package/wolfssl/wolfssl.hash
> +++ b/package/wolfssl/wolfssl.hash
> @@ -1,6 +1,6 @@
>  # Locally computed:
> -sha256  0f2ed82e345b833242705bbc4b08a2a2037a33f7bf9c610efae6464f6b10e305  wolfssl-5.7.2.tar.gz
> +sha256  d5ca7af48cd2d9a91d539e9baedeba55a0605a28d7ac8b01dc3d5254a13ca341  wolfssl-5.9.1.tar.gz
>  
>  # Hash for license files:
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> -sha256  b23c1da1f85d699d3288d73c952b4cd02760d23dc1ddc1b221cbb8be82387189  LICENSING
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> +sha256  84f8096dc7f70cdb6075ccf3722a44654361063eaf3e1ce7885c9875b8465a63  LICENSING
> diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
> index 91ab7ca08a..44f51e06e6 100644
> --- a/package/wolfssl/wolfssl.mk
> +++ b/package/wolfssl/wolfssl.mk
> @@ -4,11 +4,11 @@
>  #
>  ################################################################################
>  
> -WOLFSSL_VERSION = 5.7.2
> +WOLFSSL_VERSION = 5.9.1
>  WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
>  WOLFSSL_INSTALL_STAGING = YES
>  
> -WOLFSSL_LICENSE = GPL-2.0+
> +WOLFSSL_LICENSE = GPL-3.0+
>  WOLFSSL_LICENSE_FILES = COPYING LICENSING
>  WOLFSSL_CPE_ID_VENDOR = wolfssl
>  WOLFSSL_CONFIG_SCRIPTS = wolfssl-config
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
