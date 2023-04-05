Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA09C76188
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA5A18200C;
	Wed,  5 Apr 2023 20:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA5A18200C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qGGJ2AjyhZrN; Wed,  5 Apr 2023 20:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF65D81FC4;
	Wed,  5 Apr 2023 20:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF65D81FC4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1DD01BF364
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AC3D40912
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AC3D40912
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-XZcL9tbTnC for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:14:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A514840132
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.78.210])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A514840132
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:14:32 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxd-546bf4d7d6-hd7dr
 (smtpc-mxd-546bf4d7d6-hd7dr [2a02:598:128:8a00::1000:a65])
 id 4eef9e3cf8cf21674ee8204b; Wed, 05 Apr 2023 22:14:22 +0200 (CEST)
Received: from x230.suse.cz (mail.ms-free.net [185.147.46.46])
 by smtpd-relay-54787d77c7-7gh85 (smtpd/2.0.9) with ESMTPA
 id d1a905db-d681-4934-b37f-409e2eb00d08;
 Wed, 05 Apr 2023 22:14:14 +0200
From: Petr Vorel <pevik@seznam.cz>
To: buildroot@buildroot.org
Date: Wed,  5 Apr 2023 22:14:03 +0200
Message-Id: <20230405201403.1410075-2-pevik@seznam.cz>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405201403.1410075-1-pevik@seznam.cz>
References: <20230405201403.1410075-1-pevik@seznam.cz>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=seznam.cz; s=szn20221014; t=1680725662;
 bh=AaW6VdITz1DHAX3/1L1zZxqdsUYVlADL7HTL024dKnk=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding;
 b=Tr25JV0FqJwVEmAntLTEW1rMQRETEQI1t0GjJpt6vagPegEp4vB/OJGXe7SlDQ+Bk
 RbwsVnovZOM2b3tbndboaFxWLQMmybreJ+vPeesRPUc3hKNeuo43yeuv3KTnV+fPKk
 INlOob15Ms1SnO1Bo723Pkl1/x+MNeqoLoslFJbzEVqsZ39LD6MudKKgwzCjQL/RlN
 P9TqOw81HsT4DLv3pP22OBH3gMsB8Xf64JyQkC8P+ofMB1yWh0s0ArTZ+n+UEMqXgK
 B7PDUG2CMAvx+fVpaMllHIt4923KvxQV72RI6ScihV5ll39Dv2BzB7NV4319mgZm27
 m0TVn6+vPDsDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz
 header.a=rsa-sha256 header.s=szn20221014 header.b=Tr25JV0F
Subject: [Buildroot] [PATCH 2/2] package/ltp-testsuite: Backport fix for
 buildroot toolchain
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Petr Vorel <petr.vorel@gmail.com>

Fixes:
 - http://autobuild.buildroot.org/results/4dbb72e1bf081afd3cd944571b9beeefc7608865

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
New in v2.

 ...onfigure.ac-fix-mount_attr-detection.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/ltp-testsuite/0001-configure.ac-fix-mount_attr-detection.patch

diff --git a/package/ltp-testsuite/0001-configure.ac-fix-mount_attr-detection.patch b/package/ltp-testsuite/0001-configure.ac-fix-mount_attr-detection.patch
new file mode 100644
index 0000000000..61ba389e51
--- /dev/null
+++ b/package/ltp-testsuite/0001-configure.ac-fix-mount_attr-detection.patch
@@ -0,0 +1,56 @@
+From 30353a1eb3ee8940f38d6a0e8f5f39352fd8a179 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 26 Feb 2023 20:25:54 +0100
+Subject: [PATCH 1/1] configure.ac: fix mount_attr detection
+
+Commit b857f8723f30a4b9554bf6b0ff8fa52fd07e8b60 tried to fix build with
+latest glibc which provides mount_attr in sys/mount.h. Unfortunately,
+the following build failure is still raised because sys/mount is now
+unconditionally included in include/lapi/fsmount.h:
+
+In file included from fsconfig01.c:9:
+../../../../include/lapi/fsmount.h:55:8: error: redefinition of 'struct mount_attr'
+   55 | struct mount_attr {
+      |        ^~~~~~~~~~
+In file included from ../../../../include/lapi/fsmount.h:14:
+/home/autobuild/autobuild/instance-4/output-1/host/armeb-buildroot-linux-gnueabi/sysroot/usr/include/sys/mount.h:210:8: note: originally defined here
+  210 | struct mount_attr
+      |        ^~~~~~~~~~
+
+Fixes: b857f8723 ("lapi/fsmount: resolve conflict in different header files")
+Fixes: http://autobuild.buildroot.org/results/4dbb72e1bf081afd3cd944571b9beeefc7608865
+Link: https://lore.kernel.org/ltp/20230226192554.669332-1-fontaine.fabrice@gmail.com/
+Reviewed-by: Li Wang <liwang@redhat.com>
+[ pvorel: fix from b857f8723 is needed for glibc before glibc-2.37~426,
+i.e. without fix 774058d729 ("linux: Fix sys/mount.h usage with kernel headers")
+(which was backported to 2.35 and 2.34 maintenance). ]
+Reviewed-by: Petr Vorel <pvorel@suse.cz>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+[ upstream status: 30353a1eb ("configure.ac: fix mount_attr detection") ]
+
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 114468ae3..4c8763376 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -224,10 +224,10 @@ AC_CHECK_TYPES([struct __kernel_old_timeval, struct __kernel_old_timespec, struc
+ 
+ AC_CHECK_TYPES([struct futex_waitv],,,[#include <linux/futex.h>])
+ AC_CHECK_TYPES([struct mount_attr],,,[
+-#ifdef HAVE_LINUX_MOUNT_H
+-# include <linux/mount.h>
+-#else
++#ifdef HAVE_MOUNT_SETATTR
+ # include <sys/mount.h>
++#elif HAVE_LINUX_MOUNT_H
++# include <linux/mount.h>
+ #endif
+ ])
+ 
+-- 
+2.40.0
+
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
