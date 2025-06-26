Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38BAC7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC36C406FA;
	Thu, 26 Jun 2025 19:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id muXyxVnKhyqa; Thu, 26 Jun 2025 19:54:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0FEC41991
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0FEC41991;
	Thu, 26 Jun 2025 19:54:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FE9B154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D9CA842D3
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xkn9oqguN88x for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:54:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A134780DA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A134780DA1
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A134780DA1
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:54:13 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so1609294f8f.1
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967652; x=1751572452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7nK+BmDHDP6CuHdW4jD7n63ulgnrjbWA5LjmMkmQjdI=;
 b=cPamrPvpsQL9cbvexveE0czWWPHTFaPFp8PfOOB32JuFzeCMKgt4rjqmGLjyKpfPXY
 KRIsGHdO2+PTL+3tqT4WLKfwL2MDO5G488I8vuiaZygSTtHsQZaDrcoe7253f7N5F/sq
 VVPDWRbk5ER0WEamjzFAoRCL5loK9RZ18ry1Yo7tM4CbRbfeHsH4t0WI3At5hiw33GL5
 Nh8KZTG61uIF258TtbVGWwyflw98d+YShk4tzwojePB3WzFavIPj3ocFa119P13oB0cT
 RffCE5d89iKGNDE3nDUsQzvRqr/aSZE2Ry65jzgfzht70/z4MHGSswnX/HdQsyMIZrMY
 N2Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUDFOribf4DHZsfJFTSytDeC1TXOL2D0aU7N17gQ0e2NEYG4Lep9vRTqcIhP0fZAHZqw5SUZwjCL8=@buildroot.org
X-Gm-Message-State: AOJu0YyMYlCD07v4yYm6UL7ZyUMegbSaYtA9sa9VsEyQTFe9DO5yKIiy
 Hd3Yrinl0fHkIhYhEfwnr7C7eZ6YvJRss1FT/Pk4am8lQDpU2CvImpTska9cqNUJsW8=
X-Gm-Gg: ASbGncuCbpwlqvvaZb/ygAcTDiqCZ7w1JaUKdNKG1djV3SuXxEM3BJ53gKlL4fc0WKf
 7Ce+bcofP2s6gc3KkIH9DDbkiVDORV09ixpMjEzMJQ3m3c3+Vm8xfidcrA9b0WIdWe7MgLkf/yk
 oPulNIsoL29N+hiSLeem6hgSAEA6lDxPaO9aIFnFAsucxYTAtZLXrhJJyI18qhlgL6+yf72xSXw
 xdT/V9ZXGPYWH5fP/IwNq7gaVlMlUrHEs9UzDbA20KT0Me/C1OonYOhyBq1uz4vitYtXz1IMzp4
 zF3Nsk0t1v2/wl1x38SGOfEKkvEYluxbNFA6NRcVwvuER4YZRLiqNwWO6fxL/mLN4UOyPK3ELa3
 wl0VyDpQnvDiTcFbOpFQ64xjdUqQnySPG
X-Google-Smtp-Source: AGHT+IFd00NP2VD71DiieLTQ4lXtDxGC06w0cgGMJkkaFLyv9tbClkoWkaO0t3acu1iq1ajcSxgGcg==
X-Received: by 2002:a05:6000:280f:b0:3a6:d7e6:f281 with SMTP id
 ffacd0b85a97d-3a6f3152ffbmr3017717f8f.22.1750967651643; 
 Thu, 26 Jun 2025 12:54:11 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e5f8a0sm734088f8f.96.2025.06.26.12.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:54:11 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:54:02 +0200
Message-ID: <20250626195402.15561-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617210228.1146390-1-bernd@kuhls.net>
References: <20250617210228.1146390-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967652; x=1751572452; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7nK+BmDHDP6CuHdW4jD7n63ulgnrjbWA5LjmMkmQjdI=;
 b=f+NBv4Kv8t2lM4NPn3saQbNLQVxq2Cy4umw7WKLyocjfBDyqG+rwsPYSnAcCq1lR3A
 bdBtP3Mn3wFp6IXHXv/dMeenjIcfwQ5ZfgM//SntBVrlsxi36zKKNSKiGRpdTkQlD+16
 2QJsapHqOtPI+hvDTYW598/P/tkDdv/mtB4Hnti5qTA3wc96tCngP9UPK7xIyZJFYg4h
 6LcwYeEd+KgaCVVEvteS6BxZ5RbHMQmzt1Q7BDdlX0pLrr+M3RNwYP7a7rQBq5PwmupI
 GJJ2pMZCll+TH1a8+L7VDj8Mmpz80gegYr4pNr2mMTjzjhJuShOKuJ7NpSevOKbbc+m/
 QIng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=f+NBv4Kv
Subject: Re: [Buildroot] [PATCH 1/1] package/libplatform: bump version
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
> Removed patch which is included in this release:
> https://github.com/Pulse-Eight/platform/commit/e48db06c64613ac76c820511da95228bcd072f64
> 
> Use upstream-provided license file:
> https://github.com/Pulse-Eight/platform/commit/92220248b11c43a80105567dbb074c5f30b04029
> 
> This bump includes compatibility with cmake 4.x:
> https://github.com/Pulse-Eight/platform/commit/d7faed1c696b1a6a67f114a63a0f4c085f0f9195
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.05.x. Thanks

> ---
>  ...require-c-11-as-the-minimum-standard.patch | 26 -------------------
>  package/libplatform/libplatform.hash          |  4 +--
>  package/libplatform/libplatform.mk            |  4 +--
>  3 files changed, 4 insertions(+), 30 deletions(-)
>  delete mode 100644 package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch
> 
> diff --git a/package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch b/package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch
> deleted file mode 100644
> index b880a31953..0000000000
> --- a/package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From ad9fcceb6267e737316b616551b7aac3cf676481 Mon Sep 17 00:00:00 2001
> -From: Lukas Rusak <lorusak@gmail.com>
> -Date: Fri, 2 Oct 2020 15:31:36 -0700
> -Subject: [PATCH] [cmake] require c++11 as the minimum standard
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/Pulse-Eight/platform/pull/46]
> ----
> - CMakeLists.txt | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 7144b0b..e9112f9 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -3,6 +3,10 @@ project(p8-platform)
> - cmake_minimum_required(VERSION 2.8.9)
> - enable_language(CXX)
> - 
> -+set(CMAKE_CXX_STANDARD 11)
> -+set(CMAKE_CXX_STANDARD_REQUIRED YES)
> -+set(CMAKE_CXX_EXTENSIONS NO)
> -+
> - set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR})
> - 
> - find_package(Threads REQUIRED)
> diff --git a/package/libplatform/libplatform.hash b/package/libplatform/libplatform.hash
> index 283b435b7c..5fead5eb95 100644
> --- a/package/libplatform/libplatform.hash
> +++ b/package/libplatform/libplatform.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  ebee46c76b86b40b703fa913465f5004fa3166eeb6a4794c58fc8a5c25702931  libplatform-a7cd0d5780ed80a4e70480d1650749f29e8a1fb2.tar.gz
> -sha256  80fc66febbb2393c9d518e3eefa4ad9aae15a9b6a84174c0e443ea79eeea5131  src/os.h
> +sha256  2ab98ba486b28dd9c31e9f0f8a04eddad12c09ad1951c359fdef475baafba296  libplatform-2748be52ae27e6007ef548b697d4a03ff7de4291.tar.gz
> +sha256  0137261d24ce001fc5237aacddd267533e0f150ac23cf21acffea599f7358f7a  LICENSE.md
> diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
> index 90192369fe..aeded5e9a7 100644
> --- a/package/libplatform/libplatform.mk
> +++ b/package/libplatform/libplatform.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -LIBPLATFORM_VERSION = a7cd0d5780ed80a4e70480d1650749f29e8a1fb2
> +LIBPLATFORM_VERSION = 2748be52ae27e6007ef548b697d4a03ff7de4291
>  LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
>  LIBPLATFORM_LICENSE = GPL-2.0+
> -LIBPLATFORM_LICENSE_FILES = src/os.h
> +LIBPLATFORM_LICENSE_FILES = LICENSE.md
>  LIBPLATFORM_INSTALL_STAGING = YES
>  
>  $(eval $(cmake-package))
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
