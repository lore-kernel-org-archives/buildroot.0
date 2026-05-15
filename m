Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6A6CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC425840D4;
	Fri, 15 May 2026 13:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9a-EUInt0YVt; Fri, 15 May 2026 13:33:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED3CC83DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852004;
	bh=I/VIQ68RHZ7flZtPoclotLXvVQFhwJlbatX4v4/yVic=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o01A2rI9Fh4juPki+azwE/DbviSRTzQ2e9uiX6vhOU3r1/C0YuXOHKbynOBRoT1Zy
	 t+osxyQ0dfTtZtbmOPl2gEg+M3jXU3dB6AYG9dzgqItodlCfkQD2uqImuyfupGukc8
	 FqlaThZZe03TeoBFtOfYPV429hl6NMo70KIRGe57c2GOrCt5ISi6ysvHoy+MLSK3Ri
	 hjymgmd7KiBbc5ud6PXOBINv3oJV1tuXjxUc7V9B4imj72Ex7T48TgsNnmIZzvDfjn
	 2RfXUQyebg592I5wGlA/ysxiGa5G6d1+2i0o6nJe4CKiw+Ph/qtPPPx+PEXoqXLUo3
	 j0Dt8HQhAO0CQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED3CC83DEB;
	Fri, 15 May 2026 13:33:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BBEC36F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11D6683E0A
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zON9WrFTFp77 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:33:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D263D83F1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D263D83F1B
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D263D83F1B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:33:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso62006585e9.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778851999; x=1779456799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kvwAe7UeJV6aAyRqfOqsfLMo9kdt6n3kkeGXOJX2r0c=;
 b=iZgiwBBFYduYvmycuitMdXd6jVaai3eyHnol/Qt+XpWh2NQYbp9wUlVQeybwbVUOfS
 SVB2UFuyTKTM6pw068/XEj+N9mXXmCxI2qUGDwebE+D3K3nyAtqnoHbTmTkBPy+RylB5
 dp2599U96DDnHhL44WaE/04LdM4S5vzKv1zKodLQpiXvj2SDj8vC0DZNWSLwjo0VXu3z
 Dt+Ayalcr2XsTFPF8fRxJbewfjQ97RYELP0IPrDLfT9uhgZsCd6tWG5qQO+5kZJd4N5i
 2fqq5tReKjO0Z1YquKiobKZ9c4pI75DAY6TIbIL48DYA8+CD+eITaMQG22wGv3+nnSXM
 F6RA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8uIyrivvoDdJDjc5uwabSfCxcxwxm/SH7eoL4/ymatvqMHszgsCM2P1QBg64OhTQENh67iIVObHyA=@buildroot.org
X-Gm-Message-State: AOJu0YwdQmyLhx2eLArqcrTkprmVdRP8f5R+8tsOWN53DQnwNqewsWzI
 2YRQUMv07R3osb2bcyqMHw87WP3sWVHpnvjA49q6hq6QDxyaGYp0GQKBszn+G3mZnHxduJT+7Ll
 VNLyB
X-Gm-Gg: Acq92OGboATNkXp6VyWDWKW5gOclcDId8dts6PzJtBprrT+q7FlAgqV1v7bRsxwXqS8
 F4cGPGaashtXmyB02EoQiW8JVpDLSGiVknnUbADgLxUEV0NLb3tX7rs55SCha1W8lnCWJzMviqI
 7IOejPA/Rp15efCTLPzmECd8bO1Yt4MdqGOaGpWOASIYPuZhdJZFTGQo1sXdaGyl/P42s2VCCWr
 k5Tl7CDixamunth1VGiudsne7TYXOS09FCGkg5z8K2cai2kJZKIk2YR079GpltTWO8wZScB14hr
 T1+YXnrA45P+lX3fnsqnoCOuAgx3Cwwnc64llzx/PfXlUqci6wnlgLgkok1iJ2cA79E3f2PHAPb
 PQh+hZPXKYVqSc1yNEPtOKWboqyly9TfNYALvynVXhWA5whI9iOFwQ7pYVlDtGdTcTRparf/e73
 2b+lQm9fGK2oeLP6h8DYaA+t+GUpxV1vBMF5E+gfoVw4ow
X-Received: by 2002:a05:600d:8:b0:48a:5565:ec3d with SMTP id
 5b1f17b1804b1-48fe61f7a92mr56720085e9.22.1778851998624; 
 Fri, 15 May 2026 06:33:18 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a19a0csm14831370f8f.20.2026.05.15.06.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:33:18 -0700 (PDT)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:33:17 +0200
Message-ID: <20260515133317.314898-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <aWpqtkIY1vt9B4w5@waldemar-brodkorb.de>
References: <aWpqtkIY1vt9B4w5@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778851999; x=1779456799; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kvwAe7UeJV6aAyRqfOqsfLMo9kdt6n3kkeGXOJX2r0c=;
 b=djMriYjMvjJPVYvsPARR0cXhlSxNBApIJoGpCcVL5iatWiYKIfKqYp6EOKOpZbFf2l
 Vkvz7MD26CF1NAD0KQV1/RrKm2TXvV2P76y/X6DD3xGEUmXZFGWEE/z3sIpz4pAA8Hjs
 +yR1L6AWsOiOw1zd6hRRbCxaaOFGepFwJCpKSQuTfi8+wd6D4G6XIU/TwqyTa3qKZnmY
 5ICBTsFmL6u8zx3K06GUeXhymKEHcqldX2Lr7Yf9ivSK+mvjRv+KrSrvqRi4WI3UXjyb
 UOCTUN8J3M1YjKgqa928W3chE3+/1A0EI6l5EACRCBXnhr5zuENqP7NddfobLOHH7kQY
 5FLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=djMriYjM
Subject: Re: [Buildroot] [PATCH v2] package/nginx: security bump to 1.28.1
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
> See here for changes:
> https://nginx.org/en/CHANGES-1.28
> 
> Following security related issues are fixed:
>     *) Security: processing of a specially crafted login/password when using
>        the "none" authentication method in the ngx_mail_smtp_module might
>        cause worker process memory disclosure to the authentication server
>        (CVE-2025-53859).
>     *) Security: insufficient check in virtual servers handling with TLSv1.3
>        SNI allowed to reuse SSL sessions in a different virtual server, to
>        bypass client SSL certificates verification (CVE-2025-23419).
>     *) Security: processing of a specially crafted mp4 file by the
>        ngx_http_mp4_module might cause a worker process crash
>        (CVE-2024-7347).
>        Thanks to Nils Bars.
>     *) Security: when using HTTP/3, processing of a specially crafted QUIC
>        session might cause a worker process crash, worker process memory
>        disclosure on systems with MTU larger than 4096 bytes, or might have
>        potential other impact (CVE-2024-32760, CVE-2024-31079,
>        CVE-2024-35200, CVE-2024-34161).
>        Thanks to Nils Bars of CISPA.
> 
> Update patch 0007, which does not apply cleanly.
> License file was changed, year was bumped to 2025.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x. Thanks

> ---
> v1->v2:
>  - forgot to mention license file update
> ---
>  ...nix-ngx_linux_config.h-only-include-dlfcn.h-.patch | 11 ++++-------
>  package/nginx/nginx.hash                              |  4 ++--
>  package/nginx/nginx.mk                                |  2 +-
>  3 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch b/package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
> index c10fcd11c9..4656634bd3 100644
> --- a/package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
> +++ b/package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
> @@ -10,11 +10,11 @@ Signed-off-by: Martin Bark <martin@barkynet.com>
>   1 file changed, 4 insertions(+), 2 deletions(-)
>  
>  diff --git a/src/os/unix/ngx_linux_config.h b/src/os/unix/ngx_linux_config.h
> -index 2f6129d..4244086 100644
> +index d99358c93..612935524 100644
>  --- a/src/os/unix/ngx_linux_config.h
>  +++ b/src/os/unix/ngx_linux_config.h
> -@@ -55,10 +55,12 @@
> - #include <crypt.h>
> +@@ -54,10 +54,12 @@
> + #include <sys/ioctl.h>
>   #include <sys/utsname.h>        /* uname() */
>   
>  -#include <dlfcn.h>
> @@ -27,7 +27,4 @@ index 2f6129d..4244086 100644
>  +#endif
>   
>   
> - #if (NGX_HAVE_POSIX_SEM)
> --- 
> -2.8.2
> -
> + #if (NGX_HAVE_CRYPT_H)
> diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
> index 77220665f3..7b79036b20 100644
> --- a/package/nginx/nginx.hash
> +++ b/package/nginx/nginx.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -sha256  69ee2b237744036e61d24b836668aad3040dda461fe6f570f1787eab570c75aa  nginx-1.26.3.tar.gz
> +sha256  40e7a0916d121e8905ef50f2a738b675599e42b2224a582dd938603fed15788e  nginx-1.28.1.tar.gz
>  # License files, locally calculated
> -sha256  f19c4caea60247490199c5a6d0134281e3fb20b3d7577e6873c628597f5381d9  LICENSE
> +sha256  77c01620abf36ed747b7eca4bd271e49023fe3a8e2b3525bcf4b09c8e3aa28e4  LICENSE
> diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
> index 6ca1ac2075..41490caee2 100644
> --- a/package/nginx/nginx.mk
> +++ b/package/nginx/nginx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NGINX_VERSION = 1.26.3
> +NGINX_VERSION = 1.28.1
>  NGINX_SITE = https://nginx.org/download
>  NGINX_LICENSE = BSD-2-Clause
>  NGINX_LICENSE_FILES = LICENSE
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
