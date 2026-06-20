Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D83CDB466
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F20F36FACF;
	Sat, 20 Jun 2026 09:10:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VwX22KDtifmI; Sat, 20 Jun 2026 09:10:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D49160E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946623;
	bh=k3MD2FFI2rsIsuQbgmrdFbgpxHNDOufsb7t0s0o362s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fh5cwQJhouDnEA5oy8msyo8gw6es9u10twFLVf96q7S1WKcpZX+leHwFd6GL2cXmI
	 UZYMLkWORntFCPQ4FvLUsOaOFsIaD5eTJc7uJiFCZ3X1/+i7RwRH4YzHLKC/s6CnBz
	 pSN9WEztulU44knUy8zPPD5UfB4FjebwTdHL0SYIHRC5bGkxFHFwioPK0rbhmJVZlp
	 fYiNDFhkDBC6PMRewt3x1ucnKUR5QPSeVHuxjdmHKywIog2uuEVZuWvcKWnWGWaUqb
	 AQnN5sqBS8zjHejtTslWAGz4I1Sj/Zn/LwrjIF1k/+ExyMVANonQj1qSAScyhm20TN
	 CF7Ic1+AQxf9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D49160E82;
	Sat, 20 Jun 2026 09:10:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AD7BD06
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CB6060E82
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eu8ZFpRJEr80 for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:10:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4643C60E78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4643C60E78
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4643C60E78
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:10:19 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-490b3637b90so21280065e9.3
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 02:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781946617; x=1782551417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6pWW0Vm/tOnvKhefZCyN5WhNm0svKiyr7C+l7rVr/F0=;
 b=oLzs+03xqEf0zLJ+tKBMGm7t1BRzm4MYtPscAZde85bRivN03jQtY2l9KBa0+7jD91
 rl8CUsNqL+NprpGsMCTvOEgS3Y2AeL+PUYkghHp1ycqPxDpQe35ROMwMtpw/4+miiwQh
 WkVnRtoNzDIVIWq1DBA2GTWBEiNpeqwGdkgQF6aWHxXJBMhBjnQlfFR2BWNVtPQwrkY3
 nII8qU8yvvgbCIxAMWJ+8wZE/9mQLfieS6CZMPGe4xuXlWzZGfoF/L75lyoJlMexAAWR
 HdoApkRAylS0Ut2rsjlxSi3Pw0MpS37Y9AjSi/i4Qe912iiz8LssdR0slIS9C2wZV8Ga
 +4TA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+x5haYBmbDUAnel+wWlgmea/oMADJ4grnfa+fv2giGn+RZDKZQfsjlkeQT28Xt5ok82P7CZWy1994=@buildroot.org
X-Gm-Message-State: AOJu0Yxjs4FAWeoMim0s3s/GhG1PK9ZlUt62ZxRKeCZxszBiLI1GRoAA
 2WvBj/jUE1xp5zor1JitYmM3HVsb2CACgt7U1HnAGLsPUGVS2jMNAbqOPxEcPJADIm5ydzA4x+G
 mcbY2
X-Gm-Gg: AfdE7cmMcyv6AaEkVU9s26crgkpgwKrNycQAg6L5xWvNJONLKL4vmrm+KE4N9jGtdG/
 YA/+dPUWA10HL6tMpASaq18wuxSt4eYYHhq9eIrI4kPh9VQ33LCtiHnlJTCX4HtQrc6cWs4cfjj
 ZRkq7felzxcuT7T2XyYUXHlpzMlpCl6V4KX1leDncyvU1FDhkzeaojEvBSYbUDs+E1baNIazOTv
 yPepi9rhZscZKWZ54brVz0WAs2AQFTK+RmGd+XQ/qUbbBwMqO9CNM25LZUQ8ES5ZRWrAAE661ni
 LRhAz7x+HlN9ksWnWFP1hklrVOhkvju8GwgS+gwhC9RGaTjhWdGF21Ti70ObwzQF3EhawGTTQ3O
 x+cS9T5vnKOrna8e9A1830QCNbIrrr9akZNsmZnYQjjrnAl8SUA+C76MdVnoCcoqCsKzNwjh9WK
 nvSP8d
X-Received: by 2002:a05:600c:5286:b0:492:454c:347c with SMTP id
 5b1f17b1804b1-492454c37aemr82148875e9.7.1781946617065; 
 Sat, 20 Jun 2026 02:10:17 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4924594f8fasm66432035e9.0.2026.06.20.02.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2026 02:10:16 -0700 (PDT)
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 20 Jun 2026 11:10:16 +0200
Message-ID: <20260620091016.21807-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612-openssl-3-5-7-v1-1-093c128bb691@cherry.de>
References: <20260612-openssl-3-5-7-v1-1-093c128bb691@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781946617; x=1782551417; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6pWW0Vm/tOnvKhefZCyN5WhNm0svKiyr7C+l7rVr/F0=;
 b=dYW4y6Nn7clGn0BR+A9GKMNpYBtwEZQBVf19zJx9HaYwF1RJsRcBkH1QcG9sPWGqmP
 eJnmQFNX4/g3z+zqalHpquD0YqhN6Oi75ljSLkl26QYnm3IeTQc9D6/zZNSy3wy1IYUU
 48cjoitIq7+m35XhyZT4nxcOqTEMbam3TNg2vt5geBalDyTllMX2a7fx5z9nFN8k8dwI
 3oNnJDGbCtKO87QguZZIaSe+3woHfXo4PMd+qkrzWSIBT1wIWqymt5hxlDc1bP1YRJBr
 Jskvxy/49gCKkubPn98LrMVuzyuxc78hvylum4zWA1g4NCE4S1iyTrmKPBs8zvsL3yCm
 2oxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dYW4y6Nn
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/libopenssl: security bump
 to version 3.5.7
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
> fixed CVE-2026-45447, CVE-2026-34182, CVE-2026-34183, CVE-2026-42764,
> CVE-2026-45445, CVE-2026-7383, CVE-2026-9076, CVE-2026-34180,
> CVE-2026-34181, CVE-2026-42766, CVE-2026-42767, CVE-2026-42768,
> CVE-2026-42769, CVE-2026-42770, CVE-2026-45446.
> https://github.com/openssl/openssl/releases/tag/openssl-3.5.7
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x. Thanks

> ---
>  .../0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 4 ++--
>  package/libopenssl/0003-Revert-Fix-static-builds.patch              | 6 +++---
>  package/libopenssl/libopenssl.hash                                  | 4 ++--
>  package/libopenssl/libopenssl.mk                                    | 2 +-
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
> index f74576beae..8adf7e51b0 100644
> --- a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
> +++ b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
> @@ -18,10 +18,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>   1 file changed, 4 insertions(+)
>  
>  diff --git a/Configure b/Configure
> -index 15054f9..ac3206e 100755
> +index 1b020faadb..4614b5becf 100755
>  --- a/Configure
>  +++ b/Configure
> -@@ -1686,6 +1686,10 @@ unless ($disabled{asm}) {
> +@@ -1691,6 +1691,10 @@ unless ($disabled{asm}) {
>       }
>   }
>   
> diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0003-Revert-Fix-static-builds.patch
> index 10ca97a240..970626a725 100644
> --- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
> +++ b/package/libopenssl/0003-Revert-Fix-static-builds.patch
> @@ -15,10 +15,10 @@ Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>   1 file changed, 4 insertions(+), 4 deletions(-)
>  
>  diff --git a/Configure b/Configure
> -index ac3206e..764ef89 100755
> +index 4614b5becf..cac670405e 100755
>  --- a/Configure
>  +++ b/Configure
> -@@ -1510,10 +1510,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
> +@@ -1515,10 +1515,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
>           unless file_name_is_absolute($config{prefix});
>   }
>   
> @@ -29,7 +29,7 @@ index ac3206e..764ef89 100755
>   # Allow overriding the build file name
>   $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
>   
> -@@ -1808,6 +1804,10 @@ if ($strict_warnings)
> +@@ -1813,6 +1809,10 @@ if ($strict_warnings)
>                   }
>           }
>   
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index 781701532d..8a7186d669 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openssl/openssl/releases/download/openssl-3.5.6/openssl-3.5.6.tar.gz.sha256
> -sha256  deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e57d7f31f2a3b736  openssl-3.5.6.tar.gz
> +# From https://github.com/openssl/openssl/releases/download/openssl-3.5.7/openssl-3.5.7.tar.gz.sha256
> +sha256  a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a24aa31aeac98e8  openssl-3.5.7.tar.gz
>  
>  # License files
>  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 837c3f0346..a9e18f96ac 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 3.5.6
> +LIBOPENSSL_VERSION = 3.5.7
>  LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = Apache-2.0
> 
> ---
> base-commit: a20dafe5c190a7d083de3c1a219f27aff7450ebb
> change-id: 20260612-openssl-3-5-7-4e361adb9632
> 
> Best regards,
> --  
> Quentin Schulz <quentin.schulz@cherry.de>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
