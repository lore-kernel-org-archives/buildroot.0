Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C73CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 21:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E2B7848A9;
	Wed,  3 Jun 2026 21:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RU9Y0j2gXVPw; Wed,  3 Jun 2026 21:01:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FEE9848AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780520480;
	bh=IhNCSy4KMWDB4EWrSx9bZOllPBPeF2RINQ+rSdbXeTk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XeZGOfmniN314S8YZrG5tZGmiS10moQBq/lyDNorPDDYeA+ZfweTEJqTGvWgtyzFk
	 u7a9TwEOUoNYM4zPNsJ7+ygET4v1/Gaizxok/OXn/zGuWXdordgB1gk5nkmBBtf5Np
	 PIjMplH9IbFgAwUnw+VBeDO4oFogwwW9ziWamfJr1+mMGCIiUypovRM/nk1Bj+7Foz
	 anxiDSP/1vid++NK5AwCUB2qMSYTWnpbg6wDRQWT9BVsJqXExsQJoWFjz1h1bS0o1O
	 QpsxXpSnkL6S0qFJt0oupbuCWUsY3fmuqQ/8dp0jDsWVAiq1ijeNuqGxVHGT8IeWKC
	 /LkM1DSsyswDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FEE9848AA;
	Wed,  3 Jun 2026 21:01:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E30B192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90B7261B5D
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-aN5MQRHOsF for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 21:01:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E4EC461B55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4EC461B55
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4EC461B55
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:01:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d62.dip0.t-ipconnect.de [91.58.13.98])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1E64A4C3ABE
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 23:00:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32806)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wUshv-000000006PJ-0uqd
 for buildroot@buildroot.org; Wed, 03 Jun 2026 21:00:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Jun 2026 23:00:58 +0200
Message-ID: <20260603210059.71319-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780520459;
 bh=Fwu6JHj1dkjHyjpMjzUe7PYlxKx7WUyp9g6qR+QtW0Q=;
 h=From:To:Subject:Date:From;
 b=de5VW212zmsKRhCQK1Lku3Eb+MQWTvb1F4/BmBJjDzUgBS4+Z6PQnQ576Bz3UYE8H
 9LpACsNO2HwoXmJI65vcTeRdTA6yQObaQcWYiPTXlQpLG5hnoqsUouym/t02DfC0JT
 zlimzDFz+wDxacOHZKXxhL35ub3MnvVa9pM1h25yi72L3D2zui0dyf2ZJk7CJy3PFO
 kIVMdAnVoeWny5hQJSs4AWTNltjeDsSGD3uZkxGa8uK5xOXJ1W4VRxyJDfnHL5cYRX
 J6LeaAWYGjnpyx3CDeOfTE8q73Kh02pDBxwFui8h4YqhBHqgE5wGrE11j2VfsThILQ
 4h3t7pbgQDDzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=de5VW212
Subject: [Buildroot] [PATCH/next v2 1/2] package/kodi-screensaver-rsxs: fix
 build with cmake 4.x
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build error not caught by the autobuilders with this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_FORCE_HOST_BUILD=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_KODI_SCREENSAVER_RSXS=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y
BR2_PACKAGE_LIBUDEV_ZERO=y

Raised minimum version for all addons as requested by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: updated defconfig after commit of libudev-zero
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/0bf318ca986aec68c107a4c8c06fbf36c5a65940

 .../0001-Fix-build-with-CMake-4.x.patch       | 346 ++++++++++++++++++
 1 file changed, 346 insertions(+)
 create mode 100644 package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch

diff --git a/package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch b/package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch
new file mode 100644
index 0000000000..11c5f3c62d
--- /dev/null
+++ b/package/kodi-screensaver-rsxs/0001-Fix-build-with-CMake-4.x.patch
@@ -0,0 +1,346 @@
+From f6ad95576920944e64a368ae4074812efbcedc4b Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Wed, 11 Mar 2026 21:58:40 +0100
+Subject: [PATCH] Fix build with CMake 4.x
+
+Fixes build errors with CMake 4.x:
+
+CMake Error at lib/Implicit/CMakeLists.txt:1 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+CMake Error at lib/Rgbhsl/CMakeLists.txt:1 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+CMake Error at lib/rsMath/CMakeLists.txt:1 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+Raise minimum version for all addons.
+
+Upstream: https://github.com/xbmc/screensavers.rsxs/commit/0635422964b6797d693866483d16dff51bcf4b57
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt                    | 2 +-
+ depends/common/bz2/CMakeLists.txt | 2 +-
+ lib/Implicit/CMakeLists.txt       | 2 +-
+ lib/Rgbhsl/CMakeLists.txt         | 2 +-
+ lib/kodi/gui/gl/CMakeLists.txt    | 2 +-
+ lib/rsMath/CMakeLists.txt         | 2 +-
+ src/biof/CMakeLists.txt           | 2 +-
+ src/busyspheres/CMakeLists.txt    | 2 +-
+ src/colorfire/CMakeLists.txt      | 2 +-
+ src/cyclone/CMakeLists.txt        | 2 +-
+ src/drempels/CMakeLists.txt       | 2 +-
+ src/euphoria/CMakeLists.txt       | 2 +-
+ src/feedback/CMakeLists.txt       | 2 +-
+ src/fieldlines/CMakeLists.txt     | 2 +-
+ src/flocks/CMakeLists.txt         | 2 +-
+ src/flux/CMakeLists.txt           | 2 +-
+ src/helios/CMakeLists.txt         | 2 +-
+ src/hufosmoke/CMakeLists.txt      | 2 +-
+ src/hufotunnel/CMakeLists.txt     | 2 +-
+ src/hyperspace/CMakeLists.txt     | 2 +-
+ src/lattice/CMakeLists.txt        | 2 +-
+ src/lorenz/CMakeLists.txt         | 2 +-
+ src/matrixview/CMakeLists.txt     | 2 +-
+ src/microcosm/CMakeLists.txt      | 2 +-
+ src/plasma/CMakeLists.txt         | 2 +-
+ src/skyrocket/CMakeLists.txt      | 2 +-
+ src/solarwinds/CMakeLists.txt     | 2 +-
+ src/spirographx/CMakeLists.txt    | 2 +-
+ src/sundancer2/CMakeLists.txt     | 2 +-
+ 29 files changed, 29 insertions(+), 29 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e93c31bc..1a9ca89c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensavers.rsxs)
+ 
+ set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR})
+diff --git a/depends/common/bz2/CMakeLists.txt b/depends/common/bz2/CMakeLists.txt
+index 6b1a0a56..b83f34dd 100644
+--- a/depends/common/bz2/CMakeLists.txt
++++ b/depends/common/bz2/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(bzip2)
+ 
+ if(NOT WIN32)
+diff --git a/lib/Implicit/CMakeLists.txt b/lib/Implicit/CMakeLists.txt
+index eef20e3b..14fb63d7 100644
+--- a/lib/Implicit/CMakeLists.txt
++++ b/lib/Implicit/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5...4.0)
+ 
+ project(Implicit)
+ 
+diff --git a/lib/Rgbhsl/CMakeLists.txt b/lib/Rgbhsl/CMakeLists.txt
+index 984ce9ba..ca01c592 100644
+--- a/lib/Rgbhsl/CMakeLists.txt
++++ b/lib/Rgbhsl/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5...4.0)
+ 
+ project(Rgbhsl)
+ 
+diff --git a/lib/kodi/gui/gl/CMakeLists.txt b/lib/kodi/gui/gl/CMakeLists.txt
+index 6fc4d87b..1b096d79 100644
+--- a/lib/kodi/gui/gl/CMakeLists.txt
++++ b/lib/kodi/gui/gl/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ 
+ project(kodiOpenGL)
+ 
+diff --git a/lib/rsMath/CMakeLists.txt b/lib/rsMath/CMakeLists.txt
+index cc31d308..76100e89 100644
+--- a/lib/rsMath/CMakeLists.txt
++++ b/lib/rsMath/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5...4.0)
+ 
+ project(rsMath)
+ 
+diff --git a/src/biof/CMakeLists.txt b/src/biof/CMakeLists.txt
+index 810bec46..ec344ba8 100644
+--- a/src/biof/CMakeLists.txt
++++ b/src/biof/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.biof)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/busyspheres/CMakeLists.txt b/src/busyspheres/CMakeLists.txt
+index 41650ca6..cc829bd9 100644
+--- a/src/busyspheres/CMakeLists.txt
++++ b/src/busyspheres/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.busyspheres)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/colorfire/CMakeLists.txt b/src/colorfire/CMakeLists.txt
+index 3667cbd4..f8da4884 100644
+--- a/src/colorfire/CMakeLists.txt
++++ b/src/colorfire/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.colorfire)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/cyclone/CMakeLists.txt b/src/cyclone/CMakeLists.txt
+index 8af4172f..084f928b 100644
+--- a/src/cyclone/CMakeLists.txt
++++ b/src/cyclone/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.cyclone)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/drempels/CMakeLists.txt b/src/drempels/CMakeLists.txt
+index 1ebd427f..d4c38a95 100644
+--- a/src/drempels/CMakeLists.txt
++++ b/src/drempels/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.drempels)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/euphoria/CMakeLists.txt b/src/euphoria/CMakeLists.txt
+index d3f55ee3..de2e2f67 100644
+--- a/src/euphoria/CMakeLists.txt
++++ b/src/euphoria/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.euphoria)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/feedback/CMakeLists.txt b/src/feedback/CMakeLists.txt
+index b37c430a..fd417d61 100644
+--- a/src/feedback/CMakeLists.txt
++++ b/src/feedback/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.feedback)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/fieldlines/CMakeLists.txt b/src/fieldlines/CMakeLists.txt
+index de60dda8..b0dc30b6 100644
+--- a/src/fieldlines/CMakeLists.txt
++++ b/src/fieldlines/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.fieldlines)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/flocks/CMakeLists.txt b/src/flocks/CMakeLists.txt
+index c2b4a793..a15db4d8 100644
+--- a/src/flocks/CMakeLists.txt
++++ b/src/flocks/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.flocks)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/flux/CMakeLists.txt b/src/flux/CMakeLists.txt
+index a2de0b2a..6aeda787 100644
+--- a/src/flux/CMakeLists.txt
++++ b/src/flux/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.flux)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/helios/CMakeLists.txt b/src/helios/CMakeLists.txt
+index d64a6194..6feb0ac2 100644
+--- a/src/helios/CMakeLists.txt
++++ b/src/helios/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.helios)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/hufosmoke/CMakeLists.txt b/src/hufosmoke/CMakeLists.txt
+index 44d13231..b4fe79a5 100644
+--- a/src/hufosmoke/CMakeLists.txt
++++ b/src/hufosmoke/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.hufosmoke)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/hufotunnel/CMakeLists.txt b/src/hufotunnel/CMakeLists.txt
+index b18ce736..f8c67c85 100644
+--- a/src/hufotunnel/CMakeLists.txt
++++ b/src/hufotunnel/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.hufotunnel)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/hyperspace/CMakeLists.txt b/src/hyperspace/CMakeLists.txt
+index 6bd303e2..5733be37 100644
+--- a/src/hyperspace/CMakeLists.txt
++++ b/src/hyperspace/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.hyperspace)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/lattice/CMakeLists.txt b/src/lattice/CMakeLists.txt
+index ef884e4c..9f9455f4 100644
+--- a/src/lattice/CMakeLists.txt
++++ b/src/lattice/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.lattice)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/lorenz/CMakeLists.txt b/src/lorenz/CMakeLists.txt
+index ab3026f6..35f749d9 100644
+--- a/src/lorenz/CMakeLists.txt
++++ b/src/lorenz/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.lorenz)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/matrixview/CMakeLists.txt b/src/matrixview/CMakeLists.txt
+index d98a8f14..d5f77ec7 100644
+--- a/src/matrixview/CMakeLists.txt
++++ b/src/matrixview/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.matrixview)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/microcosm/CMakeLists.txt b/src/microcosm/CMakeLists.txt
+index d05b639d..65437c28 100644
+--- a/src/microcosm/CMakeLists.txt
++++ b/src/microcosm/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.microcosm)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/plasma/CMakeLists.txt b/src/plasma/CMakeLists.txt
+index e7fc7956..fd25963f 100644
+--- a/src/plasma/CMakeLists.txt
++++ b/src/plasma/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.plasma)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/skyrocket/CMakeLists.txt b/src/skyrocket/CMakeLists.txt
+index 8a89f28f..8e9e0500 100644
+--- a/src/skyrocket/CMakeLists.txt
++++ b/src/skyrocket/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.skyrocket)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/solarwinds/CMakeLists.txt b/src/solarwinds/CMakeLists.txt
+index f1ef41c7..2417edf0 100644
+--- a/src/solarwinds/CMakeLists.txt
++++ b/src/solarwinds/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.solarwinds)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/spirographx/CMakeLists.txt b/src/spirographx/CMakeLists.txt
+index 2ccb751d..41a245d4 100644
+--- a/src/spirographx/CMakeLists.txt
++++ b/src/spirographx/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.spirographx)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+diff --git a/src/sundancer2/CMakeLists.txt b/src/sundancer2/CMakeLists.txt
+index a0e47a6d..a3bfbbe9 100644
+--- a/src/sundancer2/CMakeLists.txt
++++ b/src/sundancer2/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.5)
++cmake_minimum_required(VERSION 3.5...4.0)
+ project(screensaver.rsxs.sundancer2)
+ 
+ message(STATUS "--------------------------------------------------------------------------------")
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
