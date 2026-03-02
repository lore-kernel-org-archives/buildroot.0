Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5917EB3624
	for <buildroot@archiver.kernel.org>; Mon,  2 Mar 2026 19:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 429EA83D8A;
	Mon,  2 Mar 2026 19:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5iPm92XpojQ; Mon,  2 Mar 2026 19:15:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBC1A837AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772478929;
	bh=R5TeLsruLVFkooztiGoEwNg1dUWmy7pVj352f+8Y7oA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P99r4tlc+xLYCpuZbkVJFa5lk5t1eKPikqVTdUuHXUWICsGw0KFK2ZLwJ1ERUtXsj
	 WplRD79m37UnSV7n40BSY03CeNfx/vmKqYrAj1fMau5Bgg6GwNXUAqYCTm2r8o6UdO
	 jxmbjQxmkqsNL08ziLS+xnRRJdRx7nU0CIVUcsQ3BTmG9UO0UmwaXNcFPm02Myl/Tr
	 vqGj/Ia/Uj2C7edwE92GjJ7/OF9Lr0v2HSHEBz7axqZvJ7RIDJvc95wuxkKbMgexAh
	 FiVRgK1xKSDXSPoKxEzCsmJ7WhxDZxntdwzA+E46hfDU/rZETNzsi8VQMPg1FECWpT
	 4l/Hgb6VSBQow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBC1A837AC;
	Mon,  2 Mar 2026 19:15:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EAD74231
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 19:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC8B541C81
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 19:15:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RezgL7rcwSyG for <buildroot@buildroot.org>;
 Mon,  2 Mar 2026 19:15:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 59BA441C80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59BA441C80
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59BA441C80
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 19:15:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a037c.dip0.t-ipconnect.de [91.58.3.124])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E167AA4C337E
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 20:15:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45252)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vx8jj-000000004QY-2PJY
 for buildroot@buildroot.org; Mon, 02 Mar 2026 19:15:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  2 Mar 2026 20:15:23 +0100
Message-ID: <20260302191523.3441324-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772478923;
 bh=6kicAPMe7+ONqCdvVRc5sd3l7c3xau8XG066qGxjC2w=;
 h=From:To:Subject:Date:From;
 b=rS5m0uY08960rmGPDK/6sGvECh8mNGNwMAWlAb9mkmnP7GhOXFGd3+PbLIdg8uf7F
 PnI0LLA4Kz524gvYpQ1h0OFzwK+mGkKsvFZSx5ByMbFVB90i5rOAtqdl0kl8i1QnkX
 jhGECxo3jUv0gf5WlRShN9zF6b80IYnPKU+pznKm7++ZHVlEJYFTmI6JAib6gbeyC3
 OYzr9rr1i1Y5L/Y1RtPuGi/d3yRaM2Z/YrpsqlFJVYTJFwvF7njoi/HdMMYzn0mlpV
 yIu0JF94AhgKAEjJU90/0NVZmO25EK8vkJRyjyyPnwKk2xHa3TPPdDOQW0oaDvii+i
 HjiN0fuikZetw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=rS5m0uY0
Subject: [Buildroot] [PATCH 1/1] package/lrzsz: fix build with gcc >= 14.x
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

Fixes:
https://autobuild.buildroot.net/results/2e3/2e33c61e1c9bee099f973c1e43b696c63e5eed4b/

Building lrzsz with this defconfig works:

BR2_GCC_VERSION_13_X=y
BR2_PACKAGE_LRZSZ=y

and gets broken when switched to gcc 14:

BR2_PACKAGE_LRZSZ=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0007-configure-fix-for-gcc-14.x.patch     | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 package/lrzsz/0007-configure-fix-for-gcc-14.x.patch

diff --git a/package/lrzsz/0007-configure-fix-for-gcc-14.x.patch b/package/lrzsz/0007-configure-fix-for-gcc-14.x.patch
new file mode 100644
index 0000000000..160cf73d62
--- /dev/null
+++ b/package/lrzsz/0007-configure-fix-for-gcc-14.x.patch
@@ -0,0 +1,55 @@
+From 791b757537d48a9e6beec4a1551d277b79b95f37 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Mon, 2 Mar 2026 20:09:25 +0100
+Subject: [PATCH] configure: fix for gcc >= 14.x
+
+The pre-generated configure script has a check that doesn't work with
+GCC >= 14.x:
+
+configure:1932: checking for ANSI C header files
+configure:1945: /home/bernd/buildroot/output/per-package/lrzsz/host/bin/i586-buildroot-linux-gnu-cpp -D_LARGEFILE_SOURCE -D_LARGEFILE64_S
+OURCE -D_FILE_OFFSET_BITS=64 conftest.c >/dev/null 2>conftest.out
+configure:2012: /home/bernd/buildroot/output/per-package/lrzsz/host/bin/i586-buildroot-linux-gnu-gcc -o conftest -D_LARGEFILE_SOURCE -D_L
+ARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0 -D_FORTIFY_SOURCE=1 -std=gnu17 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BIT
+S=64  conftest.c  1>&5
+configure: In function 'main':
+configure:2007:67: error: implicit declaration of function 'exit' [-Wimplicit-function-declaration]
+ 2007 | if (XOR (islower (i), ISLOWER (i)) || toupper (i) != TOUPPER (i)) exit(2);
+      |                                                                   ^~~~
+configure:2003:1: note: include '<stdlib.h>' or provide a declaration of 'exit'
+ 2002 | #include <ctype.h>
+  +++ |+#include <stdlib.h>
+
+Doing AUTORECONF = YES doesn't work as the configure.in is very old, so
+let's fix the configure script directly.
+
+Upstream: N/A, patching generated file
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure b/configure
+index 16a259a..8601361 100755
+--- a/configure
++++ b/configure
+@@ -1572,6 +1572,7 @@ else
+ #line 1573 "configure"
+ #include "confdefs.h"
+ #include <ctype.h>
++#include <stdlib.h>
+ #define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
+ #define TOUPPER(c) (ISLOWER(c) ? 'A' + ((c) - 'a') : (c))
+ #define XOR(e, f) (((e) && !(f)) || (!(e) && (f)))
+@@ -2000,6 +2001,7 @@ else
+ #line 2001 "configure"
+ #include "confdefs.h"
+ #include <ctype.h>
++#include <stdlib.h>
+ #define ISLOWER(c) ('a' <= (c) && (c) <= 'z')
+ #define TOUPPER(c) (ISLOWER(c) ? 'A' + ((c) - 'a') : (c))
+ #define XOR(e, f) (((e) && !(f)) || (!(e) && (f)))
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
