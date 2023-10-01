Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6177E748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 14:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C3F84188E;
	Sun,  1 Oct 2023 14:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C3F84188E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id alZldxDbNa8x; Sun,  1 Oct 2023 14:37:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A059418BA;
	Sun,  1 Oct 2023 14:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A059418BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F4571BF59E
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 14:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14A84418BA
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 14:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14A84418BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Uh4NbxjRXA3 for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 14:37:16 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F169A4188E
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 14:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F169A4188E
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40566f8a093so126250195e9.3
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 07:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696171033; x=1696775833;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RtLbvWZl01v8QJ9/yPVT805OJRAecrlbyc53rdVbfbA=;
 b=ekGNsffGro/fqkYGLxgRf5tfmB1aZzD/CSc2FhN+GyafvHfgM9/ye7RbPkt1NYezSQ
 8R+lo4egsJCLT4qG5ygzQdKPQcg/Q1Wt5DPCrPvXPtlumYhnRpMtdqVhZzEZX6Wclskt
 HEBMI1mQ2sqBRkOx6an/Mra3oHz0mXgAWOfa7nXR4I4/gydjYfHj9fbVnVE/p6b0LRz9
 9F3NqOtKUdFsyUIC8cxS0VGmT+cvROeopJzsL8fT279TnearvWoFA2m0pAZKZukoZsF6
 lANSef1l1Y+Xl92df30GAWGwaD/zVHI7b8M+mEdjwLdiqsewUtQp11vHFCoNrI2VfowU
 Fl4Q==
X-Gm-Message-State: AOJu0YxxYEhHapAHUq7jSim6U1pkcO2v8q5ElfZJ4IbbspjT7hKTB5dU
 LD6sac5P1HTkRrPnKjhgb0g0Cp615ys=
X-Google-Smtp-Source: AGHT+IGBGjpxbu+Ld9EopZZL2ng02YJaXUv62fAU8snK9Mfe6Nv0jdyzVpaZjDH1Ze3PMJN4YfKIhg==
X-Received: by 2002:a05:600c:209:b0:405:3cc5:1105 with SMTP id
 9-20020a05600c020900b004053cc51105mr7790152wmi.8.1696171033482; 
 Sun, 01 Oct 2023 07:37:13 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r1-20020a05600c298100b0040586360a36sm5377231wmd.17.2023.10.01.07.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 07:37:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 16:37:08 +0200
Message-Id: <20231001143708.964342-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696171033; x=1696775833; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RtLbvWZl01v8QJ9/yPVT805OJRAecrlbyc53rdVbfbA=;
 b=Ao6HWCIIdBbPK+S8NWUsq0pK5CzwxJ8P/XASrDrQ+qf9zfW2sj2JP124SMsOR7WSY7
 QNozePiy5eo/MXHWOU4RUYTGXrnrOiZqXHMk2QxEzsCj06hWjc+cHjyi+o9NjYdg7k6J
 ZC3X6Gb6w7PRSiUiSdmoARadSssj2dMQ6mlHaagVw7BVbL+RrYB6joCLUSB6/aB0NIeF
 iDCTJ+BwJWGsUmmIi7xN79kNqwMYJwAjJGTyYes4/CgH9bIU+App2wwzixk2jybYYP3i
 wcvtmjWAzSDGyIiKBMkmy//jDNQYldvkuQKX2T1YqUu0lEHarAiHvnhMM3BAoCbsCYJI
 ZnjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Ao6HWCII
Subject: [Buildroot] [PATCH 1/1] package/rwmem: fix build with gcc 13
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

Fix the following build failure with gcc 13:

In file included from ../librwmem/itarget.h:3,
                 from ../librwmem/i2ctarget.h:4,
                 from ../librwmem/i2ctarget.cpp:1:
../librwmem/helpers.h:51:39: error: 'uint64_t' has not been declared
   51 | int parse_u64(const std::string& str, uint64_t* value);
      |                                       ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/38f6d0fb007c3dc3c21243721395f85649442407

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../rwmem/0001-include-missing-cstdint.patch  | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/rwmem/0001-include-missing-cstdint.patch

diff --git a/package/rwmem/0001-include-missing-cstdint.patch b/package/rwmem/0001-include-missing-cstdint.patch
new file mode 100644
index 0000000000..d8369d0739
--- /dev/null
+++ b/package/rwmem/0001-include-missing-cstdint.patch
@@ -0,0 +1,30 @@
+From 84e884f99e581515b49d8973538bb17e1e6c0dc0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 26 Jan 2023 20:45:57 -0800
+Subject: [PATCH] include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is no
+longer transitively included [1]. Explicitly include it for
+uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream: https://github.com/tomba/rwmem/commit/84e884f99e581515b49d8973538bb17e1e6c0dc0
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ librwmem/helpers.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/librwmem/helpers.h b/librwmem/helpers.h
+index a0a738b..8d02c9c 100644
+--- a/librwmem/helpers.h
++++ b/librwmem/helpers.h
+@@ -1,6 +1,7 @@
+ #pragma once
+ 
+ #include <cerrno>
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ #include <string.h>
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
