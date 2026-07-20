Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9F1C44520
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 12:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9214180766;
	Mon, 20 Jul 2026 12:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 60LUN4h75QPb; Mon, 20 Jul 2026 12:22:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BAE180B83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784550134;
	bh=eAMvRHfuea3vrvZ+IAMbHt93hCjhUDfBpvo6wEkgEjg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TgYuYy4Oq5snQEZwKk/Buyy9pGEUe7a30P2zpekH8WuLU4GwPzbO7N55zyRk8/czc
	 Dpc37kgPvdllveGBJGShn9cjhIV8t8MXdrzlq7XwlOFmX9zK/4Nj0/A8S/5YL0zQ91
	 EJWSGVyuTwlgDcybR/kHc2JFSzCpE9vZa69p6VBhEtozB4qOTvKgyANb16pDuu/9KC
	 YSYkWm4aVdMWcgbuqbWDmS7dX0J+7YLb4nI9U13WNeXCy2SzOMYwU1MOfm/W4veocR
	 ZERu7zSUvn5h3WA/KtKpHTdyrlGN/A8zpY6OHMg6CNzPUzkcwFwIzi/FWfxYmh1g7K
	 dT+2vuAphkjDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BAE180B83;
	Mon, 20 Jul 2026 12:22:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74144206
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 12:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6257540105
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 12:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDm67NqwFaMU for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 12:22:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8FD4E40079
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FD4E40079
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FD4E40079
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 12:22:10 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-472326ca506so7743509f8f.2
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 05:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784550128; x=1785154928;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GPtuZGmNp0vMqVutznIZauQW3df3RYORWJjYYgsVI9w=;
 b=D0MRAq81JhYoSOxCgyTBO8ggS8VINfPcI68bldaghHm+66XlUXnuP1gYMCyLtxt/xJ
 E98nuxwd8OaAeeHBd1rpqpSuqLv0+vyWewfVjl/KIsI4AQlZ0GcLIspxbFFzRmXhPkow
 rnO9Q2YDAIRi8/67c21firQ0HTVLYCiSLd7+g6klCbgGdqwOEkANSwYQL1Rhdh3Qfmjm
 CLFcbW+SPHPM9e2/FXJ9d8FMyNg3LBfAg/8tEpxVf664jb7i48q/8LBS7Di2TekIgg5+
 DQz7nCX0TAzK42BtWmHEq+m3Iy8YEbFrKCzuCRH+dr8GTTDU68H6rBXfinvD2P6K+2xV
 vzSg==
X-Gm-Message-State: AOJu0Yw756PI7EZH87aq5xUxdz3OqLuLd608ETSvvcxcDNmvADIOCPxQ
 DS00KHSx5tdmNZcQSqnIJ1QYb5pL1J+y2OfOTX65F1FYzl3h/EENNR6Mum4wUyA/0yKwdHepdFV
 N3lBsaO4=
X-Gm-Gg: AR+sD10M/aXRXQ3ArBaoSBwSxzwvu23D1xKUXil0P6sCTxLOcxXV3A0UPQNkn3Sy1Cq
 NP/XRjU/sK4VIwkeYvmHm0fZt4mZM1+QY3OXo/6tpkVO5IwZCcALAW+a1BiX8DnO6fPZ7bQXP+m
 0CqRmY5DB8iVUAuuIwNYtKw5iWTDzDLcjxKOSIZyfwF2lD56JUO+ZnBS+eOtIqv7Z+A8BoAXtXA
 7VhW4V6ceM0ktrFUfvUtsujOPAlJwG9+I0NtcQ2QC/lSRp6BSdd4pkfL1Veu+4XSoNnntt5aOuY
 jhMKyI1wjBsWy4BXjuQqeWwQ0KCR4N5QTrMSCEcanZURruFTfI88vtopuJMfAC9AmJGpcDIV6eU
 E30jTX8xePQ8BldDFgQl7ffRss5SNqX+kY3LDm9yFQedGzpNuheCEMjJ2AH1wljW2g4DT5GNFoB
 RX7uFtbddR+r+xZybbcWQIIODJbL/ej4PZwG9QzshfvsWTcr3Md4Z97L1ZYHZnXna6MGy+nqNuQ
 0Vgcu0OQLIDMiRCOCxUZC7waLN8OaDILaaOKz4O1C4YNLXsXEyUMhG12ELl/8AI1r9TFrxF/cmV
 AQUYBGostB7SOWKQjqPCft+L
X-Received: by 2002:a05:6000:4b1d:b0:462:ce05:c5e4 with SMTP id
 ffacd0b85a97d-47f62326d48mr17598905f8f.37.1784550128339; 
 Mon, 20 Jul 2026 05:22:08 -0700 (PDT)
Received: from rcc-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 ([95.236.1.245]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63e49ce4sm30315657f8f.8.2026.07.20.05.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 05:22:07 -0700 (PDT)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Date: Mon, 20 Jul 2026 14:22:02 +0200
Message-ID: <20260720122202.3073325-1-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1784550128; x=1785154928;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GPtuZGmNp0vMqVutznIZauQW3df3RYORWJjYYgsVI9w=;
 b=HySH+IMUfhmslUr26fQEYKcX+tkHhCfkGUUIShTD6kG29hDZhtYwSy+4i0QVpdLjPV
 vGxBIA/xdWpLfSK+/ilRUjlq/3pveFNht0wQQ93Ci1lA5mWxAQ9V2yMEthtXAI3cbfhA
 Y4dlRFaltblKUvrUpcaWAci/a90Qx6WLnIYK4=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=HySH+IMU
Subject: [Buildroot] [PATCH v3] package/libcppconnman: add new package
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

libcppconnman is a C++ library that provides an easy-to-use API
to communicate with ConnMan over D-Bus using GDBus.

https://github.com/amarula/libcppconnman

Also add myself to DEVELOPERS for this package.

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
Changes v2 -> v3:
  - Config.in: add BR2_TOOLCHAIN_GCC_AT_LEAST_10 dependency (C++20 / <ranges>),
    fixing build failures on GCC < 10 toolchains reported by the autobuilders
  - Config.in, libcppconnman.mk: select and depend on readline for the example,
    fixing the missing readline library configure error when examples are enabled

Changes v1 -> v2:
  - add missing libcppconnman entry in package/Config.in
  - merge the DEVELOPERS addition into this patch

 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/libcppconnman/Config.in          | 28 ++++++++++++++++++++++++
 package/libcppconnman/libcppconnman.hash |  3 +++
 package/libcppconnman/libcppconnman.mk   | 25 +++++++++++++++++++++
 5 files changed, 58 insertions(+)
 create mode 100644 package/libcppconnman/Config.in
 create mode 100644 package/libcppconnman/libcppconnman.hash
 create mode 100644 package/libcppconnman/libcppconnman.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 42418d01a2..997fd6be74 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -186,6 +186,7 @@ F:	package/wine/
 
 N:	Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
 F:	package/cutekeyboard/
+F:	package/libcppconnman/
 
 N:	Andreas Klinger <ak@it-klinger.de>
 F:	package/ply/
diff --git a/package/Config.in b/package/Config.in
index 015f635ad1..fc1e57d30d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2007,6 +2007,7 @@ menu "Networking"
 	source "package/ibrdtn/Config.in"
 	source "package/libcgicc/Config.in"
 	source "package/libcoap/Config.in"
+	source "package/libcppconnman/Config.in"
 	source "package/libcpprestsdk/Config.in"
 	source "package/libcurl/Config.in"
 	source "package/libdnet/Config.in"
diff --git a/package/libcppconnman/Config.in b/package/libcppconnman/Config.in
new file mode 100644
index 0000000000..d99d711e25
--- /dev/null
+++ b/package/libcppconnman/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_LIBCPPCONNMAN
+	bool "libcppconnman"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  libcppconnman provide easy to use C++ API to communicate
+	  with ConnMan via the DBus using GDBus.
+
+	  https://amarula.github.io/libcppconnman/
+
+comment "libcppconnman needs a toolchain w/ C++20, wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+
+if BR2_PACKAGE_LIBCPPCONNMAN
+
+config BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE
+	bool "libcppconnman example"
+	select BR2_PACKAGE_READLINE
+	help
+	  Compile CLI example.
+
+endif
diff --git a/package/libcppconnman/libcppconnman.hash b/package/libcppconnman/libcppconnman.hash
new file mode 100644
index 0000000000..70960d4a17
--- /dev/null
+++ b/package/libcppconnman/libcppconnman.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  5eb38232c3f9fcf2136c6508472841f6ee88d7155c384f4e6f2f3de1cd2fba62  libcppconnman-2.0.0.tar.gz
+sha256  7ffe1954587c77dfba1cf8eb9b2ea743671fa6e63f9e7a2f258119d42e14eefe  LICENSE
diff --git a/package/libcppconnman/libcppconnman.mk b/package/libcppconnman/libcppconnman.mk
new file mode 100644
index 0000000000..1b41db3a0c
--- /dev/null
+++ b/package/libcppconnman/libcppconnman.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# libcppconnman
+#
+################################################################################
+
+LIBCPPCONNMAN_VERSION = 2.0.0
+LIBCPPCONNMAN_SITE = $(call github,amarula,libcppconnman,v$(LIBCPPCONNMAN_VERSION))
+LIBCPPCONNMAN_LICENSE = LGPL-2.1-or-later
+LIBCPPCONNMAN_LICENSE_FILES = LICENSE
+
+LIBCPPCONNMAN_INSTALL_STAGING = YES
+
+LIBCPPCONNMAN_DEPENDENCIES = host-pkgconf libglib2
+
+LIBCPPCONNMAN_CONF_OPTS = -DBUILD_CONNMAN=ON
+
+ifeq ($(BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE),y)
+LIBCPPCONNMAN_DEPENDENCIES += readline
+LIBCPPCONNMAN_CONF_OPTS += -DBUILD_EXAMPLES=ON
+else
+LIBCPPCONNMAN_CONF_OPTS += -DBUILD_EXAMPLES=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
