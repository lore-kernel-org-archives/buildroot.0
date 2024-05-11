Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA09C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 06:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8340961632;
	Sat, 11 May 2024 06:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9rce6M8H3FfI; Sat, 11 May 2024 06:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3338B614EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3338B614EA;
	Sat, 11 May 2024 06:19:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D6B01BF398
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE76E8305A
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Q96QbdZrjrL for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 06:19:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE56483409
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE56483409
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE56483409
 for <buildroot@buildroot.org>; Sat, 11 May 2024 06:19:39 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2e0b2ddc5d1so36323031fa.3
 for <buildroot@buildroot.org>; Fri, 10 May 2024 23:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715408376; x=1716013176;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MPNeNF5yCS0I2cuYvK0luMvQUl5rhY0tL9v42Q7CWvQ=;
 b=VBdWGvfB+McpxFZh7dz5RWzNAr8dVqSAJUel/q5m+5zGBgdVn7BrcUcZwuL3i5Tk+T
 kBZnLbjJ66z8b7r+A1AVdY/U0QDyQOy4azukbyQHz11hyJaEpZcWWZwD1t4wZAKNFP/b
 QquuZ+SyezMFe4+duSq5l04NGVeglrfdUkdNmRh+c4WmPU/IyPovWVhbLzbXgiPIB4gO
 j8ERRuE/kIxZFByYJChu2oiDPrr+3x4JhppzPETokY4ps+vubEKQHvn4O0i7fjUkLuGW
 lQgrJJ5RvbEcIGEyJbeWi1ROAejuqKacWhLiU9i4O1V7S0OBrn1VchNoYEwy5ikPxonT
 l3pw==
X-Gm-Message-State: AOJu0Yz/8BfwvL9d/TOzGfyppJPX9V/CzKHrX2LavKHZpfIUTBID6J0T
 pd50+B1YYJGzyRJ7SLTdpmibT4f3zX+jfWNDEhQERoa33kyFhHPX6nLDOg==
X-Google-Smtp-Source: AGHT+IGQFubcu4TEd6b7oJUNFFPLYVepC8ElAVAOLlshqHiFe4u5FgkRPP51EPR2UFUXs0pHi9Y8yQ==
X-Received: by 2002:a2e:9d05:0:b0:2e3:2d6a:debe with SMTP id
 38308e7fff4ca-2e5204cd089mr26726461fa.51.1715408376096; 
 Fri, 10 May 2024 23:19:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccee94dasm87220625e9.32.2024.05.10.23.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 May 2024 23:19:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 08:19:31 +0200
Message-ID: <20240511061931.143405-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715408376; x=1716013176; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MPNeNF5yCS0I2cuYvK0luMvQUl5rhY0tL9v42Q7CWvQ=;
 b=ABLiHzR6rFPubD5bSv828c5r7VcHqVhAPvD7WN9mYC1LHg9uHpTLei2v1OohS/DKkD
 mNK6hCuOXZehp0qEalxIjo5jahsVaOpxzJeizHfR33mbM+tLzOipRlJKxo3J1bFU6sVu
 +YM3gWzlEvA/7aS0aZBEKP3JQ85EOmxLIgi8q5/BT56WeCDCxQUs8E2/cFcO6vRzeh4m
 v7SMkwDJ0CKeSNA4eW+9O1VE2ih7MVdRU7vd0BoJ+e+p+N65VMSmm6GnYAInHMb26WbD
 h9fZG4hy5AoAIq+MEirNwOokiIxhwQ3NDEre3Pu+uoqgvyLJ2g36jEscxMWEz6/7kNcY
 3fTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ABLiHzR6
Subject: [Buildroot] [PATCH 1/1] package/libselinux: fix uclibc build
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc build failure raised since bump to version 3.6
in commit 5f7275787ab1520c3d3f7eb9d2bd1b9f5ff41443 and
https://github.com/SELinuxProject/selinux/commit/cb8289c2b237e5f66e4a7608ecc6c68abeaeaf55:

selinux_internal.c: In function 'reallocarray':
selinux_internal.c:25:29: error: 'SIZE_MAX' undeclared (first use in this function)
   25 |         if (size && nmemb > SIZE_MAX / size) {
      |                             ^~~~~~~~
selinux_internal.c:6:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
    5 | #include <string.h>
  +++ |+#include <stdint.h>
    6 |
selinux_internal.c:25:29: note: each undeclared identifier is reported only once for each function it appears in
   25 |         if (size && nmemb > SIZE_MAX / size) {
      |                             ^~~~~~~~

Fixes: 5f7275787ab1520c3d3f7eb9d2bd1b9f5ff41443
 - http://autobuild.buildroot.org/results/7e627744beaa4f7fdfd488dfacbaafc074a999f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...se_linux_internal.c-include-stdint.h.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/libselinux/0002-libselinux-src-se_linux_internal.c-include-stdint.h.patch

diff --git a/package/libselinux/0002-libselinux-src-se_linux_internal.c-include-stdint.h.patch b/package/libselinux/0002-libselinux-src-se_linux_internal.c-include-stdint.h.patch
new file mode 100644
index 0000000000..a626370a1b
--- /dev/null
+++ b/package/libselinux/0002-libselinux-src-se_linux_internal.c-include-stdint.h.patch
@@ -0,0 +1,45 @@
+From f6143706e2fc0f1ae16cb3667722deb9cc51c244 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 11 May 2024 08:09:38 +0200
+Subject: [PATCH] libselinux/src/se_linux_internal.c: include stdint.h
+
+Include stdint.h to avoid the following uclibc build failure raised
+since version 3.6 and
+https://github.com/SELinuxProject/selinux/commit/cb8289c2b237e5f66e4a7608ecc6c68abeaeaf55:
+
+selinux_internal.c: In function 'reallocarray':
+selinux_internal.c:25:29: error: 'SIZE_MAX' undeclared (first use in this function)
+   25 |         if (size && nmemb > SIZE_MAX / size) {
+      |                             ^~~~~~~~
+selinux_internal.c:6:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
+    5 | #include <string.h>
+  +++ |+#include <stdint.h>
+    6 |
+selinux_internal.c:25:29: note: each undeclared identifier is reported only once for each function it appears in
+   25 |         if (size && nmemb > SIZE_MAX / size) {
+      |                             ^~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7e627744beaa4f7fdfd488dfacbaafc074a999f7
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/SELinuxProject/selinux/pull/435
+---
+ libselinux/src/selinux_internal.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/selinux_internal.c b/src/selinux_internal.c
+index 06852359..f6385908 100644
+--- a/src/selinux_internal.c
++++ b/src/selinux_internal.c
+@@ -1,6 +1,7 @@
+ #include "selinux_internal.h"
+ 
+ #include <errno.h>
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ 
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
