Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165B7C001DF
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 21:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FE394BA7C;
	Thu, 19 Oct 2023 21:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FE394BA7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJr7CSjsTHM6; Thu, 19 Oct 2023 21:32:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AADEE4BA32;
	Thu, 19 Oct 2023 21:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AADEE4BA32
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DBDA1BF588
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 21:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16F594BA32
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 21:32:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16F594BA32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bnL4_8Z6rjAT for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 21:32:20 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7A104BA25
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 21:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7A104BA25
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c50ec238aeso1965181fa.0
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 14:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697751137; x=1698355937;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S1Qnv+28IwI72gXJ2e8wL/fVP7Mh0MM3ydKgcukbIUw=;
 b=n+5nmmlBUOT/G+2O9KSZW4JM1TYiAclLpSK4AgYge+Cyrfqx0+JvJfdFbFMxywKAPE
 pVtLlNOQmskoNyLBFvwXyFS4bA7ovhhEJC3J6LG18wKKwXxWbDePQE9D7iwol1NxXW3d
 ngD4zR4AH8M1Ypw337dFVnbaR0ukk5uyrZaeCXPcbFxEASKkt7h44JJqLrZS1I4Q35Cr
 EPYsbrJffAtb+oAHchlJy92CK2SD8sezCnTkyMDRdgpTGudZdQWjJEVi03p6aFT1sLtg
 BC3T5DlcggUhOO7tfvK63PIeiWJ6Nf5n1f3/KTDIV14K30mxhOi99Ge7NqU8EyTv6W7W
 jTlQ==
X-Gm-Message-State: AOJu0YyKlwBPt3eGfcE9ABoZfAJMJX45Mj55hwW+AstQVlDsbrUhSY6z
 6VaofVMV9ESu1w4ky21pwJ6iX/Jkb5c=
X-Google-Smtp-Source: AGHT+IGmqpuojb8356V9P3bfxU0UeXKw1QQjIRq7wRO8sEBVul+wryRvMuQnx1DQ8uuqXV4iOQz/AA==
X-Received: by 2002:a2e:8196:0:b0:2c5:1ea4:35aa with SMTP id
 e22-20020a2e8196000000b002c51ea435aamr113376ljg.48.1697751137231; 
 Thu, 19 Oct 2023 14:32:17 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c450600b0040535648639sm534184wmo.36.2023.10.19.14.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 14:32:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 23:32:09 +0200
Message-ID: <20231019213209.627881-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697751137; x=1698355937; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S1Qnv+28IwI72gXJ2e8wL/fVP7Mh0MM3ydKgcukbIUw=;
 b=h+ZKp4rM1Q3ufCGvwRb6pY13isb7Yh8Y9FFyPB5lA3AaXeAfW9PkAviZIOo/wptWzn
 kQN0sQnksirV5uMqV9xigE2C8e/9TZkmFqJuAovNMbKcVZ+63gS9MyrMNRf3/fJfgv+Y
 6wLC8x06/gMQcHGhgf2bfiSkqZ+Jar7UXUmTtdpifI2RdWXaD/geVlO5zHiqbUszgP3e
 L7CCBREW7oWupguNWzXeYwmVJWuenRnH+/b3tXdOzm2ddeLeU2HNl2ui71FhWJMzJZxp
 uSzAIXLVXl8vRzSEeNkKJ7xE9pCECKmB2t1bc5ix2w00jNwvs81Mni9pzJOGx6G0wdTp
 a90Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h+ZKp4rM
Subject: [Buildroot] [PATCH 1/1] package/snort3: fix build with gcc >= 13
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

In file included from /home/thomas/autobuild/instance-1/output-1/build/snort3-3.1.40.0/src/packet_io/sfdaq_config.cc:25:
/home/thomas/autobuild/instance-1/output-1/build/snort3-3.1.40.0/src/packet_io/sfdaq_config.h:59:25: error: 'uint32_t' has not been declared
   59 |     void set_batch_size(uint32_t);
      |                         ^~~~~~~~
/home/thomas/autobuild/instance-1/output-1/build/snort3-3.1.40.0/src/packet_io/sfdaq_config.h:62:5: error: 'uint32_t' does not name a type
   62 |     uint32_t get_batch_size() const { return (batch_size == BATCH_SIZE_UNSET) ? BATCH_SIZE_DEFAULT : batch_size; }
      |     ^~~~~~~~
/home/thomas/autobuild/instance-1/output-1/build/snort3-3.1.40.0/src/packet_io/sfdaq_config.h:26:1: note: 'uint32_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
   25 | #include <vector>
  +++ |+#include <cstdint>
   26 |

Fixes:
 - http://autobuild.buildroot.org/results/c91a74bad542f32693f2e31412fba70446fd3959

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ix-cstdint-related-clearlinux-errors.patch | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/snort3/0001-Pull-request-3925-build-fix-cstdint-related-clearlinux-errors.patch

diff --git a/package/snort3/0001-Pull-request-3925-build-fix-cstdint-related-clearlinux-errors.patch b/package/snort3/0001-Pull-request-3925-build-fix-cstdint-related-clearlinux-errors.patch
new file mode 100644
index 0000000000..4f24ee72d4
--- /dev/null
+++ b/package/snort3/0001-Pull-request-3925-build-fix-cstdint-related-clearlinux-errors.patch
@@ -0,0 +1,60 @@
+From 154cf0312b3652bdfdf241e6883d7c6de9b85e01 Mon Sep 17 00:00:00 2001
+From: "Maya Dagon (mdagon)" <mdagon@cisco.com>
+Date: Mon, 24 Jul 2023 08:06:50 +0000
+Subject: [PATCH] Pull request #3925: build: fix cstdint related clearlinux
+ errors
+
+Merge in SNORT/snort3 from ~MDAGON/snort3:clearlinux to master
+
+Squashed commit of the following:
+
+commit 7ef2bc13851ffa2bf7908964242859a8c05ddd96
+Author: maya dagon <mdagon@cisco.com>
+Date:   Thu Jul 20 14:34:01 2023 -0400
+
+    build: fix cstdint related clearlinux errors
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/snort3/snort3/commit/154cf0312b3652bdfdf241e6883d7c6de9b85e01
+---
+ src/js_norm/js_identifier_ctx.h       | 1 +
+ src/packet_io/sfdaq_config.h          | 1 +
+ src/service_inspectors/wizard/magic.h | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/src/utils/js_identifier_ctx.h b/src/utils/js_identifier_ctx.h
+index b8d5121a2c..6ef1ce2b23 100644
+--- a/src/utils/js_identifier_ctx.h
++++ b/src/utils/js_identifier_ctx.h
+@@ -20,6 +20,7 @@
+ #ifndef JS_IDENTIFIER_CTX
+ #define JS_IDENTIFIER_CTX
+ 
++#include <cstdint>
+ #include <list>
+ #include <string>
+ #include <unordered_map>
+diff --git a/src/packet_io/sfdaq_config.h b/src/packet_io/sfdaq_config.h
+index 990c45785b..f4c1042bc3 100644
+--- a/src/packet_io/sfdaq_config.h
++++ b/src/packet_io/sfdaq_config.h
+@@ -21,6 +21,7 @@
+ #ifndef SFDAQ_CONFIG_H
+ #define SFDAQ_CONFIG_H
+ 
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
+diff --git a/src/service_inspectors/wizard/magic.h b/src/service_inspectors/wizard/magic.h
+index fa24d0b5a4..b9477eb95c 100644
+--- a/src/service_inspectors/wizard/magic.h
++++ b/src/service_inspectors/wizard/magic.h
+@@ -21,6 +21,7 @@
+ #define MAGIC_H
+ 
+ #include <cassert>
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
