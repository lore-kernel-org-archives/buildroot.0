Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC2CC25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 10:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0C1B82DE6;
	Thu, 16 May 2024 10:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHIY_lZ6s2mz; Thu, 16 May 2024 10:06:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BD3282CCB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BD3282CCB;
	Thu, 16 May 2024 10:06:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72C6D1BF3DE
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 10:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D4284042F
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 10:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mERumxmVvNv4 for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 10:06:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9579C4027A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9579C4027A
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9579C4027A
 for <buildroot@buildroot.org>; Thu, 16 May 2024 10:06:53 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 0DE91C1026;
 Thu, 16 May 2024 12:06:51 +0200 (CEST)
Message-ID: <1ed351b7-0e04-436d-9ce3-ca70f4d3ff74@grenoble.cnrs.fr>
Date: Thu, 16 May 2024 12:06:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1715854011;
 bh=219+VfuM0SPcwExP1qJwl0LW4uczv2/TWOq1RfDCYuM=;
 h=Date:To:Cc:From:Subject:From;
 b=S2KRiE9QmRtgHde4y9UCa7j0kCznZhxpL0jIzwhPVwVp0/MpJ1ATPlq9pCzJTbftQ
 kpvV/YarRY4mLP1LcgW3wr2+9VTl1TUQEi04ZhUrWlpqboI+AFMVdHlWqmNQPum1WQ
 EpuQ88cc+niejOzJYaZgFxkDz6clKFoVUakFz/PurXhgfmo/F6KG1E7+vGBpAFbhBw
 g1WqVvT2pda46I8FVDFCFwLZBoxrD6ktTMniYVrOnvGttAI6Lve/EpAEpqb1SCT7dT
 9Kqh+y0a94Nyu/n4URUpBMnT1LV2ew4L0bFi/TpVkAr5G79DvSCQGL0x4UdmSu16m2
 L6mhYAhAOcDbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=S2KRiE9Q
Subject: [Buildroot] [PATCH 1/1] package/nginx: fix compile error in
 configure script
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building with GCC 14 fails at the configure step with:

    ./configure: error: libatomic_ops library was not found.

The error is not caused by a missing library, but by an unrelated
"incompatible pointer type" error in the test program:

    ...
    checking for atomic_ops library
    objs/autotest.c: In function 'main':
    objs/autotest.c:9:48: error: passing argument 1 of 'AO_compare_and_swap' from incompatible pointer type [-Wincompatible-pointer-types]

This used to be a warning, but it is an error since GCC 14.[1]

Fix this by patching the test program in order to use the correct
pointer types.

[1] https://gcc.gnu.org/gcc-14/porting_to.html#incompatible-pointer-types

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 ...ix-compile-error-in-configure-script.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/nginx/0011-Fix-compile-error-in-configure-script.patch

diff --git a/package/nginx/0011-Fix-compile-error-in-configure-script.patch b/package/nginx/0011-Fix-compile-error-in-configure-script.patch
new file mode 100644
index 0000000000..2e719928ce
--- /dev/null
+++ b/package/nginx/0011-Fix-compile-error-in-configure-script.patch
@@ -0,0 +1,41 @@
+From e1bcac837f6aeabc4ddece06ecbcf2bcca8dd651 Mon Sep 17 00:00:00 2001
+From: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Date: Thu, 16 May 2024 11:15:10 +0200
+Subject: [PATCH] Fix compile error in configure script
+
+Building with GCC 14 fails at the configure step with:
+
+    ./configure: error: libatomic_ops library was not found.
+
+The error is not caused by a missing library, but by an unrelated
+"incompatible pointer type" error in the test program:
+
+    ...
+    checking for atomic_ops library
+    objs/autotest.c: In function 'main':
+    objs/autotest.c:9:48: error: passing argument 1 of 'AO_compare_and_swap' from incompatible pointer type [-Wincompatible-pointer-types]
+
+Fix the error by using the correct pointer types.
+
+Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Upstream: https://mailman.nginx.org/pipermail/nginx-devel/2024-May/LF5H73UPOIS64TVQUN5N6S2A4IACBRPT.html
+---
+ auto/lib/libatomic/conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/auto/lib/libatomic/conf b/auto/lib/libatomic/conf
+index d1e484a..0f12b9c 100644
+--- a/auto/lib/libatomic/conf
++++ b/auto/lib/libatomic/conf
+@@ -20,7 +20,7 @@ else
+                       #include <atomic_ops.h>"
+     ngx_feature_path=
+     ngx_feature_libs="-latomic_ops"
+-    ngx_feature_test="long  n = 0;
++    ngx_feature_test="AO_t  n = 0;
+                       if (!AO_compare_and_swap(&n, 0, 1))
+                           return 1;
+                       if (AO_fetch_and_add(&n, 1) != 1)
+-- 
+2.34.1
+
-- 
2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
