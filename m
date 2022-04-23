Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C606C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BC8540A6D;
	Sat, 23 Apr 2022 15:14:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lvJIZR-KHHbv; Sat, 23 Apr 2022 15:14:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6CF6E40A5F;
	Sat, 23 Apr 2022 15:14:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11B171BF95D
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9946640734
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xqsydX46887Z for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:12:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6805409EE
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:12:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BE47B83FE2; Sat, 23 Apr 2022 15:02:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 17:00:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b790ff27d5461df4de22732611a1eb4beee68f91
X-Git-Newrev: 2097e1ba3904be8f7cd388fe1d16a099da83ef99
X-Patchwork-Hint: ignore
Message-Id: <20220423150245.BE47B83FE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] packages/libwebsockets: add patch that
 removes duplicate LwsCheckRequirements
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

commit: https://git.buildroot.net/buildroot/commit/?id=2097e1ba3904be8f7cd388fe1d16a099da83ef99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  CMake Error at /home/buildroot/autobuild/run/instance-2/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/lib/cmake/libwebsockets/libwebsockets-config.cmake:35 (include):
  include could not find load file:

      LwsCheckRequirements
  Call Stack (most recent call first):
    CMakeLists.txt:54 (find_package)

Signed-off-by: Bartosz Bilas <bartosz.bilas@hotmail.com>
Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...ake-remove-duplicate-LwsCheckRequirements.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/libwebsockets/0001-cmake-remove-duplicate-LwsCheckRequirements.patch b/package/libwebsockets/0001-cmake-remove-duplicate-LwsCheckRequirements.patch
new file mode 100644
index 0000000000..fc76a2b610
--- /dev/null
+++ b/package/libwebsockets/0001-cmake-remove-duplicate-LwsCheckRequirements.patch
@@ -0,0 +1,26 @@
+From 99a8b9c4422bed45c8b7412a1e121056f2a6132a Mon Sep 17 00:00:00 2001
+From: Andy Green <andy@warmcat.com>
+Date: Mon, 7 Feb 2022 14:48:55 +0000
+Subject: [PATCH] cmake: remove duplicate LwsCheckRequirements
+
+Signed-off-by: Andy Green <andy@warmcat.com>
+Signed-off-by: Bartosz Bilas <bartosz.bilas@hotmail.com>
+Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
+---
+ cmake/libwebsockets-config.cmake.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/cmake/libwebsockets-config.cmake.in b/cmake/libwebsockets-config.cmake.in
+index 6247b2cb..8ba97e6f 100644
+--- a/cmake/libwebsockets-config.cmake.in
++++ b/cmake/libwebsockets-config.cmake.in
+@@ -32,6 +32,5 @@ endforeach()
+ 
+ include(CheckIncludeFile)
+ include(CheckCSourceCompiles)
+-include(LwsCheckRequirements)
+ set(requirements 1)
+ 
+-- 
+2.35.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
