Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89132C77B61
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 20:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0728D418C8;
	Sun, 16 Apr 2023 20:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0728D418C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XMqzVvba41Mh; Sun, 16 Apr 2023 20:17:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE171418F1;
	Sun, 16 Apr 2023 20:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE171418F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55DD81BF35A
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 20:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3964040644
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 20:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3964040644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AU8tl4w4R2zg for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 20:17:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32D2540112
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.78.210])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32D2540112
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 20:17:34 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxd-6fdf5f5c8f-nc7j9
 (smtpc-mxd-6fdf5f5c8f-nc7j9 [2a02:598:64:8a00::1000:a2f])
 id 4994f4b3ffb44be849934ac4; Sun, 16 Apr 2023 22:17:24 +0200 (CEST)
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
 by smtpd-relay-778887b495-kcqsn (smtpd/2.0.9) with ESMTPA
 id 9559e261-2534-4c34-9336-e6a6a0281443;
 Sun, 16 Apr 2023 22:17:16 +0200
From: Petr Vorel <pevik@seznam.cz>
To: buildroot@buildroot.org
Date: Sun, 16 Apr 2023 22:17:05 +0200
Message-Id: <20230416201705.2294430-3-pevik@seznam.cz>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416201705.2294430-1-pevik@seznam.cz>
References: <20230416201705.2294430-1-pevik@seznam.cz>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=seznam.cz; s=szn20221014; t=1681676244;
 bh=wugcFgcsgC3tiqpYhtA7PHOdQ8cM+tQRM48f5lnOOQg=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding;
 b=SUrxC4sYjWMUixyZAx+s+lKS/5rfGkagP6kS/Oc6pZiHUiVbaIi4CiD2inxEcZCTS
 nTTbN1R/Wfu6/T7/6jlBgY9I6eMOV+FEtEeCg2h34OCUYWxYF+WgfeU52dKTWGpiVR
 qk34Awv/G6hst8St48UK7o7gAfa3TB1r5YXvk1Gni7APibxguQqu/PLt8Shyx69Lbu
 EU+HeVVTIBpTOwaWN04HTnfMm3TamLyT4eFY3p63wNe7A8ByFxJ6C2VoJz6P6Gq+Od
 rZ6JQhFffXOu66MF9/wtzg3w8W6W77ka9NY5oawauPsShM0QlEGjf1ivvAf3623TCp
 GNWDD3MEoE67A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz
 header.a=rsa-sha256 header.s=szn20221014 header.b=SUrxC4sY
Subject: [Buildroot] [PATCH v3 2/2] package/ltp-testsuite: bump version to
 20230127
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
 Anders Roxell <anders.roxell@linaro.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Petr Vorel <petr.vorel@gmail.com>

Backport fix for buildroot toolchain

Fixes:
 - http://autobuild.buildroot.org/results/4dbb72e1bf081afd3cd944571b9beeefc7608865

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
changes v2->v3
* backport was squashed to version update (Yann)

 ...onfigure.ac-fix-mount_attr-detection.patch | 54 +++++++++++++++++++
 package/ltp-testsuite/ltp-testsuite.hash      |  5 +-
 package/ltp-testsuite/ltp-testsuite.mk        |  2 +-
 3 files changed, 57 insertions(+), 4 deletions(-)
 create mode 100644 package/ltp-testsuite/0001-configure.ac-fix-mount_attr-detection.patch

diff --git a/package/ltp-testsuite/0001-configure.ac-fix-mount_attr-detection.patch b/package/ltp-testsuite/0001-configure.ac-fix-mount_attr-detection.patch
new file mode 100644
index 0000000000..740d3a6d6a
--- /dev/null
+++ b/package/ltp-testsuite/0001-configure.ac-fix-mount_attr-detection.patch
@@ -0,0 +1,54 @@
+From 30353a1eb3ee8940f38d6a0e8f5f39352fd8a179 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 26 Feb 2023 20:25:54 +0100
+Subject: [PATCH] configure.ac: fix mount_attr detection
+Upstream: https://github.com/linux-test-project/ltp/commit/30353a1eb3ee8940f38d6a0e8f5f39352fd8a179
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
+---
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
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 8b411a8ffe..59ba5d0045 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,5 +1,4 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20220527/ltp-full-20220527.tar.bz2.sha1
-sha1  c8d658cd3ab1f5a5c7b5bf56398d3a9525012c6b  ltp-full-20220930.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20230127/ltp-full-20230127.tar.xz.sha256
+sha256  254412a52c7238f35a247337da186f485e76fb64c6549ed849b3442fc7a417ef  ltp-full-20230127.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  533ab63915b916640667ecce17ee4998006d80d394d4b1f1d105a7aa1df50d38  ltp-full-20220930.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 34412d562f..78271b0730 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20220930
+LTP_TESTSUITE_VERSION = 20230127
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
