Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC937C77B6C
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 21:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7583341B5E;
	Wed,  5 Apr 2023 21:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7583341B5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dIH_MfQ5Or8L; Wed,  5 Apr 2023 21:16:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00484415E4;
	Wed,  5 Apr 2023 21:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00484415E4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E4F581C2BE2
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 21:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC9446142A
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 21:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC9446142A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0pEJjjRh1AFx for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 21:16:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5AB161429
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 21:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5AB161429
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C42978396B; Wed,  5 Apr 2023 21:16:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 5 Apr 2023 23:11:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0e1ef258b56f4e2dfddc6744dff24a7a5840b64
X-Git-Newrev: cbf89eb4e44fa3bd6bfdfe5284cbc8f2b39f34b7
X-Patchwork-Hint: ignore
Message-Id: <20230405211610.C42978396B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfuse3: bump to version 3.14.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cbf89eb4e44fa3bd6bfdfe5284cbc8f2b39f34b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add local patch pending upstream[0] to fix build failure with uclibc.

[0]: https://github.com/libfuse/libfuse/pull/753

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-Fix-MS_LAZYTIME-not-defined-on-uclibc.patch | 48 ++++++++++++++++++++++
 package/libfuse3/libfuse3.hash                     |  2 +-
 package/libfuse3/libfuse3.mk                       |  2 +-
 3 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/package/libfuse3/0001-Fix-MS_LAZYTIME-not-defined-on-uclibc.patch b/package/libfuse3/0001-Fix-MS_LAZYTIME-not-defined-on-uclibc.patch
new file mode 100644
index 0000000000..58f9747d77
--- /dev/null
+++ b/package/libfuse3/0001-Fix-MS_LAZYTIME-not-defined-on-uclibc.patch
@@ -0,0 +1,48 @@
+From 56038446952516da5d4cf09e1192824031082943 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 27 Mar 2023 21:08:57 +0200
+Subject: [PATCH] Fix MS_LAZYTIME not defined on uclibc
+
+[Upstream status: https://github.com/libfuse/libfuse/pull/753]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ lib/mount.c       | 5 +++++
+ util/fusermount.c | 6 ++++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/lib/mount.c b/lib/mount.c
+index 1f1ee86..84e5c73 100644
+--- a/lib/mount.c
++++ b/lib/mount.c
+@@ -27,6 +27,11 @@
+ #include <sys/wait.h>
+ #include <sys/mount.h>
+ 
++/* uclibc doesn't define MS_LAZYTIME */
++#ifndef MS_LAZYTIME
++#define MS_LAZYTIME	(1<<25)
++#endif
++
+ #ifdef __NetBSD__
+ #include <perfuse.h>
+ 
+diff --git a/util/fusermount.c b/util/fusermount.c
+index 6e72f0d..82cc420 100644
+--- a/util/fusermount.c
++++ b/util/fusermount.c
+@@ -25,6 +25,12 @@
+ #include <sys/wait.h>
+ #include <sys/stat.h>
+ #include <sys/mount.h>
++
++/* uclibc doesn't define MS_LAZYTIME */
++#ifndef MS_LAZYTIME
++#define MS_LAZYTIME	(1<<25)
++#endif
++
+ #include <sys/fsuid.h>
+ #include <sys/socket.h>
+ #include <sys/utsname.h>
+-- 
+2.34.1
+
diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 2d78153c81..df4df524d0 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  b14f7d97abc11a5a70a37955021a7a1d8eb1d3dd5b6abec66af093eae3168c62  libfuse3-3.14.0.tar.gz
+sha256  99688d68a753ee97eed51d536b216b8ae5d7fe0236c1a45d439357903bfd4d88  libfuse3-3.14.1.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 8c306ba187..61523820ad 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.14.0
+LIBFUSE3_VERSION = 3.14.1
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
