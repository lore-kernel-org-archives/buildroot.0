Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C22AC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 713F240A86;
	Fri, 10 Jul 2026 13:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9KNiQiBIK3ZN; Fri, 10 Jul 2026 13:51:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61C6340A8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691489;
	bh=gEAqF2zF5XZraHxQAMHMstRQrf+zmyy9MX2dboz77pY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Vx0AWwujTtIQXX7QK+wmkZq02OoFdpdRXDwK3ZcfDMvVijFbqZ/zrQx2gCXLhTqiC
	 QVmsxJVxnAoTZksg6IFuTMN2kcrXPVozIyYWNCIwGAOOyS7wTlxH8QbHgz2PFbsfmo
	 gTucZG7POONUH3FAxve+/qKZ8SxnZthrUnd9EnJBl1xmGVzJHBxYGwGYIek+mnVJdx
	 GZQkyB8rwvDBdOSPj/iza7T717KUJYDB7bhZJ/auZMzcrk7RVmaV9jp83LphbCiuh8
	 YSIhc+0zcbXbllh9m/8TLEPpcg11RGGLaLm4j2MHiDsGXZWtevj4IkFSgTdFdQx4rp
	 2AK1Y1OLtLX/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61C6340A8A;
	Fri, 10 Jul 2026 13:51:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 707712FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5608440A8A
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwtRBWeJ5zlH for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:51:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A760F40A86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A760F40A86
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A760F40A86
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:25 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-493ba701891so8186425e9.3
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691484; x=1784296284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9EAmeiFEBh+Oc5CuOim/v3payYfgnzW950Oh6aSuizQ=;
 b=ruchQQ1k/sKYyPHhw7NWZefNDJhCkOC+3pgf0loW72T41tw1pO6pumFbYfjWPPn7sc
 5PuMaUTcYMqGOrwHQUNBY9P4WPizrLhGPhCIoBkU6zXRgrJ2gGbN7OIAeGcF/7ZhLdCM
 cC5fjzCxmU+/4mEbqD0pEciH9p96aqFO/wicwO3jaNL6irGNH3tlMVgP8JSzpOQfEeuS
 nLNTIFWsT9bf/+hdimjzWoGJ2Du67JdafMB+LH4Mj7O2wUw3hGTA6Ntyxpe38CYw6hGM
 1BI+Z0kGjETOZ+v9NB8jbq7ia0e8IaTdG+iE13sJ/fVeDcmausmPmxuQ0jwKWGk7+uoW
 /ahQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp0HbxbReEFIMtY25SuuQXZoW6Iai+7AJFGw1g1cIJ7xi+haLxo31fFh61khNWTNTCDoyCmWNIuX/g=@buildroot.org
X-Gm-Message-State: AOJu0Yy2/1mkT1A24Pql1RKQm4wHrwwhOkP3WegKGugM2f+rJNegylgE
 3jOYhHFZsBGiSrain+Bh6OaPlCUdifJ+V7SRyL8U4Det53wpoRLD/ud64+fGZvSkBv8=
X-Gm-Gg: AfdE7cmPxjVb7fagdIgNozvqN5BolZVwZhinQMGGprl9Xrj9gff/M6ano9CdnKBUhZP
 MmP4090UMxKIo1wrbh9r1scMj/NKABfTlPUcDTNdBh1WLsZnyuxbQ1TYEajq/bbhdHgOM/Il0uo
 Tqk0ozekvCGWUlL/V1zGhMQDKhqgAvSuwYTjQrxHJq3vRJmvkMqKE14ZbilHXLXHg4vRHiTqH40
 DOejR4LfvwJZ9DUVIu495BrUgrLFGF/+i27BtlWJNStVaQGAX1OwN0a1lMAqn2oCLanWbajzFQy
 hv2e6Vzp+JlaQTwgT0I9WH+rJibUOzG+0kyRcx4i1yE3UrHSMO/+kreGRGVhUlpT9D1HvTqbqrP
 2YKYyFyW3t4lOCVlV8tnU5vBkn8kVrDekGrEX3o61G4uP9u8HUbq9g2tx9/4ZPcn1DNCZehH2XB
 teK3uRjw==
X-Received: by 2002:a05:600c:3e8e:b0:493:ca3a:d738 with SMTP id
 5b1f17b1804b1-493e688c7d6mr114660465e9.7.1783691483731; 
 Fri, 10 Jul 2026 06:51:23 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f16cfsm143159225e9.12.2026.07.10.06.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:51:23 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:51:22 +0200
Message-ID: <20260710135122.758826-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703191731.3691858-1-bernd@kuhls.net>
References: <20260703191731.3691858-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691484; x=1784296284; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9EAmeiFEBh+Oc5CuOim/v3payYfgnzW950Oh6aSuizQ=;
 b=KOJ3nSHOqXtnGx7KNw1K8GDFkXMC5Prxpt6h/fT3xAJZOO64T5nNEck0lp8y1Htnkm
 DvyHhcd/hl+tH+vteikMzjMTNGPI86lisjcW0VyktT5+OjYmUQbGjjpovjRTGD/KNRY5
 otcyAGpUsxfyDtoTuSv01ZRSpPAKWYrIUOCIj+9HYVkPQVzmshZjp0xXdg3hfElaaYVC
 wCCtswV+Hp6UeUlVxq2pGu375y7hQ9MWxB0gMvg192+H1BIiZrTHPsh2SHp//IUiQSR5
 06pxqbodvaq7Sf0E+Kt9HubqEpRvVg93xH6FMo+em39PtjPqRIr4uQUTUSwd2hMqnbT2
 GZ8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KOJ3nSHO
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump to version
 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
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
> Removed patch which is included in this bump.
> 
> Fixes CVE-2026-5435, CVE-2026-6238 & CVE-2026-6791.
> 
> git shortlog  4070d808bea1c077eb7e7d52b52b91cae98205d5..
> 
> Adhemerval Zanella (3):
>       math: Fix fma alignment when exponent difference is exactly 64 (BZ 34183)
>       arm: Save/restore VFP registers in PLT trampolines (BZ 34144, BZ 15792)
>       posix: Fix stack overflow in wordexp tilde expansion (BZ 34091, CVE-2026-6791)
> 
> Florian Weimer (8):
>       iconv: Suppress intermediate errors with //TRANSLIT (bug 34236)
>       resolv: Declare __p_class_syms, __p_type_syms for internal use
>       resolv: Fix ns_sprintrrf formatting of class, type values (bug 34289)
>       resolv: Improve formatting of unknown records in ns_sprintrrf
>       resolv: Check for inet_ntop failure in ns_sprintrrf
>       resolv: More types as unknown in ns_sprintrrf (CVE-2026-5435)
>       resolv: Fix buffer overreads in ns_sprintrrf (CVE-2026-6238)
>       resolv: Add test case tst-ns_sprintrr (bug 34033, bug 34069)
> 
> Jakub Jelinek (1):
>       Rename __unused fields to __glibc_reserved.
> 
> John David Anglin (1):
>       hppa: Fix missing call to __feraiseexcept (BZ 34306)
> 
> Pino Toscano (1):
>       Hurd: comment PF_LINK/AF_LINK defines
> 
> Sam James (1):
>       elf: don't clobber ld.so.conf in tst-glibc-hwcaps-prepend-cache [BZ #34210]
> 
> Samuel Thibault (3):
>       Hurd: comment PF_ROUTE/AF_ROUTE defines
>       Hurd: comment ioctls which cannot currently compile
>       Hurd: restore some SIOC ioctls
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
> Gitlab pipeline passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/3698cca2a91b570cbf9e038c708670b0c2860734
> 
>  ...-__unused-fields-to-__glibc_reserved.patch | 85 -------------------
>  package/glibc/glibc.hash                      |  2 +-
>  package/glibc/glibc.mk                        | 11 ++-
>  package/localedef/localedef.mk                |  2 +-
>  4 files changed, 12 insertions(+), 88 deletions(-)
>  delete mode 100644 package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch
> 
> diff --git a/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch b/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch
> deleted file mode 100644
> index ae832a6035..0000000000
> --- a/package/glibc/0001-Rename-__unused-fields-to-__glibc_reserved.patch
> +++ /dev/null
> @@ -1,85 +0,0 @@
> -From 243bdfec8f7cd4a85a8ce6e4e9a5a5accd3ce1aa Mon Sep 17 00:00:00 2001
> -From: Jakub Jelinek <jakub@redhat.com>
> -Date: Tue, 17 Feb 2026 17:06:48 +0100
> -Subject: [PATCH] Rename __unused fields to __glibc_reserved.
> -
> -__unused is often defined to __attribute__((unused)) in BSD
> -sources and furthermore libstdc++ testsuite uses it as a macro
> -to verify libstdc++ headers don't use __unused identifiers.
> -In ~2012 glibc headers have been cleaned up, but some new
> -uses of __unused have reappeared (s390 fenv.h already many
> -years ago, the rest last November).
> -
> -Reviewed-by: Florian Weimer <fweimer@redhat.com>
> -
> -Upstream: https://sourceware.org/git/?p=glibc.git;a=commit;h=18b97b03b7442d8ba0860e43145f8724c9e77b17
> -
> -Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ----
> - sysdeps/powerpc/nptl/bits/struct_mutex.h | 2 +-
> - sysdeps/s390/fpu/bits/fenv.h             | 8 ++++----
> - sysdeps/s390/nptl/bits/struct_mutex.h    | 2 +-
> - sysdeps/x86/nptl/bits/struct_mutex.h     | 2 +-
> - 4 files changed, 7 insertions(+), 7 deletions(-)
> -
> -diff --git a/sysdeps/powerpc/nptl/bits/struct_mutex.h b/sysdeps/powerpc/nptl/bits/struct_mutex.h
> -index 1472af21f7..ebf2d50922 100644
> ---- a/sysdeps/powerpc/nptl/bits/struct_mutex.h
> -+++ b/sysdeps/powerpc/nptl/bits/struct_mutex.h
> -@@ -32,7 +32,7 @@ struct __pthread_mutex_s
> -   int __kind;
> - #if __WORDSIZE == 64
> -   short __spins;
> --  short __unused;
> -+  short __glibc_reserved;
> -   __pthread_list_t __list;
> - # define __PTHREAD_MUTEX_HAVE_PREV      1
> - #else
> -diff --git a/sysdeps/s390/fpu/bits/fenv.h b/sysdeps/s390/fpu/bits/fenv.h
> -index b9e844e393..33e88fbe9d 100644
> ---- a/sysdeps/s390/fpu/bits/fenv.h
> -+++ b/sysdeps/s390/fpu/bits/fenv.h
> -@@ -76,10 +76,10 @@ typedef unsigned int fexcept_t; /* size of fpc */
> - typedef struct
> - {
> -   fexcept_t __fpc;
> --  void *__unused;
> --  /* The field __unused (formerly __ieee_instruction_pointer) is a relict from
> --     commit "Remove PTRACE_PEEKUSER" (87b9b50f0d4b92248905e95a06a13c513dc45e59)
> --     and isn't used anymore.  */
> -+  void *__glibc_reserved;
> -+  /* The field __glibc_reserved (formerly __ieee_instruction_pointer) is a
> -+     relict from commit "Remove PTRACE_PEEKUSER"
> -+     (87b9b50f0d4b92248905e95a06a13c513dc45e59) and isn't used anymore.  */
> - } fenv_t;
> - 
> - /* If the default argument is used we use this value.  */
> -diff --git a/sysdeps/s390/nptl/bits/struct_mutex.h b/sysdeps/s390/nptl/bits/struct_mutex.h
> -index d069b485d1..571265267c 100644
> ---- a/sysdeps/s390/nptl/bits/struct_mutex.h
> -+++ b/sysdeps/s390/nptl/bits/struct_mutex.h
> -@@ -32,7 +32,7 @@ struct __pthread_mutex_s
> -   int __kind;
> - #if __WORDSIZE == 64
> -   short __spins;
> --  short __unused;
> -+  short __glibc_reserved;
> -   __pthread_list_t __list;
> - # define __PTHREAD_MUTEX_HAVE_PREV      1
> - #else
> -diff --git a/sysdeps/x86/nptl/bits/struct_mutex.h b/sysdeps/x86/nptl/bits/struct_mutex.h
> -index 9c19dff660..13c9894ad4 100644
> ---- a/sysdeps/x86/nptl/bits/struct_mutex.h
> -+++ b/sysdeps/x86/nptl/bits/struct_mutex.h
> -@@ -32,7 +32,7 @@ struct __pthread_mutex_s
> -   int __kind;
> - #ifdef __x86_64__
> -   short __spins;
> --  short __unused;
> -+  short __glibc_reserved;
> -   __pthread_list_t __list;
> - # define __PTHREAD_MUTEX_HAVE_PREV      1
> - #else
> --- 
> -2.47.3
> -
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index a6e6874e1f..97862aef14 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from git)
> -sha256  668f890b45fd8d32bb73783ad3b75fe1f396c5c3aa3c3832e616b4c3f0c6066b  glibc-2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5-git4.tar.gz
> +sha256  647325cc2e9f2c6260f3c48d0385ac5e30cb60d2ec2e5afd649555c518c9bf60  glibc-2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674-git4.tar.gz
>  
>  # Hashes for license files
>  sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 4a6bc94634..5aa2ef5f99 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5
> +GLIBC_VERSION = 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
>  GLIBC_SITE = https://sourceware.org/git/glibc.git
>  GLIBC_SITE_METHOD = git
>  
> @@ -46,6 +46,15 @@ GLIBC_IGNORE_CVES += CVE-2026-5928
>  # Fixed by glibc-2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5
>  GLIBC_IGNORE_CVES += CVE-2026-5450
>  
> +# Fixed by glibc-2.43-42-ge64ae5a591f0604b7504df4df631857bb11cc78b
> +GLIBC_IGNORE_CVES += CVE-2026-5435
> +
> +# Fixed by glibc-2.43-43-g3a418da6a3938756763980541e440dbdd46900fb
> +GLIBC_IGNORE_CVES += CVE-2026-6238
> +
> +# Fixed by glibc-2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
> +GLIBC_IGNORE_CVES += CVE-2026-6791
> +
>  # This CVE is considered as not being security issues by
>  # upstream glibc:
>  #  https://security-tracker.debian.org/tracker/CVE-2010-4756
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index 4890e095e3..732ed6d4ad 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>  # Use the same VERSION and SITE as target glibc
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5
> +LOCALEDEF_VERSION = 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
>  LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
>  LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
>  LOCALEDEF_SITE_METHOD = git
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
