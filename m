Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4258AEB28D6
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFAB661148;
	Fri,  6 Feb 2026 08:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OhPmreNysR1O; Fri,  6 Feb 2026 08:10:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFED860EEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365459;
	bh=kJkf5wXLdsw1Os7+SdwEnUdkS9z+5oSPMBi/XifAv84=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Lum/BUjauY4byDUHB4h/VuYtwxTTUbRt8F35M+441i1v8QTqELHBnBdlEMFU9rtei
	 n8ByKIb1HK3yh0u9D30P9LGk3bIv/mtSj4M3z9Ni7BDXcFpQdaPV9txGRN3FwD/fU8
	 2o1wE8oiDk8uOUaGOEHRzMhaR+d42eHn5GQch92nrFlu5QC3E0SbwVqJDwojzTtV4/
	 E9bGoXHOElKCjAJQ2k0jfAPX96e56CbvwBdFu2OUL8yFrEEf1IPR47KjhC5qnvDf2l
	 uINn3XGVcIgz8xxLAYfABy/vPFRSJSlrrF34j1PuMHHUAEDtNYjER84qneVrUz17as
	 A/Zij8JNanTLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFED860EEE;
	Fri,  6 Feb 2026 08:10:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 746C8219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6229B41204
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYdW9RIwZ9Vl for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:10:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD13840CC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD13840CC1
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD13840CC1
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:10:55 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4362d4050c1so95438f8f.2
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:10:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365454; x=1770970254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=L4LNb3hvgx1KEq3P/7SM7qGzUm7BgEyL6NzL5UBpjf0=;
 b=UuaaSGezM19dhA9mn9oo7wsvT4sFU8Lyb6FluamhzUG1B77obn7y9zRjnnG83FCEg/
 ggbXnHn4R4Wgby5wgvMLvTJF1urJtzqvzrq1MWl9Bti/VR101DsMCnGwuIGPkRcRsdJX
 pn93BcYQ4Bf8jzJ0Y/3UNPv7qNxGnP+qt/opiwhCeE9Yi1P+qeyQbSLzLBumkLfGpLSG
 xFdV7DOrfBXIzOdKa3hqdU9c3K+cPDizt68fWARoJd+NTJ48KFdLDllDhMQA6bhRTyn2
 L8mVNlfO28VzDdEbEAe8LqroTpUvyznwuG8JdXptADJrbhXJRtQc9veorQO1z73WtZKl
 zPyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOlTX96KaA2k7eBTP1cmNBEqZvkCpGH7okpIkXkyZ1rKN6xQrgltix2lPPqUoq5Yeapl4SL1kIqnU=@buildroot.org
X-Gm-Message-State: AOJu0YyI94zUyxPR6UhDcP9AO+rj0x8LPMGW3C0txVAGDx/tcFmslBaD
 eTkwLi17ihTUsj4lvufSa/l3SEKcmYWxBmBx87qTa+Uru4ieGq11LXorq8q9GSi240CL5U6Nou+
 0qugF
X-Gm-Gg: AZuq6aJoe3gkuxAfCX4xPf/j2RHeisqT5Km8ndvkXu4ziYs+GiNgGbbQA8ONld7DXOd
 lfWxKliXCHaiwSSjBL3QbdfTVELuzyYeGkddoyKfT+rjXzRAMgylCqaRao7iw8gf2Sa0YBbgsS9
 dxySImk00efSjIp9aLybvUyd05uYRrRopO8j93uy33GY8aRS24xLaqjkixylr6jfZLjlb20W12k
 74DCnB3DSY/DWlUKqJ72FLZla7UvNW1EyvKCo73mHS3zL9EFGFLSonm55nOhGaZ6rvSTX++9EE/
 ROWtc549KKqBjK+W5oDZXFbhgiQcV3yupAELSFt5hFdmu/Ty0pauatDclFn17/GTS/GxslQ8lKa
 NGc20VPY5q7VLutrOXzF88R28L9kRY08pr9xXcmpG4NS9/9AKNu+tsx6fQSEaW0XdsPaQhQwHQh
 8YSOw=
X-Received: by 2002:a05:6000:4382:b0:436:1e6:e1e3 with SMTP id
 ffacd0b85a97d-4362938ff2amr3147675f8f.46.1770365454020; 
 Fri, 06 Feb 2026 00:10:54 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436297460a5sm3745944f8f.32.2026.02.06.00.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:10:53 -0800 (PST)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:10:46 +0100
Message-ID: <20260206081046.31106-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260201205228.96782-1-titouan.christophe@mind.be>
References: <20260201205228.96782-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365454; x=1770970254; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L4LNb3hvgx1KEq3P/7SM7qGzUm7BgEyL6NzL5UBpjf0=;
 b=VO1Is7Xzp/Ij8Y8w0VODrI4xKlh2nQW79Vqt0nX6b6NDWuVhAPV7bre1SsA2Ro2rZv
 8tdRmDGZdAsooABAXfkpz/w5v00hFOjMKeeET64VeMJrvDynzcFcMOuQkv1ymCKG2nPr
 s4KCe8jrTqJf+1/J6Fa6WKB8I/mzIZbRKMYmQ+3QSgGvphOQflpg2brRXPLOvc3tENJd
 biWxKQBi4g+wRdBYDa1zS0bIW8cVl5dpimY/zpPdMFayezehKuuUP8GnghUHWMQEcTC/
 VO+Nc2w+6vqYmFBXYgG7pwzONx/xt6VVYjCCUCWIOQl+y9C8OQ0UrUJJDSZLAEV6RyES
 RRbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VO1Is7Xz
Subject: Re: [Buildroot] [PATCH for 2025.02.x] Package/libopenssl: security
 bump to v3.4.4
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
> This fixes the following vulnerabilities:
> 
> CVE-2025-11187 - Improper validation of PBMAC1 parameters in PKCS#12 MAC verification.
> CVE-2025-15467 - Stack buffer overflow in CMS AuthEnvelopedData parsing.
> CVE-2025-15468 - NULL dereference in SSL_CIPHER_find() function on unknown cipher ID.
> CVE-2025-66199 - TLS 1.3 CompressedCertificate excessive memory allocation.
> CVE-2025-68160 - Heap out-of-bounds write in BIO_f_linebuffer on short writes.
> CVE-2025-69418 - Unauthenticated/unencrypted trailing bytes with low-level OCB function calls.
> CVE-2025-69419 - Out of bounds write in PKCS12_get_friendlyname() UTF-8 conversion.
> CVE-2025-69420 - Missing ASN1_TYPE validation in TS_RESP_verify_response() function.
> CVE-2025-69421 - NULL Pointer Dereference in PKCS12_item_decrypt_d2i_ex() function.
> CVE-2026-22795 - Missing ASN1_TYPE validation in PKCS#12 parsing.
> CVE-2026-22796 - ASN1_TYPE Type Confusion in the PKCS7_digest_from_attributes() function.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index abcc6be8f8..ea288054e9 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openssl/openssl/releases/download/openssl-3.4.3/openssl-3.4.3.tar.gz.sha256
> -sha256  fa727ed1399a64e754030a033435003991aee36bda9a5b080995cb2ac5cf7f37  openssl-3.4.3.tar.gz
> +# From https://github.com/openssl/openssl/releases/download/openssl-3.4.4/openssl-3.4.4.tar.gz.sha256
> +sha256  7bdf55ac20f2779e99e5eca306f824fad2b37dee5a06cc35ed5a8b85a6060010  openssl-3.4.4.tar.gz
>  
>  # License files
>  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 24213871fe..8e3ae4cc21 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 3.4.3
> +LIBOPENSSL_VERSION = 3.4.4
>  LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = Apache-2.0
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
