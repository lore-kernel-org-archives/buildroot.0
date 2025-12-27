Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEEAE8FDCC
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 14:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 125E2405FD;
	Sat, 27 Dec 2025 14:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8THn-4uA_uT; Sat, 27 Dec 2025 14:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37C5A405FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766847019;
	bh=XJCNpQKCfbNQYi0sKkNpeIVbZSR2sLwOWsUl76Cww4I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cEwTpkwxuxMjCGiUQH5LBl5hEcjXg/24XTjkHktwIDR2+gqBLgeAVP9BUBWEvRHgN
	 +v8hLmuJR+8CK+bElzGvL5h6G8ktEDoteGFeUc/Gzz7xffFYsRl9JDoiNeE4COFbrG
	 3Hx0G5wl3OSxeyyFz2bxrp67lxEx4aij5TTBlfVDmNKUomLytX9Rgh7cdWSWaVg8bq
	 +7OIsEVXgT+GMfbzLr+5mglmmokpgufH6aHZ0o06n+Z04L2TW2Y2HCsmlUr5uRT5V2
	 ATf6z0Z4XSzoa+mwY5XMwCpLOU2qv4hgu93+kaB3rWXJ1a3ZKN4iZGpX9TfI2EarK4
	 3wwV34vgXGyPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37C5A405FF;
	Sat, 27 Dec 2025 14:50:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CBC31D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDBA160768
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJJdZ-67yU3G for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 14:50:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE43060690
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE43060690
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:50:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABE068774D; Sat, 27 Dec 2025 14:50:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 15:37:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 29641d1675756dd82486cff4d5f71321bd89cad2
X-Git-Newrev: a63acfa0a37ef890023f637735f8b9fe2ba8a7aa
X-Patchwork-Hint: ignore
Message-Id: <20251227145016.ABE068774D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencv3: add patch to fix CMake 4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a63acfa0a37ef890023f637735f8b9fe2ba8a7aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a small patch to fix CMake 4 build issues. Unfortunately, while
cmake/OpenCVMinDepVersions.cmake provides a MIN_VER_CMAKE that we
could pass on the command line, cmake/OpenCVGenPkgconfig.cmake doesn't
use it, so we anyway have to patch the package.

Since opencv3 is basically unmaintained, there is no point sending
this patch upstream.

Fixes:

  https://autobuild.buildroot.net/results/cc857993920607958dd817c6a877ed9386c05738/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...set-minimum-required-CMake-version-to-3.5.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/opencv3/0001-cmake-set-minimum-required-CMake-version-to-3.5.patch b/package/opencv3/0001-cmake-set-minimum-required-CMake-version-to-3.5.patch
new file mode 100644
index 0000000000..46009de302
--- /dev/null
+++ b/package/opencv3/0001-cmake-set-minimum-required-CMake-version-to-3.5.patch
@@ -0,0 +1,41 @@
+From 3b7311f48ef70127ddad7c7ea9c008fa6af3a9a1 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 25 Dec 2025 23:11:27 +0100
+Subject: [PATCH] cmake: set minimum required CMake version to 3.5
+
+This fixes build with CMake 4.
+
+Upstream: N/A, opencv 3.x is no longer maintained
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ cmake/OpenCVGenPkgconfig.cmake   | 2 +-
+ cmake/OpenCVMinDepVersions.cmake | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/OpenCVGenPkgconfig.cmake b/cmake/OpenCVGenPkgconfig.cmake
+index 425c0faa3b..9642a4b983 100644
+--- a/cmake/OpenCVGenPkgconfig.cmake
++++ b/cmake/OpenCVGenPkgconfig.cmake
+@@ -110,7 +110,7 @@ endif()
+ # =============================================================================
+ else() # DEFINED CMAKE_HELPER_SCRIPT
+ 
+-cmake_minimum_required(VERSION 2.8.12.2)
++cmake_minimum_required(VERSION 3.5)
+ cmake_policy(SET CMP0012 NEW)
+ include("${CMAKE_HELPER_SCRIPT}")
+ include("${OpenCV_SOURCE_DIR}/cmake/OpenCVUtils.cmake")
+diff --git a/cmake/OpenCVMinDepVersions.cmake b/cmake/OpenCVMinDepVersions.cmake
+index e67856bb97..eb7a6d861e 100644
+--- a/cmake/OpenCVMinDepVersions.cmake
++++ b/cmake/OpenCVMinDepVersions.cmake
+@@ -1,5 +1,5 @@
+ if(NOT DEFINED MIN_VER_CMAKE)
+-  set(MIN_VER_CMAKE 2.8.12.2)
++  set(MIN_VER_CMAKE 3.5)
+ endif()
+ set(MIN_VER_CUDA 6.5)
+ set(MIN_VER_PYTHON2 2.7)
+-- 
+2.52.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
