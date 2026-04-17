Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F5DF436B9
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 15:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0504C81203;
	Fri, 17 Apr 2026 15:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ReUAYK6xkBlG; Fri, 17 Apr 2026 15:24:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4DEE81213
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776439490;
	bh=2wJLkQjQk8oHZD9eOG9ujl1KITmAFe4O8oGg1GYO5fM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BT7Mnf7I/8VktsQueMEFdt7jB3SDVsUzyhfuACEO/RAATDoc1voWnlyrYyamryn1a
	 XVs4k29WsVoUg3Ql2FFQ+mQbjInO7hnU2CurRtnEaoemOJCjVPpvOM1dxFRTfuKijv
	 Spp3jEnee4jTn3CT+RiUWnmqYNqY8gqQK8pkxA5dACmwrjVPayT2jViA+9530CYR68
	 ZgoIpv9tVXiV3SrD0CzvN3LH9ejbpUwbdz64ubkid1HmD5pnFZ+d2IRCKEJ5SDUtdr
	 ZOPVF8HrBgk75L5UJJUOLQARjyQamI69NiaMOMuPY59BuNVctSgLJM/sSgdmhf8hok
	 wqH3ETJMtidKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4DEE81213;
	Fri, 17 Apr 2026 15:24:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B9DC2396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC0B340606
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1aqind7--pFa for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 15:24:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B59E405F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B59E405F5
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B59E405F5
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 15:24:45 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so5783965e9.3
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776439483; x=1777044283;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AoFfCgP3G5gwjB3H63ZUVFMIo0PmGWgKdw3kGmXXkWg=;
 b=IJQNbRiKc+eQLHpgrgMO1u0519zvjNozQSZVd4bUXoDroPODgZBDcdThUDPA9uJqk3
 uzI3KlpTNUqjWO80f31uOuhg2jYrVj61wk5PnT12ZcLZbi8z6lnAnjqfMAV/h1ZE2HZB
 MYEoQHuKi3+xSXAKtDr5TD0thBKJLxb2IPmd0N5UVv58iOrVSmPn6qz1noG5NPfNj4pI
 jYfIKtCCmPGz1bI1NpR0LWEhG39M18PSLqNb8xuaPWcvOhOkoqA204riMGZHVnq/Ejiv
 vus70/sHhtYnZLHeLjtllA7RjmN8pYPhseS32MWDc925SP3j3meHvg1gmeNcSFAEgJ6u
 nB0g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+qCnTjRhkIv96SLSw0WJhILMel4E/lKXoe4kyy1jvXOZOTeDfh72hbT8mxqTbR5irCo1F1uPl/fw0=@buildroot.org
X-Gm-Message-State: AOJu0YwKyjEWjK3omOI3cVoe8tuGjVNGyLsPamPmEBjJGcv4whsFP15v
 c4Xi+6w8ihR/YpOG0wpMCi14hrHR+pUEyC2i3Tgn7vBNiijthJsp7I8yu/QT7hgsGC4the6NoNP
 YHmYO
X-Gm-Gg: AeBDieuodaI5UiE6oRGNpkq28FyJS16vHdGI6pJz2PlhQqOq09Ho+n6hasYbNbaAsFx
 yV91f5tjXEXbtaSQsBW7Aekp4dSDBITkURKFwWZwXc+XpwlW8knzgM8H1McPrAJK/z2ETPsgzEH
 6lQ3MgcxY4MdwhWmaOvpR5GxrXqFTbA1Fimqpg1n5BwlIt8F2qE79NsTRLKduc+LGW2ajyvlaUQ
 lL5dQyBvjWlZAZB1ItCojNguwDTzIn3Yu/1OpQEArOgd8h24fioXv/NZX3E34hWtQgd6RZ55Yws
 NkPRqGVmEVacjaTWtwNMCUSVcvwfx08tB+T5LgMKfCNPwuS5kzed3kgEfB/wO/8q6JCUVNk/bVA
 lbBm9DItZPTLYLK+EtYpzG/ipDmyiI3iTaHOlGagu1CoB8T0Vw6MuEX/GuzDPEr9N6BpP9WEEmg
 580xafZdKSPeDU6iWH1TnnRA4rh/s=
X-Received: by 2002:a05:600c:5295:b0:486:fbd1:9dc0 with SMTP id
 5b1f17b1804b1-488fb780463mr40976715e9.22.1776439483363; 
 Fri, 17 Apr 2026 08:24:43 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c96b4sm87175565e9.13.2026.04.17.08.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 08:24:42 -0700 (PDT)
To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Apr 2026 17:24:42 +0200
Message-ID: <20260417152442.313056-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409-openssl-3-5-6-v1-1-3ced4c3e7b73@cherry.de>
References: <20260409-openssl-3-5-6-v1-1-3ced4c3e7b73@cherry.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776439483; x=1777044283; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AoFfCgP3G5gwjB3H63ZUVFMIo0PmGWgKdw3kGmXXkWg=;
 b=eEds6Gc/Ivc9yRkngGf1E9sUsFc/O4olIliIXPhHBzGb8NFba2R5khphNv1jorKJ9y
 u/Chce9ooN8cfyrlKNI+3nhyWYnYCRIjvD92Fqf7v7UUIJfuyJ34yFKC1j/FWk0F9/8N
 CIAZlF+yI2Dt9bnlbrSBwxk+NMtQ/RMy3JuQRXz8z4gsMLq57+vUKo0BzKYGQ9/zpt4X
 SDTiuzHpUiQcxCVqXajTMM14kx17LSSbMbLSWUzA3cWw9lhw7+KDC/uukiusoJR0ra1d
 z+aGvnxTf+QvfTXmFNYdOSGZGXCOQTH+h4J2wGzAVGlyv24dzVJfoBUgaP9THKCzWxND
 11ag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eEds6Gc/
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/libopenssl: security bump
 to version 3.5.6
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
> fixes CVE-2025-11187, CVE-2025-15467, CVE-2025-15468, CVE-2025-15469,
> CVE-2025-66199, CVE-2025-68160, CVE-2025-69418, CVE-2025-69419,
> CVE-2025-69420, CVE-2025-69421, CVE-2026-22795 and CVE-2026-22796, see
> https://github.com/openssl/openssl/releases/tag/openssl-3.5.5
> 
> fixes CVE-2026-31790, CVE-2026-2673, CVE-2026-28387, CVE-2026-28388,
> CVE-2026-28389, CVE-2026-28390, CVE-2026-31789, see
> https://github.com/openssl/openssl/releases/tag/openssl-3.5.6
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x. Thanks

> ---
> This depends on all 4 patches from
> https://lore.kernel.org/buildroot/20260319124247.2973165-1-jimmy.wesolowski@mobileye.com/
> 
> This is 2025.02.x specific because the only other maintained releases
> have updated to 3.6.x already.
> ---
>  .../0001-Reproducible-build-do-not-leak-compiler-path.patch           | 4 ++--
>  .../0004-Serialize-install-process-to-avoid-multiple-make-dep.patch   | 4 ++--
>  package/libopenssl/libopenssl.hash                                    | 4 ++--
>  package/libopenssl/libopenssl.mk                                      | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch b/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
> index 9353c1ae90..d283d8b329 100644
> --- a/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
> +++ b/package/libopenssl/0001-Reproducible-build-do-not-leak-compiler-path.patch
> @@ -12,10 +12,10 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/crypto/build.info b/crypto/build.info
> -index 2c619c6..49ca6ab 100644
> +index aee5c46766..84d94aa623 100644
>  --- a/crypto/build.info
>  +++ b/crypto/build.info
> -@@ -115,7 +115,7 @@ EXTRA=  ../ms/uplink-x86.pl ../ms/uplink.c ../ms/applink.c \
> +@@ -115,7 +115,7 @@ DEFINE[../libcrypto]=$UPLINKDEF
>   
>   DEPEND[info.o]=buildinf.h
>   DEPEND[cversion.o]=buildinf.h
> diff --git a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
> index 344b8d07b7..176375c000 100644
> --- a/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
> +++ b/package/libopenssl/0004-Serialize-install-process-to-avoid-multiple-make-dep.patch
> @@ -23,10 +23,10 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>   1 file changed, 5 insertions(+), 1 deletion(-)
>  
>  diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
> -index e85763ccf8..b671723813 100644
> +index 5bf397eba0..806084ac0c 100644
>  --- a/Configurations/unix-Makefile.tmpl
>  +++ b/Configurations/unix-Makefile.tmpl
> -@@ -661,7 +661,11 @@ depend: Makefile
> +@@ -662,7 +662,11 @@ depend: Makefile
>   # Install helper targets #############################################
>   ##@ Installation
>   
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index e78b664aa5..781701532d 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openssl/openssl/releases/download/openssl-3.5.4/openssl-3.5.4.tar.gz.sha256
> -sha256  967311f84955316969bdb1d8d4b983718ef42338639c621ec4c34fddef355e99  openssl-3.5.4.tar.gz
> +# From https://github.com/openssl/openssl/releases/download/openssl-3.5.6/openssl-3.5.6.tar.gz.sha256
> +sha256  deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e57d7f31f2a3b736  openssl-3.5.6.tar.gz
>  
>  # License files
>  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 2f844fd44a..837c3f0346 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 3.5.4
> +LIBOPENSSL_VERSION = 3.5.6
>  LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = Apache-2.0
> 
> ---
> base-commit: 6b12d67f57b358fb3e37fd5fb5bf80d99963bd35
> change-id: 20260408-openssl-3-5-6-d821b01d76e8
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
