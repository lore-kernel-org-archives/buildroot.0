Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D2CC47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 13:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62F2B82848;
	Sun, 28 Jan 2024 13:22:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62F2B82848
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RYDyqQKbtjvU; Sun, 28 Jan 2024 13:22:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89B7A827F3;
	Sun, 28 Jan 2024 13:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89B7A827F3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56DA41BF863
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3CF3607B4
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 13:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3CF3607B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jSVk6_KXSeG for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 13:21:03 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7114C60810
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 13:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7114C60810
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40ef64d8955so1510505e9.3
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 05:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706448061; x=1707052861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1opql86WpAnvhUKrm+LC9cUWQtAw2guG9NR+Lr5RN48=;
 b=rqzCF2wwb7U4PRiNeQCbKLdcYcEglQ3XfetVtji/sQz74qLpRoajFfjtMJkib51b0O
 JF/f+QoAkwFaWVQ1HfVaqEH+Yp2jg9nB+9us6bPu3BdsRdTY0ew5Ys+WMNpKsp9P0/k/
 isPUKSHWqxS0AXNFLrDIHgoy8qdRwK6JMREaiYoLL/KMdDr884iqJDX7LTd6PhtNQiH6
 FCGi0VMru62XRopMYV4Eqtv0+HNVfvbgP/+HkmthXCnoLiuhMgbVbRPuRk/59HGvq25w
 fk8KYqk80q9NK5BmJyySyRTcT658x3j8O71L6cFSBjT+z3cyS8B0g2aXVn3dTzh3ar3g
 1CGQ==
X-Gm-Message-State: AOJu0YwOwhBy+39p1dNKdlO0Y1g6BS2iv94HBJ36sE0hUFEKdq9rGZXb
 yg01LM0FUZKjaLHtTmenCw4g3qT4OW5emBZAcMknCWydg5eiSAL95vmP/+LN
X-Google-Smtp-Source: AGHT+IGelCdMbCHCNOrTCadFlYtX6KROwu+8vYT/DXyPFWRmwZhaaPSsKL71re0R6vwXy59etoLrEw==
X-Received: by 2002:a05:600c:444b:b0:40e:a3aa:a458 with SMTP id
 v11-20020a05600c444b00b0040ea3aaa458mr3087888wmn.27.1706448061302; 
 Sun, 28 Jan 2024 05:21:01 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 bv25-20020a0560001f1900b0033aec64ba7dsm747778wrb.78.2024.01.28.05.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jan 2024 05:21:01 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 28 Jan 2024 14:20:53 +0100
Message-ID: <afdc6d0fddd8f45aea24b544612a680bfa241475.1706448055.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706448055.git.yann.morin.1998@free.fr>
References: <cover.1706448055.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706448061; x=1707052861; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1opql86WpAnvhUKrm+LC9cUWQtAw2guG9NR+Lr5RN48=;
 b=JAdm/Cf2BS4eh5YvROCx+jNFR9ZB9kPh86HBwrmrXbCc3TwbxUFmu9t5tX+NCiRt2y
 IVmJVgKHCHKpv3BJqGrs0VSytD5hfrdHdb5MM4+BoBbW0IgevGALpBDsddjyJwX6MEJK
 DssNDA+zoqRpT9vYrS6heleksPwKZUaU3b2hag/ycjNb43o7lQc8XKxtNgg/CYNfmCzL
 LDWtCaHPWjtMBb/Ye/aXiM4nkbdX6AHI/tCrTbcVBPgCdpkT3OuMY07wnHnR50eKC0nl
 6sko25MSJpH9dLInQ8GIBQEq5A7AUa/lijz4HLeQdGu/a+a6frWRzbobZ8fuy0pzTkUh
 SG3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JAdm/Cf2
Subject: [Buildroot] [PATCH 04/10] package/re2: propagate dependencies from
 libabseil-cpp
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit fc7606010e4e (package/re2: bump to version 2023.11.01) forgot to
propagate the arch dependency from libabsel-cpp to re2, and transitively
to its dependees, causing unmet dependencies warnings (unfortunately,
not errors), such as:

    $ KCONFIG_SEED=0xCCB17344 make randconfig
    WARNING: unmet direct dependencies detected for BR2_PACKAGE_LIBABSEIL_CPP
      Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && !BR2_STATIC_LIBS [=n] && BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS [=n]
      Selected by [y]:
      - BR2_PACKAGE_RE2 [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y]

Fix that, and propagate the dependency.

Note that qt5webengine depends on glibc, so that implies !static
already.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Julien Corjon <corjon.j@ecagroup.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/grpc/Config.in             | 2 +-
 package/qt5/qt5webengine/Config.in | 1 +
 package/re2/Config.in              | 8 ++++++--
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/grpc/Config.in b/package/grpc/Config.in
index ef3e1c86cb..7664948b40 100644
--- a/package/grpc/Config.in
+++ b/package/grpc/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_GRPC
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, re2
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libabseil-cpp, re2
-	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp
+	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp, re2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	select BR2_PACKAGE_C_ARES
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index cfa5893f41..8f40547310 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
 	depends on !BR2_BINFMT_FLAT # qt5base-icu
 	depends on BR2_USE_MMU # libglib2, qt5base-dbus
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # re2
 
 comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 8, host gcc >= 4.9, threads, wchar"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
diff --git a/package/re2/Config.in b/package/re2/Config.in
index 0ac0041f6d..c3337bbb2e 100644
--- a/package/re2/Config.in
+++ b/package/re2/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_RE2
 	bool "re2"
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # libabseil-cpp
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # libabseil-cpp
 	select BR2_PACKAGE_LIBABSEIL_CPP
 	help
 	  RE2 is a fast, safe, thread-friendly alternative
@@ -12,7 +14,9 @@ config BR2_PACKAGE_RE2
 
 	  https://github.com/google/re2
 
-comment "re2 needs a toolchain w/ C++, threads, gcc >= 8"
+comment "re2 needs a toolchain w/ C++, threads, gcc >= 8, dynamic library"
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
+		BR2_STATIC_LIBS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
