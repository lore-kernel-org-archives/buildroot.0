Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C475C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E74D83CA8;
	Fri, 11 Jul 2025 10:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aewOj24vhmkj; Fri, 11 Jul 2025 10:45:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD49683D5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD49683D5E;
	Fri, 11 Jul 2025 10:45:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 334F91E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DF8F83032
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQsmzL0SPEGL for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:45:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4F838217E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4F838217E
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4F838217E
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:45:20 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a51481a598so1117973f8f.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230719; x=1752835519;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AGWAOiQzPYWB97QKRxCukiFCCpGSJLeTWMGkkDScOWA=;
 b=wbu+ZCT+n1xV9DyFFxyi+7+E/bHqcV5KEgX+mjFgShHl4DsMCZYYKrJU5tQZUBnhYi
 CH6xIa9mM+XcIebna+4lSp+7k4s9E7CV4VgLBl8Koc63W/kSJQXRwR14EVoBG4PyL+FE
 kNFB6Pr8tOOoVedFaodM6FsetbHt+dSEFBI1rmsS36Baarog2cZHjhCBbuzkeHCjLT+6
 9FDZKcCP2d8SLrXaVbeh1YfgrI+e+C4nZa8Avq3u297//09sVO3+lJ9ufTVGiHA0nuG0
 va6Fvmd6nQfv1Gqq8Fr+K4yjNcmvJojx1u4c5ft762IDAXCPv1ABXIz8fQWsxX8ScQRw
 E5Qw==
X-Gm-Message-State: AOJu0Yz3vvWL95NtYA3i31+OJDwx9jCLyqk5fNuqG2VzgZYQZw9wN4Ps
 oj/YAuc8uCBT5UwPjBzxgJkCCZpyaI24c7xHwnUvy8BYw5F3Y90h7uDsu0nSoxft5uTgKlHiNq4
 yfviN
X-Gm-Gg: ASbGncu2swKVwayfDPfo0nKrr3p89HvDdHykTVjsOgiMjsSR1bf4rYj16Yo4S5on3+d
 ZFfCNrMI5kq7BmoJi6Q+j6zUWnNVGDwAP1WsbfrVQ8hDLxdemWU0UN+2J4HR18lOAqRS8vB+p2R
 32T3sCVZj4NV0SfAot2l9d0iA0KLZNmO8HL6KP1qa21uM9a7Uu33XxM+GVQjtiBk8Etye2vde2S
 kAbbWcmRFl1aKdVsGkC31Qmuj+fNCM+2Zgz7AwQWUCe4zxhRhK/fHorXdpP/xNSxKLI2I494E4e
 Qtsl54nAJrmvF6TkPNGXrLn2igWooXRCm4aRiJOGlY8LlF/ddETPOW4fDpCpHYi7eoMj13yCMBM
 S33oZqfC4ITMuRg==
X-Google-Smtp-Source: AGHT+IExarbjmMwBuEmj1q4JPI5RG2MInzbrNV7aMUNQ0Y+vCEtKu3YHRkqZcaGWj2YhxGxpVOinWQ==
X-Received: by 2002:a5d:64cf:0:b0:3a4:ed1e:405b with SMTP id
 ffacd0b85a97d-3b5f2e270cdmr1933891f8f.46.1752230718770; 
 Fri, 11 Jul 2025 03:45:18 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d5032fcbsm83226045e9.6.2025.07.11.03.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:45:18 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:45:17 +0200
Message-ID: <20250711104517.825007-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250706180909.1114945-1-thomas.perale@mind.be>
References: <20250706180909.1114945-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230719; x=1752835519; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AGWAOiQzPYWB97QKRxCukiFCCpGSJLeTWMGkkDScOWA=;
 b=bqVMbdTGyxto8k7YyBRYw+WIlYFOELAP/ck3nlbQ0dmcVc476QsO4vTxsCQlACZDBX
 CmNhft6q1Pm0AwGEnPkf4UZsBnuqyL5yj8A9svPJwafv5uu3MME5euJeXiZPMOG4Dpz2
 uEyMM6tj3PDWddW4oC+GEgL1yrnwCcoWmH0vhWoxxMIAf4VyWBblGU6zi3GLiD63iWBC
 9fwsw/6kcL9qx8wdm+fkn2UawdG2XJWlRC5xdp90P4/QOuIiMQu2JQfMD2nJ40EnRv81
 LYu/SEyc4i8z71ml9PynPdIcpzIpq/RS5r8ZWyUJw23/B3kgdagyqSVmPECqVV32Vqlz
 RGGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bqVMbdTG
Subject: Re: [Buildroot] [PATCH 1/2] package/libuhttpd: fix build w/ mbedtls
 v3.6
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
> Since the mbedtls bump to v3.6 [1] the libuhttpd fails to build with the
> following error:
> 
> ```
> [  8%] Building C object src/ssl/CMakeFiles/xssl.dir/mbedtls.c.o
> .../buildroot/output/build/libuhttpd-3.14.1/src/ssl/mbedtls.c:52:10: fatal error: mbedtls/certs.h: No such file or directory
>    52 | #include <mbedtls/certs.h>
>       |          ^~~~~~~~~~~~~~~~~
> compilation terminated.
> ```
> 
> This error can be reproduced with the following config:
> 
> ```
> cat <<EOF >.config
> BR2_arm=y
> BR2_cortex_a7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PACKAGE_MBEDTLS=y
> BR2_PACKAGE_LIBUHTTPD=y
> EOF
> make olddefconfig
> make
> ```
> 
> The compatibility with mbedtls v3 has been addressed upstream in the
> zhaojh329/ssl project included as a submodule of libuhttpd [2].
> 
> This patch backport this upstream commit to be applied on the submodule
> directory. This required adaptation of the line numbers (see [3]) and
> renaming a function reference passed as parameter of
> 'mbedtls_pk_parse_keyfile' caused by the commit [4].
> 
> [1] 3481a9643f package/mbedtls: bump to version 3.6.3.1
> [2] https://github.com/zhaojh329/ssl/commit/28cc9b5d98179d161673d20e79333ae5a4864228
> [3] https://github.com/zhaojh329/ssl/commit/8092b5a490eedeb042cc1036ebeab6442624cf4c#diff-fbc46fa2db83f8649ccf1f46c6a044473b7b228edc7d4c0f7cc04b5a879f6fb7
> [4] https://github.com/zhaojh329/ssl/commit/0e7d2f73d769cc4ddb350381cebb5ef6f27ab653#diff-fbc46fa2db83f8649ccf1f46c6a044473b7b228edc7d4c0f7cc04b5a879f6fb7R92
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...dd-compatibility-with-mbed-tls-3-0-0.patch | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 package/libuhttpd/0004-add-compatibility-with-mbed-tls-3-0-0.patch
> 
> diff --git a/package/libuhttpd/0004-add-compatibility-with-mbed-tls-3-0-0.patch b/package/libuhttpd/0004-add-compatibility-with-mbed-tls-3-0-0.patch
> new file mode 100644
> index 0000000000..1f45d4634c
> --- /dev/null
> +++ b/package/libuhttpd/0004-add-compatibility-with-mbed-tls-3-0-0.patch
> @@ -0,0 +1,64 @@
> +From 28cc9b5d98179d161673d20e79333ae5a4864228 Mon Sep 17 00:00:00 2001
> +From: Jianhui Zhao <zhaojh329@gmail.com>
> +Date: Sat, 4 May 2024 19:40:07 +0800
> +Subject: [PATCH] Add compatibility with Mbed TLS 3.0.0
> +
> +Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> +Upstream: https://github.com/zhaojh329/ssl/commit/28cc9b5d98179d161673d20e79333ae5a4864228
> +[thomas: 
> +  - Apply to submodule directory
> +  - Rename 'urandom' to '_urandom'
> +  - Adapt line numbers
> +]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/ssl/mbedtls.c | 11 +++++++++--
> + 1 file changed, 9 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/ssl/mbedtls.c b/src/ssl/mbedtls.c
> +index 2e02e1c..cad7e00 100644
> +--- a/src/ssl/mbedtls.c
> ++++ b/src/ssl/mbedtls.c
> +@@ -49,7 +49,6 @@
> + #include "ssl.h"
> + 
> + #include <mbedtls/ssl.h>
> +-#include <mbedtls/certs.h>
> + #include <mbedtls/x509.h>
> + #include <mbedtls/rsa.h>
> + #include <mbedtls/error.h>
> +@@ -136,9 +135,13 @@ static const int default_ciphersuites_client[] =
> +     AES_CBC_CIPHERS(ECDHE_ECDSA),
> +     AES_CBC_CIPHERS(ECDHE_RSA),
> +     AES_CBC_CIPHERS(DHE_RSA),
> ++#ifdef MBEDTLS_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA
> +     MBEDTLS_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA,
> ++#endif
> +     AES_CIPHERS(RSA),
> ++#ifdef MBEDTLS_TLS_RSA_WITH_3DES_EDE_CBC_SHA
> +     MBEDTLS_TLS_RSA_WITH_3DES_EDE_CBC_SHA,
> ++#endif
> +     0
> + };
> + 
> +@@ -221,7 +224,7 @@ static void ssl_update_own_cert(struct ssl_context *ctx)
> +     if (!ctx->cert.version)
> +         return;
> + 
> +-    if (!ctx->key.pk_info)
> ++    if (mbedtls_pk_get_type(&ctx->key) == MBEDTLS_PK_NONE)
> +         return;
> + 
> +     mbedtls_ssl_conf_own_cert(&ctx->conf, &ctx->cert, &ctx->key);
> +@@ -258,7 +261,11 @@ int ssl_load_key_file(struct ssl_context *ctx, const char *file)
> + {
> +     int ret;
> + 
> ++#if (MBEDTLS_VERSION_NUMBER >= 0x03000000)
> ++    ret = mbedtls_pk_parse_keyfile(&ctx->key, file, NULL, _urandom, NULL);
> ++#else
> +     ret = mbedtls_pk_parse_keyfile(&ctx->key, file, NULL);
> ++#endif
> +     if (ret)
> +         return -1;
> + 
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
