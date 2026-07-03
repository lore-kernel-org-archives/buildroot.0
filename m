Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA44CC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5A9D82882;
	Fri,  3 Jul 2026 14:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKVizMR9ZjlY; Fri,  3 Jul 2026 14:32:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C49B782884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089156;
	bh=mSVsHpgVsbG9W5alSzHe1UrIk8IVLD/52vQ7nJYGIiM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p7+WWpNDZjubbG+rXjZoZzc1nBMGQEJqvvnTK6fBC/q9icjlQomPBiOIsNerVVVPa
	 POu3LmiHDK7p5WpnCKqE5YjIB895z3idunqHwsLLITKtt1PCjQT0cpIMzMdyl1P7sD
	 57gSTuXbXKZQ+j6Fe80BvSvxqIKwDJTxEUudZBDGXHm8Me3slqBdHBPDBaPHKXj+Qb
	 EgC/9zndaIhQxe95CB+ESJLqOyLZ+4E7y4m8rMZqoZSusqDAcHJYFD24i8eXyqjrLZ
	 3HROmoY4taZQNCMPbqTnlDzPIFTPCT4qUaIeQKgPvSULn9zX0v268HOWM+miiqzEBf
	 DbUGFaNCtjALw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C49B782884;
	Fri,  3 Jul 2026 14:32:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33A2114F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 259CB60F2C
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dyQCCYZgNUKm for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:32:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1A81760FBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A81760FBD
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A81760FBD
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:32:33 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-472055b0efaso475318f8f.2
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089152; x=1783693952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NbrBAyDEWIHk1rmwFA4/+MkMPMg9Em2XZvvlpNr0ZTo=;
 b=q+Cr+3U4IOyMR2Lz1lj3OCb4anIyLK2idsqhRgWdKH1BjwBQ8qzT+U/kYS9tZ3yiab
 Cxmf99x7TqkyrxHQGUPB48kwYOAJa1+yro2pnSj9YRAjTmky3Whkecu7unjCnZai6apW
 rzYxrZTtws3HZsdtAoh8r+Kn4fmTnIsnS7cr6e7njIzqQbyxYFnve9syYVmeUN0HFkJ1
 18c6k8VUJjvfSgNqhXwAsUSqcpugZyiKQa1+MOdKdwdIOnBN4FWo2LT2RA++Vk4EYEv6
 qMBLS+D+ouMmLS6ZgiWjNMAwUk9BxbHfg2w1ymHuMfg4NKywY+EA40hv/1MWlmyp2HKV
 7VdA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpvBEp58UCWLZPgq7ajhpZVbRS+e5rkCyzet7sZ7TZiZoEqAnIP3p3AEf32WFTxTTA0HUCGfkb2CdY=@buildroot.org
X-Gm-Message-State: AOJu0YzkWhlyAq+hZuwS17KaoyLBeOPKfp3r2o6qE4YXquQhXmFDUFPJ
 lmN0XgQdKDfg1pGGRlqnfB1ljGzm6BxubqQM1lNtpofUbHswHtwYeLyq45ldHWPw4Dg=
X-Gm-Gg: AfdE7cln8VjvZfQrJvi5t4NTHUiPSQmUXL96keYXpy7+1ylmiJ8sYwqSyIhuM/megvP
 kWlRTMp9zinTIGbbCRwMgSiUKHpAwSG/d2QfVBzvez8LfYfBh8pEjZu3drHB9y0uyIkboCPXvPs
 5serxTM7XRKMdINd3+Z/97gZPitnAswHNf/xdcJPXeC4ESRj3eyVMmgvpK42MWE101UdrqGtk++
 jaPoSh6fE8LMX1FYk8Cf9ukB6UY/IhAmpNOoVe78Ivt7n0fi+tqNiTI5bU8C2oPqBYQYJZb/K7f
 aeDU4MDMkc4l3DJ/Pu/hmwLBDcBvHQ1lnjoEF9EUCDHyy2SEYEJXstnZuzjhwk/JbmrDfe20gi+
 ieZ/ubdvin8+cDAR64sJd9LcZmWijmj8lOvU1BSVoDO7riwwbydrhBA1UGOK4K9yAl5LPC5vb6Q
 NoUwGvT1bQM29kdck=
X-Received: by 2002:adf:e009:0:20b0:474:6301:3e25 with SMTP id
 ffacd0b85a97d-4775918fa79mr11864587f8f.28.1783089151878; 
 Fri, 03 Jul 2026 07:32:31 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477dde19e8dsm20181637f8f.27.2026.07.03.07.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:32:30 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:32:29 +0200
Message-ID: <20260703143229.274822-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260629102220.2654363-1-titouan.christophe@mind.be>
References: <20260629102220.2654363-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089152; x=1783693952; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NbrBAyDEWIHk1rmwFA4/+MkMPMg9Em2XZvvlpNr0ZTo=;
 b=Cmf/LQDwYWMPB3Kfqowx0QiWQXoYePXszKukD1SdApgU/KH0n2dfv9FPt0HjZMzXFv
 qBHj4B0cLMUGFfhQLopsHud3JBT4XyCRN0X7pLdVopyokZOktSZmFljY8TFSMQWNUlm2
 NPbb0ERt2eDavCLHwfbtbZffm+FiH7Imd/lYu8kebQSqeq29rQ9KGyRym6PZn5YAAVva
 c/YIEHbiP5aFTQVOfLik2G8/rg4tF9H8q3J92NcgUERp7s21rXfr3fbeVdr72G5z3n4m
 q06wehSIXdXR3aSmTcefYB9uBzMqEorJhs9GEHTg9u9dlx66JCSeQRArT82gv5eSjcXk
 xEwQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Cmf/LQDw
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/mongoose: security
 bump to v7.22
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
> As indicated in the release notes:
> https://github.com/cesanta/mongoose/releases/tag/7.22
> 
>     This release includes a substantial number of security fixes,
>     reflecting increased use of AI-powered security tools and valuable
>     contributions from the security research community.
> 
>     Please note that many of the resolved issues have not yet been assigned
>     CVE identifiers. The assignment process is underway, and these release
>     notes will be updated as additional CVEs become available.
> 
> Given the large number of security fixes included in that release, bump the
> version for Buildroot LTS instead of applying individual patches
> 
> Along with the version bump:
> - Remove patch for a security issue fixed by the version bump
> - Update license hash following the update of the copyright year in
>   https://github.com/cesanta/mongoose/commit/1f9e1a38b55455ed63a616aeb7b1070f2a2d4ddd
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  .../mongoose/0001-improve-resiliency.patch    | 37 -------------------
>  package/mongoose/mongoose.hash                |  4 +-
>  package/mongoose/mongoose.mk                  |  5 +--
>  3 files changed, 3 insertions(+), 43 deletions(-)
>  delete mode 100644 package/mongoose/0001-improve-resiliency.patch
> 
> diff --git a/package/mongoose/0001-improve-resiliency.patch b/package/mongoose/0001-improve-resiliency.patch
> deleted file mode 100644
> index edeea4efba..0000000000
> --- a/package/mongoose/0001-improve-resiliency.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 64abf061bf018fd78f31c200a57a3fb04f9f3ef2 Mon Sep 17 00:00:00 2001
> -From: "Sergio R. Caprile" <scaprile@cesanta.com>
> -Date: Mon, 13 Oct 2025 10:43:45 -0300
> -Subject: [PATCH] improve resiliency
> -
> -CVE: CVE-2025-65502
> -Upstream: https://github.com/cesanta/mongoose/commit/64abf061bf018fd78f31c200a57a3fb04f9f3ef2
> -Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ----
> - mongoose.c        | 1 +
> - src/tls_openssl.c | 1 +
> - 2 files changed, 2 insertions(+)
> -
> -diff --git a/mongoose.c b/mongoose.c
> -index 4c72be8201..f860ab3b07 100644
> ---- a/mongoose.c
> -+++ b/mongoose.c
> -@@ -14581,6 +14581,7 @@ static STACK_OF(X509_INFO) * load_ca_certs(struct mg_str ca) {
> - static bool add_ca_certs(SSL_CTX *ctx, STACK_OF(X509_INFO) * certs) {
> -   int i;
> -   X509_STORE *cert_store = SSL_CTX_get_cert_store(ctx);
> -+  if (cert_store == NULL) return false;
> -   for (i = 0; i < sk_X509_INFO_num(certs); i++) {
> -     X509_INFO *cert_info = sk_X509_INFO_value(certs, i);
> -     if (cert_info->x509 && !X509_STORE_add_cert(cert_store, cert_info->x509))
> -diff --git a/src/tls_openssl.c b/src/tls_openssl.c
> -index 37838d95ba..f51d6dd8b7 100644
> ---- a/src/tls_openssl.c
> -+++ b/src/tls_openssl.c
> -@@ -39,6 +39,7 @@ static STACK_OF(X509_INFO) * load_ca_certs(struct mg_str ca) {
> - static bool add_ca_certs(SSL_CTX *ctx, STACK_OF(X509_INFO) * certs) {
> -   int i;
> -   X509_STORE *cert_store = SSL_CTX_get_cert_store(ctx);
> -+  if (cert_store == NULL) return false;
> -   for (i = 0; i < sk_X509_INFO_num(certs); i++) {
> -     X509_INFO *cert_info = sk_X509_INFO_value(certs, i);
> -     if (cert_info->x509 && !X509_STORE_add_cert(cert_store, cert_info->x509))
> diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
> index 18b5e222ac..1a60b0c89c 100644
> --- a/package/mongoose/mongoose.hash
> +++ b/package/mongoose/mongoose.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  b6a6f69912c2cd0c67f85633c6b578d4dcdf385c3628acdcd21de28787c676e5  mongoose-7.17.tar.gz
> -sha256  9abc2509d90c01ff2a0c91abf73582cdbcf1d2dbcc0b7973097eced43cf4cdd4  LICENSE
> +sha256  87727cd2c240ff559b16e9710d44b61ba3513dbee50428bd8ee1596d7c58460a  mongoose-7.22.tar.gz
> +sha256  f0d9cfd6f7d92f6ec061a5fb2882f67d2521a151bf09a637c33ca6181834b048  LICENSE
> diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
> index 9b8920a9f3..207d31cdfa 100644
> --- a/package/mongoose/mongoose.mk
> +++ b/package/mongoose/mongoose.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MONGOOSE_VERSION = 7.17
> +MONGOOSE_VERSION = 7.22
>  MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
>  MONGOOSE_LICENSE = GPL-2.0
>  MONGOOSE_LICENSE_FILES = LICENSE
> @@ -13,9 +13,6 @@ MONGOOSE_INSTALL_STAGING = YES
>  # static library
>  MONGOOSE_INSTALL_TARGET = NO
>  
> -# 0001-improve-resiliency.patch
> -MONGOOSE_IGNORE_CVES += CVE-2025-65502
> -
>  MONGOOSE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
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
