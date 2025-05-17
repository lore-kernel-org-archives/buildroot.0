Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3853C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5363683ADE;
	Sat, 17 May 2025 10:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-uWyMFyeQN8; Sat, 17 May 2025 10:23:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80C6183AB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80C6183AB4;
	Sat, 17 May 2025 10:23:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE488223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF88883A88
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7wc-d7CIevB4 for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:23:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8DDC83A7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8DDC83A7E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8DDC83A7E
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:23:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0433.dip0.t-ipconnect.de [91.58.4.51])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CAFABA4C16C2
 for <buildroot@buildroot.org>; Sat, 17 May 2025 12:22:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59386)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGEh0-000000006te-3lfw
 for buildroot@buildroot.org; Sat, 17 May 2025 10:22:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 12:22:58 +0200
Message-Id: <20250517102258.3463895-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747477378;
 bh=llNUFIlL+XYAFY5s7ox7PwMpSOXd/r2M2ONExcG7w5I=;
 h=From:To:Subject:Date:From;
 b=hJ2u4CmyCqe3rsvH1ES2aJx5FB2/mAGVjnSzhL0zwhaqSHtUYRJ0UDaWM4zyd+/wz
 gois1qclNvUZ24dpgZVoydK61tfZ7aNP4xzeLCULKtpoYKkPsCFtKNXfSdZNeDYFdu
 pE8SavTL8dHcVJ82ilKTZx+IRGOAIIF0OOuExb4yk6EuBbE/N+KDwqba+o1ZiTxFoc
 lo3CXlkl363QVEA5lxbbbTaD43Ik1Dof2/O8aeiUFoja/aBACjR2iuplQdjQLqb3SF
 EbPsICBDXDExfIGETi47XEECwpDPN7OpTBGRahKHFziaVBoJw7UzxncbkrPFvHKWMI
 B7cnpqne/7m2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=hJ2u4Cmy
Subject: [Buildroot] [PATCH 1/1] package/kodi-inputstream-adaptive: fix
 build with gcc-15.x
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0001-Fix-build-with-gcc-15.patch          | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/kodi-inputstream-adaptive/0001-Fix-build-with-gcc-15.patch

diff --git a/package/kodi-inputstream-adaptive/0001-Fix-build-with-gcc-15.patch b/package/kodi-inputstream-adaptive/0001-Fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..79daea00bc
--- /dev/null
+++ b/package/kodi-inputstream-adaptive/0001-Fix-build-with-gcc-15.patch
@@ -0,0 +1,31 @@
+From 8ee42c56f1f5f959ce1c66ad4b33235a0b69c774 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 17 May 2025 12:19:09 +0200
+Subject: [PATCH] Fix build with gcc-15
+
+Upstream: not applicable
+
+The code which included uint16_t was removed in the to-be-released
+Piers branch:
+https://github.com/xbmc/inputstream.adaptive/commit/2afe7b8801d2da3059bfb2df0e5a6981fb9e46e9#diff-3dcaf13e4dbb2a79fa703382b7469e3c4ab1f0994928a5c0fca2627b8a9c8eac
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/common/AdaptiveUtils.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/common/AdaptiveUtils.h b/src/common/AdaptiveUtils.h
+index 7563cb86..89812532 100644
+--- a/src/common/AdaptiveUtils.h
++++ b/src/common/AdaptiveUtils.h
+@@ -13,6 +13,7 @@
+ #include <memory>
+ #include <string_view>
+ #include <vector>
++#include <cstdint>
+ 
+ // forwards
+ class AP4_Movie;
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
