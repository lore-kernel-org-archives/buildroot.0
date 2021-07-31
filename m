Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867B5C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 22:07:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D7C160EBC
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 22:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D7C160EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2721C60886;
	Sat, 31 Jul 2021 22:07:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U80mkmfV33Ou; Sat, 31 Jul 2021 22:07:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BB9A608B8;
	Sat, 31 Jul 2021 22:07:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B0921BF2C1
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 22:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28CBA40225
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 22:04:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NXRcibieRgr3 for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 22:04:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21A9940237
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 22:04:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 65E5083630; Sat, 31 Jul 2021 22:04:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 00:02:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f0baab0d51661038ffd102d933bee392fad9c55e
X-Git-Newrev: 2f57920841f6e9dc74416c2cc77e01e41265fc40
X-Patchwork-Hint: ignore
Message-Id: <20210731220453.65E5083630@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gli: disable tests
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=2f57920841f6e9dc74416c2cc77e01e41265fc40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable tests to avoid the following build failure with gcc 11:

/srv/storage/autobuild/run/instance-2/output-1/build/gli-559cbe1ec38878e182507d331e0780fbae5baf15/test/core/core_convert.cpp: In function 'bool convert_rgb32f_rgb9e5(const char*, const char*)':
/srv/storage/autobuild/run/instance-2/output-1/build/gli-559cbe1ec38878e182507d331e0780fbae5baf15/test/core/core_convert.cpp:36:45: error: ordered comparison of pointer with integer zero ('const char*' and 'int')
   36 |         if(std::strstr(FilenameDst, ".dds") > 0 || std::strstr(FilenameDst, ".ktx") > 0)
      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~

Fixes:
 - http://autobuild.buildroot.org/results/4f1dbb7cf2b071f3b92d00d13984068ef5f5b329

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gli/0001-Optional-building-tests.patch | 45 ++++++++++++++++++++++++++
 package/gli/gli.mk                             |  2 ++
 2 files changed, 47 insertions(+)

diff --git a/package/gli/0001-Optional-building-tests.patch b/package/gli/0001-Optional-building-tests.patch
new file mode 100644
index 0000000000..c085e5060b
--- /dev/null
+++ b/package/gli/0001-Optional-building-tests.patch
@@ -0,0 +1,45 @@
+From 629fc81ce73114a5925484937df796467adbe8c7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jo=C3=A3o=20Pereira?= <pereira.john94@gmail.com>
+Date: Fri, 22 Mar 2019 22:58:17 +0000
+Subject: [PATCH] Optional building tests
+
+[Retrieved from:
+https://github.com/g-truc/gli/commit/629fc81ce73114a5925484937df796467adbe8c7]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt      | 1 +
+ test/CMakeLists.txt | 8 +++++---
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6eb1a68b..bcff7ef0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -13,6 +13,7 @@ include(GNUInstallDirs)
+ include(CMakePackageConfigHelpers)
+ 
+ enable_testing()
++option(GLI_TEST_ENABLE "Build unit tests" ON)
+ 
+ add_definitions(-D_CRT_SECURE_NO_WARNINGS)
+ add_definitions(-DSOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}")
+diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
+index 6b1d4826..e51a3181 100644
+--- a/test/CMakeLists.txt
++++ b/test/CMakeLists.txt
+@@ -19,10 +19,12 @@ function(glmCreateTestGTC NAME)
+ 	set(SAMPLE_NAME test-${NAME})
+ 	add_executable(${SAMPLE_NAME} ${NAME}.cpp)
+ 	target_link_libraries(${SAMPLE_NAME} gli)
+-	add_test( 
++	add_test(
+ 		NAME ${SAMPLE_NAME}
+ 		COMMAND $<TARGET_FILE:${SAMPLE_NAME}> )
+ endfunction()
+ 
+-add_subdirectory(bug)
+-add_subdirectory(core)
++if(GLI_TEST_ENABLE)
++	add_subdirectory(bug)
++	add_subdirectory(core)
++endif()
diff --git a/package/gli/gli.mk b/package/gli/gli.mk
index 6a332d0e08..9b9990910a 100644
--- a/package/gli/gli.mk
+++ b/package/gli/gli.mk
@@ -14,4 +14,6 @@ GLI_LICENSE_FILES = manual.md
 GLI_INSTALL_STAGING = YES
 GLI_INSTALL_TARGET = NO
 
+GLI_CONF_OPTS = -DGLI_TEST_ENABLE=OFF
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
