Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF23CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 19:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4690842F62;
	Sat, 30 May 2026 19:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtL6Lq3Lc2QN; Sat, 30 May 2026 19:00:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64C1542F64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780167628;
	bh=a7qC/pp7HS5VS8crQyaciXMBJqKcufD51uSFZQWMe0E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pqryFbNyPELK4O9sl93wLB9bsHZnTEGwm/tem4y4+ja/VW38AGZNhdPftdn72icDN
	 7qxxKDPo4eNcXF6qo/dudEzsr6sWvPTeNyc7zN+cp96OcvvLdmtnIZ6mYgGKKe81HC
	 Oohi3UI0HkyzMHjfALOF7SinOONTPY2OfW0P/7ham1bfrBL4Gwq+NEU/hOEms+MuZz
	 gYxF4MgJXmwKomYtZkWfnRMamXvhFLDwxDGea9/anTu/FI5GHJ/9sJ5WTFcCu518i5
	 uvQvKm8kVSpIrnbimCGEBR7c4l6xzsOgpmEdTlBCHt0jJ/TOkrIy4KtMInmyoKj5Fz
	 3mZFlKkhga6CQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64C1542F64;
	Sat, 30 May 2026 19:00:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E12DAF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 19:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D253785394
 for <buildroot@buildroot.org>; Sat, 30 May 2026 19:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Gu0vUQMmtB2 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 19:00:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EFDA984F8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFDA984F8E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFDA984F8E
 for <buildroot@buildroot.org>; Sat, 30 May 2026 19:00:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 90BDBA4C221C
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:00:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59186)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTOv1-000000007sM-2ZsR
 for buildroot@buildroot.org; Sat, 30 May 2026 19:00:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 21:00:22 +0200
Message-ID: <20260530190023.2108688-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780167623;
 bh=Xoxe+nDObzl7E6GQrKJdyN6kpDj2pnbrTCXlidUzRSE=;
 h=From:To:Subject:Date:From;
 b=CMv30WV+LOrRVko7Dv+fX2NDLhatnNgD7stLnsEI5veJ7Oc95cKjDAw/noTsykZTc
 lyK778IqDN+iGIH0z5xlJTn58EGx6E4h2f76IAcwSaYDA5PW+eKK9nokRa5si6aH8M
 SNWNEAcc36kIightRGkdPcMZcXw/Q9jb1QRuBiyBuM9iWIf58WGOj/m6dfJyh/EO/X
 eupdPwIGPJbavwp3uONCL05FiyjFaa5omGhtpK8ORBDOdAmOMX3x7ZxqrRqz57Fi4A
 RLbBBQpbSQ6g52TQC+p3C0ymPQ6bYtTrx8hemab+ryIrRH26g0lggoC7JrR032KLbs
 nEkXPpxZ0s0qw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CMv30WV+
Subject: [Buildroot] [PATCH v2 1/1] package/lrzsz: fix build with gcc >= 14.x
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
v2: Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/91762f979c8e49688a6e84c1cecdc7060d7c290b

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
