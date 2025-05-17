Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E4BC3ABDA
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 14:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D40140B78;
	Sat, 17 May 2025 14:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FameS8LWW9_k; Sat, 17 May 2025 14:30:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 657A040B69
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 657A040B69;
	Sat, 17 May 2025 14:30:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 329C9D89
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F180607E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBkdowm7uxUE for <buildroot@buildroot.org>;
 Sat, 17 May 2025 14:30:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E9B760BA8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E9B760BA8
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:30:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4421786F96; Sat, 17 May 2025 14:30:03 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 16:27:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 981e3686fce17e0d3ba09548d28fa88763a171e8
X-Git-Newrev: 0d4ca3c5fec73738cd0490dae28b8381bb20b2a1
X-Patchwork-Hint: ignore
Message-Id: <20250517143003.4421786F96@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cdrkit: add patch to fix CMake 4.0
 build issue
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0d4ca3c5fec73738cd0490dae28b8381bb20b2a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CMake 4.0 requires to have a cmake_minimum_required() in
CMakeLists.txt, which cdrkit doesn't have, so ths commit adds a patch
adding the missing statement. We have chosen version 3.18 because that
the oldest version that we expect is 3.18. From
package/cmake/Config.in.host:

  # The minimum system cmake version we expect if 3.18 as provided by
  # Debian bullseye, that we use in our reference build docker image.

The patch cannot be upstreamed, as cdrkit basically no longer has any
upstream.

Fixes:

  https://autobuild.buildroot.org/results/3412e47836b54928a55c12b46549d6307ab623e7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...CMakeLists.txt-add-cmake_minimum_required.patch | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/package/cdrkit/0005-CMakeLists.txt-add-cmake_minimum_required.patch b/package/cdrkit/0005-CMakeLists.txt-add-cmake_minimum_required.patch
new file mode 100644
index 0000000000..bbb652ae32
--- /dev/null
+++ b/package/cdrkit/0005-CMakeLists.txt-add-cmake_minimum_required.patch
@@ -0,0 +1,25 @@
+From 055130476b2ae349ab00b5cc5958d02da2fc2983 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Fri, 16 May 2025 16:12:03 +0200
+Subject: [PATCH] CMakeLists.txt: add cmake_minimum_required()
+
+Using cmake_minimum_required() is now mandatory with CMake 4.0.
+
+Upstream: N/A, no clear upstream
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 57edba6..70c6993 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,3 +1,4 @@
++cmake_minimum_required(VERSION 3.18)
+ PROJECT (cdrkit C)
+ SUBDIRS(include genisoimage wodim libedc libhfs_iso libparanoia icedax libusal librols libunls readom netscsid 3rd-party/dirsplit)
+ 
+-- 
+2.49.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
