Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06CFCCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 18:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DDBB84EA0;
	Sun,  2 Nov 2025 18:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M7xVeZomXV3e; Sun,  2 Nov 2025 18:54:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73D0084F31
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73D0084F31;
	Sun,  2 Nov 2025 18:54:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A3EF2A3
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 18:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F152684F31
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 18:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YBdmUghei-sP for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 18:54:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7012484EA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7012484EA0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7012484EA0
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 18:54:16 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b3d196b7eeeso755196866b.0
 for <buildroot@buildroot.org>; Sun, 02 Nov 2025 10:54:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762109654; x=1762714454;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K+KdoFAoQ/m9RRk+cZQxWOCld3GsMltilyt2AJhNt5s=;
 b=SXYLlNkDbHbe02EgyiS19jtavvUpztdJUDMuZhOL9c0cvGfk5pliOBkxWomPttxr0e
 E9uU1k5fkxgVCW3Zj3htUgpPHiRGTBuVmHXi3rqylwYHWLWMCG3BcuT6CxV6hFUw6Iem
 ezFUpMaxTK+Kpvqf6tjDObS2opvH2r4HzdOlY9RboiyKJTXNVggAdm4WN7JqXuUKFMLV
 Sw5Dk5jt2+FGQOrkzaD6HZpChQI/DU9ea5Akr9R8r76Z6/wQOG+Zi5JkLRSvro3jqFQ/
 II/MkTqIOWO/rOOkElcq73ymsptPSQ2JsqGyt2QtyMAHBWFvr4d0NwSI6gxp79RUgJWd
 56aA==
X-Gm-Message-State: AOJu0YxBuN8nyAk9/iQsOpEk5gmQivziSr8EMSbPCC51DQr9zkbuBrSh
 iBOyIGaLNCY8dOFNuwvGrjEGwKYTKl7qn7IKcOaXsxpsp/eQtw1FJkKr6p0JPuGjBiKxqfN82j+
 pY4Qy
X-Gm-Gg: ASbGnctKG/EUnAC6+aDlkSOrOw2HdKhjH2KtunYLODiSJokgUEgfFij1X3mUpwZv8Gb
 QPm48C8EvXhCtRWOjeMrm0IEnI+iN+GWLLGGzDwDg9CwQ9dU2U8SeqNyQkVZW61S0cSEEjNLBSp
 81YMA9Po028Obd7m48Kfd7KHJiNpYxsqyBYH4pR3TykBfIrdXksTHa0qgYC73mYaeAFIcOoc/oa
 VtsJdv5AmncW5ZnlBK9kYXgdvhFdLGBBN5wDaqoSR6ihluW5+Xoq99iqao0PWjuOGDXmrCIfgnt
 oNiDomYjMw53nMGdSNJc1OilALFuK0NFnZ+IuC8tE4Hz1RZdOibo+PF1f3cfqxZREfIwW+7Xq3C
 jJoeAca5PTaC7eMUTr9nEKFlHtADHGMKxLQYVO21+LP6zJfE18vfW9ew0wJzv1Hn96ODW5bDz4V
 ynm93/Da/cEYlMJ7/Y+lOfBh9gEv8mjpYtjIBCEt/zrE/JMDXqeok5lrGRwKYsyAbE1cttNsyIg
 cloOw==
X-Google-Smtp-Source: AGHT+IEsUgEFvdMOFoeMVJnbORC0hrIOA/+y102eJL+MJUQGTdyWYjpRcXgX/Ol7XZPevyRxXkW95A==
X-Received: by 2002:a17:906:811:b0:b70:aac5:c163 with SMTP id
 a640c23a62f3a-b70aac5c773mr256485466b.24.1762109653850; 
 Sun, 02 Nov 2025 10:54:13 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 ([87.13.6.75]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b70776a327esm808441366b.0.2025.11.02.10.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 10:54:13 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Mario Lang <mlang@blind.guru>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun,  2 Nov 2025 19:54:09 +0100
Message-ID: <20251102185409.1169454-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762109654; x=1762714454;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K+KdoFAoQ/m9RRk+cZQxWOCld3GsMltilyt2AJhNt5s=;
 b=aRyzxKBdCel7M2MlWXWypNMv8BsfGB8+kG5uIgK0Ad//Sr0+NuBP2eKIDL6LAlSYlk
 uh3q7hwF28B37Y8/gPfwOQdteNioLRlgfs+emvGRullBXXsvP50PppZJ2oFfLGHccqAB
 ijyEJERXlaNzO2D6es3Dn8KqwS46BqMDmSv5k=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=aRyzxKBd
Subject: [Buildroot] [PATCH v2] package/brltty: bump to version 6.8
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

Commit [1] has made ncurses a requirement for building the package.

The added patch fix the following build error:

/usr/bin/install -c -d ../../../lib
buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-gcc -shared   -Wl,-export-dynamic -o ../../../lib/libbrlttyxfv.so screen.o -ltinfo
buildroot/output/host/lib/gcc/arm-buildroot-linux-gnueabihf/14.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: cannot find -ltinfo: No such file or directory
collect2: error: ld returned 1 exit status

git format-patch -M -n -s -o outgoing origin/master
Update README hash:
- v6.8:
  - Update the copyright from 2024 to 2025.
- v6.7:
  - Update the supported braille devices lists.
  - Add support for the HIMS eMotion.
  - Add support for HT's Activator Pro models.
  - Add support for the KGS Next Touch 40.
  - Change the copyright from 2023 to 2024.
  - Document that HT's Basic Braille Plus models are supported.

Release notes:
https://github.com/brltty/brltty/blob/BRLTTY-6.8/Documents/ChangeLog

[1] https://github.com/brltty/brltty/commit/8f7d65569ef77eec8b8e4b97e68cb5689cf57ef9
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

Changes v1 -> v2:
- Set ncurses as a requirement for building the package.

 ...k-fv-driver-with-ltinfo-only-if-avai.patch | 58 +++++++++++++++++++
 package/brltty/Config.in                      |  1 +
 package/brltty/brltty.hash                    |  4 +-
 package/brltty/brltty.mk                      |  9 ++-
 4 files changed, 67 insertions(+), 5 deletions(-)
 create mode 100644 package/brltty/0002-configure.ac-link-fv-driver-with-ltinfo-only-if-avai.patch

diff --git a/package/brltty/0002-configure.ac-link-fv-driver-with-ltinfo-only-if-avai.patch b/package/brltty/0002-configure.ac-link-fv-driver-with-ltinfo-only-if-avai.patch
new file mode 100644
index 000000000000..121237ee4987
--- /dev/null
+++ b/package/brltty/0002-configure.ac-link-fv-driver-with-ltinfo-only-if-avai.patch
@@ -0,0 +1,58 @@
+From a4f55ee941fdc94511c72c1831dedcf5bea7935d Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Thu, 30 Oct 2025 16:52:53 +0100
+Subject: [PATCH] configure.ac: link fv driver with -ltinfo only if available
+
+During the brltty bump to version 6.8 in Buildroot, the build failed on
+systems without libtinfo:
+
+  /usr/bin/ld: cannot find -ltinfo: No such file or directory
+
+Link libtinfo only if the library is present.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/brltty/brltty/pull/503
+---
+ configure.ac | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 68c9c6d1b7f5..5c931f71b79a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -813,6 +813,7 @@ BRLTTY_ARG_ENABLE(
+ ])
+ AC_SUBST(fuzzer_libs)
+ 
++have_tinfo="no"
+ brltty_curses_libs_save="${LIBS}"
+ BRLTTY_PACKAGE_CHOOSE([curses],
+    [ncursesw ncursesw/ncurses.h],
+@@ -823,8 +824,10 @@ BRLTTY_PACKAGE_CHOOSE([curses],
+    [pdcurses curses.h])
+ if test -n "${curses_package}"
+ then
+-   AC_CHECK_LIB([tinfo], [intrflush])
++   AC_CHECK_LIB([tinfo], [intrflush],
++                [have_tinfo="yes"])
+ fi
++
+ curses_libs="${LIBS%${brltty_curses_libs_save}}"
+ LIBS="${brltty_curses_libs_save}"
+ AC_SUBST([curses_libs])
+@@ -1882,7 +1885,11 @@ in
+       ;;
+ esac
+ 
+-BRLTTY_SCREEN_DRIVER([fv], [FileViewer], [-ltinfo])
++if test "${have_tinfo}" = "yes"; then
++   BRLTTY_SCREEN_DRIVER([fv], [FileViewer], [-ltinfo])
++else
++   BRLTTY_SCREEN_DRIVER([fv], [FileViewer])
++fi
+ 
+ all_brltty_pty=""
+ install_brltty_pty=""
+-- 
+2.43.0
+
diff --git a/package/brltty/Config.in b/package/brltty/Config.in
index 3527df616138..70708df6c17e 100644
--- a/package/brltty/Config.in
+++ b/package/brltty/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_BRLTTY
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID if BR2_PACKAGE_BLUEZ5_UTILS && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # runtime
 	help
 	  A daemon providing access to the Linux console for a blind
diff --git a/package/brltty/brltty.hash b/package/brltty/brltty.hash
index 9b707fc1c29f..9b75e0023fc1 100644
--- a/package/brltty/brltty.hash
+++ b/package/brltty/brltty.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  ab11cfc5fbd7ef0ec876ffea7e131e424b2fd004b6158064e1a2e46412825529  brltty-6.6.tar.xz
+sha256  9f3c6dc2b65059d20f60836e8f9ebc58d8e518d6a8f8fee33e1d1e50ab43c3bc  brltty-6.8.tar.xz
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  LICENSE-LGPL
-sha256  72740317768530c60046c591160d4552afb3ac49657b04c7b8452c1bbe7b834e  README
+sha256  a9a8b3eef5f3e2b4716912a4ed60eca78a3f561515ed17ebe80348f2f033b395  README
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
index 22d58ebd00e3..5e24288cbb95 100644
--- a/package/brltty/brltty.mk
+++ b/package/brltty/brltty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BRLTTY_VERSION = 6.6
+BRLTTY_VERSION = 6.8
 BRLTTY_SOURCE = brltty-$(BRLTTY_VERSION).tar.xz
 BRLTTY_SITE = http://brltty.com/archive
 BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
@@ -17,6 +17,7 @@ BRLTTY_DEPENDENCIES = \
 	host-autoconf \
 	host-gawk \
 	host-pkgconf \
+	ncurses \
 	$(if $(BR2_PACKAGE_AT_SPI2_CORE),at-spi2-core)
 
 BRLTTY_CONF_ENV = \
@@ -37,8 +38,10 @@ BRLTTY_CONF_OPTS = \
 	--without-theta
 
 # Autoreconf is needed because we're patching configure.ac in
-# 0001-Fix-linking-error-on-mips64el. However, a plain autoreconf doesn't work,
-# because this package is only autoconf-based.
+# 0001-Fix-linking-error-on-mips64el and
+# 0002-configure.ac-link-fv-driver-with-ltinfo-only-if-avai.
+# However, a plain autoreconf doesn't work, because this package
+# is only autoconf-based.
 define BRLTTY_AUTOCONF
 	cd $(BRLTTY_SRCDIR) && $(AUTOCONF)
 endef
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
