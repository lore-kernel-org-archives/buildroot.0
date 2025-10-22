Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35E0CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96C19404A7;
	Wed, 22 Oct 2025 16:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-09NpuK2O0L; Wed, 22 Oct 2025 16:29:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E7C640A86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E7C640A86;
	Wed, 22 Oct 2025 16:29:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 959BADE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 933AA40083
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NV0Nou4ywheW for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:29:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4372D40012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4372D40012
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4372D40012
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:29:32 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-63c556b4e0cso9615061a12.1
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 09:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761150570; x=1761755370;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uUePeRnwEMUcv+XkqhLOJWrKEGZQDozYH+ZwAM9OYgI=;
 b=diMsPIxhzkYhc9fo+Aaw1PzY1bIcueVCSZ8Y4DMzjy9t0fSDZqsoALjoLDHUgaYOgk
 7zaekpVQKyJpLsQY6nWmVrY2zuv+NpF+locAUDPC0z1kLNEnCMl+3TdjyfOScVbB6Ubn
 atGHC0ZRSyfQGZ7bZX3RXfAJ5lsmLaT+9efLZohVvInB4nN/3Ua2xR8GFdliPb34T4Bq
 I4gfO3XlWly20kMUDecYYGUNaL+RcWXDiocLA/FQd+NmWzJyD17VZ3tP99DRRiauy8Sq
 IcVSSpwik7V2M3xIW5+yP2IRwX0SndcTg1gLOwtXfPNd84D0f71FmtoJZH1Rbh/TuU60
 SAzg==
X-Gm-Message-State: AOJu0Yz5+bS/uDCmt0gCoA4+s3VMqJ/NThCxFT/GfsSBxsYFBjm0JVti
 hDPFw7Q1zGVaHzWD/IHds9wQoi3TKJnpGumtMohma9TiodECrQNpnr0p83jqUbCkrMGON3WkYgg
 o886k
X-Gm-Gg: ASbGnctPvgbAHjCLZdGTzLUiita1IMRwTNrxlP/WrM3G4RdvMIk89gbkH4+SOg+tIb+
 PXDUIGyQp/OHxd6UbjWObVb/+R38OpOqBZYOrc91E9Yr+07mDzqF4gktv0CwFoFC8gHamZTs+BE
 SlJ5rWE9gxOdRbXD2daX+qfUhoz3+Ki7BM3sevpuPD1GXhmNFnMIy2UGMSzmWCaa74imZudxBU8
 v5Dt/zQqv0F8eYfaBk8EgJhsiol5mq3j1tOFfFx1xmk6wsqhwW/o3yBplhySKqCqiLyzyxx6dfX
 iaVW/mmrLOZxL4Piehl3Rwpn6Huaa4wySgD39LhSKCMoe+tzt5jgSRc5ezIgcqPhFKkYxsuV0mG
 d17d8Y7E5DlS835dBDIJqQuceKe5I58QIT9slcw2Ncd6NgvHXYb1kaZiHN6ttkbY+CmAvrGgxIk
 xqvrXXHlX+4dJrI2ZUx4FyJFf+Zi5Aee5ALQt0hGobIX0UWTT9
X-Google-Smtp-Source: AGHT+IFvleQ86zxjmNuAMDyQ4eM1DHudpsqmGAtmNVScPJ4JBWxl+a+vluhD7Rx59xfPRhU2zsqaAA==
X-Received: by 2002:a05:6402:3485:b0:639:d9e7:804d with SMTP id
 4fb4d7f45d1cf-63c1f62cc70mr20728283a12.7.1761150569933; 
 Wed, 22 Oct 2025 09:29:29 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.39])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c4945f1ffsm12528190a12.31.2025.10.22.09.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 09:29:29 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 22 Oct 2025 18:29:26 +0200
Message-ID: <20251022162926.16175-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761150570; x=1761755370;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uUePeRnwEMUcv+XkqhLOJWrKEGZQDozYH+ZwAM9OYgI=;
 b=l+p+BXmFuhuioetrCxzEgjBaYW2sSHbvZ7FEMaqP9U0/Ko+MmmZ6MTaqV/VGjLQsoy
 5OLJ11O7hXxwtFdI2DAH4rCcaN2vt0E3wSnQt6rtor9hm0M3Ys7/1XfCdJtVKiNJp7zu
 4fBZ1kXC7q1KG5UXmGa2RMSRl/6dZXT62FS7w=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=l+p+BXmF
Subject: [Buildroot] [PATCH 1/1] package/libgpiod: bump to version 2.2.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The removed patch has been merged in version 2.0.

Update license file hash due to:
- relicense C++ bindings under LGPL-2.1-or-later
- make the project REUSE-compliant

Release notes:
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .checkpackageignore                           |  1 -
 ...nfigure-switch-for-building-examples.patch | 91 -------------------
 package/libgpiod/libgpiod.hash                |  4 +-
 package/libgpiod/libgpiod.mk                  |  2 +-
 4 files changed, 3 insertions(+), 95 deletions(-)
 delete mode 100644 package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index e8c97c2d63dc..90d117dddf3c 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -562,7 +562,6 @@ package/libftdi/0002-libftdi.pc-requires-libusb-fix-static-build.patch lib_patch
 package/libfuse/0001-fix-aarch64-build.patch lib_patch.Upstream
 package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-glibc-2-34.patch lib_patch.Upstream
 package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch lib_patch.Upstream
-package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch lib_patch.Upstream
 package/libgsm/0001-Misc-fixes-from-Archlinux.patch lib_patch.Upstream
 package/libgtk2/0001-reduce-dependencies.patch lib_patch.Upstream
 package/libgtk3/0001-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch lib_patch.Upstream
diff --git a/package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch b/package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch
deleted file mode 100644
index f1a853a6f863..000000000000
--- a/package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 5e9e7223a3633ee82b557d21b1f18aa15becd450 Mon Sep 17 00:00:00 2001
-From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
-Date: Mon, 7 Dec 2020 20:38:30 +0100
-Subject: build: add a configure switch for building examples
-
-Example code for bindings is currently always built if bindings are
-enabled. Make it conditional with a new configure switch.
-
-Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
-Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
-[Retrieved from:
-https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=5e9e7223a3633ee82b557d21b1f18aa15becd450]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- bindings/cxx/Makefile.am    |  8 +++++++-
- bindings/python/Makefile.am | 10 ++++++++--
- configure.ac                |  6 ++++++
- 3 files changed, 21 insertions(+), 3 deletions(-)
-
-diff --git a/bindings/cxx/Makefile.am b/bindings/cxx/Makefile.am
-index 5c40ceb..87463b0 100644
---- a/bindings/cxx/Makefile.am
-+++ b/bindings/cxx/Makefile.am
-@@ -18,10 +18,16 @@ include_HEADERS = gpiod.hpp
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = libgpiodcxx.pc
- 
--SUBDIRS = . examples
-+SUBDIRS = .
- 
- if WITH_TESTS
- 
- SUBDIRS += tests
- 
- endif
-+
-+if WITH_EXAMPLES
-+
-+SUBDIRS += examples
-+
-+endif
-diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
-index 124f152..5403bcb 100644
---- a/bindings/python/Makefile.am
-+++ b/bindings/python/Makefile.am
-@@ -6,8 +6,6 @@
- # Copyright (C) 2017-2018 Bartosz Golaszewski <bartekgola@gmail.com>
- #
- 
--SUBDIRS = . examples
--
- pyexec_LTLIBRARIES = gpiod.la
- 
- gpiod_la_SOURCES = gpiodmodule.c
-@@ -17,8 +15,16 @@ gpiod_la_CFLAGS += -Wall -Wextra -g -std=gnu89 $(PYTHON_CPPFLAGS)
- gpiod_la_LDFLAGS = -module -avoid-version
- gpiod_la_LIBADD = $(top_builddir)/lib/libgpiod.la $(PYTHON_LIBS)
- 
-+SUBDIRS = .
-+
- if WITH_TESTS
- 
- SUBDIRS += tests
- 
- endif
-+
-+if WITH_EXAMPLES
-+
-+SUBDIRS += examples
-+
-+endif
-diff --git a/configure.ac b/configure.ac
-index 57c99a8..90a6324 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -164,6 +164,12 @@ then
- 	fi
- fi
- 
-+AC_ARG_ENABLE([examples],
-+	[AS_HELP_STRING([--enable-examples], [enable building code examples[default=no]])],
-+	[if test "x$enableval" = xyes; then with_examples=true; fi],
-+	[with_examples=false])
-+AM_CONDITIONAL([WITH_EXAMPLES], [test "x$with_examples" = xtrue])
-+
- AC_ARG_ENABLE([bindings-cxx],
- 	[AC_HELP_STRING([--enable-bindings-cxx],
- 		[enable C++ bindings [default=no]])],
--- 
-cgit 1.2.3-1.el7
-
diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index 969ff4b8fab2..24bcfafc6c73 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  ae280f697bf035a1fb780c9972e5c81d0d2712b7ab6124fb3fba24619daa72bc  libgpiod-1.6.5.tar.xz
+sha256  7e3bff0209d75fbca2e9fcff1fd5f07cc58b543e129e08b6d4bb1e4a56cfec0d  libgpiod-2.2.2.tar.xz
 # Hash for license file
-sha256  ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
+sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index f669643b3941..1dee09c77db6 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD_VERSION = 1.6.5
+LIBGPIOD_VERSION = 2.2.2
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
