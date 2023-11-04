Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7779C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 22:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FF8C8217B;
	Sat,  4 Nov 2023 22:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FF8C8217B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id svBHzxdS6cPc; Sat,  4 Nov 2023 22:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B456982178;
	Sat,  4 Nov 2023 22:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B456982178
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EB931BF267
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 450F441A3A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 450F441A3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QUASGZ_dfVYw for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 22:08:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F46F400CF
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 22:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F46F400CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4EEAA867A4; Sat,  4 Nov 2023 22:08:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 23:08:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cac9018ef6e3e7c6e8a602a4f7fd576803b33028
X-Git-Newrev: deb0b8e2b2309f744faf649cccf9e1fa4a68ca16
X-Patchwork-Hint: ignore
Message-Id: <20231104220815.4EEAA867A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open-iscsi: fix musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=deb0b8e2b2309f744faf649cccf9e1fa4a68ca16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following musl build failure raised since bump to version 2.1.9
in commit 2314928cf828ff02939b9c0041964c3ee2dd907d and
https://github.com/open-iscsi/open-iscsi/commit/7b571d76d6937a78c141630fc38c3c57c532466c:

../usr/idbm.c: In function 'idbm_rec_write_old':
../usr/idbm.c:2230:27: error: 'GLOB_ONLYDIR' undeclared (first use in this function)
 2230 |         rc = glob(portal, GLOB_ONLYDIR, NULL, &globbuf);
      |                           ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/14fc1c139f055b5b1eaa6e04e327863c06176a7b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-usr-idbm.c-fix-musl-build.patch           | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/open-iscsi/0001-usr-idbm.c-fix-musl-build.patch b/package/open-iscsi/0001-usr-idbm.c-fix-musl-build.patch
new file mode 100644
index 0000000000..5470f30570
--- /dev/null
+++ b/package/open-iscsi/0001-usr-idbm.c-fix-musl-build.patch
@@ -0,0 +1,40 @@
+From dbe342545b7bee42107e09d0da59bb42c50903cb Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 30 Sep 2023 14:54:15 +0200
+Subject: [PATCH] usr/idbm.c: fix musl build
+
+Fix the following musl build failure raised since version 2.1.9 and
+https://github.com/open-iscsi/open-iscsi/commit/7b571d76d6937a78c141630fc38c3c57c532466c:
+
+../usr/idbm.c: In function 'idbm_rec_write_old':
+../usr/idbm.c:2230:27: error: 'GLOB_ONLYDIR' undeclared (first use in this function)
+ 2230 |         rc = glob(portal, GLOB_ONLYDIR, NULL, &globbuf);
+      |                           ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/14fc1c139f055b5b1eaa6e04e327863c06176a7b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/open-iscsi/open-iscsi/commit/11bdc17938ba648c81a853355a6bbddad69a9fc7
+---
+ usr/idbm.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/usr/idbm.c b/usr/idbm.c
+index ca4a4ec..fbaa132 100644
+--- a/usr/idbm.c
++++ b/usr/idbm.c
+@@ -45,6 +45,10 @@
+ #include "fw_context.h"
+ #include "iscsi_err.h"
+ 
++#ifndef GLOB_ONLYDIR
++#define GLOB_ONLYDIR	0x100
++#endif
++
+ #define IDBM_HIDE	0    /* Hide parameter when print. */
+ #define IDBM_SHOW	1    /* Show parameter when print. */
+ #define IDBM_MASKED	2    /* Show "stars" instead of real value when print */
+-- 
+2.40.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
