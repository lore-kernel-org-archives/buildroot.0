Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22060C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A77F04036F;
	Sun, 14 Aug 2022 10:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A77F04036F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FIaaMNMCjPrR; Sun, 14 Aug 2022 10:17:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B89C3402E7;
	Sun, 14 Aug 2022 10:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B89C3402E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DE481BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19CC160AF1
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19CC160AF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xja0ffVR1qzj for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:17:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53844608B7
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53844608B7
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8508B87477; Sun, 14 Aug 2022 10:03:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 12:17:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6188d80b9fa31700f8656e3997134cbd880b606
X-Git-Newrev: 848404ed7b2f1c4048c83c231ae34efbd66face2
X-Patchwork-Hint: ignore
Message-Id: <20220814100324.8508B87477@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: fix build with
 libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=848404ed7b2f1c4048c83c231ae34efbd66face2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libexecinfo raised since bump to
version 22.4.3 in commit dd1c8879c503a093b807ea8ab04c31f685e7b340:

/home/giuliobenetti/autobuild/run/instance-2/output-1/build/intel-mediadriver-22.5.1/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp:2481: undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/3316e39c5113bb7600374eda45497a87c9ac9873
 - http://autobuild.buildroot.org/results/1074e832dd2f67e6fea8ff1fc7e226245a4d51bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-Fix-build-with-libexecinfo.patch          | 43 ++++++++++++++++++++++
 package/intel-mediadriver/intel-mediadriver.mk     |  4 ++
 2 files changed, 47 insertions(+)

diff --git a/package/intel-mediadriver/0002-Fix-build-with-libexecinfo.patch b/package/intel-mediadriver/0002-Fix-build-with-libexecinfo.patch
new file mode 100644
index 0000000000..3a6705f2b8
--- /dev/null
+++ b/package/intel-mediadriver/0002-Fix-build-with-libexecinfo.patch
@@ -0,0 +1,43 @@
+From c5177d6fc64ad8bc25c8fbbe324e52744ef52e18 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 12 Aug 2022 09:50:33 +0200
+Subject: [PATCH] Fix build with libexecinfo
+
+Fix the following build failure with musl or uclibc-ng and libexecinfo:
+
+/home/giuliobenetti/autobuild/run/instance-2/output-1/build/intel-mediadriver-22.5.1/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp:2481: undefined reference to `backtrace'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/3316e39c5113bb7600374eda45497a87c9ac9873
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/intel/media-driver/pull/1470]
+---
+ media_driver/media_top_cmake.cmake | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/media_driver/media_top_cmake.cmake b/media_driver/media_top_cmake.cmake
+index 0e19a47c9..936d8c35a 100755
+--- a/media_driver/media_top_cmake.cmake
++++ b/media_driver/media_top_cmake.cmake
+@@ -271,10 +271,16 @@ set_target_properties(${LIB_NAME} PROPERTIES LINK_FLAGS ${MEDIA_LINK_FLAGS})
+ set_target_properties(${LIB_NAME}        PROPERTIES PREFIX "")
+ set_target_properties(${LIB_NAME_STATIC} PROPERTIES PREFIX "")
+ 
++set(MEDIA_LINK_EXTERNAL_LIBS "${PKG_PCIACCESS_LIBRARIES} m pthread dl")
++find_package(Backtrace)
++if(Backtrace_FOUND)
++    set(MEDIA_LINK_EXTERNAL_LIBS "${MEDIA_LINK_EXTERNAL_LIBS} ${Backtrace_LIBRARY}")
++endif()
++
+ bs_ufo_link_libraries_noBsymbolic(
+     ${LIB_NAME}
+     "${INCLUDED_LIBS}"
+-    "${PKG_PCIACCESS_LIBRARIES} m pthread dl"
++    "${MEDIA_LINK_EXTERNAL_LIBS}"
+ )
+ 
+ if (NOT DEFINED INCLUDED_LIBS OR "${INCLUDED_LIBS}" STREQUAL "")
+-- 
+2.35.1
+
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index f43e6d1b42..4669c71bf6 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -18,6 +18,10 @@ INTEL_MEDIADRIVER_DEPENDENCIES = \
 	libva \
 	mesa3d
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+INTEL_MEDIADRIVER_DEPENDENCIES += libexecinfo
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 INTEL_MEDIADRIVER_DEPENDENCIES += xlib_libX11
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
