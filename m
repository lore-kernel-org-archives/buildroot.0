Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400C3C48BF3
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 21:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04BD0417F6;
	Fri, 16 Feb 2024 21:18:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nCoaPIViYzed; Fri, 16 Feb 2024 21:18:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D873941EB6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D873941EB6;
	Fri, 16 Feb 2024 21:18:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A7F061BF287
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1F4941C3B
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:18:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id whhmydcJ53Lz for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 21:18:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 400AF400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 400AF400E5
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 400AF400E5
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 21:18:22 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41259b54121so12745e9.3
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 13:18:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708118299; x=1708723099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iYx3TCRmxQzQ/iYEgOpOIBx7a/fNWgcEtonBVWpMdjA=;
 b=iVkIS0UumblK53SW98t8WpwZRXNft2YDY9UCHkYd6597a+CKaSNyNPtkTytq3eETD4
 DSMHMX86Hsceiks18+m8UJJEs/pAXCrAmHPmzcchhMgFbLJbZwzsAMKE5euxSmgf95aU
 hLZxquB4AZ4hSl0/CZTUyzu6LQmu1Np7UlX3xsuIW3plk+1XcAMGmmWXJxJt9eXPMHiT
 JGz/vJjT/7rUyVA0zahpsEXM9IIxDcmizAFhrUs4NusU1oWFUB6fS8Zv0L4z2L6uy4ra
 3jLlsJdPr6wEFV/eSIynR2jvy3OjVIlRph/IbEf+spMWCWrWkd9oh9Aq+2+TSx9E4kum
 A+EA==
X-Gm-Message-State: AOJu0YxSMeyZUmNbg9ChIowk8hLWv2y6Vhs3ZZfm++I4qIETp2TF9gv/
 NYGMG0HMyADwgXyqggGQZ4VGEb9E2AwsB8w3DLdmWXLbe12VZBWy7TsFqow5tcI=
X-Google-Smtp-Source: AGHT+IFL0tnqiLpQXgCGQjlocFO8Pef+4heU9Q6qvvuZWes5jwAhYjgXvfSmfBZVX11mUXl/KRSKEw==
X-Received: by 2002:a05:600c:3d89:b0:412:3e42:f7a4 with SMTP id
 bi9-20020a05600c3d8900b004123e42f7a4mr2480892wmb.12.1708118299180; 
 Fri, 16 Feb 2024 13:18:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l20-20020a05600c1d1400b0041256ab5becsm376913wms.26.2024.02.16.13.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 13:18:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 16 Feb 2024 22:18:13 +0100
Message-ID: <20240216211813.1846842-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708118299; x=1708723099; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iYx3TCRmxQzQ/iYEgOpOIBx7a/fNWgcEtonBVWpMdjA=;
 b=k/xXN/qj9TevDRBWmZxTj2E3Bc7ael9pO7x5zwU4gtOhzYEhy6JjfgbWWOlAMmC4EO
 ki4Jq6NDOiapV4G2/2YNOQ/swYV8L2DZQVjSuhBcoMHlQmohGUz8yPfRvtsbifHio88B
 GQDpVqViphrhZyPTMmLlIDYQYcm1Xc6N4kZEFq+kAMgleuLDAj9KwZYRUTPOoxYnMfzD
 t88T+VU09TSbAGtU34gkQEWXrNUtyPBvoWnn67W7FG4AhNvNd3yBIEC2vCq9OzOKTQtL
 kppUMQpiv+fPaXIq/8lCuW+meCCAHexzvMd/YcXi0mL+UDQAfROxvnfjmlPe5VUUIcse
 ZWng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k/xXN/qj
Subject: [Buildroot] [PATCH 1/1] package/liburing: fix uclibc build
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

Fix the following build failure with uclibc-ng raised since bump to
version 2.4 in commit 3cc1b539e7e9fd49f571441e395e7daa8597dbec and
https://github.com/axboe/liburing/commit/c6bc86e2125bcd6fa10ff2b128cd86486acadff6:

In file included from lib.h:12,
                 from setup.c:4:
arch/aarch64/lib.h:7:10: fatal error: sys/auxv.h: No such file or directory
    7 | #include <sys/auxv.h>
      |          ^~~~~~~~~~~~

Fixes: 3cc1b539e7e9fd49f571441e395e7daa8597dbec
 - http://autobuild.buildroot.org/results/cc44d714c9267dd7a98debeb8c81c4ee1efe4ebb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-src-arch-aarch64-fix-uclibc-build.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch

diff --git a/package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch b/package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch
new file mode 100644
index 0000000000..4468105e4f
--- /dev/null
+++ b/package/liburing/0001-src-arch-aarch64-fix-uclibc-build.patch
@@ -0,0 +1,39 @@
+From f03f8da34fe96ac35a916ca3058b0f41971eae3b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 16 Feb 2024 18:59:42 +0100
+Subject: [PATCH] src/arch/aarch64: fix uclibc build
+
+Fix the following build failure with uclibc-ng raised since version 2.3
+and
+https://github.com/axboe/liburing/commit/c6bc86e2125bcd6fa10ff2b128cd86486acadff6:
+
+In file included from lib.h:12,
+                 from setup.c:4:
+arch/aarch64/lib.h:7:10: fatal error: sys/auxv.h: No such file or directory
+    7 | #include <sys/auxv.h>
+      |          ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/cc44d714c9267dd7a98debeb8c81c4ee1efe4ebb
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/axboe/liburing/commit/32f9c27a76c43627f79bb77469d2da8583e4d3df
+---
+ src/arch/aarch64/lib.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/arch/aarch64/lib.h b/src/arch/aarch64/lib.h
+index 3b701b1..41bcfc9 100644
+--- a/src/arch/aarch64/lib.h
++++ b/src/arch/aarch64/lib.h
+@@ -4,7 +4,6 @@
+ #define LIBURING_ARCH_AARCH64_LIB_H
+ 
+ #include <elf.h>
+-#include <sys/auxv.h>
+ #include "../../syscall.h"
+ 
+ static inline long __get_page_size(void)
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
