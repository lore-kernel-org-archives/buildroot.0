Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A0AC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 13:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 304D9428C3;
	Sat, 20 Jan 2024 13:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 304D9428C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 797dVFpdwLod; Sat, 20 Jan 2024 13:28:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D9C942258;
	Sat, 20 Jan 2024 13:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D9C942258
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD2CF1BF276
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 13:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 946FC41E19
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 13:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 946FC41E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cv1VMXDXtwK1 for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 13:28:44 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 529A341D8E
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 13:28:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 529A341D8E
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e779f030aso9946375e9.0
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 05:28:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705757322; x=1706362122;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8LMQPONyxaKe7QHVlL9Tfqljc+VL/RGT9585qCEfNU0=;
 b=cWYT9VOLBDBndXUrNmAc/jA/PCqwdyvISVw22FWYNe7t94Nn/klqJYZxOsiu+T6BKo
 GGxOa2jcP0C2Vp2mwrsO/xIvaS9twJcz/Hq1YuxdNIq3MPkoN+Chmal9WHd86aWCcVf+
 W8+wYxT7hzUfoF17wtzl0mpc/dBbcW9xitILZUuynCUOisdCUOXZNot1UnioVHY4RCOx
 eT3a6IPlPE4YzyqNH12bUFSCDR3HYI73wrzB7G56XakafVhhLE2xrp+N152fwdBxn4eG
 pH8Avyrkg+whO4o/A2dnWtSshhAnTC9YlUmWSArorNXt5TfPlr17Uu8jG7xowt/euY3y
 6ESw==
X-Gm-Message-State: AOJu0YzyORKqY0j+2qQXOQcncqAryQMdpJAjDOeAk5K4i/xLRxRDwzLL
 D5PPuq/fq4K0IO7oc9D0V/0HqcTff5h3jYcQLEwyeO6UXv0i+hoRnfRJUWib
X-Google-Smtp-Source: AGHT+IHjIAiGEfljtHt8SFd17b3wWZiXIcYn1N8wF1DFFZ2wvOx3PKtSd+7gESHKPhvtg9ClzntlHw==
X-Received: by 2002:a05:600c:365a:b0:40e:47ad:7f3b with SMTP id
 y26-20020a05600c365a00b0040e47ad7f3bmr739025wmq.157.1705757321898; 
 Sat, 20 Jan 2024 05:28:41 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a05600c4f9600b0040e53f24ceasm32461235wmq.16.2024.01.20.05.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jan 2024 05:28:41 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 14:28:40 +0100
Message-ID: <20240120132840.3274187-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705757322; x=1706362122; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=8LMQPONyxaKe7QHVlL9Tfqljc+VL/RGT9585qCEfNU0=;
 b=PhdYRHO7hQznvYG7MXnLFXsU81REcXT6FOPe4d58rirY/dOd/zDsiNR1Tn+eTmdFjP
 7gvhh9vw3hh6U9qYrGxa2h4Ha4SRARo/D4EaqusUJVzOfbS6aSgoh32l2VOpvChJCi8X
 EVgw74x1uDWskgqyqQiXpjcK98MFfEG21XADVczO/BElmnQTAkFtK9kEUtwxGyayAy75
 EqvRMT32qAhCI0Y8Ce/wXVVJSVknkq3Tab7VdV+ZtDUwEkb9qR6pjCoebUlWs4UkJ3xd
 2UxE77oX3X3p1fV7kMy/7qGDYEz4c/Tal+RA+6D9sVaTfOPnxVx6bwdzI7B6PLGdoo7b
 Uhtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PhdYRHO7
Subject: [Buildroot] [PATCH] package/hiredis: do not install nuget packaging
 file
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The NuGet packaging description file is installed as:
    $(DEST_DIR)/build/native/hiredis.targets

This is a sprurious file that has nothing to do on a Linux system,
whether that be in host/, staging/, or target/.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ption-to-not-install-NuGet-packaging.patch | 51 +++++++++++++++++++
 package/hiredis/hiredis.mk                    |  4 +-
 2 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch

diff --git a/package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch b/package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch
new file mode 100644
index 0000000000..3997e78a07
--- /dev/null
+++ b/package/hiredis/0001-CMakeList-add-option-to-not-install-NuGet-packaging.patch
@@ -0,0 +1,51 @@
+From 3b7956ef4140df78cb65e253744782587e3b66e4 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sat, 20 Jan 2024 13:53:39 +0100
+Subject: [PATCH] CMakeList: add option to not install NuGet packaging
+
+The NuGet hiredis.target packaging description file is of no use on
+systems that are not using NuGet, like Linux systems, and the spurious
+presence of that file is not "clean".
+
+Add a cmake option to allow users to disable installation of that file.
+As some people may have relied on that file to be installed, continue to
+install it by default.
+
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+Upstream: https://github.com/redis/hiredis/pull/1246
+---
+ CMakeLists.txt | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b7d6ee8..0fcf29b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -6,6 +6,9 @@ OPTION(DISABLE_TESTS "If tests should be compiled or not" OFF)
+ OPTION(ENABLE_SSL_TESTS "Should we test SSL connections" OFF)
+ OPTION(ENABLE_EXAMPLES "Enable building hiredis examples" OFF)
+ OPTION(ENABLE_ASYNC_TESTS "Should we run all asynchronous API tests" OFF)
++# Historically, the NuGet file was always install; default
++# to ON for those who rely on that historical behaviour.
++OPTION(ENABLE_NUGET "Install NuGET packaging details" ON)
+
+ MACRO(getVersionBit name)
+   SET(VERSION_REGEX "^#define ${name} (.+)$")
+@@ -105,9 +108,11 @@ if (MSVC AND BUILD_SHARED_LIBS)
+         CONFIGURATIONS Debug RelWithDebInfo)
+ endif()
+
+-# For NuGet packages
+-INSTALL(FILES hiredis.targets
+-    DESTINATION build/native)
++if (ENABLE_NUGET)
++    # For NuGet packages
++    INSTALL(FILES hiredis.targets
++        DESTINATION build/native)
++endif()
+
+ INSTALL(FILES hiredis.h read.h sds.h async.h alloc.h sockcompat.h
+     DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/hiredis)
+--
+2.43.0
+
diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index a7a6d639e6..476b079336 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -12,8 +12,8 @@ HIREDIS_LICENSE_FILES = COPYING
 HIREDIS_CPE_ID_VENDOR = redislabs
 HIREDIS_INSTALL_STAGING = YES
 
-HIREDIS_CONF_OPTS = -DDISABLE_TESTS=ON
-HOST_HIREDIS_CONF_OPTS = -DDISABLE_TESTS=ON -DENABLE_SSL=OFF
+HIREDIS_CONF_OPTS = -DENABLE_NUGET=OFF -DDISABLE_TESTS=ON
+HOST_HIREDIS_CONF_OPTS = -DENABLE_NUGET=OFF -DDISABLE_TESTS=ON -DENABLE_SSL=OFF
 
 # Set CMAKE_BUILD_TYPE to Release or the libraries will be suffixed with "d"
 # resulting in build failures when linking.
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
