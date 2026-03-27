Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDC910ED640
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6805E416C3;
	Fri, 27 Mar 2026 10:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Dv4sfNcaT3i; Fri, 27 Mar 2026 10:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DCDF416C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605744;
	bh=7sUeImn2114Tgtk6dxrFKlqtjGrWeaOnog//DFMgWZk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c1IqAJ5aY7q/tRWlVGPKg82DuUUbvTNgNdJwdxVh3EuNl34JOgG/2Lg+Zv5zkx905
	 yXOiF3V/VTWjq8rXil1gDPk1pqptrCjM4fvS7szAl6JESXDJupZdrGZMk1rVp1yEju
	 8bYms71ecLoZtdfz2RRm98CoGjIx4chOfudFSVPeiCF9uUIfI2D+Z66aInMqmzeIW2
	 OVoxIGPQ2prFr4w3UGvLg/AAwBKomDMKPEBaAwPZzO5aXMhs5gSWXgZrPvXw+yj00k
	 n2c9kTvjSEEugkWPqLapY6Ku2l9aDLw1lkQUXdtzOtdK1g25h3+c4WSL9bRo4Cg1b/
	 EbHlUJJA9I5NQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DCDF416C4;
	Fri, 27 Mar 2026 10:02:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CDB0E1D3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF794405EB
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3yIirh9QseD for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:02:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C64A340087
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C64A340087
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C64A340087
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:02:19 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48704db565eso27285965e9.1
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 03:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774605738; x=1775210538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4nk7VVZ66Wt0ovCj/gFdDODoFKnr3UUDIQhMqCLPZvc=;
 b=TwmVX52vDgcYwBrow6ZYadd1jpKDYcr1Gon4VXcn11724e0jkOsoaDIS307yJLnUyB
 y0PCYECuQKoGVgMiNsgjt/oQvV/VL4gaiDzInonuVhOTbjcJx24JCr49fBZS+s+cA6PM
 SFkOvmpUHAo6iOGFe0Fyv0ZgKfD5aQ6h8H84TwMCSCubhSKM1DTj7OQqiHiLGo6XGh0U
 ievAfdkF5s3sTLm7xey7umT5USTcYpORNgijU5Nt5GXUdT6EPuVAQmp1SNaex1JfLfHm
 O0WDHraup8yBhHuNSNbQoiWxh/rMOtrDlENvPlNvCHfu5Z7ZDAQHsUrJGA0RW0W/MB1R
 K7kw==
X-Gm-Message-State: AOJu0Yx8aqS0uzKo0tmjbFaVv2Zz5y4FQK/0aJRr3s+LQ04qWhoeuqMN
 c+SzScmFs1GlF/t8LaZyvlinLN9xsHLC2yG1EAAp972+yDaentysNvaRtNVX/SbOhg3j8JPw50z
 kKp7nE30=
X-Gm-Gg: ATEYQzxJoHUis/Uv6m6TA+ot6/f/7Umg/LubMy6/WSIO07YtOZxqp/1nlpMM3Xx6luF
 8HD3CiUBCrJ5NQMSaOuGn4KKSVq+xLhoTypvbfyifWRPaluiFKM34dAD8Q3ivj/tLOGz+bnVBJT
 OsEGQiNCAsM8tsnRg8VYRK7jS5bG5MCJcRdjeFpFXTl2JIiCAvODdvm/cPlqODJ38XerddPQK2M
 y4+pBuwRtcPrRUxi51wBbD1apxvtMWO93A1A/h4yJun3AJ8VBKSnzTAQ/uyL/e4bg0/LtJ/RBlx
 DeqBIfY4UB9zdxwXIXUdhf6e2jrqIkJ75aXhRwM6ZYkFvKKVfFMEoVYUg6HHtem/4byVv3mcsQA
 i/3RQsLJ7Ga2FUdIb+YmcIcOikHmT7axue8VW+hfA1f2MSu6pL0hikNCWq+6Hwkydq7l61uTwAl
 qcgv3lEIgs6nf8pzEJ
X-Received: by 2002:a05:6000:2085:b0:439:df60:f87a with SMTP id
 ffacd0b85a97d-43b9ea08957mr2710060f8f.46.1774605737433; 
 Fri, 27 Mar 2026 03:02:17 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2d3sm13845915f8f.19.2026.03.27.03.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 03:02:16 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 11:02:15 +0100
Message-ID: <20260327100215.45761-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316113716.208738-1-thomas.perale@mind.be>
References: <20260316113716.208738-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774605738; x=1775210538; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4nk7VVZ66Wt0ovCj/gFdDODoFKnr3UUDIQhMqCLPZvc=;
 b=fbSedGR08qjaYBMNzpTx6t1qDalaJ1NGHWpjJKl+yAwxb0pj5lAZ0IHJQwyYldv5KC
 KrfZg5m+VNvJyorwozNFMtrYTBTWyHyi04eIPPQLRSTYC3Hc6wcTn/epR/POBJLiot1Q
 fFX3ZZW37CL39IUHWWUeB7/3dDYba4C5FAt5Qfl1YWBZEXrJ3aasTEIWze1ym/G93Ogk
 RlVGx/7AwhjhIUIJJxpkssame4cmzwyu72oehQLNJfT9MpKZkyMcahNOTP4S+dQE/CE/
 vW0dcPfdXr36GJV0X2qMXX1q8ES3wecxs4jj0SRzZJlSIcsPw17WD1eto0Oq+oQCqbG4
 1Xdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fbSedGR0
Subject: Re: [Buildroot] [2025.02.x,
 PATCH 1/3] package/mongoose: patch CVE-2025-65502
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
> - CVE-2025-65502:
>     Null pointer dereference in add_ca_certs() in Cesanta Mongoose before
>     7.2 allows remote attackers to cause a denial of service via TLS
>     initialization where SSL_CTX_get_cert_store() returns NULL.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-65502
>   - https://github.com/cesanta/mongoose/commit/64abf061bf018fd78f31c200a57a3fb04f9f3ef2
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  .../mongoose/0001-improve-resiliency.patch    | 37 +++++++++++++++++++
>  package/mongoose/mongoose.mk                  |  3 ++
>  2 files changed, 40 insertions(+)
>  create mode 100644 package/mongoose/0001-improve-resiliency.patch
> 
> diff --git a/package/mongoose/0001-improve-resiliency.patch b/package/mongoose/0001-improve-resiliency.patch
> new file mode 100644
> index 0000000000..edeea4efba
> --- /dev/null
> +++ b/package/mongoose/0001-improve-resiliency.patch
> @@ -0,0 +1,37 @@
> +From 64abf061bf018fd78f31c200a57a3fb04f9f3ef2 Mon Sep 17 00:00:00 2001
> +From: "Sergio R. Caprile" <scaprile@cesanta.com>
> +Date: Mon, 13 Oct 2025 10:43:45 -0300
> +Subject: [PATCH] improve resiliency
> +
> +CVE: CVE-2025-65502
> +Upstream: https://github.com/cesanta/mongoose/commit/64abf061bf018fd78f31c200a57a3fb04f9f3ef2
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + mongoose.c        | 1 +
> + src/tls_openssl.c | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/mongoose.c b/mongoose.c
> +index 4c72be8201..f860ab3b07 100644
> +--- a/mongoose.c
> ++++ b/mongoose.c
> +@@ -14581,6 +14581,7 @@ static STACK_OF(X509_INFO) * load_ca_certs(struct mg_str ca) {
> + static bool add_ca_certs(SSL_CTX *ctx, STACK_OF(X509_INFO) * certs) {
> +   int i;
> +   X509_STORE *cert_store = SSL_CTX_get_cert_store(ctx);
> ++  if (cert_store == NULL) return false;
> +   for (i = 0; i < sk_X509_INFO_num(certs); i++) {
> +     X509_INFO *cert_info = sk_X509_INFO_value(certs, i);
> +     if (cert_info->x509 && !X509_STORE_add_cert(cert_store, cert_info->x509))
> +diff --git a/src/tls_openssl.c b/src/tls_openssl.c
> +index 37838d95ba..f51d6dd8b7 100644
> +--- a/src/tls_openssl.c
> ++++ b/src/tls_openssl.c
> +@@ -39,6 +39,7 @@ static STACK_OF(X509_INFO) * load_ca_certs(struct mg_str ca) {
> + static bool add_ca_certs(SSL_CTX *ctx, STACK_OF(X509_INFO) * certs) {
> +   int i;
> +   X509_STORE *cert_store = SSL_CTX_get_cert_store(ctx);
> ++  if (cert_store == NULL) return false;
> +   for (i = 0; i < sk_X509_INFO_num(certs); i++) {
> +     X509_INFO *cert_info = sk_X509_INFO_value(certs, i);
> +     if (cert_info->x509 && !X509_STORE_add_cert(cert_store, cert_info->x509))
> diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
> index 8316a8d59a..02c2ac5626 100644
> --- a/package/mongoose/mongoose.mk
> +++ b/package/mongoose/mongoose.mk
> @@ -13,6 +13,9 @@ MONGOOSE_INSTALL_STAGING = YES
>  # static library
>  MONGOOSE_INSTALL_TARGET = NO
>  
> +# 0001-improve-resiliency.patch
> +MONGOOSE_IGNORE_CVES += CVE-2025-65502
> +
>  MONGOOSE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
