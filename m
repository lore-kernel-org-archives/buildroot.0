Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA30CC9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78A7560D5E;
	Fri, 25 Sep 2026 14:46:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6TKonjoUaO5Y; Fri, 25 Sep 2026 14:46:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 77D0D60DAD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347578;
	b=OQ8aCdbPxbkwYF28GVp53yBprlr4oc/nBIaFBU3gQ1qGIUFGcsOMfnK6SnMf8LNFbqS6
	 NPWVqb1e9fL/BB9DOiXx4KBfcHEvg0858ZnzypmaylRykfWaj78OW+oG6suk4KGPk911Z
	 PkEwJR161vKt21YK0GV5bPAKE+e1wHGJrE+zX4k6KN0mSPqsgtag3hFkpXe9fUWEl5qK8
	 hZj+1fh8Iibrf18uq/qyi0DAXiTJoL1RdcDF5bndLM0g2B7N5LVjCyrj/mBuW64jPZR7t
	 dDBAk8HLPp2x2MjXUd7Xk3TfHvXikTQE1P2+IOA+sXkaUxVZ5bqswXrkgHJ7svL3mUw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347578;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aiGRtmYjDs2jPPiUxOTgsdJV26jfrgdQS6/t/NRm2qc=;
	b=fi6x/DdKw1jFYd40yKNUbYAlbw0R/VDvNp8xsLBxbS/puM5Znwy53qAjXpdz4xJ9ase5
	 RBFqEA0ywV7RbypX0L6+1ixkozf5KQRA3kjxFIGP6ro2lpDuh23j/QVoGNE9ahoni1pLp
	 7noZS4UKzWsoErOSJ8EsVlJZhxptm9/kdZYziEHbTvD2P6F+KhY27gifm/DEvRTohudtj
	 irGRwvxP7go+gT6SIv0YMMMrwBScfTVsBbEqCiocC8ZwBwouke67ZvgZIXqv6PqOZ1BQ8
	 TkwzndO0tZ6sMTsAqfzz16sm4/Q5wZCOVOy/m6B/K+IkK9J5Oqb9urUODI1xEf3qJIw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347578;
	bh=aiGRtmYjDs2jPPiUxOTgsdJV26jfrgdQS6/t/NRm2qc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I1dUsciROHyvryq+ZbOefZ++7eNwzMoLy+NCu+v3PyYGAfl0WFpsndDjAtuw4G6Us
	 emUmmXOHQfHD6PLk9TdmPjWY+IVSEgduzWeSSQwY/Eun5XLxKA0/EPYUY3f9NrRy98
	 Hu8JwuzMURnTHPfQ/3YGxUwFzP2aO6kBB6GStI4j33ivbYoXg7djRblVLjZHKPuaEi
	 69aCsCjbmG6uzg2sxFSvmn0DJsVq7LM4bBTtY3r+zn55zOL9fbhTUUv9WD1Dbson2m
	 Oh9g/kOxglyhO0G0Q8oQtTWN65QI4usKZQSzp7lKRkca084mwU9aUJ/7IxMwdiD7MC
	 P62l4fQCvZqjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77D0D60DAD;
	Fri, 25 Sep 2026 14:46:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 411F2332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2777A81398
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id peLCCBdDIk_T for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:46:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EEBA18136A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347572;
 b=RUWLrUZhDXapn0QDjKts0adYl1IZn+rQeYr1ZPgpH9gCz3aBSqah4nOuFOGLxl4YU030
 1FSHbAZDDv4Expiv+tlA9mFjqWQhwwHKYu1CWkjG35dKhOkmVbE6nwTYZ3seVs+G2hGuL
 TXoW2RJfWC076ht1vYRWjB7wmrBq6+2VnUM5rwehltV5k1ok8IuPVemNVkjICP3//BLXi
 iWATWiRY0miMNZ8+gh7ifLk5mp89wkKIfKyNupXtBYYuFyCyyjLuaO0529Lt9xVJmSSrg
 y1Rs+8LVKO54eYSdOFJw9zcM19cic++9N5b6igofGBAPFXnyTkGLtOqNTQ//ZwkjSlA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347572;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=+anB4I1iKas2hMKJp1kbfSpIoYEzNZnkXSGoxAfXCW4=;
 b=lDTj8XoD8BkrB87XHnSXC5c+UaSc9uynoPl0UJX544ZNbxiLcE0O7S4bui/X6HXDUlpX
 YQugEo7w68qXfKB1HGTUSutB+/2epSXM0OhxI9c9OxB09hMCFVLwh02wqTLxbZphIBHbI
 zV7T8a8zO/cNsdCRx1nS1PKl5Cni3CBdR4JnyNM/X7acA050vTMkgkyI7jYMevKpZQVVI
 k/vqxTYnGLNy4OrZaJ80WIIYPknIzQnmNFw0jXQBANSLSeItepzXxMeRZBVVIc1B7EmmO
 o7nNNRoZZqAtAYh+mrvBkwrSZmIXg/O5O8LFg44giTYQ9uP4TwM5gafv5B/Ce+65H7g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=C5kP78p5; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EEBA18136A
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:11 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f6350f89so628183f8f.3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347570; x=1790952370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+anB4I1iKas2hMKJp1kbfSpIoYEzNZnkXSGoxAfXCW4=;
 b=RyX1No0UY/ui+bTXI/psu2+Z8r671IuyP3h+Mhx4uUlmT/xft9JS0pojuTqMZ6cG2z
 RUgk9Lw7ofrwfFG4yybOqTnnIQL3RQ3aJ4eILmLEoxS3jH1uydp/sIecOdTZ3vs1S57X
 3GJvRgb6ytN+h0ZD5PeGvGRiSUXSDYCjX7ShYRyLmZJEW9FjT5DJY4KjTvscua4Ylbaz
 DBuAMWJRTei17c54ymruteAcrHJeOJQe6RlWNO1M70J5DX9Cz633YutOWpJ62mYBYo9M
 jwyOi1N577zFKF5chHbd5o21nyB+Vwlss4zsFy6HsL+tfgyEoiF5ij+tf0KwQGi1P48C
 KOaA==
X-Gm-Message-State: AFuF++nVExIsmmC61frcVWIoTy8W+G/lKM13Y00P+x2ESdr7C9G0dDk9
 ZK7aOs8Xxbixkw7D3aHlHId205VbPXQ1kT92Zc6uGqOpATIvTYQXz+rEZQ2dAFJ09iAUM37Lxj9
 b6wXvbRM3DQ==
X-Gm-Gg: AYBFou3/bE6TIctivv6+a4HZd24N3pfP+LrgxCFVf8l5EziFeMokOxUepKz1ntEfJBc
 ngqkiF0X4u4JfiVSxC+R5+Tf6zYrMXa9udCb4gtfA3alP7v6bz1YuDncLVQ3XGHDI3Xg5IJSyDC
 GF4FdhHLcGbk46IeO4lnUAGfwH/n/4/zSwGfWpvQNi/ofbYpNLV6Cem1qhxBvfQSc/iocHFjmC1
 +m9msbl4+BxLxU5QsZLOdgK5d5GC1ii5sfuVcL2us6NIzEsg0IFLMcQA8RVgrnTZCXl8SPyxYqE
 tXFputqHJacRqArmCAoUncFC0Tq6uj25GOBQ0NT6hqSMJ9GIg0jvgSNXmXiLQcefhS4gcmnB05A
 MaATbZrFU3Z6v02B7+mBAqJDLZPaNO2wvSWHx2sIisNNhXFzX/PQU07Bq8xhVMsGLBr7zFbKDPk
 Ug4B+B5TB3LqxPSw/D17NPviZr28yGRoxTnG0UDVZPrb4WShmxDIMOGHaJ2Ip0HlgUph11IAanp
 jCXM9ZmMvgTBXRvqmHSzsZPjytZhMn/cC4XLalAig==
X-Received: by 2002:a05:6000:2010:b0:488:7803:c1ef with SMTP id
 ffacd0b85a97d-4887db496acmr4503651f8f.48.1790347569973; 
 Fri, 25 Sep 2026 07:46:09 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a6456f8sm7332294f8f.26.2026.09.25.07.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:46:08 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:46:06 +0200
Message-ID: <20260925144607.4098882-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916194222.1478392-2-bernd@kuhls.net>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/bind: security bump version to
 9.20.29
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://downloads.isc.org/isc/bind9/9.20.29/doc/arm/html/notes.html#notes-for-bind-9-20-28
> "The BIND 9.20.28 release was withdrawn after the discovery of a
>  regression in it during pre-release testing."
> 
> https://downloads.isc.org/isc/bind9/9.20.29/doc/arm/html/notes.html#notes-for-bind-9-20-29
> https://downloads.isc.org/isc/bind9/9.20.29/doc/arm/html/changelog.html
> https://seclists.org/oss-sec/2026/q3/801
> 
> Fixes CVE-2026-19033, CVE-2026-19662, CVE-2026-19666, CVE-2026-19667,
> CVE-2026-19668, CVE-2026-19941, CVE-2026-75029, CVE-2026-76163,
> CVE-2026-77119, CVE-2026-77692, CVE-2026-78301, CVE-2026-80274,
> CVE-2026-81563 & CVE-2026-81736.
> 
> Raise the minimum gcc version to 8 to fix a build error found by the
> Gitlab pipelines which would be introduced by this bump due to upstream
> commit:
> https://gitlab.isc.org/isc-projects/bind9/-/commit/a891e7423379e69340e5004a753dc121320ef244
> 
> opensslrsa_link.c:53:51: error: initializer element is not constant
>  static const unsigned int rsa_max_modulus_bytes = (rsa_max_modulus_bits + 7) /
> 
> make[1]: *** [package/pkg-generic.mk:273:
>  /builds/bkuhls/buildroot/br-test-pkg/bootlin-aarch64-glibc-old/build/bind-9.20.29/.stamp_built]
>  Error 2
> 
> According to https://stackoverflow.com/a/67000730 the code needs gcc 8.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Series passed Gitlab pipelines:
> https://gitlab.com/bkuhls/buildroot/-/commits/85e18ef8b3386843fe38f04881d39f1f8d9741d0
> 
>  package/bind/Config.in | 6 +++---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/bind/Config.in b/package/bind/Config.in
> index 4eb024b260..7e691a35ca 100644
> --- a/package/bind/Config.in
> +++ b/package/bind/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_BIND
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
>  	depends on BR2_INSTALL_LIBSTDCPP # liburcu
>  	depends on !BR2_STATIC_LIBS # libuv
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
>  	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS # liburcu
>  	select BR2_PACKAGE_LIBCAP
>  	select BR2_PACKAGE_LIBURCU
> @@ -48,9 +48,9 @@ config BR2_PACKAGE_BIND_TOOLS
>  
>  endif
>  
> -comment "bind needs a toolchain w/ NPTL, dynamic library, C++, gcc >= 4.9"
> +comment "bind needs a toolchain w/ NPTL, dynamic library, C++, gcc >= 8"
>  	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
> -		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index 2131f51978..8129fa2d2b 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,4 +1,4 @@
> -# Verified from https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.27.tar.xz.asc
> +# Verified from https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.29.tar.xz.asc
>  # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
> -sha256  145ab7a50b33a06d9d488b5e668c887e754f42acf8954e2b5dc7e238b080e4a0  bind-9.20.27.tar.xz
> +sha256  587029508b3b1b43229fae416c97e5543aba45809cefaca98a5004a02a5736c1  bind-9.20.29.tar.xz
>  sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index 2b42e87d62..a05ef6c362 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BIND_VERSION = 9.20.27
> +BIND_VERSION = 9.20.29
>  BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
>  BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
>  BIND_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
