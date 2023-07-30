Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F21C001DE
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6E946101F;
	Sun, 30 Jul 2023 21:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6E946101F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hsISMHayeiXW; Sun, 30 Jul 2023 21:05:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF02E6101B;
	Sun, 30 Jul 2023 21:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF02E6101B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C32751BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96FEC4020B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96FEC4020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QeJFf7RwI0W4 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:05:28 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3165401CA
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3165401CA
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D0B8FA4C0C45;
 Sun, 30 Jul 2023 23:05:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45514)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQDbP-0006bm-1r;
 Sun, 30 Jul 2023 23:05:23 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 23:05:23 +0200
Message-Id: <20230730210523.2327588-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690751123;
 bh=oHMXWH3PFkoRZD9olmTM+J/h6WzSrJaPHVSGEzIZYCU=;
 h=From:To:Cc:Subject:Date:From;
 b=YWXBBJZIUT8jqKe/WOAZxxJef2mJ2DWSclvL1cFAy6Tl1kTrCVV38qv+7Ib7+/MQc
 wH8jX6W1QUbgr7gCcYlAr3ZbgSRTFi/RYDw7FEacHbDMsqHSwfUTZbhocAxN1G6VDe
 aaxMDrRrB1Cj7gOm5q9M08YTKP4gecs7lhsIzTzc9erfoJfQrvobfL4QRMW3r+3sRG
 os2N9nzj2LZvh0GufMx2CdbdeAGJKN58PQidrT3bfJkFbWe0TXtNeSOHU9wrXxjXIR
 57GxGXDFOENAabEIaFeFReXH/kYdvjQU50fRQ133WLXL/AGJdz0cZOHBW+eN01XlJ4
 1u1Tk03bZgi9g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=YWXBBJZI
Subject: [Buildroot] [PATCH RFC 1/1] package/xenomai: disable -Werror
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/1fd/1fd8d97e0f514a65eb6a4723e49605073c9e3824/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
This is a quick'n'dirty fix for the build error which is only visible if
you issue the build commands manually and remove ">/dev/null 2>&1".
Since this is my first patch for Xenomai I am unsure the fix would be
accepted upstream so I would like to discuss it here before sending it
upstream. Therefore I did not add an Upstream: tag.

 .../0004-configure.ac-Remove-Werror.patch     | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/xenomai/3.0.10/0004-configure.ac-Remove-Werror.patch

diff --git a/package/xenomai/3.0.10/0004-configure.ac-Remove-Werror.patch b/package/xenomai/3.0.10/0004-configure.ac-Remove-Werror.patch
new file mode 100644
index 0000000000..74e590deff
--- /dev/null
+++ b/package/xenomai/3.0.10/0004-configure.ac-Remove-Werror.patch
@@ -0,0 +1,31 @@
+From 7e1010c82453442edce2914667538f648875284a Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 30 Jul 2023 22:59:41 +0200
+Subject: [PATCH] configure.ac: Remove -Werror
+
+Fixes build errors
+
+task.c:398:16: error: 'ret' may be used uninitialized [-Werror=maybe-uninitialized]
+task.c:444:16: error: 'ret' may be used uninitialized [-Werror=maybe-uninitialized]
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 45e222b97..5c9476e7b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -629,7 +629,7 @@ fi
+ dnl Internal CFLAGS and LDFLAGS, may be enhanced per-arch below
+ XENO_USER_CFLAGS="$XENO_USER_APP_CFLAGS -pipe -fstrict-aliasing \
+ -Wall -Wstrict-prototypes -Wmissing-prototypes -Wno-long-long \
+--Wno-unused-parameter -Werror -Wformat-security -D__XENO__ -D__IN_XENO__"
++-Wno-unused-parameter -Wformat-security -D__XENO__ -D__IN_XENO__"
+ if test x$want_fortify = xyes -a x$debug_mode != xfull; then
+    XENO_USER_CFLAGS="$XENO_USER_CFLAGS -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2"
+ fi
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
