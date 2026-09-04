Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38C4C79F88
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 969DE60D58;
	Fri,  4 Sep 2026 12:17:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6P7WaitMiX6K; Fri,  4 Sep 2026 12:17:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 05AC760C23
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524271;
	b=FRRNnP7ymx8YzyyFg49KZQs9hDidNZSnaSuCmjQNo7yl2AjCc3E3HmmUJ/hpyNMElIe3
	 mjUlsYO6KhbVkPH26uxHMO4SAUHPuBQFTHwGY1o+7+wvWomgaGYt1vpYH6D8WXc9KqJm6
	 AjwIYvNjeDrvCWKGddh7B0kwMTEwNpjAQbQIU1iPsD5hd+Bn+MOL/EKrCEGGLWLlODpnf
	 ayid025olMN3l7annSdn6z4F+9Znz4riPeX9XVRApH7b7mWE9AIttYfe6qpDqLPugXKz+
	 Rx5iFEHlVzj5oQebpaZPtJChHoDCvgO90/vneTrkllUt2YwQ90OdPqJDlGAV1Ec8GAQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524271;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=C33jEr5oCPpadheU2rivsR1w1UE4ENuAPnkht/OCXwA=;
	b=RZ9HH9gLWmIV+VD2SpZaFGS93nu3cDjBh7X/JiHKjCrrrgaDD+PkrdGtXXg17cbRZQZA
	 6I9UA+SF1LAkhb+FeQGRlW8qtbgFBaHnEmHLiA3dEOQOQm9kq1rJ12vU6OsimgTczZUbT
	 DRXNzdM7bU0bwurGQ4cEzwUrnXuCOxKT58dafnDKwB0x/M4XCHAUznZb9zbpiIQ1KQFZv
	 P/6jJnK2btLOsmGWCxDxS2wTbImiY4nK5fe+cTE5cAUee3VkifmjpfEq0UCZgINUO84iO
	 BAz4IO+/FmcR8SlurQffrv6x8wQQB0t5sn4/n/QKVNNLpycKMpLohKrPhDC9jHYsk9Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524271;
	bh=C33jEr5oCPpadheU2rivsR1w1UE4ENuAPnkht/OCXwA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dQhARvHJ8YQ4C8KNAG89eDlda4jA2cZmHErVral467nYGZRNKDSjHxjBL6/ulvfUi
	 hKA9jOuvjwyGAABao1kwUEMPOW+n0IK59CXpq3d4K9yD8YEXQDukZi0Wl0zADd1ya3
	 3zLOFFd2sDeoFa6Tj1VcpHfsg9sF2LWItrb2YFhIBRzn3kLBf+VUQDB4UZEI4HoP9N
	 b7qAIeab6QwRp+FHN5lGHT5wsMEs5467kMMViCfs9LiYjsOk2I0rDNksq+QTEr2bOV
	 RfaBW03olfLuM0NMk+2LDRw4zg8TRKY5IqCFGyYX3uNhQoH7SWpSRal+Cc2zGia5Bt
	 gPgVv7/VTsQug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05AC760C23;
	Fri,  4 Sep 2026 12:17:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A179F14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67D1481176
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPr7YNHeFpON for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:17:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4C12381172
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524264;
 b=Ep3KO+kUwjnOt+tBRjUnIwKjESUQpIhoouYoJq96kbpSejyfTRS/ixWPhLphGM+v0bhO
 d+sLWiVJ+Hyqt1KcdOCW2y/Fg1/8cN+JjlXKW7CkpAz2hsCNKmkah2B6a3mQdYaDec4MT
 Y0fCa5bB22LJynOApm+iOoY9U29BUTNfpNVHUjg1kFzmzLNmHvuLcZ7mk//4RTjEOSUJn
 a8Shu+cKnGv9jQk/UE7ilhQvVHH6H0j1QPaDYb7+AwT6VWA4jmxx63IzYgFsn9knFTxj7
 Xf3y4ncy1iqys2qeSZ4AC0kWuI+r9pqN55j6OUYNw30F1pjpMyFJaXyYDVkK8Pk+gng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524264;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=wrS9dNjboqfOivwC/w3D3OvvGWJeYdXvnjqluWn6Myg=;
 b=Yqyz/RA2Pohj09LantBwaG5qz/YTlagaBGdKjc/xsK81H98brLlevK6c93993GoT0jab
 WGH+2B6+ns+ClFLcVRGJywidY/N/svxpS6pQ3oUxbgyfeDyW45mT/7WOoIvOeFvCbEEIt
 YgC4UK2CY1/S6a/IxIOLrgqRWpWn+xW53F5VkEW2Ulyclufambx0vrPWfAHSwPUwY3t++
 stDT7o76IMo+mvH6cVU7UYRN35nemONyVAnBTp2/e4a9QRwZ64kKkw/CTkauz2FltMgYg
 BIHFtO/SzexnvbgMPd0/flXVPqY/0jj0k88DpXDoD48y1H5sLYjNWM+JMXK5HkkFKbw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Z4UFN7MK; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C12381172
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:17:43 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4957eefd361so7235325e9.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524262; x=1789129062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wrS9dNjboqfOivwC/w3D3OvvGWJeYdXvnjqluWn6Myg=;
 b=aFrUAamQA/9zUxUXs0V7sV3KrTaQZGSguzwg2FDVYw2D5dZcprv9VJqYGxSbamtABg
 V+35LsOS/975if1Y2TJZeTiOKjkMo4flA9SsQrOl663zErNruB9srkxiHnUYHvU4Xv01
 r57pG3qY5MpKYwocY2WuULlCp7CD4TU9VN5zHo9bYWMdK+j+w5jd3XQ4N3ExvflAr4Nu
 FP5bsn7IqcMzMX+Pisxrv1588U9V3JSFQqnYt8eb0l7FhgzCXekBPnXQj3gikx+WWqYL
 hQYWIvXS0J9+gTW7pTRMYp7IXGKSWc4+QOSFgqstMALIL7AEQ+fehkEpgKVOLHCshIYk
 61lA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx5QsLw7qoi2LG622niGyzY9YFrAUwyACLSXDFvbDncLhFXtkizM4lFE8IC3zrxHf4XjZL3rD/wF34=@buildroot.org
X-Gm-Message-State: AFuF++nkz/dufe7O4/szE7YW/HpKaef36phOMlmkH1IlsXXE7+9kLbb2
 KRxYlZLR8mwur13R5K4IZZ5SQPplxMQRcyHZt3MDQfIzjVamwa5dYjv3Lq6H/MTCDLcofa3uHOe
 EEqVP
X-Gm-Gg: AYBFou1gISdawECbwdgPpKXBdu6S/fk2HDWURl7/LkqGDNKyqTDoaLEhdb5HS858mKV
 UtIJc9MeOHdh/+0oYpVKkL0iwQ8PRINTuWIefAQiu3FsbnM5uSOta7Cd3UVwJUbP0j2V/wBA7iF
 8BYCNXG1SjZnLjJWalDORqOepkAg8T4/HC1BMknjVjT1p7/eRKCsBMhLofmWFuKa1lrKFXarYj6
 +6Tu/dPleLzqpQSkpUqyCYTEvPE36KvL7Bw2ft0PNvkmtDqBeA9UtlQjhi8qVqXlWi31cXZS7wT
 4b3i1rbBbHwo0nMW1lpLGUef0wIGoSc7MwlQrmNEzgZpSBTiP/2F5PCjceB1MSPZ9gyZmm2IOvp
 0hka/qyR0zKTa6ObLgBL8L5nmLXSUMEXH86x1dTIy0HSily/1Zb/w10Qm6y0b4l2u5D23+BbXIV
 N4m+qNORoel5U4yT7ACFz/LgOmbaG58VKNX6vuYvUrYrp1aVVltdDQkw==
X-Received: by 2002:a05:600c:3546:b0:49c:fc6e:a3db with SMTP id
 5b1f17b1804b1-49cfc6ea79emr28387775e9.26.1788524261525; 
 Fri, 04 Sep 2026 05:17:41 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce5952560sm175149655e9.3.2026.09.04.05.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:17:40 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:17:39 +0200
Message-ID: <20260904121739.404149-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827095520.1049186-2-thomas.petazzoni@bootlin.com>
References: <20260827095520.1049186-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/bpftrace: bump to version
 0.26.1 to fix build with LLVM 22
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
> Since Buildroot commit 25cb3813e7fc6ed3e455f983cf0e09c7bc02fccb which
> bumped LLVM from 21.x to 22.x, the build of bpftrace is broken as
> bpftrace 0.24.2 only supports LLVM up to 21.
> 
> We tried backporting the bpftrace patch that allows using LLVM up to
> version 22 but the patch didn't apply cleanly but more importantly it
> wasn't clear if this patch was sufficient. Therefore, we opt for
> bumping bpftrace entirely to fix the issue.
> 
> Packaging changes:
> 
> - The new version of bpftrace no longer needs host-bison/host-flex,
>   because bpftrace is now using a handwritten parser.
> 
> - Pass -DUSE_SYSTEM_LIBBPF:BOOL=ON to ensure the system libbpf version
>   is used, and not the bundled version
> 
> - Now depends on kernel headers >= 5.10 because it needs CAP_BPF and
>   CAP_PERFMON
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/a3e3fd696685864977c688aa11c2653357cf6207/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2026.05.x. Thanks

> ---
>  package/bpftrace/Config.in     | 6 +++---
>  package/bpftrace/bpftrace.hash | 2 +-
>  package/bpftrace/bpftrace.mk   | 7 +++----
>  3 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/package/bpftrace/Config.in b/package/bpftrace/Config.in
> index 8af94443ab..2beb2fdb95 100644
> --- a/package/bpftrace/Config.in
> +++ b/package/bpftrace/Config.in
> @@ -14,7 +14,7 @@ config BR2_PACKAGE_BPFTRACE
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # bcc -> clang
>  	depends on BR2_INSTALL_LIBSTDCPP # bcc -> clang
>  	depends on BR2_HOST_GCC_AT_LEAST_7 # bcc -> clang
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 # libbpf
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 # CAP_BPF, CAP_PERFMON
>  	depends on BR2_USE_WCHAR # bcc -> clang, bcc -> python3, libbpf
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # bcc -> clang, bcc -> python3, libbpf
>  	depends on !BR2_STATIC_LIBS # bcc -> clang, bcc -> python3, libbpf
> @@ -47,10 +47,10 @@ config BR2_PACKAGE_BPFTRACE
>  
>  	  https://www.github.com/iovisor/bpftrace
>  
> -comment "bpftrace needs a glibc toolchain w/ C++, gcc >= 7, host gcc >= 7, kernel headers >= 4.13"
> +comment "bpftrace needs a glibc toolchain w/ C++, gcc >= 7, host gcc >= 7, kernel headers >= 5.10"
>  	depends on BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP \
>  		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_HOST_GCC_AT_LEAST_7 \
> -		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
> +		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
> diff --git a/package/bpftrace/bpftrace.hash b/package/bpftrace/bpftrace.hash
> index 4add96aee3..48572d1c58 100644
> --- a/package/bpftrace/bpftrace.hash
> +++ b/package/bpftrace/bpftrace.hash
> @@ -1,3 +1,3 @@
>  # locally calculated
> -sha256  e0514aa3e1a032b0b2de2cf3c281bfee9b9e80509498e70ed78786bbd64db373  bpftrace-0.24.2.tar.gz
> +sha256  555368f32f94bfcb74b119a3d9c67b68200be6375b8f452f794a2d3f6ebbcd16  bpftrace-0.26.1.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
> diff --git a/package/bpftrace/bpftrace.mk b/package/bpftrace/bpftrace.mk
> index f530d4861b..7c9bc6b7a4 100644
> --- a/package/bpftrace/bpftrace.mk
> +++ b/package/bpftrace/bpftrace.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BPFTRACE_VERSION = 0.24.2
> +BPFTRACE_VERSION = 0.26.1
>  BPFTRACE_SITE = $(call github,bpftrace,bpftrace,v$(BPFTRACE_VERSION))
>  BPFTRACE_LICENSE = Apache-2.0
>  BPFTRACE_LICENSE_FILES = LICENSE
> @@ -13,8 +13,6 @@ BPFTRACE_DEPENDENCIES = \
>  	bzip2 \
>  	cereal \
>  	elfutils \
> -	host-bison \
> -	host-flex \
>  	host-vim \
>  	libbpf \
>  	llvm \
> @@ -29,6 +27,7 @@ BPFTRACE_CONF_OPTS += \
>  	-DBUILD_SHARED_LIBS:BOOL=OFF \
>  	-DBUILD_TESTING:BOOL=OFF \
>  	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/include/bpf" \
> -	-DENABLE_MAN:BOOL=OFF
> +	-DENABLE_MAN:BOOL=OFF \
> +	-DUSE_SYSTEM_LIBBPF:BOOL=ON
>  
>  $(eval $(cmake-package))
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
