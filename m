Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D01AC4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 17:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 182E885089;
	Thu,  2 Nov 2023 17:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 182E885089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u24gGvQSsI3Q; Thu,  2 Nov 2023 17:11:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53B2A85090;
	Thu,  2 Nov 2023 17:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53B2A85090
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5EAE21BF380
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45108706A5
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45108706A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQpSXt4rbaGZ for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 17:11:26 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E9CB60C19
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 17:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E9CB60C19
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-32da7ac5c4fso699080f8f.1
 for <buildroot@buildroot.org>; Thu, 02 Nov 2023 10:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698945083; x=1699549883;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uocr2r4HY8nRCeq4e1bZV6090KsCc6rAgNVQtdOeP6k=;
 b=VfGTrUEr0qvl2G0xsU8RufvJM9OCAfGikHEIllov7hjQ84xw0gwQb2Y8yOPo0tYbcq
 06IijWLBKatT6Y9SggXisTK3gSbszr14ayco27q/nqJfseZwBqAAb9SxKLxTwCrk+Zpv
 8VLjAK+F86mgCPS65n/GXT2+Yj8fqC0m1yuZD63QjixN6jB+0YNTVLsaIxP7RoLRji31
 TVOnw6ClwA4VivOhNRx3SbW270PReVtKRP2K2GnP2aBjBfR3+L4YuRaxezl/kvVS5knt
 wZeC+SlvxbAMdKyWRwOE/thq2zRPP3pazhoHDUK5iWwo6u41/iuGQZit84vWKUx/y8e4
 kpSA==
X-Gm-Message-State: AOJu0YwJtBp9wqtrnmcc7gylwigli0bjCc+46ACmCiJRBbehbrcyVI/v
 l/YFq6qfGBJXqw9sX6E+szp6FnZU9V8=
X-Google-Smtp-Source: AGHT+IHm10Qq1DKmY7LLolxMwrFMlVl4x3EEgKxeHhsSbMgjEwUf7uAax6W8f1fsIiTQSuD++eOFOQ==
X-Received: by 2002:a5d:65d2:0:b0:32d:9b32:8a7e with SMTP id
 e18-20020a5d65d2000000b0032d9b328a7emr12516163wrw.71.1698945083067; 
 Thu, 02 Nov 2023 10:11:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d14-20020a5d4f8e000000b0032d9f32b96csm2969399wru.62.2023.11.02.10.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 10:11:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Nov 2023 18:11:18 +0100
Message-ID: <20231102171118.4810-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698945083; x=1699549883; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Uocr2r4HY8nRCeq4e1bZV6090KsCc6rAgNVQtdOeP6k=;
 b=nd8QSs4+jD5RTpaxp5TZ8nQSXKAwUHHxw095NKvLUQVx+PzJYZNtBQihYsfemnkLdx
 s0cKWQMXZIOt8R4ivlKuBo+xdZoOcznYWX15n975jx7/g6dEjSjzKceFC9SpOVwSW1oF
 GKo3/isdDzAyJbWgb+jE3BSgUToypCsHEgkkOBlMh0jtxUrJ2WjmuNxVCwmlz79TnBZf
 +YEe4+fHhKK/N0z2/t0K5njZFc1VMrwl2LdtBlzcrkepCuV3WHyG6zZSM4Li4xJ3Afxc
 vKQgAzsyUFjQ58afFK79eTzFqB6KHvh8fZoLKFOcA5xv85a4M5rsg7HnAQGxPlBq+qcU
 wi6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nd8QSs4+
Subject: [Buildroot] [PATCH 1/1] package/pistache: fix build with gcc >= 13
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc >= 13:

In file included from ../include/pistache/reactor.h:19,
                 from ../src/common/reactor.cc:13:
../include/pistache/flags.h:29:35: error: 'uint8_t' was not declared in this scope
   29 |         struct TypeStorage<sizeof(uint8_t)>
      |                                   ^~~~~~~
../include/pistache/flags.h:17:1: note: 'uint8_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
   16 | #include <iostream>
  +++ |+#include <cstdint>
   17 | #include <type_traits>

Fixes:
 - http://autobuild.buildroot.org/results/d3b6eb6fb943d69571a311235944df879fccc831

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-missing-cstdint-header-include-1142.patch | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/pistache/0003-Add-missing-cstdint-header-include-1142.patch

diff --git a/package/pistache/0003-Add-missing-cstdint-header-include-1142.patch b/package/pistache/0003-Add-missing-cstdint-header-include-1142.patch
new file mode 100644
index 0000000000..3451e4aa4c
--- /dev/null
+++ b/package/pistache/0003-Add-missing-cstdint-header-include-1142.patch
@@ -0,0 +1,23 @@
+From dabe9fcd3eaaa6b0b8723369b2565778341630c0 Mon Sep 17 00:00:00 2001
+From: a-andre <13609565+a-andre@users.noreply.github.com>
+Date: Thu, 29 Jun 2023 16:34:11 +0200
+Subject: [PATCH] Add missing cstdint header include (#1142)
+
+Upstream: https://github.com/pistacheio/pistache/commit/dabe9fcd3eaaa6b0b8723369b2565778341630c0
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/pistache/flags.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/pistache/flags.h b/include/pistache/flags.h
+index 9be2b32bb..6adcc74bc 100644
+--- a/include/pistache/flags.h
++++ b/include/pistache/flags.h
+@@ -13,6 +13,7 @@
+ #pragma once
+ 
+ #include <climits>
++#include <cstdint>
+ #include <iostream>
+ #include <type_traits>
+ 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
