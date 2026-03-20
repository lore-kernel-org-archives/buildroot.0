Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A4310987A3
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 870AC61B71;
	Fri, 20 Mar 2026 15:55:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5DbzJ_gLSkle; Fri, 20 Mar 2026 15:55:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F40B61B7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022122;
	bh=nnPliFm6BedbtTlr0y57jXrnx1ZmdzhZhXn+ndnRZRw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oM+vQTU1k7Ghu1l5nV0TyVN3pLv+nX3KXvDHIuL4xGrTbIqdA4npkyW9SLg7VjqRF
	 p5WDsx77OKqa/tc3p4FjVXSfV2DksElCN8/3gD2phdXwRpceWWNxU3mhsWEjV4bf8L
	 2MloryVymmNY3nfyqlqW6rEqBSr3VEZdCCbEzaYFQs7WY32Majf+RXwOHjNXnYOHOx
	 xOs6laQn/lo+spER/f7N/5V+PBtufYks+2s/Bx4d5xdsBWWchUWaT3BqGt3ozJtXUA
	 eRUQl50RQyS9VmiwDqK7L0iSh2khm6RvPlLaxN32ST7VHIXX0/6nHCrrlgyxcEjP4H
	 iAC6pQtv3mU8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F40B61B7D;
	Fri, 20 Mar 2026 15:55:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13C0125C
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0190E414DB
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mdhet4RWFf8 for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:55:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D9260403A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9260403A1
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9260403A1
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so6445545e9.0
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022114; x=1774626914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=URfE4++BGPDlZkAAjvcPIRj9BaiXIbFEM3h7/ngHX4w=;
 b=cv2Tj6yKoBhC4JqBmb+M57elBHnz/jPP3HmCapdqVDG+7qXJlYBHUYckd+t8keXSB7
 qAkISiXUIDlKtS9MbGlQCXM1w3YhaXA9UfqHbBeOJCMJsB/2KsKu8vhKjJLunERdNSZC
 sh8Q1+ht3/RfjXM485MaXK1wsaf76D13zu8uaC4NkJ6EDqGsG6Ncyy+gBZUcPGvC7MLj
 xu/28RtGmKG5/qLYirCAcs1a0c4zFhAR2b/gLvxVVFkGuJlw280W/5EBpEIRGEmGY3dK
 b/TqvvY48e92SeZfosvXxLXxXoqV5Y14CdEf+LANbbIDW7wpSzE7DZLhoSLa6djqLlVP
 CE3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUvCR6PVoeK2CL712RsMGAys48FL+rPfR7rLZXr2/T++LqgIGnuFaVeiC5zdtznqNQc9rgJRoyJM0=@buildroot.org
X-Gm-Message-State: AOJu0YyVy0MFQaio6g3BD2uBm1g7Iv29fCsDXHVtC+9Ohi4AbLi+SrCG
 /12/qbFEZzpeQ7Pk8SdwPMvZpn9eQZMC4aQC4689/+/2doM8oN4ghHnLlWYFkTbfIVc=
X-Gm-Gg: ATEYQzxVvkIwlPRBsY9E6c7g9C/NSCIWw9VN/dQvEqVNKBX9NA2wCfcVfAf8fhTzEKj
 WQNBAXr5UNgGLD7Uyv9cIz5LiSZyFmFY+9l6eGE15RdldKLGI7GS9SZRHmLPS9HpwqItN5rpKnw
 v4AdMV84N/lWCAxeC2FmbW4X5yJOCveqTqcXRdCO1vszR74X25OFBl/YCB1CrgMh69lWc/ErmLO
 e8x3y5vi+zdONEoLgNM872Ha2682sIOm0KaC05AUf1q5nBQOyTpm6cwirNyD6iuUs1+yPTH0ncK
 eTBVxaoSau6T3MM/RxD3s1uLPEbImftsv+wvRCtS6u8N8mWGwDMsF1sWSXYzDYGcMJToLll586o
 n9HYUcpcC4Ss2fndLjyr8TdfmvYQDMxIQfFCYaJdLMJQfgpsut6F58OgyQWvd1EFn0O2HTu7ca7
 3mcMAx1sccd/XX6Fbr
X-Received: by 2002:a05:600c:1f12:b0:485:3ff1:d5ed with SMTP id
 5b1f17b1804b1-486fedab455mr55993545e9.1.1774022113918; 
 Fri, 20 Mar 2026 08:55:13 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fe7e2665sm81796235e9.6.2026.03.20.08.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:55:13 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:55:13 +0100
Message-ID: <20260320155513.177005-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314122326.600040-1-bernd@kuhls.net>
References: <20260314122326.600040-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022114; x=1774626914; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=URfE4++BGPDlZkAAjvcPIRj9BaiXIbFEM3h7/ngHX4w=;
 b=QQbycbidXzf1u3exmZzPPcwKqk1n7Mx0tSQBnA/VHR5XlsWQttD2RKFIWv5HYHZBGA
 Ou1eMVuyANKK9mBK6dNTb0pElA8eyJYwGlARXy2GMeHROVEGx2qWbl/D9ZsTjSp5KQtG
 RE91dqDSMiKcoZY4ezCSYT8Ov6AdFRH2myvogZUIPy/g9SCF3HQV2OkVR6MX/KpCI8ec
 mNLl554QNAh1uu+MHBTOdG/lkNkv7JiUfxTuegi50oPF1c/EQDmUaZxBy951wQw7HKAj
 as7sbWJEKJF3bb4XumTWopVKxeFobHe7SCH8nnNGd0CyYJU9kGDX51e5cS2MRCZHToRG
 McQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QQbycbid
Subject: Re: [Buildroot] [PATCH 1/1] package/libxml2: security bump version
 to 2.15.2
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
> Release notes:
> https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.2.news
> 
> - CVE-2026-1757 fix: Memory leak in xmllint Shell - shell.c
> - CVE-2026-0990 fix: Prevent infinite recursion in
>   xmlCatalogListXMLResolve
> - CVE-2026-0992 fix: Exponential behavior when handling
> - parser: Fix infinite loop in xmlCtxtParseContent
> - CVE-2025-10911 libxslt related: Ignore next/prev of documents when
>   traversing XPath
> - CVE-2026-0989 fix: Add RelaxNG include limit
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  ...evert-cmake-Fix-installation-directories-in-libxml2.patch | 5 +++--
>  package/libxml2/libxml2.hash                                 | 4 ++--
>  package/libxml2/libxml2.mk                                   | 2 +-
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch b/package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
> index 75232b6f00..70f1d9899c 100644
> --- a/package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
> +++ b/package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
> @@ -8,6 +8,7 @@ This reverts commit 75dde50b20215a2a3a445b62f36a67c8ed337cab.
>  
>  Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/issues/898#note_2452864
>  
> +[Bernd: rebased for 2.15.2]
>  Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
>   configure.ac            | 11 -----------
> @@ -19,7 +20,7 @@ diff --git a/configure.ac b/configure.ac
>  index 4eb629bb..150e06eb 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1006,17 +1006,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
> +@@ -1008,17 +1008,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
>   AC_SUBST(XML_PRIVATE_CFLAGS)
>   AC_SUBST(XML_INCLUDEDIR)
>   
> @@ -70,7 +71,7 @@ diff --git a/meson.build b/meson.build
>  index 31c73b62..8728852c 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -577,9 +577,6 @@ config_cmake = configuration_data()
> +@@ -590,9 +590,6 @@ config_cmake = configuration_data()
>   config_cmake.set('LIBXML_MAJOR_VERSION', v_maj)
>   config_cmake.set('LIBXML_MINOR_VERSION', v_min)
>   config_cmake.set('LIBXML_MICRO_VERSION', v_mic)
> diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
> index 637ba52bb8..35c8810ed9 100644
> --- a/package/libxml2/libxml2.hash
> +++ b/package/libxml2/libxml2.hash
> @@ -1,4 +1,4 @@
> -# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.1.sha256sum
> -sha256  c008bac08fd5c7b4a87f7b8a71f283fa581d80d80ff8d2efd3b26224c39bc54c  libxml2-2.15.1.tar.xz
> +# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.2.sha256sum
> +sha256  c8b9bc81f8b590c33af8cc6c336dbff2f53409973588a351c95f1c621b13d09d  libxml2-2.15.2.tar.xz
>  # License files, locally calculated
>  sha256  5d4873884a890122a4b9b20ad56ac6f7da1d796a5bfcf04a427970ac96217626  Copyright
> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
> index 35d373e130..0a365fa689 100644
> --- a/package/libxml2/libxml2.mk
> +++ b/package/libxml2/libxml2.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBXML2_VERSION_MAJOR = 2.15
> -LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).1
> +LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).2
>  LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
>  LIBXML2_SITE = \
>  	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
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
