Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F9DC27C54
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 15:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B75C405C6;
	Thu,  6 Jun 2024 15:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KDtghxkarhF; Thu,  6 Jun 2024 15:49:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22CF3405CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22CF3405CA;
	Thu,  6 Jun 2024 15:49:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA4451BF584
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 15:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3E77401DF
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 15:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hl-rWIwAj-E0 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 15:49:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=bobrofon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE89D401CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE89D401CC
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE89D401CC
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 15:49:34 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52b936c958dso1349833e87.0
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 08:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717688972; x=1718293772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KBK/j/uR3KdlU99n9FKZOAJCGmFGK00x256GeKK2iNM=;
 b=Roah+4eHQfJ/JPlKAiQscqAL4Mkcn051Y8iJGcPYco5Xdu77WiWTrCykEAUs9nUpIM
 8+QXJxpRELSnYa2JL0LuOOMx6AcYmMrJ0M7h4PyPgmBTDiXsyZ8pVmTG519FRCTUYliO
 rtQPXV/d+4Hm+L+1RKYemVIoJAbjQ0L/9hxjH8qmqUO8BuKxSkKfh5K3lpAhg91DH8Zm
 N7ur8J+t1magBmqCZrGkNVfEJcDZpUw/pmSOZdfGLdZXEsvtNd9gDbY4FWXLKtKf8W2R
 PITUxMWrEQDYJL9wgzr/y0YJkmNzEW1bovH8MXczrgrZ+eXJemda4O7Bkgx2XtXYfSXs
 vSfQ==
X-Gm-Message-State: AOJu0YyZxYD/UK5479ht2OCj2FHfKjLoN7ezBQz6cHzMiaJHT6RUSk3p
 VKQd470tkNyppZvg3t8HffCKvahByxK55w5JFFIUEq4Ul40x+E/VIZVnPbBq
X-Google-Smtp-Source: AGHT+IEgyITJ/gC8X1IZfZ/LwIFKO+AIYjBzgyg9RQBx2Xr5QO4VsdwA4IywKlbatWeNyTkSriF/EA==
X-Received: by 2002:a05:6512:10c9:b0:52b:9c8a:7355 with SMTP id
 2adb3069b0e04-52bb9fc956cmr2798e87.52.1717688971534; 
 Thu, 06 Jun 2024 08:49:31 -0700 (PDT)
Received: from nibiru.sberdevices.ru ([212.164.65.15])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bb434da3bsm229538e87.294.2024.06.06.08.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jun 2024 08:49:31 -0700 (PDT)
From: Sergey Bobrenok <bobrofon@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jun 2024 18:49:20 +0300
Message-ID: <20240606154920.1571261-1-bobrofon@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717688972; x=1718293772; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KBK/j/uR3KdlU99n9FKZOAJCGmFGK00x256GeKK2iNM=;
 b=AjJlPrnO24Gyxgi7CVDT6fjyJxEc8YuWMHVG7yuRdQvY5srHcSr89Cf+UE/6+wpo4Q
 6LUeMevmaF6dpqaituNAJzAXY/zrrcO3CsxhvaDsQtfk/3QUzg3JHsmR6G66lC8e8ImM
 NI5s5Fpcn7MTIv9TG4Fb+l5ZZRe8kx4YIVc6TMfhDZ8mxymYA9aS5Y7mBfD4mtEXGCFh
 vV4WWp5d1//EDNxH1U2pAXQgNzMzgiMJnvVIrzY/boVbwnCNGuOrVBPvj1Qe8nmqLLms
 YfrFydzb8l5eQ1zSPYizkU4S6ld/wsLNxsCoO+reQeHqKqH+Zlpq/3QzwdQejkbw5814
 ljlw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AjJlPrnO
Subject: [Buildroot] [PATCH 1/1] package/sdbus-cpp: use basu on systems
 without systemd
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Sergey Bobrenok <bobrofon@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since version 1.4.0, sdbus-cpp supports building with basu library
instead of libsystemd and can be used on systems without systemd.

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
---
 package/sdbus-cpp/Config.in    | 22 +++++++++++++++++++---
 package/sdbus-cpp/sdbus-cpp.mk | 10 +++++++++-
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/package/sdbus-cpp/Config.in b/package/sdbus-cpp/Config.in
index 010efaafcf..f7e5dcc7c6 100644
--- a/package/sdbus-cpp/Config.in
+++ b/package/sdbus-cpp/Config.in
@@ -1,8 +1,14 @@
 config BR2_PACKAGE_SDBUS_CPP
 	bool "sdbus-c++"
+	depends on BR2_USE_MMU # dbus
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_SYSTEMD
+	depends on BR2_USE_WCHAR || BR2_PACKAGE_SYSTEMD # basu
+	depends on BR2_ENABLE_LOCALE || BR2_PACKAGE_SYSTEMD # basu
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_PACKAGE_SYSTEMD # basu
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || BR2_PACKAGE_SYSTEMD # basu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++20
+	select BR2_PACKAGE_BASU if !BR2_PACKAGE_SYSTEMD
 	help
 	  sdbus-c++ is a high-level C++ D-Bus library for Linux
 	  designed to provide expressive, easy-to-use API in modern C++.
@@ -11,6 +17,16 @@ config BR2_PACKAGE_SDBUS_CPP
 
 	  https://github.com/Kistler-Group/sdbus-cpp
 
-comment "sdbus-c++ needs systemd and a toolchain w/ C++, gcc >= 8"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_SYSTEMD || \
+comment "sdbus-c++ needs systemd and a toolchain w/ C++, threads, gcc >= 8"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_SYSTEMD
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
+comment "sdbus-c++ needs a toolchain w/ C++, wchar, locale, threads, headers >= 3.17, gcc >= 8"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_PACKAGE_SYSTEMD
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index 2994f079c9..bcac802162 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -7,10 +7,18 @@
 SDBUS_CPP_VERSION = 2.0.0
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
-SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
+SDBUS_CPP_DEPENDENCIES = host-pkgconf
 SDBUS_CPP_LICENSE = LGPL-2.1+ with exception (headers)
 SDBUS_CPP_LICENSE_FILES = COPYING COPYING-LGPL-Exception
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+SDBUS_CPP_DEPENDENCIES += systemd
+SDBUS_CPP_CONF_OPTS += -DSDBUSCPP_SDBUS_LIB=systemd
+else
+SDBUS_CPP_DEPENDENCIES += basu
+SDBUS_CPP_CONF_OPTS += -DSDBUSCPP_SDBUS_LIB=basu
+endif
+
 # Host build for sdbus-c++-xml2cpp
 HOST_SDBUS_CPP_DEPENDENCIES = host-pkgconf host-systemd
 HOST_SDBUS_CPP_CONF_OPTS = \
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
