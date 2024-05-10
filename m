Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9B9C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 21:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA266404A3;
	Fri, 10 May 2024 21:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w_yE3OBvJzBa; Fri, 10 May 2024 21:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E31942DCE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E31942DCE;
	Fri, 10 May 2024 21:35:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B438B1BF36A
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EE566162B
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 21:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqDL2t7nvKxA for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 21:34:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C66D961638
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C66D961638
 for <buildroot@buildroot.org>; Fri, 10 May 2024 21:34:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B994086F79; Fri, 10 May 2024 21:34:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 23:34:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c40af98382feda648ff54b8e733eb7307f86164
X-Git-Newrev: fd64c544d31fbfa282306007fb3c151dd864146f
X-Patchwork-Hint: ignore
Message-Id: <20240510213459.B994086F79@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zxing-cpp: drop opencv and qt
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd64c544d31fbfa282306007fb3c151dd864146f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

opencv and qt handling can be dropped since switch to an active fork in
commit 456a7398316655ad0b669635f580e4887c24a700 as they are only used
when examples are enabled resulting in the following warning:

CMake Warning:
  Manually-specified variables were not used by the project:

    BUILD_DOC
    BUILD_DOCS
    BUILD_EXAMPLE
    BUILD_TEST
    BUILD_TESTING
    BUILD_TESTS
    CMAKE_DISABLE_FIND_PACKAGE_OpenCV
    CMAKE_DISABLE_FIND_PACKAGE_Qt5

While at it, also drop BUILD_EXAMPLES which is already passed by
pkg-cmake.mk

Fixes: 456a7398316655ad0b669635f580e4887c24a700

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zxing-cpp/zxing-cpp.mk | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index b0cadf1b1f..86a1ef9680 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -14,23 +14,10 @@ ZXING_CPP_DEPENDENCIES = host-pkgconf stb
 ZXING_CPP_CONF_OPTS = \
 	-DBUILD_READERS=ON \
 	-DBUILD_WRITERS=ON \
-	-DBUILD_EXAMPLES=OFF \
 	-DBUILD_BLACKBOX_TESTS=OFF \
 	-DBUILD_UNIT_TESTS=OFF \
 	-DBUILD_DEPENDENCIES=LOCAL
 
-ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI)$(BR2_PACKAGE_OPENCV4_LIB_HIGHGUI),y)
-ifeq ($(BR2_PACKAGE_OPENCV3),y)
-ZXING_CPP_DEPENDENCIES += opencv3
-endif
-ifeq ($(BR2_PACKAGE_OPENCV4),y)
-ZXING_CPP_DEPENDENCIES += opencv4
-endif
-ZXING_CPP_CONF_OPTS += -DCMAKE_REQUIRE_FIND_PACKAGE_OpenCV=TRUE
-else
-ZXING_CPP_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_OpenCV=TRUE
-endif
-
 ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),yy)
 ZXING_CPP_DEPENDENCIES += python3 python-pybind
 ZXING_CPP_CONF_OPTS += \
@@ -41,17 +28,4 @@ else
 ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_QT5BASE),y)
-ZXING_CPP_DEPENDENCIES += qt5base
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5MULTIMEDIA),yy)
-ZXING_CPP_DEPENDENCIES += qt5declarative qt5multimedia
-endif
-# Only set qt5 as required when all optional qt5 dependencies are present
-ifeq ($(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5MULTIMEDIA),yyy)
-ZXING_CPP_CONF_OPTS += -DCMAKE_REQUIRE_FIND_PACKAGE_Qt5=TRUE
-endif
-else
-ZXING_CPP_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_Qt5=TRUE
-endif
-
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
