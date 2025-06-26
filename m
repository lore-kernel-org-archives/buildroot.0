Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4630C7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E1A4612D7;
	Thu, 26 Jun 2025 19:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGe4phOUsuPP; Thu, 26 Jun 2025 19:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC954612BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC954612BD;
	Thu, 26 Jun 2025 19:53:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73A0410A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 650C7612B5
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vl2e8RtB-Zvl for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:53:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7367F612A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7367F612A7
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7367F612A7
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:53:28 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso14487595e9.2
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 12:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750967606; x=1751572406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CFNbIe7wWn5EepTH0LKYk0P0clDPT3trq67vGPw7RP4=;
 b=Qotz9omCl6VVO8Yq2kiJOYtLsNHsIIUEXbiSObD8uxlQXreg/E03jCqAAKUkQyAuLc
 VQfji7pUuEPpCcDECef4NJ9ycuORwIak6ljL0qaXzcObSoHSgibY8Lz8DQeTcaa6oTzf
 H83nq8/BcUHzrWekzUIFINbVqttdbZGc86S2lx3JkeyFtastxTDsH2AWgJkDFKG/LE/t
 R15mQlIN9RRztUgji6A21hNV0riuLQJGCh+5QSwP/e2sa3Ooa6azvoi52WZVI8pjBy5K
 vXbmtvjn4ImDdKJLXn5BE4W/Beiie8299RtYtH0hPHsIcEFIEGC1Ip6SUq29g1zMNfNH
 k4Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX2qeprZC7fRpO2lTPT8+zA1XfjNqDgRdJd0yU8BdvVnDCwe8wnreCcIBtrZxVlmfkX/MXpF7mR1A=@buildroot.org
X-Gm-Message-State: AOJu0Yx1xTi54Ht9VUMIITbVcT2lxNckcXdL+4p0VRNeflWTYNvIqCIl
 lS0boVpLC1oJ1g1mgueNGXZuEK0GegUxPwguCDGbVG849Xea8G5ls5EK/tnBPcseVP8=
X-Gm-Gg: ASbGncshOSg9ePYA83xnjMnMruNAeb/YdNHZZN0vQLxPd6d2RhawGIO/Pug7gJ+cU9T
 fGGr+Rc6YsvJ6UvQvmFNMWpzqwig1nYHOmERhg+V99vZw05n8ZclNHh+pUMdzc+FRlKeNs2ty43
 HAPh590ZUrQCEEgeu2Xj6pmj+kWpqdVSyLa/yhAMD7EkwKNZcCkIuFKQE+wM/hRMU5dlzVN5zly
 5Q5AELHOmxU/YG4VBzx8fihiZAP3/Xy/jCgroBBGcnWkNm8DlJ+SzLPRP1jQYZJ2TOgRAa/Sef2
 1erukdqugkMv/5ejktmvl0X3bsuilcO8k0Eh2KuVCS2ZDml8xc9u2fhAzzKVVJO3yW6EO7aQRC8
 OaHPMDLTTTNJGv+5Ojg5dpQ4O0ybham5e
X-Google-Smtp-Source: AGHT+IExVNF4RFe7g0YEoHnvBZI80eEPHbh8Jn0VZ9gUQw1Rq+I8b1SROjwGAcdUk126xCnFR+xxoQ==
X-Received: by 2002:a05:600c:8b46:b0:453:1e14:6387 with SMTP id
 5b1f17b1804b1-4538ee954bdmr5069345e9.32.1750967606425; 
 Thu, 26 Jun 2025 12:53:26 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453814a6275sm42226615e9.1.2025.06.26.12.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 12:53:26 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Jun 2025 21:53:17 +0200
Message-ID: <20250626195317.15109-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250614101959.61812-1-bernd@kuhls.net>
References: <20250614101959.61812-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1750967606; x=1751572406; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CFNbIe7wWn5EepTH0LKYk0P0clDPT3trq67vGPw7RP4=;
 b=bRJkX+YqJcK9/ZwDMl8iKcuNoFb1EjoZHMrGp7VSk7Kvi897qU/GfSA8gOP0rh5m2r
 6Ys9P8X9ZL9/DAdyre8wzHZ7N9qOP028tmeTwcJ9ywSNQzHVUSMBxjZpQ4kLeu+LmIOd
 oAYN0AnIPOqES8wZfenvhmihxQJ9ERcjGmPxvaS15GS4U5rE3VOgbYClY1da2TOEPPLw
 lHuSqCsFju/tQI+LOF+X4ZHmVyYjkSObie8RgD/BseqvLa9I/qag7OogqYCEqREQN+k/
 GuUlJROYgDQrOUSiDhdLaqqsdH2ClABPc//u+LsgNKvJtIwcgZQDRIRXFOOyYkfbkbnJ
 r2pg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bRJkX+Yq
Subject: Re: [Buildroot] [PATCH 1/1] package/dht: fix cmake4 compatibility
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
> The only dependee of dht, transmission, forked dht due to upstream
> rejection of cmake support:
> https://github.com/jech/dht/pull/50
> https://github.com/jech/dht/pull/19
> 
> A fix was added to this fork for building with cmake 4.x:
> https://github.com/transmission/dht/commits/post-0.27-transmission/
> 
> Instead of adding yet another patch to buildroot we switch to the repo
> maintained by transmission.
> 
> Fixes:
> https://autobuild.buildroot.org/results/30339a4fdb9c0b608ca3c5ae0692596b21b2fc3f/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.05.x. Thanks

> ---
>  .checkpackageignore          |  1 -
>  package/dht/0001-cmake.patch | 67 ------------------------------------
>  package/dht/dht.hash         |  2 +-
>  package/dht/dht.mk           |  4 +--
>  4 files changed, 3 insertions(+), 71 deletions(-)
>  delete mode 100644 package/dht/0001-cmake.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 8e24c73525..c767d29ca9 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -386,7 +386,6 @@ package/dhcp/S80dhcp-relay Shellcheck lib_sysv.Variables
>  package/dhcp/S80dhcp-server Shellcheck lib_sysv.Variables
>  package/dhcp/dhclient-script Shellcheck lib_shellscript.TrailingSpace
>  package/dhcpcd/S41dhcpcd lib_sysv.Indent lib_sysv.Variables
> -package/dht/0001-cmake.patch lib_patch.Upstream
>  package/dillo/0001-usr-local-include.patch lib_patch.Upstream
>  package/dillo/0002-Fix-openssl-detection.patch lib_patch.Upstream
>  package/dillo/0004-fix-build-with-gcc-10.patch lib_patch.Upstream
> diff --git a/package/dht/0001-cmake.patch b/package/dht/0001-cmake.patch
> deleted file mode 100644
> index bbac639044..0000000000
> --- a/package/dht/0001-cmake.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -From 25e12bb39eea3d433602de6390796fec8a8f3620 Mon Sep 17 00:00:00 2001
> -From: Mike Gelfand <mikedld@mikedld.com>
> -Date: Sun, 1 Jan 2017 16:23:21 +0300
> -Subject: [PATCH] Remove Makefile, add Makefile.am and CMakeLists.txt
> -
> -Downloaded from transmission repo:
> -https://github.com/transmission/dht/commit/25e12bb39eea3d433602de6390796fec8a8f3620
> -
> -Upstream status: rejected (https://github.com/jech/dht/pull/19)
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ----
> - CMakeLists.txt |  9 +++++++++
> - Makefile       |  9 ---------
> - Makefile.am    | 11 +++++++++++
> - 3 files changed, 20 insertions(+), 9 deletions(-)
> - create mode 100644 CMakeLists.txt
> - delete mode 100644 Makefile
> - create mode 100644 Makefile.am
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -new file mode 100644
> -index 0000000..6d4aa99
> ---- /dev/null
> -+++ b/CMakeLists.txt
> -@@ -0,0 +1,9 @@
> -+cmake_minimum_required(VERSION 2.8)
> -+project(dht C)
> -+
> -+add_library(${PROJECT_NAME} STATIC
> -+    dht.c
> -+)
> -+
> -+install(TARGETS ${PROJECT_NAME} DESTINATION lib)
> -+install(FILES dht.h DESTINATION include/dht)
> -diff --git a/Makefile b/Makefile
> -deleted file mode 100644
> -index e012945..0000000
> ---- a/Makefile
> -+++ /dev/null
> -@@ -1,9 +0,0 @@
> --CFLAGS = -g -Wall
> --LDLIBS = -lcrypt
> --
> --dht-example: dht-example.o dht.o
> --
> --all: dht-example
> --
> --clean:
> --	-rm -f dht-example dht-example.o dht-example.id dht.o *~ core
> -diff --git a/Makefile.am b/Makefile.am
> -new file mode 100644
> -index 0000000..2dba648
> ---- /dev/null
> -+++ b/Makefile.am
> -@@ -0,0 +1,11 @@
> -+AM_CFLAGS = @PTHREAD_CFLAGS@
> -+
> -+noinst_LIBRARIES = libdht.a
> -+libdht_a_SOURCES = dht.c
> -+libdht_a_DEPENDENCIES = $(builddir)/include/dht
> -+noinst_HEADERS = dht.h
> -+EXTRA_DIST = CHANGES CMakeLists.txt dht-example.c LICENCE README
> -+
> -+$(builddir)/include/dht:
> -+	$(MKDIR_P) $(builddir)/include
> -+	(cd $(builddir)/include && $(LN_S) $(abs_srcdir) dht)
> diff --git a/package/dht/dht.hash b/package/dht/dht.hash
> index 2b641b9dcb..d5a2f9d842 100644
> --- a/package/dht/dht.hash
> +++ b/package/dht/dht.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  caba469a784a5c359c084099fdc025cfe09b1faec2ba9ba257b7384351c43c0a  dht-0.27.tar.gz
> +sha256  c61493be7f036b59df0c921829f15e5c57b1e29d99bca737923e83d028fd736c  dht-38c9f261d9b58b76b9eaf85f84ec1b35151a1eac.tar.gz
>  sha256  06ce07293caf8c8ddfaf47797ad1fb18d1c040a8375231d8f8a6105cef51a8e6  LICENCE
> diff --git a/package/dht/dht.mk b/package/dht/dht.mk
> index 4f78f027c7..2c8383266c 100644
> --- a/package/dht/dht.mk
> +++ b/package/dht/dht.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -DHT_VERSION = 0.27
> -DHT_SITE = $(call github,jech,dht,dht-$(DHT_VERSION))
> +DHT_VERSION = 38c9f261d9b58b76b9eaf85f84ec1b35151a1eac
> +DHT_SITE = $(call github,transmission,dht,$(DHT_VERSION))
>  DHT_LICENSE = MIT
>  DHT_LICENSE_FILES = LICENCE
>  DHT_INSTALL_STAGING = YES
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
