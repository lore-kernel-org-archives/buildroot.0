Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E88C0015E
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 11:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89F2C41769;
	Sat, 12 Aug 2023 11:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89F2C41769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UAJmiEfPyT7m; Sat, 12 Aug 2023 11:15:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FB7841295;
	Sat, 12 Aug 2023 11:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FB7841295
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B2481BF282
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 11:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAC19401F1
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 11:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAC19401F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LKVhpgjBdbbR for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 11:15:23 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 483DC40159
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 11:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 483DC40159
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D4B9F3520C44; Sat, 12 Aug 2023 13:15:05 +0200 (CEST)
Date: Sat, 12 Aug 2023 13:15:03 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNdpt/gB95HIWDAq@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691838911; bh=QVZUDMWL18eMP/VCr06Upc7rvDEZMeZjOOyrYbe/ttc=;
 h=Date:From:To:Subject:From;
 b=ZilNBKY35GZKU/ok9mAPUTF19AIR9+wfD27OHiG08m7QpMQNPeNbpsfI2raadIQFz
 ZnTHOO05cTeN4t6l6qPwBFeQl+44XYPYCG/jHigkQ+dnKGuJdl2UpzPQo9e5jU9PNi
 UDXkzWTm/seAvBVohm94Pz2MaiNCJ1eVGV+CYiZUm3oO9+aVKG6lngwlpc+5ZT1A2U
 uKQxzOGdVQ2yCUg6V9NNqwZUdgYJS/me0oBZ0tKBruBL5D1a1EBXB29TMOJgjiq2GC
 wMpZ/7qspCajm4lI8Y1/Y6/5Mkkc9pDYvMGHusMCElaMSR6oqcHbSjS2fMgFdWx4Hp
 f3eSiuqv9+ewg==
Subject: [Buildroot] [PATCH] package/conmon: fix compile when using a static
 build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a new Buildroot package and this is the first build error
the autobuild servers found. It is not part of any Buildroot release
so no need to backport.

Patch removes dlfcn.h, because it is unused.

Fixes:
 - http://autobuild.buildroot.net/results/db3/db301e9f556592828800fa663f2549f430adb58f

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...01-remove-unused-dlfcn.h-header-file.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/conmon/0001-remove-unused-dlfcn.h-header-file.patch

diff --git a/package/conmon/0001-remove-unused-dlfcn.h-header-file.patch b/package/conmon/0001-remove-unused-dlfcn.h-header-file.patch
new file mode 100644
index 0000000000..14f817942e
--- /dev/null
+++ b/package/conmon/0001-remove-unused-dlfcn.h-header-file.patch
@@ -0,0 +1,26 @@
+From e28634a0e847a14c58482f962bc9b1d69937387f Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Sat, 12 Aug 2023 12:53:37 +0200
+Subject: [PATCH] remove unused dlfcn.h header file
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://github.com/containers/conmon/issues/443
+---
+ src/seccomp_notify.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/seccomp_notify.c b/src/seccomp_notify.c
+index 8d34d9d..2a8371d 100644
+--- a/src/seccomp_notify.c
++++ b/src/seccomp_notify.c
+@@ -7,7 +7,6 @@
+ 
+ #include <errno.h>
+ #include <sys/ioctl.h>
+-#include <dlfcn.h>
+ #include <sys/wait.h>
+ #include <sys/mount.h>
+ #include <signal.h>
+-- 
+2.39.2
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
