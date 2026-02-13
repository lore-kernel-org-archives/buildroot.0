Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD4FEF99D1
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 884C3847B3;
	Fri, 13 Feb 2026 19:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lFtzLQOIuUTR; Fri, 13 Feb 2026 19:38:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4776C847C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011505;
	bh=72FK0mgU54kNWLdorNV3/J8IshpNQJV6JwzmVs6d5P8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JuzOorfopGCBVFyxqd8HWcp4LPk92mpqnqflEeduzJs5T3afbfKs+RWzKu53zhz2O
	 1HpIcc75EW4woTQ+UWG+bCUK0WEaxYGd2/BhjxxAzQPzARtf0asHlkwGpW8Ylhv68w
	 3xdkMxRh1fh0F6YEzYZI45EmeDOZqfG4P9xILLNh8ft2gSfj3+jVu5385RIXaHCw8U
	 xtgea0B3DD36F0rieb/4WeT4VhpSrmGyytafQAmlz13fuirhYljQ2oLEefdQaFdtBD
	 0hUHlE4LIfnId+aQ6Owh7sVnpypDrpC3s2A/i88G3yON1y6A/pGjvVdiLh4Xx4pGKm
	 fDVtQNXgQMxaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4776C847C3;
	Fri, 13 Feb 2026 19:38:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 062D969
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0201C8470A
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfEA3Fzf5h3i for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A85784703
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A85784703
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A85784703
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:33 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso9826165e9.1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:37:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011451; x=1771616251;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7XGTstoud9XKVoKe9fVTGs+ZDM8YphfSCH63VAuAXAo=;
 b=CyYGcfFONbjTY39x0kLZxzvQjhAlxHk2LlS1uKqCfA5pfcYTgeMU6oJrzOeB/RTfUE
 sjPBygQDhYjVNLy4kvnP7//DMvh8oycoJ+xtu2SmJ4MnCHl7/3CqTF+Rz4jaFuERx400
 wWMSnqwzPGZBxzCIeTHQna+omNv7vcCJiPOBM6xx3rssJifSxwiapy17RXLeR5qC75va
 MsX7gzCGoc6RVt9yiQeFyhtliRdj2gsAGOrlH7bI58VuGUGnvSvXLJ6LVANC0v1NUgxP
 kKtSYePr7/tfwsQhzQGtk8gGn+FQrFrczZQCBp0Li/GT8/q1lNoOUB29CnTF2OnFu9d2
 uspQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEmtOKw6LDE+JgUc+qKy6e5HstIKq0S4TnvTuKBIW+R5S5fjHomGt3ZbP49ORXJfQGIJFRLFCzbDM=@buildroot.org
X-Gm-Message-State: AOJu0YyI/utXEe3QxsIynDNe/CKSKbeu79Nk+NOIBo8sSJUukCqwExn6
 A791Wo/DCkbvLsQF1PYJ+fztdBSgqIeCFR6PmiyPTazUzbrkGE9Azi7Z9KBhMot+4ps=
X-Gm-Gg: AZuq6aJ0Qg4psZgXlearPXCZIBvFiTzKgqwqfMI+H+w4d8ARU9RM70wr109zuZ628rM
 5jjw2QsIEZYT4oXnNDNxt5XRDvjb32JH9j/oPg8Hhr9FSLkq2equvgMRSDxaweW89tePHG7wG41
 2cQyDuf73QjALy8OGgfUm1GnMuOM/XMo6jZKp2lqPEDQC+WO39RQ4lqnwyWEv1sj8Dl4xozT5Ow
 01fhfNwPmAHIW6LOS3oi0ZKceU09W6ZGthzQ4iLLn9xGVgQG8/W9ojStDAWFaWkEHOdwuYC58m5
 41KkqRHdCyGqWLRm+pOZiqktWaqd4e84C8LFOPMMUWEcfK/M2E1etL4KSTA4SkF1nIQ74dEj8Pl
 tPUqJ0Pav1wE27h46+Le4J3XYmFZcKpxHtdq4agpBM6xiuwdEUomdYBv2p9sFWp00piZncyNxzW
 nrK7XAC9yd7WiwiOM=
X-Received: by 2002:a05:600c:314f:b0:47e:e970:b4e4 with SMTP id
 5b1f17b1804b1-48373a6e371mr39065505e9.29.1771011451429; 
 Fri, 13 Feb 2026 11:37:31 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a44ae0sm20666665e9.29.2026.02.13.11.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:37:31 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:37:30 +0100
Message-ID: <20260213193730.39766-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251026090221.699214-1-bernd@kuhls.net>
References: <20251026090221.699214-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011451; x=1771616251; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7XGTstoud9XKVoKe9fVTGs+ZDM8YphfSCH63VAuAXAo=;
 b=XuxbfRPen9vuTBDaeONAa8pCu7vk/S54bQEjlwJYTlQQzE2aJoulspYheerP7kyOnC
 OqoJyGNEsWMXfhSFfaXUArvrwYd4/kUsBTTs+0zS8k5td8niesPzbqR3jw5csuOM0yw4
 UdsYeZ7aiML4zeSdvRSurxcRSEODZsNRJZqpBe7g0V2C3Bc3sGwlixb1yed+JxfD2HfV
 I3bvjl8lXIsGbm/AAARXB1X2Wo2hxK/n3lq7beDe38MyazrPc07SigwhsyYFt6sDEe6i
 DykYHUKsRL5dNc1aGpthzrBfeMlZRTZL68tMbR3SF9huG4LCwT3QF10vasfo2edesRei
 8Vig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=XuxbfRPe
Subject: Re: [Buildroot] [PATCH 1/1] package/mpir: fix build errors
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
> Added upstream patch to fix configure with gcc-14.
> 
> Updated project URL and _SITE due to previous site not being available
> anymore: https://github.com/wbhart/mpir/pull/298
> 
> The github helper could not be used, for details see
> https://patchwork.ozlabs.org/project/buildroot/patch/20250203-repair_mpir-v1-1-db848d68b586@bootlin.com/
> In contrast this commit does not bump the package version.
> 
> Removed doc build which fails due to missing automake.
> 
> Fixes:
> https://autobuild.buildroot.net/results/d14/d144ec967b7db34de56eaf34bb436460b8c924ed/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  .../mpir/0003-fix-configure-with-gcc-14.patch | 32 +++++++++++++++++++
>  package/mpir/Config.in                        |  2 +-
>  package/mpir/mpir.hash                        |  2 +-
>  package/mpir/mpir.mk                          | 13 ++++++--
>  4 files changed, 45 insertions(+), 4 deletions(-)
>  create mode 100644 package/mpir/0003-fix-configure-with-gcc-14.patch
> 
> diff --git a/package/mpir/0003-fix-configure-with-gcc-14.patch b/package/mpir/0003-fix-configure-with-gcc-14.patch
> new file mode 100644
> index 0000000000..d3d490750b
> --- /dev/null
> +++ b/package/mpir/0003-fix-configure-with-gcc-14.patch
> @@ -0,0 +1,32 @@
> +From 4ff3b770cbf86e29b75d12c13e8b854c74bccc5a Mon Sep 17 00:00:00 2001
> +From: Reno Dakota <paparodeo@proton.me>
> +Date: Wed, 4 Dec 2024 23:09:03 +0000
> +Subject: [PATCH] fix configure with gcc-14
> +
> +move function definition above caller to fix compile error
> +
> +> configure:6438: gcc -m64  conftest.c >&5
> +> conftest.c: In function 'f':
> +> conftest.c:13:44: error: implicit declaration of function 'h' [-Wimplicit-function-declaration]
> +
> +Upstream: https://github.com/wbhart/mpir/commit/4ff3b770cbf86e29b75d12c13e8b854c74bccc5a
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + acinclude.m4 | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/acinclude.m4 b/acinclude.m4
> +index 620a629ef..cd917567f 100644
> +--- a/acinclude.m4
> ++++ b/acinclude.m4
> +@@ -590,8 +590,8 @@ extern
> + __inline__ t1 e(t2 rp,t2 up,int n,t1 v0)
> + {t1 c,x,r;int i;if(v0){c=1;for(i=1;i<n;i++){x=up[i];r=x+1;rp[i]=r;}}return c;}
> + void f(){static const struct{t1 n;t1 src[9];t1 want[9];}d[]={{1,{0},{1}},};t1 got[9];int i;
> +-for(i=0;i<1;i++){if(e(got,got,9,d[i].n)==0)h();g(i,d[i].src,d[i].n,got,d[i].want,9);if(d[i].n)h();}}
> + void h(){} void g(){}
> ++for(i=0;i<1;i++){if(e(got,got,9,d[i].n)==0)h();g(i,d[i].src,d[i].n,got,d[i].want,9);if(d[i].n)h();}}
> + #else
> + int dummy;
> + #endif
> diff --git a/package/mpir/Config.in b/package/mpir/Config.in
> index da4cc9f44e..b22350b23b 100644
> --- a/package/mpir/Config.in
> +++ b/package/mpir/Config.in
> @@ -5,4 +5,4 @@ config BR2_PACKAGE_MPIR
>  	  MPIR is a highly optimised library for bignum arithmetic
>  	  forked from the GMP bignum library.
>  
> -	  http://www.mpir.org/
> +	  https://github.com/wbhart/mpir
> diff --git a/package/mpir/mpir.hash b/package/mpir/mpir.hash
> index 71d0c19d12..3b1b3e877d 100644
> --- a/package/mpir/mpir.hash
> +++ b/package/mpir/mpir.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  52f63459cf3f9478859de29e00357f004050ead70b45913f2c2269d9708675bb  mpir-3.0.0.tar.bz2
> +sha256  86a5039badc3e6738219a262873a1db5513405e15ece9527b718fcd0fac09bb2  mpir-3.0.0.tar.gz
>  sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING.LIB
> diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
> index 46cd35e436..eab5233865 100644
> --- a/package/mpir/mpir.mk
> +++ b/package/mpir/mpir.mk
> @@ -5,15 +5,24 @@
>  ################################################################################
>  
>  MPIR_VERSION = 3.0.0
> -MPIR_SITE = http://www.mpir.org
> -MPIR_SOURCE = mpir-$(MPIR_VERSION).tar.bz2
> +MPIR_SITE = https://github.com/wbhart/mpir/archive/refs/tags
>  MPIR_LICENSE = LGPL-3.0+
>  MPIR_LICENSE_FILES = COPYING.LIB
>  MPIR_INSTALL_STAGING = YES
>  MPIR_DEPENDENCIES = gmp host-yasm
>  # 0002-Fix-configure-failures-with-Xcode12.patch
> +# 0003-fix-configure-with-gcc-14.patch
>  MPIR_AUTORECONF = YES
>  
> +# mpir tries to build/install .info doc even if makeinfo isn't installed
> +# on the host, so we have to disable global doc installation to prevent
> +# autobuild errors.
> +define MPIR_DISABLE_DOC_INSTALL
> +	$(SED) 's/SUBDIRS += mpn fft mpz mpq mpf printf scanf cxx tune doc/SUBDIRS += mpn fft mpz mpq mpf printf scanf cxx tune/' \
> +		$(@D)/Makefile.am
> +endef
> +MPIR_POST_PATCH_HOOKS += MPIR_DISABLE_DOC_INSTALL
> +
>  ifeq ($(BR2_MIPS_NABI32),y)
>  MPIR_CONF_OPTS += ABI=n32
>  endif
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
