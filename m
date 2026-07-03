Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA1BC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47EA261524;
	Fri,  3 Jul 2026 14:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4i7MRiNiHJa; Fri,  3 Jul 2026 14:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 373146112E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089185;
	bh=FTiqhhiiUzZATJ/X5ICPgK4G7FVsAxUfdW3TS5Bj8IY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rtj0b3eiIrSamW8T9EOgiwxFlnew8P+cfzASBJ2iNBAIf+cvcdvzoi7ocQcBFdju+
	 csN+WQxdB8cPMA8ogZnCDHMmKeumsYOekRK6ot0fws7JTd4HrhkJUhR48ewUc5rw4t
	 PBlscAxxuSS2Nvienm6itFYxX7q5X21KUlhT4eWbcc9zRVn27rCAhfd5njW2ZOsz8R
	 6qTw9QQIGfkTZrSz8RNw7DbgMZltVVPh1zUgEto4LHWknklRue4+b33NKuKqOd6mYN
	 wVh83RlDokJWsNQ+xMZPxJbrVTnvR9scpgD22tPL5UOdHWhXrNGmwrVw6QJ+U6AqgN
	 ZCAfdMZaaR2XA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 373146112E;
	Fri,  3 Jul 2026 14:33:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 66C66363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D157412D4
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id de2qBSTjsvhD for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:33:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 19C59412D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19C59412D5
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19C59412D5
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:00 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-493be1b9682so5354145e9.2
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089179; x=1783693979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TG/iWjSgUvehK/D7KHxCntTAFOPeO/PdfaBaOWZZW0A=;
 b=SAos7zpo5h6JhFdyZY0zFFWAm8+QXayHjY6C9syiYBkLEI0OJKrybobqcdOkyg6g2L
 lBvTsMrvDlY8VGmWP2TPEmK9QJHu0yt3+cz5UcCFFYPJIlREfG3scJ0/415o2QSRtZw6
 vAB39xuPe/iCX6aXReKyed0SeVmiiZe50S3pPMpaZxjJ9NKUnKMwY2aRxvP9TnuLd5lT
 OKr1aekeiFsokDunCftwPOpsM6M+mOlzYssJjVzQbVyhieMa12jckUKyfxbwrzjpN3Ya
 tt+gMuGeOzC5h85QZ/RarBrOELp52WmJQ02RK2pPScf1qyHxqj0tdb298pyhHNcHVngY
 9ndw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+QCJU+XskvJIz4Ar+M1plIsrHeczKFz8hKqoyXLBhG/WKYr5VYv/LdiK3TYgJibjmS8/S0ZDT+gKg=@buildroot.org
X-Gm-Message-State: AOJu0YwTOfvguOOXSt4752LeOnLAuNpFCcJm0tZzancoYMSOOjabE+l4
 G3WhQ+hH0CsSvhJJgAmkkxYNXVDeT1uwEjCoE7XddcacM1/ZVyAw4a7tzi1rKy8kNcA=
X-Gm-Gg: AfdE7cmW/MfhAqg/KdLk9rTl4eMh6seziyLcuvCXfsVcffCMy2g56/hnbzas4fqtk5o
 Z0v7qJbQEGbtHgIiTH/3GnpUmZsaZ4NsEETt5rFtvcUnt0lH110Y0e/jxk31nhrkMqu2fz7wc5F
 2KMjF5G4RkQxgAMm7D7WXuHlR1jc8Iiez+zUC1Ngo2z3BBZG0p5wCnYRPz63pkHV7QtbqDkTLE1
 43naQ+gM6jJ6+O+xdcRKHw0ku1NCUbNNEgPvTTrV1oKW+bYzioXwj+JuQnQEiev5eCDNTD3ImIf
 YzQ91J+8PU0udD0fm+PvQZ3Q3fhkv20xkPYoYRJAc2B5a3k0oRHkP3NYEhQkeFsR/e0STa79J56
 tLlQqabw/zsK4e2ZAGL4WrHRKUoiqkCLFp/1JdkTER+UcVjiLwXn+g02+I31sKPS4GJdS4DVUoI
 pfQOQ99GWmP+D2A88=
X-Received: by 2002:a05:600c:6206:b0:492:62d9:4e57 with SMTP id
 5b1f17b1804b1-493d0f0972cmr1638945e9.2.1783089178842; 
 Fri, 03 Jul 2026 07:32:58 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493bfe7427dsm127005255e9.2.2026.07.03.07.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:32:58 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:32:57 +0200
Message-ID: <20260703143257.275374-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260622185602.1397198-1-giulio.benetti@benettiengineering.com>
References: <20260622185602.1397198-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089179; x=1783693979; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TG/iWjSgUvehK/D7KHxCntTAFOPeO/PdfaBaOWZZW0A=;
 b=c1Jg+Gov6MIxufjonJsuTc8isI+wYivz+9EKhTS14iaKmzi5vCcyK4M7Lujg2xso2h
 PCf+OmPuYrnpHvl9T/mCehxgmw4dT90VsdIiwEPJTxUHBZYSCWR5XatGbG3W+Q+6DcHr
 LSb/ugx9Mkh8daY46pR+cOzgoMJvFW48Lj+ExcImMZcetL9Jo6CZTzWCI+9PrgYp9wAp
 varTWNINlun6SbYkEmpCNFoTQy1XovntcJF72DYLRS6YRjl+wA60D3MobzCTHV9ptmXJ
 RMAUW93dj0nR/HG0+Vc6Ogrt8qBWR/y1bh3168dq7DY7OWjkt/azfMdOKUN4HciXCiIs
 HJoQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=c1Jg+Gov
Subject: Re: [Buildroot] [PATCH v2] package/bind: security bump version to
 9.20.24
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
> Release notes:
> https://ftp.isc.org/isc/bind9/9.20.24/doc/arm/html/notes.html
> 
> Changelog:
> https://ftp.isc.org/isc/bind9/9.20.24/doc/arm/html/changelog.html
> 
> Fixes CVE-2026-3593.
> 
> NOTE: Libraries libcap, liburcu are now mandatory.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> V1->V2:
> * rebased on latest master branch commit
> ---
>  package/bind/Config.in | 15 ++++++++++-----
>  package/bind/bind.hash |  4 ++--
>  package/bind/bind.mk   |  4 ++--
>  3 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/package/bind/Config.in b/package/bind/Config.in
> index 512e948ca2..6f5f14a6bb 100644
> --- a/package/bind/Config.in
> +++ b/package/bind/Config.in
> @@ -1,10 +1,14 @@
>  config BR2_PACKAGE_BIND
>  	bool "bind"
> -	depends on BR2_USE_MMU # fork(), libuv
> +	depends on BR2_USE_MMU # fork(), libcap, libuv
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
> -	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # liburcu, libuv
> +	depends on BR2_INSTALL_LIBSTDCPP # liburcu
>  	depends on !BR2_STATIC_LIBS # libuv
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
> +	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS # liburcu
> +	select BR2_PACKAGE_LIBCAP
> +	select BR2_PACKAGE_LIBURCU
>  	select BR2_PACKAGE_LIBUV
>  	select BR2_PACKAGE_OPENSSL
>  	help
> @@ -44,8 +48,9 @@ config BR2_PACKAGE_BIND_TOOLS
>  
>  endif
>  
> -comment "bind needs a toolchain w/ NPTL, dynamic library, gcc >= 4.9"
> +comment "bind needs a toolchain w/ threads, dynamic library, C++, gcc >= 4.9"
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
> -		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
> +		|| BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
> +		|| BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index 766540ee22..a1ff3c6101 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,4 +1,4 @@
> -# Verified from https://ftp.isc.org/isc/bind9/9.18.50/bind-9.18.50.tar.xz.asc
> +# Verified from https://ftp.isc.org/isc/bind9/9.20.24/bind-9.20.24.tar.xz.asc
>  # with key D99CCEAF879747014F038D63182E23579462EFAA
> -sha256  a24f93be94712a8c11752294410f2f8a2510ec7fdc931d207fc61cdf30e54f4d  bind-9.18.50.tar.xz
> +sha256  989fef1fc88ea59d04cd86f854dca5a4616a20a9968bcdde3c1a3668ab36be08  bind-9.20.24.tar.xz
>  sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 54870bfa4e..2b8156d0d0 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BIND_VERSION = 9.18.50
> +BIND_VERSION = 9.20.24
>  BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
>  BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
>  BIND_INSTALL_STAGING = YES
> @@ -32,7 +32,7 @@ BIND_CONF_OPTS = \
>  	--disable-static \
>  	--with-openssl=$(STAGING_DIR)/usr
>  
> -BIND_DEPENDENCIES = host-pkgconf libuv openssl
> +BIND_DEPENDENCIES = host-pkgconf libcap liburcu libuv openssl
>  
>  BIND_CFLAGS = $(TARGET_CFLAGS)
>  
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
