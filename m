Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FD5EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 06:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AD9D819BC;
	Sun, 30 Jul 2023 06:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AD9D819BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QfXUpG1LEZ5C; Sun, 30 Jul 2023 06:56:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ECC2817EB;
	Sun, 30 Jul 2023 06:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ECC2817EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F25481BF3A4
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 06:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4F7460AB0
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 06:56:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4F7460AB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GTUn-yeYC1Gj for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 06:56:43 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C030C60AAE
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 06:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C030C60AAE
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 74B38A4C00BA;
 Sun, 30 Jul 2023 08:56:37 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35392)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQ0M1-0001YY-0j;
 Sun, 30 Jul 2023 08:56:37 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 08:56:37 +0200
Message-Id: <20230730065637.692838-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690700197;
 bh=h0ds07SYcyVsoS+TA5lYZGU5/Wfe4EeT2UzjIo7ZrC4=;
 h=From:To:Cc:Subject:Date:From;
 b=iF0KJnA2KfHraRcSihJatAwufOl1UnTV8dZNBChG0PwGG9IwWD7bP6imSyBszuXA0
 ejGJ7gZGtyWOtNdPHSLLWwW328ATcDMLnYvJIInJYRZshGACVPZoVPopQbtGOQ8PFe
 6K6QN3H78trTPSyfwZ8KTf4hw2UNRRwei3UHfAgqI+TK8jbT/EBVUM38/PKyMAIixM
 aGmeXVuWKejuH9hpqX4tL0q4f2/JEUnN9Sh2gr2T6SkhN4ibS4CEkD2kbyk6z8mmu8
 sBR6b2woJO3pdVSpRiQC0tc3OlbajeNvXHQ8EO8g2b/L8Pxg20iAaY50qS2G+wHHpc
 1YUXai5achjrg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=iF0KJnA2
Subject: [Buildroot] [PATCH 1/1] package/mbpoll: fix build without c++
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
Cc: Jon Ringle <jringle@gridpoint.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...dd-LANGUAGES-option-to-project-varia.patch | 30 +++++++++++++++++++
 package/mbpoll/mbpoll.mk                      |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 package/mbpoll/0001-CMakeLists.txt-Add-LANGUAGES-option-to-project-varia.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
