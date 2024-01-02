Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C662AC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 14:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52DCB408BF;
	Tue,  2 Jan 2024 14:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52DCB408BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ys8rpIWNka32; Tue,  2 Jan 2024 14:05:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A884408C3;
	Tue,  2 Jan 2024 14:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A884408C3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C5681BF842
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 14:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 355CC81751
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 14:05:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 355CC81751
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GfTruQhyODvc for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 14:05:32 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE95081656
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 14:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE95081656
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d5aefcc2fso54860385e9.0
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 06:05:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704204329; x=1704809129;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JmdHSqyfrU5+SpPHEWF6yPb12/BOEpIebVD550DHG18=;
 b=A0LfKuePbpjKoE0/4qN6icOIB0NBjRFkJ2BEPKrtXd0NB785z1iX4Eta2YEz+0Fugp
 iTPs6LE2pPcxtFogY6jvFJD0WQwtlPSrni83R0RqVypa1aekUXmkL7LfpGgpV5gy8zPU
 S8O2p05N7AY7r65EaLxHc+eeh0NANn+8lkIne10TDJ+nootq1VhzOMMoP6sE2uOQE4n+
 R+Ain4HWq8sN9LhzJ1wpdyXvHwg/UiJ7kjqoESaxsNlNd12/oUZHtYfyeiPcHjnOZjc4
 gNb/pzuH6TJv7hmdNaHw4rPMt+ZRb5KAj68kq8n5F2orutRfgPYAm2RDdfYj0mM9sRIT
 tlZw==
X-Gm-Message-State: AOJu0YxOALslS2V9+2TIKM4z2+wA541W5aBoHWj0a2pihN1FxATv5Faj
 T2Q6bsXmbKzOXXCdAhTprWDsMRkSoFM=
X-Google-Smtp-Source: AGHT+IEHd6bOvVKlbNziiwfcmvECq7vqJ6MUv0z439r/9D+GM4tUCfkDIc6Z73SRBoRmKnWmvjGlGg==
X-Received: by 2002:a05:600c:4e92:b0:40d:53c4:9eec with SMTP id
 f18-20020a05600c4e9200b0040d53c49eecmr7024881wmq.73.1704204329388; 
 Tue, 02 Jan 2024 06:05:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 q11-20020adff94b000000b003371868feecsm11825617wrr.63.2024.01.02.06.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 06:05:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 15:05:26 +0100
Message-ID: <20240102140526.1303849-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704204329; x=1704809129; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JmdHSqyfrU5+SpPHEWF6yPb12/BOEpIebVD550DHG18=;
 b=RnL2gmhW4ST3WhRB+oXt+MnjoQaFhoPmvQXMEgdrMS62ts+Yhn4M5kCNih8F7eeRAd
 IU1pp8d7JrgrEL8QWuEqJ+392sxF/UFrizrX3ihDJ2vWxDs8zxuTBpLHKi6isei43K4e
 pTce9fZZSe/PkvGJ8uVKyq7OVaqQNHarI8HGWTa50xj499OIGzdgfiuOLkHxIgHd8ddI
 Vj5h6mjrxBBpjIFCQ/8kpyofDFXbd4pJzdj6NRTAGe/i06HwR2/8xcAZoNJ5J7SgDnKl
 /3S8A8T7+lenihM2JeRavLWmh7Q/uzfGhHYaVQ4HT4xRuk3qbhN6hK2gDU+QpmW+XvbD
 ajsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RnL2gmhW
Subject: [Buildroot] [PATCH 1/1] package/gli: bump to latest commit
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch (already in version)
- Update hash of manual.md (update in year:
  https://github.com/g-truc/gli/commit/53106f0b8a3adc4fc6417024c1c90de69753361f)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 .../gli/0001-Optional-building-tests.patch    | 45 -------------------
 package/gli/gli.hash                          |  4 +-
 package/gli/gli.mk                            |  2 +-
 4 files changed, 3 insertions(+), 49 deletions(-)
 delete mode 100644 package/gli/0001-Optional-building-tests.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index b77bbc154f..b93ff3c0db 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -487,7 +487,6 @@ package/gerbera/S99gerbera Indent
 package/giblib/0001-fix-imlib2-detection.patch Upstream
 package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch Upstream
 package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch Upstream
-package/gli/0001-Optional-building-tests.patch Upstream
 package/glog/0001-added-emscripten-support.patch Upstream
 package/glorytun/0001-Add-support-for-Apple-silicon.patch Upstream
 package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch Upstream
diff --git a/package/gli/0001-Optional-building-tests.patch b/package/gli/0001-Optional-building-tests.patch
deleted file mode 100644
index c085e5060b..0000000000
--- a/package/gli/0001-Optional-building-tests.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 629fc81ce73114a5925484937df796467adbe8c7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jo=C3=A3o=20Pereira?= <pereira.john94@gmail.com>
-Date: Fri, 22 Mar 2019 22:58:17 +0000
-Subject: [PATCH] Optional building tests
-
-[Retrieved from:
-https://github.com/g-truc/gli/commit/629fc81ce73114a5925484937df796467adbe8c7]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt      | 1 +
- test/CMakeLists.txt | 8 +++++---
- 2 files changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6eb1a68b..bcff7ef0 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -13,6 +13,7 @@ include(GNUInstallDirs)
- include(CMakePackageConfigHelpers)
- 
- enable_testing()
-+option(GLI_TEST_ENABLE "Build unit tests" ON)
- 
- add_definitions(-D_CRT_SECURE_NO_WARNINGS)
- add_definitions(-DSOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}")
-diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
-index 6b1d4826..e51a3181 100644
---- a/test/CMakeLists.txt
-+++ b/test/CMakeLists.txt
-@@ -19,10 +19,12 @@ function(glmCreateTestGTC NAME)
- 	set(SAMPLE_NAME test-${NAME})
- 	add_executable(${SAMPLE_NAME} ${NAME}.cpp)
- 	target_link_libraries(${SAMPLE_NAME} gli)
--	add_test( 
-+	add_test(
- 		NAME ${SAMPLE_NAME}
- 		COMMAND $<TARGET_FILE:${SAMPLE_NAME}> )
- endfunction()
- 
--add_subdirectory(bug)
--add_subdirectory(core)
-+if(GLI_TEST_ENABLE)
-+	add_subdirectory(bug)
-+	add_subdirectory(core)
-+endif()
diff --git a/package/gli/gli.hash b/package/gli/gli.hash
index deef901af9..b6f9317f94 100644
--- a/package/gli/gli.hash
+++ b/package/gli/gli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9374f3cf6441dac0154f7e5ae9ad9ae99f4c4a36f8eb6de23f54a1996b9f2769  gli-559cbe1ec38878e182507d331e0780fbae5baf15.tar.gz
-sha256  e26459f62353e631d18379668c82b85f9fd2fd993f2818277e4fce21e957f87a  manual.md
+sha256  2f4f67ac4d1673216f03ff37e406bb403689b39a2df3d2efad501448705bbb3f  gli-779b99ac6656e4d30c3b24e96e0136a59649a869.tar.gz
+sha256  474c5f04064507cf5ac991fc3d4b990e5e34b15705d38d2062f8844c102113cf  manual.md
diff --git a/package/gli/gli.mk b/package/gli/gli.mk
index 9b9990910a..a789209452 100644
--- a/package/gli/gli.mk
+++ b/package/gli/gli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLI_VERSION = 559cbe1ec38878e182507d331e0780fbae5baf15
+GLI_VERSION = 779b99ac6656e4d30c3b24e96e0136a59649a869
 GLI_SITE = $(call github,g-truc,gli,$(GLI_VERSION))
 GLI_LICENSE = MIT
 GLI_LICENSE_FILES = manual.md
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
