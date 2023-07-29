Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE54C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 21:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1123281EE6;
	Sat, 29 Jul 2023 21:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1123281EE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iELuWCfT20NI; Sat, 29 Jul 2023 21:59:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 505F681EDD;
	Sat, 29 Jul 2023 21:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 505F681EDD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4E7D1BF2AF
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 767AA409DD
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:59:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 767AA409DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id asHf9gUvpMdM for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:59:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 474D1409B6
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 474D1409B6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A3D683B69; Sat, 29 Jul 2023 21:59:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 23:41:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d81517903f73ba927ef72934aa211a1d5ddbf414
X-Git-Newrev: 2c220643f9ffbabe7c0ff3c464c716fb8153e816
X-Patchwork-Hint: ignore
Message-Id: <20230729215906.2A3D683B69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediasdk: fix build with
 gcc-13
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2c220643f9ffbabe7c0ff3c464c716fb8153e816
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...002-add-missing-stdint.h-to-mfxparser-cpp.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/intel-mediasdk/0002-add-missing-stdint.h-to-mfxparser-cpp.patch b/package/intel-mediasdk/0002-add-missing-stdint.h-to-mfxparser-cpp.patch
new file mode 100644
index 0000000000..d2a095c39a
--- /dev/null
+++ b/package/intel-mediasdk/0002-add-missing-stdint.h-to-mfxparser-cpp.patch
@@ -0,0 +1,31 @@
+From 8fb9f5feaf738f69b278d2cac15baada1447aae8 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Mon, 28 Nov 2022 23:31:29 +0000
+Subject: [PATCH] add missing <stdint.h> to mfxparser.cpp
+
+Without the change build fails on `gcc-13` as:
+
+    MediaSDK/api/mfx_dispatch/linux/mfxparser.cpp: In function 'std::string MFX::printCodecId(mfxU32)':
+    MediaSDK/api/mfx_dispatch/linux/mfxparser.cpp:60:3: error: 'uint8_t' was not declared in this scope
+       60 |   uint8_t* data = reinterpret_cast<uint8_t*>(&id);
+          |   ^~~~~~~
+
+Upstream: https://github.com/Intel-Media-SDK/MediaSDK/pull/2998
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ api/mfx_dispatch/linux/mfxparser.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/api/mfx_dispatch/linux/mfxparser.cpp b/api/mfx_dispatch/linux/mfxparser.cpp
+index 9d3823ec3e..12e46d1881 100644
+--- a/api/mfx_dispatch/linux/mfxparser.cpp
++++ b/api/mfx_dispatch/linux/mfxparser.cpp
+@@ -20,6 +20,7 @@
+ 
+ #include <ctype.h>
+ #include <stdio.h>
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
