Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97166CCF2D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6353980B3D;
	Mon, 19 Jan 2026 10:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QuuR-ZfChRT7; Mon, 19 Jan 2026 10:09:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FA2880C6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768817387;
	bh=yY1Uc/4IyFBqOJdf7ogX5G9nNbd2X9L/9cZplqjNrZw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=X2IOF8Oh9lKcVa6QRPKmlhhfPkcK/eE5T9+L/PZRZLScgspKR1QTJH1/nsJTMOKt3
	 SWD7bwitYJQakY3EUyDEQdJRXKQil1+mIvYzU8rLRKKx/1NeXHMoA/AmgEXFAp1HsF
	 uJs6ujVnG1Of6ocsBol9li2h4YwZ2fmqWw+wJSUw1NTIERMxsMvKSP6YEoyKcMhQrH
	 FH7TUSrSMgNn2mzHk/nM+hMLAObtLtSHDqMegvIY7NIGPXmbOMeba/uvJD+kDQVuVt
	 c8XwsKwnMCKwxOYsZ8wUm1ZACjtVb/32H2eSV2Af7n8n6q/K4dsPRO+6oUZnogiG+d
	 2Ld9syamiYwlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FA2880C6C;
	Mon, 19 Jan 2026 10:09:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 730192CE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56E2F806EF
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ALyVeKvXIOEH for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:09:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0FDD180626
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FDD180626
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FDD180626
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:09:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 161FEB97A961; Mon, 19 Jan 2026 11:09:36 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Mon, 19 Jan 2026 11:09:35 +0100
Message-ID: <20260119100935.13286-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111100551.34348-1-thomas.perale@mind.be>
References: <20260111100551.34348-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768817376; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Cd6EAaUwlcMTrQv/ecs/MfGqKZnF601ALO5FIMnHyn0=;
 b=XqQssaCZiWhgNn/1LRUGSX+YcQEtcJolHZG2BqUolP0/Xw+h90D6quIurE5y3pOvAawZlt
 MALpfkI1RxDJK3SYSRfZq/v3UggSngPFipwlSdDHynucpqOm71+XgZGqs/MsUweuzJt9i5
 HhsOrX7l+l9/xqr6KGdAKlcLdeDNhZwxoo4J9cbXL7ij3czAu/tZ2QxHWRYtaEQH+fD/So
 ncOpCZcAGMPdKrPrGMibtYnjWZvyj2d9yF90TwOOVyxuzOI7YrXF45nJROF57IhPG35q+o
 1nKCGqeK4TQMxWjSqnczFVYkMcWFNd1ipsPUkjimyzH8HGSCwEQthiNVO1vyBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=XqQssaCZ
Subject: Re: [Buildroot] [PATCH 1/1] package/libcoap: security bump to
 v4.3.5a
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> For more info on the release, see:
> 
> - https://github.com/obgm/libcoap/compare/v4.3.5...v4.3.5a
> - https://github.com/obgm/libcoap/blob/release-4.3.5-patches/ChangeLog
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2025-59391:
>     A memory disclosure vulnerability exists in libcoap's OSCORE
>     configuration parser in libcoap before release-4.3.5-patches. An out-
>     of-bounds read may occur when parsing certain configuration values,
>     allowing an attacker to infer or read memory beyond string boundaries
>     in the .rodata section. This could potentially lead to information
>     disclosure or denial of service.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-59391
> 
> - CVE-2025-65493:
>     NULL pointer dereference in src/coap_openssl.c in OISM libcoap 4.3.5
>     allows remote attackers to cause a denial of service via a crafted
>     DTLS/TLS connection that triggers BIO_get_data() to return NULL.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-65493
> 
> - CVE-2025-65494:
>     NULL pointer dereference in get_san_or_cn_from_cert() in
>     src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
>     cause a denial of service via a crafted X.509 certificate that causes
>     sk_GENERAL_NAME_value() to return NULL.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-65494
> 
> - CVE-2025-65495:
>     Integer signedness error in tls_verify_call_back() in
>     src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
>     cause a denial of service via a crafted TLS certificate that causes
>     i2d_X509() to return -1 and be misused as a malloc() size parameter.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-65495
> 
> - CVE-2025-65496:
>     NULL pointer dereference in coap_dtls_generate_cookie() in
>     src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
>     cause a denial of service via a crafted DTLS handshake that triggers
>     SSL_get_SSL_CTX() to return NULL.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-65496
> 
> - CVE-2025-65497:
>     NULL pointer dereference in coap_dtls_generate_cookie() in
>     src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
>     cause a denial of service via a crafted DTLS handshake that triggers
>     SSL_get_SSL_CTX() to return NULL.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-65497
> 
> - CVE-2025-65498:
>     NULL pointer dereference in coap_dtls_generate_cookie() in
>     src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
>     cause a denial of service via a crafted DTLS handshake that triggers
>     SSL_get_SSL_CTX() to return NULL.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-65498
> 
> - CVE-2025-65499:
>     Array index error in tls_verify_call_back() in src/coap_openssl.c in
>     OISM libcoap 4.3.5 allows remote attackers to cause a denial of
>     service via a crafted DTLS handshake that triggers
>     SSL_get_ex_data_X509_STORE_CTX_idx() to return -1.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-65499
> 
> - CVE-2025-65500:
>     NULL pointer dereference in coap_dtls_generate_cookie() in
>     src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
>     cause a denial of service via a crafted DTLS handshake that triggers
>     SSL_get_SSL_CTX() to return NULL.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-65500
> 
> - CVE-2025-65501:
>     Null pointer dereference in coap_dtls_info_callback() in OISM libcoap
>     4.3.5 allows remote attackers to cause a denial of service via a DTLS
>     handshake where SSL_get_app_data() returns NULL.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-65501
> 
> LICENSE Year updated see [1].
> 
> [1] https://github.com/obgm/libcoap/commit/c9135b6b26b978295a3e1312ff59cb7cb9b32251
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/libcoap/libcoap.hash | 4 ++--
>  package/libcoap/libcoap.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
> index fc618fef52..17fce990fa 100644
> --- a/package/libcoap/libcoap.hash
> +++ b/package/libcoap/libcoap.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  a417ed26ec6c95c041b42353b5b6fad1602e2bf42a6e26c09863450e227b7b5f  libcoap-4.3.5.tar.gz
> +sha256  bca78a2076ebb02179f93ab6cf2363b1256d878b540f810c238ea231ad5948ab  libcoap-4.3.5a.tar.gz
>  sha256  09dd86a017bad210527085008cbf706609c58210897b69845af14099577e7eb7  COPYING
> -sha256  ecff7aa3af994b008dbb57c180753bd2a6c53fa6f8265a2486740f4cfd45280c  LICENSE
> +sha256  1ba383ac337111d18334b2e230d02831b60913d137c3b653585d8e8675824111  LICENSE
> diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
> index d7c2a78944..bb1321f194 100644
> --- a/package/libcoap/libcoap.mk
> +++ b/package/libcoap/libcoap.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCOAP_VERSION = 4.3.5
> +LIBCOAP_VERSION = 4.3.5a
>  LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
>  LIBCOAP_INSTALL_STAGING = YES
>  LIBCOAP_LICENSE = BSD-2-Clause
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
