Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B979CE9A055
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 929BD81214;
	Thu, 19 Feb 2026 17:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54wIZqd2FXQR; Thu, 19 Feb 2026 17:26:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95C4883A64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521999;
	bh=Iq1+S3dkjeTG5lVsuMbi/PSNBAWVZoRmBAZNrxKtXS0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OGpIgG+h1kEd1Ttuvl396TSyYluXlUj8ccnqOWzsqkVoqQjml5krJZabnKoegh5MX
	 GnbzfGxEvnDHDGuFTRH2OWCm5NLrdEywXjmHa/l/eEMU/aH80xs76BE9qZJ7C8Y1+i
	 v2+RBioCV6iAws4dNPxPbIeiEAbu7VRjO4Ev8nfSbLMCFFewGh5EoVFD0HGXB4apEW
	 upyg4ZWMzmW8bFOBQOCXyx4spP7brd0QFyRMCmad/TalVfJoJSUOudBfZqgjwS4GVD
	 hFqoL6iUygLW5VrEpQDPvzCf+0aZpPdjBUW1jeJ/tFkaBxWIuRdGJL0URHMGVsB74F
	 dYkgMFnKIuMSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95C4883A64;
	Thu, 19 Feb 2026 17:26:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47599206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D35840642
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrGpZM3Kp8HF for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:26:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EFE434061D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFE434061D
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EFE434061D
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:32 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-480706554beso13623765e9.1
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521991; x=1772126791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DGbMyXtz6j83za6k7k47dYdnf+i6rdwH8NBEfVbizVU=;
 b=B0ZJ6xGPuGNZmajF4HJiS5XzlIQy407RNEkYOSdRcjJj0x1bubwayHl/vh/n/i/KtM
 lxZz0R+TwE3PykQRXRR0LASy7PEL7Gig/8T3MbYR0fKqSvPy3pA7xlEIgYu7Y+8ahCvn
 PiDp2WqP/teQeMp2ctxOYCsx0VSRJ0tp4o0YaZzuLwqmFZFxQBt6TZBldmpHmIifzBqz
 JEEvzQN3QU/+rW01cwAn0/gIi275GLlncwFc9EQEFVgo6HFSGYLZd/GijviSGpojl2sU
 QKJd3PBSQlAjUofe1hONGRU3cIOWZWp1Ml/6Oik0QmsGcemV6bpy3vdmPc/TQf9dSRhq
 dZmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSCGN0uw323AFnXAJppYr1VkAJGjuwSU0T5or2XHZvNYN0x2G1+Edt2xGXN9r8IU+fVsJ48kA/GZQ=@buildroot.org
X-Gm-Message-State: AOJu0YzCn/4igUk9PbTK/BrHAHyeqIBkUmvtCCyXPIzJ9PSD/Y3jIrNP
 8suen1gq/z8O3U45Ygi1K74JS2iR+Kr75HDk48F5tUCq75Oxh4K/GfFDTCVTOClly+Q=
X-Gm-Gg: AZuq6aLykZcyTr6R1jJ8U/yl2srDmuenDswlpSBn5TY+CTVLrxVzoHLvVi9J+Ckfecq
 p4TuZ3xri+R0k7K4nPoeZFMnady7a5BYK0ziN6JQQiL/zlqG/FH35rtWjaOzWzbTLcw6nin7d03
 21E4B2ErtmmH0x3tuik5g8iBbpdef3mjfjkJqM72GrZPgBtr39I++LultHd9ChAcJLDaWouAOYT
 zECA4RJ10+W0cXIZFjLtRP7CV7HpziAtOCVAvmmwMC95oySzXnIkAJX65H+xy49U4vavJZ5/Ah8
 uXKZOJ/4ZYmyfJTaejyv6jl98aR5vDzYhu3/43TBtbBa9i+6rbsv5lf8AR7MvThc45rHmgIw8DL
 VYbIclofwbwoazEKx8WxdMq0P9YBNQ2HnphlJFbrvjF6l0EyFAWjRM5nTrUozY6vh3xQWPsv1bi
 2R8N6M9QnQKsWjTVY=
X-Received: by 2002:a05:600c:83c6:b0:477:639d:bca2 with SMTP id
 5b1f17b1804b1-48379b93357mr271118995e9.4.1771521990773; 
 Thu, 19 Feb 2026 09:26:30 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31c048bsm16136095e9.7.2026.02.19.09.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:26:30 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:26:29 +0100
Message-ID: <20260219172629.340795-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210080153.767847-1-peter@korsgaard.com>
References: <20260210080153.767847-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771521991; x=1772126791; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DGbMyXtz6j83za6k7k47dYdnf+i6rdwH8NBEfVbizVU=;
 b=AfTeDiKi+/LdLl/ui5gfD+flgQI2VdG7Ycyv3b6D7hePAXWXy9YrMowECZlehzttuf
 jrGd7ZFBglUO1fS7OtPbxR26WNtXOruKCgsUvm4JI1PlldbLWn5dgeD5II0rLLqfqZdi
 ndEVfGJY85nZpGcEaeu9wRB2I3aZr04QKuEbg3QAqwxkZmSPUV2V1MIItdHS4iB2NWFF
 Tku9kCYlSMjRU/0rRxyBnrKy2RR49E29VSZm8D1qZThpWmVZvBR3ELLWNMLZlyTnqBIJ
 kZgB4OVf0L0pJZHsQ+qsFVcThLqr5FkUoGIdKILaSuv8ViK/noRighF58fD8F1mKhdX0
 qfiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AfTeDiKi
Subject: Re: [Buildroot] [PATCH] package/gnutls: security bump to version
 3.8.12
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
> Fixes the following security vulnerabilities:
> 
> CVE-2026-1584: libgnutls: Fix NULL pointer dereference in PSK binder
> verification
> 
> A TLS 1.3 resumption attempt with an invalid PSK binder value in ClientHello
> could lead to a denial of service attack via crashing the server.
> The updated code guards against the problematic dereference.
> 
> CVE-2025-14831: libgnutls: Fix name constraint processing performance issue
> 
> Verifying certificates with pathological amounts of name constraints
> could lead to a denial of service attack via resource exhaustion.
> Reworked processing algorithms exhibit better performance characteristics.
> 
> For more details, see the release notes:
> https://lists.gnupg.org/pipermail/gnutls-help/2026-February/004914.html
> 
> Drop now upstreamed 0001-audit-crau-fix-compilation-with-gcc-11.patch:
> https://gitlab.com/gnutls/gnutls/-/commit/f5666f8f1f653cfe2bef808a9c9b61534f279ed1
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...dit-crau-fix-compilation-with-gcc-11.patch | 67 -------------------
>  package/gnutls/gnutls.hash                    |  4 +-
>  package/gnutls/gnutls.mk                      |  2 +-
>  3 files changed, 3 insertions(+), 70 deletions(-)
>  delete mode 100644 package/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
> 
> diff --git a/package/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch b/package/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
> deleted file mode 100644
> index 0551d5c4fd..0000000000
> --- a/package/gnutls/0001-audit-crau-fix-compilation-with-gcc-11.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -From 2bbae7644a2292410b53f98fd0035c40bf8750a5 Mon Sep 17 00:00:00 2001
> -From: Julien Olivain <ju.o@free.fr>
> -Date: Sun, 23 Nov 2025 18:17:19 +0100
> -Subject: [PATCH] audit: crau: fix compilation with gcc < 11
> -
> -If the CRAU_MAYBE_UNUSED macro is unset, the crau.h file tries to
> -automatically detect an appropriate value for it.
> -
> -This autodetection is using the cpp special operator
> -`__has_c_attribute` [1], introduced in gcc 11 [2].
> -
> -When compiling with a gcc older than version 11, the compilation fails
> -with the error:
> -
> -    In file included from audit.h:22,
> -                     from audit.c:26:
> -    crau/crau.h:255:23: error: missing binary operator before token "("
> -         __has_c_attribute (__maybe_unused__)
> -                           ^
> -
> -This has been observed, for example, in Rocky Linux 8.10, which
> -contains a gcc v8.5.0.
> -
> -The issue happens because the test for the `__has_c_attribute`
> -availability and the test for the `__maybe_unused__` attribute
> -are in the same directive. Those tests should be separated in
> -two different directives, following the same logic described in
> -the `__has_builtin` documentation [3].
> -
> -This issue was found in Buildroot, after updating gnutls to
> -version 3.8.11 in [4].
> -
> -This commit fixes the issue by splitting the test in two.
> -
> -[1] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fc_005fattribute.html
> -[2] https://gcc.gnu.org/gcc-11/changes.html#c
> -[3] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fbuiltin.html
> -[4] https://gitlab.com/buildroot.org/buildroot/-/commit/81dbfe1c2ae848b4eb1f896198d13455df50e548
> -
> -Upstream: https://gitlab.com/gnutls/gnutls/-/merge_requests/2045
> -Reported-by: Neal Frager <neal.frager@amd.com>
> -Signed-off-by: Julien Olivain <ju.o@free.fr>
> ----
> - lib/crau/crau.h | 7 ++++---
> - 1 file changed, 4 insertions(+), 3 deletions(-)
> -
> -diff --git a/lib/crau/crau.h b/lib/crau/crau.h
> -index 0d4f9f13e..53d33555b 100644
> ---- a/lib/crau/crau.h
> -+++ b/lib/crau/crau.h
> -@@ -251,9 +251,10 @@ void crau_data(struct crau_context_stack_st *stack, ...)
> - # else
> - 
> - #  ifndef CRAU_MAYBE_UNUSED
> --#   if defined(__has_c_attribute) && \
> --    __has_c_attribute (__maybe_unused__)
> --#    define CRAU_MAYBE_UNUSED [[__maybe_unused__]]
> -+#   if defined(__has_c_attribute)
> -+#    if __has_c_attribute (__maybe_unused__)
> -+#     define CRAU_MAYBE_UNUSED [[__maybe_unused__]]
> -+#    endif
> - #   elif defined(__GNUC__)
> - #    define CRAU_MAYBE_UNUSED __attribute__((__unused__))
> - #   endif
> --- 
> -2.51.1
> -
> diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
> index 03297c3321..209b6aa220 100644
> --- a/package/gnutls/gnutls.hash
> +++ b/package/gnutls/gnutls.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.11.tar.xz.sig
> -sha256  91bd23c4a86ebc6152e81303d20cf6ceaeb97bc8f84266d0faec6e29f17baa20  gnutls-3.8.11.tar.xz
> +# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.12.tar.xz.sig
> +sha256  a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2bf470bea012b8e51  gnutls-3.8.12.tar.xz
>  # Locally calculated
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
>  sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LESSERv2
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index 9eef594cc9..0844bfe50d 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -6,7 +6,7 @@
>  
>  # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
>  GNUTLS_VERSION_MAJOR = 3.8
> -GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).11
> +GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).12
>  GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
>  GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
>  GNUTLS_LICENSE = LGPL-2.1+ (core library)
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
