Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4D9C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:01:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89AAE61175
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89AAE61175
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62CE280BB8;
	Tue,  9 Nov 2021 10:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5qPeDHC_Nlf; Tue,  9 Nov 2021 10:01:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACAD580ED2;
	Tue,  9 Nov 2021 10:00:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF2A71BF9B2
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D936F4024F
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id be7Op3JDbpFR for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:00:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D42840133
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:00:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A25058B77E; Tue,  9 Nov 2021 09:56:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 10:46:55 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: b6a54d7472ee1d89db34b79b5691300ba372b915
X-Git-Newrev: 2fadfdb779490577722baa704a2d89d38af14446
X-Patchwork-Hint: ignore
Message-Id: <20211109095622.A25058B77E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/gdb: fix gdb-10.2
 compile for uclibc < v1.0.35 (getrandom related)
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8043122300745230055=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8043122300745230055==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2fadfdb779490577722baa704a2d89d38af14446
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

- fix getrandom compile for uclibc < v1.0.35, add missing stddef.h
  include (fixed in uclibc since v1.0.35, see [1])

Fixes:

  - http://autobuild.buildroot.net/results/6d4a62c703c85dd993ddb2d90ebe1f6cad24e0b0

  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name ‘size_t’
     27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
        |                                   ^~~~~~

[1] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=00972c02c2b6e0a95d5def4a71bdfb188e091782t

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2f7598034c00f6b51a7e2679401d45cada14be3f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Fix-getrandom-compile-for-uclibc-v1.0.35.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/gdb/10.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch b/package/gdb/10.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
new file mode 100644
index 0000000000..4b212e2d03
--- /dev/null
+++ b/package/gdb/10.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
@@ -0,0 +1,39 @@
+From bb894a9cfb1c3cf0e0a174c496ad848f589ee7da Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 6 Nov 2021 10:06:25 +0100
+Subject: [PATCH] Fix getrandom compile for uclibc < v1.0.35
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+- fix getrandom compile for uclibc < v1.0.35, add missing stddef.h
+  include (fixed in uclibc since v1.0.35, see [1])
+
+Fixes:
+
+  .../host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35: error: unknown type name ‘size_t’
+     27 | extern int getrandom(void *__buf, size_t count, unsigned int flags)
+        |                                   ^~~~~~
+
+[1] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=00972c02c2b6e0a95d5def4a71bdfb188e091782t
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ gnulib/import/getrandom.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gnulib/import/getrandom.c b/gnulib/import/getrandom.c
+index 030a78b..7b24350 100644
+--- a/gnulib/import/getrandom.c
++++ b/gnulib/import/getrandom.c
+@@ -19,6 +19,7 @@
+ 
+ #include <config.h>
+ 
++#include <stddef.h>
+ #include <sys/random.h>
+ 
+ #include <errno.h>
+-- 
+2.33.1
+

--===============8043122300745230055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8043122300745230055==--
