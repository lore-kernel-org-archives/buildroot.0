Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB27BC25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D28D606EC;
	Thu,  9 May 2024 20:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xrf-uZGp00wi; Thu,  9 May 2024 20:59:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80FD76131B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80FD76131B;
	Thu,  9 May 2024 20:59:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F10A1BF2B0
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF5EC414A1
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FP4MUONUpi88 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:59:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=bobrofon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D91EB40491
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D91EB40491
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D91EB40491
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:59:11 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-51f174e316eso1652526e87.0
 for <buildroot@buildroot.org>; Thu, 09 May 2024 13:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715288349; x=1715893149;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nv0ZyBLq9Q3WUKvBgyaqSJaDFC6lmweXPnI8S1Nq4b8=;
 b=hYP5lBI2g/aYP8Cz0L16XKX/sKjBwHrq2s1jHkB7CHk5GC/D/pGcuwfNYvdTDn8zYP
 0/UV/TwmyXYS/HgxViZsxuMU3/2FuScdbjBnpAUYxQHRMigYaYpn1csy6UYesTp03icX
 tI7BYFeFwvxPKJfTzwhcoyG3idVJeR5xp0g9bxppSm7f0fQbEgmNopJ3vjtR/NhtJRJT
 E7MVfvlm5J8RK8yKJt//JwgL/pjxMwAhwef1kNlSqnyBLpBGeRxjFqU1u/jGjaTHtKAC
 Z0lCyz/lJk2GwKQtpXZ3R0k3lLqHnh4DTtVc9PM5fuSZH1P5/ei/ZKP4bONrPhFhWuD7
 o5Fw==
X-Gm-Message-State: AOJu0Yx7b22oNzXXV7rJ4o6Pft7Nj2YLBbSdphxJzNK7CgbvwbjvKzNL
 baWgOnac2iNLACMv/qQZzhx5qDMdwPlYIs0xJGrHBr65kbQzpjQJkQehxg==
X-Google-Smtp-Source: AGHT+IGLGfU1pkILEOuXnlUvNMxLYXFbKZ7fcCtir8KcSlvMdE9wgeLp0Fnl6MrAIT0IaTLV6lbz8Q==
X-Received: by 2002:ac2:4c38:0:b0:519:74fd:4231 with SMTP id
 2adb3069b0e04-5220ff72ebdmr397725e87.57.1715288349175; 
 Thu, 09 May 2024 13:59:09 -0700 (PDT)
Received: from nibiru.. ([2a00:1370:8186:6f6:6002:f5e4:e57a:6263])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d33adsm440262e87.144.2024.05.09.13.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 13:59:08 -0700 (PDT)
From: Sergey Bobrenok <bobrofon@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 May 2024 23:58:49 +0300
Message-ID: <20240509205849.816682-1-bobrofon@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715288349; x=1715893149; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nv0ZyBLq9Q3WUKvBgyaqSJaDFC6lmweXPnI8S1Nq4b8=;
 b=Lz4bJsZ17WEeYOJnhAB3VsoFbwA0c2wuL8/Aomb/SegehB4p8VlX/VU7csm4wTMyKJ
 g04nuU4wxwYu7GtwsAh2aObAPefjNd9PsRvTF7DtQM1Ya5kmX6S329rZtgAvnNr84IKv
 GIrMo7INWS7q55Ne3sNYCTTUyZirvAV6TQ5lp/5IeNcfQ0FGHvFrEHDk0jAv6nUz6kCo
 EJME/5iPEUyszj10INu+wOkEtBgQ+7aOa6ojVAy1m8lmxWz5TkJ1wTon278NB+DiKlQ/
 CC4xcxpl6uOk50AYMvFXnpHpKXq95CRo4cZ0znsHgF9ey5pHCIFdtYVbsfmhnU9sQfJf
 aEIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Lz4bJsZ1
Subject: [Buildroot] [PATCH 1/1] package/sdbus-cpp: fix required gcc version
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

Since bump to version 2.0.0 in commit
0f5bb364c629dd7fc91f4295f872e46d89c0feef sdbus-cpp package requires
designated initializers support (C++20 feature), and fails to compile
with gcc < 8:

/home/buildroot/autobuild/run/instance-2/output-1/build/host-sdbus-cpp-2.0.0/src/Proxy.cpp: In member function 'virtual sdbus::Slot sdbus::internal::Proxy::callMethodAsync(const sdbus::MethodCall&, sdbus::async_reply_handler, uint64_t, sdbus::return_slot_t)':
/home/buildroot/autobuild/run/instance-2/output-1/build/host-sdbus-cpp-2.0.0/src/Proxy.cpp:146:90: sorry, unimplemented: non-trivial designated initializers not supported
                                                                       , .floating = true });

Fixes: 0f5bb364c629dd7fc91f4295f872e46d89c0feef
 - http://autobuild.buildroot.net/results/1764ce0d48b390e430d2d8f54388013d3700e9d7

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
---
 package/sdbus-cpp/Config.in      | 6 +++---
 package/sdbus-cpp/Config.in.host | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sdbus-cpp/Config.in b/package/sdbus-cpp/Config.in
index 85f149eaa1..010efaafcf 100644
--- a/package/sdbus-cpp/Config.in
+++ b/package/sdbus-cpp/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_SDBUS_CPP
 	bool "sdbus-c++"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_SYSTEMD
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++20
 	help
 	  sdbus-c++ is a high-level C++ D-Bus library for Linux
 	  designed to provide expressive, easy-to-use API in modern C++.
@@ -11,6 +11,6 @@ config BR2_PACKAGE_SDBUS_CPP
 
 	  https://github.com/Kistler-Group/sdbus-cpp
 
-comment "sdbus-c++ needs systemd and a toolchain w/ C++, gcc >= 7"
+comment "sdbus-c++ needs systemd and a toolchain w/ C++, gcc >= 8"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_SYSTEMD || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/sdbus-cpp/Config.in.host b/package/sdbus-cpp/Config.in.host
index d62a65ae84..024a2e9a9c 100644
--- a/package/sdbus-cpp/Config.in.host
+++ b/package/sdbus-cpp/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_SDBUS_CPP
 	bool "host sdbus-c++"
-	depends on BR2_HOST_GCC_AT_LEAST_7
+	depends on BR2_HOST_GCC_AT_LEAST_8 # C++20
 	help
 	  sdbus-c++ is a high-level C++ D-Bus library for Linux
 	  designed to provide expressive, easy-to-use API in modern C++.
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
