Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC61C001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9748B60ACA;
	Sun, 30 Jul 2023 10:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9748B60ACA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BLB1ztjNWloQ; Sun, 30 Jul 2023 10:12:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF20D60AD0;
	Sun, 30 Jul 2023 10:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF20D60AD0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BDC451BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2D664010D
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2D664010D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O5EekwxyV7yf for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:11:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00B4040138
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00B4040138
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB02283874; Sun, 30 Jul 2023 10:11:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:11:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90c89b29d32114f12dc8cafe095e233490286305
X-Git-Newrev: 5b8aa2a21e0d84e10b261844d9304f93ce49ce8c
X-Patchwork-Hint: ignore
Message-Id: <20230730101157.DB02283874@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbpoll: fix build without c++
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b8aa2a21e0d84e10b261844d9304f93ce49ce8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to enable build without c++.

Add configure option to fix subsequent configure error due to patched
source file during git version check:

CMake Error at cmake/GitVersion.cmake:118 (message):
  Unable to find current project version !
Call Stack (most recent call first):
  CMakeLists.txt:100 (GetGitVersion)

Fixes:
http://autobuild.buildroot.net/results/2f8/2f819871a89cb2a2df239b1f879c1babcdd022fc/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...txt-Add-LANGUAGES-option-to-project-varia.patch | 30 ++++++++++++++++++++++
 package/mbpoll/mbpoll.mk                           |  1 +
 2 files changed, 31 insertions(+)

diff --git a/package/mbpoll/0001-CMakeLists.txt-Add-LANGUAGES-option-to-project-varia.patch b/package/mbpoll/0001-CMakeLists.txt-Add-LANGUAGES-option-to-project-varia.patch
new file mode 100644
index 0000000000..8c9d1a5680
--- /dev/null
+++ b/package/mbpoll/0001-CMakeLists.txt-Add-LANGUAGES-option-to-project-varia.patch
@@ -0,0 +1,30 @@
+From 97a2c39fea591509ac1f8a31598b7555b63b8d55 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 30 Jul 2023 08:45:58 +0200
+Subject: [PATCH] CMakeLists.txt: Add LANGUAGES option to project variable
+
+Fixes build with toolchains without c++.
+
+Upstream: https://github.com/epsilonrt/mbpoll/pull/71
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6daa039..11dcd05 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3,7 +3,7 @@
+ cmake_minimum_required(VERSION 2.9)
+ 
+ # Workspace name
+-project(mbpoll)
++project(mbpoll LANGUAGES C)
+ 
+ # This setting is useful for providing JSON file used by CodeLite for code completion
+ set(CMAKE_EXPORT_COMPILE_COMMANDS 1)
+-- 
+2.39.2
+
diff --git a/package/mbpoll/mbpoll.mk b/package/mbpoll/mbpoll.mk
index 466d9a0ec1..4289264e0d 100644
--- a/package/mbpoll/mbpoll.mk
+++ b/package/mbpoll/mbpoll.mk
@@ -9,5 +9,6 @@ MBPOLL_SITE = $(call github,epsilonrt,mbpoll,v$(MBPOLL_VERSION))
 MBPOLL_DEPENDENCIES = host-pkgconf libmodbus
 MBPOLL_LICENSE = GPL-3.0+
 MBPOLL_LICENSE_FILES = COPYING
+MBPOLL_CONF_OPTS = -DGIT_EXECUTABLE=/bin/false
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
