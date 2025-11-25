Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44768D0EE18
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 20:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D3C640DC9;
	Tue, 25 Nov 2025 20:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fA-G_XV-FZwt; Tue, 25 Nov 2025 20:33:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB7B340C02
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB7B340C02;
	Tue, 25 Nov 2025 20:33:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C62F1A6
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02A7A40BD8
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5mjIxydboNs for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 20:33:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13CA740B99
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13CA740B99
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 20:33:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0260085E34; Tue, 25 Nov 2025 20:33:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Nov 2025 21:23:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 742d83eea90eb88fc2dbf2751f9ab3907434a56b
X-Git-Newrev: 9abe0ba95a72864cd06bca7a641fd03fde98f6ed
X-Patchwork-Hint: ignore
Message-Id: <20251125203341.0260085E34@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/woff2: fix cmake 4
 compatibility
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9abe0ba95a72864cd06bca7a641fd03fde98f6ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a patch fixing cmake 4 compatibility.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../woff2/0002-Fix-the-build-with-CMake-4.patch    | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/woff2/0002-Fix-the-build-with-CMake-4.patch b/package/woff2/0002-Fix-the-build-with-CMake-4.patch
new file mode 100644
index 0000000000..c516c67ef4
--- /dev/null
+++ b/package/woff2/0002-Fix-the-build-with-CMake-4.patch
@@ -0,0 +1,37 @@
+From ee31ca0647decc493e992eaa3dc5be9d9e1bc871 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Sat, 25 Oct 2025 22:19:21 +0300
+Subject: [PATCH] Fix the build with CMake 4
+
+Require CMake 3.5, which is the latest version that CMake 4 is
+backwards-compatible with. The CMake build system does not need
+any change otherwise.
+
+Fixes #183
+
+Upstream: https://github.com/google/woff2/pull/187
+Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
+---
+ CMakeLists.txt | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ecfbb83..6525747 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3,11 +3,7 @@
+ # Distributed under MIT license.
+ # See file LICENSE for detail or copy at https://opensource.org/licenses/MIT
+ 
+-# Ubuntu 12.04 LTS has CMake 2.8.7, and is an important target since
+-# several CI services, such as Travis and Drone, use it.  Solaris 11
+-# has 2.8.6, and it's not difficult to support if you already have to
+-# support 2.8.7.
+-cmake_minimum_required(VERSION 2.8.6)
++cmake_minimum_required(VERSION 3.5.0)
+ 
+ project(woff2)
+ 
+-- 
+2.51.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
