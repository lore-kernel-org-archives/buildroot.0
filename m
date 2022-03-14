Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08FDC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 12:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2C1D60EE2;
	Mon, 14 Mar 2022 12:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uosemyg77Hj4; Mon, 14 Mar 2022 12:21:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A260D60EB7;
	Mon, 14 Mar 2022 12:21:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41FEE1BF9AA
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 12:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2868860D4B
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 12:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GzK6xbaEG7D3 for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 12:20:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F024960EAF
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 12:20:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2DC4C83E3D; Mon, 14 Mar 2022 12:11:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 13:17:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70ad44ffd00786cf25145445afa374cbb295f722
X-Git-Newrev: 96ebed1eed6dcd55d8024cbc6fe8bec646d739c6
X-Patchwork-Hint: ignore
Message-Id: <20220314121153.2DC4C83E3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: fix musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=96ebed1eed6dcd55d8024cbc6fe8bec646d739c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following musl build failure raised since commit
6fc5c8e92c1d7997e48b207187d2d3c7ad42819:

In file included from src/shared/queue.c:15:
./src/shared/util.h:106:1: error: unknown type name 'ssize_t'; did you mean 'size_t'?
  106 | ssize_t util_getrandom(void *buf, size_t buflen, unsigned int flags);
      | ^~~~~~~
      | size_t

Fixes:
 - http://autobuild.buildroot.org/results/83eaeb3863040645409f5787fdbdde79385c5257

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...006-src-shared-util.h-include-sys-types.h.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/bluez5_utils/0006-src-shared-util.h-include-sys-types.h.patch b/package/bluez5_utils/0006-src-shared-util.h-include-sys-types.h.patch
new file mode 100644
index 0000000000..8a5bd64d43
--- /dev/null
+++ b/package/bluez5_utils/0006-src-shared-util.h-include-sys-types.h.patch
@@ -0,0 +1,39 @@
+From 1d21878d84f16e28e16c61b36799a62e22732d97 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 24 Feb 2022 18:19:33 +0100
+Subject: [PATCH] src/shared/util.h: include sys/types.h
+
+Include sys/types.h to avoid the following build failure on musl raised
+since commit fb57ad9b9d107856e5f1c8135da04ffa2f7a11ac:
+
+In file included from src/shared/queue.c:15:
+./src/shared/util.h:106:1: error: unknown type name 'ssize_t'; did you mean 'size_t'?
+  106 | ssize_t util_getrandom(void *buf, size_t buflen, unsigned int flags);
+      | ^~~~~~~
+      | size_t
+
+Fixes:
+ - http://autobuild.buildroot.org/results/83eaeb3863040645409f5787fdbdde79385c5257
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://patchwork.kernel.org/project/bluetooth/patch/20220224173104.479809-1-fontaine.fabrice@gmail.com]
+---
+ src/shared/util.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/shared/util.h b/src/shared/util.h
+index c01eccf8a..554481e1e 100644
+--- a/src/shared/util.h
++++ b/src/shared/util.h
+@@ -14,6 +14,7 @@
+ #include <alloca.h>
+ #include <byteswap.h>
+ #include <string.h>
++#include <sys/types.h>
+ 
+ #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
+ #define BIT(n)  (1 << (n))
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
