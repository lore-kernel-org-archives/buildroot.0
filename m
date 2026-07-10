Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260ABC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD8AD40D87;
	Fri, 10 Jul 2026 13:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hnba4ZU5Fj6B; Fri, 10 Jul 2026 13:52:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13D1E40D68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691539;
	bh=GZXV7ljgDIE3UA7Ju2YrGhhwDeZ+mfFwuEhjrHEFm7g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gqN6WuUYCAnPOqA0LtkGCIEl42Od2tRJEbCNWVvHpPKDZwDtkvDsOULOxOj17+0Va
	 lD3kGj0eP1eQmBYwd99pZcWdrMuWGxkoWjL2sjkz86Nxo5GiVSkx1Z8j7tBxLbuWTA
	 2OeeipTycG65hbeFHpbji6JrRLvlPx3zNPjthuLcs+qopJ9841MetQJ3bUIGT9/9+F
	 srwmJyVg+WXi59Vo8EsbSPg+YRsHmjXgxkmAC2mx8xj+nAD9zPxVqIJCXF3N9/UYti
	 nrtn+OFkaDw0FrYU+9O9w2OEDqDgIfr2GBLwziyasNlGZl883RfkMlBc7f2qRxEL4n
	 ir4r2XcBRuBsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13D1E40D68;
	Fri, 10 Jul 2026 13:52:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 163512FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0799840D5F
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVkg5oZ_BrsG for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:52:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1283440D14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1283440D14
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1283440D14
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:52:08 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-475cb71a4ebso933911f8f.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691527; x=1784296327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ki3FP0qbFczTRAozEWbEbiG8Cx5SESDmI0gIPuswdr4=;
 b=RJHCmz4Oxtxl3oax/uAL/pVMmpsoTgSBYiLR5S++Hvad8vOeVQ6l0ZxXxrGj2V4FCA
 M0L3RUV3wvdQ1DquxS8M828+95HI5PoEpT1sARxMnynAkmv11QcmOBzV4cUcjmIcNoT0
 fGBPb6/9cidzwZwazcAywcz8nU1yo7K5CMXAT6vhfAt6Kuc4iTToLF8Uj1opL3es+np9
 KRNHcyiU4y7DU0/v9MacoZi8yF/Gi1rmIQALFJJfL3EAGIo2q0kUCqe6NgdLHjPQcYVU
 hGOeprdPhYscEhHaX2hy/glAP81quKPKdhglm5Vt8/rais45TwBpqazH5R4PX4zPqJdF
 XoVw==
X-Gm-Message-State: AOJu0YyTDH7zEQEAQy05RaG9ts6JfZDCs06egG/xo39ATx/soLr7S2vl
 q133bJTOT23my3BhBxoxiz8EWcS/sY/1YmYcPxqeNJ8mn77oiLGE+6eJUxCKzwkwe4mKGzuCeun
 pwePW
X-Gm-Gg: AfdE7clAb/20AEkgGoLPKzb73g2RSqPjGheyyyplTcQt/1vhjRbBaQW0zdRt8vR8Xgd
 EeIx+NM7wON/5ZFeUDoGQlzuOkOUEL1BbQ/Wc2i2D14wBuW1qEuGkCNps2bihMAzg2e5AToN2/N
 Eu5AOKCYeHpyAXZRBtB5SYFMHFad8tZgRkuL3+88fgT93PKU5UhsqYRKweMBrI99IiEWxBsSrEU
 GSkccyH/jTjdI434V8zJ+NK/ny2YeG9QwuEENmYPLHqhg/T/LsJMu3h9GupZSOMiSvWvK4HsErC
 jnUEDO5BtzFMlpNoSapsvS31OYoFYBjzYQehTYNr8ICI9jbXGf8+NnciDNs/2/WZgTIOdqQ56/U
 1wUhyb4rh1VPjtSZXr537qT7AsxvxMLoyH1PAouWDMKClhXSQ1GcOuJ2sXlim0xURAQKtS2U/tM
 8DmJQCs5aD5NFicrB8
X-Received: by 2002:a05:6000:2907:b0:475:f0c2:75a1 with SMTP id
 ffacd0b85a97d-47df07a4bc1mr13832128f8f.50.1783691526852; 
 Fri, 10 Jul 2026 06:52:06 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039b0cesm61503841f8f.22.2026.07.10.06.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:52:06 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:52:05 +0200
Message-ID: <20260710135205.760214-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260630212717.604030-2-thomas.perale@mind.be>
References: <20260630212717.604030-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691527; x=1784296327; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ki3FP0qbFczTRAozEWbEbiG8Cx5SESDmI0gIPuswdr4=;
 b=W5vhp17ZpzwWYjJ/0q2wZs5vHXVuwAAK02D7HgVIGycrn/dJYMcAaJyy3Xr9xwhR5O
 9dhik0gffT4J0oVXQtJlVuH7mTik0//fuMeTFGyQXYnl5Yu3og/wPsfvRdrBEZhqHV02
 5BIFMHfyC5SwBpcoF3hueDgZUzyOxtInfJohwXAprqJ3tUqDHDHwOjG0ebckbLqhIjvf
 8XQ9D9+/Dys7fJEs9DAnuBqHM6ltxf/R0GLjsS3xIvcFhFCgxQ0415OIwu9YfiUszIp5
 2ixThFrkP+YN7E/P0/UXLMai6KOkvchP2gDKSkIQ0RRFEb4MBrybiHZlmooc/pRfxh2i
 NcnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=W5vhp17Z
Subject: Re: [Buildroot] [PATCH 2/2] package/wolfssl: security bump to v5.9.2
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
> For more information about the release, see:
> 
> - https://github.com/wolfSSL/wolfssl/releases/tag/v5.9.2-stable
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2026-6091: https://www.cve.org/CVERecord?id=CVE-2026-6091
> 
> - CVE-2026-6092: https://www.cve.org/CVERecord?id=CVE-2026-6092
> 
> - CVE-2026-6094: https://www.cve.org/CVERecord?id=CVE-2026-6094
> 
> - CVE-2026-6291: https://www.cve.org/CVERecord?id=CVE-2026-6291
> 
> - CVE-2026-6325: https://www.cve.org/CVERecord?id=CVE-2026-6325
> 
> - CVE-2026-6329: https://www.cve.org/CVERecord?id=CVE-2026-6329
> 
> - CVE-2026-6330: https://www.cve.org/CVERecord?id=CVE-2026-6330
> 
> - CVE-2026-6331: https://www.cve.org/CVERecord?id=CVE-2026-6331
> 
> - CVE-2026-6412: https://www.cve.org/CVERecord?id=CVE-2026-6412
> 
> - CVE-2026-6450: https://www.cve.org/CVERecord?id=CVE-2026-6450
> 
> - CVE-2026-6678: https://www.cve.org/CVERecord?id=CVE-2026-6678
> 
> - CVE-2026-6681: https://www.cve.org/CVERecord?id=CVE-2026-6681
> 
> - CVE-2026-6731: https://www.cve.org/CVERecord?id=CVE-2026-6731
> 
> - CVE-2026-7511: https://www.cve.org/CVERecord?id=CVE-2026-7511
> 
> - CVE-2026-7531: https://www.cve.org/CVERecord?id=CVE-2026-7531
> 
> - CVE-2026-7532: https://www.cve.org/CVERecord?id=CVE-2026-7532
> 
> - CVE-2026-8720: https://www.cve.org/CVERecord?id=CVE-2026-8720
> 
> - CVE-2026-10097: https://www.cve.org/CVERecord?id=CVE-2026-10097
> 
> - CVE-2026-10098: https://www.cve.org/CVERecord?id=CVE-2026-10098
> 
> - CVE-2026-10512: https://www.cve.org/CVERecord?id=CVE-2026-10512
> 
> - CVE-2026-10592: https://www.cve.org/CVERecord?id=CVE-2026-10592
> 
> - CVE-2026-11310: https://www.cve.org/CVERecord?id=CVE-2026-11310
> 
> - CVE-2026-11703: https://www.cve.org/CVERecord?id=CVE-2026-11703
> 
> - CVE-2026-11999: https://www.cve.org/CVERecord?id=CVE-2026-11999
> 
> - CVE-2026-12340: https://www.cve.org/CVERecord?id=CVE-2026-12340
> 
> - CVE-2026-55958: https://www.cve.org/CVERecord?id=CVE-2026-55958
> 
> - CVE-2026-55960: https://www.cve.org/CVERecord?id=CVE-2026-55960
> 
> - CVE-2026-55961: https://www.cve.org/CVERecord?id=CVE-2026-55961
> 
> - CVE-2026-55962: https://www.cve.org/CVERecord?id=CVE-2026-55962
> 
> - CVE-2026-55964: https://www.cve.org/CVERecord?id=CVE-2026-55964
> 
> - CVE-2026-55967: https://www.cve.org/CVERecord?id=CVE-2026-55967
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
>  ...TS_H-in-options.h-rather-than-config.patch | 59 -------------------
>  package/wolfssl/wolfssl.hash                  |  2 +-
>  package/wolfssl/wolfssl.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 61 deletions(-)
>  delete mode 100644 package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
> 
> diff --git a/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch b/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
> deleted file mode 100644
> index 0599f9d615..0000000000
> --- a/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From b54173fc402c30e81d66b84e2f9725cb6d944b40 Mon Sep 17 00:00:00 2001
> -From: Kareem <kareem@wolfssl.com>
> -Date: Fri, 27 Mar 2026 17:01:02 -0700
> -Subject: [PATCH] Define HAVE_LIMITS_H in options.h rather than config.h since
> - types.h depends on this definition and config.h isn't consistently available
> - at runtime. Fixes #9936.
> -
> -Upstream: https://github.com/wolfSSL/wolfssl/pull/10097
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - cmake/config.in    | 3 ---
> - cmake/options.h.in | 3 +++
> - configure.ac       | 4 +++-
> - 3 files changed, 6 insertions(+), 4 deletions(-)
> -
> -diff --git a/cmake/config.in b/cmake/config.in
> -index f2524e41e43..6054b6dbe7b 100644
> ---- a/cmake/config.in
> -+++ b/cmake/config.in
> -@@ -19,9 +19,6 @@
> - /* Define to 1 if you have the `gmtime_r' function. */
> - #cmakedefine HAVE_GMTIME_R @HAVE_GMTIME_R@
> - 
> --/* Define to 1 if you have the <limits.h> header file. */
> --#cmakedefine HAVE_LIMITS_H @HAVE_LIMITS_H@
> --
> - /* Define to 1 if you have the <pcap/pcap.h> header file. */
> - #cmakedefine HAVE_PCAP_PCAP_H @HAVE_PCAP_PCAP_H@
> - 
> -diff --git a/cmake/options.h.in b/cmake/options.h.in
> -index 985b54241d6..c46ada8045d 100644
> ---- a/cmake/options.h.in
> -+++ b/cmake/options.h.in
> -@@ -33,6 +33,9 @@ extern "C" {
> - #endif
> - 
> - #ifndef WOLFSSL_OPTIONS_IGNORE_SYS
> -+/* Since types.h depends on HAVE_LIMITS_H, we must define it in options.h. */
> -+#undef HAVE_LIMITS_H
> -+#cmakedefine HAVE_LIMITS_H @HAVE_LIMITS_H@
> - #undef _GNU_SOURCE
> - #cmakedefine _GNU_SOURCE
> - #undef _POSIX_THREADS
> -diff --git a/configure.ac b/configure.ac
> -index bce600f2ecc..c5cf9f320c7 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -185,7 +185,9 @@ AC_ARG_ENABLE([freebsdkm-crypto-register],
> -     [ENABLED_BSDKM_REGISTER=no]
> -     )
> - 
> --AC_CHECK_HEADERS([arpa/inet.h fcntl.h limits.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h ctype.h sys/random.h])
> -+AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h ctype.h sys/random.h])
> -+# Special case: Since types.h depends on HAVE_LIMITS_H, we must define it in options.h.
> -+AC_CHECK_HEADER([limits.h], [AM_CPPFLAGS="$AM_CPPFLAGS -DHAVE_LIMITS_H=1"], [])
> - AC_CHECK_LIB([network],[socket])
> - AC_C_BIGENDIAN
> - AC_C___ATOMIC
> diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
> index e1ecd5f98a..c259734875 100644
> --- a/package/wolfssl/wolfssl.hash
> +++ b/package/wolfssl/wolfssl.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256  d5ca7af48cd2d9a91d539e9baedeba55a0605a28d7ac8b01dc3d5254a13ca341  wolfssl-5.9.1.tar.gz
> +sha256  2f4ef3d4fd387a9b3191d36a6316d69116c46ff69bb9583b6c82b36d7b8ca114  wolfssl-5.9.2.tar.gz
>  
>  # Hash for license files:
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
> index 44f51e06e6..779fd2cabf 100644
> --- a/package/wolfssl/wolfssl.mk
> +++ b/package/wolfssl/wolfssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WOLFSSL_VERSION = 5.9.1
> +WOLFSSL_VERSION = 5.9.2
>  WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
>  WOLFSSL_INSTALL_STAGING = YES
>  
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
